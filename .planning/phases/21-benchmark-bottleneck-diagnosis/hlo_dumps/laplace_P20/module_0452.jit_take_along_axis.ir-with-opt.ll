; ModuleID = 'jit_take_along_axis'
source_filename = "jit_take_along_axis"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion(ptr noalias nocapture readonly align 16 dereferenceable(15360) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(46080) %arg1) local_unnamed_addr #0 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
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
  %11 = load i32, ptr addrspace(1) %10, align 4, !invariant.load !9
  %12 = lshr i32 %11, 30
  %13 = and i32 %12, 2
  %14 = add i32 %13, %11
  %15 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 8
  store i32 %14, ptr addrspace(1) %15, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(24) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg3) local_unnamed_addr #0 {
entry:
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %7 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg114, i64 0, i64 %5, i64 %6, i64 0, i64 0
  %8 = load i32, ptr addrspace(1) %7, align 4, !invariant.load !9
  %9 = sext i32 %8 to i64
  %10 = icmp sgt i32 %8, -1
  %11 = load <2 x i64>, ptr addrspace(1) %arg216, align 128, !invariant.load !9
  %12 = extractelement <2 x i64> %11, i32 0
  %13 = extractelement <2 x i64> %11, i32 1
  %14 = icmp sge i64 %12, %9
  %15 = and i1 %10, %14
  %16 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 4
  %17 = load i32, ptr addrspace(1) %16, align 4, !invariant.load !9
  %18 = sext i32 %17 to i64
  %19 = icmp sgt i32 %17, -1
  %20 = icmp sge i64 %13, %18
  %21 = and i1 %19, %20
  %22 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 8
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !9
  %24 = sext i32 %23 to i64
  %25 = icmp sgt i32 %23, -1
  %26 = getelementptr inbounds i8, ptr addrspace(1) %arg216, i64 16
  %27 = load i64, ptr addrspace(1) %26, align 16, !invariant.load !9
  %28 = icmp sge i64 %27, %24
  %29 = and i1 %25, %28
  %30 = select i1 %29, i1 %21, i1 false
  %31 = select i1 %30, i1 %15, i1 false
  %narrow = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %32 = tail call i32 @llvm.umin.i32(i32 %narrow, i32 19)
  %narrow4 = tail call i32 @llvm.smax.i32(i32 %17, i32 0)
  %33 = tail call i32 @llvm.umin.i32(i32 %narrow4, i32 191)
  %34 = icmp sgt i32 %23, 0
  %35 = zext nneg i32 %32 to i64
  %36 = zext nneg i32 %33 to i64
  %37 = zext i1 %34 to i64
  %38 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %35, i64 %36, i64 %37
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !9
  %40 = select i1 %31, double %39, double 0x7FF8000000000000
  %41 = zext nneg i32 %linear_index to i64
  %42 = getelementptr double, ptr addrspace(1) %arg318, i64 %41
  store double %40, ptr addrspace(1) %42, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(7372800) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(46080) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(24) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg3) local_unnamed_addr #0 {
