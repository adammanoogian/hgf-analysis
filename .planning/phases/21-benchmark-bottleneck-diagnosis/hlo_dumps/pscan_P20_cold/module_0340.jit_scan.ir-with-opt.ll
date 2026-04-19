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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !275
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !275
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !276
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
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
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !278
  %1 = icmp slt i64 %0, 10
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_25(ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_24(ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 0, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0xFFF0000000000000, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none)
define void @loop_slice_fusion_3(ptr noalias nocapture readonly align 16 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #3 {
entry:
  %arg3115 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2113 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0109 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %1 = icmp ult i32 %0, 2
  br i1 %1, label %concatenate.pivot.0., label %concatenate.pivot.2.105

concatenate.pivot.0.:                             ; preds = %entry
  %2 = load i64, ptr addrspace(1) %arg1111, align 128, !invariant.load !278
  %3 = icmp slt i64 %2, 0
  %4 = add i64 %2, 10
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 9)
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [10 x [2 x i32]], ptr addrspace(1) %arg0109, i64 0, i64 %9, i64 0
  %11 = load <2 x i32>, ptr addrspace(1) %10, align 8, !invariant.load !278
  %12 = extractelement <2 x i32> %11, i32 0
  %13 = extractelement <2 x i32> %11, i32 1
  %14 = add i32 %12, %0
  %15 = or disjoint i32 %0, 2
  %16 = add i32 %13, %15
  %17 = add i32 %14, %16
  %18 = tail call i32 @llvm.fshl.i32(i32 %16, i32 %16, i32 13)
  %19 = xor i32 %17, %18
  %20 = add i32 %19, %17
  %21 = tail call i32 @llvm.fshl.i32(i32 %19, i32 %19, i32 15)
  %22 = xor i32 %20, %21
  %23 = add i32 %22, %20
  %24 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 26)
  %25 = xor i32 %23, %24
  %26 = add i32 %25, %23
  %27 = add i32 %26, %13
  %28 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 6)
  %29 = xor i32 %26, %28
  %30 = xor i32 %12, %13
  %31 = xor i32 %30, 466688986
  %32 = add i32 %31, 1
  %33 = add i32 %32, %29
  %34 = add i32 %27, %33
  %35 = tail call i32 @llvm.fshl.i32(i32 %33, i32 %33, i32 17)
  %36 = xor i32 %34, %35
  %37 = add i32 %36, %34
  %38 = tail call i32 @llvm.fshl.i32(i32 %36, i32 %36, i32 29)
  %39 = xor i32 %37, %38
  %40 = add i32 %39, %37
  %41 = tail call i32 @llvm.fshl.i32(i32 %39, i32 %39, i32 16)
  %42 = xor i32 %40, %41
  %43 = add i32 %42, %40
  %44 = add i32 %43, %31
  %45 = tail call i32 @llvm.fshl.i32(i32 %42, i32 %42, i32 24)
  %46 = xor i32 %43, %45
  %47 = add i32 %12, 2
  %48 = add i32 %47, %46
  %49 = add i32 %44, %48
  %50 = tail call i32 @llvm.fshl.i32(i32 %48, i32 %48, i32 13)
  %51 = xor i32 %49, %50
  %52 = add i32 %51, %49
  %53 = tail call i32 @llvm.fshl.i32(i32 %51, i32 %51, i32 15)
  %54 = xor i32 %52, %53
  %55 = add i32 %54, %52
  %56 = tail call i32 @llvm.fshl.i32(i32 %54, i32 %54, i32 26)
  %57 = xor i32 %55, %56
  %58 = add i32 %57, %55
  %59 = add i32 %58, %12
  %60 = tail call i32 @llvm.fshl.i32(i32 %57, i32 %57, i32 6)
  %61 = xor i32 %58, %60
  %62 = add i32 %13, 3
  %63 = add i32 %62, %61
  %64 = add i32 %59, %63
  %65 = tail call i32 @llvm.fshl.i32(i32 %63, i32 %63, i32 17)
  %66 = xor i32 %64, %65
  %67 = add i32 %66, %64
  %68 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 29)
  %69 = xor i32 %67, %68
  %70 = add i32 %69, %67
  %71 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 16)
  %72 = xor i32 %70, %71
  %73 = add i32 %72, %70
  %74 = add i32 %73, %13
  %75 = tail call i32 @llvm.fshl.i32(i32 %72, i32 %72, i32 24)
  %76 = xor i32 %73, %75
  %77 = add i32 %31, 4
  %78 = add i32 %77, %76
  %79 = add i32 %74, %78
  %80 = tail call i32 @llvm.fshl.i32(i32 %78, i32 %78, i32 13)
  %81 = xor i32 %79, %80
  %82 = add i32 %81, %79
  %83 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 15)
  %84 = xor i32 %82, %83
  %85 = add i32 %84, %82
  %86 = tail call i32 @llvm.fshl.i32(i32 %84, i32 %84, i32 26)
  %87 = xor i32 %85, %86
  %88 = add i32 %85, %31
  %89 = add i32 %88, %87
  br label %concatenate.47.5.merge

concatenate.pivot.2.105:                          ; preds = %entry
  %90 = add nsw i32 %0, -2
  %91 = load i64, ptr addrspace(1) %arg1111, align 128, !invariant.load !278
  %92 = icmp slt i64 %91, 0
  %93 = add i64 %91, 10
  %94 = select i1 %92, i64 %93, i64 %91
  %95 = trunc i64 %94 to i32
  %96 = tail call i32 @llvm.smax.i32(i32 %95, i32 0)
  %97 = tail call i32 @llvm.umin.i32(i32 %96, i32 9)
  %98 = zext nneg i32 %97 to i64
  %99 = getelementptr inbounds [10 x [2 x i32]], ptr addrspace(1) %arg0109, i64 0, i64 %98, i64 0
  %100 = load <2 x i32>, ptr addrspace(1) %99, align 8, !invariant.load !278
  %101 = extractelement <2 x i32> %100, i32 0
  %102 = extractelement <2 x i32> %100, i32 1
  %103 = add i32 %90, %101
  %104 = add i32 %102, %0
  %105 = add i32 %103, %104
  %106 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %104, i32 13)
  %107 = xor i32 %105, %106
  %108 = add i32 %107, %105
  %109 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %107, i32 15)
  %110 = xor i32 %108, %109
  %111 = add i32 %110, %108
  %112 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %110, i32 26)
  %113 = xor i32 %111, %112
  %114 = add i32 %113, %111
  %115 = add i32 %114, %102
  %116 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %113, i32 6)
  %117 = xor i32 %114, %116
  %118 = xor i32 %101, %102
  %119 = xor i32 %118, 466688986
  %120 = add i32 %119, 1
  %121 = add i32 %120, %117
  %122 = add i32 %115, %121
  %123 = tail call i32 @llvm.fshl.i32(i32 %121, i32 %121, i32 17)
  %124 = xor i32 %122, %123
  %125 = add i32 %124, %122
  %126 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %124, i32 29)
  %127 = xor i32 %125, %126
  %128 = add i32 %127, %125
  %129 = tail call i32 @llvm.fshl.i32(i32 %127, i32 %127, i32 16)
  %130 = xor i32 %128, %129
  %131 = add i32 %130, %128
  %132 = add i32 %131, %119
  %133 = tail call i32 @llvm.fshl.i32(i32 %130, i32 %130, i32 24)
  %134 = xor i32 %131, %133
  %135 = add i32 %101, 2
  %136 = add i32 %135, %134
  %137 = add i32 %132, %136
  %138 = tail call i32 @llvm.fshl.i32(i32 %136, i32 %136, i32 13)
  %139 = xor i32 %137, %138
  %140 = add i32 %139, %137
  %141 = tail call i32 @llvm.fshl.i32(i32 %139, i32 %139, i32 15)
  %142 = xor i32 %140, %141
  %143 = add i32 %142, %140
  %144 = tail call i32 @llvm.fshl.i32(i32 %142, i32 %142, i32 26)
  %145 = xor i32 %143, %144
  %146 = add i32 %145, %143
  %147 = add i32 %146, %101
  %148 = tail call i32 @llvm.fshl.i32(i32 %145, i32 %145, i32 6)
  %149 = xor i32 %146, %148
  %150 = add i32 %102, 3
  %151 = add i32 %150, %149
  %152 = add i32 %147, %151
  %153 = tail call i32 @llvm.fshl.i32(i32 %151, i32 %151, i32 17)
  %154 = xor i32 %152, %153
  %155 = add i32 %154, %152
  %156 = tail call i32 @llvm.fshl.i32(i32 %154, i32 %154, i32 29)
  %157 = xor i32 %155, %156
  %158 = add i32 %157, %155
  %159 = tail call i32 @llvm.fshl.i32(i32 %157, i32 %157, i32 16)
  %160 = xor i32 %158, %159
  %161 = add i32 %160, %158
  %162 = add i32 %161, %102
  %163 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 24)
  %164 = xor i32 %161, %163
  %165 = add i32 %119, 4
  %166 = add i32 %165, %164
  %167 = add i32 %162, %166
  %168 = tail call i32 @llvm.fshl.i32(i32 %166, i32 %166, i32 13)
  %169 = xor i32 %167, %168
  %170 = add i32 %169, %167
  %171 = tail call i32 @llvm.fshl.i32(i32 %169, i32 %169, i32 15)
  %172 = xor i32 %170, %171
  %173 = add i32 %172, %170
  %174 = tail call i32 @llvm.fshl.i32(i32 %172, i32 %172, i32 26)
  %175 = xor i32 %173, %174
  %176 = add i32 %175, %173
  %177 = tail call i32 @llvm.fshl.i32(i32 %175, i32 %175, i32 6)
  %178 = xor i32 %176, %177
  %179 = add i32 %101, 5
  %180 = add i32 %179, %178
  br label %concatenate.47.5.merge

concatenate.47.5.merge:                           ; preds = %concatenate.pivot.2.105, %concatenate.pivot.0.
  %181 = phi i32 [ %89, %concatenate.pivot.0. ], [ %180, %concatenate.pivot.2.105 ]
  %182 = lshr i32 %0, 1
  %183 = and i32 %0, 1
  %cond = icmp eq i32 %183, 0
  %arg2.arg3 = select i1 %cond, ptr addrspace(1) %arg2113, ptr addrspace(1) %arg3115
  %184 = zext nneg i32 %182 to i64
  %185 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg2.arg3, i64 0, i64 %184, i64 0
  store i32 %181, ptr addrspace(1) %185, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none)
define void @loop_slice_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg3) local_unnamed_addr #3 {
entry:
  %arg3104 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2102 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1100 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg098 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !280
  %1 = lshr i32 %0, 2
  %urem = and i32 %0, 3
  %2 = icmp ult i32 %urem, 2
  br i1 %2, label %concatenate.pivot.0., label %concatenate.pivot.2.93

concatenate.pivot.0.:                             ; preds = %entry
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg098, i64 0, i64 %3, i64 0
  %5 = load i32, ptr addrspace(1) %4, align 4, !invariant.load !278
  %6 = add i32 %5, %urem
  %7 = or disjoint i32 %urem, 2
  %8 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg1100, i64 0, i64 %3, i64 0
  %9 = load i32, ptr addrspace(1) %8, align 4, !invariant.load !278
  %10 = add i32 %9, %7
  %11 = add i32 %6, %10
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
  %24 = xor i32 %5, %9
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
  %41 = add i32 %5, 2
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
  %53 = add i32 %52, %5
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
  %82 = add i32 %79, %25
  %83 = add i32 %82, %81
  br label %concatenate.48.3.merge

concatenate.pivot.2.93:                           ; preds = %entry
  %84 = add nsw i32 %urem, -2
  %85 = zext nneg i32 %1 to i64
  %86 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg098, i64 0, i64 %85, i64 0
  %87 = load i32, ptr addrspace(1) %86, align 4, !invariant.load !278
  %88 = add i32 %84, %87
  %89 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg1100, i64 0, i64 %85, i64 0
  %90 = load i32, ptr addrspace(1) %89, align 4, !invariant.load !278
  %91 = add i32 %90, %urem
  %92 = add i32 %88, %91
  %93 = tail call i32 @llvm.fshl.i32(i32 %91, i32 %91, i32 13)
  %94 = xor i32 %92, %93
  %95 = add i32 %94, %92
  %96 = tail call i32 @llvm.fshl.i32(i32 %94, i32 %94, i32 15)
  %97 = xor i32 %95, %96
  %98 = add i32 %97, %95
  %99 = tail call i32 @llvm.fshl.i32(i32 %97, i32 %97, i32 26)
  %100 = xor i32 %98, %99
  %101 = add i32 %100, %98
  %102 = add i32 %101, %90
  %103 = tail call i32 @llvm.fshl.i32(i32 %100, i32 %100, i32 6)
  %104 = xor i32 %101, %103
  %105 = xor i32 %87, %90
  %106 = xor i32 %105, 466688986
  %107 = add i32 %106, 1
  %108 = add i32 %107, %104
  %109 = add i32 %102, %108
  %110 = tail call i32 @llvm.fshl.i32(i32 %108, i32 %108, i32 17)
  %111 = xor i32 %109, %110
  %112 = add i32 %111, %109
  %113 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %111, i32 29)
  %114 = xor i32 %112, %113
  %115 = add i32 %114, %112
  %116 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %114, i32 16)
  %117 = xor i32 %115, %116
  %118 = add i32 %117, %115
  %119 = add i32 %118, %106
  %120 = tail call i32 @llvm.fshl.i32(i32 %117, i32 %117, i32 24)
  %121 = xor i32 %118, %120
  %122 = add i32 %87, 2
  %123 = add i32 %122, %121
  %124 = add i32 %119, %123
  %125 = tail call i32 @llvm.fshl.i32(i32 %123, i32 %123, i32 13)
  %126 = xor i32 %124, %125
  %127 = add i32 %126, %124
  %128 = tail call i32 @llvm.fshl.i32(i32 %126, i32 %126, i32 15)
  %129 = xor i32 %127, %128
  %130 = add i32 %129, %127
  %131 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %129, i32 26)
  %132 = xor i32 %130, %131
  %133 = add i32 %132, %130
  %134 = add i32 %133, %87
  %135 = tail call i32 @llvm.fshl.i32(i32 %132, i32 %132, i32 6)
  %136 = xor i32 %133, %135
  %137 = add i32 %90, 3
  %138 = add i32 %137, %136
  %139 = add i32 %134, %138
  %140 = tail call i32 @llvm.fshl.i32(i32 %138, i32 %138, i32 17)
  %141 = xor i32 %139, %140
  %142 = add i32 %141, %139
  %143 = tail call i32 @llvm.fshl.i32(i32 %141, i32 %141, i32 29)
  %144 = xor i32 %142, %143
  %145 = add i32 %144, %142
  %146 = tail call i32 @llvm.fshl.i32(i32 %144, i32 %144, i32 16)
  %147 = xor i32 %145, %146
  %148 = add i32 %147, %145
  %149 = add i32 %148, %90
  %150 = tail call i32 @llvm.fshl.i32(i32 %147, i32 %147, i32 24)
  %151 = xor i32 %148, %150
  %152 = add i32 %106, 4
  %153 = add i32 %152, %151
  %154 = add i32 %149, %153
  %155 = tail call i32 @llvm.fshl.i32(i32 %153, i32 %153, i32 13)
  %156 = xor i32 %154, %155
  %157 = add i32 %156, %154
  %158 = tail call i32 @llvm.fshl.i32(i32 %156, i32 %156, i32 15)
  %159 = xor i32 %157, %158
  %160 = add i32 %159, %157
  %161 = tail call i32 @llvm.fshl.i32(i32 %159, i32 %159, i32 26)
  %162 = xor i32 %160, %161
  %163 = add i32 %162, %160
  %164 = tail call i32 @llvm.fshl.i32(i32 %162, i32 %162, i32 6)
  %165 = xor i32 %163, %164
  %166 = add i32 %87, 5
  %167 = add i32 %166, %165
  br label %concatenate.48.3.merge

concatenate.48.3.merge:                           ; preds = %concatenate.pivot.2.93, %concatenate.pivot.0.
  %.pre-phi = phi i64 [ %85, %concatenate.pivot.2.93 ], [ %3, %concatenate.pivot.0. ]
  %168 = phi i32 [ %83, %concatenate.pivot.0. ], [ %167, %concatenate.pivot.2.93 ]
  %169 = and i32 %0, 1
  %170 = and i32 %0, 2
  %cond = icmp eq i32 %170, 0
  %arg3.arg2 = select i1 %cond, ptr addrspace(1) %arg3104, ptr addrspace(1) %arg2102
  %171 = zext nneg i32 %169 to i64
  %172 = getelementptr inbounds [2 x [1 x [2 x i32]]], ptr addrspace(1) %arg3.arg2, i64 0, i64 %.pre-phi, i64 0, i64 %171
  store i32 %168, ptr addrspace(1) %172, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(16) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg1) local_unnamed_addr #2 {
entry:
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
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
  %7 = load <2 x i32>, ptr addrspace(1) %6, align 8, !invariant.load !278
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
  %add.4547.9 = fadd double %96, -1.000000e+00
  %multiply.3070.9 = fmul double %add.4547.9, 2.000000e+00
  %add.4548.9 = fadd double %multiply.3070.9, 0xBFEFFFFFFFFFFFFF
  %97 = fcmp ugt double %add.4548.9, 0xBFEFFFFFFFFFFFFF
  %maximum.49.9 = select i1 %97, double %add.4548.9, double 0xBFEFFFFFFFFFFFFF
  %98 = tail call double @llvm.fabs.f64(double %add.4548.9)
  %99 = fcmp oeq double %98, 1.000000e+00
  %compare.1188.1 = and i1 %97, %99
  %100 = fneg double %maximum.49.9
  %multiply.3072.3 = fmul double %maximum.49.9, %100
  %101 = tail call i32 @llvm.nvvm.d2i.hi(double %multiply.3072.3) #13
  %102 = bitcast i32 %101 to float
  %103 = fcmp olt float %102, 0x3FFCAAAAA0000000
  %104 = fcmp ogt float %102, 0xBFFB333320000000
  %or.cond.i = and i1 %103, %104
  br i1 %or.cond.i, label %105, label %122

105:                                              ; preds = %loop_multiply_fusion.in_bounds-true
  %106 = fadd double %multiply.3072.3, 2.000000e+00
  %107 = fdiv double %multiply.3072.3, %106
  %108 = fneg double %multiply.3072.3
  %109 = fmul double %107, %108
  %110 = fadd double %multiply.3072.3, %109
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
  %121 = fadd double %multiply.3072.3, %120
  br label %__nv_log1p.exit

122:                                              ; preds = %loop_multiply_fusion.in_bounds-true
  %123 = fadd double %multiply.3072.3, 1.000000e+00
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
  %compare.1189.1 = fcmp ogt double %t.0.i, -6.250000e+00
  %compare.1190.1 = fcmp ogt double %t.0.i, -1.600000e+01
  %186 = select i1 %compare.1189.1, double 0x3F2879C2A212F024, double 0x4008ABCC380D5A48
  %187 = select i1 %compare.1189.1, double 0xBEED1D1F7B8736F6, double 0x3FF0158A6D641D39
  %188 = select i1 %compare.1189.1, double 0xBEB6E8A5434AE8A2, double 0x3F75FFCFE5B76AFC
  %189 = select i1 %compare.1190.1, double %188, double 0x4013664DDD1AD7FB
  %190 = select i1 %compare.1189.1, double 0x3E9C6B4F5D03B787, double 0xBF6EBADABB891BBD
  %191 = select i1 %compare.1190.1, double %190, double 0x3FF02A30D1FBA0DC
  %192 = select i1 %compare.1189.1, double 0xBE5F36CD6D3D46A9, double 0x3F6468EECA533CF8
  %193 = select i1 %compare.1190.1, double %192, double 0xBF222EA5DF04047C
  %194 = select i1 %compare.1189.1, double 0xBE31A9E38DC84D60, double 0xBF5BA924132F38B1
  %195 = select i1 %compare.1190.1, double %194, double 0xBF2C2F36A8FC5D53
  %196 = select i1 %compare.1189.1, double 0x3E120F47CCF46B3C, double 0x3F4F3CC55AD40C25
  %197 = select i1 %compare.1190.1, double %196, double 0x3F13EBF4EB00938F
  %198 = select i1 %compare.1189.1, double 0xBDCDC583D118A561, double 0xBF37448A89EF8AA3
  %199 = select i1 %compare.1190.1, double %198, double 0xBEF4A3497E1E0FAC
  %200 = select i1 %compare.1189.1, double 0xBDAC8859C4E5C0AF, double 0x3EF932CD54C8A222
  %201 = select i1 %compare.1190.1, double %200, double 0x3ED2FBD29D093D2B
  %202 = select i1 %compare.1189.1, double 0x3D872A22C2D77E20, double 0x3F11E684D0B9188A
  %203 = select i1 %compare.1190.1, double %202, double 0xBEB0A8D40EA372CC
  %204 = select i1 %compare.1189.1, double 0xBD36F2167040D8E2, double 0xBF08CEF1F80281F2
  %205 = select i1 %compare.1190.1, double %204, double 0x3E8EBC8BB824CB54
  %206 = select i1 %compare.1189.1, double 0xBD26D33EED66C487, double 0x3EEA29A0CACDFB23
  %207 = select i1 %compare.1190.1, double %206, double 0xBE722D220FDF9C3E
  %208 = select i1 %compare.1189.1, double 0x3CFDE4ACFD9E26BA, double 0x3EC8860CD5D652F6
  %209 = select i1 %compare.1190.1, double %208, double 0x3E5F4C20E1334AF8
  %210 = select i1 %compare.1189.1, double 0x3C782E11898132E0, double 0xBED0D5DB812B5083
  %211 = select i1 %compare.1190.1, double %210, double 0xBE50102E495FB9C0
  %212 = select i1 %compare.1189.1, double 0xBCA33689090A6B96, double 0x3EB936388A3790AD
  %213 = select i1 %compare.1190.1, double %212, double 0x3E405AC6A8FBA182
  %214 = select i1 %compare.1189.1, double 0x3C69BA72CD589B91, double 0x3E5395ABCD554C6C
  %215 = select i1 %compare.1190.1, double %214, double 0xBE30468FB24E2F5F
  %216 = select i1 %compare.1189.1, double 0x3C37B83EEF0B7C9F, double 0xBE92777453DD3955
  %217 = select i1 %compare.1190.1, double %216, double 0x3E19E6BF2DDA45E3
  %218 = select i1 %compare.1189.1, double 0xBC08DDF93324D327, double 0x3E785CBE52878635
  %219 = select i1 %compare.1190.1, double %218, double 0xBDF18FEEC0E38727
  %220 = select i1 %compare.1189.1, double 0xBBB135D2E746E627, double 0x3E23040F87DBD932
  %221 = select i1 %compare.1190.1, double %220, double 0xBDBDCEC3A7785389
  %add.4549.3 = fsub double -3.125000e+00, %t.0.i
  %222 = tail call double @llvm.sqrt.f64(double %185)
  %223 = select i1 %compare.1190.1, double 3.250000e+00, double 5.000000e+00
  %subtract.240.5 = fsub double %222, %223
  %224 = select i1 %compare.1189.1, double %add.4549.3, double %subtract.240.5
  %multiply.3073.1 = fmul double %221, %224
  %add.4550.1 = fadd double %219, %multiply.3073.1
  %multiply.3074.1 = fmul double %224, %add.4550.1
  %add.4551.1 = fadd double %217, %multiply.3074.1
  %multiply.3075.1 = fmul double %224, %add.4551.1
  %add.4552.1 = fadd double %215, %multiply.3075.1
  %multiply.3076.1 = fmul double %224, %add.4552.1
  %add.4553.1 = fadd double %213, %multiply.3076.1
  %multiply.3077.1 = fmul double %224, %add.4553.1
  %add.4554.1 = fadd double %211, %multiply.3077.1
  %multiply.3078.1 = fmul double %224, %add.4554.1
  %add.4555.1 = fadd double %209, %multiply.3078.1
  %multiply.3079.1 = fmul double %224, %add.4555.1
  %add.4556.1 = fadd double %207, %multiply.3079.1
  %multiply.3080.1 = fmul double %224, %add.4556.1
  %add.4557.1 = fadd double %205, %multiply.3080.1
  %multiply.3081.1 = fmul double %224, %add.4557.1
  %add.4558.1 = fadd double %203, %multiply.3081.1
  %multiply.3082.1 = fmul double %224, %add.4558.1
  %add.4559.1 = fadd double %201, %multiply.3082.1
  %multiply.3083.1 = fmul double %224, %add.4559.1
  %add.4560.1 = fadd double %199, %multiply.3083.1
  %multiply.3084.1 = fmul double %224, %add.4560.1
  %add.4561.1 = fadd double %197, %multiply.3084.1
  %multiply.3085.1 = fmul double %224, %add.4561.1
  %add.4562.1 = fadd double %195, %multiply.3085.1
  %multiply.3086.1 = fmul double %224, %add.4562.1
  %add.4563.1 = fadd double %193, %multiply.3086.1
  %multiply.3087.1 = fmul double %224, %add.4563.1
  %add.4564.1 = fadd double %191, %multiply.3087.1
  %multiply.3088.1 = fmul double %224, %add.4564.1
  %add.4565.1 = fadd double %189, %multiply.3088.1
  %multiply.3089.1 = fmul double %224, %add.4565.1
  %add.4566.1 = fadd double %187, %multiply.3089.1
  %225 = select i1 %compare.1190.1, double %add.4566.1, double %add.4565.1
  %multiply.3090.1 = fmul double %224, %225
  %add.4567.1 = fadd double %186, %multiply.3090.1
  %226 = select i1 %compare.1190.1, double %add.4567.1, double %add.4565.1
  %multiply.3091.1 = fmul double %224, %226
  %add.4568.1 = fadd double %multiply.3091.1, 0xBF4845769484FCA8
  %227 = select i1 %compare.1189.1, double %add.4568.1, double %226
  %multiply.3092.1 = fmul double %224, %227
  %add.4569.1 = fadd double %multiply.3092.1, 0xBF78B6C33114F909
  %228 = select i1 %compare.1189.1, double %add.4569.1, double %226
  %multiply.3093.1 = fmul double %224, %228
  %add.4570.1 = fadd double %multiply.3093.1, 0x3FCEBD80D9B13E28
  %229 = select i1 %compare.1189.1, double %add.4570.1, double %226
  %multiply.3094.1 = fmul double %224, %229
  %add.4571.1 = fadd double %multiply.3094.1, 0x3FFA755E7C99AE86
  %230 = select i1 %compare.1189.1, double %add.4571.1, double %226
  %.v = select i1 %compare.1188.1, double 0x7FF0000000000000, double %230
  %231 = fmul double %maximum.49.9, %.v
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
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !281
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %3 = zext nneg i32 %2 to i64
  %param_0.510918 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg061, i64 0, i64 %1, i64 %3
  %4 = load <2 x double>, ptr addrspace(1) %param_0.510918, align 16, !invariant.load !278
  %param_0.51091969 = extractelement <2 x double> %4, i32 0
  %param_0.510919.170 = extractelement <2 x double> %4, i32 1
  %multiply.3097.122 = fmul double %param_0.51091969, %param_0.51091969
  %multiply.3097.122.1 = fmul double %param_0.510919.170, %param_0.510919.170
  %add.3969.i50.1 = fadd double %multiply.3097.122, %multiply.3097.122.1
  %5 = or i32 %thread.id.x, 32
  %6 = icmp ult i32 %5, 60
  br i1 %6, label %loop3.loop_header13.preheader.1, label %x_in_tile-after.7

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

loop3.loop_header13.preheader.1:                  ; preds = %entry
  %7 = shl nuw nsw i32 %5, 1
  %8 = zext nneg i32 %7 to i64
  %param_0.510918.157 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg061, i64 0, i64 %1, i64 %8
  %9 = load <2 x double>, ptr addrspace(1) %param_0.510918.157, align 16, !invariant.load !278
  %param_0.510919.15867 = extractelement <2 x double> %9, i32 0
  %param_0.510919.1.168 = extractelement <2 x double> %9, i32 1
  %multiply.3097.122.159 = fmul double %param_0.510919.15867, %param_0.510919.15867
  %add.3969.i50.160 = fadd double %add.3969.i50.1, %multiply.3097.122.159
  %multiply.3097.122.1.1 = fmul double %param_0.510919.1.168, %param_0.510919.1.168
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 800
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 640
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 480
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 320
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 160
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp1 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp1, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = zext nneg i32 %1 to i64
  %4 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg02, i64 0, i64 %2, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.5603 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.5603, 0
  %4 = add i64 %param_2.5603, 10
  %5 = select i1 %3, i64 %4, i64 %param_2.5603
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 9)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.71165 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr inbounds [10 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.71165, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !283
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !284
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
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !285
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
  %param_2.4587 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.45872 = load i64, ptr addrspace(1) %param_2.4587, align 8, !invariant.load !278
  %6 = icmp slt i64 %param_2.45872, 10
  %param_1.5754 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg113, i64 0, i64 %5
  %param_1.57543 = load i8, ptr addrspace(1) %param_1.5754, align 1, !invariant.load !278
  %param_0.4171 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg011, i64 0, i64 %5
  %param_0.41714 = load i8, ptr addrspace(1) %param_0.4171, align 1, !invariant.load !278
  %7 = or i8 %param_0.41714, %param_1.57543
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg143, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !278
  %4 = trunc i64 %3 to i32
  %5 = getelementptr inbounds [2 x [2 x i32]], ptr addrspace(1) %arg041, i64 0, i64 %1, i64 0
  %6 = load <2 x i32>, ptr addrspace(1) %5, align 8, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !286
  %.urem = add nsw i32 %0, -3
  %.cmp = icmp ult i32 %0, 3
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %.cmp98 = icmp ugt i32 %0, 2
  %2 = zext i1 %.cmp98 to i64
  %3 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg099, i64 0, i64 %2, i64 0
  %4 = load i32, ptr addrspace(1) %3, align 4, !invariant.load !278
  %5 = add i32 %4, %1
  %6 = add nuw nsw i32 %1, 3
  %7 = getelementptr inbounds [2 x [1 x i32]], ptr addrspace(1) %arg1101, i64 0, i64 %2, i64 0
  %8 = load i32, ptr addrspace(1) %7, align 4, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !276
  %1 = lshr i32 %0, 1
  %2 = or i32 %0, 2
  %3 = zext nneg i32 %1 to i64
  %4 = zext nneg i32 %2 to i64
  %5 = getelementptr inbounds [2 x [6 x i32]], ptr addrspace(1) %arg01, i64 0, i64 %3, i64 %4
  %6 = load i32, ptr addrspace(1) %5, align 4, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr inbounds [2 x [6 x i32]], ptr addrspace(1) %arg0113, i64 0, i64 %1, i64 0
  %3 = load <2 x i32>, ptr addrspace(1) %2, align 8, !invariant.load !278
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
  %add.4378.7 = fadd float %81, -1.000000e+00
  %82 = tail call float @llvm.maximum.f32(float %add.4378.7, float 0.000000e+00)
  %compare.1169.3 = fcmp uge float %82, 5.000000e-01
  %83 = select i1 %compare.1169.3, i64 -1, i64 1
  %84 = zext i1 %compare.1169.3 to i8
  %85 = getelementptr i64, ptr addrspace(1) %arg1115, i64 %1
  %86 = load i64, ptr addrspace(1) %85, align 8, !invariant.load !278
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
define void @loop_select_fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg37, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg38, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg39, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg40, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg41, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg42, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg43, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg44, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg45, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg46, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg47, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg48, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg49, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg50, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg51, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg52, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg53, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg54) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %2 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg212, i64 0, i64 %1
  %3 = load i8, ptr addrspace(1) %2, align 1, !invariant.load !278
  %4 = zext nneg i32 %0 to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !278
  %7 = getelementptr double, ptr addrspace(1) %arg110, i64 %4
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !278
  %9 = trunc i8 %3 to i1
  %10 = select i1 %9, double %6, double %8
  %11 = getelementptr double, ptr addrspace(1) %arg314, i64 %4
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !278
  %13 = getelementptr double, ptr addrspace(1) %arg416, i64 %4
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !278
  %15 = select i1 %9, double %12, double %14
  %16 = getelementptr double, ptr addrspace(1) %arg518, i64 %4
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !278
  %18 = getelementptr double, ptr addrspace(1) %arg620, i64 %4
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !278
  %20 = select i1 %9, double %17, double %19
  %21 = getelementptr double, ptr addrspace(1) %arg722, i64 %4
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !278
  %23 = getelementptr double, ptr addrspace(1) %arg824, i64 %4
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !278
  %25 = select i1 %9, double %22, double %24
  %26 = getelementptr double, ptr addrspace(1) %arg926, i64 %4
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !278
  %28 = getelementptr double, ptr addrspace(1) %arg1028, i64 %4
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !278
  %30 = select i1 %9, double %27, double %29
  %31 = getelementptr double, ptr addrspace(1) %arg1130, i64 %4
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !278
  %33 = getelementptr double, ptr addrspace(1) %arg1232, i64 %4
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !278
  %35 = select i1 %9, double %32, double %34
  %36 = getelementptr double, ptr addrspace(1) %arg1334, i64 %4
  %37 = load double, ptr addrspace(1) %36, align 8, !invariant.load !278
  %38 = getelementptr double, ptr addrspace(1) %arg1436, i64 %4
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !278
  %40 = select i1 %9, double %37, double %39
  %41 = getelementptr double, ptr addrspace(1) %arg1538, i64 %4
  %42 = load double, ptr addrspace(1) %41, align 8, !invariant.load !278
  %43 = getelementptr double, ptr addrspace(1) %arg1640, i64 %4
  %44 = load double, ptr addrspace(1) %43, align 8, !invariant.load !278
  %45 = select i1 %9, double %42, double %44
  %46 = getelementptr double, ptr addrspace(1) %arg1742, i64 %4
  %47 = load double, ptr addrspace(1) %46, align 8, !invariant.load !278
  %48 = getelementptr double, ptr addrspace(1) %arg1844, i64 %4
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !278
  %50 = select i1 %9, double %47, double %49
  %51 = getelementptr double, ptr addrspace(1) %arg1946, i64 %4
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !278
  %53 = getelementptr double, ptr addrspace(1) %arg2048, i64 %4
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !278
  %55 = select i1 %9, double %52, double %54
  %56 = getelementptr double, ptr addrspace(1) %arg2150, i64 %4
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !278
  %58 = getelementptr double, ptr addrspace(1) %arg2252, i64 %4
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !278
  %60 = select i1 %9, double %57, double %59
  %61 = getelementptr double, ptr addrspace(1) %arg2354, i64 %4
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !278
  %63 = getelementptr double, ptr addrspace(1) %arg2456, i64 %4
  %64 = load double, ptr addrspace(1) %63, align 8, !invariant.load !278
  %65 = select i1 %9, double %62, double %64
  %66 = getelementptr double, ptr addrspace(1) %arg2558, i64 %4
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !278
  %68 = getelementptr double, ptr addrspace(1) %arg2660, i64 %4
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !278
  %70 = select i1 %9, double %67, double %69
  %71 = getelementptr double, ptr addrspace(1) %arg2762, i64 %4
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !278
  %73 = getelementptr double, ptr addrspace(1) %arg2864, i64 %4
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !278
  %75 = select i1 %9, double %72, double %74
  %76 = getelementptr double, ptr addrspace(1) %arg2966, i64 %4
  %77 = load double, ptr addrspace(1) %76, align 8, !invariant.load !278
  %78 = getelementptr double, ptr addrspace(1) %arg3068, i64 %4
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !278
  %80 = select i1 %9, double %77, double %79
  %81 = getelementptr double, ptr addrspace(1) %arg3170, i64 %4
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !278
  %83 = getelementptr double, ptr addrspace(1) %arg3272, i64 %4
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !278
  %85 = select i1 %9, double %82, double %84
  %86 = getelementptr double, ptr addrspace(1) %arg3374, i64 %4
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !278
  %88 = getelementptr double, ptr addrspace(1) %arg3476, i64 %4
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !278
  %90 = select i1 %9, double %87, double %89
  %91 = getelementptr double, ptr addrspace(1) %arg3578, i64 %4
  %92 = load double, ptr addrspace(1) %91, align 8, !invariant.load !278
  %93 = getelementptr double, ptr addrspace(1) %arg3680, i64 %4
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !278
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
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !281
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
  %param_5.190243.196130 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 -800
  br label %concatenate.43.1.merge26.1113

concatenate.pivot.80.54.199:                      ; preds = %concatenate.pivot.100.53.195
  %9 = add nsw i32 %4, -80
  %10 = zext nneg i32 %9 to i64
  %param_4.227840.198 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4124, i64 0, i64 %1, i64 %10
  br label %concatenate.43.1.merge26.1113

concatenate.pivot.60.52.1101:                     ; preds = %loop3.loop_header21.preheader.1
  %11 = add nsw i32 %4, -60
  %12 = zext nneg i32 %11 to i64
  %param_3.329537.1100 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg3122, i64 0, i64 %1, i64 %12
  br label %concatenate.43.1.merge26.1113

concatenate.43.1.merge26.1113:                    ; preds = %concatenate.pivot.60.52.1101, %concatenate.pivot.80.54.199, %concatenate.pivot.100.55.197
  %.in.1110 = phi ptr addrspace(1) [ %param_3.329537.1100, %concatenate.pivot.60.52.1101 ], [ %param_4.227840.198, %concatenate.pivot.80.54.199 ], [ %param_5.190243.196130, %concatenate.pivot.100.55.197 ]
  %13 = icmp ult i32 %81, 40
  %14 = load double, ptr addrspace(1) %.in.1110, align 8, !invariant.load !278
  %multiply.3060.156.1111 = fmul double %14, %14
  %add.3969.i87.1112 = fadd double %add.3969.i87.1, %multiply.3060.156.1111
  br i1 %13, label %concatenate.pivot.60.52.1.1, label %concatenate.pivot.100.53.1.1

concatenate.pivot.100.53.1.1:                     ; preds = %concatenate.43.1.merge26.1113
  %15 = icmp ult i32 %81, 50
  br i1 %15, label %concatenate.pivot.80.54.1.1, label %concatenate.pivot.100.55.1.1

concatenate.pivot.100.55.1.1:                     ; preds = %concatenate.pivot.100.53.1.1
  %16 = sext i32 %4 to i64
  %17 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg5126, i64 0, i64 %1, i64 %16
  %param_5.190243.1.1131 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 -792
  br label %concatenate.43.1.merge26.1.1

concatenate.pivot.80.54.1.1:                      ; preds = %concatenate.pivot.100.53.1.1
  %18 = add nsw i32 %4, -79
  %19 = zext nneg i32 %18 to i64
  %param_4.227840.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4124, i64 0, i64 %1, i64 %19
  br label %concatenate.43.1.merge26.1.1

concatenate.pivot.60.52.1.1:                      ; preds = %concatenate.43.1.merge26.1113
  %20 = add nsw i32 %4, -59
  %21 = zext nneg i32 %20 to i64
  %param_3.329537.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg3122, i64 0, i64 %1, i64 %21
  br label %concatenate.43.1.merge26.1.1

concatenate.43.1.merge26.1.1:                     ; preds = %concatenate.pivot.60.52.1.1, %concatenate.pivot.80.54.1.1, %concatenate.pivot.100.55.1.1
  %.in.1.1 = phi ptr addrspace(1) [ %param_3.329537.1.1, %concatenate.pivot.60.52.1.1 ], [ %param_4.227840.1.1, %concatenate.pivot.80.54.1.1 ], [ %param_5.190243.1.1131, %concatenate.pivot.100.55.1.1 ]
  %22 = load double, ptr addrspace(1) %.in.1.1, align 8, !invariant.load !278
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
  %param_3.329537 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg3.sink, i64 0, i64 %1, i64 %71
  %72 = load double, ptr addrspace(1) %param_3.329537, align 8, !invariant.load !278
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
  %param_0.415828.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg0.sink, i64 0, i64 %1, i64 %79
  %80 = load double, ptr addrspace(1) %param_0.415828.1, align 8, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %4 = getelementptr i8, ptr addrspace(1) %arg25, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !278
  %6 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !278
  %8 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %10 = trunc i8 %5 to i1
  %11 = select i1 %10, double %7, double %9
  %12 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !278
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
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !285
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
  %param_2.2761 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg216, i64 0, i64 %5
  %param_2.27612 = load i64, ptr addrspace(1) %param_2.2761, align 8, !invariant.load !278
  %param_3.2227 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg318, i64 0, i64 %5
  %param_3.22273 = load i64, ptr addrspace(1) %param_3.2227, align 8, !invariant.load !278
  %6 = icmp slt i64 %param_2.27612, %param_3.22273
  %param_1.3362 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg114, i64 0, i64 %5
  %param_1.33624 = load i8, ptr addrspace(1) %param_1.3362, align 1, !invariant.load !278
  %param_0.2406 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg012, i64 0, i64 %5
  %param_0.24065 = load i8, ptr addrspace(1) %param_0.2406, align 1, !invariant.load !278
  %7 = or i8 %param_0.24065, %param_1.33624
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
define void @loop_concatenate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg13) local_unnamed_addr #8 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw i32 %linear_index to i8
  %3 = udiv i8 %.lhs.trunc, 120
  %4 = mul i8 %3, 120
  %.decomposed = sub i8 %.lhs.trunc, %4
  %.zext = zext nneg i8 %.decomposed to i32
  %.zext18 = zext nneg i8 %3 to i32
  %5 = icmp ult i32 %linear_index, 240
  br i1 %5, label %loop_concatenate_fusion.in_bounds-true, label %loop_concatenate_fusion.in_bounds-after

loop_concatenate_fusion.in_bounds-after:          ; preds = %concatenate.37.1.merge, %entry
  ret void

loop_concatenate_fusion.in_bounds-true:           ; preds = %entry
  %6 = icmp ult i8 %.decomposed, 60
  br i1 %6, label %concatenate.pivot.20., label %concatenate.pivot.80.

concatenate.pivot.20.:                            ; preds = %loop_concatenate_fusion.in_bounds-true
  %7 = icmp ult i8 %.decomposed, 20
  br i1 %7, label %concatenate.pivot.0., label %concatenate.pivot.40.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.20.
  %8 = mul nuw nsw i32 %.zext18, 20
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr double, ptr addrspace(1) %arg1041, i64 %9
  %11 = zext nneg i8 %.decomposed to i64
  %12 = getelementptr inbounds double, ptr addrspace(1) %10, i64 %11
  %13 = zext nneg i8 %3 to i64
  %14 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1245, i64 0, i64 %13
  %15 = load i64, ptr addrspace(1) %14, align 8, !invariant.load !278
  %16 = getelementptr double, ptr addrspace(1) %arg1143, i64 %9
  %17 = getelementptr inbounds double, ptr addrspace(1) %16, i64 %11
  br label %concatenate.37.1.merge

concatenate.pivot.40.:                            ; preds = %concatenate.pivot.20.
  %18 = icmp ult i8 %.decomposed, 40
  %19 = mul nuw nsw i32 %.zext18, 20
  %20 = zext nneg i32 %19 to i64
  %21 = zext nneg i8 %3 to i64
  %22 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1245, i64 0, i64 %21
  %23 = load i64, ptr addrspace(1) %22, align 8, !invariant.load !278
  br i1 %18, label %concatenate.pivot.20.11, label %concatenate.pivot.40.12

concatenate.pivot.20.11:                          ; preds = %concatenate.pivot.40.
  %24 = add nsw i32 %.zext, -20
  %25 = getelementptr double, ptr addrspace(1) %arg837, i64 %20
  %26 = zext nneg i32 %24 to i64
  %27 = getelementptr inbounds double, ptr addrspace(1) %25, i64 %26
  %28 = getelementptr double, ptr addrspace(1) %arg939, i64 %20
  %29 = getelementptr inbounds double, ptr addrspace(1) %28, i64 %26
  br label %concatenate.37.1.merge

concatenate.pivot.40.12:                          ; preds = %concatenate.pivot.40.
  %30 = add nsw i32 %.zext, -40
  %31 = getelementptr double, ptr addrspace(1) %arg633, i64 %20
  %32 = zext nneg i32 %30 to i64
  %33 = getelementptr inbounds double, ptr addrspace(1) %31, i64 %32
  %34 = getelementptr double, ptr addrspace(1) %arg735, i64 %20
  %35 = getelementptr inbounds double, ptr addrspace(1) %34, i64 %32
  br label %concatenate.37.1.merge

concatenate.pivot.80.:                            ; preds = %loop_concatenate_fusion.in_bounds-true
  %36 = icmp ult i8 %.decomposed, 80
  %37 = mul nuw nsw i32 %.zext18, 20
  %38 = zext nneg i32 %37 to i64
  br i1 %36, label %concatenate.pivot.60.13, label %concatenate.pivot.100.

concatenate.pivot.60.13:                          ; preds = %concatenate.pivot.80.
  %39 = add nsw i32 %.zext, -60
  %40 = getelementptr double, ptr addrspace(1) %arg429, i64 %38
  %41 = zext nneg i32 %39 to i64
  %42 = getelementptr inbounds double, ptr addrspace(1) %40, i64 %41
  %43 = zext nneg i8 %3 to i64
  %44 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1245, i64 0, i64 %43
  %45 = load i64, ptr addrspace(1) %44, align 8, !invariant.load !278
  %46 = getelementptr double, ptr addrspace(1) %arg531, i64 %38
  %47 = getelementptr inbounds double, ptr addrspace(1) %46, i64 %41
  br label %concatenate.37.1.merge

concatenate.pivot.100.:                           ; preds = %concatenate.pivot.80.
  %48 = icmp ult i8 %.decomposed, 100
  %49 = zext nneg i8 %3 to i64
  %50 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1245, i64 0, i64 %49
  %51 = load i64, ptr addrspace(1) %50, align 8, !invariant.load !278
  br i1 %48, label %concatenate.pivot.80.14, label %concatenate.pivot.100.15

concatenate.pivot.80.14:                          ; preds = %concatenate.pivot.100.
  %52 = add nsw i32 %.zext, -80
  %53 = getelementptr double, ptr addrspace(1) %arg225, i64 %38
  %54 = zext nneg i32 %52 to i64
  %55 = getelementptr inbounds double, ptr addrspace(1) %53, i64 %54
  %56 = getelementptr double, ptr addrspace(1) %arg327, i64 %38
  %57 = getelementptr inbounds double, ptr addrspace(1) %56, i64 %54
  br label %concatenate.37.1.merge

concatenate.pivot.100.15:                         ; preds = %concatenate.pivot.100.
  %58 = add nsw i32 %.zext, -100
  %59 = getelementptr double, ptr addrspace(1) %arg021, i64 %38
  %60 = zext nneg i32 %58 to i64
  %61 = getelementptr inbounds double, ptr addrspace(1) %59, i64 %60
  %62 = getelementptr double, ptr addrspace(1) %arg123, i64 %38
  %63 = getelementptr inbounds double, ptr addrspace(1) %62, i64 %60
  br label %concatenate.37.1.merge

concatenate.37.1.merge:                           ; preds = %concatenate.pivot.100.15, %concatenate.pivot.80.14, %concatenate.pivot.60.13, %concatenate.pivot.40.12, %concatenate.pivot.20.11, %concatenate.pivot.0.
  %.sink20 = phi ptr addrspace(1) [ %63, %concatenate.pivot.100.15 ], [ %57, %concatenate.pivot.80.14 ], [ %47, %concatenate.pivot.60.13 ], [ %35, %concatenate.pivot.40.12 ], [ %29, %concatenate.pivot.20.11 ], [ %17, %concatenate.pivot.0. ]
  %multiply.3002.158.sink.in.in = phi i64 [ %51, %concatenate.pivot.100.15 ], [ %51, %concatenate.pivot.80.14 ], [ %45, %concatenate.pivot.60.13 ], [ %23, %concatenate.pivot.40.12 ], [ %23, %concatenate.pivot.20.11 ], [ %15, %concatenate.pivot.0. ]
  %.sink.in = phi ptr addrspace(1) [ %61, %concatenate.pivot.100.15 ], [ %55, %concatenate.pivot.80.14 ], [ %42, %concatenate.pivot.60.13 ], [ %33, %concatenate.pivot.40.12 ], [ %27, %concatenate.pivot.20.11 ], [ %12, %concatenate.pivot.0. ]
  %.sink = load double, ptr addrspace(1) %.sink.in, align 8, !invariant.load !278
  %multiply.3002.158.sink.in = sitofp i64 %multiply.3002.158.sink.in.in to double
  %multiply.3002.158.sink = fmul double %multiply.3002.158.sink.in, 0x3F786F8FA34E82C5
  %64 = load double, ptr addrspace(1) %.sink20, align 8, !invariant.load !278
  %multiply.3008.5 = fmul double %64, %multiply.3002.158.sink
  %add.4171.5 = fadd double %.sink, %multiply.3008.5
  %multiply.3009.1 = fmul double %add.4171.5, 5.000000e-01
  %65 = zext nneg i32 %linear_index to i64
  %66 = getelementptr double, ptr addrspace(1) %arg1347, i64 %65
  store double %multiply.3009.1, ptr addrspace(1) %66, align 8
  br label %loop_concatenate_fusion.in_bounds-after
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define void @loop_reduce_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg3) local_unnamed_addr #9 {
entry:
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg29, i64 0, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !278
  %4 = sitofp i64 %3 to double
  %multiply.3000.41 = fmul double %4, 0x3F886F8FA34E82C5
  %5 = mul nuw nsw i64 %1, 160
  %6 = add nuw nsw i64 %5, 24
  %scevgep = getelementptr i8, ptr addrspace(1) %arg05, i64 %6
  %7 = mul nuw nsw i64 %1, 960
  %8 = add nuw nsw i64 %7, 160
  %scevgep23 = getelementptr i8, ptr addrspace(1) %arg17, i64 %8
  br label %reduce.35.1.inner.loop_body.reduction_dim.1

reduce.35.1.inner.loop_body.reduction_dim.1:      ; preds = %reduce.35.1.inner.loop_body.reduction_dim.1, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %reduce.35.1.inner.loop_body.reduction_dim.1 ], [ 0, %entry ]
  %accumulator_0.04 = phi double [ 0.000000e+00, %entry ], [ %24, %reduce.35.1.inner.loop_body.reduction_dim.1 ]
  %scevgep17 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %lsr.iv
  %scevgep18 = getelementptr i8, ptr addrspace(1) %scevgep17, i64 -24
  %9 = load <2 x double>, ptr addrspace(1) %scevgep18, align 32, !invariant.load !278
  %10 = extractelement <2 x double> %9, i32 0
  %11 = extractelement <2 x double> %9, i32 1
  %scevgep24 = getelementptr i8, ptr addrspace(1) %scevgep23, i64 %lsr.iv
  %12 = load <2 x double>, ptr addrspace(1) %scevgep24, align 32, !invariant.load !278
  %13 = extractelement <2 x double> %12, i32 0
  %14 = extractelement <2 x double> %12, i32 1
  %add.4172.58 = fadd double %13, %13
  %multiply.3025.31 = fmul double %multiply.3000.41, %add.4172.58
  %add.4191.29 = fadd double %10, %multiply.3025.31
  %add.4192.23 = fadd double %add.4191.29, -1.000000e+00
  %multiply.3026.7 = fmul double %add.4192.23, %add.4192.23
  %multiply.3027.7 = fmul double %multiply.3026.7, 4.000000e+00
  %add.4193.5 = fadd double %multiply.3027.7, 0x3FDCE6BB25AA1315
  %multiply.3028.3 = fmul double %add.4193.5, 5.000000e-01
  %15 = fsub double %accumulator_0.04, %multiply.3028.3
  %add.4172.58.1 = fadd double %14, %14
  %multiply.3025.31.1 = fmul double %multiply.3000.41, %add.4172.58.1
  %add.4191.29.1 = fadd double %11, %multiply.3025.31.1
  %add.4192.23.1 = fadd double %add.4191.29.1, -1.000000e+00
  %multiply.3026.7.1 = fmul double %add.4192.23.1, %add.4192.23.1
  %multiply.3027.7.1 = fmul double %multiply.3026.7.1, 4.000000e+00
  %add.4193.5.1 = fadd double %multiply.3027.7.1, 0x3FDCE6BB25AA1315
  %multiply.3028.3.1 = fmul double %add.4193.5.1, 5.000000e-01
  %16 = fsub double %15, %multiply.3028.3.1
  %scevgep22 = getelementptr i8, ptr addrspace(1) %scevgep17, i64 -8
  %17 = load <2 x double>, ptr addrspace(1) %scevgep22, align 16, !invariant.load !278
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %scevgep28 = getelementptr i8, ptr addrspace(1) %scevgep24, i64 16
  %20 = load <2 x double>, ptr addrspace(1) %scevgep28, align 16, !invariant.load !278
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  %add.4172.58.2 = fadd double %21, %21
  %multiply.3025.31.2 = fmul double %multiply.3000.41, %add.4172.58.2
  %add.4191.29.2 = fadd double %18, %multiply.3025.31.2
  %add.4192.23.2 = fadd double %add.4191.29.2, -1.000000e+00
  %multiply.3026.7.2 = fmul double %add.4192.23.2, %add.4192.23.2
  %multiply.3027.7.2 = fmul double %multiply.3026.7.2, 4.000000e+00
  %add.4193.5.2 = fadd double %multiply.3027.7.2, 0x3FDCE6BB25AA1315
  %multiply.3028.3.2 = fmul double %add.4193.5.2, 5.000000e-01
  %23 = fsub double %16, %multiply.3028.3.2
  %add.4172.58.3 = fadd double %22, %22
  %multiply.3025.31.3 = fmul double %multiply.3000.41, %add.4172.58.3
  %add.4191.29.3 = fadd double %19, %multiply.3025.31.3
  %add.4192.23.3 = fadd double %add.4191.29.3, -1.000000e+00
  %multiply.3026.7.3 = fmul double %add.4192.23.3, %add.4192.23.3
  %multiply.3027.7.3 = fmul double %multiply.3026.7.3, 4.000000e+00
  %add.4193.5.3 = fadd double %multiply.3027.7.3, 0x3FDCE6BB25AA1315
  %multiply.3028.3.3 = fmul double %add.4193.5.3, 5.000000e-01
  %24 = fsub double %23, %multiply.3028.3.3
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 32
  %tmp = trunc i64 %lsr.iv.next to i32
  %exitcond.3 = icmp eq i32 %tmp, 160
  br i1 %exitcond.3, label %reduce.35.1.inner.loop_exit.reduction_dim.1, label %reduce.35.1.inner.loop_body.reduction_dim.1

reduce.35.1.inner.loop_exit.reduction_dim.1:      ; preds = %reduce.35.1.inner.loop_body.reduction_dim.1
  %25 = getelementptr double, ptr addrspace(1) %arg311, i64 %1
  store double %24, ptr addrspace(1) %25, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_2(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture align 128 dereferenceable(320) %arg8, ptr noalias nocapture align 128 dereferenceable(320) %arg9, ptr noalias nocapture align 128 dereferenceable(320) %arg10, ptr noalias nocapture align 128 dereferenceable(320) %arg11, ptr noalias nocapture align 128 dereferenceable(320) %arg12, ptr noalias nocapture align 128 dereferenceable(320) %arg13, ptr noalias nocapture align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg23) local_unnamed_addr #2 {
entry:
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp7 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp7, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg110, i64 0, i64 %2
  %4 = load i64, ptr addrspace(1) %3, align 8, !invariant.load !278
  %5 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg416, i64 0, i64 %2
  %6 = load i64, ptr addrspace(1) %5, align 8, !invariant.load !278
  %7 = icmp sge i64 %4, %6
  %8 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg314, i64 0, i64 %2
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !278
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg212, i64 0, i64 %2
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !278
  %12 = or i8 %11, %9
  %13 = trunc i8 %12 to i1
  %.not6 = or i1 %7, %13
  %14 = icmp eq i64 %4, 0
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr double, ptr addrspace(1) %arg08, i64 %15
  %17 = load double, ptr addrspace(1) %16, align 8
  %18 = getelementptr double, ptr addrspace(1) %arg518, i64 %15
  %19 = load double, ptr addrspace(1) %18, align 8
  %20 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg722, i64 0, i64 %2
  %21 = load i64, ptr addrspace(1) %20, align 8, !invariant.load !278
  %22 = sitofp i64 %21 to double
  %multiply.3000.3.clone.1 = fmul double %22, 0x3F886F8FA34E82C5
  %23 = zext nneg i32 %1 to i64
  %24 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg620, i64 0, i64 %2, i64 %23
  %25 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 480
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !278
  %add.4172.10.clone.1 = fadd double %26, %26
  %multiply.3029.3.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.10.clone.1
  %add.4196.1.clone.1 = fadd double %19, %multiply.3029.3.clone.1
  %27 = select i1 %14, double %add.4196.1.clone.1, double %17
  %28 = select i1 %.not6, double %17, double %27
  %29 = select i1 %.not6, double %19, double %add.4196.1.clone.1
  %30 = getelementptr double, ptr addrspace(1) %arg824, i64 %15
  %31 = load double, ptr addrspace(1) %30, align 8
  %32 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 320
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !278
  %add.4172.10.clone.11 = fadd double %33, %33
  %multiply.3014.3.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.10.clone.11
  %add.4177.1.clone.1.clone.1 = fadd double %31, %multiply.3014.3.clone.1.clone.1
  %34 = select i1 %.not6, double %31, double %add.4177.1.clone.1.clone.1
  %35 = getelementptr double, ptr addrspace(1) %arg926, i64 %15
  %36 = load double, ptr addrspace(1) %35, align 8
  %37 = select i1 %14, double %add.4177.1.clone.1.clone.1, double %36
  %38 = select i1 %.not6, double %36, double %37
  %39 = getelementptr double, ptr addrspace(1) %arg1028, i64 %15
  %40 = load double, ptr addrspace(1) %39, align 8
  %41 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 640
  %42 = load double, ptr addrspace(1) %41, align 8, !invariant.load !278
  %add.4172.10.clone.12 = fadd double %42, %42
  %multiply.3010.3.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.10.clone.12
  %add.4173.1.clone.1.clone.1 = fadd double %40, %multiply.3010.3.clone.1.clone.1
  %43 = select i1 %.not6, double %40, double %add.4173.1.clone.1.clone.1
  %44 = getelementptr double, ptr addrspace(1) %arg1130, i64 %15
  %45 = load double, ptr addrspace(1) %44, align 8
  %46 = select i1 %14, double %add.4173.1.clone.1.clone.1, double %45
  %47 = select i1 %.not6, double %45, double %46
  %48 = getelementptr double, ptr addrspace(1) %arg1232, i64 %15
  %49 = load double, ptr addrspace(1) %48, align 8
  %50 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 800
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !278
  %add.4172.10.clone.13 = fadd double %51, %51
  %multiply.3021.3.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.10.clone.13
  %add.4186.1.clone.1.clone.1 = fadd double %49, %multiply.3021.3.clone.1.clone.1
  %52 = select i1 %.not6, double %49, double %add.4186.1.clone.1.clone.1
  %53 = getelementptr double, ptr addrspace(1) %arg1334, i64 %15
  %54 = load double, ptr addrspace(1) %53, align 8
  %55 = select i1 %14, double %add.4186.1.clone.1.clone.1, double %54
  %56 = select i1 %.not6, double %54, double %55
  %57 = getelementptr double, ptr addrspace(1) %arg1436, i64 %15
  %58 = load double, ptr addrspace(1) %57, align 8
  %59 = getelementptr double, ptr addrspace(1) %arg1538, i64 %15
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !278
  %61 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 160
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !278
  %add.4172.10.clone.14 = fadd double %62, %62
  %multiply.3025.9.clone.1.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.10.clone.14
  %add.4191.7.clone.1.clone.1 = fadd double %60, %multiply.3025.9.clone.1.clone.1
  %63 = select i1 %14, double %add.4191.7.clone.1.clone.1, double %58
  %64 = select i1 %.not6, double %58, double %63
  %65 = select i1 %.not6, double %60, double %add.4191.7.clone.1.clone.1
  %66 = getelementptr double, ptr addrspace(1) %arg1640, i64 %15
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !278
  %68 = load double, ptr addrspace(1) %24, align 8, !invariant.load !278
  %add.4172.10.clone.15 = fadd double %68, %68
  %multiply.3018.3.clone.1 = fmul double %multiply.3000.3.clone.1, %add.4172.10.clone.15
  %add.4182.1.clone.1 = fadd double %67, %multiply.3018.3.clone.1
  store double %28, ptr addrspace(1) %16, align 8
  store double %29, ptr addrspace(1) %18, align 8
  %69 = getelementptr double, ptr addrspace(1) %arg1742, i64 %15
  store double %add.4196.1.clone.1, ptr addrspace(1) %69, align 8
  store double %34, ptr addrspace(1) %30, align 8
  store double %38, ptr addrspace(1) %35, align 8
  %70 = getelementptr double, ptr addrspace(1) %arg1844, i64 %15
  store double %add.4177.1.clone.1.clone.1, ptr addrspace(1) %70, align 8
  store double %43, ptr addrspace(1) %39, align 8
  store double %47, ptr addrspace(1) %44, align 8
  %71 = getelementptr double, ptr addrspace(1) %arg1946, i64 %15
  store double %add.4173.1.clone.1.clone.1, ptr addrspace(1) %71, align 8
  store double %52, ptr addrspace(1) %48, align 8
  store double %56, ptr addrspace(1) %53, align 8
  %72 = getelementptr double, ptr addrspace(1) %arg2048, i64 %15
  store double %add.4186.1.clone.1.clone.1, ptr addrspace(1) %72, align 8
  store double %64, ptr addrspace(1) %57, align 8
  %73 = getelementptr double, ptr addrspace(1) %arg2150, i64 %15
  store double %65, ptr addrspace(1) %73, align 8
  %74 = getelementptr double, ptr addrspace(1) %arg2252, i64 %15
  store double %add.4191.7.clone.1.clone.1, ptr addrspace(1) %74, align 8
  %75 = getelementptr double, ptr addrspace(1) %arg2354, i64 %15
  store double %add.4182.1.clone.1, ptr addrspace(1) %75, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !280
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !284
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !280
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !284
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !280
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !284
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !280
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !284
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !287
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !287
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !275
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
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !278
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
  %param_1.1529 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !278
  %0 = icmp slt i64 %param_1.1529, 0
  %1 = add i64 %param_1.1529, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1529
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
  %param_1.1531 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !278
  %0 = icmp slt i64 %param_1.1531, 0
  %1 = add i64 %param_1.1531, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1531
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg04, i64 0, i64 %4
  store double 1.000000e+00, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_38(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4) local_unnamed_addr #2 {
entry:
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1522 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12635 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.8926 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.9987 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %multiply.2961.9 = fmul double %param_4.8926, %param_3.9987
  %add.4053.7 = fadd double %param_2.12635, %multiply.2961.9
  %4 = tail call double @llvm.fma.f64(double %add.4053.7, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #13
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #13
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.4053.7)
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
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.7) #13
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #13
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.4053.7, 0.000000e+00
  %30 = fadd double %add.4053.7, 0x7FF0000000000000
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
  %42 = trunc i64 %thread_id_x to i32
  %43 = trunc i64 %thread_id_x to i32
  %44 = icmp slt i64 %param_1.1522, 0
  %45 = add i64 %param_1.1522, 192
  %46 = select i1 %44, i64 %45, i64 %param_1.1522
  %47 = tail call i64 @llvm.smax.i64(i64 %46, i64 0)
  %48 = tail call i64 @llvm.umin.i64(i64 %47, i64 191)
  %.cmp8 = icmp ult i32 %43, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %49 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %42, 19
  %50 = zext i1 %.cmp to i64
  %compare.1135.3 = fcmp ogt double %z.2.i, 1.000000e-128
  %51 = zext i1 %compare.1135.3 to i8
  %52 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg09, i64 0, i64 %48, i64 %50, i64 %49
  store i8 %51, ptr addrspace(1) %52, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1470 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1470, 0
  %4 = add i64 %param_1.1470, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1470
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12116 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = icmp ne i64 %param_2.12116, 0
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp7 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1507 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1507, 0
  %4 = add i64 %param_1.1507, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1507
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12495 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = icmp ne i64 %param_2.12495, 0
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp7 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1526 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1526, 0
  %4 = add i64 %param_1.1526, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1526
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12715 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !278
  %.not = icmp eq i64 %param_2.12715, 0
  %9 = zext i1 %.not to i8
  %10 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %9, ptr addrspace(1) %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1261 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15205 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = tail call double @llvm.fma.f64(double %param_1.15205, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #13
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #13
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_1.15205)
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
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.15205) #13
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #13
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_1.15205, 0.000000e+00
  %28 = fadd double %param_1.15205, 0x7FF0000000000000
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
  %40 = trunc i64 %thread_id_x to i32
  %41 = trunc i64 %thread_id_x to i32
  %42 = icmp slt i64 %param_2.1261, 0
  %43 = add i64 %param_2.1261, 192
  %44 = select i1 %42, i64 %43, i64 %param_2.1261
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %.cmp6 = icmp ult i32 %41, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %47 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %40, 19
  %48 = zext i1 %.cmp to i64
  %compare.1139.3 = fcmp ogt double %z.2.i, 1.000000e-128
  %49 = zext i1 %compare.1139.3 to i8
  %50 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %46, i64 %48, i64 %47
  store i8 %49, ptr addrspace(1) %50, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp7 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %param_1.1516 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1516, 0
  %4 = add i64 %param_1.1516, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1516
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12585 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = icmp ne i64 %param_2.12585, 0
  %10 = zext i1 %9 to i32
  %11 = getelementptr inbounds [192 x [2 x [20 x i32]]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 %1, i64 %2
  store i32 %10, ptr addrspace(1) %11, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_36(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5) local_unnamed_addr #2 {
entry:
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1264 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.9995 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7756 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.8937 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %multiply.2961.11 = fmul double %param_5.7756, %param_4.8937
  %add.4053.9 = fadd double %param_3.9995, %multiply.2961.11
  %4 = tail call double @llvm.fma.f64(double %add.4053.9, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #13
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #13
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.4053.9)
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
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.9) #13
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #13
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.4053.9, 0.000000e+00
  %30 = fadd double %add.4053.9, 0x7FF0000000000000
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
  %42 = trunc i64 %thread_id_x to i32
  %43 = trunc i64 %thread_id_x to i32
  %44 = icmp slt i64 %param_2.1264, 0
  %45 = add i64 %param_2.1264, 192
  %46 = select i1 %44, i64 %45, i64 %param_2.1264
  %47 = tail call i64 @llvm.smax.i64(i64 %46, i64 0)
  %48 = tail call i64 @llvm.umin.i64(i64 %47, i64 191)
  %.cmp9 = icmp ult i32 %43, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %49 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %42, 19
  %50 = zext i1 %.cmp to i64
  %compare.1135.5 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_1.1504 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg112, i64 0, i64 %49
  %param_1.15048 = load double, ptr addrspace(1) %param_1.1504, align 8, !invariant.load !278
  %51 = select i1 %compare.1135.5, double %z.2.i, double %param_1.15048
  %52 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %48, i64 %50, i64 %49
  store double %51, ptr addrspace(1) %52, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_39(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4) local_unnamed_addr #2 {
entry:
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1498 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12405 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.8786 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.9837 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %multiply.2961.7 = fmul double %param_4.8786, %param_3.9837
  %add.4053.5 = fadd double %param_2.12405, %multiply.2961.7
  %4 = tail call double @llvm.fma.f64(double %add.4053.5, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #13
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #13
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.4053.5)
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
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.5) #13
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #13
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.4053.5, 0.000000e+00
  %30 = fadd double %add.4053.5, 0x7FF0000000000000
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
  %42 = trunc i64 %thread_id_x to i32
  %43 = trunc i64 %thread_id_x to i32
  %44 = icmp slt i64 %param_1.1498, 0
  %45 = add i64 %param_1.1498, 192
  %46 = select i1 %44, i64 %45, i64 %param_1.1498
  %47 = tail call i64 @llvm.smax.i64(i64 %46, i64 0)
  %48 = tail call i64 @llvm.umin.i64(i64 %47, i64 191)
  %.cmp8 = icmp ult i32 %43, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %49 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %42, 19
  %50 = zext i1 %.cmp to i64
  %51 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %48, i64 %50, i64 %49
  store double %z.2.i, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_35(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6) local_unnamed_addr #2 {
entry:
  %arg623 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1508 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg623, i64 %thread_id_x
  %param_6.6345 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.9946 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7727 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %4 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.8888 = load double, ptr addrspace(1) %4, align 8, !invariant.load !278
  %multiply.2961.39 = fmul double %param_5.7727, %param_4.8888
  %add.4053.37 = fadd double %param_3.9946, %multiply.2961.39
  %5 = tail call double @llvm.fma.f64(double %add.4053.37, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #13
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #13
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.4053.37)
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
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.37) #13
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #13
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.4053.37, 0.000000e+00
  %31 = fadd double %add.4053.37, 0x7FF0000000000000
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
  %43 = trunc i64 %thread_id_x to i32
  %44 = trunc i64 %thread_id_x to i32
  %divide.600.7 = fdiv double 1.000000e+00, %param_6.6345
  %45 = icmp slt i64 %param_1.1508, 0
  %46 = add i64 %param_1.1508, 192
  %47 = select i1 %45, i64 %46, i64 %param_1.1508
  %48 = tail call i64 @llvm.smax.i64(i64 %47, i64 0)
  %49 = tail call i64 @llvm.umin.i64(i64 %48, i64 191)
  %.cmp10 = icmp ult i32 %44, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %50 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %43, 19
  %51 = zext i1 %.cmp to i64
  %compare.1135.33 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_2.1250 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg215, i64 0, i64 %50
  %param_2.12509 = load double, ptr addrspace(1) %param_2.1250, align 8, !invariant.load !278
  %52 = select i1 %compare.1135.33, double %z.2.i, double %param_2.12509
  %add.4054.7 = fadd double %divide.600.7, %52
  %multiply.2991.3 = fmul double %add.4054.7, %add.4054.7
  %divide.612.3 = fdiv double 1.000000e+00, %multiply.2991.3
  %53 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %49, i64 %51, i64 %50
  store double %divide.612.3, ptr addrspace(1) %53, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_4(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1273 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1273, 0
  %4 = add i64 %param_2.1273, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1273
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15285 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %multiply.2982.5 = fmul double %param_1.15285, %param_1.15285
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1270 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1270, 0
  %4 = add i64 %param_2.1270, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1270
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14955 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %multiply.2999.3 = fmul double %param_1.14955, 2.000000e+00
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2999.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_50(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp5 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp5, i64 %thread_id_x, i64 %.urem
  %param_1.1518 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1518, 0
  %4 = add i64 %param_1.1518, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1518
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1247 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1247, 0
  %4 = add i64 %param_2.1247, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1247
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15055 = load i64, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = sitofp i64 %param_1.15055 to double
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1248 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1248, 0
  %4 = add i64 %param_2.1248, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1248
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15065 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.15065, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_29(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_2.1245 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1245, 0
  %4 = add i64 %param_2.1245, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1245
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.15035 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %multiply.2962.2 = fmul double %param_1.15035, %param_1.15035
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2962.2, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_51(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp5 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp5, i64 %thread_id_x, i64 %.urem
  %param_1.1533 = load i64, ptr addrspace(1) %arg18, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1533, 0
  %4 = add i64 %param_1.1533, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1533
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1238 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1238, 0
  %4 = add i64 %param_2.1238, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1238
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14965 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.14965, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_41(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_2.1234 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1234, 0
  %4 = add i64 %param_2.1234, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1234
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.14925 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %multiply.2990.3 = fmul double %param_1.14925, %param_1.14925
  %divide.611.3 = fdiv double 1.000000e+00, %multiply.2990.3
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.611.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_43(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3) local_unnamed_addr #2 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1487 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.9755 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = tail call double @llvm.fma.f64(double %param_3.9755, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #13
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #13
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_3.9755)
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
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_3.9755) #13
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #13
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_3.9755, 0.000000e+00
  %28 = fadd double %param_3.9755, 0x7FF0000000000000
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
  %40 = trunc i64 %thread_id_x to i32
  %41 = trunc i64 %thread_id_x to i32
  %42 = icmp slt i64 %param_1.1487, 0
  %43 = add i64 %param_1.1487, 192
  %44 = select i1 %42, i64 %43, i64 %param_1.1487
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %.cmp7 = icmp ult i32 %41, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %47 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %40, 19
  %48 = zext i1 %.cmp to i64
  %compare.1139.7 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_2.1229 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg212, i64 0, i64 %47
  %param_2.12296 = load double, ptr addrspace(1) %param_2.1229, align 8, !invariant.load !278
  %49 = select i1 %compare.1139.7, double %z.2.i, double %param_2.12296
  %50 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %46, i64 %48, i64 %47
  store double %49, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_46(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1223 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14815 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = tail call double @llvm.fma.f64(double %param_1.14815, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #13
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #13
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_1.14815)
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
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.14815) #13
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #13
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_1.14815, 0.000000e+00
  %28 = fadd double %param_1.14815, 0x7FF0000000000000
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
  %40 = trunc i64 %thread_id_x to i32
  %41 = trunc i64 %thread_id_x to i32
  %42 = icmp slt i64 %param_2.1223, 0
  %43 = add i64 %param_2.1223, 192
  %44 = select i1 %42, i64 %43, i64 %param_2.1223
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %.cmp6 = icmp ult i32 %41, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %47 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %40, 19
  %48 = zext i1 %.cmp to i64
  %49 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %46, i64 %48, i64 %47
  store double %z.2.i, ptr addrspace(1) %49, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_47(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1221 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1221, 0
  %4 = add i64 %param_2.1221, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1221
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14795 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %param_1.14795, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg22) local_unnamed_addr #2 {
entry:
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.urem = add nsw i32 %0, -20
  %.cmp = icmp ult i32 %0, 20
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg318, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %5 = getelementptr double, ptr addrspace(1) %arg522, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !278
  %multiply.2958.19 = fmul double %4, %6
  %7 = getelementptr double, ptr addrspace(1) %arg216, i64 %2
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !278
  %add.4051.19 = fadd double %multiply.2958.19, %8
  %9 = getelementptr double, ptr addrspace(1) %arg828, i64 %2
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !278
  %11 = fneg double %add.4051.19
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
  %37 = fcmp ogt double %add.4051.19, 0.000000e+00
  %38 = fsub double 0x7FF0000000000000, %add.4051.19
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
  %50 = getelementptr double, ptr addrspace(1) %arg1134, i64 %2
  %51 = load double, ptr addrspace(1) %50, align 8
  %52 = getelementptr double, ptr addrspace(1) %arg726, i64 %2
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !278
  %54 = getelementptr double, ptr addrspace(1) %arg012, i64 %2
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !278
  %multiply.2961.37.clone.1 = fmul double %10, %55
  %add.4053.35.clone.1 = fadd double %53, %multiply.2961.37.clone.1
  %56 = tail call double @llvm.fma.f64(double %add.4053.35.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %57 = tail call i32 @llvm.nvvm.d2i.lo(double %56) #13
  %58 = tail call double @llvm.nvvm.add.rn.d(double %56, double 0xC338000000000000) #13
  %59 = tail call double @llvm.fma.f64(double %58, double 0xBFE62E42FEFA39EF, double %add.4053.35.clone.1)
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
  %77 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.35.clone.1) #13
  %78 = bitcast i32 %77 to float
  %79 = tail call float @llvm.nvvm.fabs.f(float %78) #13
  %80 = fcmp olt float %79, 0x4010C46560000000
  br i1 %80, label %__nv_exp.exit7, label %__internal_fast_icmp_abs_lt.exit.i4

__internal_fast_icmp_abs_lt.exit.i4:              ; preds = %__nv_exp.exit
  %81 = fcmp olt double %add.4053.35.clone.1, 0.000000e+00
  %82 = fadd double %add.4053.35.clone.1, 0x7FF0000000000000
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
  %95 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg624, i64 0, i64 %94
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !278
  %97 = load i64, ptr addrspace(1) %arg1338, align 128, !invariant.load !278
  %98 = icmp slt i64 %97, 0
  %99 = add i64 %97, 192
  %100 = select i1 %98, i64 %99, i64 %97
  %101 = trunc i64 %100 to i32
  %102 = tail call i32 @llvm.smax.i32(i32 %101, i32 0)
  %103 = tail call i32 @llvm.umin.i32(i32 %102, i32 191)
  %104 = zext nneg i32 %103 to i64
  %105 = getelementptr inbounds [20 x [192 x [1 x double]]], ptr addrspace(1) %arg1236, i64 0, i64 %94, i64 %104, i64 0
  %106 = load double, ptr addrspace(1) %105, align 8, !invariant.load !278
  %107 = getelementptr double, ptr addrspace(1) %arg420, i64 %2
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !278
  %109 = getelementptr double, ptr addrspace(1) %arg930, i64 %2
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg1032, i64 %2
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !278
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
  %compare.1135.31.clone.1 = fcmp ogt double %z.2.i6, 1.000000e-128
  %151 = select i1 %compare.1135.31.clone.1, double %z.2.i6, double %96
  %divide.600.5.clone.1 = fdiv double 1.000000e+00, %51
  %add.4054.5.clone.1 = fadd double %divide.600.5.clone.1, %151
  %divide.601.1.clone.1 = fdiv double 1.000000e+00, %add.4054.5.clone.1
  %multiply.2966.15 = fmul double %151, %divide.601.1.clone.1
  %multiply.2967.5 = fmul double %108, %multiply.2966.15
  %multiply.2962.12.clone.1 = fmul double %10, %10
  %add.4052.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.599.1.clone.1 = fdiv double 1.000000e+00, %add.4052.1.clone.1
  %subtract.222.6.clone.1 = fsub double 1.000000e+00, %divide.599.1.clone.1
  %multiply.2959.5.clone.1 = fmul double %divide.599.1.clone.1, %subtract.222.6.clone.1
  %multiply.2963.11.clone.1 = fmul double %multiply.2962.12.clone.1, %multiply.2959.5.clone.1
  %add.4056.9.clone.1 = fadd double %multiply.2963.11.clone.1, %divide.601.1.clone.1
  %compare.1136.9.clone.1 = fcmp ogt double %add.4056.9.clone.1, 1.000000e-128
  %152 = select i1 %compare.1136.9.clone.1, double %add.4056.9.clone.1, double 0x7FF8000000000000
  %multiply.2968.1.clone.1 = fmul double %add.4054.5.clone.1, %152
  %divide.604.3.clone.1 = fdiv double 1.000000e+00, %multiply.2968.1.clone.1
  %multiply.2960.5.clone.1 = fmul double %10, %multiply.2959.5.clone.1
  %divide.602.1.clone.1 = fdiv double %multiply.2960.5.clone.1, %152
  %subtract.223.5.clone.1 = fsub double %106, %divide.599.1.clone.1
  %divide.603.1.clone.1 = fdiv double %subtract.223.5.clone.1, %multiply.2959.5.clone.1
  %multiply.2964.17 = fmul double %divide.603.1.clone.1, %divide.602.1.clone.1
  %add.4058.17 = fadd double %add.4051.19, %multiply.2964.17
  %subtract.224.2.clone.1 = fsub double %add.4058.17, %add.4051.19
  %multiply.2969.4.clone.1 = fmul double %subtract.224.2.clone.1, %subtract.224.2.clone.1
  %multiply.2970.3.clone.1 = fmul double %divide.601.1.clone.1, %multiply.2969.4.clone.1
  %add.4061.3.clone.1 = fadd double %divide.604.3.clone.1, %multiply.2970.3.clone.1
  %add.4062.1.clone.1 = fadd double %add.4061.3.clone.1, -1.000000e+00
  %multiply.2971.2 = fmul double %multiply.2967.5, %add.4062.1.clone.1
  %multiply.2965.1 = fmul double %4, %55
  %add.4059.1 = fadd double %8, %multiply.2965.1
  %153 = tail call double @llvm.fabs.f64(double %add.4058.17)
  %154 = call i1 @llvm.is.fpclass.f64(double %add.4058.17, i32 504)
  %compare.1138.9 = fcmp olt double %153, 1.400000e+01
  %155 = and i1 %154, %compare.1138.9
  %compare.1139.9.clone.1 = fcmp ogt double %z.2.i10, 1.000000e-128
  %156 = select i1 %compare.1139.9.clone.1, double %z.2.i10, double %96
  %add.4063.2.clone.1 = fadd double %divide.605.1.clone.1, %156
  %divide.606.1.clone.1 = fdiv double 1.000000e+00, %add.4063.2.clone.1
  %multiply.2972.8 = fmul double %divide.606.1.clone.1, 2.000000e+00
  %divide.607.5 = fdiv double 1.000000e+00, %multiply.2972.8
  %multiply.2973.1 = fmul double %multiply.2971.2, %divide.607.5
  %157 = getelementptr i64, ptr addrspace(1) %arg114, i64 %2
  %158 = load i64, ptr addrspace(1) %157, align 8, !invariant.load !278
  %159 = sitofp i64 %158 to double
  %multiply.2974.1 = fmul double %multiply.2973.1, %159
  %add.4064.1 = fadd double %add.4059.1, %multiply.2974.1
  %160 = select i1 %155, double %add.4064.1, double %55
  %.not = icmp eq i64 %158, 0
  %add.4066.2.clone.1 = fadd double %divide.605.1.clone.1, %z.2.i10
  %divide.608.3.clone.1 = fdiv double 1.000000e+00, %add.4066.2.clone.1
  %multiply.2975.23.clone.1 = fmul double %multiply.2967.5, %multiply.2967.5
  %multiply.2976.11.clone.1 = fmul double %multiply.2975.23.clone.1, 5.000000e-01
  %multiply.2980.11.clone.1 = fmul double %multiply.2975.23.clone.1, %add.4062.1.clone.1
  %add.4067.9.clone.1 = fadd double %multiply.2976.11.clone.1, %multiply.2980.11.clone.1
  %multiply.2982.11.clone.1 = fmul double %108, %108
  %multiply.2984.9.clone.1 = fmul double %multiply.2982.11.clone.1, 5.000000e-01
  %multiply.2985.4.clone.1 = fmul double %multiply.2966.15, %multiply.2984.9.clone.1
  %multiply.2986.7.clone.1 = fmul double %multiply.2985.4.clone.1, %add.4062.1.clone.1
  %subtract.225.7.clone.1 = fsub double %add.4067.9.clone.1, %multiply.2986.7.clone.1
  %multiply.2987.5.clone.1 = fmul double %subtract.225.7.clone.1, %159
  %add.4068.3.clone.1 = fadd double %multiply.2987.5.clone.1, %divide.606.1.clone.1
  %compare.1142.5.clone.1 = fcmp ogt double %add.4068.3.clone.1, 1.000000e-128
  %161 = select i1 %compare.1142.5.clone.1, double %add.4068.3.clone.1, double %96
  %162 = select i1 %.not, double %divide.608.3.clone.1, double %161
  %163 = select i1 %155, double %162, double %110
  %164 = select i1 %155, double %add.4058.17, double %6
  %165 = select i1 %155, double %152, double %51
  %166 = getelementptr double, ptr addrspace(1) %arg1440, i64 %2
  store double %160, ptr addrspace(1) %166, align 8
  store double %163, ptr addrspace(1) %109, align 8
  %167 = getelementptr double, ptr addrspace(1) %arg1542, i64 %2
  store double %divide.606.1.clone.1, ptr addrspace(1) %167, align 8
  %168 = getelementptr double, ptr addrspace(1) %arg1644, i64 %2
  store double %divide.605.1.clone.1, ptr addrspace(1) %168, align 8
  %169 = getelementptr double, ptr addrspace(1) %arg1746, i64 %2
  store double %add.4062.1.clone.1, ptr addrspace(1) %169, align 8
  %170 = getelementptr double, ptr addrspace(1) %arg1848, i64 %2
  store double %164, ptr addrspace(1) %170, align 8
  store double %165, ptr addrspace(1) %50, align 8
  %171 = getelementptr double, ptr addrspace(1) %arg1950, i64 %2
  store double %divide.603.1.clone.1, ptr addrspace(1) %171, align 8
  %172 = getelementptr double, ptr addrspace(1) %arg2052, i64 %2
  store double %divide.602.1.clone.1, ptr addrspace(1) %172, align 8
  %173 = getelementptr double, ptr addrspace(1) %arg2154, i64 %2
  store double %divide.601.1.clone.1, ptr addrspace(1) %173, align 8
  %174 = getelementptr double, ptr addrspace(1) %arg2256, i64 %2
  store double %divide.599.1.clone.1, ptr addrspace(1) %174, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10) local_unnamed_addr #2 {
entry:
  %arg1037 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg935 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg833 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg731 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg629 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg527 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg425 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg323 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg221 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg017 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1519 = load i64, ptr addrspace(1) %arg119, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg221, i64 %thread_id_x
  %param_2.12605 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg527, i64 %thread_id_x
  %param_5.7846 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg833, i64 %thread_id_x
  %param_8.3977 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %4 = getelementptr double, ptr addrspace(1) %arg1037, i64 %thread_id_x
  %param_10.2748 = load double, ptr addrspace(1) %4, align 8, !invariant.load !278
  %5 = getelementptr double, ptr addrspace(1) %arg935, i64 %thread_id_x
  %param_9.3389 = load double, ptr addrspace(1) %5, align 8, !invariant.load !278
  %multiply.2961.17 = fmul double %param_10.2748, %param_9.3389
  %add.4053.15 = fadd double %param_8.3977, %multiply.2961.17
  %6 = tail call double @llvm.fma.f64(double %add.4053.15, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %7 = tail call i32 @llvm.nvvm.d2i.lo(double %6) #13
  %8 = tail call double @llvm.nvvm.add.rn.d(double %6, double 0xC338000000000000) #13
  %9 = tail call double @llvm.fma.f64(double %8, double 0xBFE62E42FEFA39EF, double %add.4053.15)
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
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.15) #13
  %28 = bitcast i32 %27 to float
  %29 = tail call float @llvm.nvvm.fabs.f(float %28) #13
  %30 = fcmp olt float %29, 0x4010C46560000000
  br i1 %30, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %31 = fcmp olt double %add.4053.15, 0.000000e+00
  %32 = fadd double %add.4053.15, 0x7FF0000000000000
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
  %44 = trunc i64 %thread_id_x to i32
  %45 = trunc i64 %thread_id_x to i32
  %46 = icmp slt i64 %param_1.1519, 0
  %47 = add i64 %param_1.1519, 192
  %48 = select i1 %46, i64 %47, i64 %param_1.1519
  %49 = tail call i64 @llvm.smax.i64(i64 %48, i64 0)
  %50 = tail call i64 @llvm.umin.i64(i64 %49, i64 191)
  %.cmp16 = icmp ult i32 %45, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %51 = select i1 %.cmp16, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %44, 19
  %52 = zext i1 %.cmp to i64
  %compare.1135.11 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_7.489 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg731, i64 0, i64 %51
  %param_7.48910 = load double, ptr addrspace(1) %param_7.489, align 8, !invariant.load !278
  %53 = select i1 %compare.1135.11, double %z.2.i, double %param_7.48910
  %54 = getelementptr double, ptr addrspace(1) %arg629, i64 %thread_id_x
  %param_6.64611 = load double, ptr addrspace(1) %54, align 8, !invariant.load !278
  %multiply.2966.3 = fmul double %53, %param_6.64611
  %multiply.2967.11 = fmul double %param_5.7846, %multiply.2966.3
  %multiply.2975.27 = fmul double %multiply.2967.11, %multiply.2967.11
  %multiply.2976.13 = fmul double %multiply.2975.27, 5.000000e-01
  %55 = getelementptr double, ptr addrspace(1) %arg425, i64 %thread_id_x
  %param_4.89012 = load double, ptr addrspace(1) %55, align 8, !invariant.load !278
  %multiply.2980.13 = fmul double %param_4.89012, %multiply.2975.27
  %add.4067.11 = fadd double %multiply.2976.13, %multiply.2980.13
  %multiply.2982.13 = fmul double %param_5.7846, %param_5.7846
  %multiply.2984.11 = fmul double %multiply.2982.13, 5.000000e-01
  %multiply.2985.6 = fmul double %multiply.2984.11, %multiply.2966.3
  %multiply.2986.9 = fmul double %param_4.89012, %multiply.2985.6
  %subtract.225.9 = fsub double %add.4067.11, %multiply.2986.9
  %56 = getelementptr i64, ptr addrspace(1) %arg323, i64 %thread_id_x
  %param_3.99615 = load i64, ptr addrspace(1) %56, align 8, !invariant.load !278
  %57 = sitofp i64 %param_3.99615 to double
  %multiply.2987.7 = fmul double %subtract.225.9, %57
  %add.4068.5 = fadd double %param_2.12605, %multiply.2987.7
  %compare.1142.3 = fcmp ogt double %add.4068.5, 1.000000e-128
  %58 = zext i1 %compare.1142.3 to i8
  %59 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg017, i64 0, i64 %50, i64 %52, i64 %51
  store i8 %58, ptr addrspace(1) %59, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6) local_unnamed_addr #2 {
entry:
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp11 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %param_1.1473 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1473, 0
  %4 = add i64 %param_1.1473, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1473
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7856 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr double, ptr addrspace(1) %arg624, i64 %thread_id_x
  %param_6.6477 = load double, ptr addrspace(1) %9, align 8, !invariant.load !278
  %multiply.2958.25 = fmul double %param_5.7856, %param_6.6477
  %10 = getelementptr double, ptr addrspace(1) %arg420, i64 %thread_id_x
  %param_4.9018 = load double, ptr addrspace(1) %10, align 8, !invariant.load !278
  %add.4051.25 = fadd double %multiply.2958.25, %param_4.9018
  %11 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.12749 = load double, ptr addrspace(1) %11, align 8, !invariant.load !278
  %12 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.100710 = load double, ptr addrspace(1) %12, align 8, !invariant.load !278
  %multiply.2964.23 = fmul double %param_2.12749, %param_3.100710
  %add.4058.23 = fadd double %add.4051.25, %multiply.2964.23
  %13 = tail call double @llvm.fabs.f64(double %add.4058.23)
  %14 = call i1 @llvm.is.fpclass.f64(double %add.4058.23, i32 504)
  %compare.1138.15 = fcmp olt double %13, 1.400000e+01
  %15 = and i1 %14, %compare.1138.15
  %16 = zext i1 %15 to i8
  %17 = getelementptr inbounds [192 x [1 x [2 x [20 x i8]]]], ptr addrspace(1) %arg012, i64 0, i64 %7, i64 0, i64 %1, i64 %2
  store i8 %16, ptr addrspace(1) %17, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6) local_unnamed_addr #2 {
entry:
  %arg623 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp10 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %param_1.1476 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1476, 0
  %4 = add i64 %param_1.1476, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1476
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7875 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr double, ptr addrspace(1) %arg623, i64 %thread_id_x
  %param_6.6506 = load double, ptr addrspace(1) %9, align 8, !invariant.load !278
  %multiply.2958.23 = fmul double %param_5.7875, %param_6.6506
  %10 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.9027 = load double, ptr addrspace(1) %10, align 8, !invariant.load !278
  %add.4051.23 = fadd double %multiply.2958.23, %param_4.9027
  %11 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12758 = load double, ptr addrspace(1) %11, align 8, !invariant.load !278
  %12 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.10089 = load double, ptr addrspace(1) %12, align 8, !invariant.load !278
  %multiply.2964.21 = fmul double %param_2.12758, %param_3.10089
  %add.4058.21 = fadd double %add.4051.23, %multiply.2964.21
  %13 = tail call double @llvm.fabs.f64(double %add.4058.21)
  %14 = call i1 @llvm.is.fpclass.f64(double %add.4058.21, i32 504)
  %compare.1138.13 = fcmp olt double %13, 1.400000e+01
  %15 = and i1 %14, %compare.1138.13
  %16 = zext i1 %15 to i8
  %17 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %16, ptr addrspace(1) %17, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_28(ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4) local_unnamed_addr #2 {
entry:
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp12 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_3.997 = load i64, ptr addrspace(1) %arg319, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_3.997, 0
  %4 = add i64 %param_3.997, 192
  %5 = select i1 %3, i64 %4, i64 %param_3.997
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.15215 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.12626 = load double, ptr addrspace(1) %9, align 8, !invariant.load !278
  %multiply.2962.8 = fmul double %param_2.12626, %param_2.12626
  %10 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.8919 = load double, ptr addrspace(1) %10, align 8, !invariant.load !278
  %subtract.222.4 = fsub double 1.000000e+00, %param_4.8919
  %multiply.2959.3 = fmul double %param_4.8919, %subtract.222.4
  %multiply.2963.7 = fmul double %multiply.2962.8, %multiply.2959.3
  %add.4056.5 = fadd double %param_1.15215, %multiply.2963.7
  %compare.1136.3 = fcmp ogt double %add.4056.5, 1.000000e-128
  %11 = zext i1 %compare.1136.3 to i8
  %12 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store i8 %11, ptr addrspace(1) %12, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_42(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4) local_unnamed_addr #2 {
entry:
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1232 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.14905 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.8766 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = tail call double @llvm.fma.f64(double %param_4.8766, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #13
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #13
  %6 = tail call double @llvm.fma.f64(double %5, double 0xBFE62E42FEFA39EF, double %param_4.8766)
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
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #13
  %20 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #13
  %21 = shl i32 %4, 20
  %22 = add i32 %20, %21
  %23 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %22) #13
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %param_4.8766) #13
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #13
  %27 = fcmp olt float %26, 0x4010C46560000000
  br i1 %27, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %28 = fcmp olt double %param_4.8766, 0.000000e+00
  %29 = fadd double %param_4.8766, 0x7FF0000000000000
  %z.0.i = select i1 %28, double 0.000000e+00, double %29
  %30 = fcmp olt float %26, 0x4010E90000000000
  br i1 %30, label %31, label %__nv_exp.exit

31:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %32 = sdiv i32 %4, 2
  %33 = shl i32 %32, 20
  %34 = add i32 %20, %33
  %35 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %34) #13
  %36 = sub nsw i32 %4, %32
  %37 = shl i32 %36, 20
  %38 = add nsw i32 %37, 1072693248
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %38) #13
  %40 = fmul double %39, %35
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %31
  %z.2.i = phi double [ %23, %entry ], [ %40, %31 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %41 = trunc i64 %thread_id_x to i32
  %42 = trunc i64 %thread_id_x to i32
  %43 = icmp slt i64 %param_2.1232, 0
  %44 = add i64 %param_2.1232, 192
  %45 = select i1 %43, i64 %44, i64 %param_2.1232
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %.cmp8 = icmp ult i32 %42, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %48 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %41, 19
  %49 = zext i1 %.cmp to i64
  %compare.1139.11 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_3.978 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg315, i64 0, i64 %48
  %param_3.9787 = load double, ptr addrspace(1) %param_3.978, align 8, !invariant.load !278
  %50 = select i1 %compare.1139.11, double %z.2.i, double %param_3.9787
  %add.4063.4 = fadd double %param_1.14905, %50
  %multiply.2989.3 = fmul double %add.4063.4, %add.4063.4
  %divide.610.3 = fdiv double 1.000000e+00, %multiply.2989.3
  %51 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %47, i64 %49, i64 %48
  store double %divide.610.3, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.992 = load i64, ptr addrspace(1) %arg314, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.15155 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.12576 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = tail call double @llvm.fma.f64(double %param_2.12576, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #13
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #13
  %6 = tail call double @llvm.fma.f64(double %5, double 0xBFE62E42FEFA39EF, double %param_2.12576)
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
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #13
  %20 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #13
  %21 = shl i32 %4, 20
  %22 = add i32 %20, %21
  %23 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %22) #13
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.12576) #13
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #13
  %27 = fcmp olt float %26, 0x4010C46560000000
  br i1 %27, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %28 = fcmp olt double %param_2.12576, 0.000000e+00
  %29 = fadd double %param_2.12576, 0x7FF0000000000000
  %z.0.i = select i1 %28, double 0.000000e+00, double %29
  %30 = fcmp olt float %26, 0x4010E90000000000
  br i1 %30, label %31, label %__nv_exp.exit

31:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %32 = sdiv i32 %4, 2
  %33 = shl i32 %32, 20
  %34 = add i32 %20, %33
  %35 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %34) #13
  %36 = sub nsw i32 %4, %32
  %37 = shl i32 %36, 20
  %38 = add nsw i32 %37, 1072693248
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %38) #13
  %40 = fmul double %39, %35
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %31
  %z.2.i = phi double [ %23, %entry ], [ %40, %31 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %41 = trunc i64 %thread_id_x to i32
  %42 = trunc i64 %thread_id_x to i32
  %43 = icmp slt i64 %param_3.992, 0
  %44 = add i64 %param_3.992, 192
  %45 = select i1 %43, i64 %44, i64 %param_3.992
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %.cmp7 = icmp ult i32 %42, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %48 = select i1 %.cmp7, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %41, 19
  %49 = zext i1 %.cmp to i64
  %add.4066.4 = fadd double %param_1.15155, %z.2.i
  %multiply.2997.3 = fmul double %add.4066.4, %add.4066.4
  %divide.616.3 = fdiv double 1.000000e+00, %multiply.2997.3
  %50 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %47, i64 %49, i64 %48
  store double %divide.616.3, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8) local_unnamed_addr #2 {
entry:
  %arg829 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg727 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg625 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1216 = load i64, ptr addrspace(1) %arg217, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.9695 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg625, i64 %thread_id_x
  %param_6.6386 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg829, i64 %thread_id_x
  %param_8.3947 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %4 = getelementptr double, ptr addrspace(1) %arg727, i64 %thread_id_x
  %param_7.4838 = load double, ptr addrspace(1) %4, align 8, !invariant.load !278
  %multiply.2961.19 = fmul double %param_8.3947, %param_7.4838
  %add.4053.17 = fadd double %param_6.6386, %multiply.2961.19
  %5 = tail call double @llvm.fma.f64(double %add.4053.17, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #13
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #13
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.4053.17)
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
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.17) #13
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #13
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.4053.17, 0.000000e+00
  %31 = fadd double %add.4053.17, 0x7FF0000000000000
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
  %43 = trunc i64 %thread_id_x to i32
  %44 = trunc i64 %thread_id_x to i32
  %45 = icmp slt i64 %param_2.1216, 0
  %46 = add i64 %param_2.1216, 192
  %47 = select i1 %45, i64 %46, i64 %param_2.1216
  %48 = tail call i64 @llvm.smax.i64(i64 %47, i64 0)
  %49 = tail call i64 @llvm.umin.i64(i64 %48, i64 191)
  %.cmp12 = icmp ult i32 %44, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %50 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %43, 19
  %51 = zext i1 %.cmp to i64
  %compare.1135.13 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_5.755 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg523, i64 0, i64 %50
  %param_5.7559 = load double, ptr addrspace(1) %param_5.755, align 8, !invariant.load !278
  %52 = select i1 %compare.1135.13, double %z.2.i, double %param_5.7559
  %53 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.86910 = load double, ptr addrspace(1) %53, align 8, !invariant.load !278
  %multiply.2966.5 = fmul double %52, %param_4.86910
  %multiply.2967.13 = fmul double %param_3.9695, %multiply.2966.5
  %54 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.147411 = load double, ptr addrspace(1) %54, align 8, !invariant.load !278
  %multiply.2971.1 = fmul double %param_1.147411, %multiply.2967.13
  %55 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %49, i64 %51, i64 %50
  store double %multiply.2971.1, ptr addrspace(1) %55, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1267 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1267, 0
  %4 = add i64 %param_2.1267, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1267
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.14975 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %multiply.2972.4 = fmul double %param_1.14975, 2.000000e+00
  %multiply.2996.3 = fmul double %multiply.2972.4, %multiply.2972.4
  %divide.615.3 = fdiv double 1.000000e+00, %multiply.2996.3
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.615.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_1.1472 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1472, 0
  %4 = add i64 %param_1.1472, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1472
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.12145 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %multiply.2972.6 = fmul double %param_2.12145, 2.000000e+00
  %divide.607.3 = fdiv double 1.000000e+00, %multiply.2972.6
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.607.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6) local_unnamed_addr #2 {
entry:
  %arg623 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp10 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %param_1.1513 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1513, 0
  %4 = add i64 %param_1.1513, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1513
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7695 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr double, ptr addrspace(1) %arg623, i64 %thread_id_x
  %param_6.6326 = load double, ptr addrspace(1) %9, align 8, !invariant.load !278
  %multiply.2958.5 = fmul double %param_5.7695, %param_6.6326
  %10 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.8857 = load double, ptr addrspace(1) %10, align 8, !invariant.load !278
  %add.4051.5 = fadd double %multiply.2958.5, %param_4.8857
  %11 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12558 = load double, ptr addrspace(1) %11, align 8, !invariant.load !278
  %12 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.9919 = load double, ptr addrspace(1) %12, align 8, !invariant.load !278
  %multiply.2964.7 = fmul double %param_2.12558, %param_3.9919
  %add.4058.7 = fadd double %add.4051.5, %multiply.2964.7
  %subtract.224.3 = fsub double %add.4058.7, %add.4051.5
  %multiply.2969.1 = fmul double %subtract.224.3, %subtract.224.3
  %13 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2969.1, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6) local_unnamed_addr #2 {
entry:
  %arg623 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp10 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %param_1.1524 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1524, 0
  %4 = add i64 %param_1.1524, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1524
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7815 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr double, ptr addrspace(1) %arg623, i64 %thread_id_x
  %param_6.6436 = load double, ptr addrspace(1) %9, align 8, !invariant.load !278
  %multiply.2958.9 = fmul double %param_5.7815, %param_6.6436
  %10 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.8987 = load double, ptr addrspace(1) %10, align 8, !invariant.load !278
  %add.4051.9 = fadd double %multiply.2958.9, %param_4.8987
  %11 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12688 = load double, ptr addrspace(1) %11, align 8, !invariant.load !278
  %12 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.10049 = load double, ptr addrspace(1) %12, align 8, !invariant.load !278
  %multiply.2964.9 = fmul double %param_2.12688, %param_3.10049
  %add.4058.9 = fadd double %add.4051.9, %multiply.2964.9
  %subtract.224.1 = fsub double %add.4058.9, %add.4051.9
  %multiply.2994.1 = fmul double %subtract.224.1, 2.000000e+00
  %13 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2994.1, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_34(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2) local_unnamed_addr #2 {
entry:
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1510 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1510, 0
  %4 = add i64 %param_1.1510, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1510
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12525 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %subtract.222.12 = fsub double 1.000000e+00, %param_2.12525
  %multiply.2959.11 = fmul double %param_2.12525, %subtract.222.12
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp8 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp8, i64 %thread_id_x, i64 %.urem
  %param_1.1469 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1469, 0
  %4 = add i64 %param_1.1469, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1469
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.12105 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %subtract.222.10 = fsub double 1.000000e+00, %param_2.12105
  %multiply.2959.9 = fmul double %param_2.12105, %subtract.222.10
  %multiply.2992.3 = fmul double %multiply.2959.9, %multiply.2959.9
  %divide.613.3 = fdiv double 1.000000e+00, %multiply.2992.3
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg09, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.613.3, ptr addrspace(1) %9, align 8
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp12 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_1.1478 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1478, 0
  %4 = add i64 %param_1.1478, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1478
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.12805 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.9066 = load double, ptr addrspace(1) %9, align 8, !invariant.load !278
  %multiply.2962.16 = fmul double %param_4.9066, %param_4.9066
  %10 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.10129 = load double, ptr addrspace(1) %10, align 8, !invariant.load !278
  %subtract.222.24 = fsub double 1.000000e+00, %param_3.10129
  %multiply.2959.23 = fmul double %param_3.10129, %subtract.222.24
  %multiply.2963.15 = fmul double %multiply.2962.16, %multiply.2959.23
  %add.4056.13 = fadd double %param_2.12805, %multiply.2963.15
  %compare.1136.13 = fcmp ogt double %add.4056.13, 1.000000e-128
  %11 = select i1 %compare.1136.13, double %add.4056.13, double 0x7FF8000000000000
  %multiply.2993.3 = fmul double %11, %11
  %divide.614.3 = fdiv double 1.000000e+00, %multiply.2993.3
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %divide.614.3, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_31(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp14 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp14, i64 %thread_id_x, i64 %.urem
  %param_3.965 = load i64, ptr addrspace(1) %arg321, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_3.965, 0
  %4 = add i64 %param_3.965, 192
  %5 = select i1 %3, i64 %4, i64 %param_3.965
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %param_2.1208 = getelementptr inbounds [20 x [192 x [1 x double]]], ptr addrspace(1) %arg219, i64 0, i64 %2, i64 %7, i64 0
  %param_2.120812 = load double, ptr addrspace(1) %param_2.1208, align 8, !invariant.load !278
  %8 = getelementptr double, ptr addrspace(1) %arg117, i64 %thread_id_x
  %param_1.146713 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %subtract.223.3 = fsub double %param_2.120812, %param_1.146713
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg015, i64 0, i64 %7, i64 %1, i64 %2
  store double %subtract.223.3, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_33(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp6 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp6, i64 %thread_id_x, i64 %.urem
  %param_2.1254 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1254, 0
  %4 = add i64 %param_2.1254, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1254
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15125 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %subtract.222.1 = fsub double 1.000000e+00, %param_1.15125
  %9 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %7, i64 %1, i64 %2
  store double %subtract.222.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_26(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3) local_unnamed_addr #2 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp9 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp9, i64 %thread_id_x, i64 %.urem
  %param_2.1231 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_2.1231, 0
  %4 = add i64 %param_2.1231, 192
  %5 = select i1 %3, i64 %4, i64 %param_2.1231
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.14895 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.9776 = load double, ptr addrspace(1) %9, align 8, !invariant.load !278
  %subtract.222.14 = fsub double 1.000000e+00, %param_3.9776
  %multiply.2959.13 = fmul double %param_3.9776, %subtract.222.14
  %multiply.2960.3 = fmul double %param_1.14895, %multiply.2959.13
  %10 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg010, i64 0, i64 %7, i64 %1, i64 %2
  store double %multiply.2960.3, ptr addrspace(1) %10, align 8
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %.urem = add nsw i64 %thread_id_x, -20
  %.cmp12 = icmp ult i32 %0, 20
  %2 = select i1 %.cmp12, i64 %thread_id_x, i64 %.urem
  %param_1.1494 = load i64, ptr addrspace(1) %arg115, align 128, !invariant.load !278
  %3 = icmp slt i64 %param_1.1494, 0
  %4 = add i64 %param_1.1494, 192
  %5 = select i1 %3, i64 %4, i64 %param_1.1494
  %6 = tail call i64 @llvm.smax.i64(i64 %5, i64 0)
  %7 = tail call i64 @llvm.umin.i64(i64 %6, i64 191)
  %8 = getelementptr double, ptr addrspace(1) %arg217, i64 %thread_id_x
  %param_2.12775 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %9 = getelementptr double, ptr addrspace(1) %arg421, i64 %thread_id_x
  %param_4.9046 = load double, ptr addrspace(1) %9, align 8, !invariant.load !278
  %multiply.2962.18 = fmul double %param_4.9046, %param_4.9046
  %10 = getelementptr double, ptr addrspace(1) %arg319, i64 %thread_id_x
  %param_3.10109 = load double, ptr addrspace(1) %10, align 8, !invariant.load !278
  %subtract.222.26 = fsub double 1.000000e+00, %param_3.10109
  %multiply.2959.25 = fmul double %param_3.10109, %subtract.222.26
  %multiply.2963.17 = fmul double %multiply.2962.18, %multiply.2959.25
  %add.4056.15 = fadd double %param_2.12775, %multiply.2963.17
  %compare.1136.15 = fcmp ogt double %add.4056.15, 1.000000e-128
  %11 = select i1 %compare.1136.15, double %add.4056.15, double 0x7FF8000000000000
  %12 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg013, i64 0, i64 %7, i64 %1, i64 %2
  store double %11, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6) local_unnamed_addr #2 {
entry:
  %arg623 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1484 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.8965 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg623, i64 %thread_id_x
  %param_6.6396 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7797 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %multiply.2961.21 = fmul double %param_6.6396, %param_5.7797
  %add.4053.19 = fadd double %param_4.8965, %multiply.2961.21
  %4 = tail call double @llvm.fma.f64(double %add.4053.19, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #13
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #13
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.4053.19)
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
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.19) #13
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #13
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.4053.19, 0.000000e+00
  %30 = fadd double %add.4053.19, 0x7FF0000000000000
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
  %42 = trunc i64 %thread_id_x to i32
  %43 = trunc i64 %thread_id_x to i32
  %44 = icmp slt i64 %param_1.1484, 0
  %45 = add i64 %param_1.1484, 192
  %46 = select i1 %44, i64 %45, i64 %param_1.1484
  %47 = tail call i64 @llvm.smax.i64(i64 %46, i64 0)
  %48 = tail call i64 @llvm.umin.i64(i64 %47, i64 191)
  %.cmp10 = icmp ult i32 %43, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %49 = select i1 %.cmp10, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %42, 19
  %50 = zext i1 %.cmp to i64
  %compare.1135.15 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_3.974 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg317, i64 0, i64 %49
  %param_3.9748 = load double, ptr addrspace(1) %param_3.974, align 8, !invariant.load !278
  %51 = select i1 %compare.1135.15, double %z.2.i, double %param_3.9748
  %52 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12269 = load double, ptr addrspace(1) %52, align 8, !invariant.load !278
  %multiply.2966.7 = fmul double %51, %param_2.12269
  %53 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg011, i64 0, i64 %48, i64 %50, i64 %49
  store double %multiply.2966.7, ptr addrspace(1) %53, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7) local_unnamed_addr #2 {
entry:
  %arg726 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1525 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.12695 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7826 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg726, i64 %thread_id_x
  %param_7.4877 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %4 = getelementptr double, ptr addrspace(1) %arg624, i64 %thread_id_x
  %param_6.6448 = load double, ptr addrspace(1) %4, align 8, !invariant.load !278
  %multiply.2961.31 = fmul double %param_7.4877, %param_6.6448
  %add.4053.29 = fadd double %param_5.7826, %multiply.2961.31
  %5 = tail call double @llvm.fma.f64(double %add.4053.29, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #13
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #13
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.4053.29)
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
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.29) #13
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #13
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.4053.29, 0.000000e+00
  %31 = fadd double %add.4053.29, 0x7FF0000000000000
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
  %43 = trunc i64 %thread_id_x to i32
  %44 = trunc i64 %thread_id_x to i32
  %45 = icmp slt i64 %param_1.1525, 0
  %46 = add i64 %param_1.1525, 192
  %47 = select i1 %45, i64 %46, i64 %param_1.1525
  %48 = tail call i64 @llvm.smax.i64(i64 %47, i64 0)
  %49 = tail call i64 @llvm.umin.i64(i64 %48, i64 191)
  %.cmp11 = icmp ult i32 %44, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %50 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %43, 19
  %51 = zext i1 %.cmp to i64
  %compare.1135.25 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_4.899 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg420, i64 0, i64 %50
  %param_4.8999 = load double, ptr addrspace(1) %param_4.899, align 8, !invariant.load !278
  %52 = select i1 %compare.1135.25, double %z.2.i, double %param_4.8999
  %53 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.100510 = load double, ptr addrspace(1) %53, align 8, !invariant.load !278
  %multiply.2966.17 = fmul double %52, %param_3.100510
  %multiply.2967.7 = fmul double %param_2.12695, %multiply.2966.17
  %multiply.2998.1 = fmul double %multiply.2967.7, 2.000000e+00
  %54 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %49, i64 %51, i64 %50
  store double %multiply.2998.1, ptr addrspace(1) %54, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7) local_unnamed_addr #2 {
entry:
  %arg726 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1499 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.12415 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7806 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg726, i64 %thread_id_x
  %param_7.4857 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %4 = getelementptr double, ptr addrspace(1) %arg624, i64 %thread_id_x
  %param_6.6418 = load double, ptr addrspace(1) %4, align 8, !invariant.load !278
  %multiply.2961.27 = fmul double %param_7.4857, %param_6.6418
  %add.4053.25 = fadd double %param_5.7806, %multiply.2961.27
  %5 = tail call double @llvm.fma.f64(double %add.4053.25, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #13
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #13
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.4053.25)
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
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.25) #13
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #13
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.4053.25, 0.000000e+00
  %31 = fadd double %add.4053.25, 0x7FF0000000000000
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
  %43 = trunc i64 %thread_id_x to i32
  %44 = trunc i64 %thread_id_x to i32
  %45 = icmp slt i64 %param_1.1499, 0
  %46 = add i64 %param_1.1499, 192
  %47 = select i1 %45, i64 %46, i64 %param_1.1499
  %48 = tail call i64 @llvm.smax.i64(i64 %47, i64 0)
  %49 = tail call i64 @llvm.umin.i64(i64 %48, i64 191)
  %.cmp11 = icmp ult i32 %44, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %50 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %43, 19
  %51 = zext i1 %.cmp to i64
  %compare.1135.21 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_4.879 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg420, i64 0, i64 %50
  %param_4.8799 = load double, ptr addrspace(1) %param_4.879, align 8, !invariant.load !278
  %52 = select i1 %compare.1135.21, double %z.2.i, double %param_4.8799
  %53 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.98410 = load double, ptr addrspace(1) %53, align 8, !invariant.load !278
  %multiply.2966.13 = fmul double %52, %param_3.98410
  %multiply.2967.3 = fmul double %param_2.12415, %multiply.2966.13
  %multiply.2975.3 = fmul double %multiply.2967.3, %multiply.2967.3
  %54 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %49, i64 %51, i64 %50
  store double %multiply.2975.3, ptr addrspace(1) %54, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7) local_unnamed_addr #2 {
entry:
  %arg726 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1272 = load i64, ptr addrspace(1) %arg216, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg114, i64 %thread_id_x
  %param_1.15275 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7836 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg726, i64 %thread_id_x
  %param_7.4887 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %4 = getelementptr double, ptr addrspace(1) %arg624, i64 %thread_id_x
  %param_6.6458 = load double, ptr addrspace(1) %4, align 8, !invariant.load !278
  %multiply.2961.23 = fmul double %param_7.4887, %param_6.6458
  %add.4053.21 = fadd double %param_5.7836, %multiply.2961.23
  %5 = tail call double @llvm.fma.f64(double %add.4053.21, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #13
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #13
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.4053.21)
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
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.21) #13
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #13
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.4053.21, 0.000000e+00
  %31 = fadd double %add.4053.21, 0x7FF0000000000000
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
  %43 = trunc i64 %thread_id_x to i32
  %44 = trunc i64 %thread_id_x to i32
  %multiply.2982.9 = fmul double %param_1.15275, %param_1.15275
  %multiply.2984.7 = fmul double %multiply.2982.9, 5.000000e-01
  %45 = icmp slt i64 %param_2.1272, 0
  %46 = add i64 %param_2.1272, 192
  %47 = select i1 %45, i64 %46, i64 %param_2.1272
  %48 = tail call i64 @llvm.smax.i64(i64 %47, i64 0)
  %49 = tail call i64 @llvm.umin.i64(i64 %48, i64 191)
  %.cmp11 = icmp ult i32 %44, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %50 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %43, 19
  %51 = zext i1 %.cmp to i64
  %compare.1135.17 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_4.900 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg420, i64 0, i64 %50
  %param_4.9009 = load double, ptr addrspace(1) %param_4.900, align 8, !invariant.load !278
  %52 = select i1 %compare.1135.17, double %z.2.i, double %param_4.9009
  %53 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.100610 = load double, ptr addrspace(1) %53, align 8, !invariant.load !278
  %multiply.2966.9 = fmul double %52, %param_3.100610
  %multiply.2985.1 = fmul double %multiply.2984.7, %multiply.2966.9
  %54 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %49, i64 %51, i64 %50
  store double %multiply.2985.1, ptr addrspace(1) %54, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7) local_unnamed_addr #2 {
entry:
  %arg726 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1509 = load i64, ptr addrspace(1) %arg114, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg216, i64 %thread_id_x
  %param_2.12515 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = getelementptr double, ptr addrspace(1) %arg522, i64 %thread_id_x
  %param_5.7766 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %3 = getelementptr double, ptr addrspace(1) %arg726, i64 %thread_id_x
  %param_7.4817 = load double, ptr addrspace(1) %3, align 8, !invariant.load !278
  %4 = getelementptr double, ptr addrspace(1) %arg624, i64 %thread_id_x
  %param_6.6368 = load double, ptr addrspace(1) %4, align 8, !invariant.load !278
  %multiply.2961.33 = fmul double %param_7.4817, %param_6.6368
  %add.4053.31 = fadd double %param_5.7766, %multiply.2961.33
  %5 = tail call double @llvm.fma.f64(double %add.4053.31, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #13
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #13
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.4053.31)
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
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.4053.31) #13
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #13
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.4053.31, 0.000000e+00
  %31 = fadd double %add.4053.31, 0x7FF0000000000000
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
  %43 = trunc i64 %thread_id_x to i32
  %44 = trunc i64 %thread_id_x to i32
  %45 = icmp slt i64 %param_1.1509, 0
  %46 = add i64 %param_1.1509, 192
  %47 = select i1 %45, i64 %46, i64 %param_1.1509
  %48 = tail call i64 @llvm.smax.i64(i64 %47, i64 0)
  %49 = tail call i64 @llvm.umin.i64(i64 %48, i64 191)
  %.cmp11 = icmp ult i32 %44, 20
  %.urem = add nsw i64 %thread_id_x, -20
  %50 = select i1 %.cmp11, i64 %thread_id_x, i64 %.urem
  %.cmp = icmp ugt i32 %43, 19
  %51 = zext i1 %.cmp to i64
  %compare.1135.27 = fcmp ogt double %z.2.i, 1.000000e-128
  %param_4.883 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg420, i64 0, i64 %50
  %param_4.8839 = load double, ptr addrspace(1) %param_4.883, align 8, !invariant.load !278
  %52 = select i1 %compare.1135.27, double %z.2.i, double %param_4.8839
  %53 = getelementptr double, ptr addrspace(1) %arg318, i64 %thread_id_x
  %param_3.98910 = load double, ptr addrspace(1) %53, align 8, !invariant.load !278
  %multiply.2966.19 = fmul double %52, %param_3.98910
  %multiply.2967.9 = fmul double %param_2.12515, %multiply.2966.19
  %54 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %49, i64 %51, i64 %50
  store double %multiply.2967.9, ptr addrspace(1) %54, align 8
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !288
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg15, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !278
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
  %49 = urem i16 %.lhs.trunc1, 20
  %50 = udiv i16 %.lhs.trunc1, 40
  %add.4201.5 = fadd double %z.2.i, 1.000000e+00
  %divide.617.5 = fdiv double 1.000000e+00, %add.4201.5
  %subtract.226.2 = fsub double 1.000000e+00, %divide.617.5
  %51 = zext nneg i16 %50 to i64
  %52 = zext nneg i16 %49 to i64
  %53 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg03, i64 0, i64 %51, i64 %52
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !278
  %multiply.3032.3 = fmul double %54, %subtract.226.2
  %55 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg27, i64 0, i64 %51, i64 %52
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !278
  %multiply.3033.3 = fmul double %divide.617.5, %56
  %subtract.227.1 = fsub double %multiply.3032.3, %multiply.3033.3
  %57 = getelementptr double, ptr addrspace(1) %arg39, i64 %3
  store double %subtract.227.1, ptr addrspace(1) %57, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(46080) %arg1) local_unnamed_addr #2 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !289
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
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
  %7 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg115, i64 0, i64 %5, i64 %6, i64 0, i64 0
  store i32 %.zext12, ptr addrspace(1) %7, align 4
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 4
  store i32 %.zext, ptr addrspace(1) %8, align 4
  %9 = zext nneg i32 %linear_index to i64
  %10 = getelementptr i32, ptr addrspace(1) %arg013, i64 %9
  %11 = load i32, ptr addrspace(1) %10, align 4, !invariant.load !278
  %12 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 8
  store i32 %11, ptr addrspace(1) %12, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !280
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !284
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
define void @input_scatter_fusion_2(ptr noalias nocapture align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg1) local_unnamed_addr #10 {
entry:
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !289
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %param_1.1667 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg110, i64 0, i64 %5, i64 %6, i64 0, i64 0
  %param_1.16671 = load i32, ptr addrspace(1) %param_1.1667, align 4, !invariant.load !278
  %7 = icmp ult i32 %param_1.16671, 20
  %param_1.1667212 = getelementptr inbounds i8, ptr addrspace(1) %param_1.1667, i64 4
  %param_1.16673 = load i32, ptr addrspace(1) %param_1.1667212, align 4, !invariant.load !278
  %8 = icmp ult i32 %param_1.16673, 192
  %9 = and i1 %7, %8
  %param_1.1667413 = getelementptr inbounds i8, ptr addrspace(1) %param_1.1667, i64 8
  %param_1.16675 = load i32, ptr addrspace(1) %param_1.1667413, align 4, !invariant.load !278
  %10 = icmp ult i32 %param_1.16675, 2
  %11 = and i1 %9, %10
  %12 = zext nneg i32 %param_1.16671 to i64
  %13 = zext nneg i32 %param_1.16673 to i64
  %14 = zext nneg i32 %param_1.16675 to i64
  %15 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %12, i64 %13, i64 %14
  br i1 %11, label %scatter.in_bounds-true, label %scatter.13.1.in_bounds-after

scatter.13.1.in_bounds-after:                     ; preds = %entry, %scatter.in_bounds-true
  ret void

scatter.in_bounds-true:                           ; preds = %entry
  %16 = atomicrmw fadd ptr addrspace(1) %15, double 1.000000e+00 seq_cst, align 8
  br label %scatter.13.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_reduce_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg1) local_unnamed_addr #2 {
entry:
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !289
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 20
  %4 = mul i16 %3, 20
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %.decomposed to i64
  %6 = zext nneg i16 %3 to i64
  %7 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %6, i64 0
  %8 = load <2 x double>, ptr addrspace(1) %7, align 16, !invariant.load !278
  %9 = extractelement <2 x double> %8, i32 0
  %10 = extractelement <2 x double> %8, i32 1
  %add.3969.i = fadd double %9, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %10
  %11 = fneg double %add.3969.i.1
  %12 = zext nneg i32 %linear_index to i64
  %13 = getelementptr double, ptr addrspace(1) %arg19, i64 %12
  store double %11, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg5) local_unnamed_addr #2 {
entry:
  %arg5144 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4142 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3140 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2138 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1136 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0134 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !288
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 20
  %4 = mul i16 %3, 20
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = and i16 %3, 1
  %6 = udiv i16 %.lhs.trunc, 40
  %7 = zext nneg i16 %.decomposed to i64
  %8 = zext nneg i16 %6 to i64
  %9 = getelementptr [20 x [192 x [2 x double]]], ptr addrspace(1) %arg1136, i64 0, i64 %7, i64 %8, i64 0
  %10 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 8
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !278
  %12 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg0134, i64 0, i64 %8, i64 %7
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !278
  %14 = zext nneg i16 %5 to i64
  %15 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4142, i64 0, i64 %14, i64 %7
  %16 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg3140, i64 0, i64 %8, i64 %14, i64 %7
  %17 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg2138, i64 0, i64 %14, i64 %7
  %18 = load double, ptr addrspace(1) %15, align 8, !invariant.load !278
  %19 = tail call double @llvm.fma.f64(double %18, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #13
  %21 = tail call double @llvm.nvvm.add.rn.d(double %19, double 0xC338000000000000) #13
  %22 = tail call double @llvm.fma.f64(double %21, double 0xBFE62E42FEFA39EF, double %18)
  %23 = tail call double @llvm.fma.f64(double %21, double 0xBC7ABC9E3B39803F, double %22)
  %24 = tail call double @llvm.fma.f64(double %23, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %25 = tail call double @llvm.fma.f64(double %24, double %23, double 0x3EC71DEE62401315)
  %26 = tail call double @llvm.fma.f64(double %25, double %23, double 0x3EFA01997C89EB71)
  %27 = tail call double @llvm.fma.f64(double %26, double %23, double 0x3F2A01A014761F65)
  %28 = tail call double @llvm.fma.f64(double %27, double %23, double 0x3F56C16C1852B7AF)
  %29 = tail call double @llvm.fma.f64(double %28, double %23, double 0x3F81111111122322)
  %30 = tail call double @llvm.fma.f64(double %29, double %23, double 0x3FA55555555502A1)
  %31 = tail call double @llvm.fma.f64(double %30, double %23, double 0x3FC5555555555511)
  %32 = tail call double @llvm.fma.f64(double %31, double %23, double 0x3FE000000000000B)
  %33 = tail call double @llvm.fma.f64(double %32, double %23, double 1.000000e+00)
  %34 = tail call double @llvm.fma.f64(double %33, double %23, double 1.000000e+00)
  %35 = tail call i32 @llvm.nvvm.d2i.lo(double %34) #13
  %36 = tail call i32 @llvm.nvvm.d2i.hi(double %34) #13
  %37 = shl i32 %20, 20
  %38 = add i32 %36, %37
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 %35, i32 %38) #13
  %40 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #13
  %41 = bitcast i32 %40 to float
  %42 = tail call float @llvm.nvvm.fabs.f(float %41) #13
  %43 = fcmp olt float %42, 0x4010C46560000000
  br i1 %43, label %in_bounds-after30.1, label %__internal_fast_icmp_abs_lt.exit.i91.1

__internal_fast_icmp_abs_lt.exit.i91.1:           ; preds = %entry
  %44 = fcmp olt double %18, 0.000000e+00
  %45 = fadd double %18, 0x7FF0000000000000
  %z.0.i92.1 = select i1 %44, double 0.000000e+00, double %45
  %46 = fcmp olt float %42, 0x4010E90000000000
  br i1 %46, label %47, label %in_bounds-after30.1

47:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i91.1
  %48 = sdiv i32 %20, 2
  %49 = shl i32 %48, 20
  %50 = add i32 %36, %49
  %51 = tail call double @llvm.nvvm.lohi.i2d(i32 %35, i32 %50) #13
  %52 = sub nsw i32 %20, %48
  %53 = shl i32 %52, 20
  %54 = add nsw i32 %53, 1072693248
  %55 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %54) #13
  %56 = fmul double %55, %51
  br label %in_bounds-after30.1

in_bounds-after30.1:                              ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i91.1, %47
  %z.2.i93.1 = phi double [ %39, %entry ], [ %56, %47 ], [ %z.0.i92.1, %__internal_fast_icmp_abs_lt.exit.i91.1 ]
  %57 = load double, ptr addrspace(1) %16, align 8, !invariant.load !278
  %multiply.3034.531.1 = fmul double %z.2.i93.1, %57
  %58 = load double, ptr addrspace(1) %17, align 8, !invariant.load !278
  %add.4202.332.1 = fadd double %multiply.3034.531.1, %58
  %59 = fcmp ole double %add.4202.332.1, 0.000000e+00
  %maximum.40.i.1 = select i1 %59, double 0.000000e+00, double %add.4202.332.1
  %subtract.228.9 = fsub double 0.000000e+00, %maximum.40.i.1
  %60 = tail call double @llvm.fma.f64(double %subtract.228.9, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %61 = tail call i32 @llvm.nvvm.d2i.lo(double %60) #13
  %62 = tail call double @llvm.nvvm.add.rn.d(double %60, double 0xC338000000000000) #13
  %63 = tail call double @llvm.fma.f64(double %62, double 0xBFE62E42FEFA39EF, double %subtract.228.9)
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
  %81 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.228.9) #13
  %82 = bitcast i32 %81 to float
  %83 = tail call float @llvm.nvvm.fabs.f(float %82) #13
  %84 = fcmp olt float %83, 0x4010C46560000000
  br i1 %84, label %in_bounds-true.1, label %__internal_fast_icmp_abs_lt.exit.i95

__internal_fast_icmp_abs_lt.exit.i95:             ; preds = %in_bounds-after30.1
  %85 = fcmp olt double %subtract.228.9, 0.000000e+00
  %86 = fadd double %subtract.228.9, 0x7FF0000000000000
  %z.0.i96 = select i1 %85, double 0.000000e+00, double %86
  %87 = fcmp olt float %83, 0x4010E90000000000
  br i1 %87, label %88, label %in_bounds-true.1

88:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i95
  %89 = sdiv i32 %61, 2
  %90 = shl i32 %89, 20
  %91 = add i32 %77, %90
  %92 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 %91) #13
  %93 = sub nsw i32 %61, %89
  %94 = shl i32 %93, 20
  %95 = add nsw i32 %94, 1072693248
  %96 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %95) #13
  %97 = fmul double %96, %92
  br label %in_bounds-true.1

in_bounds-true.1:                                 ; preds = %88, %__internal_fast_icmp_abs_lt.exit.i95, %in_bounds-after30.1
  %z.2.i97 = phi double [ %80, %in_bounds-after30.1 ], [ %97, %88 ], [ %z.0.i96, %__internal_fast_icmp_abs_lt.exit.i95 ]
  %98 = fcmp olt float %42, 0x4010C46560000000
  br i1 %98, label %__nv_exp.exit.1, label %__internal_fast_icmp_abs_lt.exit.i.1

__internal_fast_icmp_abs_lt.exit.i.1:             ; preds = %in_bounds-true.1
  %99 = fcmp olt double %18, 0.000000e+00
  %100 = fadd double %18, 0x7FF0000000000000
  %z.0.i.1 = select i1 %99, double 0.000000e+00, double %100
  %101 = fcmp olt float %42, 0x4010E90000000000
  br i1 %101, label %102, label %__nv_exp.exit.1

102:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i.1
  %103 = sdiv i32 %20, 2
  %104 = shl i32 %103, 20
  %105 = add i32 %36, %104
  %106 = tail call double @llvm.nvvm.lohi.i2d(i32 %35, i32 %105) #13
  %107 = sub nsw i32 %20, %103
  %108 = shl i32 %107, 20
  %109 = add nsw i32 %108, 1072693248
  %110 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %109) #13
  %111 = fmul double %110, %106
  br label %__nv_exp.exit.1

__nv_exp.exit.1:                                  ; preds = %102, %__internal_fast_icmp_abs_lt.exit.i.1, %in_bounds-true.1
  %z.2.i.1 = phi double [ %39, %in_bounds-true.1 ], [ %111, %102 ], [ %z.0.i.1, %__internal_fast_icmp_abs_lt.exit.i.1 ]
  %112 = fcmp olt float %42, 0x4010C46560000000
  %multiply.3034.5.1 = fmul double %z.2.i.1, %57
  %add.4202.3.1 = fadd double %multiply.3034.5.1, %58
  br i1 %112, label %in_bounds-after30.1.1, label %__internal_fast_icmp_abs_lt.exit.i91.1.1

__internal_fast_icmp_abs_lt.exit.i91.1.1:         ; preds = %__nv_exp.exit.1
  %113 = fcmp olt double %18, 0.000000e+00
  %114 = fadd double %18, 0x7FF0000000000000
  %z.0.i92.1.1 = select i1 %113, double 0.000000e+00, double %114
  %115 = fcmp olt float %42, 0x4010E90000000000
  br i1 %115, label %116, label %in_bounds-after30.1.1

116:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i91.1.1
  %117 = sdiv i32 %20, 2
  %118 = shl i32 %117, 20
  %119 = add i32 %36, %118
  %120 = tail call double @llvm.nvvm.lohi.i2d(i32 %35, i32 %119) #13
  %121 = sub nsw i32 %20, %117
  %122 = shl i32 %121, 20
  %123 = add nsw i32 %122, 1072693248
  %124 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %123) #13
  %125 = fmul double %124, %120
  br label %in_bounds-after30.1.1

in_bounds-after30.1.1:                            ; preds = %__nv_exp.exit.1, %__internal_fast_icmp_abs_lt.exit.i91.1.1, %116
  %z.2.i93.1.1 = phi double [ %39, %__nv_exp.exit.1 ], [ %125, %116 ], [ %z.0.i92.1.1, %__internal_fast_icmp_abs_lt.exit.i91.1.1 ]
  %multiply.3034.531.1.1 = fmul double %z.2.i93.1.1, %57
  %add.4202.332.1.1 = fadd double %multiply.3034.531.1.1, %58
  %126 = fcmp ole double %add.4202.332.1.1, 0.000000e+00
  %maximum.40.i.1.1 = select i1 %126, double 0.000000e+00, double %add.4202.332.1.1
  %subtract.228.9.1 = fsub double %add.4202.3.1, %maximum.40.i.1.1
  %127 = tail call double @llvm.fma.f64(double %subtract.228.9.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %128 = tail call i32 @llvm.nvvm.d2i.lo(double %127) #13
  %129 = tail call double @llvm.nvvm.add.rn.d(double %127, double 0xC338000000000000) #13
  %130 = tail call double @llvm.fma.f64(double %129, double 0xBFE62E42FEFA39EF, double %subtract.228.9.1)
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
  %143 = tail call i32 @llvm.nvvm.d2i.lo(double %142) #13
  %144 = tail call i32 @llvm.nvvm.d2i.hi(double %142) #13
  %145 = shl i32 %128, 20
  %146 = add i32 %144, %145
  %147 = tail call double @llvm.nvvm.lohi.i2d(i32 %143, i32 %146) #13
  %148 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.228.9.1) #13
  %149 = bitcast i32 %148 to float
  %150 = tail call float @llvm.nvvm.fabs.f(float %149) #13
  %151 = fcmp olt float %150, 0x4010C46560000000
  br i1 %151, label %__nv_exp.exit98.1, label %__internal_fast_icmp_abs_lt.exit.i95.1

__internal_fast_icmp_abs_lt.exit.i95.1:           ; preds = %in_bounds-after30.1.1
  %152 = fcmp olt double %subtract.228.9.1, 0.000000e+00
  %153 = fadd double %subtract.228.9.1, 0x7FF0000000000000
  %z.0.i96.1 = select i1 %152, double 0.000000e+00, double %153
  %154 = fcmp olt float %150, 0x4010E90000000000
  br i1 %154, label %155, label %__nv_exp.exit98.1

155:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i95.1
  %156 = sdiv i32 %128, 2
  %157 = shl i32 %156, 20
  %158 = add i32 %144, %157
  %159 = tail call double @llvm.nvvm.lohi.i2d(i32 %143, i32 %158) #13
  %160 = sub nsw i32 %128, %156
  %161 = shl i32 %160, 20
  %162 = add nsw i32 %161, 1072693248
  %163 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %162) #13
  %164 = fmul double %163, %159
  br label %__nv_exp.exit98.1

__nv_exp.exit98.1:                                ; preds = %155, %__internal_fast_icmp_abs_lt.exit.i95.1, %in_bounds-after30.1.1
  %z.2.i97.1 = phi double [ %147, %in_bounds-after30.1.1 ], [ %164, %155 ], [ %z.0.i96.1, %__internal_fast_icmp_abs_lt.exit.i95.1 ]
  %165 = fcmp olt float %42, 0x4010C46560000000
  br i1 %165, label %__nv_exp.exit98.1.__nv_exp.exit102_crit_edge, label %__internal_fast_icmp_abs_lt.exit.i99

__nv_exp.exit98.1.__nv_exp.exit102_crit_edge:     ; preds = %__nv_exp.exit98.1
  %.pre = fadd double %18, 0x7FF0000000000000
  br label %__nv_exp.exit102

__internal_fast_icmp_abs_lt.exit.i99:             ; preds = %__nv_exp.exit98.1
  %166 = fcmp olt double %18, 0.000000e+00
  %167 = fadd double %18, 0x7FF0000000000000
  %z.0.i100 = select i1 %166, double 0.000000e+00, double %167
  %168 = fcmp olt float %42, 0x4010E90000000000
  br i1 %168, label %169, label %__nv_exp.exit102

169:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i99
  %170 = sdiv i32 %20, 2
  %171 = shl i32 %170, 20
  %172 = add i32 %36, %171
  %173 = tail call double @llvm.nvvm.lohi.i2d(i32 %35, i32 %172) #13
  %174 = sub nsw i32 %20, %170
  %175 = shl i32 %174, 20
  %176 = add nsw i32 %175, 1072693248
  %177 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %176) #13
  %178 = fmul double %177, %173
  br label %__nv_exp.exit102

__nv_exp.exit102:                                 ; preds = %__nv_exp.exit98.1.__nv_exp.exit102_crit_edge, %__internal_fast_icmp_abs_lt.exit.i99, %169
  %.pre-phi = phi double [ %.pre, %__nv_exp.exit98.1.__nv_exp.exit102_crit_edge ], [ %167, %__internal_fast_icmp_abs_lt.exit.i99 ], [ %167, %169 ]
  %z.2.i101 = phi double [ %39, %__nv_exp.exit98.1.__nv_exp.exit102_crit_edge ], [ %z.0.i100, %__internal_fast_icmp_abs_lt.exit.i99 ], [ %178, %169 ]
  %179 = fcmp olt float %42, 0x4010C46560000000
  %180 = fcmp olt double %18, 0.000000e+00
  %z.0.i104 = select i1 %180, double 0.000000e+00, double %.pre-phi
  %181 = fcmp uge float %42, 0x4010E90000000000
  %182 = sdiv i32 %20, 2
  %183 = shl i32 %182, 20
  %184 = add i32 %36, %183
  %185 = tail call double @llvm.nvvm.lohi.i2d(i32 %35, i32 %184) #13
  %186 = sub nsw i32 %20, %182
  %187 = shl i32 %186, 20
  %188 = add nsw i32 %187, 1072693248
  %189 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %188) #13
  %190 = fmul double %189, %185
  %.mux.1 = select i1 %181, double %z.0.i104, double %190
  %z.2.i105.1 = select i1 %179, double %39, double %.mux.1
  %multiply.3034.581.1 = fmul double %57, %z.2.i105.1
  %add.4202.382.1 = fadd double %58, %multiply.3034.581.1
  %191 = fcmp ole double %add.4202.382.1, 0.000000e+00
  %maximum.40.i111.1 = select i1 %191, double 0.000000e+00, double %add.4202.382.1
  %multiply.3034.554 = fmul double %z.2.i101, %57
  %add.4202.355 = fadd double %multiply.3034.554, %58
  %subtract.228.987 = fsub double %add.4202.355, %maximum.40.i111.1
  %192 = tail call double @llvm.fma.f64(double %subtract.228.987, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %193 = tail call i32 @llvm.nvvm.d2i.lo(double %192) #13
  %194 = tail call double @llvm.nvvm.add.rn.d(double %192, double 0xC338000000000000) #13
  %195 = tail call double @llvm.fma.f64(double %194, double 0xBFE62E42FEFA39EF, double %subtract.228.987)
  %196 = tail call double @llvm.fma.f64(double %194, double 0xBC7ABC9E3B39803F, double %195)
  %197 = tail call double @llvm.fma.f64(double %196, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %198 = tail call double @llvm.fma.f64(double %197, double %196, double 0x3EC71DEE62401315)
  %199 = tail call double @llvm.fma.f64(double %198, double %196, double 0x3EFA01997C89EB71)
  %200 = tail call double @llvm.fma.f64(double %199, double %196, double 0x3F2A01A014761F65)
  %201 = tail call double @llvm.fma.f64(double %200, double %196, double 0x3F56C16C1852B7AF)
  %202 = tail call double @llvm.fma.f64(double %201, double %196, double 0x3F81111111122322)
  %203 = tail call double @llvm.fma.f64(double %202, double %196, double 0x3FA55555555502A1)
  %204 = tail call double @llvm.fma.f64(double %203, double %196, double 0x3FC5555555555511)
  %205 = tail call double @llvm.fma.f64(double %204, double %196, double 0x3FE000000000000B)
  %206 = tail call double @llvm.fma.f64(double %205, double %196, double 1.000000e+00)
  %207 = tail call double @llvm.fma.f64(double %206, double %196, double 1.000000e+00)
  %208 = tail call i32 @llvm.nvvm.d2i.lo(double %207) #13
  %209 = tail call i32 @llvm.nvvm.d2i.hi(double %207) #13
  %210 = shl i32 %193, 20
  %211 = add i32 %209, %210
  %212 = tail call double @llvm.nvvm.lohi.i2d(i32 %208, i32 %211) #13
  %213 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.228.987) #13
  %214 = bitcast i32 %213 to float
  %215 = tail call float @llvm.nvvm.fabs.f(float %214) #13
  %216 = fcmp olt float %215, 0x4010C46560000000
  br i1 %216, label %__nv_exp.exit110, label %__internal_fast_icmp_abs_lt.exit.i107

__internal_fast_icmp_abs_lt.exit.i107:            ; preds = %__nv_exp.exit102
  %217 = fcmp olt double %subtract.228.987, 0.000000e+00
  %218 = fadd double %subtract.228.987, 0x7FF0000000000000
  %z.0.i108 = select i1 %217, double 0.000000e+00, double %218
  %219 = fcmp olt float %215, 0x4010E90000000000
  br i1 %219, label %220, label %__nv_exp.exit110

220:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i107
  %221 = sdiv i32 %193, 2
  %222 = shl i32 %221, 20
  %223 = add i32 %209, %222
  %224 = tail call double @llvm.nvvm.lohi.i2d(i32 %208, i32 %223) #13
  %225 = sub nsw i32 %193, %221
  %226 = shl i32 %225, 20
  %227 = add nsw i32 %226, 1072693248
  %228 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %227) #13
  %229 = fmul double %228, %224
  br label %__nv_exp.exit110

__nv_exp.exit110:                                 ; preds = %__nv_exp.exit102, %__internal_fast_icmp_abs_lt.exit.i107, %220
  %z.2.i109 = phi double [ %212, %__nv_exp.exit102 ], [ %229, %220 ], [ %z.0.i108, %__internal_fast_icmp_abs_lt.exit.i107 ]
  %add.3969.i = fadd double %z.2.i97, 0.000000e+00
  %add.3969.i.1 = fadd double %add.3969.i, %z.2.i97.1
  %divide.618.3 = fdiv double %13, %add.3969.i.1
  %multiply.3035.1 = fmul double %divide.618.3, %z.2.i109
  %add.4204.1 = fadd double %11, %multiply.3035.1
  %230 = zext nneg i32 %linear_index to i64
  %231 = getelementptr double, ptr addrspace(1) %arg5144, i64 %230
  store double %add.4204.1, ptr addrspace(1) %231, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(24) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg2) local_unnamed_addr #2 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !289
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %7 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg110, i64 0, i64 %5, i64 %6, i64 0, i64 0
  %8 = load i32, ptr addrspace(1) %7, align 4, !invariant.load !278
  %9 = sext i32 %8 to i64
  %10 = icmp sgt i32 %8, -1
  %11 = load <2 x i64>, ptr addrspace(1) %arg08, align 128, !invariant.load !278
  %12 = extractelement <2 x i64> %11, i32 0
  %13 = extractelement <2 x i64> %11, i32 1
  %14 = icmp sge i64 %12, %9
  %15 = and i1 %10, %14
  %16 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 4
  %17 = load i32, ptr addrspace(1) %16, align 4, !invariant.load !278
  %18 = sext i32 %17 to i64
  %19 = icmp sgt i32 %17, -1
  %20 = icmp sge i64 %13, %18
  %21 = and i1 %19, %20
  %22 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 8
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !278
  %24 = sext i32 %23 to i64
  %25 = icmp sgt i32 %23, -1
  %26 = getelementptr inbounds i8, ptr addrspace(1) %arg08, i64 16
  %27 = load i64, ptr addrspace(1) %26, align 16, !invariant.load !278
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
define void @input_multiply_reduce_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg12) local_unnamed_addr #4 {
entry:
  %arg12253 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11251 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10249 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9247 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8245 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7243 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6241 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5239 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4237 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3235 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2233 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1231 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0229 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !284
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %.not = icmp eq i32 %block.id.x, 0
  %tile_bound.2 = select i1 %.not, i32 32, i32 8
  %tile_origin.2 = shl i32 %block.id.x, 5
  %1 = or disjoint i32 %tile_origin.2, %thread.id.2
  %.lhs.trunc = trunc nuw nsw i32 %1 to i8
  %2 = urem i8 %.lhs.trunc, 20
  %3 = udiv i8 %.lhs.trunc, 20
  %4 = zext nneg i8 %3 to i64
  %5 = zext nneg i8 %2 to i64
  %param_6.1900 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6241, i64 0, i64 %4, i64 %5
  %6 = and i32 %thread.id.x, 1
  %7 = zext i32 %6 to i64
  %8 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %9 = add nuw nsw i32 %0, -32
  %10 = mul nuw nsw i32 %0, 40
  %11 = add i32 %10, %tile_origin.2
  %12 = add i32 %11, %thread.id.2
  %13 = zext nneg i32 %12 to i64
  %14 = lshr i64 %13, 1
  %scevgep = getelementptr i8, ptr addrspace(1) %arg9247, i64 %14
  %15 = shl nuw nsw i64 %14, 4
  %16 = shl nuw nsw i64 %7, 3
  %17 = add i64 %15, %16
  %scevgep313 = getelementptr i8, ptr addrspace(1) %arg12253, i64 %17
  %18 = lshr i32 %12, 1
  %19 = trunc i32 %block.id.x to i8
  %20 = shl nuw nsw i8 %19, 5
  %21 = trunc i32 %thread.id.x to i5
  %22 = zext i5 %21 to i8
  %23 = add i8 %20, %22
  %24 = udiv i8 %23, 20
  %25 = mul nuw nsw i8 %24, 20
  %26 = sub i8 %23, %25
  %27 = zext i8 %26 to i64
  %28 = shl nuw nsw i64 %27, 3
  %29 = zext nneg i32 %thread.id.x to i64
  %30 = lshr i64 %29, 5
  %31 = mul nuw nsw i64 %30, 320
  %32 = zext nneg i8 %23 to i64
  %33 = trunc i64 %32 to i32
  %34 = udiv i32 %33, 20
  %35 = zext i32 %34 to i64
  %36 = mul nuw nsw i64 %35, 160
  %37 = add i64 %31, %36
  %scevgep319 = getelementptr i8, ptr addrspace(1) %arg1231, i64 %37
  %scevgep323 = getelementptr i8, ptr addrspace(1) %arg0229, i64 %37
  %38 = mul nuw nsw i64 %30, 160
  %scevgep327 = getelementptr i8, ptr addrspace(1) %arg5239, i64 %38
  %scevgep331 = getelementptr i8, ptr addrspace(1) %arg4237, i64 %38
  %scevgep335 = getelementptr i8, ptr addrspace(1) %arg3235, i64 %37
  %scevgep339 = getelementptr i8, ptr addrspace(1) %arg2233, i64 %37
  %scevgep343 = getelementptr i8, ptr addrspace(1) %arg11251, i64 %37
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv344 = phi ptr addrspace(1) [ %scevgep343, %entry ], [ %scevgep345, %x_in_tile-after ]
  %lsr.iv340 = phi ptr addrspace(1) [ %scevgep339, %entry ], [ %scevgep341, %x_in_tile-after ]
  %lsr.iv336 = phi ptr addrspace(1) [ %scevgep335, %entry ], [ %scevgep337, %x_in_tile-after ]
  %lsr.iv332 = phi ptr addrspace(1) [ %scevgep331, %entry ], [ %scevgep333, %x_in_tile-after ]
  %lsr.iv328 = phi ptr addrspace(1) [ %scevgep327, %entry ], [ %scevgep329, %x_in_tile-after ]
  %lsr.iv324 = phi ptr addrspace(1) [ %scevgep323, %entry ], [ %scevgep325, %x_in_tile-after ]
  %lsr.iv320 = phi ptr addrspace(1) [ %scevgep319, %entry ], [ %scevgep321, %x_in_tile-after ]
  %lsr.iv317 = phi i32 [ %18, %entry ], [ %lsr.iv.next318, %x_in_tile-after ]
  %lsr.iv314 = phi ptr addrspace(1) [ %scevgep313, %entry ], [ %scevgep315, %x_in_tile-after ]
  %lsr.iv310 = phi i64 [ %14, %entry ], [ %lsr.iv.next311, %x_in_tile-after ]
  %lsr.iv308 = phi i64 [ %13, %entry ], [ %lsr.iv.next309, %x_in_tile-after ]
  %lsr.iv306 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep307, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %9, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.0206 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %39 = icmp ult i32 %thread.id.2, %tile_bound.2
  %lsr347 = trunc i64 %lsr.iv308 to i32
  %40 = udiv i64 %lsr.iv308, 384
  %41 = mul nuw nsw i64 %40, 192
  %42 = udiv i64 %lsr.iv310, 192
  %43 = mul nuw nsw i64 %42, 192
  %44 = sub i64 %41, %43
  %scevgep312 = getelementptr i8, ptr addrspace(1) %lsr.iv306, i64 %44
  %45 = mul nuw nsw i64 %40, 3072
  %46 = mul nuw nsw i64 %42, 3072
  %47 = sub i64 %45, %46
  %scevgep316 = getelementptr i8, ptr addrspace(1) %lsr.iv314, i64 %47
  %48 = udiv i32 %lsr347, 384
  %49 = mul nuw nsw i32 %48, 192
  %50 = add i32 %lsr.iv317, %49
  %51 = udiv i32 %lsr.iv317, 192
  %52 = mul nuw nsw i32 %51, 192
  %53 = sub i32 %50, %52
  br i1 %39, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %__nv_log.exit, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.3969.i196, %__nv_log.exit ], [ %partial_reduction_result.0206, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %lsr.iv.next309 = add nuw nsw i64 %lsr.iv308, 1280
  %scevgep307 = getelementptr i8, ptr addrspace(1) %lsr.iv306, i64 640
  %lsr.iv.next311 = add nuw nsw i64 %lsr.iv310, 640
  %scevgep315 = getelementptr i8, ptr addrspace(1) %lsr.iv314, i64 10240
  %lsr.iv.next318 = add nuw nsw i32 %lsr.iv317, 640
  %scevgep321 = getelementptr i8, ptr addrspace(1) %lsr.iv320, i64 10240
  %scevgep325 = getelementptr i8, ptr addrspace(1) %lsr.iv324, i64 10240
  %scevgep329 = getelementptr i8, ptr addrspace(1) %lsr.iv328, i64 5120
  %scevgep333 = getelementptr i8, ptr addrspace(1) %lsr.iv332, i64 5120
  %scevgep337 = getelementptr i8, ptr addrspace(1) %lsr.iv336, i64 10240
  %scevgep341 = getelementptr i8, ptr addrspace(1) %lsr.iv340, i64 10240
  %scevgep345 = getelementptr i8, ptr addrspace(1) %lsr.iv344, i64 10240
  %54 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %54, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !290

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %55 = zext nneg i32 %thread.id.2 to i64
  %56 = zext nneg i32 %0 to i64
  %57 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 %55, i64 %56
  store double %partial_reduction_result.1, ptr addrspace(3) %57, align 8
  tail call void @llvm.nvvm.barrier0()
  %58 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 %56, i64 %55
  %partial_reduction_result136162163 = load <2 x i32>, ptr addrspace(3) %58, align 8
  %59 = extractelement <2 x i32> %partial_reduction_result136162163, i64 0
  %60 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %59, i32 16, i32 31)
  %61 = insertelement <2 x i32> poison, i32 %60, i64 0
  %62 = extractelement <2 x i32> %partial_reduction_result136162163, i64 1
  %63 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %62, i32 16, i32 31)
  %64 = insertelement <2 x i32> %61, i32 %63, i64 1
  %65 = bitcast <2 x i32> %64 to double
  %66 = bitcast <2 x i32> %partial_reduction_result136162163 to double
  %add.3969.i = fadd double %66, %65
  %67 = bitcast double %add.3969.i to <2 x i32>
  %68 = extractelement <2 x i32> %67, i64 0
  %69 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %68, i32 8, i32 31)
  %70 = insertelement <2 x i32> poison, i32 %69, i64 0
  %71 = extractelement <2 x i32> %67, i64 1
  %72 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %71, i32 8, i32 31)
  %73 = insertelement <2 x i32> %70, i32 %72, i64 1
  %74 = bitcast <2 x i32> %73 to double
  %add.3969.i192 = fadd double %add.3969.i, %74
  %75 = bitcast double %add.3969.i192 to <2 x i32>
  %76 = extractelement <2 x i32> %75, i64 0
  %77 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %76, i32 4, i32 31)
  %78 = insertelement <2 x i32> poison, i32 %77, i64 0
  %79 = extractelement <2 x i32> %75, i64 1
  %80 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %79, i32 4, i32 31)
  %81 = insertelement <2 x i32> %78, i32 %80, i64 1
  %82 = bitcast <2 x i32> %81 to double
  %add.3969.i193 = fadd double %add.3969.i192, %82
  %83 = bitcast double %add.3969.i193 to <2 x i32>
  %84 = extractelement <2 x i32> %83, i64 0
  %85 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %84, i32 2, i32 31)
  %86 = insertelement <2 x i32> poison, i32 %85, i64 0
  %87 = extractelement <2 x i32> %83, i64 1
  %88 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %87, i32 2, i32 31)
  %89 = insertelement <2 x i32> %86, i32 %88, i64 1
  %90 = bitcast <2 x i32> %89 to double
  %add.3969.i194 = fadd double %add.3969.i193, %90
  %91 = bitcast double %add.3969.i194 to <2 x i32>
  %92 = extractelement <2 x i32> %91, i64 0
  %93 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %92, i32 1, i32 31)
  %94 = insertelement <2 x i32> poison, i32 %93, i64 0
  %95 = extractelement <2 x i32> %91, i64 1
  %96 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %95, i32 1, i32 31)
  %97 = insertelement <2 x i32> %94, i32 %96, i64 1
  %98 = bitcast <2 x i32> %97 to double
  %add.3969.i195 = fadd double %add.3969.i194, %98
  store double %add.3969.i195, ptr addrspace(3) %58, align 8
  %99 = icmp ult i32 %0, %tile_bound.2
  %100 = icmp eq i32 %thread.id.2, 0
  %101 = and i1 %100, %99
  br i1 %101, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %scevgep322 = getelementptr i8, ptr addrspace(1) %lsr.iv320, i64 %28
  %param_1.33242 = load double, ptr addrspace(1) %scevgep322, align 8, !invariant.load !278
  %scevgep326 = getelementptr i8, ptr addrspace(1) %lsr.iv324, i64 %28
  %param_0.23743 = load double, ptr addrspace(1) %scevgep326, align 8, !invariant.load !278
  %multiply.3048.3 = fmul double %param_1.33242, %param_0.23743
  %add.3969.i196 = fadd double %partial_reduction_result.0206, %multiply.3048.3
  %param_6.19004 = load double, ptr addrspace(1) %param_6.1900, align 8, !invariant.load !278
  %102 = tail call double @llvm.fma.f64(double %param_6.19004, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %103 = tail call i32 @llvm.nvvm.d2i.lo(double %102) #13
  %104 = tail call double @llvm.nvvm.add.rn.d(double %102, double 0xC338000000000000) #13
  %105 = tail call double @llvm.fma.f64(double %104, double 0xBFE62E42FEFA39EF, double %param_6.19004)
  %106 = tail call double @llvm.fma.f64(double %104, double 0xBC7ABC9E3B39803F, double %105)
  %107 = tail call double @llvm.fma.f64(double %106, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %108 = tail call double @llvm.fma.f64(double %107, double %106, double 0x3EC71DEE62401315)
  %109 = tail call double @llvm.fma.f64(double %108, double %106, double 0x3EFA01997C89EB71)
  %110 = tail call double @llvm.fma.f64(double %109, double %106, double 0x3F2A01A014761F65)
  %111 = tail call double @llvm.fma.f64(double %110, double %106, double 0x3F56C16C1852B7AF)
  %112 = tail call double @llvm.fma.f64(double %111, double %106, double 0x3F81111111122322)
  %113 = tail call double @llvm.fma.f64(double %112, double %106, double 0x3FA55555555502A1)
  %114 = tail call double @llvm.fma.f64(double %113, double %106, double 0x3FC5555555555511)
  %115 = tail call double @llvm.fma.f64(double %114, double %106, double 0x3FE000000000000B)
  %116 = tail call double @llvm.fma.f64(double %115, double %106, double 1.000000e+00)
  %117 = tail call double @llvm.fma.f64(double %116, double %106, double 1.000000e+00)
  %118 = tail call i32 @llvm.nvvm.d2i.lo(double %117) #13
  %119 = tail call i32 @llvm.nvvm.d2i.hi(double %117) #13
  %120 = shl i32 %103, 20
  %121 = add i32 %119, %120
  %122 = tail call double @llvm.nvvm.lohi.i2d(i32 %118, i32 %121) #13
  %123 = tail call i32 @llvm.nvvm.d2i.hi(double %param_6.19004) #13
  %124 = bitcast i32 %123 to float
  %125 = tail call float @llvm.nvvm.fabs.f(float %124) #13
  %126 = fcmp olt float %125, 0x4010C46560000000
  br i1 %126, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true
  %127 = fcmp olt double %param_6.19004, 0.000000e+00
  %128 = fadd double %param_6.19004, 0x7FF0000000000000
  %z.0.i = select i1 %127, double 0.000000e+00, double %128
  %129 = fcmp olt float %125, 0x4010E90000000000
  br i1 %129, label %130, label %__nv_exp.exit

130:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %131 = sdiv i32 %103, 2
  %132 = shl i32 %131, 20
  %133 = add i32 %119, %132
  %134 = tail call double @llvm.nvvm.lohi.i2d(i32 %118, i32 %133) #13
  %135 = sub nsw i32 %103, %131
  %136 = shl i32 %135, 20
  %137 = add nsw i32 %136, 1072693248
  %138 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %137) #13
  %139 = fmul double %138, %134
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true, %__internal_fast_icmp_abs_lt.exit.i, %130
  %z.2.i = phi double [ %122, %x_in_tile-true ], [ %139, %130 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3038.3.clone.1 = fmul double %param_1.33242, %z.2.i
  %scevgep330 = getelementptr i8, ptr addrspace(1) %lsr.iv328, i64 %28
  %param_5.24197 = load double, ptr addrspace(1) %scevgep330, align 8, !invariant.load !278
  %scevgep334 = getelementptr i8, ptr addrspace(1) %lsr.iv332, i64 %28
  %param_4.28688 = load double, ptr addrspace(1) %scevgep334, align 8, !invariant.load !278
  %140 = fneg double %multiply.3038.3.clone.1
  %141 = fmul double %param_4.28688, %140
  %142 = fmul double %multiply.3038.3.clone.1, %param_5.24197
  %add.4208.1.clone.1 = fsub double %141, %142
  %scevgep338 = getelementptr i8, ptr addrspace(1) %lsr.iv336, i64 %28
  %param_3.41369 = load double, ptr addrspace(1) %scevgep338, align 8, !invariant.load !278
  %143 = fcmp ole double %param_3.41369, -3.000000e+01
  %144 = select i1 %143, double -3.000000e+01, double %param_3.41369
  %145 = fcmp oge double %144, 3.000000e+01
  %146 = select i1 %145, double 3.000000e+01, double %144
  %147 = fneg double %146
  %148 = tail call double @llvm.fma.f64(double %147, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %149 = tail call i32 @llvm.nvvm.d2i.lo(double %148) #13
  %150 = tail call double @llvm.nvvm.add.rn.d(double %148, double 0xC338000000000000) #13
  %151 = tail call double @llvm.fma.f64(double %150, double 0xBFE62E42FEFA39EF, double %147)
  %152 = tail call double @llvm.fma.f64(double %150, double 0xBC7ABC9E3B39803F, double %151)
  %153 = tail call double @llvm.fma.f64(double %152, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %154 = tail call double @llvm.fma.f64(double %153, double %152, double 0x3EC71DEE62401315)
  %155 = tail call double @llvm.fma.f64(double %154, double %152, double 0x3EFA01997C89EB71)
  %156 = tail call double @llvm.fma.f64(double %155, double %152, double 0x3F2A01A014761F65)
  %157 = tail call double @llvm.fma.f64(double %156, double %152, double 0x3F56C16C1852B7AF)
  %158 = tail call double @llvm.fma.f64(double %157, double %152, double 0x3F81111111122322)
  %159 = tail call double @llvm.fma.f64(double %158, double %152, double 0x3FA55555555502A1)
  %160 = tail call double @llvm.fma.f64(double %159, double %152, double 0x3FC5555555555511)
  %161 = tail call double @llvm.fma.f64(double %160, double %152, double 0x3FE000000000000B)
  %162 = tail call double @llvm.fma.f64(double %161, double %152, double 1.000000e+00)
  %163 = tail call double @llvm.fma.f64(double %162, double %152, double 1.000000e+00)
  %164 = tail call i32 @llvm.nvvm.d2i.lo(double %163) #13
  %165 = tail call i32 @llvm.nvvm.d2i.hi(double %163) #13
  %166 = shl i32 %149, 20
  %167 = add i32 %165, %166
  %168 = tail call double @llvm.nvvm.lohi.i2d(i32 %164, i32 %167) #13
  %169 = tail call i32 @llvm.nvvm.d2i.hi(double %147) #13
  %170 = bitcast i32 %169 to float
  %171 = tail call float @llvm.nvvm.fabs.f(float %170) #13
  %172 = fcmp olt float %171, 0x4010C46560000000
  br i1 %172, label %__nv_exp.exit167, label %__internal_fast_icmp_abs_lt.exit.i164

__internal_fast_icmp_abs_lt.exit.i164:            ; preds = %__nv_exp.exit
  %173 = fcmp ogt double %146, 0.000000e+00
  %174 = fsub double 0x7FF0000000000000, %146
  %z.0.i165 = select i1 %173, double 0.000000e+00, double %174
  %175 = fcmp olt float %171, 0x4010E90000000000
  br i1 %175, label %176, label %__nv_exp.exit167

176:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i164
  %177 = sdiv i32 %149, 2
  %178 = shl i32 %177, 20
  %179 = add i32 %165, %178
  %180 = tail call double @llvm.nvvm.lohi.i2d(i32 %164, i32 %179) #13
  %181 = sub nsw i32 %149, %177
  %182 = shl i32 %181, 20
  %183 = add nsw i32 %182, 1072693248
  %184 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %183) #13
  %185 = fmul double %184, %180
  br label %__nv_exp.exit167

__nv_exp.exit167:                                 ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i164, %176
  %z.2.i166 = phi double [ %168, %__nv_exp.exit ], [ %185, %176 ], [ %z.0.i165, %__internal_fast_icmp_abs_lt.exit.i164 ]
  %add.4201.7.clone.1 = fadd double %z.2.i166, 1.000000e+00
  %divide.617.7.clone.1 = fdiv double 1.000000e+00, %add.4201.7.clone.1
  %subtract.226.1.clone.1 = fsub double 1.000000e+00, %divide.617.7.clone.1
  %multiply.3041.1.clone.1 = fmul double %divide.617.7.clone.1, %subtract.226.1.clone.1
  %multiply.3042.1.clone.1 = fmul double %add.4208.1.clone.1, %multiply.3041.1.clone.1
  %compare.1151.1.clone.1 = fcmp oeq double %144, %146
  %scevgep342 = getelementptr i8, ptr addrspace(1) %lsr.iv340, i64 %28
  %param_2.565712 = load double, ptr addrspace(1) %scevgep342, align 8, !invariant.load !278
  %186 = select i1 %compare.1151.1.clone.1, double 1.000000e+00, double %param_2.565712
  %compare.1152.1.clone.1 = fcmp oeq double %146, 3.000000e+01
  %187 = select i1 %compare.1152.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.619.5.clone.1 = fdiv double %186, %187
  %multiply.3044.3.clone.1 = fmul double %divide.619.5.clone.1, %multiply.3042.1.clone.1
  %compare.1153.1.clone.1 = fcmp oeq double %param_3.41369, %144
  %188 = select i1 %compare.1153.1.clone.1, double 1.000000e+00, double %param_2.565712
  %compare.1154.1.clone.1 = fcmp oeq double %144, -3.000000e+01
  %189 = select i1 %compare.1154.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.620.3.clone.1 = fdiv double %188, %189
  %multiply.3045.1.clone.1 = fmul double %divide.620.3.clone.1, %multiply.3044.3.clone.1
  %param_9.135117 = load i8, ptr addrspace(1) %scevgep312, align 1, !invariant.load !278
  %.frozen = freeze i32 %53
  %190 = udiv i32 %.frozen, 192
  %191 = mul i32 %190, 192
  %.decomposed = sub i32 %.frozen, %191
  %192 = zext nneg i32 %190 to i64
  %193 = zext nneg i32 %.decomposed to i64
  %param_7.1676 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg7243, i64 0, i64 %192, i64 %193, i64 0, i64 0
  %param_7.167618 = load i32, ptr addrspace(1) %param_7.1676, align 4, !invariant.load !278
  %narrow = tail call i32 @llvm.smax.i32(i32 %param_7.167618, i32 0)
  %194 = tail call i32 @llvm.umin.i32(i32 %narrow, i32 19)
  %param_7.167619255 = getelementptr inbounds i8, ptr addrspace(1) %param_7.1676, i64 4
  %param_7.167620 = load i32, ptr addrspace(1) %param_7.167619255, align 4, !invariant.load !278
  %narrow157 = tail call i32 @llvm.smax.i32(i32 %param_7.167620, i32 0)
  %195 = tail call i32 @llvm.umin.i32(i32 %narrow157, i32 191)
  %param_7.167621256 = getelementptr inbounds i8, ptr addrspace(1) %param_7.1676, i64 8
  %param_7.167622 = load i32, ptr addrspace(1) %param_7.167621256, align 4, !invariant.load !278
  %196 = icmp sgt i32 %param_7.167622, 0
  %197 = zext nneg i32 %194 to i64
  br i1 %196, label %in_bounds-true, label %__nv_exp.exit167.in_bounds-after_crit_edge

__nv_exp.exit167.in_bounds-after_crit_edge:       ; preds = %__nv_exp.exit167
  %.pre224 = zext nneg i32 %195 to i64
  %param_6.190057.phi.trans.insert = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6241, i64 0, i64 %7, i64 %197
  %param_6.190058.1.pre = load double, ptr addrspace(1) %param_6.190057.phi.trans.insert, align 8, !invariant.load !278
  %.pre = tail call double @llvm.fma.f64(double %param_6.190058.1.pre, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %.pre258 = tail call i32 @llvm.nvvm.d2i.lo(double %.pre) #13
  %.pre260 = tail call double @llvm.nvvm.add.rn.d(double %.pre, double 0xC338000000000000) #13
  %.pre262 = tail call double @llvm.fma.f64(double %.pre260, double 0xBFE62E42FEFA39EF, double %param_6.190058.1.pre)
  %.pre264 = tail call double @llvm.fma.f64(double %.pre260, double 0xBC7ABC9E3B39803F, double %.pre262)
  %.pre266 = tail call double @llvm.fma.f64(double %.pre264, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %.pre268 = tail call double @llvm.fma.f64(double %.pre266, double %.pre264, double 0x3EC71DEE62401315)
  %.pre270 = tail call double @llvm.fma.f64(double %.pre268, double %.pre264, double 0x3EFA01997C89EB71)
  %.pre272 = tail call double @llvm.fma.f64(double %.pre270, double %.pre264, double 0x3F2A01A014761F65)
  %.pre274 = tail call double @llvm.fma.f64(double %.pre272, double %.pre264, double 0x3F56C16C1852B7AF)
  %.pre276 = tail call double @llvm.fma.f64(double %.pre274, double %.pre264, double 0x3F81111111122322)
  %.pre278 = tail call double @llvm.fma.f64(double %.pre276, double %.pre264, double 0x3FA55555555502A1)
  %.pre280 = tail call double @llvm.fma.f64(double %.pre278, double %.pre264, double 0x3FC5555555555511)
  %.pre282 = tail call double @llvm.fma.f64(double %.pre280, double %.pre264, double 0x3FE000000000000B)
  %.pre284 = tail call double @llvm.fma.f64(double %.pre282, double %.pre264, double 1.000000e+00)
  %.pre286 = tail call double @llvm.fma.f64(double %.pre284, double %.pre264, double 1.000000e+00)
  %.pre288 = tail call i32 @llvm.nvvm.d2i.lo(double %.pre286) #13
  %.pre290 = tail call i32 @llvm.nvvm.d2i.hi(double %.pre286) #13
  %.pre292 = shl i32 %.pre258, 20
  %.pre294 = add i32 %.pre290, %.pre292
  %.pre296 = tail call double @llvm.nvvm.lohi.i2d(i32 %.pre288, i32 %.pre294) #13
  %.pre298 = tail call i32 @llvm.nvvm.d2i.hi(double %param_6.190058.1.pre) #13
  %.pre300 = bitcast i32 %.pre298 to float
  %.pre302 = tail call float @llvm.nvvm.fabs.f(float %.pre300) #13
  br label %in_bounds-after

in_bounds-after:                                  ; preds = %__nv_exp.exit167.in_bounds-after_crit_edge, %__nv_exp.exit171
  %.pre-phi303 = phi float [ %.pre302, %__nv_exp.exit167.in_bounds-after_crit_edge ], [ %418, %__nv_exp.exit171 ]
  %.pre-phi297 = phi double [ %.pre296, %__nv_exp.exit167.in_bounds-after_crit_edge ], [ %415, %__nv_exp.exit171 ]
  %.pre-phi291 = phi i32 [ %.pre290, %__nv_exp.exit167.in_bounds-after_crit_edge ], [ %412, %__nv_exp.exit171 ]
  %.pre-phi289 = phi i32 [ %.pre288, %__nv_exp.exit167.in_bounds-after_crit_edge ], [ %411, %__nv_exp.exit171 ]
  %.pre-phi259 = phi i32 [ %.pre258, %__nv_exp.exit167.in_bounds-after_crit_edge ], [ %396, %__nv_exp.exit171 ]
  %param_6.1900121.1.1 = phi double [ %param_6.190058.1.pre, %__nv_exp.exit167.in_bounds-after_crit_edge ], [ %param_6.190035, %__nv_exp.exit171 ]
  %.pre-phi225 = phi i64 [ %.pre224, %__nv_exp.exit167.in_bounds-after_crit_edge ], [ %433, %__nv_exp.exit171 ]
  %pad_result_addr.0 = phi double [ 0.000000e+00, %__nv_exp.exit167.in_bounds-after_crit_edge ], [ %add.4202.5.clone.1, %__nv_exp.exit171 ]
  %param_0.237459 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg0229, i64 0, i64 %.pre-phi225, i64 %7, i64 %197
  %param_8.147962 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8245, i64 0, i64 %7, i64 %197
  %198 = fcmp olt float %.pre-phi303, 0x4010C46560000000
  br i1 %198, label %in_bounds-after56.1, label %__internal_fast_icmp_abs_lt.exit.i172.1

__internal_fast_icmp_abs_lt.exit.i172.1:          ; preds = %in_bounds-after
  %199 = fcmp olt double %param_6.1900121.1.1, 0.000000e+00
  %200 = fadd double %param_6.1900121.1.1, 0x7FF0000000000000
  %z.0.i173.1 = select i1 %199, double 0.000000e+00, double %200
  %201 = fcmp olt float %.pre-phi303, 0x4010E90000000000
  br i1 %201, label %202, label %in_bounds-after56.1

202:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i172.1
  %203 = sdiv i32 %.pre-phi259, 2
  %204 = shl i32 %203, 20
  %205 = add i32 %.pre-phi291, %204
  %206 = tail call double @llvm.nvvm.lohi.i2d(i32 %.pre-phi289, i32 %205) #13
  %207 = sub nsw i32 %.pre-phi259, %203
  %208 = shl i32 %207, 20
  %209 = add nsw i32 %208, 1072693248
  %210 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %209) #13
  %211 = fmul double %210, %206
  br label %in_bounds-after56.1

in_bounds-after56.1:                              ; preds = %in_bounds-after, %__internal_fast_icmp_abs_lt.exit.i172.1, %202
  %z.2.i174.1 = phi double [ %.pre-phi297, %in_bounds-after ], [ %211, %202 ], [ %z.0.i173.1, %__internal_fast_icmp_abs_lt.exit.i172.1 ]
  %212 = fcmp olt float %.pre-phi303, 0x4010C46560000000
  %param_0.237460.1 = load double, ptr addrspace(1) %param_0.237459, align 8, !invariant.load !278
  %multiply.3034.7.clone.161.1 = fmul double %z.2.i174.1, %param_0.237460.1
  %param_8.147963.1 = load double, ptr addrspace(1) %param_8.147962, align 8, !invariant.load !278
  %add.4202.5.clone.164.1 = fadd double %multiply.3034.7.clone.161.1, %param_8.147963.1
  %213 = fcmp ole double %add.4202.5.clone.164.1, 0.000000e+00
  %maximum.40.i.1 = select i1 %213, double 0.000000e+00, double %add.4202.5.clone.164.1
  br i1 %212, label %in_bounds-after119.1, label %__internal_fast_icmp_abs_lt.exit.i180.1

__internal_fast_icmp_abs_lt.exit.i180.1:          ; preds = %in_bounds-after56.1
  %214 = fcmp olt double %param_6.1900121.1.1, 0.000000e+00
  %215 = fadd double %param_6.1900121.1.1, 0x7FF0000000000000
  %z.0.i181.1 = select i1 %214, double 0.000000e+00, double %215
  %216 = fcmp olt float %.pre-phi303, 0x4010E90000000000
  br i1 %216, label %217, label %in_bounds-after119.1

217:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i180.1
  %218 = sdiv i32 %.pre-phi259, 2
  %219 = shl i32 %218, 20
  %220 = add i32 %.pre-phi291, %219
  %221 = tail call double @llvm.nvvm.lohi.i2d(i32 %.pre-phi289, i32 %220) #13
  %222 = sub nsw i32 %.pre-phi259, %218
  %223 = shl i32 %222, 20
  %224 = add nsw i32 %223, 1072693248
  %225 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %224) #13
  %226 = fmul double %225, %221
  br label %in_bounds-after119.1

in_bounds-after119.1:                             ; preds = %in_bounds-after56.1, %__internal_fast_icmp_abs_lt.exit.i180.1, %217
  %z.2.i182.1 = phi double [ %.pre-phi297, %in_bounds-after56.1 ], [ %226, %217 ], [ %z.0.i181.1, %__internal_fast_icmp_abs_lt.exit.i180.1 ]
  %multiply.3034.7.clone.1124.1 = fmul double %z.2.i182.1, %param_0.237460.1
  %add.4202.5.clone.1127.1 = fadd double %multiply.3034.7.clone.1124.1, %param_8.147963.1
  %227 = fcmp ole double %add.4202.5.clone.1127.1, 0.000000e+00
  %maximum.40.i197.1 = select i1 %227, double 0.000000e+00, double %add.4202.5.clone.1127.1
  %subtract.228.15.clone.1132 = fsub double 0.000000e+00, %maximum.40.i197.1
  %228 = tail call double @llvm.fma.f64(double %subtract.228.15.clone.1132, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %229 = tail call i32 @llvm.nvvm.d2i.lo(double %228) #13
  %230 = tail call double @llvm.nvvm.add.rn.d(double %228, double 0xC338000000000000) #13
  %231 = tail call double @llvm.fma.f64(double %230, double 0xBFE62E42FEFA39EF, double %subtract.228.15.clone.1132)
  %232 = tail call double @llvm.fma.f64(double %230, double 0xBC7ABC9E3B39803F, double %231)
  %233 = tail call double @llvm.fma.f64(double %232, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %234 = tail call double @llvm.fma.f64(double %233, double %232, double 0x3EC71DEE62401315)
  %235 = tail call double @llvm.fma.f64(double %234, double %232, double 0x3EFA01997C89EB71)
  %236 = tail call double @llvm.fma.f64(double %235, double %232, double 0x3F2A01A014761F65)
  %237 = tail call double @llvm.fma.f64(double %236, double %232, double 0x3F56C16C1852B7AF)
  %238 = tail call double @llvm.fma.f64(double %237, double %232, double 0x3F81111111122322)
  %239 = tail call double @llvm.fma.f64(double %238, double %232, double 0x3FA55555555502A1)
  %240 = tail call double @llvm.fma.f64(double %239, double %232, double 0x3FC5555555555511)
  %241 = tail call double @llvm.fma.f64(double %240, double %232, double 0x3FE000000000000B)
  %242 = tail call double @llvm.fma.f64(double %241, double %232, double 1.000000e+00)
  %243 = tail call double @llvm.fma.f64(double %242, double %232, double 1.000000e+00)
  %244 = tail call i32 @llvm.nvvm.d2i.lo(double %243) #13
  %245 = tail call i32 @llvm.nvvm.d2i.hi(double %243) #13
  %246 = shl i32 %229, 20
  %247 = add i32 %245, %246
  %248 = tail call double @llvm.nvvm.lohi.i2d(i32 %244, i32 %247) #13
  %249 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.228.15.clone.1132) #13
  %250 = bitcast i32 %249 to float
  %251 = tail call float @llvm.nvvm.fabs.f(float %250) #13
  %252 = fcmp olt float %251, 0x4010C46560000000
  br i1 %252, label %__nv_exp.exit187, label %__internal_fast_icmp_abs_lt.exit.i184

__internal_fast_icmp_abs_lt.exit.i184:            ; preds = %in_bounds-after119.1
  %253 = fcmp olt double %subtract.228.15.clone.1132, 0.000000e+00
  %254 = fadd double %subtract.228.15.clone.1132, 0x7FF0000000000000
  %z.0.i185 = select i1 %253, double 0.000000e+00, double %254
  %255 = fcmp olt float %251, 0x4010E90000000000
  br i1 %255, label %256, label %__nv_exp.exit187

256:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i184
  %257 = sdiv i32 %229, 2
  %258 = shl i32 %257, 20
  %259 = add i32 %245, %258
  %260 = tail call double @llvm.nvvm.lohi.i2d(i32 %244, i32 %259) #13
  %261 = sub nsw i32 %229, %257
  %262 = shl i32 %261, 20
  %263 = add nsw i32 %262, 1072693248
  %264 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %263) #13
  %265 = fmul double %264, %260
  br label %__nv_exp.exit187

__nv_exp.exit187:                                 ; preds = %in_bounds-after119.1, %__internal_fast_icmp_abs_lt.exit.i184, %256
  %z.2.i186 = phi double [ %248, %in_bounds-after119.1 ], [ %265, %256 ], [ %z.0.i185, %__internal_fast_icmp_abs_lt.exit.i184 ]
  %266 = fcmp olt float %.pre-phi303, 0x4010C46560000000
  %add.3969.i198 = fadd double %z.2.i186, 0.000000e+00
  br i1 %266, label %__nv_exp.exit179.1, label %__internal_fast_icmp_abs_lt.exit.i176.1

__internal_fast_icmp_abs_lt.exit.i176.1:          ; preds = %__nv_exp.exit187
  %267 = fcmp olt double %param_6.1900121.1.1, 0.000000e+00
  %268 = fadd double %param_6.1900121.1.1, 0x7FF0000000000000
  %z.0.i177.1 = select i1 %267, double 0.000000e+00, double %268
  %269 = fcmp olt float %.pre-phi303, 0x4010E90000000000
  br i1 %269, label %270, label %__nv_exp.exit179.1

270:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i176.1
  %271 = sdiv i32 %.pre-phi259, 2
  %272 = shl i32 %271, 20
  %273 = add i32 %.pre-phi291, %272
  %274 = tail call double @llvm.nvvm.lohi.i2d(i32 %.pre-phi289, i32 %273) #13
  %275 = sub nsw i32 %.pre-phi259, %271
  %276 = shl i32 %275, 20
  %277 = add nsw i32 %276, 1072693248
  %278 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %277) #13
  %279 = fmul double %278, %274
  br label %__nv_exp.exit179.1

__nv_exp.exit179.1:                               ; preds = %270, %__internal_fast_icmp_abs_lt.exit.i176.1, %__nv_exp.exit187
  %z.2.i178.1 = phi double [ %.pre-phi297, %__nv_exp.exit187 ], [ %279, %270 ], [ %z.0.i177.1, %__internal_fast_icmp_abs_lt.exit.i176.1 ]
  %280 = fcmp olt float %.pre-phi303, 0x4010C46560000000
  %multiply.3034.7.clone.191.1 = fmul double %z.2.i178.1, %param_0.237460.1
  %add.4202.5.clone.194.1 = fadd double %multiply.3034.7.clone.191.1, %param_8.147963.1
  br i1 %280, label %in_bounds-after119.1.1, label %__internal_fast_icmp_abs_lt.exit.i180.1.1

__internal_fast_icmp_abs_lt.exit.i180.1.1:        ; preds = %__nv_exp.exit179.1
  %281 = fcmp olt double %param_6.1900121.1.1, 0.000000e+00
  %282 = fadd double %param_6.1900121.1.1, 0x7FF0000000000000
  %z.0.i181.1.1 = select i1 %281, double 0.000000e+00, double %282
  %283 = fcmp olt float %.pre-phi303, 0x4010E90000000000
  br i1 %283, label %284, label %in_bounds-after119.1.1

284:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i180.1.1
  %285 = sdiv i32 %.pre-phi259, 2
  %286 = shl i32 %285, 20
  %287 = add i32 %.pre-phi291, %286
  %288 = tail call double @llvm.nvvm.lohi.i2d(i32 %.pre-phi289, i32 %287) #13
  %289 = sub nsw i32 %.pre-phi259, %285
  %290 = shl i32 %289, 20
  %291 = add nsw i32 %290, 1072693248
  %292 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %291) #13
  %293 = fmul double %292, %288
  br label %in_bounds-after119.1.1

in_bounds-after119.1.1:                           ; preds = %__nv_exp.exit179.1, %__internal_fast_icmp_abs_lt.exit.i180.1.1, %284
  %z.2.i182.1.1 = phi double [ %.pre-phi297, %__nv_exp.exit179.1 ], [ %293, %284 ], [ %z.0.i181.1.1, %__internal_fast_icmp_abs_lt.exit.i180.1.1 ]
  %multiply.3034.7.clone.1124.1.1 = fmul double %z.2.i182.1.1, %param_0.237460.1
  %add.4202.5.clone.1127.1.1 = fadd double %multiply.3034.7.clone.1124.1.1, %param_8.147963.1
  %294 = fcmp ole double %add.4202.5.clone.1127.1.1, 0.000000e+00
  %maximum.40.i197.1.1 = select i1 %294, double 0.000000e+00, double %add.4202.5.clone.1127.1.1
  %subtract.228.15.clone.1132.1 = fsub double %add.4202.5.clone.194.1, %maximum.40.i197.1.1
  %295 = tail call double @llvm.fma.f64(double %subtract.228.15.clone.1132.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %296 = tail call i32 @llvm.nvvm.d2i.lo(double %295) #13
  %297 = tail call double @llvm.nvvm.add.rn.d(double %295, double 0xC338000000000000) #13
  %298 = tail call double @llvm.fma.f64(double %297, double 0xBFE62E42FEFA39EF, double %subtract.228.15.clone.1132.1)
  %299 = tail call double @llvm.fma.f64(double %297, double 0xBC7ABC9E3B39803F, double %298)
  %300 = tail call double @llvm.fma.f64(double %299, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %301 = tail call double @llvm.fma.f64(double %300, double %299, double 0x3EC71DEE62401315)
  %302 = tail call double @llvm.fma.f64(double %301, double %299, double 0x3EFA01997C89EB71)
  %303 = tail call double @llvm.fma.f64(double %302, double %299, double 0x3F2A01A014761F65)
  %304 = tail call double @llvm.fma.f64(double %303, double %299, double 0x3F56C16C1852B7AF)
  %305 = tail call double @llvm.fma.f64(double %304, double %299, double 0x3F81111111122322)
  %306 = tail call double @llvm.fma.f64(double %305, double %299, double 0x3FA55555555502A1)
  %307 = tail call double @llvm.fma.f64(double %306, double %299, double 0x3FC5555555555511)
  %308 = tail call double @llvm.fma.f64(double %307, double %299, double 0x3FE000000000000B)
  %309 = tail call double @llvm.fma.f64(double %308, double %299, double 1.000000e+00)
  %310 = tail call double @llvm.fma.f64(double %309, double %299, double 1.000000e+00)
  %311 = tail call i32 @llvm.nvvm.d2i.lo(double %310) #13
  %312 = tail call i32 @llvm.nvvm.d2i.hi(double %310) #13
  %313 = shl i32 %296, 20
  %314 = add i32 %312, %313
  %315 = tail call double @llvm.nvvm.lohi.i2d(i32 %311, i32 %314) #13
  %316 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.228.15.clone.1132.1) #13
  %317 = bitcast i32 %316 to float
  %318 = tail call float @llvm.nvvm.fabs.f(float %317) #13
  %319 = fcmp olt float %318, 0x4010C46560000000
  br i1 %319, label %__nv_exp.exit187.1, label %__internal_fast_icmp_abs_lt.exit.i184.1

__internal_fast_icmp_abs_lt.exit.i184.1:          ; preds = %in_bounds-after119.1.1
  %320 = fcmp olt double %subtract.228.15.clone.1132.1, 0.000000e+00
  %321 = fadd double %subtract.228.15.clone.1132.1, 0x7FF0000000000000
  %z.0.i185.1 = select i1 %320, double 0.000000e+00, double %321
  %322 = fcmp olt float %318, 0x4010E90000000000
  br i1 %322, label %323, label %__nv_exp.exit187.1

323:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i184.1
  %324 = sdiv i32 %296, 2
  %325 = shl i32 %324, 20
  %326 = add i32 %312, %325
  %327 = tail call double @llvm.nvvm.lohi.i2d(i32 %311, i32 %326) #13
  %328 = sub nsw i32 %296, %324
  %329 = shl i32 %328, 20
  %330 = add nsw i32 %329, 1072693248
  %331 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %330) #13
  %332 = fmul double %331, %327
  br label %__nv_exp.exit187.1

__nv_exp.exit187.1:                               ; preds = %323, %__internal_fast_icmp_abs_lt.exit.i184.1, %in_bounds-after119.1.1
  %z.2.i186.1 = phi double [ %315, %in_bounds-after119.1.1 ], [ %332, %323 ], [ %z.0.i185.1, %__internal_fast_icmp_abs_lt.exit.i184.1 ]
  %add.3969.i198.1 = fadd double %add.3969.i198, %z.2.i186.1
  %subtract.228.15.clone.1 = fsub double %pad_result_addr.0, %maximum.40.i.1
  %333 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3969.i198.1) #13
  %334 = tail call i32 @llvm.nvvm.d2i.lo(double %add.3969.i198.1) #13
  %335 = icmp slt i32 %333, 1048576
  %336 = fmul double %add.3969.i198.1, 0x4350000000000000
  %337 = tail call i32 @llvm.nvvm.d2i.lo(double %336) #13
  %338 = tail call i32 @llvm.nvvm.d2i.hi(double %336) #13
  br i1 %335, label %339, label %340

339:                                              ; preds = %__nv_exp.exit187.1
  br label %340

340:                                              ; preds = %339, %__nv_exp.exit187.1
  %.0.i = phi double [ %336, %339 ], [ %add.3969.i198.1, %__nv_exp.exit187.1 ]
  %ihi.0.i = phi i32 [ %338, %339 ], [ %333, %__nv_exp.exit187.1 ]
  %ilo.0.i = phi i32 [ %337, %339 ], [ %334, %__nv_exp.exit187.1 ]
  %e.0.i = phi i32 [ -1077, %339 ], [ -1023, %__nv_exp.exit187.1 ]
  %341 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %341, 2146435071
  br i1 %or.cond.i, label %342, label %388

342:                                              ; preds = %340
  %343 = lshr i32 %ihi.0.i, 20
  %344 = add nsw i32 %e.0.i, %343
  %345 = and i32 %ihi.0.i, 1048575
  %346 = or disjoint i32 %345, 1072693248
  %347 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %346) #13
  %348 = icmp ugt i32 %346, 1073127582
  %349 = tail call i32 @llvm.nvvm.d2i.lo(double %347) #13
  %350 = tail call i32 @llvm.nvvm.d2i.hi(double %347) #13
  %351 = add i32 %350, -1048576
  %352 = tail call double @llvm.nvvm.lohi.i2d(i32 %349, i32 %351) #13
  %spec.select = select i1 %348, double %352, double %347
  %353 = zext i1 %348 to i32
  %spec.select199 = add nsw i32 %344, %353
  %354 = fadd double %spec.select, -1.000000e+00
  %355 = fadd double %spec.select, 1.000000e+00
  %356 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %355) #13
  %357 = fneg double %355
  %358 = tail call double @llvm.fma.f64(double %357, double %356, double 1.000000e+00)
  %359 = tail call double @llvm.fma.f64(double %358, double %358, double %358)
  %360 = tail call double @llvm.fma.f64(double %359, double %356, double %356)
  %361 = fmul double %354, %360
  %362 = fadd double %361, %361
  %363 = fmul double %362, %362
  %364 = tail call double @llvm.fma.f64(double %363, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %365 = tail call double @llvm.fma.f64(double %364, double %363, double 0x3EF3B2669F02676F)
  %366 = tail call double @llvm.fma.f64(double %365, double %363, double 0x3F1745CBA9AB0956)
  %367 = tail call double @llvm.fma.f64(double %366, double %363, double 0x3F3C71C72D1B5154)
  %368 = tail call double @llvm.fma.f64(double %367, double %363, double 0x3F624924923BE72D)
  %369 = tail call double @llvm.fma.f64(double %368, double %363, double 0x3F8999999999A3C4)
  %370 = tail call double @llvm.fma.f64(double %369, double %363, double 0x3FB5555555555554)
  %371 = fsub double %354, %362
  %372 = fmul double %371, 2.000000e+00
  %373 = fneg double %362
  %374 = tail call double @llvm.fma.f64(double %373, double %354, double %372)
  %375 = fmul double %360, %374
  %376 = fmul double %363, %370
  %377 = tail call double @llvm.fma.f64(double %376, double %362, double %375)
  %378 = xor i32 %spec.select199, -2147483648
  %379 = tail call double @llvm.nvvm.lohi.i2d(i32 %378, i32 1127219200) #13
  %380 = fsub double %379, %8
  %381 = tail call double @llvm.fma.f64(double %380, double 0x3FE62E42FEFA39EF, double %362)
  %382 = fneg double %380
  %383 = tail call double @llvm.fma.f64(double %382, double 0x3FE62E42FEFA39EF, double %381)
  %384 = fsub double %383, %362
  %385 = fsub double %377, %384
  %386 = tail call double @llvm.fma.f64(double %380, double 0x3C7ABC9E3B39803F, double %385)
  %387 = fadd double %381, %386
  br label %__nv_log.exit

388:                                              ; preds = %340
  %389 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %390 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
  %391 = and i32 %390, 2147483647
  %392 = icmp eq i32 %391, 0
  %q.0.i = select i1 %392, double 0xFFF0000000000000, double %389
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %342, %388
  %q.1.i = phi double [ %387, %342 ], [ %q.0.i, %388 ]
  %subtract.229.5.clone.1 = fsub double %subtract.228.15.clone.1, %q.1.i
  %393 = trunc i8 %param_9.135117 to i1
  %394 = select i1 %393, double %subtract.229.5.clone.1, double 0x7FF8000000000000
  %scevgep346 = getelementptr i8, ptr addrspace(1) %lsr.iv344, i64 %28
  store double %multiply.3045.1.clone.1, ptr addrspace(1) %scevgep346, align 8
  store double %394, ptr addrspace(1) %scevgep316, align 8
  br label %x_in_tile-after

in_bounds-true:                                   ; preds = %__nv_exp.exit167
  %param_6.190034 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6241, i64 0, i64 %7, i64 %197
  %param_6.190035 = load double, ptr addrspace(1) %param_6.190034, align 8, !invariant.load !278
  %395 = tail call double @llvm.fma.f64(double %param_6.190035, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %396 = tail call i32 @llvm.nvvm.d2i.lo(double %395) #13
  %397 = tail call double @llvm.nvvm.add.rn.d(double %395, double 0xC338000000000000) #13
  %398 = tail call double @llvm.fma.f64(double %397, double 0xBFE62E42FEFA39EF, double %param_6.190035)
  %399 = tail call double @llvm.fma.f64(double %397, double 0xBC7ABC9E3B39803F, double %398)
  %400 = tail call double @llvm.fma.f64(double %399, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %401 = tail call double @llvm.fma.f64(double %400, double %399, double 0x3EC71DEE62401315)
  %402 = tail call double @llvm.fma.f64(double %401, double %399, double 0x3EFA01997C89EB71)
  %403 = tail call double @llvm.fma.f64(double %402, double %399, double 0x3F2A01A014761F65)
  %404 = tail call double @llvm.fma.f64(double %403, double %399, double 0x3F56C16C1852B7AF)
  %405 = tail call double @llvm.fma.f64(double %404, double %399, double 0x3F81111111122322)
  %406 = tail call double @llvm.fma.f64(double %405, double %399, double 0x3FA55555555502A1)
  %407 = tail call double @llvm.fma.f64(double %406, double %399, double 0x3FC5555555555511)
  %408 = tail call double @llvm.fma.f64(double %407, double %399, double 0x3FE000000000000B)
  %409 = tail call double @llvm.fma.f64(double %408, double %399, double 1.000000e+00)
  %410 = tail call double @llvm.fma.f64(double %409, double %399, double 1.000000e+00)
  %411 = tail call i32 @llvm.nvvm.d2i.lo(double %410) #13
  %412 = tail call i32 @llvm.nvvm.d2i.hi(double %410) #13
  %413 = shl i32 %396, 20
  %414 = add i32 %412, %413
  %415 = tail call double @llvm.nvvm.lohi.i2d(i32 %411, i32 %414) #13
  %416 = tail call i32 @llvm.nvvm.d2i.hi(double %param_6.190035) #13
  %417 = bitcast i32 %416 to float
  %418 = tail call float @llvm.nvvm.fabs.f(float %417) #13
  %419 = fcmp olt float %418, 0x4010C46560000000
  br i1 %419, label %__nv_exp.exit171, label %__internal_fast_icmp_abs_lt.exit.i168

__internal_fast_icmp_abs_lt.exit.i168:            ; preds = %in_bounds-true
  %420 = fcmp olt double %param_6.190035, 0.000000e+00
  %421 = fadd double %param_6.190035, 0x7FF0000000000000
  %z.0.i169 = select i1 %420, double 0.000000e+00, double %421
  %422 = fcmp olt float %418, 0x4010E90000000000
  br i1 %422, label %423, label %__nv_exp.exit171

423:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i168
  %424 = sdiv i32 %396, 2
  %425 = shl i32 %424, 20
  %426 = add i32 %412, %425
  %427 = tail call double @llvm.nvvm.lohi.i2d(i32 %411, i32 %426) #13
  %428 = sub nsw i32 %396, %424
  %429 = shl i32 %428, 20
  %430 = add nsw i32 %429, 1072693248
  %431 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %430) #13
  %432 = fmul double %431, %427
  br label %__nv_exp.exit171

__nv_exp.exit171:                                 ; preds = %in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i168, %423
  %z.2.i170 = phi double [ %415, %in_bounds-true ], [ %432, %423 ], [ %z.0.i169, %__internal_fast_icmp_abs_lt.exit.i168 ]
  %433 = zext nneg i32 %195 to i64
  %param_0.237436 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg0229, i64 0, i64 %433, i64 %7, i64 %197
  %param_0.237437 = load double, ptr addrspace(1) %param_0.237436, align 8, !invariant.load !278
  %multiply.3034.7.clone.1 = fmul double %z.2.i170, %param_0.237437
  %param_8.1479 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8245, i64 0, i64 %7, i64 %197
  %param_8.147938 = load double, ptr addrspace(1) %param_8.1479, align 8, !invariant.load !278
  %add.4202.5.clone.1 = fadd double %multiply.3034.7.clone.1, %param_8.147938
  br label %in_bounds-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  %434 = or disjoint i32 %tile_origin.2, %0
  %435 = udiv i32 %434, 20
  %436 = mul i32 %435, 20
  %.decomposed228 = sub i32 %434, %436
  %437 = zext nneg i32 %435 to i64
  %438 = zext nneg i32 %.decomposed228 to i64
  %output_element_address = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10249, i64 0, i64 %437, i64 %438
  store double %add.3969.i195, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
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
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !278
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !278
  store double %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #2 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !278
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load i32, ptr addrspace(1) %9, align 4, !invariant.load !278
  store i32 %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(40) %arg2) local_unnamed_addr #2 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp3 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp3, i32 %0, i32 %.urem
  %2 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !278
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
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp3 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp3, i32 %0, i32 %.urem
  %2 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !278
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
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !278
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr double, ptr addrspace(1) %arg28, i64 %15
  store double %14, ptr addrspace(1) %16, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg28) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp31 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp31, i32 %0, i32 %.urem
  %2 = load i64, ptr addrspace(1) %arg2174, align 128, !invariant.load !278
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
  %13 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg950, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !278
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr double, ptr addrspace(1) %arg032, i64 %15
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !278
  %18 = trunc i8 %14 to i1
  %19 = select i1 %18, double %17, double 0.000000e+00
  %20 = getelementptr double, ptr addrspace(1) %arg1460, i64 %15
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !278
  %22 = select i1 %18, double %21, double 0.000000e+00
  %23 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg1358, i64 0, i64 %10, i64 %11, i64 %12
  %24 = load i8, ptr addrspace(1) %23, align 1, !invariant.load !278
  %25 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg1256, i64 0, i64 %10, i64 %11, i64 %12
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !278
  %27 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg2072, i64 0, i64 %10, i64 %11, i64 %12
  %28 = load i8, ptr addrspace(1) %27, align 1, !invariant.load !278
  %29 = getelementptr inbounds [192 x [2 x [20 x i32]]], ptr addrspace(1) %arg1970, i64 0, i64 %10, i64 %11, i64 %12
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !278
  %31 = icmp eq i32 %30, 1
  %32 = getelementptr double, ptr addrspace(1) %arg1868, i64 %15
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !278
  %34 = trunc i8 %28 to i1
  %35 = select i1 %34, i1 %31, i1 false
  %36 = select i1 %35, i1 %18, i1 false
  %37 = select i1 %36, double %33, double 0.000000e+00
  %38 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg1664, i64 0, i64 %10, i64 %11, i64 %12
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !278
  %multiply.2896.11 = fmul double %39, %37
  %40 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg1154, i64 0, i64 %10, i64 %11, i64 %12
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !278
  %multiply.2898.7 = fmul double %41, %multiply.2896.11
  %42 = fmul double %26, %multiply.2896.11
  %add.3976.7 = fsub double %multiply.2898.7, %42
  %43 = trunc i8 %24 to i1
  %44 = select i1 %43, double %add.3976.7, double 0.000000e+00
  %45 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg1052, i64 0, i64 %10, i64 %11, i64 %12
  %46 = load double, ptr addrspace(1) %45, align 8, !invariant.load !278
  %47 = getelementptr double, ptr addrspace(1) %arg1766, i64 %15
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !278
  %49 = select i1 %18, double %48, double 0.000000e+00
  %multiply.2899.17 = fmul double %39, %49
  %50 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg1562, i64 0, i64 %10, i64 %11, i64 %12
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !278
  %multiply.2900.11 = fmul double %51, %multiply.2899.17
  %multiply.2901.7 = fmul double %46, %multiply.2900.11
  %add.3977.7 = fadd double %44, %multiply.2901.7
  %add.3978.5 = fadd double %22, %add.3977.7
  %52 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg338, i64 0, i64 %10, i64 %11, i64 %12
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !278
  %54 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg236, i64 0, i64 %10, i64 %11, i64 %12
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !278
  %56 = fneg double %add.3978.5
  %57 = fmul double %53, %56
  %58 = fmul double %55, %57
  %add.3979.3 = fadd double %19, %58
  %59 = getelementptr double, ptr addrspace(1) %arg746, i64 %15
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !278
  %61 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg848, i64 0, i64 %10, i64 %11, i64 %12
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !278
  %add.3975.9 = fadd double %60, %62
  %63 = select i1 %18, double %add.3975.9, double 0.000000e+00
  %64 = getelementptr double, ptr addrspace(1) %arg644, i64 %15
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !278
  %66 = select i1 %18, double %65, double 0.000000e+00
  %multiply.2904.13 = fmul double %55, %add.3978.5
  %67 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg542, i64 0, i64 %10, i64 %11, i64 %12
  %68 = load double, ptr addrspace(1) %67, align 8, !invariant.load !278
  %multiply.2905.11 = fmul double %multiply.2904.13, %68
  %add.3980.9 = fadd double %66, %multiply.2905.11
  %add.3981.5 = fadd double %63, %add.3980.9
  %69 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg440, i64 0, i64 %10, i64 %11, i64 %12
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !278
  %71 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg134, i64 0, i64 %10, i64 %11, i64 %12
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !278
  %73 = fneg double %add.3981.5
  %74 = fmul double %70, %73
  %75 = fmul double %53, %74
  %76 = fmul double %72, %75
  %add.3982.1 = fadd double %add.3979.3, %76
  %77 = getelementptr double, ptr addrspace(1) %arg2276, i64 %15
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !278
  %79 = select i1 %18, double 0.000000e+00, double %78
  %80 = getelementptr double, ptr addrspace(1) %arg2378, i64 %15
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !278
  %82 = select i1 %18, double 0.000000e+00, double %81
  %83 = getelementptr double, ptr addrspace(1) %arg2480, i64 %15
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !278
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !275
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !275
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %4 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !278
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !278
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !278
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
define void @loop_broadcast_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(40) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg6) local_unnamed_addr #2 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !278
  %4 = getelementptr i8, ptr addrspace(1) %arg25, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !278
  %6 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !278
  %8 = trunc i8 %5 to i1
  %9 = select i1 %8, double %7, double 0.000000e+00
  %10 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !278
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
define void @loop_add_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg3, ptr noalias nocapture align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg8, ptr noalias nocapture align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg15, ptr noalias nocapture align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg19, ptr noalias nocapture align 128 dereferenceable(320) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg36, ptr noalias nocapture align 128 dereferenceable(320) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg38, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg40, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg41, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg42, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg43, ptr noalias nocapture align 128 dereferenceable(320) %arg44, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg45, ptr noalias nocapture align 128 dereferenceable(320) %arg46, ptr noalias nocapture align 128 dereferenceable(320) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg48, ptr noalias nocapture align 128 dereferenceable(320) %arg49, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg50, ptr noalias nocapture align 128 dereferenceable(320) %arg51, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg52, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg54, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg55, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg56, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg57, ptr noalias nocapture align 128 dereferenceable(320) %arg58, ptr noalias nocapture readnone align 128 dereferenceable(7680) %arg59, ptr noalias nocapture align 128 dereferenceable(320) %arg60, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg61, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg62, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg63, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg64, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg65, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg66, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg67, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg68, ptr noalias nocapture align 128 dereferenceable(320) %arg69, ptr noalias nocapture align 128 dereferenceable(320) %arg70, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg71, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg72, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg73, ptr noalias nocapture align 128 dereferenceable(320) %arg74, ptr noalias nocapture align 128 dereferenceable(320) %arg75, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg76) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.urem = add nsw i32 %0, -20
  %.cmp = icmp ult i32 %0, 20
  %1 = select i1 %.cmp, i32 %0, i32 %.urem
  %.cmp98 = icmp ugt i32 %0, 19
  %2 = load i64, ptr addrspace(1) %arg21141, align 128, !invariant.load !278
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
  %13 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg12123, i64 0, i64 %10, i64 %11, i64 %12
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !278
  %15 = zext nneg i32 %0 to i64
  %16 = getelementptr double, ptr addrspace(1) %arg1101, i64 %15
  %17 = load double, ptr addrspace(1) %16, align 8
  %18 = trunc i8 %14 to i1
  %add.4036.1 = fadd double %17, 0.000000e+00
  %19 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg7113, i64 0, i64 %10, i64 %11, i64 %12
  %20 = load i8, ptr addrspace(1) %19, align 1, !invariant.load !278
  %21 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg6111, i64 0, i64 %10, i64 %11, i64 %12
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !278
  %23 = getelementptr inbounds [192 x [2 x [20 x i32]]], ptr addrspace(1) %arg5109, i64 0, i64 %10, i64 %11, i64 %12
  %24 = load i32, ptr addrspace(1) %23, align 4, !invariant.load !278
  %25 = icmp eq i32 %24, 0
  %26 = getelementptr double, ptr addrspace(1) %arg4107, i64 %15
  %27 = load double, ptr addrspace(1) %26, align 8
  %28 = select i1 %18, double %27, double 0.000000e+00
  %29 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg3105, i64 0, i64 %10, i64 %11, i64 %12
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !278
  %.neg = fneg double %28
  %31 = select i1 %25, double %.neg, double -0.000000e+00
  %32 = fmul double %30, %31
  %multiply.2948.7 = fmul double %22, %32
  %33 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg2103, i64 0, i64 %10, i64 %11, i64 %12
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !278
  %multiply.2949.5 = fmul double %34, %multiply.2948.7
  %35 = trunc i8 %20 to i1
  %36 = select i1 %35, double %multiply.2949.5, double 0.000000e+00
  %37 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg099, i64 0, i64 %12
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !278
  %add.4037.5 = fadd double %38, %36
  %39 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg11121, i64 0, i64 %10, i64 %11, i64 %12
  %40 = load i8, ptr addrspace(1) %39, align 1, !invariant.load !278
  %41 = getelementptr double, ptr addrspace(1) %arg20139, i64 %15
  %42 = load double, ptr addrspace(1) %41, align 8
  %43 = select i1 %18, double %42, double 0.000000e+00
  %44 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg19137, i64 0, i64 %10, i64 %11, i64 %12
  %45 = load i8, ptr addrspace(1) %44, align 1, !invariant.load !278
  %46 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg18135, i64 0, i64 %10, i64 %11, i64 %12
  %47 = load i8, ptr addrspace(1) %46, align 1, !invariant.load !278
  %48 = icmp eq i32 %24, 1
  %49 = trunc i8 %47 to i1
  %50 = select i1 %49, i1 %48, i1 false
  %51 = select i1 %50, double %28, double 0.000000e+00
  %52 = trunc i8 %45 to i1
  %53 = select i1 %52, double %51, double 0.000000e+00
  %54 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg17133, i64 0, i64 %10, i64 %11, i64 %12
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !278
  %56 = getelementptr double, ptr addrspace(1) %arg16131, i64 %15
  %57 = load double, ptr addrspace(1) %56, align 8
  %58 = select i1 %18, double %57, double 0.000000e+00
  %59 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg15129, i64 0, i64 %10, i64 %11, i64 %12
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !278
  %multiply.2899.21 = fmul double %58, %60
  %61 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg14127, i64 0, i64 %10, i64 %11, i64 %12
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !278
  %63 = fneg double %55
  %64 = fmul double %multiply.2899.21, %63
  %65 = fmul double %62, %64
  %multiply.2943.5 = fmul double %65, 2.000000e+00
  %add.4025.5 = fadd double %53, %multiply.2943.5
  %add.4026.5 = fadd double %43, %add.4025.5
  %add.4027.7 = fadd double %38, %add.4026.5
  %66 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg13125, i64 0, i64 %10, i64 %11, i64 %12
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !278
  %68 = getelementptr double, ptr addrspace(1) %arg9117, i64 %15
  %69 = load double, ptr addrspace(1) %68, align 8
  %70 = select i1 %18, double %69, double 0.000000e+00
  %add.4028.13 = fadd double %38, %70
  %multiply.2944.7 = fmul double %67, %add.4028.13
  %add.4029.5 = fadd double %multiply.2944.7, %add.4027.7
  %71 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg10119, i64 0, i64 %10, i64 %11, i64 %12
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !278
  %73 = fneg double %add.4029.5
  %74 = fmul double %72, %73
  %75 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg8115, i64 0, i64 %10, i64 %11, i64 %12
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !278
  %multiply.2950.7 = fmul double %add.4028.13, %76
  %add.4038.5 = fadd double %multiply.2950.7, %74
  %77 = trunc i8 %40 to i1
  %78 = select i1 %77, double %add.4038.5, double 0.000000e+00
  %multiply.2951.3 = fmul double %34, %78
  %add.4039.3 = fadd double %add.4037.5, %multiply.2951.3
  %add.4041.1 = fadd double %add.4036.1, %add.4039.3
  %79 = select i1 %18, double 0.000000e+00, double %27
  %80 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg23145, i64 0, i64 %10, i64 %11, i64 %12
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !278
  %82 = fneg double %32
  %83 = fmul double %81, %82
  %84 = select i1 %35, double %83, double 0.000000e+00
  %add.4024.5.clone.1 = fadd double %38, %84
  %85 = getelementptr double, ptr addrspace(1) %arg22143, i64 %15
  %86 = load double, ptr addrspace(1) %85, align 8
  %87 = select i1 %18, double %86, double 0.000000e+00
  %add.4031.5.clone.1 = fadd double %38, %87
  %88 = fneg double %add.4031.5.clone.1
  %89 = fmul double %81, %88
  %90 = fmul double %81, %74
  %add.4032.1.clone.1 = fsub double %89, %90
  %add.4033.3.clone.1 = fadd double %add.4024.5.clone.1, %add.4032.1.clone.1
  %add.4034.1.clone.1 = fadd double %79, %add.4033.3.clone.1
  %91 = select i1 %18, double 0.000000e+00, double %69
  %92 = select i1 %18, double 0.000000e+00, double %86
  %93 = select i1 %18, double 0.000000e+00, double %42
  %94 = getelementptr double, ptr addrspace(1) %arg49197, i64 %15
  %95 = load double, ptr addrspace(1) %94, align 8
  %96 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg50199, i64 0, i64 %10, i64 %11, i64 %12
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !278
  %add.3975.5.clone.1.clone.1 = fadd double %95, %97
  %98 = select i1 %18, double 0.000000e+00, double %add.3975.5.clone.1.clone.1
  %99 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg48195, i64 0, i64 %10, i64 %11, i64 %12
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !278
  %101 = getelementptr double, ptr addrspace(1) %arg47193, i64 %15
  %102 = load double, ptr addrspace(1) %101, align 8
  %103 = select i1 %18, double %102, double 0.000000e+00
  %104 = getelementptr double, ptr addrspace(1) %arg46191, i64 %15
  %105 = load double, ptr addrspace(1) %104, align 8
  %106 = select i1 %18, double %105, double 0.000000e+00
  %107 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg45189, i64 0, i64 %10, i64 %11, i64 %12
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !278
  %109 = getelementptr double, ptr addrspace(1) %arg44187, i64 %15
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = select i1 %18, double %110, double 0.000000e+00
  %112 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg43185, i64 0, i64 %10, i64 %11, i64 %12
  %113 = load double, ptr addrspace(1) %112, align 8, !invariant.load !278
  %multiply.2896.9.clone.1.clone.1 = fmul double %51, %60
  %114 = fneg double %multiply.2896.9.clone.1.clone.1
  %115 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg42183, i64 0, i64 %10, i64 %11, i64 %12
  %116 = load double, ptr addrspace(1) %115, align 8, !invariant.load !278
  %multiply.2898.5.clone.1.clone.1 = fmul double %multiply.2896.9.clone.1.clone.1, %116
  %117 = fmul double %multiply.2896.9.clone.1.clone.1, %113
  %add.3976.5.clone.1.clone.1 = fsub double %multiply.2898.5.clone.1.clone.1, %117
  %118 = select i1 %52, double %add.3976.5.clone.1.clone.1, double 0.000000e+00
  %119 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg41181, i64 0, i64 %10, i64 %11, i64 %12
  %120 = load double, ptr addrspace(1) %119, align 8, !invariant.load !278
  %121 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg40179, i64 0, i64 %10, i64 %11, i64 %12
  %122 = load double, ptr addrspace(1) %121, align 8, !invariant.load !278
  %multiply.2900.9.clone.1.clone.1 = fmul double %multiply.2899.21, %122
  %multiply.2901.5.clone.1.clone.1 = fmul double %120, %multiply.2900.9.clone.1.clone.1
  %add.3977.5.clone.1.clone.1 = fadd double %118, %multiply.2901.5.clone.1.clone.1
  %add.3978.3.clone.1.clone.1 = fadd double %111, %add.3977.5.clone.1.clone.1
  %multiply.2904.7.clone.1.clone.1 = fmul double %108, %add.3978.3.clone.1.clone.1
  %123 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg39177, i64 0, i64 %10, i64 %11, i64 %12
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !278
  %multiply.2905.5.clone.1.clone.1 = fmul double %124, %multiply.2904.7.clone.1.clone.1
  %add.3980.3.clone.1.clone.1 = fadd double %106, %multiply.2905.5.clone.1.clone.1
  %add.3983.5.clone.1.clone.1 = fsub double %103, %add.3980.3.clone.1.clone.1
  %125 = select i1 %18, double %add.3975.5.clone.1.clone.1, double 0.000000e+00
  %add.3981.3.clone.1.clone.1 = fadd double %125, %add.3980.3.clone.1.clone.1
  %add.3984.9.clone.1.clone.1 = fadd double %38, %add.3981.3.clone.1.clone.1
  %add.3985.7.clone.1.clone.1 = fadd double %add.3983.5.clone.1.clone.1, %add.3984.9.clone.1.clone.1
  %126 = getelementptr double, ptr addrspace(1) %arg38175, i64 %15
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !278
  %128 = select i1 %18, double %127, double 0.000000e+00
  %add.3986.15.clone.1.clone.1 = fadd double %38, %128
  %129 = getelementptr double, ptr addrspace(1) %arg37173, i64 %15
  %130 = load double, ptr addrspace(1) %129, align 8
  %131 = select i1 %18, double %130, double 0.000000e+00
  %132 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg36171, i64 0, i64 %10, i64 %11, i64 %12
  %133 = load double, ptr addrspace(1) %132, align 8, !invariant.load !278
  %multiply.2909.3.clone.1.clone.1 = fmul double %133, %add.3981.3.clone.1.clone.1
  %134 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg35169, i64 0, i64 %10
  %135 = load double, ptr addrspace(1) %134, align 8, !invariant.load !278
  %multiply.2910.5.clone.1.clone.1 = fmul double %135, %multiply.2909.3.clone.1.clone.1
  %add.3987.7.clone.1.clone.1 = fadd double %38, %multiply.2910.5.clone.1.clone.1
  %add.3988.5.clone.1.clone.1 = fadd double %131, %add.3987.7.clone.1.clone.1
  %136 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg34167, i64 0, i64 %10, i64 %11, i64 %12
  %137 = load double, ptr addrspace(1) %136, align 8, !invariant.load !278
  %138 = fneg double %add.3988.5.clone.1.clone.1
  %139 = fdiv double %138, %137
  %140 = fmul double %135, %139
  %add.3989.13.clone.1.clone.1 = fadd double %add.3986.15.clone.1.clone.1, %140
  %141 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg33165, i64 0, i64 %10, i64 %11, i64 %12
  %142 = load double, ptr addrspace(1) %141, align 8, !invariant.load !278
  %143 = getelementptr double, ptr addrspace(1) %arg32163, i64 %15
  %144 = load double, ptr addrspace(1) %143, align 8, !invariant.load !278
  %145 = getelementptr double, ptr addrspace(1) %arg31161, i64 %15
  %146 = load double, ptr addrspace(1) %145, align 8, !invariant.load !278
  %147 = fadd double %144, %146
  %add.3990.5.clone.1.clone.1 = select i1 %18, double %147, double 0.000000e+00
  %148 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg30159, i64 0, i64 %10, i64 %11, i64 %12
  %149 = load double, ptr addrspace(1) %148, align 8, !invariant.load !278
  %150 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg29157, i64 0, i64 %10, i64 %11, i64 %12
  %151 = load double, ptr addrspace(1) %150, align 8, !invariant.load !278
  %multiply.2906.7.clone.1.clone.1 = fmul double %add.3981.3.clone.1.clone.1, %151
  %152 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg28155, i64 0, i64 %10, i64 %11, i64 %12
  %153 = load double, ptr addrspace(1) %152, align 8, !invariant.load !278
  %divide.597.11.clone.1.clone.1 = fdiv double %multiply.2906.7.clone.1.clone.1, %153
  %multiply.2912.9.clone.1.clone.1 = fmul double %149, %divide.597.11.clone.1.clone.1
  %154 = getelementptr double, ptr addrspace(1) %arg27153, i64 %15
  %155 = load double, ptr addrspace(1) %154, align 8, !invariant.load !278
  %add.3991.7.clone.1.clone.1 = fadd double %155, %multiply.2912.9.clone.1.clone.1
  %add.3992.5.clone.1.clone.1 = fadd double %add.3990.5.clone.1.clone.1, %add.3991.7.clone.1.clone.1
  %add.3993.5.clone.1.clone.1 = fadd double %38, %add.3992.5.clone.1.clone.1
  %156 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg26151, i64 0, i64 %10, i64 %11, i64 %12
  %157 = load double, ptr addrspace(1) %156, align 8, !invariant.load !278
  %158 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg25149, i64 0, i64 %10, i64 %11, i64 %12
  %159 = load double, ptr addrspace(1) %158, align 8, !invariant.load !278
  %160 = fmul double %157, %138
  %161 = fmul double %160, %159
  %add.3994.3.clone.1.clone.1 = fadd double %161, %add.3993.5.clone.1.clone.1
  %162 = fmul double %142, %add.3994.3.clone.1.clone.1
  %add.3995.11.clone.1.clone.1 = fsub double %add.3989.13.clone.1.clone.1, %162
  %163 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg24147, i64 0, i64 %10, i64 %11, i64 %12
  %164 = load double, ptr addrspace(1) %163, align 8, !invariant.load !278
  %multiply.2916.11.clone.1.clone.1 = fmul double %164, %add.3994.3.clone.1.clone.1
  %add.3996.9.clone.1.clone.1 = fadd double %multiply.2916.11.clone.1.clone.1, %add.3995.11.clone.1.clone.1
  %multiply.2917.7.clone.1.clone.1 = fmul double %137, %add.3996.9.clone.1.clone.1
  %add.3997.5.clone.1.clone.1 = fadd double %add.3985.7.clone.1.clone.1, %multiply.2917.7.clone.1.clone.1
  %multiply.2918.3.clone.1.clone.1 = fmul double %100, %add.3997.5.clone.1.clone.1
  %add.3998.3.clone.1.clone.1 = fadd double %38, %multiply.2918.3.clone.1.clone.1
  %add.3999.1.clone.1.clone.1 = fadd double %98, %add.3998.3.clone.1.clone.1
  %165 = getelementptr double, ptr addrspace(1) %arg51201, i64 %15
  %166 = load double, ptr addrspace(1) %165, align 8
  %167 = select i1 %18, double 0.000000e+00, double %166
  %168 = getelementptr double, ptr addrspace(1) %arg58215, i64 %15
  %169 = load double, ptr addrspace(1) %168, align 8
  %add.4042.3.clone.1.clone.1 = fadd double %169, 0.000000e+00
  %170 = getelementptr inbounds [192 x [1 x [2 x [20 x i8]]]], ptr addrspace(1) %arg57213, i64 0, i64 %10, i64 0, i64 %11, i64 %12
  %171 = load i8, ptr addrspace(1) %170, align 1, !invariant.load !278
  %172 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg56211, i64 0, i64 %10, i64 %11, i64 %12
  %173 = load double, ptr addrspace(1) %172, align 8, !invariant.load !278
  %multiply.2920.3.clone.1.clone.1 = fmul double %173, %114
  %174 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg55209, i64 0, i64 %10, i64 %11, i64 %12
  %175 = load double, ptr addrspace(1) %174, align 8, !invariant.load !278
  %multiply.2952.13.clone.1.clone.1 = fmul double %multiply.2920.3.clone.1.clone.1, %175
  %multiply.2953.11.clone.1.clone.1 = fmul double %multiply.2952.13.clone.1.clone.1, 5.000000e-01
  %176 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg54207, i64 0, i64 %10, i64 %11, i64 %12
  %177 = load double, ptr addrspace(1) %176, align 8, !invariant.load !278
  %multiply.2954.9.clone.1.clone.1 = fmul double %177, %multiply.2953.11.clone.1.clone.1
  %multiply.2922.5.clone.1.clone.1 = fmul double %multiply.2896.9.clone.1.clone.1, %173
  %178 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg53205, i64 0, i64 %10, i64 %11, i64 %12
  %179 = load double, ptr addrspace(1) %178, align 8, !invariant.load !278
  %multiply.2923.3.clone.1.clone.1 = fmul double %multiply.2922.5.clone.1.clone.1, %179
  %multiply.2955.11.clone.1.clone.1 = fmul double %175, %multiply.2923.3.clone.1.clone.1
  %add.4043.9.clone.1.clone.1 = fadd double %multiply.2954.9.clone.1.clone.1, %multiply.2955.11.clone.1.clone.1
  %multiply.2925.5.clone.1.clone.1 = fmul double %multiply.2896.9.clone.1.clone.1, 5.000000e-01
  %multiply.2926.3.clone.1.clone.1 = fmul double %multiply.2925.5.clone.1.clone.1, %179
  %multiply.2956.11.clone.1.clone.1 = fmul double %175, %multiply.2926.3.clone.1.clone.1
  %add.4044.9.clone.1.clone.1 = fadd double %multiply.2956.11.clone.1.clone.1, %add.4043.9.clone.1.clone.1
  %180 = trunc i8 %171 to i1
  %181 = select i1 %180, double %add.4044.9.clone.1.clone.1, double 0.000000e+00
  %multiply.2928.3.clone.1.clone.1 = fmul double %multiply.2900.9.clone.1.clone.1, %173
  %multiply.2957.7.clone.1.clone.1 = fmul double %multiply.2928.3.clone.1.clone.1, %175
  %add.4046.5.clone.1.clone.1 = fadd double %multiply.2957.7.clone.1.clone.1, %181
  %182 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg52203, i64 0, i64 %12, i64 0
  %183 = load double, ptr addrspace(1) %182, align 8, !invariant.load !278
  %add.4047.3.clone.1.clone.1 = fadd double %183, %add.4046.5.clone.1.clone.1
  %add.4048.1.clone.1.clone.1 = fadd double %add.4042.3.clone.1.clone.1, %add.4047.3.clone.1.clone.1
  %184 = getelementptr double, ptr addrspace(1) %arg60219, i64 %15
  %185 = load double, ptr addrspace(1) %184, align 8
  %186 = select i1 %18, double 0.000000e+00, double %185
  %187 = getelementptr double, ptr addrspace(1) %arg70239, i64 %15
  %188 = load double, ptr addrspace(1) %187, align 8
  %189 = select i1 %18, double 0.000000e+00, double %188
  %190 = getelementptr double, ptr addrspace(1) %arg61221, i64 %15
  %191 = load double, ptr addrspace(1) %190, align 8, !invariant.load !278
  %192 = getelementptr double, ptr addrspace(1) %arg69237, i64 %15
  %193 = load double, ptr addrspace(1) %192, align 8
  %194 = select i1 %18, double %193, double 0.000000e+00
  %195 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg68235, i64 0, i64 %10, i64 %11, i64 %12
  %196 = load double, ptr addrspace(1) %195, align 8, !invariant.load !278
  %multiply.2919.5.clone.1.clone.1 = fmul double %add.3978.3.clone.1.clone.1, %196
  %divide.598.13.clone.1.clone.1 = fdiv double %add.3978.3.clone.1.clone.1, %153
  %add.4000.11.clone.1.clone.1 = fadd double %divide.598.13.clone.1.clone.1, %multiply.2919.5.clone.1.clone.1
  %add.4001.9.clone.1.clone.1 = fadd double %194, %add.4000.11.clone.1.clone.1
  %197 = getelementptr double, ptr addrspace(1) %arg67233, i64 %15
  %198 = load double, ptr addrspace(1) %197, align 8, !invariant.load !278
  %add.4002.7.clone.1.clone.1 = fadd double %198, %add.4001.9.clone.1.clone.1
  %199 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg66231, i64 0, i64 %10, i64 %11, i64 %12
  %200 = load double, ptr addrspace(1) %199, align 8, !invariant.load !278
  %201 = select i1 %18, double %185, double 0.000000e+00
  %202 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg65229, i64 0, i64 %10, i64 %11, i64 %12
  %203 = load double, ptr addrspace(1) %202, align 8, !invariant.load !278
  %multiply.2921.17.clone.1.clone.1 = fmul double %multiply.2920.3.clone.1.clone.1, %203
  %204 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg64227, i64 0, i64 %10, i64 %11, i64 %12
  %205 = load double, ptr addrspace(1) %204, align 8, !invariant.load !278
  %multiply.2924.13.clone.1.clone.1 = fmul double %multiply.2923.3.clone.1.clone.1, %205
  %add.4003.15.clone.1.clone.1 = fadd double %multiply.2921.17.clone.1.clone.1, %multiply.2924.13.clone.1.clone.1
  %multiply.2927.13.clone.1.clone.1 = fmul double %multiply.2926.3.clone.1.clone.1, %205
  %add.4004.13.clone.1.clone.1 = fadd double %multiply.2927.13.clone.1.clone.1, %add.4003.15.clone.1.clone.1
  %206 = select i1 %52, double %add.4004.13.clone.1.clone.1, double 0.000000e+00
  %multiply.2929.11.clone.1.clone.1 = fmul double %multiply.2928.3.clone.1.clone.1, %205
  %add.4005.9.clone.1.clone.1 = fadd double %multiply.2929.11.clone.1.clone.1, %206
  %add.4006.9.clone.1.clone.1 = fadd double %201, %add.4005.9.clone.1.clone.1
  %add.4007.9.clone.1.clone.1 = fadd double %38, %add.4006.9.clone.1.clone.1
  %multiply.2930.5.clone.1.clone.1 = fmul double %200, %add.4007.9.clone.1.clone.1
  %add.4008.5.clone.1.clone.1 = fadd double %add.4002.7.clone.1.clone.1, %multiply.2930.5.clone.1.clone.1
  %207 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg63225, i64 0, i64 %10, i64 %11, i64 %12
  %208 = load double, ptr addrspace(1) %207, align 8, !invariant.load !278
  %209 = fneg double %add.4008.5.clone.1.clone.1
  %210 = fmul double %208, %209
  %211 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg62223, i64 0, i64 %10, i64 %11, i64 %12
  %212 = load double, ptr addrspace(1) %211, align 8, !invariant.load !278
  %213 = select i1 %18, double %166, double 0.000000e+00
  %add.4009.3.clone.1.clone.1 = fadd double %38, %213
  %214 = fneg double %add.4009.3.clone.1.clone.1
  %215 = fmul double %212, %214
  %216 = fmul double %212, %210
  %add.4010.5.clone.1.clone.1 = fsub double %215, %216
  %add.4011.3.clone.1.clone.1 = fadd double %191, %add.4010.5.clone.1.clone.1
  %add.4012.1.clone.1.clone.1 = fadd double %189, %add.4011.3.clone.1.clone.1
  %217 = getelementptr double, ptr addrspace(1) %arg74247, i64 %15
  %218 = load double, ptr addrspace(1) %217, align 8
  %add.4015.3.clone.1.clone.1 = fadd double %218, 0.000000e+00
  %219 = getelementptr double, ptr addrspace(1) %arg71241, i64 %15
  %220 = load double, ptr addrspace(1) %219, align 8, !invariant.load !278
  %221 = getelementptr inbounds [192 x [2 x [20 x i8]]], ptr addrspace(1) %arg73245, i64 0, i64 %10, i64 %11, i64 %12
  %222 = load i8, ptr addrspace(1) %221, align 1, !invariant.load !278
  %multiply.2935.11.clone.1.clone.1 = fmul double %108, %add.4007.9.clone.1.clone.1
  %add.4016.9.clone.1.clone.1 = fadd double %multiply.2935.11.clone.1.clone.1, %210
  %223 = trunc i8 %222 to i1
  %224 = select i1 %223, double %add.4016.9.clone.1.clone.1, double 0.000000e+00
  %225 = getelementptr inbounds [192 x [2 x [20 x double]]], ptr addrspace(1) %arg72243, i64 0, i64 %10, i64 %11, i64 %12
  %226 = load double, ptr addrspace(1) %225, align 8, !invariant.load !278
  %multiply.2936.5.clone.1.clone.1 = fmul double %226, %224
  %add.4017.1.clone.1.clone.1 = fadd double %220, %multiply.2936.5.clone.1.clone.1
  %add.4018.1.clone.1.clone.1 = fadd double %add.4015.3.clone.1.clone.1, %add.4017.1.clone.1.clone.1
  %227 = select i1 %18, double 0.000000e+00, double %57
  %228 = getelementptr double, ptr addrspace(1) %arg76251, i64 %15
  %229 = load double, ptr addrspace(1) %228, align 8, !invariant.load !278
  %multiply.2937.5.clone.1.clone.1 = fmul double %149, %multiply.2936.5.clone.1.clone.1
  %add.4019.3.clone.1.clone.1 = fadd double %229, %multiply.2937.5.clone.1.clone.1
  %230 = getelementptr double, ptr addrspace(1) %arg75249, i64 %15
  %231 = load double, ptr addrspace(1) %230, align 8
  %232 = select i1 %18, double %231, double 0.000000e+00
  %add.4020.3.clone.1.clone.1 = fadd double %58, %232
  %add.4021.3.clone.1.clone.1 = fadd double %38, %add.4020.3.clone.1.clone.1
  %multiply.2938.5.clone.1.clone.1 = fmul double %100, %add.4021.3.clone.1.clone.1
  %add.4022.3.clone.1.clone.1 = fadd double %multiply.2938.5.clone.1.clone.1, %add.4019.3.clone.1.clone.1
  %add.4023.1.clone.1.clone.1 = fadd double %227, %add.4022.3.clone.1.clone.1
  %233 = select i1 %18, double 0.000000e+00, double %231
  %234 = select i1 %18, double 0.000000e+00, double %110
  %add.4014.1.clone.1 = fadd double %38, %234
  %235 = select i1 %18, double 0.000000e+00, double %105
  %add.4013.1.clone.1 = fadd double %38, %235
  %236 = select i1 %18, double 0.000000e+00, double %193
  %237 = select i1 %18, double 0.000000e+00, double %102
  %238 = select i1 %18, double 0.000000e+00, double %130
  store double %add.4041.1, ptr addrspace(1) %16, align 8
  store double %add.4034.1.clone.1, ptr addrspace(1) %26, align 8
  store double %91, ptr addrspace(1) %68, align 8
  store double %92, ptr addrspace(1) %85, align 8
  store double %93, ptr addrspace(1) %41, align 8
  store double %add.3999.1.clone.1.clone.1, ptr addrspace(1) %94, align 8
  store double %167, ptr addrspace(1) %165, align 8
  store double %add.4048.1.clone.1.clone.1, ptr addrspace(1) %168, align 8
  store double %186, ptr addrspace(1) %184, align 8
  store double %add.4012.1.clone.1.clone.1, ptr addrspace(1) %187, align 8
  store double %add.4018.1.clone.1.clone.1, ptr addrspace(1) %217, align 8
  store double %add.4023.1.clone.1.clone.1, ptr addrspace(1) %56, align 8
  store double %233, ptr addrspace(1) %230, align 8
  store double %add.4014.1.clone.1, ptr addrspace(1) %109, align 8
  store double %add.4013.1.clone.1, ptr addrspace(1) %104, align 8
  store double %236, ptr addrspace(1) %192, align 8
  store double %237, ptr addrspace(1) %101, align 8
  store double %238, ptr addrspace(1) %129, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(320) %arg1) local_unnamed_addr #4 {
entry:
  %arg136 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg034 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !284
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
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
  br i1 %23, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !292

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
  %param_0.23762 = load double, ptr addrspace(1) %lsr.iv38, align 8, !invariant.load !278
  %add.3969.i29 = fadd double %partial_reduction_result.030, %param_0.23762
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
define void @input_concatenate_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg32, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg33, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg34, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg35) local_unnamed_addr #4 {
entry:
  %arg351042 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg341040 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg331038 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg321036 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg311034 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg301032 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg291030 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg281028 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg271026 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg261024 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg251022 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg241020 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg231018 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg221016 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg211014 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg201012 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg191010 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg181008 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg171006 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg161004 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg151002 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg141000 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13998 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12996 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11994 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10992 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9990 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8988 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7986 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6984 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5982 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4980 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3978 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2976 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1974 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0972 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !281
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %param_25.613528 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg251022, i64 0, i64 %1
  %param_32.226869 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg321036, i64 0, i64 %1
  %2 = shl nuw nsw i32 %thread.id.2, 1
  br label %loop3.loop_body401

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

x_in_tile-after:                                  ; preds = %concatenate.41.1.clone.1.merge713
  %3 = or i32 %thread.id.x, 32
  %4 = icmp ult i32 %3, 60
  br i1 %4, label %loop3.loop_header400.preheader.1, label %x_in_tile-after.7

loop3.loop_header400.preheader.1:                 ; preds = %x_in_tile-after
  %5 = shl nuw nsw i32 %3, 1
  %6 = icmp ult i32 %3, 40
  br i1 %6, label %concatenate.pivot.60.554.1, label %concatenate.pivot.100.555.1

concatenate.pivot.100.555.1:                      ; preds = %loop3.loop_header400.preheader.1
  %7 = icmp ult i32 %3, 50
  %8 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1509.1 = fmul double %8, 0x3F786F8FA34E82C5
  br i1 %7, label %concatenate.pivot.80.556.1, label %concatenate.pivot.100.557.1

concatenate.pivot.100.557.1:                      ; preds = %concatenate.pivot.100.555.1
  %9 = sext i32 %5 to i64
  %10 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg2976, i64 0, i64 %1, i64 %9
  %param_2.5653526.11044 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 -800
  %param_2.5653527.1 = load double, ptr addrspace(1) %param_2.5653526.11044, align 16, !invariant.load !278
  %11 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3978, i64 0, i64 %1, i64 %9
  %param_3.4129532.11045 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 -800
  %param_3.4129533.1 = load double, ptr addrspace(1) %param_3.4129532.11045, align 16, !invariant.load !278
  %multiply.3008.9.clone.1534.1 = fmul double %param_3.4129533.1, %multiply.3002.19.clone.1509.1
  %add.4171.9.clone.1535.1 = fadd double %param_2.5653527.1, %multiply.3008.9.clone.1534.1
  %12 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg0972, i64 0, i64 %1, i64 %9
  %param_0.5125536.11046 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 -800
  %param_0.5125537.1 = load double, ptr addrspace(1) %param_0.5125536.11046, align 16, !invariant.load !278
  %13 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg1974, i64 0, i64 %1, i64 %9
  %param_1.7163538.11047 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 -800
  %param_1.7163539.1 = load double, ptr addrspace(1) %param_1.7163538.11047, align 16, !invariant.load !278
  %add.4187.17.clone.1541.1 = fadd double %param_1.7163539.1, 6.000000e+00
  %multiply.3056.15.clone.1543.1 = fmul double %add.4187.17.clone.1541.1, 2.500000e-01
  %14 = fsub double %param_0.5125537.1, %multiply.3056.15.clone.1543.1
  %multiply.3057.5.clone.1545.1 = fmul double %multiply.3002.19.clone.1509.1, %14
  %add.4221.5.clone.1546.1 = fadd double %add.4171.9.clone.1535.1, %multiply.3057.5.clone.1545.1
  br label %concatenate.39.1.clone.1.merge405.1

concatenate.pivot.80.556.1:                       ; preds = %concatenate.pivot.100.555.1
  %15 = add nsw i32 %5, -80
  %16 = zext nneg i32 %15 to i64
  %param_6.1884504.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6984, i64 0, i64 %1, i64 %16
  %param_6.1884505.1 = load double, ptr addrspace(1) %param_6.1884504.1, align 16, !invariant.load !278
  %param_7.1662510.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7986, i64 0, i64 %1, i64 %16
  %param_7.1662511.1 = load double, ptr addrspace(1) %param_7.1662510.1, align 16, !invariant.load !278
  %multiply.3007.9.clone.1512.1 = fmul double %param_7.1662511.1, %multiply.3002.19.clone.1509.1
  %add.4169.9.clone.1513.1 = fadd double %param_6.1884505.1, %multiply.3007.9.clone.1512.1
  %param_4.2856514.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4980, i64 0, i64 %1, i64 %16
  %param_4.2856515.1 = load double, ptr addrspace(1) %param_4.2856514.1, align 16, !invariant.load !278
  %param_5.2406516.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg5982, i64 0, i64 %1, i64 %16
  %param_5.2406517.1 = load double, ptr addrspace(1) %param_5.2406516.1, align 16, !invariant.load !278
  %add.4174.17.clone.1519.1 = fadd double %param_5.2406517.1, 4.000000e+00
  %multiply.3054.15.clone.1521.1 = fmul double %add.4174.17.clone.1519.1, 2.500000e-01
  %17 = fsub double %param_4.2856515.1, %multiply.3054.15.clone.1521.1
  %multiply.3055.5.clone.1523.1 = fmul double %multiply.3002.19.clone.1509.1, %17
  %add.4218.5.clone.1524.1 = fadd double %add.4169.9.clone.1513.1, %multiply.3055.5.clone.1523.1
  br label %concatenate.39.1.clone.1.merge405.1

concatenate.pivot.60.554.1:                       ; preds = %loop3.loop_header400.preheader.1
  %18 = add nsw i32 %5, -60
  %19 = zext nneg i32 %18 to i64
  %param_10.1119483.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10992, i64 0, i64 %1, i64 %19
  %param_10.1119484.1 = load double, ptr addrspace(1) %param_10.1119483.1, align 16, !invariant.load !278
  %20 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1488.1 = fmul double %20, 0x3F786F8FA34E82C5
  %param_11.924489.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg11994, i64 0, i64 %1, i64 %19
  %param_11.924490.1 = load double, ptr addrspace(1) %param_11.924489.1, align 16, !invariant.load !278
  %multiply.3006.9.clone.1491.1 = fmul double %param_11.924490.1, %multiply.3002.19.clone.1488.1
  %add.4168.9.clone.1492.1 = fadd double %param_10.1119484.1, %multiply.3006.9.clone.1491.1
  %param_8.1467493.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8988, i64 0, i64 %1, i64 %19
  %param_8.1467494.1 = load double, ptr addrspace(1) %param_8.1467493.1, align 16, !invariant.load !278
  %param_9.1328495.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9990, i64 0, i64 %1, i64 %19
  %param_9.1328496.1 = load double, ptr addrspace(1) %param_9.1328495.1, align 16, !invariant.load !278
  %add.4197.14.clone.1498.1 = fadd double %param_9.1328496.1, -1.000000e+00
  %add.4214.13.clone.1500.1 = fsub double %param_8.1467494.1, %add.4197.14.clone.1498.1
  %multiply.3053.5.clone.1501.1 = fmul double %multiply.3002.19.clone.1488.1, %add.4214.13.clone.1500.1
  %add.4216.5.clone.1502.1 = fadd double %add.4168.9.clone.1492.1, %multiply.3053.5.clone.1501.1
  br label %concatenate.39.1.clone.1.merge405.1

concatenate.39.1.clone.1.merge405.1:              ; preds = %concatenate.pivot.60.554.1, %concatenate.pivot.80.556.1, %concatenate.pivot.100.557.1
  %21 = phi double [ %add.4216.5.clone.1502.1, %concatenate.pivot.60.554.1 ], [ %add.4218.5.clone.1524.1, %concatenate.pivot.80.556.1 ], [ %add.4221.5.clone.1546.1, %concatenate.pivot.100.557.1 ]
  %22 = icmp ult i32 %3, 40
  %multiply.3058.1558.1 = fmul double %21, %21
  %add.3969.i949.1 = fadd double %add.3969.i949, %multiply.3058.1558.1
  br i1 %22, label %concatenate.pivot.60.709.1, label %concatenate.pivot.100.710.1

concatenate.pivot.100.710.1:                      ; preds = %concatenate.39.1.clone.1.merge405.1
  %23 = icmp ult i32 %3, 50
  %24 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1664.1 = fmul double %24, 0x3F786F8FA34E82C5
  br i1 %23, label %concatenate.pivot.80.711.1, label %concatenate.pivot.100.712.1

concatenate.pivot.100.712.1:                      ; preds = %concatenate.pivot.100.710.1
  %25 = sext i32 %5 to i64
  %26 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg2976, i64 0, i64 %1, i64 %25
  %param_2.5653681.11048 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 -800
  %param_2.5653682.1 = load double, ptr addrspace(1) %param_2.5653681.11048, align 16, !invariant.load !278
  %27 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3978, i64 0, i64 %1, i64 %25
  %param_3.4129687.11049 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 -800
  %param_3.4129688.1 = load double, ptr addrspace(1) %param_3.4129687.11049, align 16, !invariant.load !278
  %multiply.3008.9.clone.1689.1 = fmul double %param_3.4129688.1, %multiply.3002.19.clone.1664.1
  %add.4171.9.clone.1690.1 = fadd double %param_2.5653682.1, %multiply.3008.9.clone.1689.1
  %28 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg0972, i64 0, i64 %1, i64 %25
  %param_0.5125691.11050 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 -800
  %param_0.5125692.1 = load double, ptr addrspace(1) %param_0.5125691.11050, align 16, !invariant.load !278
  %29 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg1974, i64 0, i64 %1, i64 %25
  %param_1.7163693.11051 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 -800
  %param_1.7163694.1 = load double, ptr addrspace(1) %param_1.7163693.11051, align 16, !invariant.load !278
  %add.4187.17.clone.1696.1 = fadd double %param_1.7163694.1, 6.000000e+00
  %multiply.3056.15.clone.1698.1 = fmul double %add.4187.17.clone.1696.1, 2.500000e-01
  %30 = fsub double %param_0.5125692.1, %multiply.3056.15.clone.1698.1
  %multiply.3057.5.clone.1700.1 = fmul double %multiply.3002.19.clone.1664.1, %30
  %add.4221.5.clone.1701.1 = fadd double %add.4171.9.clone.1690.1, %multiply.3057.5.clone.1700.1
  br label %concatenate.pivot.80.903.1

concatenate.pivot.80.711.1:                       ; preds = %concatenate.pivot.100.710.1
  %31 = add nsw i32 %5, -80
  %32 = zext nneg i32 %31 to i64
  %param_6.1884659.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6984, i64 0, i64 %1, i64 %32
  %param_6.1884660.1 = load double, ptr addrspace(1) %param_6.1884659.1, align 16, !invariant.load !278
  %param_7.1662665.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7986, i64 0, i64 %1, i64 %32
  %param_7.1662666.1 = load double, ptr addrspace(1) %param_7.1662665.1, align 16, !invariant.load !278
  %multiply.3007.9.clone.1667.1 = fmul double %param_7.1662666.1, %multiply.3002.19.clone.1664.1
  %add.4169.9.clone.1668.1 = fadd double %param_6.1884660.1, %multiply.3007.9.clone.1667.1
  %param_4.2856669.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4980, i64 0, i64 %1, i64 %32
  %param_4.2856670.1 = load double, ptr addrspace(1) %param_4.2856669.1, align 16, !invariant.load !278
  %param_5.2406671.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg5982, i64 0, i64 %1, i64 %32
  %param_5.2406672.1 = load double, ptr addrspace(1) %param_5.2406671.1, align 16, !invariant.load !278
  %add.4174.17.clone.1674.1 = fadd double %param_5.2406672.1, 4.000000e+00
  %multiply.3054.15.clone.1676.1 = fmul double %add.4174.17.clone.1674.1, 2.500000e-01
  %33 = fsub double %param_4.2856670.1, %multiply.3054.15.clone.1676.1
  %multiply.3055.5.clone.1678.1 = fmul double %multiply.3002.19.clone.1664.1, %33
  %add.4218.5.clone.1679.1 = fadd double %add.4169.9.clone.1668.1, %multiply.3055.5.clone.1678.1
  br label %concatenate.pivot.80.903.1

concatenate.pivot.60.709.1:                       ; preds = %concatenate.39.1.clone.1.merge405.1
  %34 = add nsw i32 %5, -60
  %35 = zext nneg i32 %34 to i64
  %param_10.1119638.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10992, i64 0, i64 %1, i64 %35
  %param_10.1119639.1 = load double, ptr addrspace(1) %param_10.1119638.1, align 16, !invariant.load !278
  %36 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1643.1 = fmul double %36, 0x3F786F8FA34E82C5
  %param_11.924644.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg11994, i64 0, i64 %1, i64 %35
  %param_11.924645.1 = load double, ptr addrspace(1) %param_11.924644.1, align 16, !invariant.load !278
  %multiply.3006.9.clone.1646.1 = fmul double %param_11.924645.1, %multiply.3002.19.clone.1643.1
  %add.4168.9.clone.1647.1 = fadd double %param_10.1119639.1, %multiply.3006.9.clone.1646.1
  %param_8.1467648.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8988, i64 0, i64 %1, i64 %35
  %param_8.1467649.1 = load double, ptr addrspace(1) %param_8.1467648.1, align 16, !invariant.load !278
  %param_9.1328650.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9990, i64 0, i64 %1, i64 %35
  %param_9.1328651.1 = load double, ptr addrspace(1) %param_9.1328650.1, align 16, !invariant.load !278
  %add.4197.14.clone.1653.1 = fadd double %param_9.1328651.1, -1.000000e+00
  %add.4214.13.clone.1655.1 = fsub double %param_8.1467649.1, %add.4197.14.clone.1653.1
  %multiply.3053.5.clone.1656.1 = fmul double %multiply.3002.19.clone.1643.1, %add.4214.13.clone.1655.1
  %add.4216.5.clone.1657.1 = fadd double %add.4168.9.clone.1647.1, %multiply.3053.5.clone.1656.1
  br label %concatenate.pivot.80.903.1

concatenate.pivot.80.903.1:                       ; preds = %concatenate.pivot.100.712.1, %concatenate.pivot.80.711.1, %concatenate.pivot.60.709.1
  %37 = phi double [ %add.4216.5.clone.1657.1, %concatenate.pivot.60.709.1 ], [ %add.4218.5.clone.1679.1, %concatenate.pivot.80.711.1 ], [ %add.4221.5.clone.1701.1, %concatenate.pivot.100.712.1 ]
  %38 = icmp ult i32 %3, 40
  br i1 %38, label %concatenate.pivot.60.904.1, label %concatenate.pivot.100.905.1

concatenate.pivot.100.905.1:                      ; preds = %concatenate.pivot.80.903.1
  %39 = icmp ult i32 %3, 50
  %40 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1851.1 = fmul double %40, 0x3F786F8FA34E82C5
  br i1 %39, label %concatenate.pivot.80.906.1, label %concatenate.pivot.100.907.1

concatenate.pivot.100.907.1:                      ; preds = %concatenate.pivot.100.905.1
  %41 = icmp eq i64 %param_32.226813.1, 0
  %42 = sext i32 %5 to i64
  %43 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg261024, i64 0, i64 %1, i64 %42
  %param_26.560873.11052 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 -800
  %param_26.560874.1 = load double, ptr addrspace(1) %param_26.560873.11052, align 16, !invariant.load !278
  %44 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg2976, i64 0, i64 %1, i64 %42
  %param_2.5653875.11053 = getelementptr inbounds i8, ptr addrspace(1) %44, i64 -800
  %param_2.5653876.1 = load double, ptr addrspace(1) %param_2.5653875.11053, align 16, !invariant.load !278
  %45 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3978, i64 0, i64 %1, i64 %42
  %param_3.4129881.11054 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 -800
  %param_3.4129882.1 = load double, ptr addrspace(1) %param_3.4129881.11054, align 16, !invariant.load !278
  %multiply.3008.9.clone.1883.1 = fmul double %param_3.4129882.1, %multiply.3002.19.clone.1851.1
  %add.4171.9.clone.1884.1 = fadd double %param_2.5653876.1, %multiply.3008.9.clone.1883.1
  %46 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg0972, i64 0, i64 %1, i64 %42
  %param_0.5125885.11055 = getelementptr inbounds i8, ptr addrspace(1) %46, i64 -800
  %param_0.5125886.1 = load double, ptr addrspace(1) %param_0.5125885.11055, align 16, !invariant.load !278
  %47 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg1974, i64 0, i64 %1, i64 %42
  %param_1.7163887.11056 = getelementptr inbounds i8, ptr addrspace(1) %47, i64 -800
  %param_1.7163888.1 = load double, ptr addrspace(1) %param_1.7163887.11056, align 16, !invariant.load !278
  %add.4187.17.clone.1890.1 = fadd double %param_1.7163888.1, 6.000000e+00
  %multiply.3056.15.clone.1892.1 = fmul double %add.4187.17.clone.1890.1, 2.500000e-01
  %48 = fsub double %param_0.5125886.1, %multiply.3056.15.clone.1892.1
  %multiply.3057.5.clone.1894.1 = fmul double %multiply.3002.19.clone.1851.1, %48
  %add.4221.5.clone.1895.1 = fadd double %add.4171.9.clone.1884.1, %multiply.3057.5.clone.1894.1
  %add.4236.3.clone.1896.1 = fadd double %param_26.560874.1, %add.4221.5.clone.1895.1
  %49 = select i1 %41, double %add.4221.5.clone.1895.1, double %add.4236.3.clone.1896.1
  br label %concatenate.41.1.clone.1.merge713.1

concatenate.pivot.80.906.1:                       ; preds = %concatenate.pivot.100.905.1
  %50 = icmp eq i64 %param_32.226813.1, 0
  %51 = add nsw i32 %5, -80
  %52 = zext nneg i32 %51 to i64
  %param_27.555844.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg271026, i64 0, i64 %1, i64 %52
  %param_27.555845.1 = load double, ptr addrspace(1) %param_27.555844.1, align 16, !invariant.load !278
  %param_6.1884846.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6984, i64 0, i64 %1, i64 %52
  %param_6.1884847.1 = load double, ptr addrspace(1) %param_6.1884846.1, align 16, !invariant.load !278
  %param_7.1662852.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7986, i64 0, i64 %1, i64 %52
  %param_7.1662853.1 = load double, ptr addrspace(1) %param_7.1662852.1, align 16, !invariant.load !278
  %multiply.3007.9.clone.1854.1 = fmul double %param_7.1662853.1, %multiply.3002.19.clone.1851.1
  %add.4169.9.clone.1855.1 = fadd double %param_6.1884847.1, %multiply.3007.9.clone.1854.1
  %param_4.2856856.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4980, i64 0, i64 %1, i64 %52
  %param_4.2856857.1 = load double, ptr addrspace(1) %param_4.2856856.1, align 16, !invariant.load !278
  %param_5.2406858.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg5982, i64 0, i64 %1, i64 %52
  %param_5.2406859.1 = load double, ptr addrspace(1) %param_5.2406858.1, align 16, !invariant.load !278
  %add.4174.17.clone.1861.1 = fadd double %param_5.2406859.1, 4.000000e+00
  %multiply.3054.15.clone.1863.1 = fmul double %add.4174.17.clone.1861.1, 2.500000e-01
  %53 = fsub double %param_4.2856857.1, %multiply.3054.15.clone.1863.1
  %multiply.3055.5.clone.1865.1 = fmul double %multiply.3002.19.clone.1851.1, %53
  %add.4218.5.clone.1866.1 = fadd double %add.4169.9.clone.1855.1, %multiply.3055.5.clone.1865.1
  %add.4234.3.clone.1867.1 = fadd double %param_27.555845.1, %add.4218.5.clone.1866.1
  %54 = select i1 %50, double %add.4218.5.clone.1866.1, double %add.4234.3.clone.1867.1
  br label %concatenate.41.1.clone.1.merge713.1

concatenate.pivot.60.904.1:                       ; preds = %concatenate.pivot.80.903.1
  %55 = icmp eq i64 %param_32.226813.1, 0
  %56 = add nsw i32 %5, -60
  %57 = zext nneg i32 %56 to i64
  %param_28.477816.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg281028, i64 0, i64 %1, i64 %57
  %param_28.477817.1 = load double, ptr addrspace(1) %param_28.477816.1, align 16, !invariant.load !278
  %param_10.1119818.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10992, i64 0, i64 %1, i64 %57
  %param_10.1119819.1 = load double, ptr addrspace(1) %param_10.1119818.1, align 16, !invariant.load !278
  %58 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1823.1 = fmul double %58, 0x3F786F8FA34E82C5
  %param_11.924824.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg11994, i64 0, i64 %1, i64 %57
  %param_11.924825.1 = load double, ptr addrspace(1) %param_11.924824.1, align 16, !invariant.load !278
  %multiply.3006.9.clone.1826.1 = fmul double %param_11.924825.1, %multiply.3002.19.clone.1823.1
  %add.4168.9.clone.1827.1 = fadd double %param_10.1119819.1, %multiply.3006.9.clone.1826.1
  %param_8.1467828.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8988, i64 0, i64 %1, i64 %57
  %param_8.1467829.1 = load double, ptr addrspace(1) %param_8.1467828.1, align 16, !invariant.load !278
  %param_9.1328830.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9990, i64 0, i64 %1, i64 %57
  %param_9.1328831.1 = load double, ptr addrspace(1) %param_9.1328830.1, align 16, !invariant.load !278
  %add.4197.14.clone.1833.1 = fadd double %param_9.1328831.1, -1.000000e+00
  %add.4214.13.clone.1835.1 = fsub double %param_8.1467829.1, %add.4197.14.clone.1833.1
  %multiply.3053.5.clone.1836.1 = fmul double %multiply.3002.19.clone.1823.1, %add.4214.13.clone.1835.1
  %add.4216.5.clone.1837.1 = fadd double %add.4168.9.clone.1827.1, %multiply.3053.5.clone.1836.1
  %add.4233.3.clone.1838.1 = fadd double %param_28.477817.1, %add.4216.5.clone.1837.1
  %59 = select i1 %55, double %add.4216.5.clone.1837.1, double %add.4233.3.clone.1838.1
  br label %concatenate.41.1.clone.1.merge713.1

concatenate.41.1.clone.1.merge713.1:              ; preds = %concatenate.pivot.60.904.1, %concatenate.pivot.80.906.1, %concatenate.pivot.100.907.1
  %60 = phi double [ %59, %concatenate.pivot.60.904.1 ], [ %54, %concatenate.pivot.80.906.1 ], [ %49, %concatenate.pivot.100.907.1 ]
  %61 = icmp ult i32 %3, 40
  %62 = zext nneg i32 %5 to i64
  %63 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg341040, i64 0, i64 %1, i64 %62
  store double %37, ptr addrspace(1) %63, align 16
  %64 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg351042, i64 0, i64 %1, i64 %62
  store double %60, ptr addrspace(1) %64, align 16
  br i1 %61, label %concatenate.pivot.60.554.1.1, label %concatenate.pivot.100.555.1.1

concatenate.pivot.100.555.1.1:                    ; preds = %concatenate.41.1.clone.1.merge713.1
  %65 = icmp ult i32 %3, 50
  %66 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1509.1.1 = fmul double %66, 0x3F786F8FA34E82C5
  br i1 %65, label %concatenate.pivot.80.556.1.1, label %concatenate.pivot.100.557.1.1

concatenate.pivot.100.557.1.1:                    ; preds = %concatenate.pivot.100.555.1.1
  %67 = sext i32 %5 to i64
  %68 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg2976, i64 0, i64 %1, i64 %67
  %param_2.5653526.1.11057 = getelementptr inbounds i8, ptr addrspace(1) %68, i64 -792
  %param_2.5653527.1.1 = load double, ptr addrspace(1) %param_2.5653526.1.11057, align 8, !invariant.load !278
  %69 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3978, i64 0, i64 %1, i64 %67
  %param_3.4129532.1.11058 = getelementptr inbounds i8, ptr addrspace(1) %69, i64 -792
  %param_3.4129533.1.1 = load double, ptr addrspace(1) %param_3.4129532.1.11058, align 8, !invariant.load !278
  %multiply.3008.9.clone.1534.1.1 = fmul double %param_3.4129533.1.1, %multiply.3002.19.clone.1509.1.1
  %add.4171.9.clone.1535.1.1 = fadd double %param_2.5653527.1.1, %multiply.3008.9.clone.1534.1.1
  %70 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg0972, i64 0, i64 %1, i64 %67
  %param_0.5125536.1.11059 = getelementptr inbounds i8, ptr addrspace(1) %70, i64 -792
  %param_0.5125537.1.1 = load double, ptr addrspace(1) %param_0.5125536.1.11059, align 8, !invariant.load !278
  %71 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg1974, i64 0, i64 %1, i64 %67
  %param_1.7163538.1.11060 = getelementptr inbounds i8, ptr addrspace(1) %71, i64 -792
  %param_1.7163539.1.1 = load double, ptr addrspace(1) %param_1.7163538.1.11060, align 8, !invariant.load !278
  %add.4187.17.clone.1541.1.1 = fadd double %param_1.7163539.1.1, 6.000000e+00
  %multiply.3056.15.clone.1543.1.1 = fmul double %add.4187.17.clone.1541.1.1, 2.500000e-01
  %72 = fsub double %param_0.5125537.1.1, %multiply.3056.15.clone.1543.1.1
  %multiply.3057.5.clone.1545.1.1 = fmul double %multiply.3002.19.clone.1509.1.1, %72
  %add.4221.5.clone.1546.1.1 = fadd double %add.4171.9.clone.1535.1.1, %multiply.3057.5.clone.1545.1.1
  br label %concatenate.39.1.clone.1.merge405.1.1

concatenate.pivot.80.556.1.1:                     ; preds = %concatenate.pivot.100.555.1.1
  %73 = add nsw i32 %5, -79
  %74 = zext nneg i32 %73 to i64
  %param_6.1884504.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6984, i64 0, i64 %1, i64 %74
  %param_6.1884505.1.1 = load double, ptr addrspace(1) %param_6.1884504.1.1, align 8, !invariant.load !278
  %param_7.1662510.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7986, i64 0, i64 %1, i64 %74
  %param_7.1662511.1.1 = load double, ptr addrspace(1) %param_7.1662510.1.1, align 8, !invariant.load !278
  %multiply.3007.9.clone.1512.1.1 = fmul double %param_7.1662511.1.1, %multiply.3002.19.clone.1509.1.1
  %add.4169.9.clone.1513.1.1 = fadd double %param_6.1884505.1.1, %multiply.3007.9.clone.1512.1.1
  %param_4.2856514.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4980, i64 0, i64 %1, i64 %74
  %param_4.2856515.1.1 = load double, ptr addrspace(1) %param_4.2856514.1.1, align 8, !invariant.load !278
  %param_5.2406516.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg5982, i64 0, i64 %1, i64 %74
  %param_5.2406517.1.1 = load double, ptr addrspace(1) %param_5.2406516.1.1, align 8, !invariant.load !278
  %add.4174.17.clone.1519.1.1 = fadd double %param_5.2406517.1.1, 4.000000e+00
  %multiply.3054.15.clone.1521.1.1 = fmul double %add.4174.17.clone.1519.1.1, 2.500000e-01
  %75 = fsub double %param_4.2856515.1.1, %multiply.3054.15.clone.1521.1.1
  %multiply.3055.5.clone.1523.1.1 = fmul double %multiply.3002.19.clone.1509.1.1, %75
  %add.4218.5.clone.1524.1.1 = fadd double %add.4169.9.clone.1513.1.1, %multiply.3055.5.clone.1523.1.1
  br label %concatenate.39.1.clone.1.merge405.1.1

concatenate.pivot.60.554.1.1:                     ; preds = %concatenate.41.1.clone.1.merge713.1
  %76 = add nsw i32 %5, -59
  %77 = zext nneg i32 %76 to i64
  %param_10.1119483.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10992, i64 0, i64 %1, i64 %77
  %param_10.1119484.1.1 = load double, ptr addrspace(1) %param_10.1119483.1.1, align 8, !invariant.load !278
  %78 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1488.1.1 = fmul double %78, 0x3F786F8FA34E82C5
  %param_11.924489.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg11994, i64 0, i64 %1, i64 %77
  %param_11.924490.1.1 = load double, ptr addrspace(1) %param_11.924489.1.1, align 8, !invariant.load !278
  %multiply.3006.9.clone.1491.1.1 = fmul double %param_11.924490.1.1, %multiply.3002.19.clone.1488.1.1
  %add.4168.9.clone.1492.1.1 = fadd double %param_10.1119484.1.1, %multiply.3006.9.clone.1491.1.1
  %param_8.1467493.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8988, i64 0, i64 %1, i64 %77
  %param_8.1467494.1.1 = load double, ptr addrspace(1) %param_8.1467493.1.1, align 8, !invariant.load !278
  %param_9.1328495.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9990, i64 0, i64 %1, i64 %77
  %param_9.1328496.1.1 = load double, ptr addrspace(1) %param_9.1328495.1.1, align 8, !invariant.load !278
  %add.4197.14.clone.1498.1.1 = fadd double %param_9.1328496.1.1, -1.000000e+00
  %add.4214.13.clone.1500.1.1 = fsub double %param_8.1467494.1.1, %add.4197.14.clone.1498.1.1
  %multiply.3053.5.clone.1501.1.1 = fmul double %multiply.3002.19.clone.1488.1.1, %add.4214.13.clone.1500.1.1
  %add.4216.5.clone.1502.1.1 = fadd double %add.4168.9.clone.1492.1.1, %multiply.3053.5.clone.1501.1.1
  br label %concatenate.39.1.clone.1.merge405.1.1

concatenate.39.1.clone.1.merge405.1.1:            ; preds = %concatenate.pivot.60.554.1.1, %concatenate.pivot.80.556.1.1, %concatenate.pivot.100.557.1.1
  %79 = phi double [ %add.4216.5.clone.1502.1.1, %concatenate.pivot.60.554.1.1 ], [ %add.4218.5.clone.1524.1.1, %concatenate.pivot.80.556.1.1 ], [ %add.4221.5.clone.1546.1.1, %concatenate.pivot.100.557.1.1 ]
  %80 = icmp ult i32 %3, 40
  %multiply.3058.1558.1.1 = fmul double %79, %79
  %add.3969.i949.1.1 = fadd double %add.3969.i949.1, %multiply.3058.1558.1.1
  br i1 %80, label %concatenate.pivot.60.709.1.1, label %concatenate.pivot.100.710.1.1

concatenate.pivot.100.710.1.1:                    ; preds = %concatenate.39.1.clone.1.merge405.1.1
  %81 = icmp ult i32 %3, 50
  %82 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1664.1.1 = fmul double %82, 0x3F786F8FA34E82C5
  br i1 %81, label %concatenate.pivot.80.711.1.1, label %concatenate.pivot.100.712.1.1

concatenate.pivot.100.712.1.1:                    ; preds = %concatenate.pivot.100.710.1.1
  %83 = sext i32 %5 to i64
  %84 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg2976, i64 0, i64 %1, i64 %83
  %param_2.5653681.1.11061 = getelementptr inbounds i8, ptr addrspace(1) %84, i64 -792
  %param_2.5653682.1.1 = load double, ptr addrspace(1) %param_2.5653681.1.11061, align 8, !invariant.load !278
  %85 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3978, i64 0, i64 %1, i64 %83
  %param_3.4129687.1.11062 = getelementptr inbounds i8, ptr addrspace(1) %85, i64 -792
  %param_3.4129688.1.1 = load double, ptr addrspace(1) %param_3.4129687.1.11062, align 8, !invariant.load !278
  %multiply.3008.9.clone.1689.1.1 = fmul double %param_3.4129688.1.1, %multiply.3002.19.clone.1664.1.1
  %add.4171.9.clone.1690.1.1 = fadd double %param_2.5653682.1.1, %multiply.3008.9.clone.1689.1.1
  %86 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg0972, i64 0, i64 %1, i64 %83
  %param_0.5125691.1.11063 = getelementptr inbounds i8, ptr addrspace(1) %86, i64 -792
  %param_0.5125692.1.1 = load double, ptr addrspace(1) %param_0.5125691.1.11063, align 8, !invariant.load !278
  %87 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg1974, i64 0, i64 %1, i64 %83
  %param_1.7163693.1.11064 = getelementptr inbounds i8, ptr addrspace(1) %87, i64 -792
  %param_1.7163694.1.1 = load double, ptr addrspace(1) %param_1.7163693.1.11064, align 8, !invariant.load !278
  %add.4187.17.clone.1696.1.1 = fadd double %param_1.7163694.1.1, 6.000000e+00
  %multiply.3056.15.clone.1698.1.1 = fmul double %add.4187.17.clone.1696.1.1, 2.500000e-01
  %88 = fsub double %param_0.5125692.1.1, %multiply.3056.15.clone.1698.1.1
  %multiply.3057.5.clone.1700.1.1 = fmul double %multiply.3002.19.clone.1664.1.1, %88
  %add.4221.5.clone.1701.1.1 = fadd double %add.4171.9.clone.1690.1.1, %multiply.3057.5.clone.1700.1.1
  br label %concatenate.pivot.80.903.1.1

concatenate.pivot.80.711.1.1:                     ; preds = %concatenate.pivot.100.710.1.1
  %89 = add nsw i32 %5, -79
  %90 = zext nneg i32 %89 to i64
  %param_6.1884659.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6984, i64 0, i64 %1, i64 %90
  %param_6.1884660.1.1 = load double, ptr addrspace(1) %param_6.1884659.1.1, align 8, !invariant.load !278
  %param_7.1662665.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7986, i64 0, i64 %1, i64 %90
  %param_7.1662666.1.1 = load double, ptr addrspace(1) %param_7.1662665.1.1, align 8, !invariant.load !278
  %multiply.3007.9.clone.1667.1.1 = fmul double %param_7.1662666.1.1, %multiply.3002.19.clone.1664.1.1
  %add.4169.9.clone.1668.1.1 = fadd double %param_6.1884660.1.1, %multiply.3007.9.clone.1667.1.1
  %param_4.2856669.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4980, i64 0, i64 %1, i64 %90
  %param_4.2856670.1.1 = load double, ptr addrspace(1) %param_4.2856669.1.1, align 8, !invariant.load !278
  %param_5.2406671.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg5982, i64 0, i64 %1, i64 %90
  %param_5.2406672.1.1 = load double, ptr addrspace(1) %param_5.2406671.1.1, align 8, !invariant.load !278
  %add.4174.17.clone.1674.1.1 = fadd double %param_5.2406672.1.1, 4.000000e+00
  %multiply.3054.15.clone.1676.1.1 = fmul double %add.4174.17.clone.1674.1.1, 2.500000e-01
  %91 = fsub double %param_4.2856670.1.1, %multiply.3054.15.clone.1676.1.1
  %multiply.3055.5.clone.1678.1.1 = fmul double %multiply.3002.19.clone.1664.1.1, %91
  %add.4218.5.clone.1679.1.1 = fadd double %add.4169.9.clone.1668.1.1, %multiply.3055.5.clone.1678.1.1
  br label %concatenate.pivot.80.903.1.1

concatenate.pivot.60.709.1.1:                     ; preds = %concatenate.39.1.clone.1.merge405.1.1
  %92 = add nsw i32 %5, -59
  %93 = zext nneg i32 %92 to i64
  %param_10.1119638.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10992, i64 0, i64 %1, i64 %93
  %param_10.1119639.1.1 = load double, ptr addrspace(1) %param_10.1119638.1.1, align 8, !invariant.load !278
  %94 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1643.1.1 = fmul double %94, 0x3F786F8FA34E82C5
  %param_11.924644.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg11994, i64 0, i64 %1, i64 %93
  %param_11.924645.1.1 = load double, ptr addrspace(1) %param_11.924644.1.1, align 8, !invariant.load !278
  %multiply.3006.9.clone.1646.1.1 = fmul double %param_11.924645.1.1, %multiply.3002.19.clone.1643.1.1
  %add.4168.9.clone.1647.1.1 = fadd double %param_10.1119639.1.1, %multiply.3006.9.clone.1646.1.1
  %param_8.1467648.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8988, i64 0, i64 %1, i64 %93
  %param_8.1467649.1.1 = load double, ptr addrspace(1) %param_8.1467648.1.1, align 8, !invariant.load !278
  %param_9.1328650.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9990, i64 0, i64 %1, i64 %93
  %param_9.1328651.1.1 = load double, ptr addrspace(1) %param_9.1328650.1.1, align 8, !invariant.load !278
  %add.4197.14.clone.1653.1.1 = fadd double %param_9.1328651.1.1, -1.000000e+00
  %add.4214.13.clone.1655.1.1 = fsub double %param_8.1467649.1.1, %add.4197.14.clone.1653.1.1
  %multiply.3053.5.clone.1656.1.1 = fmul double %multiply.3002.19.clone.1643.1.1, %add.4214.13.clone.1655.1.1
  %add.4216.5.clone.1657.1.1 = fadd double %add.4168.9.clone.1647.1.1, %multiply.3053.5.clone.1656.1.1
  br label %concatenate.pivot.80.903.1.1

concatenate.pivot.80.903.1.1:                     ; preds = %concatenate.pivot.100.712.1.1, %concatenate.pivot.80.711.1.1, %concatenate.pivot.60.709.1.1
  %95 = phi double [ %add.4216.5.clone.1657.1.1, %concatenate.pivot.60.709.1.1 ], [ %add.4218.5.clone.1679.1.1, %concatenate.pivot.80.711.1.1 ], [ %add.4221.5.clone.1701.1.1, %concatenate.pivot.100.712.1.1 ]
  %96 = icmp ult i32 %3, 40
  br i1 %96, label %concatenate.pivot.60.904.1.1, label %concatenate.pivot.100.905.1.1

concatenate.pivot.100.905.1.1:                    ; preds = %concatenate.pivot.80.903.1.1
  %97 = icmp ult i32 %3, 50
  %98 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1851.1.1 = fmul double %98, 0x3F786F8FA34E82C5
  br i1 %97, label %concatenate.pivot.80.906.1.1, label %concatenate.pivot.100.907.1.1

concatenate.pivot.100.907.1.1:                    ; preds = %concatenate.pivot.100.905.1.1
  %99 = icmp eq i64 %param_32.226813.1, 0
  %100 = sext i32 %5 to i64
  %101 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg261024, i64 0, i64 %1, i64 %100
  %param_26.560873.1.11065 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 -792
  %param_26.560874.1.1 = load double, ptr addrspace(1) %param_26.560873.1.11065, align 8, !invariant.load !278
  %102 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg2976, i64 0, i64 %1, i64 %100
  %param_2.5653875.1.11066 = getelementptr inbounds i8, ptr addrspace(1) %102, i64 -792
  %param_2.5653876.1.1 = load double, ptr addrspace(1) %param_2.5653875.1.11066, align 8, !invariant.load !278
  %103 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3978, i64 0, i64 %1, i64 %100
  %param_3.4129881.1.11067 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 -792
  %param_3.4129882.1.1 = load double, ptr addrspace(1) %param_3.4129881.1.11067, align 8, !invariant.load !278
  %multiply.3008.9.clone.1883.1.1 = fmul double %param_3.4129882.1.1, %multiply.3002.19.clone.1851.1.1
  %add.4171.9.clone.1884.1.1 = fadd double %param_2.5653876.1.1, %multiply.3008.9.clone.1883.1.1
  %104 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg0972, i64 0, i64 %1, i64 %100
  %param_0.5125885.1.11068 = getelementptr inbounds i8, ptr addrspace(1) %104, i64 -792
  %param_0.5125886.1.1 = load double, ptr addrspace(1) %param_0.5125885.1.11068, align 8, !invariant.load !278
  %105 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg1974, i64 0, i64 %1, i64 %100
  %param_1.7163887.1.11069 = getelementptr inbounds i8, ptr addrspace(1) %105, i64 -792
  %param_1.7163888.1.1 = load double, ptr addrspace(1) %param_1.7163887.1.11069, align 8, !invariant.load !278
  %add.4187.17.clone.1890.1.1 = fadd double %param_1.7163888.1.1, 6.000000e+00
  %multiply.3056.15.clone.1892.1.1 = fmul double %add.4187.17.clone.1890.1.1, 2.500000e-01
  %106 = fsub double %param_0.5125886.1.1, %multiply.3056.15.clone.1892.1.1
  %multiply.3057.5.clone.1894.1.1 = fmul double %multiply.3002.19.clone.1851.1.1, %106
  %add.4221.5.clone.1895.1.1 = fadd double %add.4171.9.clone.1884.1.1, %multiply.3057.5.clone.1894.1.1
  %add.4236.3.clone.1896.1.1 = fadd double %param_26.560874.1.1, %add.4221.5.clone.1895.1.1
  %107 = select i1 %99, double %add.4221.5.clone.1895.1.1, double %add.4236.3.clone.1896.1.1
  br label %concatenate.41.1.clone.1.merge713.1.1

concatenate.pivot.80.906.1.1:                     ; preds = %concatenate.pivot.100.905.1.1
  %108 = icmp eq i64 %param_32.226813.1, 0
  %109 = add nsw i32 %5, -79
  %110 = zext nneg i32 %109 to i64
  %param_27.555844.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg271026, i64 0, i64 %1, i64 %110
  %param_27.555845.1.1 = load double, ptr addrspace(1) %param_27.555844.1.1, align 8, !invariant.load !278
  %param_6.1884846.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg6984, i64 0, i64 %1, i64 %110
  %param_6.1884847.1.1 = load double, ptr addrspace(1) %param_6.1884846.1.1, align 8, !invariant.load !278
  %param_7.1662852.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7986, i64 0, i64 %1, i64 %110
  %param_7.1662853.1.1 = load double, ptr addrspace(1) %param_7.1662852.1.1, align 8, !invariant.load !278
  %multiply.3007.9.clone.1854.1.1 = fmul double %param_7.1662853.1.1, %multiply.3002.19.clone.1851.1.1
  %add.4169.9.clone.1855.1.1 = fadd double %param_6.1884847.1.1, %multiply.3007.9.clone.1854.1.1
  %param_4.2856856.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg4980, i64 0, i64 %1, i64 %110
  %param_4.2856857.1.1 = load double, ptr addrspace(1) %param_4.2856856.1.1, align 8, !invariant.load !278
  %param_5.2406858.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg5982, i64 0, i64 %1, i64 %110
  %param_5.2406859.1.1 = load double, ptr addrspace(1) %param_5.2406858.1.1, align 8, !invariant.load !278
  %add.4174.17.clone.1861.1.1 = fadd double %param_5.2406859.1.1, 4.000000e+00
  %multiply.3054.15.clone.1863.1.1 = fmul double %add.4174.17.clone.1861.1.1, 2.500000e-01
  %111 = fsub double %param_4.2856857.1.1, %multiply.3054.15.clone.1863.1.1
  %multiply.3055.5.clone.1865.1.1 = fmul double %multiply.3002.19.clone.1851.1.1, %111
  %add.4218.5.clone.1866.1.1 = fadd double %add.4169.9.clone.1855.1.1, %multiply.3055.5.clone.1865.1.1
  %add.4234.3.clone.1867.1.1 = fadd double %param_27.555845.1.1, %add.4218.5.clone.1866.1.1
  %112 = select i1 %108, double %add.4218.5.clone.1866.1.1, double %add.4234.3.clone.1867.1.1
  br label %concatenate.41.1.clone.1.merge713.1.1

concatenate.pivot.60.904.1.1:                     ; preds = %concatenate.pivot.80.903.1.1
  %113 = icmp eq i64 %param_32.226813.1, 0
  %114 = add nsw i32 %5, -59
  %115 = zext nneg i32 %114 to i64
  %param_28.477816.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg281028, i64 0, i64 %1, i64 %115
  %param_28.477817.1.1 = load double, ptr addrspace(1) %param_28.477816.1.1, align 8, !invariant.load !278
  %param_10.1119818.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10992, i64 0, i64 %1, i64 %115
  %param_10.1119819.1.1 = load double, ptr addrspace(1) %param_10.1119818.1.1, align 8, !invariant.load !278
  %116 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1823.1.1 = fmul double %116, 0x3F786F8FA34E82C5
  %param_11.924824.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg11994, i64 0, i64 %1, i64 %115
  %param_11.924825.1.1 = load double, ptr addrspace(1) %param_11.924824.1.1, align 8, !invariant.load !278
  %multiply.3006.9.clone.1826.1.1 = fmul double %param_11.924825.1.1, %multiply.3002.19.clone.1823.1.1
  %add.4168.9.clone.1827.1.1 = fadd double %param_10.1119819.1.1, %multiply.3006.9.clone.1826.1.1
  %param_8.1467828.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8988, i64 0, i64 %1, i64 %115
  %param_8.1467829.1.1 = load double, ptr addrspace(1) %param_8.1467828.1.1, align 8, !invariant.load !278
  %param_9.1328830.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9990, i64 0, i64 %1, i64 %115
  %param_9.1328831.1.1 = load double, ptr addrspace(1) %param_9.1328830.1.1, align 8, !invariant.load !278
  %add.4197.14.clone.1833.1.1 = fadd double %param_9.1328831.1.1, -1.000000e+00
  %add.4214.13.clone.1835.1.1 = fsub double %param_8.1467829.1.1, %add.4197.14.clone.1833.1.1
  %multiply.3053.5.clone.1836.1.1 = fmul double %multiply.3002.19.clone.1823.1.1, %add.4214.13.clone.1835.1.1
  %add.4216.5.clone.1837.1.1 = fadd double %add.4168.9.clone.1827.1.1, %multiply.3053.5.clone.1836.1.1
  %add.4233.3.clone.1838.1.1 = fadd double %param_28.477817.1.1, %add.4216.5.clone.1837.1.1
  %117 = select i1 %113, double %add.4216.5.clone.1837.1.1, double %add.4233.3.clone.1838.1.1
  br label %concatenate.41.1.clone.1.merge713.1.1

concatenate.41.1.clone.1.merge713.1.1:            ; preds = %concatenate.pivot.60.904.1.1, %concatenate.pivot.80.906.1.1, %concatenate.pivot.100.907.1.1
  %118 = phi double [ %117, %concatenate.pivot.60.904.1.1 ], [ %112, %concatenate.pivot.80.906.1.1 ], [ %107, %concatenate.pivot.100.907.1.1 ]
  %119 = getelementptr inbounds i8, ptr addrspace(1) %63, i64 8
  store double %95, ptr addrspace(1) %119, align 8
  %120 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 8
  store double %118, ptr addrspace(1) %120, align 8
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %concatenate.41.1.clone.1.merge713.1.1, %x_in_tile-after
  %partial_reduction_result.2.1 = phi double [ %add.3969.i949, %x_in_tile-after ], [ %add.3969.i949.1.1, %concatenate.41.1.clone.1.merge713.1.1 ]
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
  %add.3969.i945 = fadd double %add.3969.i, %136
  %137 = bitcast double %add.3969.i945 to <2 x i32>
  %138 = extractelement <2 x i32> %137, i64 0
  %139 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %138, i32 4, i32 31)
  %140 = insertelement <2 x i32> poison, i32 %139, i64 0
  %141 = extractelement <2 x i32> %137, i64 1
  %142 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %141, i32 4, i32 31)
  %143 = insertelement <2 x i32> %140, i32 %142, i64 1
  %144 = bitcast <2 x i32> %143 to double
  %add.3969.i946 = fadd double %add.3969.i945, %144
  %145 = bitcast double %add.3969.i946 to <2 x i32>
  %146 = extractelement <2 x i32> %145, i64 0
  %147 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %146, i32 2, i32 31)
  %148 = insertelement <2 x i32> poison, i32 %147, i64 0
  %149 = extractelement <2 x i32> %145, i64 1
  %150 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %149, i32 2, i32 31)
  %151 = insertelement <2 x i32> %148, i32 %150, i64 1
  %152 = bitcast <2 x i32> %151 to double
  %add.3969.i947 = fadd double %add.3969.i946, %152
  %153 = bitcast double %add.3969.i947 to <2 x i32>
  %154 = extractelement <2 x i32> %153, i64 0
  %155 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %154, i32 1, i32 31)
  %156 = extractelement <2 x i32> %153, i64 1
  %157 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %156, i32 1, i32 31)
  %158 = icmp eq i32 %thread.id.2, 0
  %159 = getelementptr inbounds [2 x [1 x double]], ptr addrspace(3) @shared_cache4, i64 0, i64 %1, i64 0
  %160 = insertelement <2 x i32> poison, i32 %155, i64 0
  %161 = insertelement <2 x i32> %160, i32 %157, i64 1
  %162 = bitcast <2 x i32> %161 to double
  %add.3969.i948 = fadd double %add.3969.i947, %162
  br i1 %158, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

loop3.loop_body401:                               ; preds = %entry, %concatenate.41.1.clone.1.merge713
  %.not = phi i1 [ true, %entry ], [ false, %concatenate.41.1.clone.1.merge713 ]
  %loop3.invar_address402.0951 = phi i32 [ 0, %entry ], [ 1, %concatenate.41.1.clone.1.merge713 ]
  %partial_reduction_result.3950 = phi double [ 0.000000e+00, %entry ], [ %add.3969.i949, %concatenate.41.1.clone.1.merge713 ]
  %163 = icmp ult i32 %thread.id.2, 30
  %164 = or disjoint i32 %loop3.invar_address402.0951, %2
  br i1 %163, label %concatenate.pivot.20.548, label %concatenate.pivot.60.554

concatenate.pivot.20.548:                         ; preds = %loop3.loop_body401
  %165 = icmp ult i32 %thread.id.2, 10
  br i1 %165, label %concatenate.pivot.0.549, label %concatenate.pivot.40.550

concatenate.pivot.0.549:                          ; preds = %concatenate.pivot.20.548
  %166 = zext nneg i32 %164 to i64
  %param_23.850407 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg231018, i64 0, i64 %1, i64 %166
  %param_23.850408 = load double, ptr addrspace(1) %param_23.850407, align 8, !invariant.load !278
  %param_25.613410 = load i64, ptr addrspace(1) %param_25.613528, align 8, !invariant.load !278
  %167 = sitofp i64 %param_25.613410 to double
  %multiply.3002.19.clone.1412 = fmul double %167, 0x3F786F8FA34E82C5
  %param_24.753413 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg241020, i64 0, i64 %1, i64 %166
  %param_24.753414 = load double, ptr addrspace(1) %param_24.753413, align 8, !invariant.load !278
  %multiply.3003.9.clone.1415 = fmul double %param_24.753414, %multiply.3002.19.clone.1412
  %add.4164.9.clone.1416 = fadd double %param_23.850408, %multiply.3003.9.clone.1415
  %param_21.992417 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg211014, i64 0, i64 %1, i64 %166
  %param_21.992418 = load double, ptr addrspace(1) %param_21.992417, align 8, !invariant.load !278
  %param_22.879419 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg221016, i64 0, i64 %1, i64 %166
  %param_22.879420 = load double, ptr addrspace(1) %param_22.879419, align 8, !invariant.load !278
  %add.4206.13.clone.1423 = fsub double %param_21.992418, %param_22.879420
  %multiply.3037.5.clone.1424 = fmul double %multiply.3002.19.clone.1412, %add.4206.13.clone.1423
  %add.4207.5.clone.1425 = fadd double %add.4164.9.clone.1416, %multiply.3037.5.clone.1424
  br label %concatenate.39.1.clone.1.merge405

concatenate.pivot.40.550:                         ; preds = %concatenate.pivot.20.548
  %168 = icmp ult i32 %thread.id.2, 20
  %param_25.613430 = load i64, ptr addrspace(1) %param_25.613528, align 8, !invariant.load !278
  %169 = sitofp i64 %param_25.613430 to double
  %multiply.3002.19.clone.1432 = fmul double %169, 0x3F786F8FA34E82C5
  br i1 %168, label %concatenate.pivot.20.551, label %concatenate.pivot.40.552

concatenate.pivot.20.551:                         ; preds = %concatenate.pivot.40.550
  %170 = add nsw i32 %164, -20
  %171 = zext nneg i32 %170 to i64
  %param_19.1126427 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg191010, i64 0, i64 %1, i64 %171
  %param_19.1126428 = load double, ptr addrspace(1) %param_19.1126427, align 8, !invariant.load !278
  %param_20.1138433 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg201012, i64 0, i64 %1, i64 %171
  %param_20.1138434 = load double, ptr addrspace(1) %param_20.1138433, align 8, !invariant.load !278
  %multiply.3004.9.clone.1435 = fmul double %param_20.1138434, %multiply.3002.19.clone.1432
  %add.4166.9.clone.1436 = fadd double %param_19.1126428, %multiply.3004.9.clone.1435
  %param_18.1086437 = getelementptr inbounds [1 x [2 x [20 x double]]], ptr addrspace(1) %arg181008, i64 0, i64 0, i64 %1, i64 %171
  %param_18.1086438 = load double, ptr addrspace(1) %param_18.1086437, align 8, !invariant.load !278
  %param_16.817439 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg161004, i64 0, i64 %1, i64 %171
  %param_16.817440 = load double, ptr addrspace(1) %param_16.817439, align 8, !invariant.load !278
  %multiply.3000.35.clone.1442 = fmul double %169, 0x3F886F8FA34E82C5
  %172 = zext nneg i32 %164 to i64
  %param_17.1005443 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg171006, i64 0, i64 %1, i64 %172
  %param_17.1005444 = load double, ptr addrspace(1) %param_17.1005443, align 8, !invariant.load !278
  %add.4172.52.clone.1447 = fadd double %param_17.1005444, %param_17.1005444
  %multiply.3025.25.clone.1448 = fmul double %multiply.3000.35.clone.1442, %add.4172.52.clone.1447
  %add.4191.23.clone.1449 = fadd double %param_16.817440, %multiply.3025.25.clone.1448
  %add.4192.17.clone.1451 = fadd double %add.4191.23.clone.1449, -1.000000e+00
  %multiply.3046.13.clone.1453 = fmul double %add.4192.17.clone.1451, 4.000000e+00
  %173 = fsub double %param_18.1086438, %multiply.3046.13.clone.1453
  %multiply.3047.5.clone.1455 = fmul double %multiply.3002.19.clone.1432, %173
  %add.4211.5.clone.1456 = fadd double %add.4166.9.clone.1436, %multiply.3047.5.clone.1455
  br label %concatenate.39.1.clone.1.merge405

concatenate.pivot.40.552:                         ; preds = %concatenate.pivot.40.550
  %174 = add nsw i32 %164, -40
  %175 = zext nneg i32 %174 to i64
  %param_14.719458 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg141000, i64 0, i64 %1, i64 %175
  %param_14.719459 = load double, ptr addrspace(1) %param_14.719458, align 8, !invariant.load !278
  %param_15.734464 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg151002, i64 0, i64 %1, i64 %175
  %param_15.734465 = load double, ptr addrspace(1) %param_15.734464, align 8, !invariant.load !278
  %multiply.3005.9.clone.1466 = fmul double %param_15.734465, %multiply.3002.19.clone.1432
  %add.4167.9.clone.1467 = fadd double %param_14.719459, %multiply.3005.9.clone.1466
  %param_13.775468 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg13998, i64 0, i64 %1, i64 %175
  %param_13.775469 = load double, ptr addrspace(1) %param_13.775468, align 8, !invariant.load !278
  %param_12.829470 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg12996, i64 0, i64 %1, i64 %175
  %param_12.829471 = load double, ptr addrspace(1) %param_12.829470, align 8, !invariant.load !278
  %176 = tail call double @llvm.fma.f64(double %param_12.829471, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %177 = tail call i32 @llvm.nvvm.d2i.lo(double %176) #13
  %178 = tail call double @llvm.nvvm.add.rn.d(double %176, double 0xC338000000000000) #13
  %179 = tail call double @llvm.fma.f64(double %178, double 0xBFE62E42FEFA39EF, double %param_12.829471)
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
  %197 = tail call i32 @llvm.nvvm.d2i.hi(double %param_12.829471) #13
  %198 = bitcast i32 %197 to float
  %199 = tail call float @llvm.nvvm.fabs.f(float %198) #13
  %200 = fcmp olt float %199, 0x4010C46560000000
  br i1 %200, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %concatenate.pivot.40.552
  %201 = fcmp olt double %param_12.829471, 0.000000e+00
  %202 = fadd double %param_12.829471, 0x7FF0000000000000
  %z.0.i = select i1 %201, double 0.000000e+00, double %202
  %203 = fcmp olt float %199, 0x4010E90000000000
  br i1 %203, label %204, label %__nv_exp.exit

204:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %205 = sdiv i32 %177, 2
  %206 = shl i32 %205, 20
  %207 = add i32 %193, %206
  %208 = tail call double @llvm.nvvm.lohi.i2d(i32 %192, i32 %207) #13
  %209 = sub nsw i32 %177, %205
  %210 = shl i32 %209, 20
  %211 = add nsw i32 %210, 1072693248
  %212 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %211) #13
  %213 = fmul double %212, %208
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %concatenate.pivot.40.552, %__internal_fast_icmp_abs_lt.exit.i, %204
  %z.2.i = phi double [ %196, %concatenate.pivot.40.552 ], [ %213, %204 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.3049.13.clone.1472 = fmul double %param_13.775469, %z.2.i
  %add.4178.17.clone.1476 = fadd double %param_12.829471, 0xBFF62E42FEFA39EF
  %multiply.3050.13.clone.1478 = fmul double %add.4178.17.clone.1476, 0x3FFC71C71C71C71C
  %214 = fsub double %multiply.3049.13.clone.1472, %multiply.3050.13.clone.1478
  %multiply.3051.5.clone.1480 = fmul double %multiply.3002.19.clone.1432, %214
  %add.4213.5.clone.1481 = fadd double %add.4167.9.clone.1467, %multiply.3051.5.clone.1480
  br label %concatenate.39.1.clone.1.merge405

concatenate.pivot.60.554:                         ; preds = %loop3.loop_body401
  %215 = add nsw i32 %164, -60
  %216 = zext nneg i32 %215 to i64
  %param_10.1119483 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10992, i64 0, i64 %1, i64 %216
  %param_10.1119484 = load double, ptr addrspace(1) %param_10.1119483, align 8, !invariant.load !278
  %param_25.613486 = load i64, ptr addrspace(1) %param_25.613528, align 8, !invariant.load !278
  %217 = sitofp i64 %param_25.613486 to double
  %multiply.3002.19.clone.1488 = fmul double %217, 0x3F786F8FA34E82C5
  %param_11.924489 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg11994, i64 0, i64 %1, i64 %216
  %param_11.924490 = load double, ptr addrspace(1) %param_11.924489, align 8, !invariant.load !278
  %multiply.3006.9.clone.1491 = fmul double %param_11.924490, %multiply.3002.19.clone.1488
  %add.4168.9.clone.1492 = fadd double %param_10.1119484, %multiply.3006.9.clone.1491
  %param_8.1467493 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8988, i64 0, i64 %1, i64 %216
  %param_8.1467494 = load double, ptr addrspace(1) %param_8.1467493, align 8, !invariant.load !278
  %param_9.1328495 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9990, i64 0, i64 %1, i64 %216
  %param_9.1328496 = load double, ptr addrspace(1) %param_9.1328495, align 8, !invariant.load !278
  %add.4197.14.clone.1498 = fadd double %param_9.1328496, -1.000000e+00
  %add.4214.13.clone.1500 = fsub double %param_8.1467494, %add.4197.14.clone.1498
  %multiply.3053.5.clone.1501 = fmul double %multiply.3002.19.clone.1488, %add.4214.13.clone.1500
  %add.4216.5.clone.1502 = fadd double %add.4168.9.clone.1492, %multiply.3053.5.clone.1501
  br label %concatenate.39.1.clone.1.merge405

concatenate.39.1.clone.1.merge405:                ; preds = %concatenate.pivot.60.554, %__nv_exp.exit, %concatenate.pivot.20.551, %concatenate.pivot.0.549
  %param_25.613486.1 = phi i64 [ %param_25.613410, %concatenate.pivot.0.549 ], [ %param_25.613430, %concatenate.pivot.20.551 ], [ %param_25.613430, %__nv_exp.exit ], [ %param_25.613486, %concatenate.pivot.60.554 ]
  %218 = phi double [ %add.4207.5.clone.1425, %concatenate.pivot.0.549 ], [ %add.4211.5.clone.1456, %concatenate.pivot.20.551 ], [ %add.4213.5.clone.1481, %__nv_exp.exit ], [ %add.4216.5.clone.1502, %concatenate.pivot.60.554 ]
  %219 = icmp ult i32 %thread.id.2, 30
  %multiply.3058.1558 = fmul double %218, %218
  %add.3969.i949 = fadd double %partial_reduction_result.3950, %multiply.3058.1558
  br i1 %219, label %concatenate.pivot.20.703, label %concatenate.pivot.60.709

concatenate.pivot.20.703:                         ; preds = %concatenate.39.1.clone.1.merge405
  %220 = icmp ult i32 %thread.id.2, 10
  br i1 %220, label %concatenate.pivot.0.704, label %concatenate.pivot.40.705

concatenate.pivot.0.704:                          ; preds = %concatenate.pivot.20.703
  %221 = zext nneg i32 %164 to i64
  %param_23.850562 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg231018, i64 0, i64 %1, i64 %221
  %param_23.850563 = load double, ptr addrspace(1) %param_23.850562, align 8, !invariant.load !278
  %222 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1567 = fmul double %222, 0x3F786F8FA34E82C5
  %param_24.753568 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg241020, i64 0, i64 %1, i64 %221
  %param_24.753569 = load double, ptr addrspace(1) %param_24.753568, align 8, !invariant.load !278
  %multiply.3003.9.clone.1570 = fmul double %param_24.753569, %multiply.3002.19.clone.1567
  %add.4164.9.clone.1571 = fadd double %param_23.850563, %multiply.3003.9.clone.1570
  %param_21.992572 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg211014, i64 0, i64 %1, i64 %221
  %param_21.992573 = load double, ptr addrspace(1) %param_21.992572, align 8, !invariant.load !278
  %param_22.879574 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg221016, i64 0, i64 %1, i64 %221
  %param_22.879575 = load double, ptr addrspace(1) %param_22.879574, align 8, !invariant.load !278
  %add.4206.13.clone.1578 = fsub double %param_21.992573, %param_22.879575
  %multiply.3037.5.clone.1579 = fmul double %multiply.3002.19.clone.1567, %add.4206.13.clone.1578
  %add.4207.5.clone.1580 = fadd double %add.4164.9.clone.1571, %multiply.3037.5.clone.1579
  br label %concatenate.39.1.clone.1.merge560

concatenate.pivot.40.705:                         ; preds = %concatenate.pivot.20.703
  %223 = icmp ult i32 %thread.id.2, 20
  %224 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1587 = fmul double %224, 0x3F786F8FA34E82C5
  br i1 %223, label %concatenate.pivot.20.706, label %concatenate.pivot.40.707

concatenate.pivot.20.706:                         ; preds = %concatenate.pivot.40.705
  %225 = add nsw i32 %164, -20
  %226 = zext nneg i32 %225 to i64
  %param_19.1126582 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg191010, i64 0, i64 %1, i64 %226
  %param_19.1126583 = load double, ptr addrspace(1) %param_19.1126582, align 8, !invariant.load !278
  %param_20.1138588 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg201012, i64 0, i64 %1, i64 %226
  %param_20.1138589 = load double, ptr addrspace(1) %param_20.1138588, align 8, !invariant.load !278
  %multiply.3004.9.clone.1590 = fmul double %param_20.1138589, %multiply.3002.19.clone.1587
  %add.4166.9.clone.1591 = fadd double %param_19.1126583, %multiply.3004.9.clone.1590
  %param_18.1086592 = getelementptr inbounds [1 x [2 x [20 x double]]], ptr addrspace(1) %arg181008, i64 0, i64 0, i64 %1, i64 %226
  %param_18.1086593 = load double, ptr addrspace(1) %param_18.1086592, align 8, !invariant.load !278
  %param_16.817594 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg161004, i64 0, i64 %1, i64 %226
  %param_16.817595 = load double, ptr addrspace(1) %param_16.817594, align 8, !invariant.load !278
  %multiply.3000.35.clone.1597 = fmul double %224, 0x3F886F8FA34E82C5
  %227 = zext nneg i32 %164 to i64
  %param_17.1005598 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg171006, i64 0, i64 %1, i64 %227
  %param_17.1005599 = load double, ptr addrspace(1) %param_17.1005598, align 8, !invariant.load !278
  %add.4172.52.clone.1602 = fadd double %param_17.1005599, %param_17.1005599
  %multiply.3025.25.clone.1603 = fmul double %multiply.3000.35.clone.1597, %add.4172.52.clone.1602
  %add.4191.23.clone.1604 = fadd double %param_16.817595, %multiply.3025.25.clone.1603
  %add.4192.17.clone.1606 = fadd double %add.4191.23.clone.1604, -1.000000e+00
  %multiply.3046.13.clone.1608 = fmul double %add.4192.17.clone.1606, 4.000000e+00
  %228 = fsub double %param_18.1086593, %multiply.3046.13.clone.1608
  %multiply.3047.5.clone.1610 = fmul double %multiply.3002.19.clone.1587, %228
  %add.4211.5.clone.1611 = fadd double %add.4166.9.clone.1591, %multiply.3047.5.clone.1610
  br label %concatenate.39.1.clone.1.merge560

concatenate.pivot.40.707:                         ; preds = %concatenate.pivot.40.705
  %229 = add nsw i32 %164, -40
  %230 = zext nneg i32 %229 to i64
  %param_14.719613 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg141000, i64 0, i64 %1, i64 %230
  %param_14.719614 = load double, ptr addrspace(1) %param_14.719613, align 8, !invariant.load !278
  %param_15.734619 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg151002, i64 0, i64 %1, i64 %230
  %param_15.734620 = load double, ptr addrspace(1) %param_15.734619, align 8, !invariant.load !278
  %multiply.3005.9.clone.1621 = fmul double %param_15.734620, %multiply.3002.19.clone.1587
  %add.4167.9.clone.1622 = fadd double %param_14.719614, %multiply.3005.9.clone.1621
  %param_13.775623 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg13998, i64 0, i64 %1, i64 %230
  %param_13.775624 = load double, ptr addrspace(1) %param_13.775623, align 8, !invariant.load !278
  %param_12.829625 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg12996, i64 0, i64 %1, i64 %230
  %param_12.829626 = load double, ptr addrspace(1) %param_12.829625, align 8, !invariant.load !278
  %231 = tail call double @llvm.fma.f64(double %param_12.829626, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %232 = tail call i32 @llvm.nvvm.d2i.lo(double %231) #13
  %233 = tail call double @llvm.nvvm.add.rn.d(double %231, double 0xC338000000000000) #13
  %234 = tail call double @llvm.fma.f64(double %233, double 0xBFE62E42FEFA39EF, double %param_12.829626)
  %235 = tail call double @llvm.fma.f64(double %233, double 0xBC7ABC9E3B39803F, double %234)
  %236 = tail call double @llvm.fma.f64(double %235, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %237 = tail call double @llvm.fma.f64(double %236, double %235, double 0x3EC71DEE62401315)
  %238 = tail call double @llvm.fma.f64(double %237, double %235, double 0x3EFA01997C89EB71)
  %239 = tail call double @llvm.fma.f64(double %238, double %235, double 0x3F2A01A014761F65)
  %240 = tail call double @llvm.fma.f64(double %239, double %235, double 0x3F56C16C1852B7AF)
  %241 = tail call double @llvm.fma.f64(double %240, double %235, double 0x3F81111111122322)
  %242 = tail call double @llvm.fma.f64(double %241, double %235, double 0x3FA55555555502A1)
  %243 = tail call double @llvm.fma.f64(double %242, double %235, double 0x3FC5555555555511)
  %244 = tail call double @llvm.fma.f64(double %243, double %235, double 0x3FE000000000000B)
  %245 = tail call double @llvm.fma.f64(double %244, double %235, double 1.000000e+00)
  %246 = tail call double @llvm.fma.f64(double %245, double %235, double 1.000000e+00)
  %247 = tail call i32 @llvm.nvvm.d2i.lo(double %246) #13
  %248 = tail call i32 @llvm.nvvm.d2i.hi(double %246) #13
  %249 = shl i32 %232, 20
  %250 = add i32 %248, %249
  %251 = tail call double @llvm.nvvm.lohi.i2d(i32 %247, i32 %250) #13
  %252 = tail call i32 @llvm.nvvm.d2i.hi(double %param_12.829626) #13
  %253 = bitcast i32 %252 to float
  %254 = tail call float @llvm.nvvm.fabs.f(float %253) #13
  %255 = fcmp olt float %254, 0x4010C46560000000
  br i1 %255, label %__nv_exp.exit935, label %__internal_fast_icmp_abs_lt.exit.i932

__internal_fast_icmp_abs_lt.exit.i932:            ; preds = %concatenate.pivot.40.707
  %256 = fcmp olt double %param_12.829626, 0.000000e+00
  %257 = fadd double %param_12.829626, 0x7FF0000000000000
  %z.0.i933 = select i1 %256, double 0.000000e+00, double %257
  %258 = fcmp olt float %254, 0x4010E90000000000
  br i1 %258, label %259, label %__nv_exp.exit935

259:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i932
  %260 = sdiv i32 %232, 2
  %261 = shl i32 %260, 20
  %262 = add i32 %248, %261
  %263 = tail call double @llvm.nvvm.lohi.i2d(i32 %247, i32 %262) #13
  %264 = sub nsw i32 %232, %260
  %265 = shl i32 %264, 20
  %266 = add nsw i32 %265, 1072693248
  %267 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %266) #13
  %268 = fmul double %267, %263
  br label %__nv_exp.exit935

__nv_exp.exit935:                                 ; preds = %concatenate.pivot.40.707, %__internal_fast_icmp_abs_lt.exit.i932, %259
  %z.2.i934 = phi double [ %251, %concatenate.pivot.40.707 ], [ %268, %259 ], [ %z.0.i933, %__internal_fast_icmp_abs_lt.exit.i932 ]
  %multiply.3049.13.clone.1627 = fmul double %param_13.775624, %z.2.i934
  %add.4178.17.clone.1631 = fadd double %param_12.829626, 0xBFF62E42FEFA39EF
  %multiply.3050.13.clone.1633 = fmul double %add.4178.17.clone.1631, 0x3FFC71C71C71C71C
  %269 = fsub double %multiply.3049.13.clone.1627, %multiply.3050.13.clone.1633
  %multiply.3051.5.clone.1635 = fmul double %multiply.3002.19.clone.1587, %269
  %add.4213.5.clone.1636 = fadd double %add.4167.9.clone.1622, %multiply.3051.5.clone.1635
  br label %concatenate.39.1.clone.1.merge560

concatenate.pivot.60.709:                         ; preds = %concatenate.39.1.clone.1.merge405
  %270 = add nsw i32 %164, -60
  %271 = zext nneg i32 %270 to i64
  %param_10.1119638 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10992, i64 0, i64 %1, i64 %271
  %param_10.1119639 = load double, ptr addrspace(1) %param_10.1119638, align 8, !invariant.load !278
  %272 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1643 = fmul double %272, 0x3F786F8FA34E82C5
  %param_11.924644 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg11994, i64 0, i64 %1, i64 %271
  %param_11.924645 = load double, ptr addrspace(1) %param_11.924644, align 8, !invariant.load !278
  %multiply.3006.9.clone.1646 = fmul double %param_11.924645, %multiply.3002.19.clone.1643
  %add.4168.9.clone.1647 = fadd double %param_10.1119639, %multiply.3006.9.clone.1646
  %param_8.1467648 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8988, i64 0, i64 %1, i64 %271
  %param_8.1467649 = load double, ptr addrspace(1) %param_8.1467648, align 8, !invariant.load !278
  %param_9.1328650 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9990, i64 0, i64 %1, i64 %271
  %param_9.1328651 = load double, ptr addrspace(1) %param_9.1328650, align 8, !invariant.load !278
  %add.4197.14.clone.1653 = fadd double %param_9.1328651, -1.000000e+00
  %add.4214.13.clone.1655 = fsub double %param_8.1467649, %add.4197.14.clone.1653
  %multiply.3053.5.clone.1656 = fmul double %multiply.3002.19.clone.1643, %add.4214.13.clone.1655
  %add.4216.5.clone.1657 = fadd double %add.4168.9.clone.1647, %multiply.3053.5.clone.1656
  br label %concatenate.39.1.clone.1.merge560

concatenate.39.1.clone.1.merge560:                ; preds = %concatenate.pivot.60.709, %__nv_exp.exit935, %concatenate.pivot.20.706, %concatenate.pivot.0.704
  %273 = phi double [ %add.4207.5.clone.1580, %concatenate.pivot.0.704 ], [ %add.4211.5.clone.1611, %concatenate.pivot.20.706 ], [ %add.4213.5.clone.1636, %__nv_exp.exit935 ], [ %add.4216.5.clone.1657, %concatenate.pivot.60.709 ]
  %274 = icmp ult i32 %thread.id.2, 30
  br i1 %274, label %concatenate.pivot.20.898, label %concatenate.pivot.60.904

concatenate.pivot.20.898:                         ; preds = %concatenate.39.1.clone.1.merge560
  %275 = icmp ult i32 %thread.id.2, 10
  br i1 %275, label %concatenate.pivot.0.899, label %concatenate.pivot.40.900

concatenate.pivot.0.899:                          ; preds = %concatenate.pivot.20.898
  %param_32.226716 = load i64, ptr addrspace(1) %param_32.226869, align 8, !invariant.load !278
  %276 = icmp eq i64 %param_32.226716, 0
  %277 = zext nneg i32 %164 to i64
  %param_31.261719 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg311034, i64 0, i64 %1, i64 %277
  %param_31.261720 = load double, ptr addrspace(1) %param_31.261719, align 8, !invariant.load !278
  %param_23.850721 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg231018, i64 0, i64 %1, i64 %277
  %param_23.850722 = load double, ptr addrspace(1) %param_23.850721, align 8, !invariant.load !278
  %278 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1726 = fmul double %278, 0x3F786F8FA34E82C5
  %param_24.753727 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg241020, i64 0, i64 %1, i64 %277
  %param_24.753728 = load double, ptr addrspace(1) %param_24.753727, align 8, !invariant.load !278
  %multiply.3003.9.clone.1729 = fmul double %param_24.753728, %multiply.3002.19.clone.1726
  %add.4164.9.clone.1730 = fadd double %param_23.850722, %multiply.3003.9.clone.1729
  %param_21.992731 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg211014, i64 0, i64 %1, i64 %277
  %param_21.992732 = load double, ptr addrspace(1) %param_21.992731, align 8, !invariant.load !278
  %param_22.879733 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg221016, i64 0, i64 %1, i64 %277
  %param_22.879734 = load double, ptr addrspace(1) %param_22.879733, align 8, !invariant.load !278
  %add.4206.13.clone.1737 = fsub double %param_21.992732, %param_22.879734
  %multiply.3037.5.clone.1738 = fmul double %multiply.3002.19.clone.1726, %add.4206.13.clone.1737
  %add.4207.5.clone.1739 = fadd double %add.4164.9.clone.1730, %multiply.3037.5.clone.1738
  %add.4229.3.clone.1740 = fadd double %param_31.261720, %add.4207.5.clone.1739
  %279 = select i1 %276, double %add.4207.5.clone.1739, double %add.4229.3.clone.1740
  br label %concatenate.41.1.clone.1.merge713

concatenate.pivot.40.900:                         ; preds = %concatenate.pivot.20.898
  %280 = icmp ult i32 %thread.id.2, 20
  %param_32.226743 = load i64, ptr addrspace(1) %param_32.226869, align 8, !invariant.load !278
  %281 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1753 = fmul double %281, 0x3F786F8FA34E82C5
  br i1 %280, label %concatenate.pivot.20.901, label %concatenate.pivot.40.902

concatenate.pivot.20.901:                         ; preds = %concatenate.pivot.40.900
  %282 = icmp eq i64 %param_32.226743, 0
  %283 = add nsw i32 %164, -20
  %284 = zext nneg i32 %283 to i64
  %param_30.333746 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg301032, i64 0, i64 %1, i64 %284
  %param_30.333747 = load double, ptr addrspace(1) %param_30.333746, align 8, !invariant.load !278
  %param_19.1126748 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg191010, i64 0, i64 %1, i64 %284
  %param_19.1126749 = load double, ptr addrspace(1) %param_19.1126748, align 8, !invariant.load !278
  %param_20.1138754 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg201012, i64 0, i64 %1, i64 %284
  %param_20.1138755 = load double, ptr addrspace(1) %param_20.1138754, align 8, !invariant.load !278
  %multiply.3004.9.clone.1756 = fmul double %param_20.1138755, %multiply.3002.19.clone.1753
  %add.4166.9.clone.1757 = fadd double %param_19.1126749, %multiply.3004.9.clone.1756
  %param_18.1086758 = getelementptr inbounds [1 x [2 x [20 x double]]], ptr addrspace(1) %arg181008, i64 0, i64 0, i64 %1, i64 %284
  %param_18.1086759 = load double, ptr addrspace(1) %param_18.1086758, align 8, !invariant.load !278
  %param_16.817760 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg161004, i64 0, i64 %1, i64 %284
  %param_16.817761 = load double, ptr addrspace(1) %param_16.817760, align 8, !invariant.load !278
  %multiply.3000.35.clone.1763 = fmul double %281, 0x3F886F8FA34E82C5
  %285 = zext nneg i32 %164 to i64
  %param_17.1005764 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg171006, i64 0, i64 %1, i64 %285
  %param_17.1005765 = load double, ptr addrspace(1) %param_17.1005764, align 8, !invariant.load !278
  %add.4172.52.clone.1768 = fadd double %param_17.1005765, %param_17.1005765
  %multiply.3025.25.clone.1769 = fmul double %multiply.3000.35.clone.1763, %add.4172.52.clone.1768
  %add.4191.23.clone.1770 = fadd double %param_16.817761, %multiply.3025.25.clone.1769
  %add.4192.17.clone.1772 = fadd double %add.4191.23.clone.1770, -1.000000e+00
  %multiply.3046.13.clone.1774 = fmul double %add.4192.17.clone.1772, 4.000000e+00
  %286 = fsub double %param_18.1086759, %multiply.3046.13.clone.1774
  %multiply.3047.5.clone.1776 = fmul double %multiply.3002.19.clone.1753, %286
  %add.4211.5.clone.1777 = fadd double %add.4166.9.clone.1757, %multiply.3047.5.clone.1776
  %add.4231.3.clone.1778 = fadd double %param_30.333747, %add.4211.5.clone.1777
  %287 = select i1 %282, double %add.4211.5.clone.1777, double %add.4231.3.clone.1778
  br label %concatenate.41.1.clone.1.merge713

concatenate.pivot.40.902:                         ; preds = %concatenate.pivot.40.900
  %288 = add nsw i32 %164, -40
  %289 = zext nneg i32 %288 to i64
  %param_29.433784 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg291030, i64 0, i64 %1, i64 %289
  %param_29.433785 = load double, ptr addrspace(1) %param_29.433784, align 8, !invariant.load !278
  %param_14.719786 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg141000, i64 0, i64 %1, i64 %289
  %param_14.719787 = load double, ptr addrspace(1) %param_14.719786, align 8, !invariant.load !278
  %param_15.734792 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg151002, i64 0, i64 %1, i64 %289
  %param_15.734793 = load double, ptr addrspace(1) %param_15.734792, align 8, !invariant.load !278
  %multiply.3005.9.clone.1794 = fmul double %param_15.734793, %multiply.3002.19.clone.1753
  %add.4167.9.clone.1795 = fadd double %param_14.719787, %multiply.3005.9.clone.1794
  %param_13.775796 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg13998, i64 0, i64 %1, i64 %289
  %param_13.775797 = load double, ptr addrspace(1) %param_13.775796, align 8, !invariant.load !278
  %param_12.829798 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg12996, i64 0, i64 %1, i64 %289
  %param_12.829799 = load double, ptr addrspace(1) %param_12.829798, align 8, !invariant.load !278
  %290 = tail call double @llvm.fma.f64(double %param_12.829799, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %291 = tail call i32 @llvm.nvvm.d2i.lo(double %290) #13
  %292 = tail call double @llvm.nvvm.add.rn.d(double %290, double 0xC338000000000000) #13
  %293 = tail call double @llvm.fma.f64(double %292, double 0xBFE62E42FEFA39EF, double %param_12.829799)
  %294 = tail call double @llvm.fma.f64(double %292, double 0xBC7ABC9E3B39803F, double %293)
  %295 = tail call double @llvm.fma.f64(double %294, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %296 = tail call double @llvm.fma.f64(double %295, double %294, double 0x3EC71DEE62401315)
  %297 = tail call double @llvm.fma.f64(double %296, double %294, double 0x3EFA01997C89EB71)
  %298 = tail call double @llvm.fma.f64(double %297, double %294, double 0x3F2A01A014761F65)
  %299 = tail call double @llvm.fma.f64(double %298, double %294, double 0x3F56C16C1852B7AF)
  %300 = tail call double @llvm.fma.f64(double %299, double %294, double 0x3F81111111122322)
  %301 = tail call double @llvm.fma.f64(double %300, double %294, double 0x3FA55555555502A1)
  %302 = tail call double @llvm.fma.f64(double %301, double %294, double 0x3FC5555555555511)
  %303 = tail call double @llvm.fma.f64(double %302, double %294, double 0x3FE000000000000B)
  %304 = tail call double @llvm.fma.f64(double %303, double %294, double 1.000000e+00)
  %305 = tail call double @llvm.fma.f64(double %304, double %294, double 1.000000e+00)
  %306 = tail call i32 @llvm.nvvm.d2i.lo(double %305) #13
  %307 = tail call i32 @llvm.nvvm.d2i.hi(double %305) #13
  %308 = shl i32 %291, 20
  %309 = add i32 %307, %308
  %310 = tail call double @llvm.nvvm.lohi.i2d(i32 %306, i32 %309) #13
  %311 = tail call i32 @llvm.nvvm.d2i.hi(double %param_12.829799) #13
  %312 = bitcast i32 %311 to float
  %313 = tail call float @llvm.nvvm.fabs.f(float %312) #13
  %314 = fcmp olt float %313, 0x4010C46560000000
  br i1 %314, label %__nv_exp.exit939, label %__internal_fast_icmp_abs_lt.exit.i936

__internal_fast_icmp_abs_lt.exit.i936:            ; preds = %concatenate.pivot.40.902
  %315 = fcmp olt double %param_12.829799, 0.000000e+00
  %316 = fadd double %param_12.829799, 0x7FF0000000000000
  %z.0.i937 = select i1 %315, double 0.000000e+00, double %316
  %317 = fcmp olt float %313, 0x4010E90000000000
  br i1 %317, label %318, label %__nv_exp.exit939

318:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i936
  %319 = sdiv i32 %291, 2
  %320 = shl i32 %319, 20
  %321 = add i32 %307, %320
  %322 = tail call double @llvm.nvvm.lohi.i2d(i32 %306, i32 %321) #13
  %323 = sub nsw i32 %291, %319
  %324 = shl i32 %323, 20
  %325 = add nsw i32 %324, 1072693248
  %326 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %325) #13
  %327 = fmul double %326, %322
  br label %__nv_exp.exit939

__nv_exp.exit939:                                 ; preds = %concatenate.pivot.40.902, %__internal_fast_icmp_abs_lt.exit.i936, %318
  %z.2.i938 = phi double [ %310, %concatenate.pivot.40.902 ], [ %327, %318 ], [ %z.0.i937, %__internal_fast_icmp_abs_lt.exit.i936 ]
  %328 = icmp eq i64 %param_32.226743, 0
  %multiply.3049.13.clone.1800 = fmul double %param_13.775797, %z.2.i938
  %add.4178.17.clone.1804 = fadd double %param_12.829799, 0xBFF62E42FEFA39EF
  %multiply.3050.13.clone.1806 = fmul double %add.4178.17.clone.1804, 0x3FFC71C71C71C71C
  %329 = fsub double %multiply.3049.13.clone.1800, %multiply.3050.13.clone.1806
  %multiply.3051.5.clone.1808 = fmul double %multiply.3002.19.clone.1753, %329
  %add.4213.5.clone.1809 = fadd double %add.4167.9.clone.1795, %multiply.3051.5.clone.1808
  %add.4232.3.clone.1810 = fadd double %param_29.433785, %add.4213.5.clone.1809
  %330 = select i1 %328, double %add.4213.5.clone.1809, double %add.4232.3.clone.1810
  br label %concatenate.41.1.clone.1.merge713

concatenate.pivot.60.904:                         ; preds = %concatenate.39.1.clone.1.merge560
  %331 = add nsw i32 %164, -60
  %param_32.226813 = load i64, ptr addrspace(1) %param_32.226869, align 8, !invariant.load !278
  %332 = icmp eq i64 %param_32.226813, 0
  %333 = zext nneg i32 %331 to i64
  %param_28.477816 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg281028, i64 0, i64 %1, i64 %333
  %param_28.477817 = load double, ptr addrspace(1) %param_28.477816, align 8, !invariant.load !278
  %param_10.1119818 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10992, i64 0, i64 %1, i64 %333
  %param_10.1119819 = load double, ptr addrspace(1) %param_10.1119818, align 8, !invariant.load !278
  %334 = sitofp i64 %param_25.613486.1 to double
  %multiply.3002.19.clone.1823 = fmul double %334, 0x3F786F8FA34E82C5
  %param_11.924824 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg11994, i64 0, i64 %1, i64 %333
  %param_11.924825 = load double, ptr addrspace(1) %param_11.924824, align 8, !invariant.load !278
  %multiply.3006.9.clone.1826 = fmul double %param_11.924825, %multiply.3002.19.clone.1823
  %add.4168.9.clone.1827 = fadd double %param_10.1119819, %multiply.3006.9.clone.1826
  %param_8.1467828 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8988, i64 0, i64 %1, i64 %333
  %param_8.1467829 = load double, ptr addrspace(1) %param_8.1467828, align 8, !invariant.load !278
  %param_9.1328830 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg9990, i64 0, i64 %1, i64 %333
  %param_9.1328831 = load double, ptr addrspace(1) %param_9.1328830, align 8, !invariant.load !278
  %add.4197.14.clone.1833 = fadd double %param_9.1328831, -1.000000e+00
  %add.4214.13.clone.1835 = fsub double %param_8.1467829, %add.4197.14.clone.1833
  %multiply.3053.5.clone.1836 = fmul double %multiply.3002.19.clone.1823, %add.4214.13.clone.1835
  %add.4216.5.clone.1837 = fadd double %add.4168.9.clone.1827, %multiply.3053.5.clone.1836
  %add.4233.3.clone.1838 = fadd double %param_28.477817, %add.4216.5.clone.1837
  %335 = select i1 %332, double %add.4216.5.clone.1837, double %add.4233.3.clone.1838
  br label %concatenate.41.1.clone.1.merge713

concatenate.41.1.clone.1.merge713:                ; preds = %concatenate.pivot.60.904, %__nv_exp.exit939, %concatenate.pivot.20.901, %concatenate.pivot.0.899
  %param_32.226813.1 = phi i64 [ %param_32.226716, %concatenate.pivot.0.899 ], [ %param_32.226743, %concatenate.pivot.20.901 ], [ %param_32.226743, %__nv_exp.exit939 ], [ %param_32.226813, %concatenate.pivot.60.904 ]
  %336 = phi double [ %279, %concatenate.pivot.0.899 ], [ %287, %concatenate.pivot.20.901 ], [ %330, %__nv_exp.exit939 ], [ %335, %concatenate.pivot.60.904 ]
  %337 = zext nneg i32 %164 to i64
  %338 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg341040, i64 0, i64 %1, i64 %337
  store double %273, ptr addrspace(1) %338, align 8
  %339 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg351042, i64 0, i64 %1, i64 %337
  store double %336, ptr addrspace(1) %339, align 8
  br i1 %.not, label %loop3.loop_body401, label %x_in_tile-after, !llvm.loop !293

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %340 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg331038, i64 0, i64 %1
  br i1 %340, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3969.i948, ptr addrspace(3) %159, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %159, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #4 {
entry:
  %arg138 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg036 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !284
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
  %param_0.2377.1 = getelementptr inbounds [20 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %11, i64 %12, i64 0, i64 %1
  %param_0.23772.1 = load double, ptr addrspace(1) %param_0.2377.1, align 8, !invariant.load !278
  %add.3969.i28.1 = fadd double %partial_reduction_result.1, %param_0.23772.1
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
  %param_0.2377.2 = getelementptr inbounds [20 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %18, i64 %19, i64 0, i64 %1
  %param_0.23772.2 = load double, ptr addrspace(1) %param_0.2377.2, align 8, !invariant.load !278
  %add.3969.i28.2 = fadd double %partial_reduction_result.1.1, %param_0.23772.2
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
  %param_0.2377.3 = getelementptr inbounds [20 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %25, i64 %26, i64 0, i64 %1
  %param_0.23772.3 = load double, ptr addrspace(1) %param_0.2377.3, align 8, !invariant.load !278
  %add.3969.i28.3 = fadd double %partial_reduction_result.1.2, %param_0.23772.3
  br label %x_in_tile-after.3

x_in_tile-after.3:                                ; preds = %x_in_tile-true.3, %x_in_tile-after.2
  %partial_reduction_result.1.3 = phi double [ %add.3969.i28.3, %x_in_tile-true.3 ], [ %partial_reduction_result.1.2, %x_in_tile-after.2 ]
  %lsr.iv.next = add nuw nsw i16 %lsr.iv, 128
  %lsr.iv.next41 = add nsw i32 %lsr.iv40, 128
  %27 = icmp ugt i32 %lsr.iv.next41, 3711
  br i1 %27, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !294

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
  %param_0.2377 = getelementptr inbounds [20 x [192 x [1 x [2 x double]]]], ptr addrspace(1) %arg036, i64 0, i64 %75, i64 %76, i64 0, i64 %1
  %param_0.23772 = load double, ptr addrspace(1) %param_0.2377, align 8, !invariant.load !278
  %add.3969.i28 = fadd double %partial_reduction_result.031, %param_0.23772
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3969.i27, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_3(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture align 128 dereferenceable(320) %arg1, ptr noalias nocapture align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg9, ptr noalias nocapture align 128 dereferenceable(320) %arg10, ptr noalias nocapture align 128 dereferenceable(320) %arg11, ptr noalias nocapture align 128 dereferenceable(320) %arg12) local_unnamed_addr #2 {
entry:
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
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %2 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg614, i64 0, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !278
  %4 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg920, i64 0, i64 %1
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !278
  %6 = icmp sge i64 %3, %5
  %7 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg818, i64 0, i64 %1
  %8 = load i8, ptr addrspace(1) %7, align 1, !invariant.load !278
  %9 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg716, i64 0, i64 %1
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !278
  %11 = or i8 %10, %8
  %12 = trunc i8 %11 to i1
  %.not1 = or i1 %6, %12
  %13 = icmp eq i64 %3, 0
  %14 = zext nneg i32 %0 to i64
  %15 = getelementptr double, ptr addrspace(1) %arg02, i64 %14
  %16 = load double, ptr addrspace(1) %15, align 8
  %17 = getelementptr double, ptr addrspace(1) %arg14, i64 %14
  %18 = load double, ptr addrspace(1) %17, align 8
  %19 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg512, i64 0, i64 %1
  %20 = load i64, ptr addrspace(1) %19, align 8, !invariant.load !278
  %21 = sitofp i64 %20 to double
  %multiply.3002.23 = fmul double %21, 0x3F786F8FA34E82C5
  %22 = getelementptr double, ptr addrspace(1) %arg26, i64 %14
  %23 = load double, ptr addrspace(1) %22, align 8
  %multiply.3003.13 = fmul double %23, %multiply.3002.23
  %add.4164.13 = fadd double %18, %multiply.3003.13
  %24 = getelementptr double, ptr addrspace(1) %arg38, i64 %14
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !278
  %26 = getelementptr double, ptr addrspace(1) %arg410, i64 %14
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !278
  %add.4206.17 = fsub double %25, %27
  %multiply.3037.9 = fmul double %multiply.3002.23, %add.4206.17
  %add.4207.9 = fadd double %add.4164.13, %multiply.3037.9
  %add.4229.5 = fadd double %16, %add.4207.9
  %28 = select i1 %13, double %add.4207.9, double %add.4229.5
  %29 = select i1 %.not1, double %16, double %28
  %30 = select i1 %.not1, double %18, double %add.4207.9
  %31 = select i1 %.not1, double %23, double %add.4206.17
  %32 = getelementptr double, ptr addrspace(1) %arg1022, i64 %14
  %33 = load double, ptr addrspace(1) %32, align 8
  %34 = select i1 %13, double %add.4207.9, double %33
  %35 = select i1 %.not1, double %33, double %34
  %36 = getelementptr double, ptr addrspace(1) %arg1124, i64 %14
  %37 = load double, ptr addrspace(1) %36, align 8
  %38 = select i1 %13, double %27, double %37
  %39 = select i1 %.not1, double %37, double %38
  %40 = getelementptr double, ptr addrspace(1) %arg1226, i64 %14
  %41 = load double, ptr addrspace(1) %40, align 8
  %42 = select i1 %.not1, double %41, double %27
  store double %29, ptr addrspace(1) %15, align 8
  store double %30, ptr addrspace(1) %17, align 8
  store double %31, ptr addrspace(1) %22, align 8
  store double %35, ptr addrspace(1) %32, align 8
  store double %39, ptr addrspace(1) %36, align 8
  store double %42, ptr addrspace(1) %40, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_reduce_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #2 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %1, i64 0
  %3 = load <2 x double>, ptr addrspace(1) %2, align 32, !invariant.load !278
  %4 = extractelement <2 x double> %3, i32 0
  %5 = extractelement <2 x double> %3, i32 1
  %add.4187.23 = fadd double %4, 6.000000e+00
  %multiply.3022.7 = fmul double %add.4187.23, %add.4187.23
  %multiply.3023.7 = fmul double %multiply.3022.7, 2.500000e-01
  %add.4188.5 = fadd double %multiply.3023.7, 0x4009CB1A63AF7C52
  %multiply.3024.3 = fmul double %add.4188.5, 5.000000e-01
  %6 = fsub double 0.000000e+00, %multiply.3024.3
  %add.4187.23.1 = fadd double %5, 6.000000e+00
  %multiply.3022.7.1 = fmul double %add.4187.23.1, %add.4187.23.1
  %multiply.3023.7.1 = fmul double %multiply.3022.7.1, 2.500000e-01
  %add.4188.5.1 = fadd double %multiply.3023.7.1, 0x4009CB1A63AF7C52
  %multiply.3024.3.1 = fmul double %add.4188.5.1, 5.000000e-01
  %7 = fsub double %6, %multiply.3024.3.1
  %8 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 16
  %9 = load <2 x double>, ptr addrspace(1) %8, align 16, !invariant.load !278
  %10 = extractelement <2 x double> %9, i32 0
  %11 = extractelement <2 x double> %9, i32 1
  %add.4187.23.2 = fadd double %10, 6.000000e+00
  %multiply.3022.7.2 = fmul double %add.4187.23.2, %add.4187.23.2
  %multiply.3023.7.2 = fmul double %multiply.3022.7.2, 2.500000e-01
  %add.4188.5.2 = fadd double %multiply.3023.7.2, 0x4009CB1A63AF7C52
  %multiply.3024.3.2 = fmul double %add.4188.5.2, 5.000000e-01
  %12 = fsub double %7, %multiply.3024.3.2
  %add.4187.23.3 = fadd double %11, 6.000000e+00
  %multiply.3022.7.3 = fmul double %add.4187.23.3, %add.4187.23.3
  %multiply.3023.7.3 = fmul double %multiply.3022.7.3, 2.500000e-01
  %add.4188.5.3 = fadd double %multiply.3023.7.3, 0x4009CB1A63AF7C52
  %multiply.3024.3.3 = fmul double %add.4188.5.3, 5.000000e-01
  %13 = fsub double %12, %multiply.3024.3.3
  %14 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 32
  %15 = load <2 x double>, ptr addrspace(1) %14, align 32, !invariant.load !278
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  %add.4187.23.4 = fadd double %16, 6.000000e+00
  %multiply.3022.7.4 = fmul double %add.4187.23.4, %add.4187.23.4
  %multiply.3023.7.4 = fmul double %multiply.3022.7.4, 2.500000e-01
  %add.4188.5.4 = fadd double %multiply.3023.7.4, 0x4009CB1A63AF7C52
  %multiply.3024.3.4 = fmul double %add.4188.5.4, 5.000000e-01
  %18 = fsub double %13, %multiply.3024.3.4
  %add.4187.23.5 = fadd double %17, 6.000000e+00
  %multiply.3022.7.5 = fmul double %add.4187.23.5, %add.4187.23.5
  %multiply.3023.7.5 = fmul double %multiply.3022.7.5, 2.500000e-01
  %add.4188.5.5 = fadd double %multiply.3023.7.5, 0x4009CB1A63AF7C52
  %multiply.3024.3.5 = fmul double %add.4188.5.5, 5.000000e-01
  %19 = fsub double %18, %multiply.3024.3.5
  %20 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 48
  %21 = load <2 x double>, ptr addrspace(1) %20, align 16, !invariant.load !278
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  %add.4187.23.6 = fadd double %22, 6.000000e+00
  %multiply.3022.7.6 = fmul double %add.4187.23.6, %add.4187.23.6
  %multiply.3023.7.6 = fmul double %multiply.3022.7.6, 2.500000e-01
  %add.4188.5.6 = fadd double %multiply.3023.7.6, 0x4009CB1A63AF7C52
  %multiply.3024.3.6 = fmul double %add.4188.5.6, 5.000000e-01
  %24 = fsub double %19, %multiply.3024.3.6
  %add.4187.23.7 = fadd double %23, 6.000000e+00
  %multiply.3022.7.7 = fmul double %add.4187.23.7, %add.4187.23.7
  %multiply.3023.7.7 = fmul double %multiply.3022.7.7, 2.500000e-01
  %add.4188.5.7 = fadd double %multiply.3023.7.7, 0x4009CB1A63AF7C52
  %multiply.3024.3.7 = fmul double %add.4188.5.7, 5.000000e-01
  %25 = fsub double %24, %multiply.3024.3.7
  %26 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 64
  %27 = load <2 x double>, ptr addrspace(1) %26, align 32, !invariant.load !278
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %add.4187.23.8 = fadd double %28, 6.000000e+00
  %multiply.3022.7.8 = fmul double %add.4187.23.8, %add.4187.23.8
  %multiply.3023.7.8 = fmul double %multiply.3022.7.8, 2.500000e-01
  %add.4188.5.8 = fadd double %multiply.3023.7.8, 0x4009CB1A63AF7C52
  %multiply.3024.3.8 = fmul double %add.4188.5.8, 5.000000e-01
  %30 = fsub double %25, %multiply.3024.3.8
  %add.4187.23.9 = fadd double %29, 6.000000e+00
  %multiply.3022.7.9 = fmul double %add.4187.23.9, %add.4187.23.9
  %multiply.3023.7.9 = fmul double %multiply.3022.7.9, 2.500000e-01
  %add.4188.5.9 = fadd double %multiply.3023.7.9, 0x4009CB1A63AF7C52
  %multiply.3024.3.9 = fmul double %add.4188.5.9, 5.000000e-01
  %31 = fsub double %30, %multiply.3024.3.9
  %32 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 80
  %33 = load <2 x double>, ptr addrspace(1) %32, align 16, !invariant.load !278
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %add.4187.23.10 = fadd double %34, 6.000000e+00
  %multiply.3022.7.10 = fmul double %add.4187.23.10, %add.4187.23.10
  %multiply.3023.7.10 = fmul double %multiply.3022.7.10, 2.500000e-01
  %add.4188.5.10 = fadd double %multiply.3023.7.10, 0x4009CB1A63AF7C52
  %multiply.3024.3.10 = fmul double %add.4188.5.10, 5.000000e-01
  %36 = fsub double %31, %multiply.3024.3.10
  %add.4187.23.11 = fadd double %35, 6.000000e+00
  %multiply.3022.7.11 = fmul double %add.4187.23.11, %add.4187.23.11
  %multiply.3023.7.11 = fmul double %multiply.3022.7.11, 2.500000e-01
  %add.4188.5.11 = fadd double %multiply.3023.7.11, 0x4009CB1A63AF7C52
  %multiply.3024.3.11 = fmul double %add.4188.5.11, 5.000000e-01
  %37 = fsub double %36, %multiply.3024.3.11
  %38 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 96
  %39 = load <2 x double>, ptr addrspace(1) %38, align 32, !invariant.load !278
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  %add.4187.23.12 = fadd double %40, 6.000000e+00
  %multiply.3022.7.12 = fmul double %add.4187.23.12, %add.4187.23.12
  %multiply.3023.7.12 = fmul double %multiply.3022.7.12, 2.500000e-01
  %add.4188.5.12 = fadd double %multiply.3023.7.12, 0x4009CB1A63AF7C52
  %multiply.3024.3.12 = fmul double %add.4188.5.12, 5.000000e-01
  %42 = fsub double %37, %multiply.3024.3.12
  %add.4187.23.13 = fadd double %41, 6.000000e+00
  %multiply.3022.7.13 = fmul double %add.4187.23.13, %add.4187.23.13
  %multiply.3023.7.13 = fmul double %multiply.3022.7.13, 2.500000e-01
  %add.4188.5.13 = fadd double %multiply.3023.7.13, 0x4009CB1A63AF7C52
  %multiply.3024.3.13 = fmul double %add.4188.5.13, 5.000000e-01
  %43 = fsub double %42, %multiply.3024.3.13
  %44 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 112
  %45 = load <2 x double>, ptr addrspace(1) %44, align 16, !invariant.load !278
  %46 = extractelement <2 x double> %45, i32 0
  %47 = extractelement <2 x double> %45, i32 1
  %add.4187.23.14 = fadd double %46, 6.000000e+00
  %multiply.3022.7.14 = fmul double %add.4187.23.14, %add.4187.23.14
  %multiply.3023.7.14 = fmul double %multiply.3022.7.14, 2.500000e-01
  %add.4188.5.14 = fadd double %multiply.3023.7.14, 0x4009CB1A63AF7C52
  %multiply.3024.3.14 = fmul double %add.4188.5.14, 5.000000e-01
  %48 = fsub double %43, %multiply.3024.3.14
  %add.4187.23.15 = fadd double %47, 6.000000e+00
  %multiply.3022.7.15 = fmul double %add.4187.23.15, %add.4187.23.15
  %multiply.3023.7.15 = fmul double %multiply.3022.7.15, 2.500000e-01
  %add.4188.5.15 = fadd double %multiply.3023.7.15, 0x4009CB1A63AF7C52
  %multiply.3024.3.15 = fmul double %add.4188.5.15, 5.000000e-01
  %49 = fsub double %48, %multiply.3024.3.15
  %50 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 128
  %51 = load <2 x double>, ptr addrspace(1) %50, align 32, !invariant.load !278
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %add.4187.23.16 = fadd double %52, 6.000000e+00
  %multiply.3022.7.16 = fmul double %add.4187.23.16, %add.4187.23.16
  %multiply.3023.7.16 = fmul double %multiply.3022.7.16, 2.500000e-01
  %add.4188.5.16 = fadd double %multiply.3023.7.16, 0x4009CB1A63AF7C52
  %multiply.3024.3.16 = fmul double %add.4188.5.16, 5.000000e-01
  %54 = fsub double %49, %multiply.3024.3.16
  %add.4187.23.17 = fadd double %53, 6.000000e+00
  %multiply.3022.7.17 = fmul double %add.4187.23.17, %add.4187.23.17
  %multiply.3023.7.17 = fmul double %multiply.3022.7.17, 2.500000e-01
  %add.4188.5.17 = fadd double %multiply.3023.7.17, 0x4009CB1A63AF7C52
  %multiply.3024.3.17 = fmul double %add.4188.5.17, 5.000000e-01
  %55 = fsub double %54, %multiply.3024.3.17
  %56 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 144
  %57 = load <2 x double>, ptr addrspace(1) %56, align 16, !invariant.load !278
  %58 = extractelement <2 x double> %57, i32 0
  %59 = extractelement <2 x double> %57, i32 1
  %add.4187.23.18 = fadd double %58, 6.000000e+00
  %multiply.3022.7.18 = fmul double %add.4187.23.18, %add.4187.23.18
  %multiply.3023.7.18 = fmul double %multiply.3022.7.18, 2.500000e-01
  %add.4188.5.18 = fadd double %multiply.3023.7.18, 0x4009CB1A63AF7C52
  %multiply.3024.3.18 = fmul double %add.4188.5.18, 5.000000e-01
  %60 = fsub double %55, %multiply.3024.3.18
  %add.4187.23.19 = fadd double %59, 6.000000e+00
  %multiply.3022.7.19 = fmul double %add.4187.23.19, %add.4187.23.19
  %multiply.3023.7.19 = fmul double %multiply.3022.7.19, 2.500000e-01
  %add.4188.5.19 = fadd double %multiply.3023.7.19, 0x4009CB1A63AF7C52
  %multiply.3024.3.19 = fmul double %add.4188.5.19, 5.000000e-01
  %61 = fsub double %60, %multiply.3024.3.19
  %62 = getelementptr double, ptr addrspace(1) %arg17, i64 %1
  store double %61, ptr addrspace(1) %62, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_compare_convert_select_fusion(ptr noalias nocapture align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture align 128 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture align 128 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg9, ptr noalias nocapture align 128 dereferenceable(16) %arg10, ptr noalias nocapture align 128 dereferenceable(16) %arg11, ptr noalias nocapture align 128 dereferenceable(16) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture align 128 dereferenceable(8) %arg20, ptr noalias nocapture align 128 dereferenceable(8) %arg21, ptr noalias nocapture align 128 dereferenceable(16) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(2) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg27) local_unnamed_addr #2 {
entry:
  %arg27208 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26206 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25204 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24202 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23200 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22198 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21196 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20194 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19192 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18190 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17188 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16186 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15184 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14182 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13180 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12178 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11176 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10174 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9172 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8170 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7168 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6166 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5164 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4162 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3160 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2158 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1156 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0154 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg1156, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !278
  %4 = getelementptr i64, ptr addrspace(1) %arg4162, i64 %1
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !278
  %6 = getelementptr i8, ptr addrspace(1) %arg3160, i64 %1
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !278
  %8 = getelementptr i8, ptr addrspace(1) %arg2158, i64 %1
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !278
  %10 = getelementptr inbounds [2 x [2 x i32]], ptr addrspace(1) %arg9172, i64 0, i64 %1, i64 0
  %11 = load <2 x i32>, ptr addrspace(1) %10, align 8, !invariant.load !278
  %12 = extractelement <2 x i32> %11, i32 0
  %13 = extractelement <2 x i32> %11, i32 1
  %14 = getelementptr double, ptr addrspace(1) %arg8170, i64 %1
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !278
  %16 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg18190, i64 0, i64 %1, i64 0
  %17 = load <2 x double>, ptr addrspace(1) %16, align 32, !invariant.load !278
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %add.4174.23.clone.1 = fadd double %18, 4.000000e+00
  %multiply.3011.7.clone.1 = fmul double %add.4174.23.clone.1, %add.4174.23.clone.1
  %multiply.3012.7.clone.1 = fmul double %multiply.3011.7.clone.1, 2.500000e-01
  %add.4176.5.clone.1 = fadd double %multiply.3012.7.clone.1, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1 = fmul double %add.4176.5.clone.1, 5.000000e-01
  %add.4174.23.clone.1.1 = fadd double %19, 4.000000e+00
  %multiply.3011.7.clone.1.1 = fmul double %add.4174.23.clone.1.1, %add.4174.23.clone.1.1
  %multiply.3012.7.clone.1.1 = fmul double %multiply.3011.7.clone.1.1, 2.500000e-01
  %add.4176.5.clone.1.1 = fadd double %multiply.3012.7.clone.1.1, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.1 = fmul double %add.4176.5.clone.1.1, 5.000000e-01
  %20 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 16
  %21 = load <2 x double>, ptr addrspace(1) %20, align 16, !invariant.load !278
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  %add.4174.23.clone.1.2 = fadd double %22, 4.000000e+00
  %multiply.3011.7.clone.1.2 = fmul double %add.4174.23.clone.1.2, %add.4174.23.clone.1.2
  %multiply.3012.7.clone.1.2 = fmul double %multiply.3011.7.clone.1.2, 2.500000e-01
  %add.4176.5.clone.1.2 = fadd double %multiply.3012.7.clone.1.2, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.2 = fmul double %add.4176.5.clone.1.2, 5.000000e-01
  %add.4174.23.clone.1.3 = fadd double %23, 4.000000e+00
  %multiply.3011.7.clone.1.3 = fmul double %add.4174.23.clone.1.3, %add.4174.23.clone.1.3
  %multiply.3012.7.clone.1.3 = fmul double %multiply.3011.7.clone.1.3, 2.500000e-01
  %add.4176.5.clone.1.3 = fadd double %multiply.3012.7.clone.1.3, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.3 = fmul double %add.4176.5.clone.1.3, 5.000000e-01
  %24 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 32
  %25 = load <2 x double>, ptr addrspace(1) %24, align 32, !invariant.load !278
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %add.4174.23.clone.1.4 = fadd double %26, 4.000000e+00
  %multiply.3011.7.clone.1.4 = fmul double %add.4174.23.clone.1.4, %add.4174.23.clone.1.4
  %multiply.3012.7.clone.1.4 = fmul double %multiply.3011.7.clone.1.4, 2.500000e-01
  %add.4176.5.clone.1.4 = fadd double %multiply.3012.7.clone.1.4, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.4 = fmul double %add.4176.5.clone.1.4, 5.000000e-01
  %add.4174.23.clone.1.5 = fadd double %27, 4.000000e+00
  %multiply.3011.7.clone.1.5 = fmul double %add.4174.23.clone.1.5, %add.4174.23.clone.1.5
  %multiply.3012.7.clone.1.5 = fmul double %multiply.3011.7.clone.1.5, 2.500000e-01
  %add.4176.5.clone.1.5 = fadd double %multiply.3012.7.clone.1.5, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.5 = fmul double %add.4176.5.clone.1.5, 5.000000e-01
  %28 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 48
  %29 = load <2 x double>, ptr addrspace(1) %28, align 16, !invariant.load !278
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %add.4174.23.clone.1.6 = fadd double %30, 4.000000e+00
  %multiply.3011.7.clone.1.6 = fmul double %add.4174.23.clone.1.6, %add.4174.23.clone.1.6
  %multiply.3012.7.clone.1.6 = fmul double %multiply.3011.7.clone.1.6, 2.500000e-01
  %add.4176.5.clone.1.6 = fadd double %multiply.3012.7.clone.1.6, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.6 = fmul double %add.4176.5.clone.1.6, 5.000000e-01
  %add.4174.23.clone.1.7 = fadd double %31, 4.000000e+00
  %multiply.3011.7.clone.1.7 = fmul double %add.4174.23.clone.1.7, %add.4174.23.clone.1.7
  %multiply.3012.7.clone.1.7 = fmul double %multiply.3011.7.clone.1.7, 2.500000e-01
  %add.4176.5.clone.1.7 = fadd double %multiply.3012.7.clone.1.7, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.7 = fmul double %add.4176.5.clone.1.7, 5.000000e-01
  %32 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 64
  %33 = load <2 x double>, ptr addrspace(1) %32, align 32, !invariant.load !278
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %add.4174.23.clone.1.8 = fadd double %34, 4.000000e+00
  %multiply.3011.7.clone.1.8 = fmul double %add.4174.23.clone.1.8, %add.4174.23.clone.1.8
  %multiply.3012.7.clone.1.8 = fmul double %multiply.3011.7.clone.1.8, 2.500000e-01
  %add.4176.5.clone.1.8 = fadd double %multiply.3012.7.clone.1.8, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.8 = fmul double %add.4176.5.clone.1.8, 5.000000e-01
  %add.4174.23.clone.1.9 = fadd double %35, 4.000000e+00
  %multiply.3011.7.clone.1.9 = fmul double %add.4174.23.clone.1.9, %add.4174.23.clone.1.9
  %multiply.3012.7.clone.1.9 = fmul double %multiply.3011.7.clone.1.9, 2.500000e-01
  %add.4176.5.clone.1.9 = fadd double %multiply.3012.7.clone.1.9, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.9 = fmul double %add.4176.5.clone.1.9, 5.000000e-01
  %36 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 80
  %37 = load <2 x double>, ptr addrspace(1) %36, align 16, !invariant.load !278
  %38 = extractelement <2 x double> %37, i32 0
  %39 = extractelement <2 x double> %37, i32 1
  %add.4174.23.clone.1.10 = fadd double %38, 4.000000e+00
  %multiply.3011.7.clone.1.10 = fmul double %add.4174.23.clone.1.10, %add.4174.23.clone.1.10
  %multiply.3012.7.clone.1.10 = fmul double %multiply.3011.7.clone.1.10, 2.500000e-01
  %add.4176.5.clone.1.10 = fadd double %multiply.3012.7.clone.1.10, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.10 = fmul double %add.4176.5.clone.1.10, 5.000000e-01
  %add.4174.23.clone.1.11 = fadd double %39, 4.000000e+00
  %multiply.3011.7.clone.1.11 = fmul double %add.4174.23.clone.1.11, %add.4174.23.clone.1.11
  %multiply.3012.7.clone.1.11 = fmul double %multiply.3011.7.clone.1.11, 2.500000e-01
  %add.4176.5.clone.1.11 = fadd double %multiply.3012.7.clone.1.11, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.11 = fmul double %add.4176.5.clone.1.11, 5.000000e-01
  %40 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 96
  %41 = load <2 x double>, ptr addrspace(1) %40, align 32, !invariant.load !278
  %42 = extractelement <2 x double> %41, i32 0
  %43 = extractelement <2 x double> %41, i32 1
  %add.4174.23.clone.1.12 = fadd double %42, 4.000000e+00
  %multiply.3011.7.clone.1.12 = fmul double %add.4174.23.clone.1.12, %add.4174.23.clone.1.12
  %multiply.3012.7.clone.1.12 = fmul double %multiply.3011.7.clone.1.12, 2.500000e-01
  %add.4176.5.clone.1.12 = fadd double %multiply.3012.7.clone.1.12, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.12 = fmul double %add.4176.5.clone.1.12, 5.000000e-01
  %add.4174.23.clone.1.13 = fadd double %43, 4.000000e+00
  %multiply.3011.7.clone.1.13 = fmul double %add.4174.23.clone.1.13, %add.4174.23.clone.1.13
  %multiply.3012.7.clone.1.13 = fmul double %multiply.3011.7.clone.1.13, 2.500000e-01
  %add.4176.5.clone.1.13 = fadd double %multiply.3012.7.clone.1.13, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.13 = fmul double %add.4176.5.clone.1.13, 5.000000e-01
  %44 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 112
  %45 = load <2 x double>, ptr addrspace(1) %44, align 16, !invariant.load !278
  %46 = extractelement <2 x double> %45, i32 0
  %47 = extractelement <2 x double> %45, i32 1
  %add.4174.23.clone.1.14 = fadd double %46, 4.000000e+00
  %multiply.3011.7.clone.1.14 = fmul double %add.4174.23.clone.1.14, %add.4174.23.clone.1.14
  %multiply.3012.7.clone.1.14 = fmul double %multiply.3011.7.clone.1.14, 2.500000e-01
  %add.4176.5.clone.1.14 = fadd double %multiply.3012.7.clone.1.14, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.14 = fmul double %add.4176.5.clone.1.14, 5.000000e-01
  %add.4174.23.clone.1.15 = fadd double %47, 4.000000e+00
  %multiply.3011.7.clone.1.15 = fmul double %add.4174.23.clone.1.15, %add.4174.23.clone.1.15
  %multiply.3012.7.clone.1.15 = fmul double %multiply.3011.7.clone.1.15, 2.500000e-01
  %add.4176.5.clone.1.15 = fadd double %multiply.3012.7.clone.1.15, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.15 = fmul double %add.4176.5.clone.1.15, 5.000000e-01
  %48 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 128
  %49 = load <2 x double>, ptr addrspace(1) %48, align 32, !invariant.load !278
  %50 = extractelement <2 x double> %49, i32 0
  %51 = extractelement <2 x double> %49, i32 1
  %add.4174.23.clone.1.16 = fadd double %50, 4.000000e+00
  %multiply.3011.7.clone.1.16 = fmul double %add.4174.23.clone.1.16, %add.4174.23.clone.1.16
  %multiply.3012.7.clone.1.16 = fmul double %multiply.3011.7.clone.1.16, 2.500000e-01
  %add.4176.5.clone.1.16 = fadd double %multiply.3012.7.clone.1.16, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.16 = fmul double %add.4176.5.clone.1.16, 5.000000e-01
  %add.4174.23.clone.1.17 = fadd double %51, 4.000000e+00
  %multiply.3011.7.clone.1.17 = fmul double %add.4174.23.clone.1.17, %add.4174.23.clone.1.17
  %multiply.3012.7.clone.1.17 = fmul double %multiply.3011.7.clone.1.17, 2.500000e-01
  %add.4176.5.clone.1.17 = fadd double %multiply.3012.7.clone.1.17, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.17 = fmul double %add.4176.5.clone.1.17, 5.000000e-01
  %52 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 144
  %53 = load <2 x double>, ptr addrspace(1) %52, align 16, !invariant.load !278
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %add.4174.23.clone.1.18 = fadd double %54, 4.000000e+00
  %multiply.3011.7.clone.1.18 = fmul double %add.4174.23.clone.1.18, %add.4174.23.clone.1.18
  %multiply.3012.7.clone.1.18 = fmul double %multiply.3011.7.clone.1.18, 2.500000e-01
  %add.4176.5.clone.1.18 = fadd double %multiply.3012.7.clone.1.18, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.18 = fmul double %add.4176.5.clone.1.18, 5.000000e-01
  %add.4174.23.clone.1.19 = fadd double %55, 4.000000e+00
  %multiply.3011.7.clone.1.19 = fmul double %add.4174.23.clone.1.19, %add.4174.23.clone.1.19
  %multiply.3012.7.clone.1.19 = fmul double %multiply.3011.7.clone.1.19, 2.500000e-01
  %add.4176.5.clone.1.19 = fadd double %multiply.3012.7.clone.1.19, 0x4009CB1A63AF7C52
  %multiply.3013.3.clone.1.19 = fmul double %add.4176.5.clone.1.19, 5.000000e-01
  %56 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg17188, i64 0, i64 %1, i64 0
  %57 = load <2 x double>, ptr addrspace(1) %56, align 32, !invariant.load !278
  %58 = extractelement <2 x double> %57, i32 0
  %59 = extractelement <2 x double> %57, i32 1
  %add.4178.23.clone.1 = fadd double %58, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1 = fmul double %add.4178.23.clone.1, %add.4178.23.clone.1
  %multiply.3016.7.clone.1 = fmul double %multiply.3015.7.clone.1, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1 = fadd double %multiply.3016.7.clone.1, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1 = fmul double %add.4179.5.clone.1, 5.000000e-01
  %add.4178.23.clone.1.1 = fadd double %59, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.1 = fmul double %add.4178.23.clone.1.1, %add.4178.23.clone.1.1
  %multiply.3016.7.clone.1.1 = fmul double %multiply.3015.7.clone.1.1, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.1 = fadd double %multiply.3016.7.clone.1.1, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.1 = fmul double %add.4179.5.clone.1.1, 5.000000e-01
  %60 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 16
  %61 = load <2 x double>, ptr addrspace(1) %60, align 16, !invariant.load !278
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %add.4178.23.clone.1.2 = fadd double %62, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.2 = fmul double %add.4178.23.clone.1.2, %add.4178.23.clone.1.2
  %multiply.3016.7.clone.1.2 = fmul double %multiply.3015.7.clone.1.2, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.2 = fadd double %multiply.3016.7.clone.1.2, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.2 = fmul double %add.4179.5.clone.1.2, 5.000000e-01
  %add.4178.23.clone.1.3 = fadd double %63, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.3 = fmul double %add.4178.23.clone.1.3, %add.4178.23.clone.1.3
  %multiply.3016.7.clone.1.3 = fmul double %multiply.3015.7.clone.1.3, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.3 = fadd double %multiply.3016.7.clone.1.3, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.3 = fmul double %add.4179.5.clone.1.3, 5.000000e-01
  %64 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 32
  %65 = load <2 x double>, ptr addrspace(1) %64, align 32, !invariant.load !278
  %66 = extractelement <2 x double> %65, i32 0
  %67 = extractelement <2 x double> %65, i32 1
  %add.4178.23.clone.1.4 = fadd double %66, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.4 = fmul double %add.4178.23.clone.1.4, %add.4178.23.clone.1.4
  %multiply.3016.7.clone.1.4 = fmul double %multiply.3015.7.clone.1.4, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.4 = fadd double %multiply.3016.7.clone.1.4, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.4 = fmul double %add.4179.5.clone.1.4, 5.000000e-01
  %add.4178.23.clone.1.5 = fadd double %67, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.5 = fmul double %add.4178.23.clone.1.5, %add.4178.23.clone.1.5
  %multiply.3016.7.clone.1.5 = fmul double %multiply.3015.7.clone.1.5, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.5 = fadd double %multiply.3016.7.clone.1.5, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.5 = fmul double %add.4179.5.clone.1.5, 5.000000e-01
  %68 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 48
  %69 = load <2 x double>, ptr addrspace(1) %68, align 16, !invariant.load !278
  %70 = extractelement <2 x double> %69, i32 0
  %71 = extractelement <2 x double> %69, i32 1
  %add.4178.23.clone.1.6 = fadd double %70, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.6 = fmul double %add.4178.23.clone.1.6, %add.4178.23.clone.1.6
  %multiply.3016.7.clone.1.6 = fmul double %multiply.3015.7.clone.1.6, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.6 = fadd double %multiply.3016.7.clone.1.6, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.6 = fmul double %add.4179.5.clone.1.6, 5.000000e-01
  %add.4178.23.clone.1.7 = fadd double %71, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.7 = fmul double %add.4178.23.clone.1.7, %add.4178.23.clone.1.7
  %multiply.3016.7.clone.1.7 = fmul double %multiply.3015.7.clone.1.7, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.7 = fadd double %multiply.3016.7.clone.1.7, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.7 = fmul double %add.4179.5.clone.1.7, 5.000000e-01
  %72 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 64
  %73 = load <2 x double>, ptr addrspace(1) %72, align 32, !invariant.load !278
  %74 = extractelement <2 x double> %73, i32 0
  %75 = extractelement <2 x double> %73, i32 1
  %add.4178.23.clone.1.8 = fadd double %74, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.8 = fmul double %add.4178.23.clone.1.8, %add.4178.23.clone.1.8
  %multiply.3016.7.clone.1.8 = fmul double %multiply.3015.7.clone.1.8, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.8 = fadd double %multiply.3016.7.clone.1.8, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.8 = fmul double %add.4179.5.clone.1.8, 5.000000e-01
  %add.4178.23.clone.1.9 = fadd double %75, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.9 = fmul double %add.4178.23.clone.1.9, %add.4178.23.clone.1.9
  %multiply.3016.7.clone.1.9 = fmul double %multiply.3015.7.clone.1.9, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.9 = fadd double %multiply.3016.7.clone.1.9, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.9 = fmul double %add.4179.5.clone.1.9, 5.000000e-01
  %76 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 80
  %77 = load <2 x double>, ptr addrspace(1) %76, align 16, !invariant.load !278
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %add.4178.23.clone.1.10 = fadd double %78, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.10 = fmul double %add.4178.23.clone.1.10, %add.4178.23.clone.1.10
  %multiply.3016.7.clone.1.10 = fmul double %multiply.3015.7.clone.1.10, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.10 = fadd double %multiply.3016.7.clone.1.10, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.10 = fmul double %add.4179.5.clone.1.10, 5.000000e-01
  %add.4178.23.clone.1.11 = fadd double %79, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.11 = fmul double %add.4178.23.clone.1.11, %add.4178.23.clone.1.11
  %multiply.3016.7.clone.1.11 = fmul double %multiply.3015.7.clone.1.11, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.11 = fadd double %multiply.3016.7.clone.1.11, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.11 = fmul double %add.4179.5.clone.1.11, 5.000000e-01
  %80 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 96
  %81 = load <2 x double>, ptr addrspace(1) %80, align 32, !invariant.load !278
  %82 = extractelement <2 x double> %81, i32 0
  %83 = extractelement <2 x double> %81, i32 1
  %add.4178.23.clone.1.12 = fadd double %82, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.12 = fmul double %add.4178.23.clone.1.12, %add.4178.23.clone.1.12
  %multiply.3016.7.clone.1.12 = fmul double %multiply.3015.7.clone.1.12, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.12 = fadd double %multiply.3016.7.clone.1.12, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.12 = fmul double %add.4179.5.clone.1.12, 5.000000e-01
  %add.4178.23.clone.1.13 = fadd double %83, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.13 = fmul double %add.4178.23.clone.1.13, %add.4178.23.clone.1.13
  %multiply.3016.7.clone.1.13 = fmul double %multiply.3015.7.clone.1.13, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.13 = fadd double %multiply.3016.7.clone.1.13, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.13 = fmul double %add.4179.5.clone.1.13, 5.000000e-01
  %84 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 112
  %85 = load <2 x double>, ptr addrspace(1) %84, align 16, !invariant.load !278
  %86 = extractelement <2 x double> %85, i32 0
  %87 = extractelement <2 x double> %85, i32 1
  %add.4178.23.clone.1.14 = fadd double %86, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.14 = fmul double %add.4178.23.clone.1.14, %add.4178.23.clone.1.14
  %multiply.3016.7.clone.1.14 = fmul double %multiply.3015.7.clone.1.14, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.14 = fadd double %multiply.3016.7.clone.1.14, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.14 = fmul double %add.4179.5.clone.1.14, 5.000000e-01
  %add.4178.23.clone.1.15 = fadd double %87, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.15 = fmul double %add.4178.23.clone.1.15, %add.4178.23.clone.1.15
  %multiply.3016.7.clone.1.15 = fmul double %multiply.3015.7.clone.1.15, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.15 = fadd double %multiply.3016.7.clone.1.15, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.15 = fmul double %add.4179.5.clone.1.15, 5.000000e-01
  %88 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 128
  %89 = load <2 x double>, ptr addrspace(1) %88, align 32, !invariant.load !278
  %90 = extractelement <2 x double> %89, i32 0
  %91 = extractelement <2 x double> %89, i32 1
  %add.4178.23.clone.1.16 = fadd double %90, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.16 = fmul double %add.4178.23.clone.1.16, %add.4178.23.clone.1.16
  %multiply.3016.7.clone.1.16 = fmul double %multiply.3015.7.clone.1.16, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.16 = fadd double %multiply.3016.7.clone.1.16, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.16 = fmul double %add.4179.5.clone.1.16, 5.000000e-01
  %add.4178.23.clone.1.17 = fadd double %91, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.17 = fmul double %add.4178.23.clone.1.17, %add.4178.23.clone.1.17
  %multiply.3016.7.clone.1.17 = fmul double %multiply.3015.7.clone.1.17, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.17 = fadd double %multiply.3016.7.clone.1.17, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.17 = fmul double %add.4179.5.clone.1.17, 5.000000e-01
  %92 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 144
  %93 = load <2 x double>, ptr addrspace(1) %92, align 16, !invariant.load !278
  %94 = extractelement <2 x double> %93, i32 0
  %95 = extractelement <2 x double> %93, i32 1
  %add.4178.23.clone.1.18 = fadd double %94, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.18 = fmul double %add.4178.23.clone.1.18, %add.4178.23.clone.1.18
  %multiply.3016.7.clone.1.18 = fmul double %multiply.3015.7.clone.1.18, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.18 = fadd double %multiply.3016.7.clone.1.18, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.18 = fmul double %add.4179.5.clone.1.18, 5.000000e-01
  %add.4178.23.clone.1.19 = fadd double %95, 0xBFF62E42FEFA39EF
  %multiply.3015.7.clone.1.19 = fmul double %add.4178.23.clone.1.19, %add.4178.23.clone.1.19
  %multiply.3016.7.clone.1.19 = fmul double %multiply.3015.7.clone.1.19, 0x3FFC71C71C71C71C
  %add.4179.5.clone.1.19 = fadd double %multiply.3016.7.clone.1.19, 0x3FF43340BFCA50EB
  %multiply.3017.3.clone.1.19 = fmul double %add.4179.5.clone.1.19, 5.000000e-01
  %96 = fsub double 0.000000e+00, %multiply.3013.3.clone.1
  %97 = fsub double %96, %multiply.3013.3.clone.1.1
  %98 = fsub double %97, %multiply.3013.3.clone.1.2
  %99 = fsub double %98, %multiply.3013.3.clone.1.3
  %100 = fsub double %99, %multiply.3013.3.clone.1.4
  %101 = fsub double %100, %multiply.3013.3.clone.1.5
  %102 = fsub double %101, %multiply.3013.3.clone.1.6
  %103 = fsub double %102, %multiply.3013.3.clone.1.7
  %104 = fsub double %103, %multiply.3013.3.clone.1.8
  %105 = fsub double %104, %multiply.3013.3.clone.1.9
  %106 = fsub double %105, %multiply.3013.3.clone.1.10
  %107 = fsub double %106, %multiply.3013.3.clone.1.11
  %108 = fsub double %107, %multiply.3013.3.clone.1.12
  %109 = fsub double %108, %multiply.3013.3.clone.1.13
  %110 = fsub double %109, %multiply.3013.3.clone.1.14
  %111 = fsub double %110, %multiply.3013.3.clone.1.15
  %112 = fsub double %111, %multiply.3013.3.clone.1.16
  %113 = fsub double %112, %multiply.3013.3.clone.1.17
  %114 = fsub double %113, %multiply.3013.3.clone.1.18
  %115 = fsub double %114, %multiply.3013.3.clone.1.19
  %116 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg19192, i64 0, i64 %1, i64 0
  %117 = load <2 x double>, ptr addrspace(1) %116, align 32, !invariant.load !278
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  %multiply.3019.5.clone.1 = fmul double %118, %118
  %add.4183.5.clone.1 = fadd double %multiply.3019.5.clone.1, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1 = fmul double %add.4183.5.clone.1, 5.000000e-01
  %multiply.3019.5.clone.1.1 = fmul double %119, %119
  %add.4183.5.clone.1.1 = fadd double %multiply.3019.5.clone.1.1, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.1 = fmul double %add.4183.5.clone.1.1, 5.000000e-01
  %120 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 16
  %121 = load <2 x double>, ptr addrspace(1) %120, align 16, !invariant.load !278
  %122 = extractelement <2 x double> %121, i32 0
  %123 = extractelement <2 x double> %121, i32 1
  %multiply.3019.5.clone.1.2 = fmul double %122, %122
  %add.4183.5.clone.1.2 = fadd double %multiply.3019.5.clone.1.2, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.2 = fmul double %add.4183.5.clone.1.2, 5.000000e-01
  %multiply.3019.5.clone.1.3 = fmul double %123, %123
  %add.4183.5.clone.1.3 = fadd double %multiply.3019.5.clone.1.3, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.3 = fmul double %add.4183.5.clone.1.3, 5.000000e-01
  %124 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 32
  %125 = load <2 x double>, ptr addrspace(1) %124, align 32, !invariant.load !278
  %126 = extractelement <2 x double> %125, i32 0
  %127 = extractelement <2 x double> %125, i32 1
  %multiply.3019.5.clone.1.4 = fmul double %126, %126
  %add.4183.5.clone.1.4 = fadd double %multiply.3019.5.clone.1.4, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.4 = fmul double %add.4183.5.clone.1.4, 5.000000e-01
  %multiply.3019.5.clone.1.5 = fmul double %127, %127
  %add.4183.5.clone.1.5 = fadd double %multiply.3019.5.clone.1.5, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.5 = fmul double %add.4183.5.clone.1.5, 5.000000e-01
  %128 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 48
  %129 = load <2 x double>, ptr addrspace(1) %128, align 16, !invariant.load !278
  %130 = extractelement <2 x double> %129, i32 0
  %131 = extractelement <2 x double> %129, i32 1
  %multiply.3019.5.clone.1.6 = fmul double %130, %130
  %add.4183.5.clone.1.6 = fadd double %multiply.3019.5.clone.1.6, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.6 = fmul double %add.4183.5.clone.1.6, 5.000000e-01
  %multiply.3019.5.clone.1.7 = fmul double %131, %131
  %add.4183.5.clone.1.7 = fadd double %multiply.3019.5.clone.1.7, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.7 = fmul double %add.4183.5.clone.1.7, 5.000000e-01
  %132 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 64
  %133 = load <2 x double>, ptr addrspace(1) %132, align 32, !invariant.load !278
  %134 = extractelement <2 x double> %133, i32 0
  %135 = extractelement <2 x double> %133, i32 1
  %multiply.3019.5.clone.1.8 = fmul double %134, %134
  %add.4183.5.clone.1.8 = fadd double %multiply.3019.5.clone.1.8, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.8 = fmul double %add.4183.5.clone.1.8, 5.000000e-01
  %multiply.3019.5.clone.1.9 = fmul double %135, %135
  %add.4183.5.clone.1.9 = fadd double %multiply.3019.5.clone.1.9, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.9 = fmul double %add.4183.5.clone.1.9, 5.000000e-01
  %136 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 80
  %137 = load <2 x double>, ptr addrspace(1) %136, align 16, !invariant.load !278
  %138 = extractelement <2 x double> %137, i32 0
  %139 = extractelement <2 x double> %137, i32 1
  %multiply.3019.5.clone.1.10 = fmul double %138, %138
  %add.4183.5.clone.1.10 = fadd double %multiply.3019.5.clone.1.10, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.10 = fmul double %add.4183.5.clone.1.10, 5.000000e-01
  %multiply.3019.5.clone.1.11 = fmul double %139, %139
  %add.4183.5.clone.1.11 = fadd double %multiply.3019.5.clone.1.11, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.11 = fmul double %add.4183.5.clone.1.11, 5.000000e-01
  %140 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 96
  %141 = load <2 x double>, ptr addrspace(1) %140, align 32, !invariant.load !278
  %142 = extractelement <2 x double> %141, i32 0
  %143 = extractelement <2 x double> %141, i32 1
  %multiply.3019.5.clone.1.12 = fmul double %142, %142
  %add.4183.5.clone.1.12 = fadd double %multiply.3019.5.clone.1.12, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.12 = fmul double %add.4183.5.clone.1.12, 5.000000e-01
  %multiply.3019.5.clone.1.13 = fmul double %143, %143
  %add.4183.5.clone.1.13 = fadd double %multiply.3019.5.clone.1.13, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.13 = fmul double %add.4183.5.clone.1.13, 5.000000e-01
  %144 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 112
  %145 = load <2 x double>, ptr addrspace(1) %144, align 16, !invariant.load !278
  %146 = extractelement <2 x double> %145, i32 0
  %147 = extractelement <2 x double> %145, i32 1
  %multiply.3019.5.clone.1.14 = fmul double %146, %146
  %add.4183.5.clone.1.14 = fadd double %multiply.3019.5.clone.1.14, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.14 = fmul double %add.4183.5.clone.1.14, 5.000000e-01
  %multiply.3019.5.clone.1.15 = fmul double %147, %147
  %add.4183.5.clone.1.15 = fadd double %multiply.3019.5.clone.1.15, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.15 = fmul double %add.4183.5.clone.1.15, 5.000000e-01
  %148 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 128
  %149 = load <2 x double>, ptr addrspace(1) %148, align 32, !invariant.load !278
  %150 = extractelement <2 x double> %149, i32 0
  %151 = extractelement <2 x double> %149, i32 1
  %multiply.3019.5.clone.1.16 = fmul double %150, %150
  %add.4183.5.clone.1.16 = fadd double %multiply.3019.5.clone.1.16, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.16 = fmul double %add.4183.5.clone.1.16, 5.000000e-01
  %multiply.3019.5.clone.1.17 = fmul double %151, %151
  %add.4183.5.clone.1.17 = fadd double %multiply.3019.5.clone.1.17, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.17 = fmul double %add.4183.5.clone.1.17, 5.000000e-01
  %152 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 144
  %153 = load <2 x double>, ptr addrspace(1) %152, align 16, !invariant.load !278
  %154 = extractelement <2 x double> %153, i32 0
  %155 = extractelement <2 x double> %153, i32 1
  %multiply.3019.5.clone.1.18 = fmul double %154, %154
  %add.4183.5.clone.1.18 = fadd double %multiply.3019.5.clone.1.18, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.18 = fmul double %add.4183.5.clone.1.18, 5.000000e-01
  %multiply.3019.5.clone.1.19 = fmul double %155, %155
  %add.4183.5.clone.1.19 = fadd double %multiply.3019.5.clone.1.19, 0x3FFD67F1C864BEB4
  %multiply.3020.3.clone.1.19 = fmul double %add.4183.5.clone.1.19, 5.000000e-01
  %156 = fsub double 0.000000e+00, %multiply.3017.3.clone.1
  %157 = fsub double %156, %multiply.3017.3.clone.1.1
  %158 = fsub double %157, %multiply.3017.3.clone.1.2
  %159 = fsub double %158, %multiply.3017.3.clone.1.3
  %160 = fsub double %159, %multiply.3017.3.clone.1.4
  %161 = fsub double %160, %multiply.3017.3.clone.1.5
  %162 = fsub double %161, %multiply.3017.3.clone.1.6
  %163 = fsub double %162, %multiply.3017.3.clone.1.7
  %164 = fsub double %163, %multiply.3017.3.clone.1.8
  %165 = fsub double %164, %multiply.3017.3.clone.1.9
  %166 = fsub double %165, %multiply.3017.3.clone.1.10
  %167 = fsub double %166, %multiply.3017.3.clone.1.11
  %168 = fsub double %167, %multiply.3017.3.clone.1.12
  %169 = fsub double %168, %multiply.3017.3.clone.1.13
  %170 = fsub double %169, %multiply.3017.3.clone.1.14
  %171 = fsub double %170, %multiply.3017.3.clone.1.15
  %172 = fsub double %171, %multiply.3017.3.clone.1.16
  %173 = fsub double %172, %multiply.3017.3.clone.1.17
  %174 = fsub double %173, %multiply.3017.3.clone.1.18
  %175 = fsub double %174, %multiply.3017.3.clone.1.19
  %add.4181.1.clone.1 = fadd double %115, %175
  %176 = getelementptr double, ptr addrspace(1) %arg16186, i64 %1
  %177 = load double, ptr addrspace(1) %176, align 8, !invariant.load !278
  %178 = getelementptr double, ptr addrspace(1) %arg15184, i64 %1
  %179 = load double, ptr addrspace(1) %178, align 8, !invariant.load !278
  %180 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg14182, i64 0, i64 %1, i64 0
  %181 = load <2 x double>, ptr addrspace(1) %180, align 32, !invariant.load !278
  %182 = extractelement <2 x double> %181, i32 0
  %183 = extractelement <2 x double> %181, i32 1
  %add.4197.20.clone.1 = fadd double %182, -1.000000e+00
  %multiply.3030.5.clone.1 = fmul double %add.4197.20.clone.1, %add.4197.20.clone.1
  %add.4198.5.clone.1 = fadd double %multiply.3030.5.clone.1, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1 = fmul double %add.4198.5.clone.1, 5.000000e-01
  %184 = fsub double 0.000000e+00, %multiply.3031.3.clone.1
  %add.4197.20.clone.1.1 = fadd double %183, -1.000000e+00
  %multiply.3030.5.clone.1.1 = fmul double %add.4197.20.clone.1.1, %add.4197.20.clone.1.1
  %add.4198.5.clone.1.1 = fadd double %multiply.3030.5.clone.1.1, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.1 = fmul double %add.4198.5.clone.1.1, 5.000000e-01
  %185 = fsub double %184, %multiply.3031.3.clone.1.1
  %186 = getelementptr inbounds i8, ptr addrspace(1) %180, i64 16
  %187 = load <2 x double>, ptr addrspace(1) %186, align 16, !invariant.load !278
  %188 = extractelement <2 x double> %187, i32 0
  %189 = extractelement <2 x double> %187, i32 1
  %add.4197.20.clone.1.2 = fadd double %188, -1.000000e+00
  %multiply.3030.5.clone.1.2 = fmul double %add.4197.20.clone.1.2, %add.4197.20.clone.1.2
  %add.4198.5.clone.1.2 = fadd double %multiply.3030.5.clone.1.2, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.2 = fmul double %add.4198.5.clone.1.2, 5.000000e-01
  %190 = fsub double %185, %multiply.3031.3.clone.1.2
  %add.4197.20.clone.1.3 = fadd double %189, -1.000000e+00
  %multiply.3030.5.clone.1.3 = fmul double %add.4197.20.clone.1.3, %add.4197.20.clone.1.3
  %add.4198.5.clone.1.3 = fadd double %multiply.3030.5.clone.1.3, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.3 = fmul double %add.4198.5.clone.1.3, 5.000000e-01
  %191 = fsub double %190, %multiply.3031.3.clone.1.3
  %192 = getelementptr inbounds i8, ptr addrspace(1) %180, i64 32
  %193 = load <2 x double>, ptr addrspace(1) %192, align 32, !invariant.load !278
  %194 = extractelement <2 x double> %193, i32 0
  %195 = extractelement <2 x double> %193, i32 1
  %add.4197.20.clone.1.4 = fadd double %194, -1.000000e+00
  %multiply.3030.5.clone.1.4 = fmul double %add.4197.20.clone.1.4, %add.4197.20.clone.1.4
  %add.4198.5.clone.1.4 = fadd double %multiply.3030.5.clone.1.4, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.4 = fmul double %add.4198.5.clone.1.4, 5.000000e-01
  %196 = fsub double %191, %multiply.3031.3.clone.1.4
  %add.4197.20.clone.1.5 = fadd double %195, -1.000000e+00
  %multiply.3030.5.clone.1.5 = fmul double %add.4197.20.clone.1.5, %add.4197.20.clone.1.5
  %add.4198.5.clone.1.5 = fadd double %multiply.3030.5.clone.1.5, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.5 = fmul double %add.4198.5.clone.1.5, 5.000000e-01
  %197 = fsub double %196, %multiply.3031.3.clone.1.5
  %198 = getelementptr inbounds i8, ptr addrspace(1) %180, i64 48
  %199 = load <2 x double>, ptr addrspace(1) %198, align 16, !invariant.load !278
  %200 = extractelement <2 x double> %199, i32 0
  %201 = extractelement <2 x double> %199, i32 1
  %add.4197.20.clone.1.6 = fadd double %200, -1.000000e+00
  %multiply.3030.5.clone.1.6 = fmul double %add.4197.20.clone.1.6, %add.4197.20.clone.1.6
  %add.4198.5.clone.1.6 = fadd double %multiply.3030.5.clone.1.6, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.6 = fmul double %add.4198.5.clone.1.6, 5.000000e-01
  %202 = fsub double %197, %multiply.3031.3.clone.1.6
  %add.4197.20.clone.1.7 = fadd double %201, -1.000000e+00
  %multiply.3030.5.clone.1.7 = fmul double %add.4197.20.clone.1.7, %add.4197.20.clone.1.7
  %add.4198.5.clone.1.7 = fadd double %multiply.3030.5.clone.1.7, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.7 = fmul double %add.4198.5.clone.1.7, 5.000000e-01
  %203 = fsub double %202, %multiply.3031.3.clone.1.7
  %204 = getelementptr inbounds i8, ptr addrspace(1) %180, i64 64
  %205 = load <2 x double>, ptr addrspace(1) %204, align 32, !invariant.load !278
  %206 = extractelement <2 x double> %205, i32 0
  %207 = extractelement <2 x double> %205, i32 1
  %add.4197.20.clone.1.8 = fadd double %206, -1.000000e+00
  %multiply.3030.5.clone.1.8 = fmul double %add.4197.20.clone.1.8, %add.4197.20.clone.1.8
  %add.4198.5.clone.1.8 = fadd double %multiply.3030.5.clone.1.8, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.8 = fmul double %add.4198.5.clone.1.8, 5.000000e-01
  %208 = fsub double %203, %multiply.3031.3.clone.1.8
  %add.4197.20.clone.1.9 = fadd double %207, -1.000000e+00
  %multiply.3030.5.clone.1.9 = fmul double %add.4197.20.clone.1.9, %add.4197.20.clone.1.9
  %add.4198.5.clone.1.9 = fadd double %multiply.3030.5.clone.1.9, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.9 = fmul double %add.4198.5.clone.1.9, 5.000000e-01
  %209 = fsub double %208, %multiply.3031.3.clone.1.9
  %210 = getelementptr inbounds i8, ptr addrspace(1) %180, i64 80
  %211 = load <2 x double>, ptr addrspace(1) %210, align 16, !invariant.load !278
  %212 = extractelement <2 x double> %211, i32 0
  %213 = extractelement <2 x double> %211, i32 1
  %add.4197.20.clone.1.10 = fadd double %212, -1.000000e+00
  %multiply.3030.5.clone.1.10 = fmul double %add.4197.20.clone.1.10, %add.4197.20.clone.1.10
  %add.4198.5.clone.1.10 = fadd double %multiply.3030.5.clone.1.10, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.10 = fmul double %add.4198.5.clone.1.10, 5.000000e-01
  %214 = fsub double %209, %multiply.3031.3.clone.1.10
  %add.4197.20.clone.1.11 = fadd double %213, -1.000000e+00
  %multiply.3030.5.clone.1.11 = fmul double %add.4197.20.clone.1.11, %add.4197.20.clone.1.11
  %add.4198.5.clone.1.11 = fadd double %multiply.3030.5.clone.1.11, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.11 = fmul double %add.4198.5.clone.1.11, 5.000000e-01
  %215 = fsub double %214, %multiply.3031.3.clone.1.11
  %216 = getelementptr inbounds i8, ptr addrspace(1) %180, i64 96
  %217 = load <2 x double>, ptr addrspace(1) %216, align 32, !invariant.load !278
  %218 = extractelement <2 x double> %217, i32 0
  %219 = extractelement <2 x double> %217, i32 1
  %add.4197.20.clone.1.12 = fadd double %218, -1.000000e+00
  %multiply.3030.5.clone.1.12 = fmul double %add.4197.20.clone.1.12, %add.4197.20.clone.1.12
  %add.4198.5.clone.1.12 = fadd double %multiply.3030.5.clone.1.12, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.12 = fmul double %add.4198.5.clone.1.12, 5.000000e-01
  %220 = fsub double %215, %multiply.3031.3.clone.1.12
  %add.4197.20.clone.1.13 = fadd double %219, -1.000000e+00
  %multiply.3030.5.clone.1.13 = fmul double %add.4197.20.clone.1.13, %add.4197.20.clone.1.13
  %add.4198.5.clone.1.13 = fadd double %multiply.3030.5.clone.1.13, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.13 = fmul double %add.4198.5.clone.1.13, 5.000000e-01
  %221 = fsub double %220, %multiply.3031.3.clone.1.13
  %222 = getelementptr inbounds i8, ptr addrspace(1) %180, i64 112
  %223 = load <2 x double>, ptr addrspace(1) %222, align 16, !invariant.load !278
  %224 = extractelement <2 x double> %223, i32 0
  %225 = extractelement <2 x double> %223, i32 1
  %add.4197.20.clone.1.14 = fadd double %224, -1.000000e+00
  %multiply.3030.5.clone.1.14 = fmul double %add.4197.20.clone.1.14, %add.4197.20.clone.1.14
  %add.4198.5.clone.1.14 = fadd double %multiply.3030.5.clone.1.14, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.14 = fmul double %add.4198.5.clone.1.14, 5.000000e-01
  %226 = fsub double %221, %multiply.3031.3.clone.1.14
  %add.4197.20.clone.1.15 = fadd double %225, -1.000000e+00
  %multiply.3030.5.clone.1.15 = fmul double %add.4197.20.clone.1.15, %add.4197.20.clone.1.15
  %add.4198.5.clone.1.15 = fadd double %multiply.3030.5.clone.1.15, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.15 = fmul double %add.4198.5.clone.1.15, 5.000000e-01
  %227 = fsub double %226, %multiply.3031.3.clone.1.15
  %228 = getelementptr inbounds i8, ptr addrspace(1) %180, i64 128
  %229 = load <2 x double>, ptr addrspace(1) %228, align 32, !invariant.load !278
  %230 = extractelement <2 x double> %229, i32 0
  %231 = extractelement <2 x double> %229, i32 1
  %add.4197.20.clone.1.16 = fadd double %230, -1.000000e+00
  %multiply.3030.5.clone.1.16 = fmul double %add.4197.20.clone.1.16, %add.4197.20.clone.1.16
  %add.4198.5.clone.1.16 = fadd double %multiply.3030.5.clone.1.16, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.16 = fmul double %add.4198.5.clone.1.16, 5.000000e-01
  %232 = fsub double %227, %multiply.3031.3.clone.1.16
  %add.4197.20.clone.1.17 = fadd double %231, -1.000000e+00
  %multiply.3030.5.clone.1.17 = fmul double %add.4197.20.clone.1.17, %add.4197.20.clone.1.17
  %add.4198.5.clone.1.17 = fadd double %multiply.3030.5.clone.1.17, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.17 = fmul double %add.4198.5.clone.1.17, 5.000000e-01
  %233 = fsub double %232, %multiply.3031.3.clone.1.17
  %234 = getelementptr inbounds i8, ptr addrspace(1) %180, i64 144
  %235 = load <2 x double>, ptr addrspace(1) %234, align 16, !invariant.load !278
  %236 = extractelement <2 x double> %235, i32 0
  %237 = extractelement <2 x double> %235, i32 1
  %add.4197.20.clone.1.18 = fadd double %236, -1.000000e+00
  %multiply.3030.5.clone.1.18 = fmul double %add.4197.20.clone.1.18, %add.4197.20.clone.1.18
  %add.4198.5.clone.1.18 = fadd double %multiply.3030.5.clone.1.18, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.18 = fmul double %add.4198.5.clone.1.18, 5.000000e-01
  %238 = fsub double %233, %multiply.3031.3.clone.1.18
  %add.4197.20.clone.1.19 = fadd double %237, -1.000000e+00
  %multiply.3030.5.clone.1.19 = fmul double %add.4197.20.clone.1.19, %add.4197.20.clone.1.19
  %add.4198.5.clone.1.19 = fadd double %multiply.3030.5.clone.1.19, 0x3FFD67F1C864BEB4
  %multiply.3031.3.clone.1.19 = fmul double %add.4198.5.clone.1.19, 5.000000e-01
  %239 = fsub double %238, %multiply.3031.3.clone.1.19
  %240 = fsub double 0.000000e+00, %multiply.3020.3.clone.1
  %241 = fsub double %240, %multiply.3020.3.clone.1.1
  %242 = fsub double %241, %multiply.3020.3.clone.1.2
  %243 = fsub double %242, %multiply.3020.3.clone.1.3
  %244 = fsub double %243, %multiply.3020.3.clone.1.4
  %245 = fsub double %244, %multiply.3020.3.clone.1.5
  %246 = fsub double %245, %multiply.3020.3.clone.1.6
  %247 = fsub double %246, %multiply.3020.3.clone.1.7
  %248 = fsub double %247, %multiply.3020.3.clone.1.8
  %249 = fsub double %248, %multiply.3020.3.clone.1.9
  %250 = fsub double %249, %multiply.3020.3.clone.1.10
  %251 = fsub double %250, %multiply.3020.3.clone.1.11
  %252 = fsub double %251, %multiply.3020.3.clone.1.12
  %253 = fsub double %252, %multiply.3020.3.clone.1.13
  %254 = fsub double %253, %multiply.3020.3.clone.1.14
  %255 = fsub double %254, %multiply.3020.3.clone.1.15
  %256 = fsub double %255, %multiply.3020.3.clone.1.16
  %257 = fsub double %256, %multiply.3020.3.clone.1.17
  %258 = fsub double %257, %multiply.3020.3.clone.1.18
  %259 = fsub double %258, %multiply.3020.3.clone.1.19
  %add.4184.1.clone.1 = fadd double %add.4181.1.clone.1, %259
  %add.4189.1.clone.1 = fadd double %add.4184.1.clone.1, %177
  %add.4194.1.clone.1 = fadd double %add.4189.1.clone.1, %179
  %add.4199.1.clone.1 = fadd double %add.4194.1.clone.1, %239
  %260 = getelementptr double, ptr addrspace(1) %arg13180, i64 %1
  %261 = load double, ptr addrspace(1) %260, align 8, !invariant.load !278
  %add.4203.1.clone.1 = fadd double %add.4199.1.clone.1, %261
  %262 = getelementptr double, ptr addrspace(1) %arg6166, i64 %1
  %263 = load double, ptr addrspace(1) %262, align 8, !invariant.load !278
  %multiply.3059.9.clone.1 = fmul double %263, 5.000000e-01
  %add.4222.9.clone.1 = fsub double %multiply.3059.9.clone.1, %add.4203.1.clone.1
  %subtract.230.5.clone.1 = fsub double %15, %add.4222.9.clone.1
  %compare.1155.5.clone.1 = fcmp uno double %subtract.230.5.clone.1, 0.000000e+00
  %264 = select i1 %compare.1155.5.clone.1, double 0xFFF0000000000000, double %subtract.230.5.clone.1
  %265 = getelementptr double, ptr addrspace(1) %arg7168, i64 %1
  %266 = load double, ptr addrspace(1) %265, align 8
  %subtract.231.1.clone.1 = fsub double %264, %266
  %267 = fneg double %subtract.231.1.clone.1
  %268 = tail call double @llvm.fma.f64(double %267, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %269 = tail call i32 @llvm.nvvm.d2i.lo(double %268) #13
  %270 = tail call double @llvm.nvvm.add.rn.d(double %268, double 0xC338000000000000) #13
  %271 = tail call double @llvm.fma.f64(double %270, double 0xBFE62E42FEFA39EF, double %267)
  %272 = tail call double @llvm.fma.f64(double %270, double 0xBC7ABC9E3B39803F, double %271)
  %273 = tail call double @llvm.fma.f64(double %272, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %274 = tail call double @llvm.fma.f64(double %273, double %272, double 0x3EC71DEE62401315)
  %275 = tail call double @llvm.fma.f64(double %274, double %272, double 0x3EFA01997C89EB71)
  %276 = tail call double @llvm.fma.f64(double %275, double %272, double 0x3F2A01A014761F65)
  %277 = tail call double @llvm.fma.f64(double %276, double %272, double 0x3F56C16C1852B7AF)
  %278 = tail call double @llvm.fma.f64(double %277, double %272, double 0x3F81111111122322)
  %279 = tail call double @llvm.fma.f64(double %278, double %272, double 0x3FA55555555502A1)
  %280 = tail call double @llvm.fma.f64(double %279, double %272, double 0x3FC5555555555511)
  %281 = tail call double @llvm.fma.f64(double %280, double %272, double 0x3FE000000000000B)
  %282 = tail call double @llvm.fma.f64(double %281, double %272, double 1.000000e+00)
  %283 = tail call double @llvm.fma.f64(double %282, double %272, double 1.000000e+00)
  %284 = tail call i32 @llvm.nvvm.d2i.lo(double %283) #13
  %285 = tail call i32 @llvm.nvvm.d2i.hi(double %283) #13
  %286 = shl i32 %269, 20
  %287 = add i32 %285, %286
  %288 = tail call double @llvm.nvvm.lohi.i2d(i32 %284, i32 %287) #13
  %289 = tail call i32 @llvm.nvvm.d2i.hi(double %267) #13
  %290 = bitcast i32 %289 to float
  %291 = tail call float @llvm.nvvm.fabs.f(float %290) #13
  %292 = fcmp olt float %291, 0x4010C46560000000
  br i1 %292, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %293 = fcmp ogt double %subtract.231.1.clone.1, 0.000000e+00
  %294 = fsub double 0x7FF0000000000000, %subtract.231.1.clone.1
  %z.0.i = select i1 %293, double 0.000000e+00, double %294
  %295 = fcmp olt float %291, 0x4010E90000000000
  br i1 %295, label %296, label %__nv_exp.exit

296:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %297 = sdiv i32 %269, 2
  %298 = shl i32 %297, 20
  %299 = add i32 %285, %298
  %300 = tail call double @llvm.nvvm.lohi.i2d(i32 %284, i32 %299) #13
  %301 = sub nsw i32 %269, %297
  %302 = shl i32 %301, 20
  %303 = add nsw i32 %302, 1072693248
  %304 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %303) #13
  %305 = fmul double %304, %300
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %296
  %z.2.i = phi double [ %288, %entry ], [ %305, %296 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %306 = getelementptr double, ptr addrspace(1) %arg0154, i64 %1
  %307 = load double, ptr addrspace(1) %306, align 8
  %308 = getelementptr double, ptr addrspace(1) %arg5164, i64 %1
  %309 = load double, ptr addrspace(1) %308, align 8
  %subtract.232.1.clone.1 = fsub double %266, %264
  %310 = tail call double @llvm.fabs.f64(double %subtract.232.1.clone.1)
  %311 = fneg double %310
  %312 = tail call double @llvm.fma.f64(double %311, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %313 = tail call i32 @llvm.nvvm.d2i.lo(double %312) #13
  %314 = tail call double @llvm.nvvm.add.rn.d(double %312, double 0xC338000000000000) #13
  %315 = tail call double @llvm.fma.f64(double %314, double 0xBFE62E42FEFA39EF, double %311)
  %316 = tail call double @llvm.fma.f64(double %314, double 0xBC7ABC9E3B39803F, double %315)
  %317 = tail call double @llvm.fma.f64(double %316, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %318 = tail call double @llvm.fma.f64(double %317, double %316, double 0x3EC71DEE62401315)
  %319 = tail call double @llvm.fma.f64(double %318, double %316, double 0x3EFA01997C89EB71)
  %320 = tail call double @llvm.fma.f64(double %319, double %316, double 0x3F2A01A014761F65)
  %321 = tail call double @llvm.fma.f64(double %320, double %316, double 0x3F56C16C1852B7AF)
  %322 = tail call double @llvm.fma.f64(double %321, double %316, double 0x3F81111111122322)
  %323 = tail call double @llvm.fma.f64(double %322, double %316, double 0x3FA55555555502A1)
  %324 = tail call double @llvm.fma.f64(double %323, double %316, double 0x3FC5555555555511)
  %325 = tail call double @llvm.fma.f64(double %324, double %316, double 0x3FE000000000000B)
  %326 = tail call double @llvm.fma.f64(double %325, double %316, double 1.000000e+00)
  %327 = tail call double @llvm.fma.f64(double %326, double %316, double 1.000000e+00)
  %328 = tail call i32 @llvm.nvvm.d2i.lo(double %327) #13
  %329 = tail call i32 @llvm.nvvm.d2i.hi(double %327) #13
  %330 = shl i32 %313, 20
  %331 = add i32 %329, %330
  %332 = tail call double @llvm.nvvm.lohi.i2d(i32 %328, i32 %331) #13
  %333 = tail call i32 @llvm.nvvm.d2i.hi(double %311) #13
  %334 = bitcast i32 %333 to float
  %335 = tail call float @llvm.nvvm.fabs.f(float %334) #13
  %336 = fcmp olt float %335, 0x4010C46560000000
  br i1 %336, label %__nv_exp.exit132, label %__internal_fast_icmp_abs_lt.exit.i129

__internal_fast_icmp_abs_lt.exit.i129:            ; preds = %__nv_exp.exit
  %337 = fcmp one double %subtract.232.1.clone.1, 0.000000e+00
  %338 = fsub double 0x7FF0000000000000, %310
  %z.0.i130 = select i1 %337, double 0.000000e+00, double %338
  %339 = fcmp olt float %335, 0x4010E90000000000
  br i1 %339, label %340, label %__nv_exp.exit132

340:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i129
  %341 = sdiv i32 %313, 2
  %342 = shl i32 %341, 20
  %343 = add i32 %329, %342
  %344 = tail call double @llvm.nvvm.lohi.i2d(i32 %328, i32 %343) #13
  %345 = sub nsw i32 %313, %341
  %346 = shl i32 %345, 20
  %347 = add nsw i32 %346, 1072693248
  %348 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %347) #13
  %349 = fmul double %348, %344
  br label %__nv_exp.exit132

__nv_exp.exit132:                                 ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i129, %340
  %z.2.i131 = phi double [ %332, %__nv_exp.exit ], [ %349, %340 ], [ %z.0.i130, %__internal_fast_icmp_abs_lt.exit.i129 ]
  %350 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i131) #13
  %351 = bitcast i32 %350 to float
  %352 = fcmp olt float %351, 0x3FFCAAAAA0000000
  %353 = fcmp ogt float %351, 0xBFFB333320000000
  %or.cond.i = and i1 %352, %353
  br i1 %or.cond.i, label %354, label %371

354:                                              ; preds = %__nv_exp.exit132
  %355 = fadd double %z.2.i131, 2.000000e+00
  %356 = fdiv double %z.2.i131, %355
  %357 = fneg double %z.2.i131
  %358 = fmul double %356, %357
  %359 = fadd double %z.2.i131, %358
  %360 = fmul double %359, %359
  %361 = tail call double @llvm.fma.f64(double %360, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %362 = tail call double @llvm.fma.f64(double %361, double %360, double 0x3EF3B9FF890F468C)
  %363 = tail call double @llvm.fma.f64(double %362, double %360, double 0x3F17457EFD51BAF8)
  %364 = tail call double @llvm.fma.f64(double %363, double %360, double 0x3F3C71C8DE3CE825)
  %365 = tail call double @llvm.fma.f64(double %364, double %360, double 0x3F6249248FA4661F)
  %366 = tail call double @llvm.fma.f64(double %365, double %360, double 0x3F899999999D70C4)
  %367 = tail call double @llvm.fma.f64(double %366, double %360, double 0x3FB5555555555462)
  %368 = fmul double %360, %367
  %369 = tail call double @llvm.fma.f64(double %368, double %359, double %358)
  %370 = fadd double %z.2.i131, %369
  br label %__nv_log1p.exit

371:                                              ; preds = %__nv_exp.exit132
  %372 = fadd double %z.2.i131, 1.000000e+00
  %373 = tail call i32 @llvm.nvvm.d2i.hi(double %372) #13
  %374 = tail call i32 @llvm.nvvm.d2i.lo(double %372) #13
  %375 = icmp slt i32 %373, 1048576
  %376 = fmul double %372, 0x4350000000000000
  %377 = tail call i32 @llvm.nvvm.d2i.lo(double %376) #13
  %378 = tail call i32 @llvm.nvvm.d2i.hi(double %376) #13
  br i1 %375, label %379, label %380

379:                                              ; preds = %371
  br label %380

380:                                              ; preds = %379, %371
  %.0.i = phi double [ %376, %379 ], [ %372, %371 ]
  %ihi.i.0.i = phi i32 [ %378, %379 ], [ %373, %371 ]
  %ilo.i.0.i = phi i32 [ %377, %379 ], [ %374, %371 ]
  %e.i.0.i = phi i32 [ -1077, %379 ], [ -1023, %371 ]
  %381 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %381, 2146435071
  br i1 %or.cond2.i, label %382, label %429

382:                                              ; preds = %380
  %383 = lshr i32 %ihi.i.0.i, 20
  %384 = add nsw i32 %e.i.0.i, %383
  %385 = and i32 %ihi.i.0.i, 1048575
  %386 = or disjoint i32 %385, 1072693248
  %387 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %386) #13
  %388 = icmp ugt i32 %386, 1073127582
  %389 = tail call i32 @llvm.nvvm.d2i.lo(double %387) #13
  %390 = tail call i32 @llvm.nvvm.d2i.hi(double %387) #13
  %391 = add i32 %390, -1048576
  %392 = tail call double @llvm.nvvm.lohi.i2d(i32 %389, i32 %391) #13
  %spec.select = select i1 %388, double %392, double %387
  %393 = zext i1 %388 to i32
  %spec.select140 = add nsw i32 %384, %393
  %394 = fadd double %spec.select, -1.000000e+00
  %395 = fadd double %spec.select, 1.000000e+00
  %396 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %395) #13
  %397 = fneg double %395
  %398 = tail call double @llvm.fma.f64(double %397, double %396, double 1.000000e+00)
  %399 = tail call double @llvm.fma.f64(double %398, double %398, double %398)
  %400 = tail call double @llvm.fma.f64(double %399, double %396, double %396)
  %401 = fmul double %394, %400
  %402 = fadd double %401, %401
  %403 = fmul double %402, %402
  %404 = tail call double @llvm.fma.f64(double %403, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %405 = tail call double @llvm.fma.f64(double %404, double %403, double 0x3EF3B2669F02676F)
  %406 = tail call double @llvm.fma.f64(double %405, double %403, double 0x3F1745CBA9AB0956)
  %407 = tail call double @llvm.fma.f64(double %406, double %403, double 0x3F3C71C72D1B5154)
  %408 = tail call double @llvm.fma.f64(double %407, double %403, double 0x3F624924923BE72D)
  %409 = tail call double @llvm.fma.f64(double %408, double %403, double 0x3F8999999999A3C4)
  %410 = tail call double @llvm.fma.f64(double %409, double %403, double 0x3FB5555555555554)
  %411 = fsub double %394, %402
  %412 = fmul double %411, 2.000000e+00
  %413 = fneg double %402
  %414 = tail call double @llvm.fma.f64(double %413, double %394, double %412)
  %415 = fmul double %400, %414
  %416 = fmul double %403, %410
  %417 = tail call double @llvm.fma.f64(double %416, double %402, double %415)
  %418 = xor i32 %spec.select140, -2147483648
  %419 = tail call double @llvm.nvvm.lohi.i2d(i32 %418, i32 1127219200) #13
  %420 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %421 = fsub double %419, %420
  %422 = tail call double @llvm.fma.f64(double %421, double 0x3FE62E42FEFA39EF, double %402)
  %423 = fneg double %421
  %424 = tail call double @llvm.fma.f64(double %423, double 0x3FE62E42FEFA39EF, double %422)
  %425 = fsub double %424, %402
  %426 = fsub double %417, %425
  %427 = tail call double @llvm.fma.f64(double %421, double 0x3C7ABC9E3B39803F, double %426)
  %428 = fadd double %422, %427
  br label %__nv_log1p.exit

429:                                              ; preds = %380
  %430 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %431 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #13
  %432 = and i32 %431, 2147483647
  %433 = icmp eq i32 %432, 0
  %q.i.0.i = select i1 %433, double 0xFFF0000000000000, double %430
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %354, %382, %429
  %t.0.i = phi double [ %370, %354 ], [ %428, %382 ], [ %q.i.0.i, %429 ]
  %434 = getelementptr double, ptr addrspace(1) %arg10174, i64 %1
  %435 = load double, ptr addrspace(1) %434, align 8
  %436 = getelementptr double, ptr addrspace(1) %arg11176, i64 %1
  %437 = load double, ptr addrspace(1) %436, align 8
  %438 = getelementptr double, ptr addrspace(1) %arg12178, i64 %1
  %439 = load double, ptr addrspace(1) %438, align 8
  %440 = fcmp ole double %264, 0.000000e+00
  %minimum.8.1.clone.1 = select i1 %440, double %264, double 0.000000e+00
  %subtract.233.1.clone.1 = fsub double %439, %minimum.8.1.clone.1
  %441 = tail call double @llvm.fabs.f64(double %subtract.233.1.clone.1)
  %442 = fneg double %441
  %443 = tail call double @llvm.fma.f64(double %442, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %444 = tail call i32 @llvm.nvvm.d2i.lo(double %443) #13
  %445 = tail call double @llvm.nvvm.add.rn.d(double %443, double 0xC338000000000000) #13
  %446 = tail call double @llvm.fma.f64(double %445, double 0xBFE62E42FEFA39EF, double %442)
  %447 = tail call double @llvm.fma.f64(double %445, double 0xBC7ABC9E3B39803F, double %446)
  %448 = tail call double @llvm.fma.f64(double %447, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %449 = tail call double @llvm.fma.f64(double %448, double %447, double 0x3EC71DEE62401315)
  %450 = tail call double @llvm.fma.f64(double %449, double %447, double 0x3EFA01997C89EB71)
  %451 = tail call double @llvm.fma.f64(double %450, double %447, double 0x3F2A01A014761F65)
  %452 = tail call double @llvm.fma.f64(double %451, double %447, double 0x3F56C16C1852B7AF)
  %453 = tail call double @llvm.fma.f64(double %452, double %447, double 0x3F81111111122322)
  %454 = tail call double @llvm.fma.f64(double %453, double %447, double 0x3FA55555555502A1)
  %455 = tail call double @llvm.fma.f64(double %454, double %447, double 0x3FC5555555555511)
  %456 = tail call double @llvm.fma.f64(double %455, double %447, double 0x3FE000000000000B)
  %457 = tail call double @llvm.fma.f64(double %456, double %447, double 1.000000e+00)
  %458 = tail call double @llvm.fma.f64(double %457, double %447, double 1.000000e+00)
  %459 = tail call i32 @llvm.nvvm.d2i.lo(double %458) #13
  %460 = tail call i32 @llvm.nvvm.d2i.hi(double %458) #13
  %461 = shl i32 %444, 20
  %462 = add i32 %460, %461
  %463 = tail call double @llvm.nvvm.lohi.i2d(i32 %459, i32 %462) #13
  %464 = tail call i32 @llvm.nvvm.d2i.hi(double %442) #13
  %465 = bitcast i32 %464 to float
  %466 = tail call float @llvm.nvvm.fabs.f(float %465) #13
  %467 = fcmp olt float %466, 0x4010C46560000000
  br i1 %467, label %__nv_exp.exit136, label %__internal_fast_icmp_abs_lt.exit.i133

__internal_fast_icmp_abs_lt.exit.i133:            ; preds = %__nv_log1p.exit
  %468 = fcmp one double %subtract.233.1.clone.1, 0.000000e+00
  %469 = fsub double 0x7FF0000000000000, %441
  %z.0.i134 = select i1 %468, double 0.000000e+00, double %469
  %470 = fcmp olt float %466, 0x4010E90000000000
  br i1 %470, label %471, label %__nv_exp.exit136

471:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i133
  %472 = sdiv i32 %444, 2
  %473 = shl i32 %472, 20
  %474 = add i32 %460, %473
  %475 = tail call double @llvm.nvvm.lohi.i2d(i32 %459, i32 %474) #13
  %476 = sub nsw i32 %444, %472
  %477 = shl i32 %476, 20
  %478 = add nsw i32 %477, 1072693248
  %479 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %478) #13
  %480 = fmul double %479, %475
  br label %__nv_exp.exit136

__nv_exp.exit136:                                 ; preds = %__nv_log1p.exit, %__internal_fast_icmp_abs_lt.exit.i133, %471
  %z.2.i135 = phi double [ %463, %__nv_log1p.exit ], [ %480, %471 ], [ %z.0.i134, %__internal_fast_icmp_abs_lt.exit.i133 ]
  %481 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i135) #13
  %482 = bitcast i32 %481 to float
  %483 = fcmp olt float %482, 0x3FFCAAAAA0000000
  %484 = fcmp ogt float %482, 0xBFFB333320000000
  %or.cond.i118 = and i1 %483, %484
  br i1 %or.cond.i118, label %485, label %502

485:                                              ; preds = %__nv_exp.exit136
  %486 = fadd double %z.2.i135, 2.000000e+00
  %487 = fdiv double %z.2.i135, %486
  %488 = fneg double %z.2.i135
  %489 = fmul double %487, %488
  %490 = fadd double %z.2.i135, %489
  %491 = fmul double %490, %490
  %492 = tail call double @llvm.fma.f64(double %491, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %493 = tail call double @llvm.fma.f64(double %492, double %491, double 0x3EF3B9FF890F468C)
  %494 = tail call double @llvm.fma.f64(double %493, double %491, double 0x3F17457EFD51BAF8)
  %495 = tail call double @llvm.fma.f64(double %494, double %491, double 0x3F3C71C8DE3CE825)
  %496 = tail call double @llvm.fma.f64(double %495, double %491, double 0x3F6249248FA4661F)
  %497 = tail call double @llvm.fma.f64(double %496, double %491, double 0x3F899999999D70C4)
  %498 = tail call double @llvm.fma.f64(double %497, double %491, double 0x3FB5555555555462)
  %499 = fmul double %491, %498
  %500 = tail call double @llvm.fma.f64(double %499, double %490, double %489)
  %501 = fadd double %z.2.i135, %500
  br label %__nv_log1p.exit128

502:                                              ; preds = %__nv_exp.exit136
  %503 = fadd double %z.2.i135, 1.000000e+00
  %504 = tail call i32 @llvm.nvvm.d2i.hi(double %503) #13
  %505 = tail call i32 @llvm.nvvm.d2i.lo(double %503) #13
  %506 = icmp slt i32 %504, 1048576
  %507 = fmul double %503, 0x4350000000000000
  %508 = tail call i32 @llvm.nvvm.d2i.lo(double %507) #13
  %509 = tail call i32 @llvm.nvvm.d2i.hi(double %507) #13
  br i1 %506, label %510, label %511

510:                                              ; preds = %502
  br label %511

511:                                              ; preds = %510, %502
  %.0.i119 = phi double [ %507, %510 ], [ %503, %502 ]
  %ihi.i.0.i120 = phi i32 [ %509, %510 ], [ %504, %502 ]
  %ilo.i.0.i121 = phi i32 [ %508, %510 ], [ %505, %502 ]
  %e.i.0.i122 = phi i32 [ -1077, %510 ], [ -1023, %502 ]
  %512 = add i32 %ihi.i.0.i120, -1
  %or.cond2.i123 = icmp ult i32 %512, 2146435071
  br i1 %or.cond2.i123, label %513, label %560

513:                                              ; preds = %511
  %514 = lshr i32 %ihi.i.0.i120, 20
  %515 = add nsw i32 %e.i.0.i122, %514
  %516 = and i32 %ihi.i.0.i120, 1048575
  %517 = or disjoint i32 %516, 1072693248
  %518 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i121, i32 %517) #13
  %519 = icmp ugt i32 %517, 1073127582
  %520 = tail call i32 @llvm.nvvm.d2i.lo(double %518) #13
  %521 = tail call i32 @llvm.nvvm.d2i.hi(double %518) #13
  %522 = add i32 %521, -1048576
  %523 = tail call double @llvm.nvvm.lohi.i2d(i32 %520, i32 %522) #13
  %spec.select141 = select i1 %519, double %523, double %518
  %524 = zext i1 %519 to i32
  %spec.select142 = add nsw i32 %515, %524
  %525 = fadd double %spec.select141, -1.000000e+00
  %526 = fadd double %spec.select141, 1.000000e+00
  %527 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %526) #13
  %528 = fneg double %526
  %529 = tail call double @llvm.fma.f64(double %528, double %527, double 1.000000e+00)
  %530 = tail call double @llvm.fma.f64(double %529, double %529, double %529)
  %531 = tail call double @llvm.fma.f64(double %530, double %527, double %527)
  %532 = fmul double %525, %531
  %533 = fadd double %532, %532
  %534 = fmul double %533, %533
  %535 = tail call double @llvm.fma.f64(double %534, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %536 = tail call double @llvm.fma.f64(double %535, double %534, double 0x3EF3B2669F02676F)
  %537 = tail call double @llvm.fma.f64(double %536, double %534, double 0x3F1745CBA9AB0956)
  %538 = tail call double @llvm.fma.f64(double %537, double %534, double 0x3F3C71C72D1B5154)
  %539 = tail call double @llvm.fma.f64(double %538, double %534, double 0x3F624924923BE72D)
  %540 = tail call double @llvm.fma.f64(double %539, double %534, double 0x3F8999999999A3C4)
  %541 = tail call double @llvm.fma.f64(double %540, double %534, double 0x3FB5555555555554)
  %542 = fsub double %525, %533
  %543 = fmul double %542, 2.000000e+00
  %544 = fneg double %533
  %545 = tail call double @llvm.fma.f64(double %544, double %525, double %543)
  %546 = fmul double %531, %545
  %547 = fmul double %534, %541
  %548 = tail call double @llvm.fma.f64(double %547, double %533, double %546)
  %549 = xor i32 %spec.select142, -2147483648
  %550 = tail call double @llvm.nvvm.lohi.i2d(i32 %549, i32 1127219200) #13
  %551 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #13
  %552 = fsub double %550, %551
  %553 = tail call double @llvm.fma.f64(double %552, double 0x3FE62E42FEFA39EF, double %533)
  %554 = fneg double %552
  %555 = tail call double @llvm.fma.f64(double %554, double 0x3FE62E42FEFA39EF, double %553)
  %556 = fsub double %555, %533
  %557 = fsub double %548, %556
  %558 = tail call double @llvm.fma.f64(double %552, double 0x3C7ABC9E3B39803F, double %557)
  %559 = fadd double %553, %558
  br label %__nv_log1p.exit128

560:                                              ; preds = %511
  %561 = tail call double @llvm.fma.f64(double %.0.i119, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %562 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i119) #13
  %563 = and i32 %562, 2147483647
  %564 = icmp eq i32 %563, 0
  %q.i.0.i124 = select i1 %564, double 0xFFF0000000000000, double %561
  br label %__nv_log1p.exit128

__nv_log1p.exit128:                               ; preds = %485, %513, %560
  %t.0.i125 = phi double [ %501, %485 ], [ %559, %513 ], [ %q.i.0.i124, %560 ]
  %565 = fcmp uno double %439, 0.000000e+00
  %566 = fcmp oge double %439, %minimum.8.1.clone.1
  %567 = or i1 %565, %566
  %maximum.44.1.clone.1 = select i1 %567, double %439, double %minimum.8.1.clone.1
  %add.4227.1.clone.1 = fadd double %minimum.8.1.clone.1, %439
  %compare.1159.1.clone.1 = fcmp uno double %subtract.233.1.clone.1, 0.000000e+00
  %568 = icmp sge i64 %3, %5
  %569 = or i8 %9, %7
  %570 = trunc i8 %569 to i1
  %.not117 = or i1 %568, %570
  %compare.1166.1.clone.1 = fcmp olt double %264, -1.000000e+03
  %571 = zext i1 %compare.1166.1.clone.1 to i8
  %572 = select i1 %.not117, i8 %9, i8 %571
  %573 = select i1 %.not117, double %437, double %add.4203.1.clone.1
  %574 = icmp eq i64 %3, 0
  %575 = select i1 %574, double %add.4203.1.clone.1, double %435
  %576 = select i1 %.not117, double %435, double %575
  %compare.1158.1.clone.1 = fcmp uno double %subtract.232.1.clone.1, 0.000000e+00
  %add.4224.1.clone.1 = fadd double %266, %264
  %577 = fcmp uno double %266, 0.000000e+00
  %578 = fcmp oge double %266, %264
  %579 = or i1 %577, %578
  %maximum.43.1.clone.1 = select i1 %579, double %266, double %264
  %add.4226.1.clone.1 = fadd double %maximum.43.1.clone.1, %t.0.i
  %580 = select i1 %compare.1158.1.clone.1, double %add.4224.1.clone.1, double %add.4226.1.clone.1
  %581 = select i1 %574, double %264, double %580
  %582 = select i1 %.not117, double %266, double %581
  %583 = trunc i64 %3 to i32
  %584 = add i32 %13, %583
  %585 = add i32 %584, %12
  %586 = tail call i32 @llvm.fshl.i32(i32 %584, i32 %584, i32 13)
  %587 = xor i32 %585, %586
  %588 = add i32 %587, %585
  %589 = tail call i32 @llvm.fshl.i32(i32 %587, i32 %587, i32 15)
  %590 = xor i32 %588, %589
  %591 = add i32 %590, %588
  %592 = tail call i32 @llvm.fshl.i32(i32 %590, i32 %590, i32 26)
  %593 = xor i32 %591, %592
  %594 = add i32 %593, %591
  %595 = add i32 %594, %13
  %596 = tail call i32 @llvm.fshl.i32(i32 %593, i32 %593, i32 6)
  %597 = xor i32 %594, %596
  %598 = xor i32 %12, %13
  %599 = xor i32 %598, 466688986
  %600 = add i32 %599, 1
  %601 = add i32 %600, %597
  %602 = add i32 %595, %601
  %603 = tail call i32 @llvm.fshl.i32(i32 %601, i32 %601, i32 17)
  %604 = xor i32 %602, %603
  %605 = add i32 %604, %602
  %606 = tail call i32 @llvm.fshl.i32(i32 %604, i32 %604, i32 29)
  %607 = xor i32 %605, %606
  %608 = add i32 %607, %605
  %609 = tail call i32 @llvm.fshl.i32(i32 %607, i32 %607, i32 16)
  %610 = xor i32 %608, %609
  %611 = add i32 %610, %608
  %612 = add i32 %611, %599
  %613 = tail call i32 @llvm.fshl.i32(i32 %610, i32 %610, i32 24)
  %614 = xor i32 %611, %613
  %615 = add i32 %12, 2
  %616 = add i32 %615, %614
  %617 = add i32 %612, %616
  %618 = tail call i32 @llvm.fshl.i32(i32 %616, i32 %616, i32 13)
  %619 = xor i32 %617, %618
  %620 = add i32 %619, %617
  %621 = tail call i32 @llvm.fshl.i32(i32 %619, i32 %619, i32 15)
  %622 = xor i32 %620, %621
  %623 = add i32 %622, %620
  %624 = tail call i32 @llvm.fshl.i32(i32 %622, i32 %622, i32 26)
  %625 = xor i32 %623, %624
  %626 = add i32 %625, %623
  %627 = add i32 %626, %12
  %628 = tail call i32 @llvm.fshl.i32(i32 %625, i32 %625, i32 6)
  %629 = xor i32 %626, %628
  %630 = add i32 %13, 3
  %631 = add i32 %630, %629
  %632 = add i32 %627, %631
  %633 = tail call i32 @llvm.fshl.i32(i32 %631, i32 %631, i32 17)
  %634 = xor i32 %632, %633
  %635 = add i32 %634, %632
  %636 = tail call i32 @llvm.fshl.i32(i32 %634, i32 %634, i32 29)
  %637 = xor i32 %635, %636
  %638 = add i32 %637, %635
  %639 = tail call i32 @llvm.fshl.i32(i32 %637, i32 %637, i32 16)
  %640 = xor i32 %638, %639
  %641 = add i32 %640, %638
  %642 = add i32 %641, %13
  %643 = tail call i32 @llvm.fshl.i32(i32 %640, i32 %640, i32 24)
  %644 = xor i32 %641, %643
  %645 = add i32 %599, 4
  %646 = add i32 %645, %644
  %647 = add i32 %642, %646
  %648 = tail call i32 @llvm.fshl.i32(i32 %646, i32 %646, i32 13)
  %649 = xor i32 %647, %648
  %650 = add i32 %649, %647
  %651 = tail call i32 @llvm.fshl.i32(i32 %649, i32 %649, i32 15)
  %652 = xor i32 %650, %651
  %653 = add i32 %652, %650
  %654 = tail call i32 @llvm.fshl.i32(i32 %652, i32 %652, i32 26)
  %655 = xor i32 %653, %654
  %656 = add i32 %655, %653
  %657 = add i32 %656, %599
  %658 = tail call i32 @llvm.fshl.i32(i32 %655, i32 %655, i32 6)
  %659 = xor i32 %656, %658
  %660 = add i32 %659, %12
  %661 = add i32 %660, 6
  %662 = add i32 %661, %657
  %663 = tail call i32 @llvm.fshl.i32(i32 %661, i32 %661, i32 13)
  %664 = xor i32 %662, %663
  %665 = add i32 %664, %662
  %666 = tail call i32 @llvm.fshl.i32(i32 %664, i32 %664, i32 15)
  %667 = xor i32 %665, %666
  %668 = add i32 %667, %665
  %669 = tail call i32 @llvm.fshl.i32(i32 %667, i32 %667, i32 26)
  %670 = xor i32 %668, %669
  %671 = add i32 %670, %668
  %672 = add i32 %660, 5
  %673 = add i32 %671, %672
  %674 = tail call i32 @llvm.fshl.i32(i32 %670, i32 %670, i32 6)
  %675 = xor i32 %671, %674
  %676 = xor i32 %657, %672
  %677 = xor i32 %676, 466688986
  %678 = add i32 %677, 1
  %679 = add i32 %678, %675
  %680 = add i32 %673, %679
  %681 = tail call i32 @llvm.fshl.i32(i32 %679, i32 %679, i32 17)
  %682 = xor i32 %680, %681
  %683 = add i32 %682, %680
  %684 = tail call i32 @llvm.fshl.i32(i32 %682, i32 %682, i32 29)
  %685 = xor i32 %683, %684
  %686 = add i32 %685, %683
  %687 = tail call i32 @llvm.fshl.i32(i32 %685, i32 %685, i32 16)
  %688 = xor i32 %686, %687
  %689 = add i32 %688, %686
  %690 = add i32 %689, %677
  %691 = tail call i32 @llvm.fshl.i32(i32 %688, i32 %688, i32 24)
  %692 = xor i32 %689, %691
  %693 = add i32 %657, 2
  %694 = add i32 %693, %692
  %695 = add i32 %690, %694
  %696 = tail call i32 @llvm.fshl.i32(i32 %694, i32 %694, i32 13)
  %697 = xor i32 %695, %696
  %698 = add i32 %697, %695
  %699 = tail call i32 @llvm.fshl.i32(i32 %697, i32 %697, i32 15)
  %700 = xor i32 %698, %699
  %701 = add i32 %700, %698
  %702 = tail call i32 @llvm.fshl.i32(i32 %700, i32 %700, i32 26)
  %703 = xor i32 %701, %702
  %704 = add i32 %703, %701
  %705 = add i32 %704, %657
  %706 = tail call i32 @llvm.fshl.i32(i32 %703, i32 %703, i32 6)
  %707 = xor i32 %704, %706
  %708 = add i32 %660, 8
  %709 = add i32 %708, %707
  %710 = add i32 %705, %709
  %711 = tail call i32 @llvm.fshl.i32(i32 %709, i32 %709, i32 17)
  %712 = xor i32 %710, %711
  %713 = add i32 %712, %710
  %714 = tail call i32 @llvm.fshl.i32(i32 %712, i32 %712, i32 29)
  %715 = xor i32 %713, %714
  %716 = add i32 %715, %713
  %717 = tail call i32 @llvm.fshl.i32(i32 %715, i32 %715, i32 16)
  %718 = xor i32 %716, %717
  %719 = add i32 %718, %716
  %720 = add i32 %719, %672
  %721 = tail call i32 @llvm.fshl.i32(i32 %718, i32 %718, i32 24)
  %722 = xor i32 %719, %721
  %723 = add i32 %677, 4
  %724 = add i32 %723, %722
  %725 = add i32 %720, %724
  %726 = tail call i32 @llvm.fshl.i32(i32 %724, i32 %724, i32 13)
  %727 = xor i32 %725, %726
  %728 = add i32 %727, %725
  %729 = tail call i32 @llvm.fshl.i32(i32 %727, i32 %727, i32 15)
  %730 = xor i32 %728, %729
  %731 = add i32 %730, %728
  %732 = tail call i32 @llvm.fshl.i32(i32 %730, i32 %730, i32 26)
  %733 = xor i32 %731, %732
  %734 = add i32 %733, %731
  %735 = add i32 %734, %677
  %736 = zext i32 %735 to i64
  %737 = shl nuw i64 %736, 32
  %738 = tail call i32 @llvm.fshl.i32(i32 %733, i32 %733, i32 6)
  %739 = xor i32 %734, %738
  %740 = add i32 %657, 5
  %741 = add i32 %740, %739
  %742 = zext i32 %741 to i64
  %743 = or disjoint i64 %737, %742
  %744 = lshr i64 %743, 12
  %745 = or disjoint i64 %744, 4607182418800017408
  %746 = bitcast i64 %745 to double
  %add.4163.5.clone.1 = fadd double %746, -1.000000e+00
  %747 = fcmp ole double %add.4163.5.clone.1, 0.000000e+00
  %maximum.41.3.clone.1 = select i1 %747, double 0.000000e+00, double %add.4163.5.clone.1
  %add.4223.5.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.621.3.clone.1 = fdiv double 1.000000e+00, %add.4223.5.clone.1
  %compare.1156.5.clone.1 = fcmp uge double %maximum.41.3.clone.1, %divide.621.3.clone.1
  %748 = select i1 %compare.1156.5.clone.1, double %309, double %add.4222.9.clone.1
  %749 = select i1 %574, double %add.4222.9.clone.1, double %748
  %750 = select i1 %.not117, double %309, double %749
  %751 = select i1 %compare.1156.5.clone.1, double %307, double %add.4203.1.clone.1
  %752 = select i1 %574, double %add.4203.1.clone.1, double %751
  %753 = select i1 %.not117, double %307, double %752
  %754 = zext i1 %compare.1156.5.clone.1 to i8
  %add.4228.1.clone.1 = fadd double %maximum.44.1.clone.1, %t.0.i125
  %755 = select i1 %compare.1159.1.clone.1, double %add.4227.1.clone.1, double %add.4228.1.clone.1
  %756 = select i1 %574, double %minimum.8.1.clone.1, double %755
  %757 = select i1 %.not117, double %439, double %756
  %758 = ashr i64 %3, 1
  %759 = tail call i64 @llvm.abs.i64(i64 %758, i1 true)
  %760 = tail call range(i64 0, 64) i64 @llvm.ctpop.i64(i64 %759)
  %761 = trunc nuw nsw i64 %760 to i32
  %762 = getelementptr i32, ptr addrspace(1) %arg20194, i64 %1
  %763 = load i32, ptr addrspace(1) %762, align 4
  %764 = select i1 %.not117, i32 %763, i32 %761
  %765 = xor i64 %3, -1
  %766 = add i64 %3, 1
  %767 = and i64 %766, %765
  %768 = add i64 %767, -1
  %769 = sub i64 1, %767
  %770 = icmp slt i64 %768, 0
  %771 = select i1 %770, i64 %769, i64 %768
  %772 = tail call range(i64 0, 65) i64 @llvm.ctpop.i64(i64 %771)
  %773 = trunc nuw nsw i64 %772 to i32
  %774 = sub nsw i32 %761, %773
  %775 = add nsw i32 %774, 1
  %776 = getelementptr i32, ptr addrspace(1) %arg21196, i64 %1
  %777 = load i32, ptr addrspace(1) %776, align 4
  %778 = select i1 %.not117, i32 %777, i32 %775
  %779 = select i1 %.not117, i64 %3, i64 %766
  %780 = getelementptr i64, ptr addrspace(1) %arg22198, i64 %1
  %781 = load i64, ptr addrspace(1) %780, align 8
  %782 = add i64 %781, 1
  %783 = select i1 %574, i64 1, i64 %782
  %784 = select i1 %.not117, i64 %781, i64 %783
  store double %753, ptr addrspace(1) %306, align 8
  store double %750, ptr addrspace(1) %308, align 8
  %785 = getelementptr i8, ptr addrspace(1) %arg23200, i64 %1
  store i8 %754, ptr addrspace(1) %785, align 1
  store double %582, ptr addrspace(1) %265, align 8
  store double %576, ptr addrspace(1) %434, align 8
  store double %573, ptr addrspace(1) %436, align 8
  %786 = getelementptr i8, ptr addrspace(1) %arg24202, i64 %1
  store i8 %572, ptr addrspace(1) %786, align 1
  store double %757, ptr addrspace(1) %438, align 8
  store i32 %764, ptr addrspace(1) %762, align 4
  store i32 %778, ptr addrspace(1) %776, align 4
  %787 = getelementptr i32, ptr addrspace(1) %arg25204, i64 %1
  store i32 %775, ptr addrspace(1) %787, align 4
  %788 = getelementptr i32, ptr addrspace(1) %arg26206, i64 %1
  store i32 %761, ptr addrspace(1) %788, align 4
  %789 = getelementptr i64, ptr addrspace(1) %arg27208, i64 %1
  store i64 %779, ptr addrspace(1) %789, align 8
  store i64 %784, ptr addrspace(1) %780, align 8
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 240
  br i1 %3, label %concatenate.pivot.0., label %scatter.14.1.in_bounds-after

scatter.14.1.in_bounds-after:                     ; preds = %concatenate.pivot.0., %scatter.in_bounds-true, %entry
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 119
  %4 = zext i1 %.cmp to i64
  %param_2.213710 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg231, i64 0, i64 %4
  %param_2.213711 = load i32, ptr addrspace(1) %param_2.213710, align 4, !invariant.load !278
  %5 = icmp slt i32 %param_2.213711, 0
  %6 = add i32 %param_2.213711, 10
  %7 = select i1 %5, i32 %6, i32 %param_2.213711
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
  %param_1.158821 = load double, ptr addrspace(1) %10, align 8, !invariant.load !278
  store double %param_1.158821, ptr addrspace(1) %14, align 8
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !295
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
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
  %6 = load i64, ptr addrspace(1) %5, align 8, !invariant.load !278
  %7 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg410, i64 0, i64 %4
  %8 = load i64, ptr addrspace(1) %7, align 8, !invariant.load !278
  %9 = icmp sge i64 %6, %8
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg26, i64 0, i64 %4
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !278
  %12 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg14, i64 0, i64 %4
  %13 = load i8, ptr addrspace(1) %12, align 1, !invariant.load !278
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
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !278
  %30 = select i1 %24, double %29, double %27
  %31 = select i1 %.not1, double %27, double %30
  %32 = getelementptr double, ptr addrspace(1) %arg614, i64 %25
  %33 = load double, ptr addrspace(1) %32, align 8
  %34 = getelementptr double, ptr addrspace(1) %arg716, i64 %25
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !278
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
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !285
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
  %param_1.702 = load i32, ptr addrspace(1) %param_1.70, align 4, !invariant.load !278
  %param_2.63 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg215, i64 0, i64 %5
  %param_2.633 = load i32, ptr addrspace(1) %param_2.63, align 4, !invariant.load !278
  %6 = icmp sge i32 %param_1.702, %param_2.633
  %param_0.50 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg011, i64 0, i64 %5
  %param_0.504 = load i8, ptr addrspace(1) %param_0.50, align 1, !invariant.load !278
  %7 = trunc i8 %param_0.504 to i1
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
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !281
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %param_1.64322 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg1702, i64 0, i64 %1
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %param_1.64323 = load i32, ptr addrspace(1) %param_1.64322, align 4, !invariant.load !278
  %3 = icmp slt i32 %param_1.64323, 0
  %4 = add i32 %param_1.64323, 10
  %5 = select i1 %3, i32 %4, i32 %param_1.64323
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 9)
  %8 = zext nneg i32 %7 to i64
  %9 = zext nneg i32 %2 to i64
  %param_0.46355 = getelementptr inbounds [2 x [10 x [120 x double]]], ptr addrspace(1) %arg0700, i64 0, i64 %1, i64 %8, i64 %9
  %10 = load <2 x double>, ptr addrspace(1) %param_0.46355, align 16, !invariant.load !278
  %param_0.46356730 = extractelement <2 x double> %10, i32 0
  %param_0.46356.1731 = extractelement <2 x double> %10, i32 1
  %param_3.44357 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg3706, i64 0, i64 %1, i64 %9
  %11 = load <2 x double>, ptr addrspace(1) %param_3.44357, align 16, !invariant.load !278
  %param_3.44358732 = extractelement <2 x double> %11, i32 0
  %param_3.44358.1733 = extractelement <2 x double> %11, i32 1
  %param_4.41413 = getelementptr inbounds [2 x [10 x [120 x double]]], ptr addrspace(1) %arg4708, i64 0, i64 %1, i64 %8, i64 %9
  %12 = load <2 x double>, ptr addrspace(1) %param_4.41413, align 16, !invariant.load !278
  %param_4.41414734 = extractelement <2 x double> %12, i32 0
  %param_4.41414.1735 = extractelement <2 x double> %12, i32 1
  %subtract.218.7415 = fsub double %param_3.44358732, %param_4.41414734
  %add.3972.7472 = fadd double %param_0.46356730, %subtract.218.7415
  %param_2.57473 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg2704, i64 0, i64 %1, i64 %9
  %13 = load <2 x double>, ptr addrspace(1) %param_2.57473, align 16, !invariant.load !278
  %param_2.57474736 = extractelement <2 x double> %13, i32 0
  %param_2.57474.1737 = extractelement <2 x double> %13, i32 1
  %add.3973.9475 = fadd double %param_0.46356730, %param_2.57474736
  %multiply.2886.7477 = fmul double %add.3973.9475, 5.000000e-01
  %subtract.219.5478 = fsub double %add.3972.7472, %multiply.2886.7477
  %multiply.2887.3479 = fmul double %param_0.46356730, %subtract.219.5478
  %add.3969.i671 = fadd double %multiply.2887.3479, 0.000000e+00
  %multiply.2888.1.clone.1605 = fmul double %param_2.57474736, %subtract.219.5478
  %add.3969.i672 = fadd double %multiply.2888.1.clone.1605, 0.000000e+00
  %subtract.218.7415.1 = fsub double %param_3.44358.1733, %param_4.41414.1735
  %add.3972.7472.1 = fadd double %param_0.46356.1731, %subtract.218.7415.1
  %add.3973.9475.1 = fadd double %param_0.46356.1731, %param_2.57474.1737
  %multiply.2886.7477.1 = fmul double %add.3973.9475.1, 5.000000e-01
  %subtract.219.5478.1 = fsub double %add.3972.7472.1, %multiply.2886.7477.1
  %multiply.2887.3479.1 = fmul double %param_0.46356.1731, %subtract.219.5478.1
  %add.3969.i671.1 = fadd double %add.3969.i671, %multiply.2887.3479.1
  %multiply.2888.1.clone.1605.1 = fmul double %param_2.57474.1737, %subtract.219.5478.1
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
  %param_0.46355.1683 = getelementptr inbounds [2 x [10 x [120 x double]]], ptr addrspace(1) %arg0700, i64 0, i64 %1, i64 %8, i64 %59
  %60 = load <2 x double>, ptr addrspace(1) %param_0.46355.1683, align 16, !invariant.load !278
  %param_0.46356.1684722 = extractelement <2 x double> %60, i32 0
  %param_0.46356.1.1723 = extractelement <2 x double> %60, i32 1
  %param_3.44357.1685 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg3706, i64 0, i64 %1, i64 %59
  %61 = load <2 x double>, ptr addrspace(1) %param_3.44357.1685, align 16, !invariant.load !278
  %param_3.44358.1686724 = extractelement <2 x double> %61, i32 0
  %param_3.44358.1.1725 = extractelement <2 x double> %61, i32 1
  %param_4.41413.1687 = getelementptr inbounds [2 x [10 x [120 x double]]], ptr addrspace(1) %arg4708, i64 0, i64 %1, i64 %8, i64 %59
  %62 = load <2 x double>, ptr addrspace(1) %param_4.41413.1687, align 16, !invariant.load !278
  %param_4.41414.1688726 = extractelement <2 x double> %62, i32 0
  %param_4.41414.1.1727 = extractelement <2 x double> %62, i32 1
  %subtract.218.7415.1689 = fsub double %param_3.44358.1686724, %param_4.41414.1688726
  %add.3972.7472.1690 = fadd double %param_0.46356.1684722, %subtract.218.7415.1689
  %param_2.57473.1691 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg2704, i64 0, i64 %1, i64 %59
  %63 = load <2 x double>, ptr addrspace(1) %param_2.57473.1691, align 16, !invariant.load !278
  %param_2.57474.1692728 = extractelement <2 x double> %63, i32 0
  %param_2.57474.1.1729 = extractelement <2 x double> %63, i32 1
  %add.3973.9475.1693 = fadd double %param_0.46356.1684722, %param_2.57474.1692728
  %multiply.2886.7477.1694 = fmul double %add.3973.9475.1693, 5.000000e-01
  %subtract.219.5478.1695 = fsub double %add.3972.7472.1690, %multiply.2886.7477.1694
  %multiply.2887.3479.1696 = fmul double %param_0.46356.1684722, %subtract.219.5478.1695
  %add.3969.i671.1697 = fadd double %add.3969.i671.1, %multiply.2887.3479.1696
  %multiply.2888.1.clone.1605.1698 = fmul double %param_2.57474.1692728, %subtract.219.5478.1695
  %add.3969.i672.1699 = fadd double %add.3969.i672.1, %multiply.2888.1.clone.1605.1698
  %subtract.218.7415.1.1 = fsub double %param_3.44358.1.1725, %param_4.41414.1.1727
  %add.3972.7472.1.1 = fadd double %param_0.46356.1.1723, %subtract.218.7415.1.1
  %add.3973.9475.1.1 = fadd double %param_0.46356.1.1723, %param_2.57474.1.1729
  %multiply.2886.7477.1.1 = fmul double %add.3973.9475.1.1, 5.000000e-01
  %subtract.219.5478.1.1 = fsub double %add.3972.7472.1.1, %multiply.2886.7477.1.1
  %multiply.2887.3479.1.1 = fmul double %param_0.46356.1.1723, %subtract.219.5478.1.1
  %add.3969.i671.1.1 = fadd double %add.3969.i671.1697, %multiply.2887.3479.1.1
  %multiply.2888.1.clone.1605.1.1 = fmul double %param_2.57474.1.1729, %subtract.219.5478.1.1
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
define void @loop_select_fusion(ptr noalias nocapture align 128 dereferenceable(8) %arg0, ptr noalias nocapture align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4) local_unnamed_addr #2 {
entry:
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg02, i64 %1
  %3 = load i32, ptr addrspace(1) %2, align 4
  %4 = getelementptr i32, ptr addrspace(1) %arg26, i64 %1
  %5 = load i32, ptr addrspace(1) %4, align 4, !invariant.load !278
  %6 = icmp slt i32 %3, %5
  %7 = getelementptr i8, ptr addrspace(1) %arg14, i64 %1
  %8 = load i8, ptr addrspace(1) %7, align 1
  %9 = trunc i8 %8 to i1
  %.not1 = or i1 %6, %9
  %not..not1 = xor i1 %.not1, true
  %10 = sext i1 %not..not1 to i32
  %11 = add i32 %3, %10
  %12 = getelementptr double, ptr addrspace(1) %arg410, i64 %1
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !278
  %compare.1128.3.clone.1 = fcmp ole double %13, 0.000000e+00
  %14 = getelementptr double, ptr addrspace(1) %arg38, i64 %1
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !278
  %compare.1129.5.clone.1 = fcmp ole double %15, 0.000000e+00
  %16 = or i1 %compare.1128.3.clone.1, %compare.1129.5.clone.1
  %17 = zext i1 %16 to i8
  %18 = select i1 %.not1, i8 %8, i8 %17
  store i32 %11, ptr addrspace(1) %2, align 4
  store i8 %18, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_2(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg11, ptr noalias nocapture align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture align 128 dereferenceable(320) %arg20, ptr noalias nocapture align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture align 128 dereferenceable(320) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture align 128 dereferenceable(320) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg26, ptr noalias nocapture align 128 dereferenceable(320) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg28, ptr noalias nocapture align 128 dereferenceable(320) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg30, ptr noalias nocapture align 128 dereferenceable(320) %arg31, ptr noalias nocapture align 128 dereferenceable(320) %arg32, ptr noalias nocapture align 128 dereferenceable(320) %arg33, ptr noalias nocapture align 128 dereferenceable(320) %arg34, ptr noalias nocapture align 128 dereferenceable(320) %arg35, ptr noalias nocapture align 128 dereferenceable(320) %arg36, ptr noalias nocapture align 128 dereferenceable(320) %arg37, ptr noalias nocapture align 128 dereferenceable(320) %arg38, ptr noalias nocapture align 128 dereferenceable(320) %arg39, ptr noalias nocapture align 128 dereferenceable(320) %arg40, ptr noalias nocapture align 128 dereferenceable(320) %arg41, ptr noalias nocapture align 128 dereferenceable(320) %arg42, ptr noalias nocapture align 128 dereferenceable(320) %arg43, ptr noalias nocapture align 128 dereferenceable(320) %arg44, ptr noalias nocapture align 128 dereferenceable(320) %arg45, ptr noalias nocapture align 128 dereferenceable(320) %arg46, ptr noalias nocapture align 128 dereferenceable(320) %arg47, ptr noalias nocapture align 128 dereferenceable(320) %arg48, ptr noalias nocapture align 128 dereferenceable(320) %arg49, ptr noalias nocapture align 128 dereferenceable(320) %arg50, ptr noalias nocapture align 128 dereferenceable(320) %arg51, ptr noalias nocapture align 128 dereferenceable(320) %arg52, ptr noalias nocapture align 128 dereferenceable(320) %arg53, ptr noalias nocapture align 128 dereferenceable(320) %arg54, ptr noalias nocapture align 128 dereferenceable(320) %arg55, ptr noalias nocapture align 128 dereferenceable(320) %arg56) local_unnamed_addr #2 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %.urem = add nsw i32 %0, -20
  %.cmp2 = icmp ult i32 %0, 20
  %1 = select i1 %.cmp2, i32 %0, i32 %.urem
  %2 = zext i1 %.cmp to i64
  %3 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg416, i64 0, i64 %2
  %4 = load i64, ptr addrspace(1) %3, align 8, !invariant.load !278
  %5 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg722, i64 0, i64 %2
  %6 = load i64, ptr addrspace(1) %5, align 8, !invariant.load !278
  %7 = icmp sge i64 %4, %6
  %8 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg620, i64 0, i64 %2
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !278
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg518, i64 0, i64 %2
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !278
  %12 = or i8 %11, %9
  %13 = trunc i8 %12 to i1
  %.not1 = or i1 %7, %13
  %14 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg110, i64 0, i64 %2
  %15 = load i8, ptr addrspace(1) %14, align 1, !invariant.load !278
  %16 = zext nneg i32 %0 to i64
  %17 = getelementptr double, ptr addrspace(1) %arg03, i64 %16
  %18 = load double, ptr addrspace(1) %17, align 8
  %19 = getelementptr double, ptr addrspace(1) %arg212, i64 %16
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !278
  %21 = getelementptr double, ptr addrspace(1) %arg314, i64 %16
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !278
  %23 = getelementptr double, ptr addrspace(1) %arg824, i64 %16
  %24 = load double, ptr addrspace(1) %23, align 8
  %25 = getelementptr double, ptr addrspace(1) %arg926, i64 %16
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !278
  %27 = getelementptr inbounds [2 x i64], ptr addrspace(1) %arg1130, i64 0, i64 %2
  %28 = load i64, ptr addrspace(1) %27, align 8, !invariant.load !278
  %29 = zext nneg i32 %1 to i64
  %30 = getelementptr [2 x [120 x double]], ptr addrspace(1) %arg1028, i64 0, i64 %2, i64 %29
  %31 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 160
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !278
  %33 = getelementptr double, ptr addrspace(1) %arg1232, i64 %16
  %34 = load double, ptr addrspace(1) %33, align 8
  %35 = getelementptr double, ptr addrspace(1) %arg1334, i64 %16
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !278
  %37 = getelementptr double, ptr addrspace(1) %arg1436, i64 %16
  %38 = load double, ptr addrspace(1) %37, align 8
  %39 = getelementptr double, ptr addrspace(1) %arg1538, i64 %16
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !278
  %41 = getelementptr double, ptr addrspace(1) %arg1640, i64 %16
  %42 = load double, ptr addrspace(1) %41, align 8
  %43 = getelementptr double, ptr addrspace(1) %arg1742, i64 %16
  %44 = load double, ptr addrspace(1) %43, align 8, !invariant.load !278
  %45 = getelementptr double, ptr addrspace(1) %arg1844, i64 %16
  %46 = load double, ptr addrspace(1) %45, align 8
  %47 = getelementptr double, ptr addrspace(1) %arg1946, i64 %16
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !278
  %49 = getelementptr double, ptr addrspace(1) %arg2048, i64 %16
  %50 = load double, ptr addrspace(1) %49, align 8
  %51 = getelementptr double, ptr addrspace(1) %arg2150, i64 %16
  %52 = load double, ptr addrspace(1) %51, align 8
  %53 = getelementptr double, ptr addrspace(1) %arg2252, i64 %16
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !278
  %55 = getelementptr double, ptr addrspace(1) %arg2354, i64 %16
  %56 = load double, ptr addrspace(1) %55, align 8
  %57 = getelementptr double, ptr addrspace(1) %arg2456, i64 %16
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !278
  %59 = getelementptr double, ptr addrspace(1) %arg2558, i64 %16
  %60 = load double, ptr addrspace(1) %59, align 8
  %61 = getelementptr double, ptr addrspace(1) %arg2660, i64 %16
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !278
  %63 = tail call double @llvm.fma.f64(double %40, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %64 = tail call i32 @llvm.nvvm.d2i.lo(double %63) #13
  %65 = tail call double @llvm.nvvm.add.rn.d(double %63, double 0xC338000000000000) #13
  %66 = tail call double @llvm.fma.f64(double %65, double 0xBFE62E42FEFA39EF, double %40)
  %67 = tail call double @llvm.fma.f64(double %65, double 0xBC7ABC9E3B39803F, double %66)
  %68 = tail call double @llvm.fma.f64(double %67, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %69 = tail call double @llvm.fma.f64(double %68, double %67, double 0x3EC71DEE62401315)
  %70 = tail call double @llvm.fma.f64(double %69, double %67, double 0x3EFA01997C89EB71)
  %71 = tail call double @llvm.fma.f64(double %70, double %67, double 0x3F2A01A014761F65)
  %72 = tail call double @llvm.fma.f64(double %71, double %67, double 0x3F56C16C1852B7AF)
  %73 = tail call double @llvm.fma.f64(double %72, double %67, double 0x3F81111111122322)
  %74 = tail call double @llvm.fma.f64(double %73, double %67, double 0x3FA55555555502A1)
  %75 = tail call double @llvm.fma.f64(double %74, double %67, double 0x3FC5555555555511)
  %76 = tail call double @llvm.fma.f64(double %75, double %67, double 0x3FE000000000000B)
  %77 = tail call double @llvm.fma.f64(double %76, double %67, double 1.000000e+00)
  %78 = tail call double @llvm.fma.f64(double %77, double %67, double 1.000000e+00)
  %79 = tail call i32 @llvm.nvvm.d2i.lo(double %78) #13
  %80 = tail call i32 @llvm.nvvm.d2i.hi(double %78) #13
  %81 = shl i32 %64, 20
  %82 = add i32 %80, %81
  %83 = tail call double @llvm.nvvm.lohi.i2d(i32 %79, i32 %82) #13
  %84 = tail call i32 @llvm.nvvm.d2i.hi(double %40) #13
  %85 = bitcast i32 %84 to float
  %86 = tail call float @llvm.nvvm.fabs.f(float %85) #13
  %87 = fcmp olt float %86, 0x4010C46560000000
  br i1 %87, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %88 = fcmp olt double %40, 0.000000e+00
  %89 = fadd double %40, 0x7FF0000000000000
  %z.0.i = select i1 %88, double 0.000000e+00, double %89
  %90 = fcmp olt float %86, 0x4010E90000000000
  br i1 %90, label %91, label %__nv_exp.exit

91:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %92 = sdiv i32 %64, 2
  %93 = shl i32 %92, 20
  %94 = add i32 %80, %93
  %95 = tail call double @llvm.nvvm.lohi.i2d(i32 %79, i32 %94) #13
  %96 = sub nsw i32 %64, %92
  %97 = shl i32 %96, 20
  %98 = add nsw i32 %97, 1072693248
  %99 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %98) #13
  %100 = fmul double %99, %95
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %91
  %z.2.i = phi double [ %83, %entry ], [ %100, %91 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %101 = icmp eq i64 %4, 0
  %102 = sitofp i64 %28 to double
  %multiply.3000.15.clone.1 = fmul double %102, 0x3F886F8FA34E82C5
  %add.4172.32.clone.1 = fadd double %32, %32
  %multiply.3025.5.clone.1 = fmul double %multiply.3000.15.clone.1, %add.4172.32.clone.1
  %add.4191.3.clone.1 = fadd double %26, %multiply.3025.5.clone.1
  %add.4192.7.clone.1 = fadd double %add.4191.3.clone.1, -1.000000e+00
  %multiply.3046.3.clone.1 = fmul double %add.4192.7.clone.1, 4.000000e+00
  %103 = fsub double %58, %multiply.3046.3.clone.1
  %104 = trunc i8 %15 to i1
  %105 = select i1 %104, double %56, double %103
  %106 = select i1 %101, double %103, double %105
  %107 = select i1 %.not1, double %56, double %106
  %add.4206.3.clone.1 = fsub double %54, %36
  %108 = select i1 %104, double %52, double %add.4206.3.clone.1
  %109 = select i1 %101, double %add.4206.3.clone.1, double %108
  %110 = select i1 %.not1, double %52, double %109
  %111 = select i1 %104, double %50, double %22
  %112 = select i1 %101, double %22, double %111
  %113 = select i1 %.not1, double %50, double %112
  %114 = select i1 %104, double %46, double %48
  %115 = select i1 %101, double %48, double %114
  %116 = select i1 %.not1, double %46, double %115
  %117 = select i1 %104, double %42, double %44
  %118 = select i1 %101, double %44, double %117
  %119 = select i1 %.not1, double %42, double %118
  %120 = select i1 %104, double %38, double %40
  %121 = select i1 %101, double %40, double %120
  %122 = select i1 %.not1, double %38, double %121
  %123 = select i1 %104, double %34, double %36
  %124 = select i1 %101, double %36, double %123
  %125 = select i1 %.not1, double %34, double %124
  %126 = select i1 %104, double %24, double %add.4191.3.clone.1
  %127 = select i1 %101, double %add.4191.3.clone.1, double %126
  %128 = select i1 %.not1, double %24, double %127
  %add.4187.7 = fadd double %22, 6.000000e+00
  %multiply.3056.5 = fmul double %add.4187.7, 2.500000e-01
  %129 = fsub double %20, %multiply.3056.5
  %130 = select i1 %104, double %18, double %129
  %131 = select i1 %101, double %129, double %130
  %132 = select i1 %.not1, double %18, double %131
  %multiply.3049.3.clone.1 = fmul double %62, %z.2.i
  %add.4178.7.clone.1 = fadd double %40, 0xBFF62E42FEFA39EF
  %multiply.3050.3.clone.1 = fmul double %add.4178.7.clone.1, 0x3FFC71C71C71C71C
  %133 = fsub double %multiply.3049.3.clone.1, %multiply.3050.3.clone.1
  %134 = select i1 %104, double %60, double %133
  %135 = select i1 %101, double %133, double %134
  %136 = select i1 %.not1, double %60, double %135
  %137 = getelementptr double, ptr addrspace(1) %arg2762, i64 %16
  %138 = load double, ptr addrspace(1) %137, align 8
  %139 = getelementptr double, ptr addrspace(1) %arg2864, i64 %16
  %140 = load double, ptr addrspace(1) %139, align 8, !invariant.load !278
  %add.4197.4.clone.1 = fadd double %44, -1.000000e+00
  %add.4214.3.clone.1 = fsub double %140, %add.4197.4.clone.1
  %141 = select i1 %104, double %138, double %add.4214.3.clone.1
  %142 = select i1 %101, double %add.4214.3.clone.1, double %141
  %143 = select i1 %.not1, double %138, double %142
  %144 = getelementptr double, ptr addrspace(1) %arg2966, i64 %16
  %145 = load double, ptr addrspace(1) %144, align 8
  %146 = getelementptr double, ptr addrspace(1) %arg3068, i64 %16
  %147 = load double, ptr addrspace(1) %146, align 8, !invariant.load !278
  %add.4174.7.clone.1 = fadd double %48, 4.000000e+00
  %multiply.3054.5.clone.1 = fmul double %add.4174.7.clone.1, 2.500000e-01
  %148 = fsub double %147, %multiply.3054.5.clone.1
  %149 = select i1 %104, double %145, double %148
  %150 = select i1 %101, double %148, double %149
  %151 = select i1 %.not1, double %145, double %150
  %152 = getelementptr double, ptr addrspace(1) %arg3170, i64 %16
  %153 = load double, ptr addrspace(1) %152, align 8
  %154 = getelementptr double, ptr addrspace(1) %arg3272, i64 %16
  %155 = load double, ptr addrspace(1) %154, align 8
  %multiply.3002.7.clone.1 = fmul double %102, 0x3F786F8FA34E82C5
  %156 = getelementptr double, ptr addrspace(1) %arg3374, i64 %16
  %157 = load double, ptr addrspace(1) %156, align 8
  %multiply.3004.13.clone.1 = fmul double %multiply.3002.7.clone.1, %157
  %add.4166.13.clone.1 = fadd double %155, %multiply.3004.13.clone.1
  %multiply.3047.9.clone.1 = fmul double %multiply.3002.7.clone.1, %103
  %add.4211.9.clone.1 = fadd double %multiply.3047.9.clone.1, %add.4166.13.clone.1
  %add.4231.5.clone.1 = fadd double %153, %add.4211.9.clone.1
  %158 = select i1 %101, double %add.4211.9.clone.1, double %add.4231.5.clone.1
  %159 = select i1 %.not1, double %153, double %158
  %160 = getelementptr double, ptr addrspace(1) %arg3476, i64 %16
  %161 = load double, ptr addrspace(1) %160, align 8
  %162 = select i1 %101, double %103, double %161
  %163 = select i1 %.not1, double %161, double %162
  %164 = select i1 %.not1, double %157, double %103
  %165 = getelementptr double, ptr addrspace(1) %arg3578, i64 %16
  %166 = load double, ptr addrspace(1) %165, align 8
  %167 = select i1 %101, double %add.4211.9.clone.1, double %166
  %168 = select i1 %.not1, double %166, double %167
  %169 = select i1 %.not1, double %155, double %add.4211.9.clone.1
  %170 = getelementptr double, ptr addrspace(1) %arg3680, i64 %16
  %171 = load double, ptr addrspace(1) %170, align 8
  %172 = getelementptr double, ptr addrspace(1) %arg3782, i64 %16
  %173 = load double, ptr addrspace(1) %172, align 8
  %174 = getelementptr double, ptr addrspace(1) %arg3884, i64 %16
  %175 = load double, ptr addrspace(1) %174, align 8
  %multiply.3005.13.clone.1 = fmul double %multiply.3002.7.clone.1, %175
  %add.4167.13.clone.1 = fadd double %173, %multiply.3005.13.clone.1
  %multiply.3051.9.clone.1 = fmul double %multiply.3002.7.clone.1, %133
  %add.4213.9.clone.1 = fadd double %multiply.3051.9.clone.1, %add.4167.13.clone.1
  %add.4232.5.clone.1 = fadd double %171, %add.4213.9.clone.1
  %176 = select i1 %101, double %add.4213.9.clone.1, double %add.4232.5.clone.1
  %177 = select i1 %.not1, double %171, double %176
  %178 = select i1 %.not1, double %173, double %add.4213.9.clone.1
  %179 = getelementptr double, ptr addrspace(1) %arg3986, i64 %16
  %180 = load double, ptr addrspace(1) %179, align 8
  %181 = select i1 %101, double %133, double %180
  %182 = select i1 %.not1, double %180, double %181
  %183 = select i1 %.not1, double %175, double %133
  %184 = getelementptr double, ptr addrspace(1) %arg4088, i64 %16
  %185 = load double, ptr addrspace(1) %184, align 8
  %186 = select i1 %101, double %add.4213.9.clone.1, double %185
  %187 = select i1 %.not1, double %185, double %186
  %188 = getelementptr double, ptr addrspace(1) %arg4190, i64 %16
  %189 = load double, ptr addrspace(1) %188, align 8
  %190 = getelementptr double, ptr addrspace(1) %arg4292, i64 %16
  %191 = load double, ptr addrspace(1) %190, align 8
  %192 = getelementptr double, ptr addrspace(1) %arg4394, i64 %16
  %193 = load double, ptr addrspace(1) %192, align 8
  %multiply.3008.13.clone.1 = fmul double %multiply.3002.7.clone.1, %193
  %add.4171.13.clone.1 = fadd double %191, %multiply.3008.13.clone.1
  %multiply.3057.9.clone.1 = fmul double %129, %multiply.3002.7.clone.1
  %add.4221.9.clone.1 = fadd double %multiply.3057.9.clone.1, %add.4171.13.clone.1
  %add.4236.5.clone.1 = fadd double %189, %add.4221.9.clone.1
  %194 = select i1 %101, double %add.4221.9.clone.1, double %add.4236.5.clone.1
  %195 = select i1 %.not1, double %189, double %194
  %196 = select i1 %.not1, double %191, double %add.4221.9.clone.1
  %197 = getelementptr double, ptr addrspace(1) %arg4496, i64 %16
  %198 = load double, ptr addrspace(1) %197, align 8
  %199 = select i1 %101, double %129, double %198
  %200 = select i1 %.not1, double %198, double %199
  %201 = select i1 %.not1, double %193, double %129
  %202 = getelementptr double, ptr addrspace(1) %arg4598, i64 %16
  %203 = load double, ptr addrspace(1) %202, align 8
  %204 = select i1 %101, double %add.4221.9.clone.1, double %203
  %205 = select i1 %.not1, double %203, double %204
  %206 = getelementptr double, ptr addrspace(1) %arg46100, i64 %16
  %207 = load double, ptr addrspace(1) %206, align 8
  %208 = getelementptr double, ptr addrspace(1) %arg47102, i64 %16
  %209 = load double, ptr addrspace(1) %208, align 8
  %210 = getelementptr double, ptr addrspace(1) %arg48104, i64 %16
  %211 = load double, ptr addrspace(1) %210, align 8
  %multiply.3007.13.clone.1 = fmul double %multiply.3002.7.clone.1, %211
  %add.4169.13.clone.1 = fadd double %209, %multiply.3007.13.clone.1
  %multiply.3055.9.clone.1 = fmul double %multiply.3002.7.clone.1, %148
  %add.4218.9.clone.1 = fadd double %multiply.3055.9.clone.1, %add.4169.13.clone.1
  %add.4234.5.clone.1 = fadd double %207, %add.4218.9.clone.1
  %212 = select i1 %101, double %add.4218.9.clone.1, double %add.4234.5.clone.1
  %213 = select i1 %.not1, double %207, double %212
  %214 = select i1 %.not1, double %209, double %add.4218.9.clone.1
  %215 = getelementptr double, ptr addrspace(1) %arg49106, i64 %16
  %216 = load double, ptr addrspace(1) %215, align 8
  %217 = select i1 %101, double %148, double %216
  %218 = select i1 %.not1, double %216, double %217
  %219 = select i1 %.not1, double %211, double %148
  %220 = getelementptr double, ptr addrspace(1) %arg50108, i64 %16
  %221 = load double, ptr addrspace(1) %220, align 8
  %222 = select i1 %101, double %add.4218.9.clone.1, double %221
  %223 = select i1 %.not1, double %221, double %222
  %224 = getelementptr double, ptr addrspace(1) %arg51110, i64 %16
  %225 = load double, ptr addrspace(1) %224, align 8
  %226 = getelementptr double, ptr addrspace(1) %arg52112, i64 %16
  %227 = load double, ptr addrspace(1) %226, align 8
  %228 = getelementptr double, ptr addrspace(1) %arg53114, i64 %16
  %229 = load double, ptr addrspace(1) %228, align 8
  %multiply.3006.13.clone.1 = fmul double %multiply.3002.7.clone.1, %229
  %add.4168.13.clone.1 = fadd double %227, %multiply.3006.13.clone.1
  %multiply.3053.9.clone.1 = fmul double %multiply.3002.7.clone.1, %add.4214.3.clone.1
  %add.4216.9.clone.1 = fadd double %multiply.3053.9.clone.1, %add.4168.13.clone.1
  %add.4233.5.clone.1 = fadd double %225, %add.4216.9.clone.1
  %230 = select i1 %101, double %add.4216.9.clone.1, double %add.4233.5.clone.1
  %231 = select i1 %.not1, double %225, double %230
  %232 = select i1 %.not1, double %227, double %add.4216.9.clone.1
  %233 = getelementptr double, ptr addrspace(1) %arg54116, i64 %16
  %234 = load double, ptr addrspace(1) %233, align 8
  %235 = select i1 %101, double %add.4214.3.clone.1, double %234
  %236 = select i1 %.not1, double %234, double %235
  %237 = select i1 %.not1, double %229, double %add.4214.3.clone.1
  %238 = getelementptr double, ptr addrspace(1) %arg55118, i64 %16
  %239 = load double, ptr addrspace(1) %238, align 8
  %240 = select i1 %101, double %add.4216.9.clone.1, double %239
  %241 = select i1 %.not1, double %239, double %240
  %242 = getelementptr double, ptr addrspace(1) %arg56120, i64 %16
  %243 = load double, ptr addrspace(1) %242, align 8
  %244 = select i1 %101, double %add.4206.3.clone.1, double %243
  %245 = select i1 %.not1, double %243, double %244
  store double %132, ptr addrspace(1) %17, align 8
  store double %128, ptr addrspace(1) %23, align 8
  store double %125, ptr addrspace(1) %33, align 8
  store double %122, ptr addrspace(1) %37, align 8
  store double %119, ptr addrspace(1) %41, align 8
  store double %116, ptr addrspace(1) %45, align 8
  store double %113, ptr addrspace(1) %49, align 8
  store double %110, ptr addrspace(1) %51, align 8
  store double %107, ptr addrspace(1) %55, align 8
  store double %136, ptr addrspace(1) %59, align 8
  store double %143, ptr addrspace(1) %137, align 8
  store double %151, ptr addrspace(1) %144, align 8
  store double %159, ptr addrspace(1) %152, align 8
  store double %163, ptr addrspace(1) %160, align 8
  store double %164, ptr addrspace(1) %156, align 8
  store double %168, ptr addrspace(1) %165, align 8
  store double %169, ptr addrspace(1) %154, align 8
  store double %177, ptr addrspace(1) %170, align 8
  store double %178, ptr addrspace(1) %172, align 8
  store double %182, ptr addrspace(1) %179, align 8
  store double %183, ptr addrspace(1) %174, align 8
  store double %187, ptr addrspace(1) %184, align 8
  store double %195, ptr addrspace(1) %188, align 8
  store double %196, ptr addrspace(1) %190, align 8
  store double %200, ptr addrspace(1) %197, align 8
  store double %201, ptr addrspace(1) %192, align 8
  store double %205, ptr addrspace(1) %202, align 8
  store double %213, ptr addrspace(1) %206, align 8
  store double %214, ptr addrspace(1) %208, align 8
  store double %218, ptr addrspace(1) %215, align 8
  store double %219, ptr addrspace(1) %210, align 8
  store double %223, ptr addrspace(1) %220, align 8
  store double %231, ptr addrspace(1) %224, align 8
  store double %232, ptr addrspace(1) %226, align 8
  store double %236, ptr addrspace(1) %233, align 8
  store double %237, ptr addrspace(1) %228, align 8
  store double %241, ptr addrspace(1) %238, align 8
  store double %245, ptr addrspace(1) %242, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(2) %arg0, ptr noalias nocapture align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4) local_unnamed_addr #2 {
entry:
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg38, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8, !invariant.load !278
  %4 = getelementptr i64, ptr addrspace(1) %arg410, i64 %1
  %5 = load i64, ptr addrspace(1) %4, align 8, !invariant.load !278
  %6 = icmp sge i64 %3, %5
  %7 = getelementptr i8, ptr addrspace(1) %arg14, i64 %1
  %8 = load i8, ptr addrspace(1) %7, align 1
  %9 = getelementptr i8, ptr addrspace(1) %arg26, i64 %1
  %10 = load i8, ptr addrspace(1) %9, align 1, !invariant.load !278
  %11 = or i8 %10, %8
  %12 = trunc i8 %11 to i1
  %.not1 = or i1 %6, %12
  %13 = getelementptr i8, ptr addrspace(1) %arg02, i64 %1
  %14 = load i8, ptr addrspace(1) %13, align 1, !invariant.load !278
  %15 = select i1 %.not1, i8 %8, i8 %14
  store i8 %15, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @loop_subtract_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg26, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg29, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg36, ptr noalias nocapture writeonly align 128 dereferenceable(1920) %arg37) local_unnamed_addr #8 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !279
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
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
  %10 = getelementptr double, ptr addrspace(1) %arg1277, i64 %9
  %11 = zext nneg i8 %.decomposed to i64
  %12 = getelementptr inbounds double, ptr addrspace(1) %10, i64 %11
  %13 = getelementptr double, ptr addrspace(1) %arg1175, i64 %9
  %14 = getelementptr inbounds double, ptr addrspace(1) %13, i64 %11
  br label %concatenate.pivot.60.12

concatenate.pivot.40.:                            ; preds = %concatenate.pivot.20.
  %15 = icmp ult i8 %.decomposed, 40
  %16 = mul nuw nsw i32 %.zext42, 20
  %17 = zext nneg i32 %16 to i64
  br i1 %15, label %concatenate.pivot.20.1, label %concatenate.pivot.40.2

concatenate.pivot.20.1:                           ; preds = %concatenate.pivot.40.
  %18 = add nsw i32 %.zext, -20
  %19 = getelementptr double, ptr addrspace(1) %arg1073, i64 %17
  %20 = zext nneg i32 %18 to i64
  %21 = getelementptr inbounds double, ptr addrspace(1) %19, i64 %20
  %22 = getelementptr double, ptr addrspace(1) %arg971, i64 %17
  %23 = getelementptr inbounds double, ptr addrspace(1) %22, i64 %20
  br label %concatenate.pivot.60.12

concatenate.pivot.40.2:                           ; preds = %concatenate.pivot.40.
  %24 = add nsw i32 %.zext, -40
  %25 = getelementptr double, ptr addrspace(1) %arg869, i64 %17
  %26 = zext nneg i32 %24 to i64
  %27 = getelementptr inbounds double, ptr addrspace(1) %25, i64 %26
  %28 = getelementptr double, ptr addrspace(1) %arg767, i64 %17
  %29 = getelementptr inbounds double, ptr addrspace(1) %28, i64 %26
  br label %concatenate.pivot.60.12

concatenate.pivot.80.:                            ; preds = %concatenate.pivot.60.
  %30 = icmp ult i8 %.decomposed, 80
  %31 = mul nuw nsw i32 %.zext42, 20
  %32 = zext nneg i32 %31 to i64
  br i1 %30, label %concatenate.pivot.60.3, label %concatenate.pivot.100.

concatenate.pivot.60.3:                           ; preds = %concatenate.pivot.80.
  %33 = add nsw i32 %.zext, -60
  %34 = getelementptr double, ptr addrspace(1) %arg665, i64 %32
  %35 = zext nneg i32 %33 to i64
  %36 = getelementptr inbounds double, ptr addrspace(1) %34, i64 %35
  %37 = getelementptr double, ptr addrspace(1) %arg563, i64 %32
  %38 = getelementptr inbounds double, ptr addrspace(1) %37, i64 %35
  br label %concatenate.pivot.60.12

concatenate.pivot.100.:                           ; preds = %concatenate.pivot.80.
  %39 = icmp ult i8 %.decomposed, 100
  br i1 %39, label %concatenate.pivot.80.4, label %concatenate.pivot.100.5

concatenate.pivot.80.4:                           ; preds = %concatenate.pivot.100.
  %40 = add nsw i32 %.zext, -80
  %41 = getelementptr double, ptr addrspace(1) %arg461, i64 %32
  %42 = zext nneg i32 %40 to i64
  %43 = getelementptr inbounds double, ptr addrspace(1) %41, i64 %42
  %44 = getelementptr double, ptr addrspace(1) %arg359, i64 %32
  %45 = getelementptr inbounds double, ptr addrspace(1) %44, i64 %42
  br label %concatenate.pivot.60.12

concatenate.pivot.100.5:                          ; preds = %concatenate.pivot.100.
  %46 = add nsw i32 %.zext, -100
  %47 = getelementptr double, ptr addrspace(1) %arg155, i64 %32
  %48 = zext nneg i32 %46 to i64
  %49 = getelementptr inbounds double, ptr addrspace(1) %47, i64 %48
  %50 = getelementptr double, ptr addrspace(1) %arg053, i64 %32
  %51 = getelementptr inbounds double, ptr addrspace(1) %50, i64 %48
  br label %concatenate.pivot.60.12

concatenate.pivot.60.12:                          ; preds = %concatenate.pivot.0., %concatenate.pivot.20.1, %concatenate.pivot.40.2, %concatenate.pivot.60.3, %concatenate.pivot.80.4, %concatenate.pivot.100.5
  %.sink49 = phi ptr addrspace(1) [ %14, %concatenate.pivot.0. ], [ %23, %concatenate.pivot.20.1 ], [ %29, %concatenate.pivot.40.2 ], [ %38, %concatenate.pivot.60.3 ], [ %45, %concatenate.pivot.80.4 ], [ %51, %concatenate.pivot.100.5 ]
  %.sink.in = phi ptr addrspace(1) [ %12, %concatenate.pivot.0. ], [ %21, %concatenate.pivot.20.1 ], [ %27, %concatenate.pivot.40.2 ], [ %36, %concatenate.pivot.60.3 ], [ %43, %concatenate.pivot.80.4 ], [ %49, %concatenate.pivot.100.5 ]
  %52 = icmp ult i8 %.decomposed, 60
  %.sink = load double, ptr addrspace(1) %.sink.in, align 8, !invariant.load !278
  %53 = load double, ptr addrspace(1) %.sink49, align 8, !invariant.load !278
  %add.4425.3 = fadd double %.sink, %53
  br i1 %52, label %concatenate.pivot.20.13, label %concatenate.pivot.80.18

concatenate.pivot.20.13:                          ; preds = %concatenate.pivot.60.12
  %54 = icmp ult i8 %.decomposed, 20
  br i1 %54, label %concatenate.pivot.0.14, label %concatenate.pivot.40.15

concatenate.pivot.0.14:                           ; preds = %concatenate.pivot.20.13
  %55 = mul nuw nsw i32 %.zext42, 20
  %56 = zext nneg i8 %3 to i64
  %57 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg257, i64 0, i64 %56
  %58 = load i8, ptr addrspace(1) %57, align 1, !invariant.load !278
  %59 = zext nneg i32 %55 to i64
  %60 = getelementptr double, ptr addrspace(1) %arg36125, i64 %59
  %61 = zext nneg i8 %.decomposed to i64
  %62 = getelementptr inbounds double, ptr addrspace(1) %60, i64 %61
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !278
  %64 = getelementptr double, ptr addrspace(1) %arg29111, i64 %59
  %65 = getelementptr inbounds double, ptr addrspace(1) %64, i64 %61
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !278
  %67 = trunc i8 %58 to i1
  %68 = select i1 %67, double %63, double %66
  br label %concatenate.pivot.60.29

concatenate.pivot.40.15:                          ; preds = %concatenate.pivot.20.13
  %69 = icmp ult i8 %.decomposed, 40
  %70 = mul nuw nsw i32 %.zext42, 20
  %71 = zext nneg i8 %3 to i64
  %72 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg257, i64 0, i64 %71
  %73 = load i8, ptr addrspace(1) %72, align 1, !invariant.load !278
  %74 = zext nneg i32 %70 to i64
  %75 = trunc i8 %73 to i1
  br i1 %69, label %concatenate.pivot.20.16, label %concatenate.pivot.40.17

concatenate.pivot.20.16:                          ; preds = %concatenate.pivot.40.15
  %76 = add nsw i32 %.zext, -20
  %77 = getelementptr double, ptr addrspace(1) %arg35123, i64 %74
  %78 = zext nneg i32 %76 to i64
  %79 = getelementptr inbounds double, ptr addrspace(1) %77, i64 %78
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !278
  %81 = getelementptr double, ptr addrspace(1) %arg26105, i64 %74
  %82 = getelementptr inbounds double, ptr addrspace(1) %81, i64 %78
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !278
  %84 = select i1 %75, double %80, double %83
  br label %concatenate.pivot.60.29

concatenate.pivot.40.17:                          ; preds = %concatenate.pivot.40.15
  %85 = add nsw i32 %.zext, -40
  %86 = getelementptr double, ptr addrspace(1) %arg34121, i64 %74
  %87 = zext nneg i32 %85 to i64
  %88 = getelementptr inbounds double, ptr addrspace(1) %86, i64 %87
  %89 = load double, ptr addrspace(1) %88, align 8, !invariant.load !278
  %90 = getelementptr double, ptr addrspace(1) %arg2399, i64 %74
  %91 = getelementptr inbounds double, ptr addrspace(1) %90, i64 %87
  %92 = load double, ptr addrspace(1) %91, align 8, !invariant.load !278
  %93 = select i1 %75, double %89, double %92
  br label %concatenate.pivot.60.29

concatenate.pivot.80.18:                          ; preds = %concatenate.pivot.60.12
  %94 = icmp ult i8 %.decomposed, 80
  %95 = mul nuw nsw i32 %.zext42, 20
  %96 = zext nneg i8 %3 to i64
  %97 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg257, i64 0, i64 %96
  %98 = load i8, ptr addrspace(1) %97, align 1, !invariant.load !278
  %99 = zext nneg i32 %95 to i64
  br i1 %94, label %concatenate.pivot.60.19, label %concatenate.pivot.100.20

concatenate.pivot.60.19:                          ; preds = %concatenate.pivot.80.18
  %100 = add nsw i32 %.zext, -60
  %101 = getelementptr double, ptr addrspace(1) %arg33119, i64 %99
  %102 = zext nneg i32 %100 to i64
  %103 = getelementptr inbounds double, ptr addrspace(1) %101, i64 %102
  %104 = load double, ptr addrspace(1) %103, align 8, !invariant.load !278
  %105 = getelementptr double, ptr addrspace(1) %arg2093, i64 %99
  %106 = getelementptr inbounds double, ptr addrspace(1) %105, i64 %102
  %107 = load double, ptr addrspace(1) %106, align 8, !invariant.load !278
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
  %116 = load double, ptr addrspace(1) %115, align 8, !invariant.load !278
  %117 = getelementptr double, ptr addrspace(1) %arg1787, i64 %99
  %118 = getelementptr inbounds double, ptr addrspace(1) %117, i64 %114
  %119 = load double, ptr addrspace(1) %118, align 8, !invariant.load !278
  %120 = select i1 %111, double %116, double %119
  br label %concatenate.pivot.60.29

concatenate.pivot.100.22:                         ; preds = %concatenate.pivot.100.20
  %121 = add nsw i32 %.zext, -100
  %122 = getelementptr double, ptr addrspace(1) %arg31115, i64 %99
  %123 = zext nneg i32 %121 to i64
  %124 = getelementptr inbounds double, ptr addrspace(1) %122, i64 %123
  %125 = load double, ptr addrspace(1) %124, align 8, !invariant.load !278
  %126 = getelementptr double, ptr addrspace(1) %arg1481, i64 %99
  %127 = getelementptr inbounds double, ptr addrspace(1) %126, i64 %123
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !278
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
  %.sink50 = load double, ptr addrspace(1) %.sink50.in, align 8, !invariant.load !278
  %177 = load double, ptr addrspace(1) %.sink52, align 8, !invariant.load !278
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
define void @input_reduce_fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(1920) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg27) local_unnamed_addr #4 {
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
  %arg17474 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16472 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg14468 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13466 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg11462 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10460 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg8456 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7454 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg5450 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4448 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3446 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg1442 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0440 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !281
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %param_4.2279162 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg4448, i64 0, i64 %1
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
  %49 = trunc i8 %param_4.2279145.1350 to i1
  br i1 %48, label %concatenate.pivot.80.179.1349, label %concatenate.pivot.100.180.1343

concatenate.pivot.100.180.1343:                   ; preds = %concatenate.pivot.100.178.1337
  %50 = sext i32 %46 to i64
  %51 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg1442, i64 0, i64 %1, i64 %50
  %param_1.5728164.1339496 = getelementptr inbounds i8, ptr addrspace(1) %51, i64 -800
  %param_1.5728165.1340 = load double, ptr addrspace(1) %param_1.5728164.1339496, align 16, !invariant.load !278
  %52 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3446, i64 0, i64 %1, i64 %50
  %param_3.3296168.1341497 = getelementptr inbounds i8, ptr addrspace(1) %52, i64 -800
  %param_3.3296169.1342 = load double, ptr addrspace(1) %param_3.3296168.1341497, align 16, !invariant.load !278
  %53 = select i1 %49, double %param_1.5728165.1340, double %param_3.3296169.1342
  br label %concatenate.46.3.merge115.1380

concatenate.pivot.80.179.1349:                    ; preds = %concatenate.pivot.100.178.1337
  %54 = add nsw i32 %46, -80
  %55 = zext nneg i32 %54 to i64
  %param_5.1903155.1345 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg5450, i64 0, i64 %1, i64 %55
  %param_5.1903156.1346 = load double, ptr addrspace(1) %param_5.1903155.1345, align 16, !invariant.load !278
  %param_7.1320159.1347 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7454, i64 0, i64 %1, i64 %55
  %param_7.1320160.1348 = load double, ptr addrspace(1) %param_7.1320159.1347, align 16, !invariant.load !278
  %56 = select i1 %49, double %param_5.1903156.1346, double %param_7.1320160.1348
  br label %concatenate.46.3.merge115.1380

concatenate.pivot.60.177.1355:                    ; preds = %loop3.loop_header110.preheader.1
  %57 = add nsw i32 %46, -60
  %58 = zext nneg i32 %57 to i64
  %param_8.1115146.1351 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8456, i64 0, i64 %1, i64 %58
  %param_8.1115147.1352 = load double, ptr addrspace(1) %param_8.1115146.1351, align 16, !invariant.load !278
  %param_10.794150.1353 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10460, i64 0, i64 %1, i64 %58
  %param_10.794151.1354 = load double, ptr addrspace(1) %param_10.794150.1353, align 16, !invariant.load !278
  %59 = trunc i8 %param_4.2279145.1350 to i1
  %60 = select i1 %59, double %param_8.1115147.1352, double %param_10.794151.1354
  br label %concatenate.46.3.merge115.1380

concatenate.46.3.merge115.1380:                   ; preds = %concatenate.pivot.60.177.1355, %concatenate.pivot.80.179.1349, %concatenate.pivot.100.180.1343
  %param_4.2279188.1.1.off0 = phi i1 [ %59, %concatenate.pivot.60.177.1355 ], [ %49, %concatenate.pivot.80.179.1349 ], [ %49, %concatenate.pivot.100.180.1343 ]
  %61 = phi double [ %60, %concatenate.pivot.60.177.1355 ], [ %56, %concatenate.pivot.80.179.1349 ], [ %53, %concatenate.pivot.100.180.1343 ]
  %62 = icmp ult i32 %184, 40
  %63 = zext nneg i32 %46 to i64
  %param_0.4159181.1376 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg0440, i64 0, i64 %1, i64 %63
  %param_0.4159182.1377 = load double, ptr addrspace(1) %param_0.4159181.1376, align 16, !invariant.load !278
  %multiply.3069.1183.1378 = fmul double %61, %param_0.4159182.1377
  %add.3969.i324.1379 = fadd double %add.3969.i324.1, %multiply.3069.1183.1378
  br i1 %62, label %concatenate.pivot.60.247.1400, label %concatenate.pivot.100.248.1382

concatenate.pivot.100.248.1382:                   ; preds = %concatenate.46.3.merge115.1380
  %64 = icmp ult i32 %184, 50
  br i1 %64, label %concatenate.pivot.80.249.1394, label %concatenate.pivot.100.250.1388

concatenate.pivot.100.250.1388:                   ; preds = %concatenate.pivot.100.248.1382
  %65 = sext i32 %46 to i64
  %66 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3446, i64 0, i64 %1, i64 %65
  %param_3.3296234.1384498 = getelementptr inbounds i8, ptr addrspace(1) %66, i64 -800
  %67 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg20480, i64 0, i64 %1, i64 %65
  %param_20.1146238.1386499 = getelementptr inbounds i8, ptr addrspace(1) %67, i64 -800
  br label %concatenate.44.5.clone.1.merge185.1423

concatenate.pivot.80.249.1394:                    ; preds = %concatenate.pivot.100.248.1382
  %68 = add nsw i32 %46, -80
  %69 = zext nneg i32 %68 to i64
  %param_7.1320225.1390 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7454, i64 0, i64 %1, i64 %69
  %param_21.1001229.1392 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg21482, i64 0, i64 %1, i64 %69
  br label %concatenate.44.5.clone.1.merge185.1423

concatenate.pivot.60.247.1400:                    ; preds = %concatenate.46.3.merge115.1380
  %70 = add nsw i32 %46, -60
  %71 = zext nneg i32 %70 to i64
  %param_10.794216.1396 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10460, i64 0, i64 %1, i64 %71
  %param_22.896220.1398 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg22484, i64 0, i64 %1, i64 %71
  br label %concatenate.44.5.clone.1.merge185.1423

concatenate.44.5.clone.1.merge185.1423:           ; preds = %concatenate.pivot.60.247.1400, %concatenate.pivot.80.249.1394, %concatenate.pivot.100.250.1388
  %param_22.896220.1398.sink = phi ptr addrspace(1) [ %param_22.896220.1398, %concatenate.pivot.60.247.1400 ], [ %param_21.1001229.1392, %concatenate.pivot.80.249.1394 ], [ %param_20.1146238.1386499, %concatenate.pivot.100.250.1388 ]
  %param_10.794217.1397.sink.in = phi ptr addrspace(1) [ %param_10.794216.1396, %concatenate.pivot.60.247.1400 ], [ %param_7.1320225.1390, %concatenate.pivot.80.249.1394 ], [ %param_3.3296234.1384498, %concatenate.pivot.100.250.1388 ]
  %72 = icmp ult i32 %184, 40
  %param_10.794217.1397.sink = load double, ptr addrspace(1) %param_10.794217.1397.sink.in, align 8, !invariant.load !278
  %param_22.896221.1399 = load double, ptr addrspace(1) %param_22.896220.1398.sink, align 8, !invariant.load !278
  %73 = select i1 %param_4.2279188.1.1.off0, double %param_10.794217.1397.sink, double %param_22.896221.1399
  %multiply.3068.1.clone.1253.1421 = fmul double %param_0.4159182.1377, %73
  %add.3969.i325.1422 = fadd double %add.3969.i325.1, %multiply.3068.1.clone.1253.1421
  br i1 %72, label %concatenate.pivot.60.177.1.1, label %concatenate.pivot.100.178.1.1

concatenate.pivot.100.178.1.1:                    ; preds = %concatenate.44.5.clone.1.merge185.1423
  %74 = icmp ult i32 %184, 50
  br i1 %74, label %concatenate.pivot.80.179.1.1, label %concatenate.pivot.100.180.1.1

concatenate.pivot.100.180.1.1:                    ; preds = %concatenate.pivot.100.178.1.1
  %75 = sext i32 %46 to i64
  %76 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg1442, i64 0, i64 %1, i64 %75
  %param_1.5728164.1.1500 = getelementptr inbounds i8, ptr addrspace(1) %76, i64 -792
  %77 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3446, i64 0, i64 %1, i64 %75
  %param_3.3296168.1.1501 = getelementptr inbounds i8, ptr addrspace(1) %77, i64 -792
  br label %concatenate.46.3.merge115.1.1

concatenate.pivot.80.179.1.1:                     ; preds = %concatenate.pivot.100.178.1.1
  %78 = add nsw i32 %46, -79
  %79 = zext nneg i32 %78 to i64
  %param_5.1903155.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg5450, i64 0, i64 %1, i64 %79
  %param_7.1320159.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7454, i64 0, i64 %1, i64 %79
  br label %concatenate.46.3.merge115.1.1

concatenate.pivot.60.177.1.1:                     ; preds = %concatenate.44.5.clone.1.merge185.1423
  %80 = add nsw i32 %46, -59
  %81 = zext nneg i32 %80 to i64
  %param_8.1115146.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8456, i64 0, i64 %1, i64 %81
  %param_10.794150.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10460, i64 0, i64 %1, i64 %81
  br label %concatenate.46.3.merge115.1.1

concatenate.46.3.merge115.1.1:                    ; preds = %concatenate.pivot.60.177.1.1, %concatenate.pivot.80.179.1.1, %concatenate.pivot.100.180.1.1
  %param_10.794150.1.1.sink = phi ptr addrspace(1) [ %param_10.794150.1.1, %concatenate.pivot.60.177.1.1 ], [ %param_7.1320159.1.1, %concatenate.pivot.80.179.1.1 ], [ %param_3.3296168.1.1501, %concatenate.pivot.100.180.1.1 ]
  %param_8.1115147.1.1.sink.in = phi ptr addrspace(1) [ %param_8.1115146.1.1, %concatenate.pivot.60.177.1.1 ], [ %param_5.1903155.1.1, %concatenate.pivot.80.179.1.1 ], [ %param_1.5728164.1.1500, %concatenate.pivot.100.180.1.1 ]
  %82 = icmp ult i32 %184, 40
  %param_8.1115147.1.1.sink = load double, ptr addrspace(1) %param_8.1115147.1.1.sink.in, align 8, !invariant.load !278
  %param_10.794151.1.1 = load double, ptr addrspace(1) %param_10.794150.1.1.sink, align 8, !invariant.load !278
  %83 = select i1 %param_4.2279188.1.1.off0, double %param_8.1115147.1.1.sink, double %param_10.794151.1.1
  %param_0.4159181.1.1502 = getelementptr inbounds i8, ptr addrspace(1) %param_0.4159181.1376, i64 8
  %param_0.4159182.1.1 = load double, ptr addrspace(1) %param_0.4159181.1.1502, align 8, !invariant.load !278
  %multiply.3069.1183.1.1 = fmul double %83, %param_0.4159182.1.1
  %add.3969.i324.1.1 = fadd double %add.3969.i324.1379, %multiply.3069.1183.1.1
  br i1 %82, label %concatenate.pivot.60.247.1.1, label %concatenate.pivot.100.248.1.1

concatenate.pivot.100.248.1.1:                    ; preds = %concatenate.46.3.merge115.1.1
  %84 = icmp ult i32 %184, 50
  br i1 %84, label %concatenate.pivot.80.249.1.1, label %concatenate.pivot.100.250.1.1

concatenate.pivot.100.250.1.1:                    ; preds = %concatenate.pivot.100.248.1.1
  %85 = sext i32 %46 to i64
  %86 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg3446, i64 0, i64 %1, i64 %85
  %param_3.3296234.1.1503 = getelementptr inbounds i8, ptr addrspace(1) %86, i64 -792
  %87 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg20480, i64 0, i64 %1, i64 %85
  %param_20.1146238.1.1504 = getelementptr inbounds i8, ptr addrspace(1) %87, i64 -792
  br label %concatenate.44.5.clone.1.merge185.1.1

concatenate.pivot.80.249.1.1:                     ; preds = %concatenate.pivot.100.248.1.1
  %88 = add nsw i32 %46, -79
  %89 = zext nneg i32 %88 to i64
  %param_7.1320225.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg7454, i64 0, i64 %1, i64 %89
  %param_21.1001229.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg21482, i64 0, i64 %1, i64 %89
  br label %concatenate.44.5.clone.1.merge185.1.1

concatenate.pivot.60.247.1.1:                     ; preds = %concatenate.46.3.merge115.1.1
  %90 = add nsw i32 %46, -59
  %91 = zext nneg i32 %90 to i64
  %param_10.794216.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10460, i64 0, i64 %1, i64 %91
  %param_22.896220.1.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg22484, i64 0, i64 %1, i64 %91
  br label %concatenate.44.5.clone.1.merge185.1.1

concatenate.44.5.clone.1.merge185.1.1:            ; preds = %concatenate.pivot.60.247.1.1, %concatenate.pivot.80.249.1.1, %concatenate.pivot.100.250.1.1
  %param_22.896220.1.1.sink = phi ptr addrspace(1) [ %param_22.896220.1.1, %concatenate.pivot.60.247.1.1 ], [ %param_21.1001229.1.1, %concatenate.pivot.80.249.1.1 ], [ %param_20.1146238.1.1504, %concatenate.pivot.100.250.1.1 ]
  %param_10.794217.1.1.sink.in = phi ptr addrspace(1) [ %param_10.794216.1.1, %concatenate.pivot.60.247.1.1 ], [ %param_7.1320225.1.1, %concatenate.pivot.80.249.1.1 ], [ %param_3.3296234.1.1503, %concatenate.pivot.100.250.1.1 ]
  %param_10.794217.1.1.sink = load double, ptr addrspace(1) %param_10.794217.1.1.sink.in, align 8, !invariant.load !278
  %param_22.896221.1.1 = load double, ptr addrspace(1) %param_22.896220.1.1.sink, align 8, !invariant.load !278
  %92 = select i1 %param_4.2279188.1.1.off0, double %param_10.794217.1.1.sink, double %param_22.896221.1.1
  %multiply.3068.1.clone.1253.1.1 = fmul double %param_0.4159182.1.1, %92
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
  %param_4.2279118 = load i8, ptr addrspace(1) %param_4.2279162, align 1, !invariant.load !278
  %136 = zext nneg i32 %2 to i64
  %param_17.537119 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg17474, i64 0, i64 %1, i64 %136
  %param_17.537120 = load double, ptr addrspace(1) %param_17.537119, align 16, !invariant.load !278
  %param_19.583123 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg19478, i64 0, i64 %1, i64 %136
  %param_19.583124 = load double, ptr addrspace(1) %param_19.583123, align 16, !invariant.load !278
  %137 = trunc i8 %param_4.2279118 to i1
  %138 = select i1 %137, double %param_17.537120, double %param_19.583124
  br label %concatenate.46.3.merge115

concatenate.pivot.40.173:                         ; preds = %concatenate.pivot.20.171
  %139 = icmp ult i32 %thread.id.2, 20
  %param_4.2279127 = load i8, ptr addrspace(1) %param_4.2279162, align 1, !invariant.load !278
  %140 = trunc i8 %param_4.2279127 to i1
  br i1 %139, label %concatenate.pivot.20.174, label %concatenate.pivot.40.175

concatenate.pivot.20.174:                         ; preds = %concatenate.pivot.40.173
  %141 = add nsw i32 %2, -20
  %142 = zext nneg i32 %141 to i64
  %param_14.465128 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg14468, i64 0, i64 %1, i64 %142
  %param_14.465129 = load double, ptr addrspace(1) %param_14.465128, align 16, !invariant.load !278
  %param_16.501132 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg16472, i64 0, i64 %1, i64 %142
  %param_16.501133 = load double, ptr addrspace(1) %param_16.501132, align 16, !invariant.load !278
  %143 = select i1 %140, double %param_14.465129, double %param_16.501133
  br label %concatenate.46.3.merge115

concatenate.pivot.40.175:                         ; preds = %concatenate.pivot.40.173
  %144 = add nsw i32 %2, -40
  %145 = zext nneg i32 %144 to i64
  %param_11.626137 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg11462, i64 0, i64 %1, i64 %145
  %param_11.626138 = load double, ptr addrspace(1) %param_11.626137, align 16, !invariant.load !278
  %param_13.509141 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg13466, i64 0, i64 %1, i64 %145
  %param_13.509142 = load double, ptr addrspace(1) %param_13.509141, align 16, !invariant.load !278
  %146 = select i1 %140, double %param_11.626138, double %param_13.509142
  br label %concatenate.46.3.merge115

concatenate.pivot.60.177:                         ; preds = %entry
  %147 = add nsw i32 %2, -60
  %param_4.2279145 = load i8, ptr addrspace(1) %param_4.2279162, align 1, !invariant.load !278
  %148 = zext nneg i32 %147 to i64
  %param_8.1115146 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg8456, i64 0, i64 %1, i64 %148
  %param_8.1115147 = load double, ptr addrspace(1) %param_8.1115146, align 16, !invariant.load !278
  %param_10.794150 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10460, i64 0, i64 %1, i64 %148
  %param_10.794151 = load double, ptr addrspace(1) %param_10.794150, align 16, !invariant.load !278
  %149 = trunc i8 %param_4.2279145 to i1
  %150 = select i1 %149, double %param_8.1115147, double %param_10.794151
  br label %concatenate.46.3.merge115

concatenate.46.3.merge115:                        ; preds = %concatenate.pivot.60.177, %concatenate.pivot.40.175, %concatenate.pivot.20.174, %concatenate.pivot.0.172
  %param_4.2279145.1350 = phi i8 [ %param_4.2279118, %concatenate.pivot.0.172 ], [ %param_4.2279127, %concatenate.pivot.20.174 ], [ %param_4.2279127, %concatenate.pivot.40.175 ], [ %param_4.2279145, %concatenate.pivot.60.177 ]
  %param_4.2279188.1.off0 = phi i1 [ %137, %concatenate.pivot.0.172 ], [ %140, %concatenate.pivot.20.174 ], [ %140, %concatenate.pivot.40.175 ], [ %149, %concatenate.pivot.60.177 ]
  %151 = phi double [ %138, %concatenate.pivot.0.172 ], [ %143, %concatenate.pivot.20.174 ], [ %146, %concatenate.pivot.40.175 ], [ %150, %concatenate.pivot.60.177 ]
  %152 = icmp ult i32 %thread.id.2, 30
  %153 = zext nneg i32 %2 to i64
  %param_0.4159181 = getelementptr inbounds [2 x [120 x double]], ptr addrspace(1) %arg0440, i64 0, i64 %1, i64 %153
  %param_0.4159182 = load double, ptr addrspace(1) %param_0.4159181, align 16, !invariant.load !278
  %multiply.3069.1183 = fmul double %151, %param_0.4159182
  %add.3969.i324 = fadd double %multiply.3069.1183, 0.000000e+00
  br i1 %152, label %concatenate.pivot.20.241, label %concatenate.pivot.60.247

concatenate.pivot.20.241:                         ; preds = %concatenate.46.3.merge115
  %154 = icmp ult i32 %thread.id.2, 10
  br i1 %154, label %concatenate.pivot.0.242, label %concatenate.pivot.40.243

concatenate.pivot.0.242:                          ; preds = %concatenate.pivot.20.241
  %param_19.583189 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg19478, i64 0, i64 %1, i64 %153
  %param_25.633193 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg25490, i64 0, i64 %1, i64 %153
  br label %concatenate.44.5.clone.1.merge185

concatenate.pivot.40.243:                         ; preds = %concatenate.pivot.20.241
  %155 = icmp ult i32 %thread.id.2, 20
  br i1 %155, label %concatenate.pivot.20.244, label %concatenate.pivot.40.245

concatenate.pivot.20.244:                         ; preds = %concatenate.pivot.40.243
  %156 = add nsw i32 %2, -20
  %157 = zext nneg i32 %156 to i64
  %param_16.501198 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg16472, i64 0, i64 %1, i64 %157
  %param_24.777202 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg24488, i64 0, i64 %1, i64 %157
  br label %concatenate.44.5.clone.1.merge185

concatenate.pivot.40.245:                         ; preds = %concatenate.pivot.40.243
  %158 = add nsw i32 %2, -40
  %159 = zext nneg i32 %158 to i64
  %param_13.509207 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg13466, i64 0, i64 %1, i64 %159
  %param_23.877211 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg23486, i64 0, i64 %1, i64 %159
  br label %concatenate.44.5.clone.1.merge185

concatenate.pivot.60.247:                         ; preds = %concatenate.46.3.merge115
  %160 = add nsw i32 %2, -60
  %161 = zext nneg i32 %160 to i64
  %param_10.794216 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10460, i64 0, i64 %1, i64 %161
  %param_22.896220 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg22484, i64 0, i64 %1, i64 %161
  br label %concatenate.44.5.clone.1.merge185

concatenate.44.5.clone.1.merge185:                ; preds = %concatenate.pivot.60.247, %concatenate.pivot.40.245, %concatenate.pivot.20.244, %concatenate.pivot.0.242
  %param_22.896220.sink = phi ptr addrspace(1) [ %param_22.896220, %concatenate.pivot.60.247 ], [ %param_23.877211, %concatenate.pivot.40.245 ], [ %param_24.777202, %concatenate.pivot.20.244 ], [ %param_25.633193, %concatenate.pivot.0.242 ]
  %param_10.794217.sink.in = phi ptr addrspace(1) [ %param_10.794216, %concatenate.pivot.60.247 ], [ %param_13.509207, %concatenate.pivot.40.245 ], [ %param_16.501198, %concatenate.pivot.20.244 ], [ %param_19.583189, %concatenate.pivot.0.242 ]
  %162 = icmp ult i32 %thread.id.2, 30
  %param_10.794217.sink = load double, ptr addrspace(1) %param_10.794217.sink.in, align 8, !invariant.load !278
  %param_22.896221 = load double, ptr addrspace(1) %param_22.896220.sink, align 8, !invariant.load !278
  %163 = select i1 %param_4.2279188.1.off0, double %param_10.794217.sink, double %param_22.896221
  %multiply.3068.1.clone.1253 = fmul double %param_0.4159182, %163
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
  %arg17.sink = phi ptr addrspace(1) [ %arg14468, %concatenate.pivot.20.174.1 ], [ %arg11462, %concatenate.pivot.40.175.1 ], [ %arg8456, %concatenate.pivot.60.177.1 ], [ %arg17474, %concatenate.pivot.20.171.1 ]
  %arg19.sink = phi ptr addrspace(1) [ %arg16472, %concatenate.pivot.20.174.1 ], [ %arg13466, %concatenate.pivot.40.175.1 ], [ %arg10460, %concatenate.pivot.60.177.1 ], [ %arg19478, %concatenate.pivot.20.171.1 ]
  %170 = icmp ult i32 %thread.id.2, 30
  %171 = zext nneg i32 %.sink439 to i64
  %param_17.537119.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg17.sink, i64 0, i64 %1, i64 %171
  %param_17.537120.1 = load double, ptr addrspace(1) %param_17.537119.1, align 8, !invariant.load !278
  %param_19.583123.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg19.sink, i64 0, i64 %1, i64 %171
  %param_19.583124.1 = load double, ptr addrspace(1) %param_19.583123.1, align 8, !invariant.load !278
  %172 = select i1 %param_4.2279188.1.off0, double %param_17.537120.1, double %param_19.583124.1
  %param_0.4159181.1505 = getelementptr inbounds i8, ptr addrspace(1) %param_0.4159181, i64 8
  %param_0.4159182.1 = load double, ptr addrspace(1) %param_0.4159181.1505, align 8, !invariant.load !278
  %multiply.3069.1183.1 = fmul double %172, %param_0.4159182.1
  %add.3969.i324.1 = fadd double %add.3969.i324, %multiply.3069.1183.1
  br i1 %170, label %concatenate.pivot.20.241.1, label %concatenate.pivot.60.247.1

concatenate.pivot.60.247.1:                       ; preds = %concatenate.46.3.merge115.1
  %173 = add nsw i32 %2, -59
  %174 = zext nneg i32 %173 to i64
  %param_10.794216.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg10460, i64 0, i64 %1, i64 %174
  %param_22.896220.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg22484, i64 0, i64 %1, i64 %174
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
  %param_13.509207.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg13466, i64 0, i64 %1, i64 %178
  %param_23.877211.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg23486, i64 0, i64 %1, i64 %178
  br label %concatenate.44.5.clone.1.merge185.1

concatenate.pivot.20.244.1:                       ; preds = %concatenate.pivot.40.243.1
  %179 = add nsw i32 %2, -19
  %180 = zext nneg i32 %179 to i64
  %param_16.501198.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg16472, i64 0, i64 %1, i64 %180
  %param_24.777202.1 = getelementptr inbounds [2 x [20 x double]], ptr addrspace(1) %arg24488, i64 0, i64 %1, i64 %180
  br label %concatenate.44.5.clone.1.merge185.1

concatenate.pivot.0.242.1:                        ; preds = %concatenate.pivot.20.241.1
  %181 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg19478, i64 0, i64 %1, i64 %153
  %param_19.583189.1506 = getelementptr inbounds i8, ptr addrspace(1) %181, i64 8
  %182 = getelementptr [2 x [20 x double]], ptr addrspace(1) %arg25490, i64 0, i64 %1, i64 %153
  %param_25.633193.1507 = getelementptr inbounds i8, ptr addrspace(1) %182, i64 8
  br label %concatenate.44.5.clone.1.merge185.1

concatenate.44.5.clone.1.merge185.1:              ; preds = %concatenate.pivot.0.242.1, %concatenate.pivot.20.244.1, %concatenate.pivot.40.245.1, %concatenate.pivot.60.247.1
  %param_25.633193.1.sink = phi ptr addrspace(1) [ %param_25.633193.1507, %concatenate.pivot.0.242.1 ], [ %param_24.777202.1, %concatenate.pivot.20.244.1 ], [ %param_23.877211.1, %concatenate.pivot.40.245.1 ], [ %param_22.896220.1, %concatenate.pivot.60.247.1 ]
  %param_19.583190.1.sink.in = phi ptr addrspace(1) [ %param_19.583189.1506, %concatenate.pivot.0.242.1 ], [ %param_16.501198.1, %concatenate.pivot.20.244.1 ], [ %param_13.509207.1, %concatenate.pivot.40.245.1 ], [ %param_10.794216.1, %concatenate.pivot.60.247.1 ]
  %param_19.583190.1.sink = load double, ptr addrspace(1) %param_19.583190.1.sink.in, align 8, !invariant.load !278
  %param_25.633194.1 = load double, ptr addrspace(1) %param_25.633193.1.sink, align 8, !invariant.load !278
  %183 = select i1 %param_4.2279188.1.off0, double %param_19.583190.1.sink, double %param_25.633194.1
  %multiply.3068.1.clone.1253.1 = fmul double %param_0.4159182.1, %183
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg20105, i64 %1
  %3 = load i64, ptr addrspace(1) %2, align 8
  %4 = getelementptr i8, ptr addrspace(1) %arg1187, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1
  %6 = getelementptr i8, ptr addrspace(1) %arg065, i64 %1
  %7 = load i8, ptr addrspace(1) %6, align 1
  %8 = getelementptr i8, ptr addrspace(1) %arg167, i64 %1
  %9 = load i8, ptr addrspace(1) %8, align 1, !invariant.load !278
  %10 = getelementptr double, ptr addrspace(1) %arg371, i64 %1
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !278
  %12 = getelementptr double, ptr addrspace(1) %arg269, i64 %1
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !278
  %14 = getelementptr i8, ptr addrspace(1) %arg677, i64 %1
  %15 = load i8, ptr addrspace(1) %14, align 1, !invariant.load !278
  %16 = getelementptr [2 x [6 x i32]], ptr addrspace(1) %arg1289, i64 0, i64 %1, i64 0
  %17 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 16
  %18 = load <2 x i32>, ptr addrspace(1) %17, align 8, !invariant.load !278
  %19 = extractelement <2 x i32> %18, i32 0
  %20 = extractelement <2 x i32> %18, i32 1
  %21 = getelementptr double, ptr addrspace(1) %arg1085, i64 %1
  %22 = load double, ptr addrspace(1) %21, align 8, !invariant.load !278
  %23 = getelementptr double, ptr addrspace(1) %arg983, i64 %1
  %24 = load double, ptr addrspace(1) %23, align 8
  %subtract.236.1.clone.1 = fsub double %22, %24
  %25 = tail call double @llvm.fma.f64(double %subtract.236.1.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #13
  %27 = tail call double @llvm.nvvm.add.rn.d(double %25, double 0xC338000000000000) #13
  %28 = tail call double @llvm.fma.f64(double %27, double 0xBFE62E42FEFA39EF, double %subtract.236.1.clone.1)
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
  %46 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.236.1.clone.1) #13
  %47 = bitcast i32 %46 to float
  %48 = tail call float @llvm.nvvm.fabs.f(float %47) #13
  %49 = fcmp olt float %48, 0x4010C46560000000
  br i1 %49, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %50 = fcmp olt double %subtract.236.1.clone.1, 0.000000e+00
  %51 = fadd double %subtract.236.1.clone.1, 0x7FF0000000000000
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
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !278
  %67 = getelementptr double, ptr addrspace(1) %arg779, i64 %1
  %68 = load double, ptr addrspace(1) %67, align 8
  %69 = getelementptr double, ptr addrspace(1) %arg881, i64 %1
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !278
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
  %196 = load i8, ptr addrspace(1) %195, align 1, !invariant.load !278
  %197 = getelementptr i64, ptr addrspace(1) %arg1595, i64 %1
  %198 = load i64, ptr addrspace(1) %197, align 8, !invariant.load !278
  %199 = getelementptr i64, ptr addrspace(1) %arg1391, i64 %1
  %200 = load i64, ptr addrspace(1) %199, align 8
  %201 = getelementptr double, ptr addrspace(1) %arg1697, i64 %1
  %202 = load double, ptr addrspace(1) %201, align 8
  %203 = getelementptr double, ptr addrspace(1) %arg18101, i64 %1
  %204 = load double, ptr addrspace(1) %203, align 8, !invariant.load !278
  %205 = getelementptr double, ptr addrspace(1) %arg19103, i64 %1
  %206 = load double, ptr addrspace(1) %205, align 8
  %207 = getelementptr double, ptr addrspace(1) %arg21107, i64 %1
  %208 = load double, ptr addrspace(1) %207, align 8
  %209 = getelementptr double, ptr addrspace(1) %arg22109, i64 %1
  %210 = load double, ptr addrspace(1) %209, align 8, !invariant.load !278
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
  %add.4421.1.clone.1 = fadd double %22, %24
  %356 = fcmp uno double %24, 0.000000e+00
  %357 = fcmp oge double %24, %22
  %358 = or i1 %356, %357
  %maximum.47.1.clone.1 = select i1 %358, double %24, double %22
  %add.4422.1.clone.1 = fadd double %maximum.47.1.clone.1, %t.0.i
  %359 = select i1 %compare.1182.1.clone.1, double %add.4421.1.clone.1, double %add.4422.1.clone.1
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
  %add.4420.9.clone.1 = fadd double %445, -1.000000e+00
  %446 = fcmp ole double %add.4420.9.clone.1, 0.000000e+00
  %maximum.46.7.clone.1 = select i1 %446, double 0.000000e+00, double %add.4420.9.clone.1
  %447 = fcmp oge double %z.2.i, 1.000000e+00
  %minimum.10.1.clone.1 = select i1 %447, double 1.000000e+00, double %z.2.i
  %compare.1180.5.clone.1 = fcmp uge double %maximum.46.7.clone.1, %minimum.10.1.clone.1
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
  %add.4424.1.clone.1 = fadd double %maximum.48.1.clone.1, %t.0.i50
  %458 = select i1 %compare.1183.1.clone.1, double %add.4423.1.clone.1, double %add.4424.1.clone.1
  %459 = select i1 %342, double %458, double %208
  %460 = getelementptr i32, ptr addrspace(1) %arg23111, i64 %1
  %461 = load i32, ptr addrspace(1) %460, align 4, !invariant.load !278
  %462 = getelementptr i32, ptr addrspace(1) %arg24113, i64 %1
  %463 = load i32, ptr addrspace(1) %462, align 4
  %464 = select i1 %342, i32 %461, i32 %463
  %465 = getelementptr i32, ptr addrspace(1) %arg25115, i64 %1
  %466 = load i32, ptr addrspace(1) %465, align 4, !invariant.load !278
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
define void @loop_select_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg0, ptr noalias nocapture align 128 dereferenceable(19200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(19200) %arg3, ptr noalias nocapture align 128 dereferenceable(19200) %arg4) local_unnamed_addr #2 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !295
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !277
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 2400
  br i1 %3, label %loop_select_fusion.5.in_bounds-true, label %loop_select_fusion.5.in_bounds-after

loop_select_fusion.5.in_bounds-after:             ; preds = %loop_select_fusion.5.in_bounds-true, %entry
  ret void

loop_select_fusion.5.in_bounds-true:              ; preds = %entry
  %.cmp = icmp ugt i32 %linear_index, 1199
  %4 = zext i1 %.cmp to i64
  %5 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg25, i64 0, i64 %4
  %6 = load i8, ptr addrspace(1) %5, align 1, !invariant.load !278
  %7 = zext nneg i32 %linear_index to i64
  %8 = getelementptr double, ptr addrspace(1) %arg01, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !278
  %10 = getelementptr double, ptr addrspace(1) %arg13, i64 %7
  %11 = load double, ptr addrspace(1) %10, align 8
  %12 = trunc i8 %6 to i1
  %13 = select i1 %12, double %9, double %11
  %14 = getelementptr double, ptr addrspace(1) %arg37, i64 %7
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !278
  %16 = getelementptr double, ptr addrspace(1) %arg49, i64 %7
  %17 = load double, ptr addrspace(1) %16, align 8
  %18 = select i1 %12, double %15, double %17
  store double %13, ptr addrspace(1) %10, align 8
  store double %18, ptr addrspace(1) %16, align 8
  br label %loop_select_fusion.5.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_8(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg5, ptr noalias nocapture align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture align 128 dereferenceable(320) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture align 128 dereferenceable(320) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture align 128 dereferenceable(320) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture align 128 dereferenceable(320) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture align 128 dereferenceable(320) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture align 128 dereferenceable(320) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg21, ptr noalias nocapture align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture align 128 dereferenceable(320) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg25, ptr noalias nocapture align 128 dereferenceable(320) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg27, ptr noalias nocapture align 128 dereferenceable(320) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg30, ptr noalias nocapture align 128 dereferenceable(320) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg32, ptr noalias nocapture align 128 dereferenceable(320) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg34, ptr noalias nocapture align 128 dereferenceable(320) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg36, ptr noalias nocapture align 128 dereferenceable(320) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg38, ptr noalias nocapture align 128 dereferenceable(320) %arg39, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg40, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg41, ptr noalias nocapture align 128 dereferenceable(320) %arg42, ptr noalias nocapture align 128 dereferenceable(320) %arg43, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg44, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg45, ptr noalias nocapture align 128 dereferenceable(320) %arg46, ptr noalias nocapture align 128 dereferenceable(320) %arg47, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg48, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg49, ptr noalias nocapture align 128 dereferenceable(320) %arg50) local_unnamed_addr #2 {
entry:
  %arg50108 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49106 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg47102 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46100 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg4496 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg4394 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg4292 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg4190 = addrspacecast ptr %arg41 to ptr addrspace(1)
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %2 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg212, i64 0, i64 %1
  %3 = load i8, ptr addrspace(1) %2, align 1, !invariant.load !278
  %4 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg416, i64 0, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !278
  %6 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg518, i64 0, i64 %1
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !278
  %8 = or i8 %7, %5
  %9 = icmp eq i8 %8, 0
  %10 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg314, i64 0, i64 %1
  %11 = load i8, ptr addrspace(1) %10, align 1, !invariant.load !278
  %12 = zext nneg i32 %0 to i64
  %13 = getelementptr double, ptr addrspace(1) %arg01, i64 %12
  %14 = load double, ptr addrspace(1) %13, align 8
  %15 = getelementptr double, ptr addrspace(1) %arg110, i64 %12
  %16 = load double, ptr addrspace(1) %15, align 8, !invariant.load !278
  %17 = trunc i8 %11 to i1
  %18 = select i1 %17, double %14, double %16
  %19 = trunc i8 %3 to i1
  %20 = select i1 %19, i1 %9, i1 false
  %21 = select i1 %20, double %18, double %14
  %22 = getelementptr double, ptr addrspace(1) %arg620, i64 %12
  %23 = load double, ptr addrspace(1) %22, align 8
  %24 = getelementptr double, ptr addrspace(1) %arg722, i64 %12
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !278
  %26 = select i1 %17, double %23, double %25
  %27 = select i1 %20, double %26, double %23
  %28 = getelementptr double, ptr addrspace(1) %arg824, i64 %12
  %29 = load double, ptr addrspace(1) %28, align 8
  %30 = getelementptr double, ptr addrspace(1) %arg926, i64 %12
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !278
  %32 = select i1 %17, double %29, double %31
  %33 = select i1 %20, double %32, double %29
  %34 = getelementptr double, ptr addrspace(1) %arg1028, i64 %12
  %35 = load double, ptr addrspace(1) %34, align 8
  %36 = getelementptr double, ptr addrspace(1) %arg1130, i64 %12
  %37 = load double, ptr addrspace(1) %36, align 8, !invariant.load !278
  %38 = select i1 %17, double %35, double %37
  %39 = select i1 %20, double %38, double %35
  %40 = getelementptr double, ptr addrspace(1) %arg1232, i64 %12
  %41 = load double, ptr addrspace(1) %40, align 8
  %42 = getelementptr double, ptr addrspace(1) %arg1334, i64 %12
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !278
  %44 = select i1 %17, double %41, double %43
  %45 = select i1 %20, double %44, double %41
  %46 = getelementptr double, ptr addrspace(1) %arg1436, i64 %12
  %47 = load double, ptr addrspace(1) %46, align 8
  %48 = getelementptr double, ptr addrspace(1) %arg1538, i64 %12
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !278
  %50 = select i1 %17, double %47, double %49
  %51 = select i1 %20, double %50, double %47
  %52 = getelementptr double, ptr addrspace(1) %arg1640, i64 %12
  %53 = load double, ptr addrspace(1) %52, align 8
  %54 = getelementptr double, ptr addrspace(1) %arg1742, i64 %12
  %55 = load double, ptr addrspace(1) %54, align 8, !invariant.load !278
  %56 = select i1 %17, double %53, double %55
  %57 = select i1 %20, double %56, double %53
  %58 = getelementptr double, ptr addrspace(1) %arg1844, i64 %12
  %59 = load double, ptr addrspace(1) %58, align 8
  %60 = getelementptr double, ptr addrspace(1) %arg1946, i64 %12
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !278
  %62 = select i1 %17, double %59, double %61
  %63 = select i1 %20, double %62, double %59
  %64 = getelementptr double, ptr addrspace(1) %arg2048, i64 %12
  %65 = load double, ptr addrspace(1) %64, align 8
  %66 = getelementptr double, ptr addrspace(1) %arg2150, i64 %12
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !278
  %68 = select i1 %17, double %65, double %67
  %69 = select i1 %20, double %68, double %65
  %70 = getelementptr double, ptr addrspace(1) %arg2252, i64 %12
  %71 = load double, ptr addrspace(1) %70, align 8
  %72 = getelementptr double, ptr addrspace(1) %arg2354, i64 %12
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !278
  %74 = select i1 %17, double %71, double %73
  %75 = select i1 %20, double %74, double %71
  %76 = getelementptr double, ptr addrspace(1) %arg2456, i64 %12
  %77 = load double, ptr addrspace(1) %76, align 8
  %78 = getelementptr double, ptr addrspace(1) %arg2558, i64 %12
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !278
  %80 = select i1 %17, double %77, double %79
  %81 = select i1 %20, double %80, double %77
  %82 = getelementptr double, ptr addrspace(1) %arg2660, i64 %12
  %83 = load double, ptr addrspace(1) %82, align 8
  %84 = getelementptr double, ptr addrspace(1) %arg2762, i64 %12
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !278
  %86 = select i1 %17, double %83, double %85
  %87 = select i1 %20, double %86, double %83
  %88 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg3068, i64 0, i64 %1
  %89 = load i8, ptr addrspace(1) %88, align 1, !invariant.load !278
  %90 = getelementptr double, ptr addrspace(1) %arg2966, i64 %12
  %91 = load double, ptr addrspace(1) %90, align 8, !invariant.load !278
  %92 = getelementptr double, ptr addrspace(1) %arg2864, i64 %12
  %93 = load double, ptr addrspace(1) %92, align 8
  %94 = trunc i8 %89 to i1
  %add.4428.5.clone.1.clone.1 = fadd double %91, %93
  %95 = select i1 %19, double %add.4428.5.clone.1.clone.1, double %93
  %96 = getelementptr double, ptr addrspace(1) %arg3272, i64 %12
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !278
  %98 = getelementptr double, ptr addrspace(1) %arg3170, i64 %12
  %99 = load double, ptr addrspace(1) %98, align 8
  %add.4426.5.clone.1.clone.1 = fadd double %97, %99
  %100 = select i1 %19, double %add.4426.5.clone.1.clone.1, double %99
  %101 = getelementptr double, ptr addrspace(1) %arg3476, i64 %12
  %102 = load double, ptr addrspace(1) %101, align 8, !invariant.load !278
  %103 = getelementptr double, ptr addrspace(1) %arg3374, i64 %12
  %104 = load double, ptr addrspace(1) %103, align 8
  %add.4429.5.clone.1.clone.1 = fadd double %102, %104
  %105 = select i1 %19, double %add.4429.5.clone.1.clone.1, double %104
  %106 = getelementptr double, ptr addrspace(1) %arg3680, i64 %12
  %107 = load double, ptr addrspace(1) %106, align 8, !invariant.load !278
  %108 = getelementptr double, ptr addrspace(1) %arg3578, i64 %12
  %109 = load double, ptr addrspace(1) %108, align 8
  %add.4427.5.clone.1.clone.1 = fadd double %107, %109
  %110 = select i1 %19, double %add.4427.5.clone.1.clone.1, double %109
  %111 = getelementptr double, ptr addrspace(1) %arg3884, i64 %12
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !278
  %113 = getelementptr double, ptr addrspace(1) %arg3782, i64 %12
  %114 = load double, ptr addrspace(1) %113, align 8
  %add.4425.5.clone.1.clone.1 = fadd double %112, %114
  %115 = select i1 %19, double %add.4425.5.clone.1.clone.1, double %114
  %116 = getelementptr double, ptr addrspace(1) %arg3986, i64 %12
  %117 = load double, ptr addrspace(1) %116, align 8
  %118 = getelementptr double, ptr addrspace(1) %arg4190, i64 %12
  %119 = load double, ptr addrspace(1) %118, align 8, !invariant.load !278
  %120 = select i1 %94, double %117, double %119
  %121 = select i1 %19, double %120, double %117
  %122 = getelementptr double, ptr addrspace(1) %arg4292, i64 %12
  %123 = load double, ptr addrspace(1) %122, align 8
  %124 = select i1 %19, i1 %94, i1 false
  %125 = select i1 %124, double %119, double %123
  %126 = getelementptr double, ptr addrspace(1) %arg4496, i64 %12
  %127 = load double, ptr addrspace(1) %126, align 8, !invariant.load !278
  %128 = getelementptr double, ptr addrspace(1) %arg4394, i64 %12
  %129 = load double, ptr addrspace(1) %128, align 8
  %130 = select i1 %124, double %127, double %129
  %131 = getelementptr double, ptr addrspace(1) %arg46100, i64 %12
  %132 = load double, ptr addrspace(1) %131, align 8
  %133 = select i1 %94, double %132, double %127
  %134 = select i1 %19, double %133, double %132
  %135 = getelementptr double, ptr addrspace(1) %arg47102, i64 %12
  %136 = load double, ptr addrspace(1) %135, align 8
  %137 = getelementptr double, ptr addrspace(1) %arg49106, i64 %12
  %138 = load double, ptr addrspace(1) %137, align 8, !invariant.load !278
  %139 = select i1 %94, double %136, double %138
  %140 = select i1 %19, double %139, double %136
  %141 = getelementptr double, ptr addrspace(1) %arg50108, i64 %12
  %142 = load double, ptr addrspace(1) %141, align 8
  %143 = select i1 %124, double %138, double %142
  store double %21, ptr addrspace(1) %13, align 8
  store double %27, ptr addrspace(1) %22, align 8
  store double %33, ptr addrspace(1) %28, align 8
  store double %39, ptr addrspace(1) %34, align 8
  store double %45, ptr addrspace(1) %40, align 8
  store double %51, ptr addrspace(1) %46, align 8
  store double %57, ptr addrspace(1) %52, align 8
  store double %63, ptr addrspace(1) %58, align 8
  store double %69, ptr addrspace(1) %64, align 8
  store double %75, ptr addrspace(1) %70, align 8
  store double %81, ptr addrspace(1) %76, align 8
  store double %87, ptr addrspace(1) %82, align 8
  store double %95, ptr addrspace(1) %92, align 8
  store double %100, ptr addrspace(1) %98, align 8
  store double %105, ptr addrspace(1) %103, align 8
  store double %110, ptr addrspace(1) %108, align 8
  store double %115, ptr addrspace(1) %113, align 8
  store double %121, ptr addrspace(1) %116, align 8
  store double %125, ptr addrspace(1) %122, align 8
  store double %130, ptr addrspace(1) %128, align 8
  store double %134, ptr addrspace(1) %131, align 8
  store double %140, ptr addrspace(1) %135, align 8
  store double %143, ptr addrspace(1) %141, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_7(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg4, ptr noalias nocapture align 128 dereferenceable(320) %arg5, ptr noalias nocapture align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg8, ptr noalias nocapture align 128 dereferenceable(320) %arg9, ptr noalias nocapture align 128 dereferenceable(320) %arg10, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg12, ptr noalias nocapture align 128 dereferenceable(320) %arg13, ptr noalias nocapture align 128 dereferenceable(320) %arg14, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture align 128 dereferenceable(320) %arg17, ptr noalias nocapture align 128 dereferenceable(320) %arg18, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg20, ptr noalias nocapture align 128 dereferenceable(320) %arg21, ptr noalias nocapture align 128 dereferenceable(320) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg23, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg24, ptr noalias nocapture align 128 dereferenceable(320) %arg25, ptr noalias nocapture align 128 dereferenceable(320) %arg26, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg28, ptr noalias nocapture align 128 dereferenceable(320) %arg29, ptr noalias nocapture align 128 dereferenceable(320) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg31, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg32, ptr noalias nocapture align 128 dereferenceable(320) %arg33, ptr noalias nocapture align 128 dereferenceable(320) %arg34, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg36, ptr noalias nocapture align 128 dereferenceable(320) %arg37, ptr noalias nocapture align 128 dereferenceable(320) %arg38, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg39, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg40, ptr noalias nocapture align 128 dereferenceable(320) %arg41, ptr noalias nocapture align 128 dereferenceable(320) %arg42, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg43, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg44, ptr noalias nocapture align 128 dereferenceable(320) %arg45, ptr noalias nocapture align 128 dereferenceable(320) %arg46, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg48, ptr noalias nocapture align 128 dereferenceable(320) %arg49, ptr noalias nocapture align 128 dereferenceable(320) %arg50, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg51, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg52, ptr noalias nocapture align 128 dereferenceable(320) %arg53, ptr noalias nocapture align 128 dereferenceable(320) %arg54, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg55, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg56, ptr noalias nocapture align 128 dereferenceable(320) %arg57, ptr noalias nocapture align 128 dereferenceable(320) %arg58, ptr noalias nocapture readnone align 128 dereferenceable(320) %arg59, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg60, ptr noalias nocapture align 128 dereferenceable(320) %arg61, ptr noalias nocapture align 128 dereferenceable(320) %arg62, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg63) local_unnamed_addr #2 {
entry:
  %arg63134 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62132 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61130 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60128 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg58124 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57122 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg55118 = addrspacecast ptr %arg55 to ptr addrspace(1)
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
  %arg3986 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg3884 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg3782 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg3680 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg3476 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg3374 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg3170 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg3068 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2966 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2864 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2660 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2558 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2354 = addrspacecast ptr %arg23 to ptr addrspace(1)
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
  %arg722 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !282
  %.cmp = icmp ugt i32 %0, 19
  %1 = zext i1 %.cmp to i64
  %2 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg212, i64 0, i64 %1
  %3 = load i8, ptr addrspace(1) %2, align 1, !invariant.load !278
  %4 = getelementptr inbounds [2 x i8], ptr addrspace(1) %arg110, i64 0, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !278
  %6 = zext nneg i32 %0 to i64
  %7 = getelementptr double, ptr addrspace(1) %arg314, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !278
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
  %19 = getelementptr double, ptr addrspace(1) %arg722, i64 %6
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !278
  %21 = getelementptr double, ptr addrspace(1) %arg620, i64 %6
  %22 = load double, ptr addrspace(1) %21, align 8
  %23 = select i1 %13, double %20, double %22
  %24 = getelementptr double, ptr addrspace(1) %arg926, i64 %6
  %25 = load double, ptr addrspace(1) %24, align 8
  %26 = select i1 %9, double %25, double %20
  %27 = select i1 %12, double %26, double %25
  %28 = getelementptr double, ptr addrspace(1) %arg1028, i64 %6
  %29 = load double, ptr addrspace(1) %28, align 8
  %30 = getelementptr double, ptr addrspace(1) %arg1232, i64 %6
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !278
  %32 = select i1 %9, double %29, double %31
  %33 = select i1 %12, double %32, double %29
  %34 = getelementptr double, ptr addrspace(1) %arg1334, i64 %6
  %35 = load double, ptr addrspace(1) %34, align 8
  %36 = select i1 %13, double %31, double %35
  %37 = getelementptr double, ptr addrspace(1) %arg1436, i64 %6
  %38 = load double, ptr addrspace(1) %37, align 8
  %39 = getelementptr double, ptr addrspace(1) %arg1640, i64 %6
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !278
  %41 = select i1 %9, double %38, double %40
  %42 = select i1 %12, double %41, double %38
  %43 = getelementptr double, ptr addrspace(1) %arg1742, i64 %6
  %44 = load double, ptr addrspace(1) %43, align 8
  %45 = select i1 %13, double %40, double %44
  %46 = getelementptr double, ptr addrspace(1) %arg1844, i64 %6
  %47 = load double, ptr addrspace(1) %46, align 8
  %48 = getelementptr double, ptr addrspace(1) %arg2048, i64 %6
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !278
  %50 = select i1 %9, double %47, double %49
  %51 = select i1 %12, double %50, double %47
  %52 = getelementptr double, ptr addrspace(1) %arg2150, i64 %6
  %53 = load double, ptr addrspace(1) %52, align 8
  %54 = select i1 %13, double %49, double %53
  %55 = getelementptr double, ptr addrspace(1) %arg2354, i64 %6
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !278
  %57 = getelementptr double, ptr addrspace(1) %arg2252, i64 %6
  %58 = load double, ptr addrspace(1) %57, align 8
  %59 = select i1 %13, double %56, double %58
  %60 = getelementptr double, ptr addrspace(1) %arg2558, i64 %6
  %61 = load double, ptr addrspace(1) %60, align 8
  %62 = select i1 %9, double %61, double %56
  %63 = select i1 %12, double %62, double %61
  %64 = getelementptr double, ptr addrspace(1) %arg2660, i64 %6
  %65 = load double, ptr addrspace(1) %64, align 8
  %66 = getelementptr double, ptr addrspace(1) %arg2864, i64 %6
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !278
  %68 = select i1 %9, double %65, double %67
  %69 = select i1 %12, double %68, double %65
  %70 = getelementptr double, ptr addrspace(1) %arg2966, i64 %6
  %71 = load double, ptr addrspace(1) %70, align 8
  %72 = select i1 %13, double %67, double %71
  %73 = getelementptr double, ptr addrspace(1) %arg3170, i64 %6
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !278
  %75 = getelementptr double, ptr addrspace(1) %arg3068, i64 %6
  %76 = load double, ptr addrspace(1) %75, align 8
  %77 = select i1 %13, double %74, double %76
  %78 = getelementptr double, ptr addrspace(1) %arg3374, i64 %6
  %79 = load double, ptr addrspace(1) %78, align 8
  %80 = select i1 %9, double %79, double %74
  %81 = select i1 %12, double %80, double %79
  %82 = getelementptr double, ptr addrspace(1) %arg3476, i64 %6
  %83 = load double, ptr addrspace(1) %82, align 8
  %84 = getelementptr double, ptr addrspace(1) %arg3680, i64 %6
  %85 = load double, ptr addrspace(1) %84, align 8, !invariant.load !278
  %86 = select i1 %9, double %83, double %85
  %87 = select i1 %12, double %86, double %83
  %88 = getelementptr double, ptr addrspace(1) %arg3782, i64 %6
  %89 = load double, ptr addrspace(1) %88, align 8
  %90 = select i1 %13, double %85, double %89
  %91 = getelementptr double, ptr addrspace(1) %arg3986, i64 %6
  %92 = load double, ptr addrspace(1) %91, align 8, !invariant.load !278
  %93 = getelementptr double, ptr addrspace(1) %arg3884, i64 %6
  %94 = load double, ptr addrspace(1) %93, align 8
  %95 = select i1 %13, double %92, double %94
  %96 = getelementptr double, ptr addrspace(1) %arg4190, i64 %6
  %97 = load double, ptr addrspace(1) %96, align 8
  %98 = select i1 %9, double %97, double %92
  %99 = select i1 %12, double %98, double %97
  %100 = getelementptr double, ptr addrspace(1) %arg4292, i64 %6
  %101 = load double, ptr addrspace(1) %100, align 8
  %102 = getelementptr double, ptr addrspace(1) %arg4496, i64 %6
  %103 = load double, ptr addrspace(1) %102, align 8, !invariant.load !278
  %104 = select i1 %9, double %101, double %103
  %105 = select i1 %12, double %104, double %101
  %106 = getelementptr double, ptr addrspace(1) %arg4598, i64 %6
  %107 = load double, ptr addrspace(1) %106, align 8
  %108 = select i1 %13, double %103, double %107
  %109 = getelementptr double, ptr addrspace(1) %arg46100, i64 %6
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg48104, i64 %6
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !278
  %113 = select i1 %9, double %110, double %112
  %114 = select i1 %12, double %113, double %110
  %115 = getelementptr double, ptr addrspace(1) %arg49106, i64 %6
  %116 = load double, ptr addrspace(1) %115, align 8
  %117 = select i1 %13, double %112, double %116
  %118 = getelementptr double, ptr addrspace(1) %arg50108, i64 %6
  %119 = load double, ptr addrspace(1) %118, align 8
  %120 = getelementptr double, ptr addrspace(1) %arg52112, i64 %6
  %121 = load double, ptr addrspace(1) %120, align 8, !invariant.load !278
  %122 = select i1 %9, double %119, double %121
  %123 = select i1 %12, double %122, double %119
  %124 = getelementptr double, ptr addrspace(1) %arg53114, i64 %6
  %125 = load double, ptr addrspace(1) %124, align 8
  %126 = select i1 %13, double %121, double %125
  %127 = getelementptr double, ptr addrspace(1) %arg55118, i64 %6
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !278
  %129 = getelementptr double, ptr addrspace(1) %arg54116, i64 %6
  %130 = load double, ptr addrspace(1) %129, align 8
  %131 = select i1 %13, double %128, double %130
  %132 = getelementptr double, ptr addrspace(1) %arg57122, i64 %6
  %133 = load double, ptr addrspace(1) %132, align 8
  %134 = select i1 %9, double %133, double %128
  %135 = select i1 %12, double %134, double %133
  %136 = getelementptr double, ptr addrspace(1) %arg58124, i64 %6
  %137 = load double, ptr addrspace(1) %136, align 8
  %138 = getelementptr double, ptr addrspace(1) %arg60128, i64 %6
  %139 = load double, ptr addrspace(1) %138, align 8, !invariant.load !278
  %140 = select i1 %9, double %137, double %139
  %141 = select i1 %12, double %140, double %137
  %142 = getelementptr double, ptr addrspace(1) %arg61130, i64 %6
  %143 = load double, ptr addrspace(1) %142, align 8
  %144 = select i1 %13, double %139, double %143
  %145 = getelementptr double, ptr addrspace(1) %arg63134, i64 %6
  %146 = load double, ptr addrspace(1) %145, align 8, !invariant.load !278
  %147 = getelementptr double, ptr addrspace(1) %arg62132, i64 %6
  %148 = load double, ptr addrspace(1) %147, align 8
  %add.4430.5.clone.1 = fadd double %146, %148
  %149 = select i1 %12, double %add.4430.5.clone.1, double %148
  store double %14, ptr addrspace(1) %10, align 8
  store double %18, ptr addrspace(1) %15, align 8
  store double %23, ptr addrspace(1) %21, align 8
  store double %27, ptr addrspace(1) %24, align 8
  store double %33, ptr addrspace(1) %28, align 8
  store double %36, ptr addrspace(1) %34, align 8
  store double %42, ptr addrspace(1) %37, align 8
  store double %45, ptr addrspace(1) %43, align 8
  store double %51, ptr addrspace(1) %46, align 8
  store double %54, ptr addrspace(1) %52, align 8
  store double %59, ptr addrspace(1) %57, align 8
  store double %63, ptr addrspace(1) %60, align 8
  store double %69, ptr addrspace(1) %64, align 8
  store double %72, ptr addrspace(1) %70, align 8
  store double %77, ptr addrspace(1) %75, align 8
  store double %81, ptr addrspace(1) %78, align 8
  store double %87, ptr addrspace(1) %82, align 8
  store double %90, ptr addrspace(1) %88, align 8
  store double %95, ptr addrspace(1) %93, align 8
  store double %99, ptr addrspace(1) %96, align 8
  store double %105, ptr addrspace(1) %100, align 8
  store double %108, ptr addrspace(1) %106, align 8
  store double %114, ptr addrspace(1) %109, align 8
  store double %117, ptr addrspace(1) %115, align 8
  store double %123, ptr addrspace(1) %118, align 8
  store double %126, ptr addrspace(1) %124, align 8
  store double %131, ptr addrspace(1) %129, align 8
  store double %135, ptr addrspace(1) %132, align 8
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.5605 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !278
  %1 = icmp slt i64 %param_2.5605, 0
  %2 = add i64 %param_2.5605, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5605
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr i8, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.71184 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !278
  %7 = getelementptr inbounds [10 x [2 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i8 %param_1.71184, ptr addrspace(1) %7, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_56(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.5576 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !278
  %1 = icmp slt i64 %param_2.5576, 0
  %2 = add i64 %param_2.5576, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5576
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.70894 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !278
  %7 = getelementptr inbounds [10 x [2 x i64]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store i64 %param_1.70894, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_95(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.5609 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !278
  %1 = icmp slt i64 %param_2.5609, 0
  %2 = add i64 %param_2.5609, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.5609
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.71224 = load double, ptr addrspace(1) %6, align 8, !invariant.load !278
  %7 = getelementptr inbounds [10 x [2 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.71224, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_54(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #2 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !279
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.4090 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !278
  %1 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.55684 = load double, ptr addrspace(1) %1, align 8, !invariant.load !278
  %2 = tail call double @llvm.fma.f64(double %param_2.55684, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #13
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #13
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_2.55684)
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
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.55684) #13
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #13
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_2.55684, 0.000000e+00
  %28 = fadd double %param_2.55684, 0x7FF0000000000000
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
  %40 = icmp slt i64 %param_3.4090, 0
  %41 = add i64 %param_3.4090, 10
  %42 = select i1 %40, i64 %41, i64 %param_3.4090
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 9)
  %45 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.70815 = load i64, ptr addrspace(1) %45, align 8, !invariant.load !278
  %46 = sitofp i64 %param_1.70815 to double
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
attributes #8 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #9 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #10 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) }
attributes #11 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #12 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271}
!llvm.ident = !{!272}
!nvvmir.version = !{!273}
!llvm.module.flags = !{!274}

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
!14 = !{ptr @loop_broadcast_fusion_23, !"kernel", i32 1}
!15 = !{ptr @loop_broadcast_fusion_23, !"reqntidx", i32 2}
!16 = !{ptr @loop_broadcast_fusion_21, !"kernel", i32 1}
!17 = !{ptr @loop_broadcast_fusion_21, !"reqntidx", i32 2}
!18 = !{ptr @loop_slice_fusion_3, !"kernel", i32 1}
!19 = !{ptr @loop_slice_fusion_3, !"reqntidx", i32 4}
!20 = !{ptr @loop_slice_fusion_2, !"kernel", i32 1}
!21 = !{ptr @loop_slice_fusion_2, !"reqntidx", i32 8}
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
!48 = !{ptr @input_concatenate_fusion_1, !"kernel", i32 1}
!49 = !{ptr @input_concatenate_fusion_1, !"reqntidx", i32 6}
!50 = !{ptr @loop_slice_fusion_1, !"kernel", i32 1}
!51 = !{ptr @loop_slice_fusion_1, !"reqntidx", i32 4}
!52 = !{ptr @loop_broadcast_compare_select_fusion, !"kernel", i32 1}
!53 = !{ptr @loop_broadcast_compare_select_fusion, !"reqntidx", i32 2}
!54 = !{ptr @loop_select_fusion_6, !"kernel", i32 1}
!55 = !{ptr @loop_select_fusion_6, !"reqntidx", i32 40}
!56 = !{ptr @input_reduce_fusion_5, !"kernel", i32 1}
!57 = !{ptr @input_reduce_fusion_5, !"reqntidx", i32 64}
!58 = !{ptr @loop_add_minimum_select_fusion, !"kernel", i32 1}
!59 = !{ptr @loop_add_minimum_select_fusion, !"reqntidx", i32 2}
!60 = !{ptr @input_reduce_fusion_4, !"kernel", i32 1}
!61 = !{ptr @input_reduce_fusion_4, !"reqntidx", i32 32}
!62 = !{ptr @loop_concatenate_fusion, !"kernel", i32 1}
!63 = !{ptr @loop_concatenate_fusion, !"reqntidx", i32 128}
!64 = !{ptr @loop_reduce_fusion_3, !"kernel", i32 1}
!65 = !{ptr @loop_reduce_fusion_3, !"reqntidx", i32 2}
!66 = !{ptr @loop_add_select_fusion_2, !"kernel", i32 1}
!67 = !{ptr @loop_add_select_fusion_2, !"reqntidx", i32 40}
!68 = !{ptr @loop_broadcast_fusion_14, !"kernel", i32 1}
!69 = !{ptr @loop_broadcast_fusion_14, !"reqntidx", i32 1024}
!70 = !{ptr @loop_broadcast_fusion_13, !"kernel", i32 1}
!71 = !{ptr @loop_broadcast_fusion_13, !"reqntidx", i32 40}
!72 = !{ptr @loop_broadcast_fusion_6, !"kernel", i32 1}
!73 = !{ptr @loop_broadcast_fusion_6, !"reqntidx", i32 1024}
!74 = !{ptr @loop_broadcast_fusion_11, !"kernel", i32 1}
!75 = !{ptr @loop_broadcast_fusion_11, !"reqntidx", i32 40}
!76 = !{ptr @loop_broadcast_fusion_5, !"kernel", i32 1}
!77 = !{ptr @loop_broadcast_fusion_5, !"reqntidx", i32 1024}
!78 = !{ptr @loop_broadcast_fusion_8, !"kernel", i32 1}
!79 = !{ptr @loop_broadcast_fusion_8, !"reqntidx", i32 1024}
!80 = !{ptr @loop_broadcast_fusion_15, !"kernel", i32 1}
!81 = !{ptr @loop_broadcast_fusion_15, !"reqntidx", i32 192}
!82 = !{ptr @loop_broadcast_fusion_9, !"kernel", i32 1}
!83 = !{ptr @loop_broadcast_fusion_9, !"reqntidx", i32 192}
!84 = !{ptr @loop_broadcast_fusion_10, !"kernel", i32 1}
!85 = !{ptr @loop_broadcast_fusion_10, !"reqntidx", i32 40}
!86 = !{ptr @loop_broadcast_fusion_12, !"kernel", i32 1}
!87 = !{ptr @loop_broadcast_fusion_12, !"reqntidx", i32 40}
!88 = !{ptr @loop_broadcast_fusion_18, !"kernel", i32 1}
!89 = !{ptr @loop_broadcast_fusion_18, !"reqntidx", i32 20}
!90 = !{ptr @loop_compare_fusion_1, !"kernel", i32 1}
!91 = !{ptr @loop_compare_fusion_1, !"reqntidx", i32 1}
!92 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 1}
!94 = !{ptr @loop_dynamic_update_slice_fusion_52, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_52, !"reqntidx", i32 1}
!96 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 40}
!98 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 40}
!100 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 40}
!102 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 40}
!104 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 40}
!106 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 40}
!108 = !{ptr @loop_dynamic_update_slice_fusion_36, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_36, !"reqntidx", i32 40}
!110 = !{ptr @loop_dynamic_update_slice_fusion_39, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_39, !"reqntidx", i32 40}
!112 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 40}
!114 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 40}
!116 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 40}
!118 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 40}
!120 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!121 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 40}
!122 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!123 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 40}
!124 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!125 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 40}
!126 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 40}
!128 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!129 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 40}
!130 = !{ptr @loop_dynamic_update_slice_fusion_41, !"kernel", i32 1}
!131 = !{ptr @loop_dynamic_update_slice_fusion_41, !"reqntidx", i32 40}
!132 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 40}
!134 = !{ptr @loop_dynamic_update_slice_fusion_46, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_46, !"reqntidx", i32 40}
!136 = !{ptr @loop_dynamic_update_slice_fusion_47, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_47, !"reqntidx", i32 40}
!138 = !{ptr @loop_add_divide_select_fusion, !"kernel", i32 1}
!139 = !{ptr @loop_add_divide_select_fusion, !"reqntidx", i32 40}
!140 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 40}
!142 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 40}
!144 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 40}
!146 = !{ptr @loop_dynamic_update_slice_fusion_28, !"kernel", i32 1}
!147 = !{ptr @loop_dynamic_update_slice_fusion_28, !"reqntidx", i32 40}
!148 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!149 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 40}
!150 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!151 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 40}
!152 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!153 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 40}
!154 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!155 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 40}
!156 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!157 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 40}
!158 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!159 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 40}
!160 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!161 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 40}
!162 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!163 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 40}
!164 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!165 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 40}
!166 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!167 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 40}
!168 = !{ptr @loop_dynamic_update_slice_fusion_31, !"kernel", i32 1}
!169 = !{ptr @loop_dynamic_update_slice_fusion_31, !"reqntidx", i32 40}
!170 = !{ptr @loop_dynamic_update_slice_fusion_33, !"kernel", i32 1}
!171 = !{ptr @loop_dynamic_update_slice_fusion_33, !"reqntidx", i32 40}
!172 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!173 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 40}
!174 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!175 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 40}
!176 = !{ptr @loop_dynamic_update_slice_fusion_20, !"kernel", i32 1}
!177 = !{ptr @loop_dynamic_update_slice_fusion_20, !"reqntidx", i32 40}
!178 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!179 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 40}
!180 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!181 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 40}
!182 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!183 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 40}
!184 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!185 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 40}
!186 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!187 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!188 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!189 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 128}
!190 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!191 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 128}
!192 = !{ptr @loop_broadcast_fusion_16, !"kernel", i32 1}
!193 = !{ptr @loop_broadcast_fusion_16, !"reqntidx", i32 1024}
!194 = !{ptr @input_scatter_fusion_2, !"kernel", i32 1}
!195 = !{ptr @input_scatter_fusion_2, !"reqntidx", i32 128}
!196 = !{ptr @loop_reduce_fusion_1, !"kernel", i32 1}
!197 = !{ptr @loop_reduce_fusion_1, !"reqntidx", i32 128}
!198 = !{ptr @loop_slice_fusion, !"kernel", i32 1}
!199 = !{ptr @loop_slice_fusion, !"reqntidx", i32 128}
!200 = !{ptr @loop_reduce_fusion, !"kernel", i32 1}
!201 = !{ptr @loop_reduce_fusion, !"reqntidx", i32 128}
!202 = !{ptr @input_multiply_reduce_select_fusion, !"kernel", i32 1}
!203 = !{ptr @input_multiply_reduce_select_fusion, !"reqntidx", i32 1024}
!204 = !{ptr @loop_broadcast_fusion_17, !"kernel", i32 1}
!205 = !{ptr @loop_broadcast_fusion_17, !"reqntidx", i32 40}
!206 = !{ptr @loop_dynamic_slice_fusion_2, !"kernel", i32 1}
!207 = !{ptr @loop_dynamic_slice_fusion_2, !"reqntidx", i32 1}
!208 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!209 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!210 = !{ptr @loop_dynamic_slice_fusion_4, !"kernel", i32 1}
!211 = !{ptr @loop_dynamic_slice_fusion_4, !"reqntidx", i32 40}
!212 = !{ptr @loop_dynamic_slice_fusion_3, !"kernel", i32 1}
!213 = !{ptr @loop_dynamic_slice_fusion_3, !"reqntidx", i32 40}
!214 = !{ptr @loop_add_select_fusion_1, !"kernel", i32 1}
!215 = !{ptr @loop_add_select_fusion_1, !"reqntidx", i32 40}
!216 = !{ptr @loop_broadcast_fusion_2, !"kernel", i32 1}
!217 = !{ptr @loop_broadcast_fusion_2, !"reqntidx", i32 20}
!218 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!219 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 20}
!220 = !{ptr @loop_multiply_negate_fusion, !"kernel", i32 1}
!221 = !{ptr @loop_multiply_negate_fusion, !"reqntidx", i32 40}
!222 = !{ptr @loop_broadcast_multiply_select_fusion, !"kernel", i32 1}
!223 = !{ptr @loop_broadcast_multiply_select_fusion, !"reqntidx", i32 40}
!224 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!225 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 40}
!226 = !{ptr @input_reduce_fusion_2, !"kernel", i32 1}
!227 = !{ptr @input_reduce_fusion_2, !"reqntidx", i32 1024}
!228 = !{ptr @input_concatenate_reduce_fusion, !"kernel", i32 1}
!229 = !{ptr @input_concatenate_reduce_fusion, !"reqntidx", i32 64}
!230 = !{ptr @input_reduce_fusion_3, !"kernel", i32 1}
!231 = !{ptr @input_reduce_fusion_3, !"reqntidx", i32 1024}
!232 = !{ptr @loop_select_fusion_3, !"kernel", i32 1}
!233 = !{ptr @loop_select_fusion_3, !"reqntidx", i32 40}
!234 = !{ptr @loop_reduce_fusion_2, !"kernel", i32 1}
!235 = !{ptr @loop_reduce_fusion_2, !"reqntidx", i32 2}
!236 = !{ptr @loop_add_compare_convert_select_fusion, !"kernel", i32 1}
!237 = !{ptr @loop_add_compare_convert_select_fusion, !"reqntidx", i32 2}
!238 = !{ptr @input_scatter_fusion_1, !"kernel", i32 1}
!239 = !{ptr @input_scatter_fusion_1, !"reqntidx", i32 128}
!240 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!241 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 128}
!242 = !{ptr @input_reduce_fusion_1, !"kernel", i32 1}
!243 = !{ptr @input_reduce_fusion_1, !"reqntidx", i32 32}
!244 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!245 = !{ptr @input_reduce_fusion, !"reqntidx", i32 64}
!246 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!247 = !{ptr @loop_select_fusion, !"reqntidx", i32 2}
!248 = !{ptr @loop_select_fusion_2, !"kernel", i32 1}
!249 = !{ptr @loop_select_fusion_2, !"reqntidx", i32 40}
!250 = !{ptr @loop_select_fusion_4, !"kernel", i32 1}
!251 = !{ptr @loop_select_fusion_4, !"reqntidx", i32 2}
!252 = !{ptr @loop_subtract_fusion_1, !"kernel", i32 1}
!253 = !{ptr @loop_subtract_fusion_1, !"reqntidx", i32 128}
!254 = !{ptr @input_reduce_fusion_6, !"kernel", i32 1}
!255 = !{ptr @input_reduce_fusion_6, !"reqntidx", i32 64}
!256 = !{ptr @loop_and_compare_select_fusion, !"kernel", i32 1}
!257 = !{ptr @loop_and_compare_select_fusion, !"reqntidx", i32 2}
!258 = !{ptr @loop_select_fusion_5, !"kernel", i32 1}
!259 = !{ptr @loop_select_fusion_5, !"reqntidx", i32 128}
!260 = !{ptr @loop_select_fusion_8, !"kernel", i32 1}
!261 = !{ptr @loop_select_fusion_8, !"reqntidx", i32 40}
!262 = !{ptr @loop_select_fusion_7, !"kernel", i32 1}
!263 = !{ptr @loop_select_fusion_7, !"reqntidx", i32 40}
!264 = !{ptr @loop_dynamic_update_slice_fusion_97, !"kernel", i32 1}
!265 = !{ptr @loop_dynamic_update_slice_fusion_97, !"reqntidx", i32 2}
!266 = !{ptr @loop_dynamic_update_slice_fusion_56, !"kernel", i32 1}
!267 = !{ptr @loop_dynamic_update_slice_fusion_56, !"reqntidx", i32 2}
!268 = !{ptr @loop_dynamic_update_slice_fusion_95, !"kernel", i32 1}
!269 = !{ptr @loop_dynamic_update_slice_fusion_95, !"reqntidx", i32 2}
!270 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!271 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 2}
!272 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!273 = !{i32 2, i32 0}
!274 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!275 = !{i32 0, i32 20}
!276 = !{i32 0, i32 4}
!277 = !{i32 0, i32 128}
!278 = !{}
!279 = !{i32 0, i32 2}
!280 = !{i32 0, i32 8}
!281 = !{i32 0, i32 64}
!282 = !{i32 0, i32 40}
!283 = !{i32 0, i32 3}
!284 = !{i32 0, i32 1024}
!285 = !{i32 0, i32 32}
!286 = !{i32 0, i32 6}
!287 = !{i32 0, i32 192}
!288 = !{i32 0, i32 60}
!289 = !{i32 0, i32 30}
!290 = distinct !{!290, !291}
!291 = !{!"llvm.loop.vectorize.enable", i1 false}
!292 = distinct !{!292, !291}
!293 = distinct !{!293, !291}
!294 = distinct !{!294, !291}
!295 = !{i32 0, i32 19}