entry:
  %arg3102 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2100 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg198 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg096 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or disjoint i32 %2, %3
  %4 = udiv i32 %linear_index_base, 192
  %5 = mul i32 %4, 192
  %.decomposed = sub i32 %linear_index_base, %5
  %.lhs.trunc = trunc nuw nsw i32 %4 to i16
  %6 = urem i16 %.lhs.trunc, 20
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %7 = zext nneg i16 %6 to i64
  %8 = zext nneg i32 %.decomposed to i64
  %9 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg198, i64 0, i64 %7, i64 %8, i64 0, i64 0
  %10 = load <2 x i32>, ptr addrspace(1) %9, align 16, !invariant.load !9
  %11 = extractelement <2 x i32> %10, i32 0
  %12 = extractelement <2 x i32> %10, i32 1
  %13 = sext i32 %11 to i64
  %14 = icmp sgt i32 %11, -1
  %15 = load <2 x i64>, ptr addrspace(1) %arg2100, align 128, !invariant.load !9
  %16 = extractelement <2 x i64> %15, i32 0
  %17 = extractelement <2 x i64> %15, i32 1
  %18 = icmp sge i64 %16, %13
  %19 = and i1 %14, %18
  %20 = sext i32 %12 to i64
  %21 = icmp sgt i32 %12, -1
  %22 = icmp sge i64 %17, %20
  %23 = and i1 %21, %22
  %24 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 8
  %25 = load i32, ptr addrspace(1) %24, align 8, !invariant.load !9
  %26 = sext i32 %25 to i64
  %27 = icmp sgt i32 %25, -1
  %28 = getelementptr inbounds i8, ptr addrspace(1) %arg2100, i64 16
  %29 = load i64, ptr addrspace(1) %28, align 16, !invariant.load !9
  %30 = icmp sge i64 %29, %26
  %31 = and i1 %27, %30
  %32 = select i1 %31, i1 %23, i1 false
  %33 = select i1 %32, i1 %19, i1 false
  %34 = udiv i32 %linear_index_base, 3840
  %35 = urem i32 %linear_index1, 192
  %36 = urem i32 %linear_index2, 192
  %37 = mul i32 %34, 3840
  %urem.decomposed = sub i32 %linear_index_base, %37
  %.lhs.trunc68 = trunc nuw nsw i32 %urem.decomposed to i16
  %.lhs.trunc68.frozen = freeze i16 %.lhs.trunc68
  %38 = udiv i16 %.lhs.trunc68.frozen, 192
  %39 = mul i16 %38, 192
  %.decomposed95 = sub i16 %.lhs.trunc68.frozen, %39
  %40 = zext nneg i16 %38 to i64
  %41 = zext nneg i16 %.decomposed95 to i64
  %42 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg198, i64 0, i64 %40, i64 %41, i64 0, i64 0
  %43 = load i32, ptr addrspace(1) %42, align 4, !invariant.load !9
  %narrow = tail call i32 @llvm.smax.i32(i32 %43, i32 0)
  %44 = tail call i32 @llvm.umin.i32(i32 %narrow, i32 19)
  %45 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 4
  %46 = load i32, ptr addrspace(1) %45, align 4, !invariant.load !9
  %narrow46 = tail call i32 @llvm.smax.i32(i32 %46, i32 0)
  %47 = tail call i32 @llvm.umin.i32(i32 %narrow46, i32 191)
  %48 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 8
  %49 = load i32, ptr addrspace(1) %48, align 4, !invariant.load !9
  %50 = icmp sgt i32 %49, 0
  %51 = zext nneg i32 %34 to i64
  %52 = zext nneg i32 %44 to i64
  %53 = zext nneg i32 %47 to i64
  %54 = zext i1 %50 to i64
  %55 = getelementptr inbounds [120 x [20 x [192 x [2 x double]]]], ptr addrspace(1) %arg096, i64 0, i64 %51, i64 %52, i64 %53, i64 %54
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !9
  %57 = select i1 %33, double %56, double 0.000000e+00
  %58 = zext nneg i32 %linear_index_base to i64
  %59 = getelementptr double, ptr addrspace(1) %arg3102, i64 %58
  %60 = zext nneg i32 %35 to i64
  %61 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg198, i64 0, i64 %7, i64 %60, i64 0, i64 0
  %62 = load i32, ptr addrspace(1) %61, align 4, !invariant.load !9
  %63 = sext i32 %62 to i64
  %64 = icmp sgt i32 %62, -1
  %65 = icmp sge i64 %16, %63
  %66 = and i1 %64, %65
  %67 = getelementptr inbounds i8, ptr addrspace(1) %61, i64 4
  %68 = load <2 x i32>, ptr addrspace(1) %67, align 16, !invariant.load !9
  %69 = extractelement <2 x i32> %68, i32 0
  %70 = extractelement <2 x i32> %68, i32 1
  %71 = sext i32 %69 to i64
  %72 = icmp sgt i32 %69, -1
  %73 = icmp sge i64 %17, %71
  %74 = and i1 %72, %73
  %75 = sext i32 %70 to i64
  %76 = icmp sgt i32 %70, -1
  %77 = icmp sge i64 %29, %75
  %78 = and i1 %76, %77
  %79 = select i1 %78, i1 %74, i1 false
  %80 = select i1 %79, i1 %66, i1 false
  %narrow72 = mul nuw nsw i16 %6, 192
  %81 = zext nneg i16 %narrow72 to i32
  %82 = add nuw nsw i32 %35, %81
  %.lhs.trunc84 = trunc nuw nsw i32 %82 to i16
  %83 = urem i16 %.lhs.trunc84, 192
  %84 = udiv i16 %.lhs.trunc84, 192
  %85 = zext nneg i16 %84 to i64
  %86 = zext nneg i16 %83 to i64
  %87 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg198, i64 0, i64 %85, i64 %86, i64 0, i64 0
  %88 = load i32, ptr addrspace(1) %87, align 4, !invariant.load !9
  %narrow50 = tail call i32 @llvm.smax.i32(i32 %88, i32 0)
  %89 = tail call i32 @llvm.umin.i32(i32 %narrow50, i32 19)
  %90 = getelementptr inbounds i8, ptr addrspace(1) %87, i64 4
  %91 = load i32, ptr addrspace(1) %90, align 4, !invariant.load !9
  %narrow52 = tail call i32 @llvm.smax.i32(i32 %91, i32 0)
  %92 = tail call i32 @llvm.umin.i32(i32 %narrow52, i32 191)
  %93 = getelementptr inbounds i8, ptr addrspace(1) %87, i64 8
  %94 = load i32, ptr addrspace(1) %93, align 4, !invariant.load !9
  %95 = icmp sgt i32 %94, 0
  %96 = zext nneg i32 %89 to i64
  %97 = zext nneg i32 %92 to i64
  %98 = zext i1 %95 to i64
  %99 = getelementptr inbounds [120 x [20 x [192 x [2 x double]]]], ptr addrspace(1) %arg096, i64 0, i64 %51, i64 %96, i64 %97, i64 %98
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !9
  %101 = select i1 %80, double %100, double 0.000000e+00
  %102 = insertelement <2 x double> poison, double %57, i32 0
  %103 = insertelement <2 x double> %102, double %101, i32 1
  store <2 x double> %103, ptr addrspace(1) %59, align 32
  %104 = zext nneg i32 %36 to i64
  %105 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg198, i64 0, i64 %7, i64 %104, i64 0, i64 0
  %106 = load <2 x i32>, ptr addrspace(1) %105, align 8, !invariant.load !9
  %107 = extractelement <2 x i32> %106, i32 0
  %108 = extractelement <2 x i32> %106, i32 1
  %109 = sext i32 %107 to i64
  %110 = icmp sgt i32 %107, -1
  %111 = icmp sge i64 %16, %109
  %112 = and i1 %110, %111
  %113 = sext i32 %108 to i64
  %114 = icmp sgt i32 %108, -1
  %115 = icmp sge i64 %17, %113
  %116 = and i1 %114, %115
  %117 = getelementptr inbounds i8, ptr addrspace(1) %105, i64 8
  %118 = load i32, ptr addrspace(1) %117, align 16, !invariant.load !9
  %119 = sext i32 %118 to i64
  %120 = icmp sgt i32 %118, -1
  %121 = icmp sge i64 %29, %119
  %122 = and i1 %120, %121
  %123 = select i1 %122, i1 %116, i1 false
  %124 = select i1 %123, i1 %112, i1 false
  %125 = urem i32 %linear_index3, 192
  %126 = add nuw nsw i32 %36, %81
  %.lhs.trunc87 = trunc nuw nsw i32 %126 to i16
  %127 = urem i16 %.lhs.trunc87, 192
  %128 = udiv i16 %.lhs.trunc87, 192
  %129 = zext nneg i16 %128 to i64
  %130 = zext nneg i16 %127 to i64
  %131 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg198, i64 0, i64 %129, i64 %130, i64 0, i64 0
  %132 = load i32, ptr addrspace(1) %131, align 4, !invariant.load !9
  %narrow56 = tail call i32 @llvm.smax.i32(i32 %132, i32 0)
  %133 = tail call i32 @llvm.umin.i32(i32 %narrow56, i32 19)
  %134 = getelementptr inbounds i8, ptr addrspace(1) %131, i64 4
  %135 = load i32, ptr addrspace(1) %134, align 4, !invariant.load !9
  %narrow58 = tail call i32 @llvm.smax.i32(i32 %135, i32 0)
  %136 = tail call i32 @llvm.umin.i32(i32 %narrow58, i32 191)
  %137 = getelementptr inbounds i8, ptr addrspace(1) %131, i64 8
  %138 = load i32, ptr addrspace(1) %137, align 4, !invariant.load !9
  %139 = icmp sgt i32 %138, 0
  %140 = zext nneg i32 %133 to i64
  %141 = zext nneg i32 %136 to i64
  %142 = zext i1 %139 to i64
  %143 = getelementptr inbounds [120 x [20 x [192 x [2 x double]]]], ptr addrspace(1) %arg096, i64 0, i64 %51, i64 %140, i64 %141, i64 %142
  %144 = load double, ptr addrspace(1) %143, align 8, !invariant.load !9
  %145 = select i1 %124, double %144, double 0.000000e+00
  %146 = getelementptr inbounds i8, ptr addrspace(1) %59, i64 16
  %147 = zext nneg i32 %125 to i64
  %148 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg198, i64 0, i64 %7, i64 %147, i64 0, i64 0
  %149 = load i32, ptr addrspace(1) %148, align 4, !invariant.load !9
  %150 = sext i32 %149 to i64
  %151 = icmp sgt i32 %149, -1
  %152 = icmp sge i64 %16, %150
  %153 = and i1 %151, %152
  %154 = getelementptr inbounds i8, ptr addrspace(1) %148, i64 4
  %155 = load <2 x i32>, ptr addrspace(1) %154, align 8, !invariant.load !9
  %156 = extractelement <2 x i32> %155, i32 0
  %157 = extractelement <2 x i32> %155, i32 1
  %158 = sext i32 %156 to i64
  %159 = icmp sgt i32 %156, -1
  %160 = icmp sge i64 %17, %158
  %161 = and i1 %159, %160
  %162 = sext i32 %157 to i64
  %163 = icmp sgt i32 %157, -1
  %164 = icmp sge i64 %29, %162
  %165 = and i1 %163, %164
  %166 = select i1 %165, i1 %161, i1 false
  %167 = select i1 %166, i1 %153, i1 false
  %168 = add nuw nsw i32 %125, %81
  %.lhs.trunc91 = trunc nuw nsw i32 %168 to i16
  %169 = urem i16 %.lhs.trunc91, 192
  %170 = udiv i16 %.lhs.trunc91, 192
  %171 = zext nneg i16 %170 to i64
  %172 = zext nneg i16 %169 to i64
  %173 = getelementptr inbounds [20 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg198, i64 0, i64 %171, i64 %172, i64 0, i64 0
  %174 = load i32, ptr addrspace(1) %173, align 4, !invariant.load !9
  %narrow62 = tail call i32 @llvm.smax.i32(i32 %174, i32 0)
  %175 = tail call i32 @llvm.umin.i32(i32 %narrow62, i32 19)
  %176 = getelementptr inbounds i8, ptr addrspace(1) %173, i64 4
  %177 = load i32, ptr addrspace(1) %176, align 4, !invariant.load !9
  %narrow64 = tail call i32 @llvm.smax.i32(i32 %177, i32 0)
  %178 = tail call i32 @llvm.umin.i32(i32 %narrow64, i32 191)
  %179 = getelementptr inbounds i8, ptr addrspace(1) %173, i64 8
  %180 = load i32, ptr addrspace(1) %179, align 4, !invariant.load !9
  %181 = icmp sgt i32 %180, 0
  %182 = zext nneg i32 %175 to i64
  %183 = zext nneg i32 %178 to i64
  %184 = zext i1 %181 to i64
  %185 = getelementptr inbounds [120 x [20 x [192 x [2 x double]]]], ptr addrspace(1) %arg096, i64 0, i64 %51, i64 %182, i64 %183, i64 %184
  %186 = load double, ptr addrspace(1) %185, align 8, !invariant.load !9
  %187 = select i1 %167, double %186, double 0.000000e+00
  %188 = insertelement <2 x double> poison, double %145, i32 0
  %189 = insertelement <2 x double> %188, double %187, i32 1
  store <2 x double> %189, ptr addrspace(1) %146, align 16
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}
!llvm.module.flags = !{!6}

!0 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!1 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 128}
!2 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_select_fusion, !"reqntidx", i32 128}
!4 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!5 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 128}
!6 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!7 = !{i32 0, i32 30}
!8 = !{i32 0, i32 128}
!9 = !{}
!10 = !{i32 0, i32 900}
