; ModuleID = 'jit_take_along_axis'
source_filename = "jit_take_along_axis"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg1) local_unnamed_addr #0 {
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
  %7 = getelementptr inbounds [4 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg115, i64 0, i64 %5, i64 %6, i64 0, i64 0
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
define void @loop_select_fusion(ptr noalias nocapture readonly align 16 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(9216) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(24) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg3) local_unnamed_addr #0 {
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
  %7 = getelementptr inbounds [4 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg114, i64 0, i64 %5, i64 %6, i64 0, i64 0
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
  %32 = tail call i32 @llvm.umin.i32(i32 %narrow, i32 3)
  %narrow4 = tail call i32 @llvm.smax.i32(i32 %17, i32 0)
  %33 = tail call i32 @llvm.umin.i32(i32 %narrow4, i32 191)
  %34 = icmp sgt i32 %23, 0
  %35 = zext nneg i32 %32 to i64
  %36 = zext nneg i32 %33 to i64
  %37 = zext i1 %34 to i64
  %38 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr addrspace(1) %arg012, i64 0, i64 %35, i64 %36, i64 %37
  %39 = load double, ptr addrspace(1) %38, align 8, !invariant.load !9
  %40 = select i1 %31, double %39, double 0x7FF8000000000000
  %41 = zext nneg i32 %linear_index to i64
  %42 = getelementptr double, ptr addrspace(1) %arg318, i64 %41
  store double %40, ptr addrspace(1) %42, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(294912) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(24) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg3) local_unnamed_addr #0 {
entry:
  %arg326 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg224 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg122 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg020 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = and i16 %3, 3
  %6 = zext nneg i16 %5 to i64
  %7 = zext nneg i16 %.decomposed to i64
  %8 = getelementptr inbounds [4 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg020, i64 0, i64 %6, i64 %7, i64 0, i64 0
  %9 = load i32, ptr addrspace(1) %8, align 4, !invariant.load !9
  %10 = sext i32 %9 to i64
  %11 = icmp sgt i32 %9, -1
  %12 = load <2 x i64>, ptr addrspace(1) %arg224, align 128, !invariant.load !9
  %13 = extractelement <2 x i64> %12, i32 0
  %14 = extractelement <2 x i64> %12, i32 1
  %15 = icmp sge i64 %13, %10
  %16 = and i1 %11, %15
  %17 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 4
  %18 = load i32, ptr addrspace(1) %17, align 4, !invariant.load !9
  %19 = sext i32 %18 to i64
  %20 = icmp sgt i32 %18, -1
  %21 = icmp sge i64 %14, %19
  %22 = and i1 %20, %21
  %23 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 8
  %24 = load i32, ptr addrspace(1) %23, align 4, !invariant.load !9
  %25 = sext i32 %24 to i64
  %26 = icmp sgt i32 %24, -1
  %27 = getelementptr inbounds i8, ptr addrspace(1) %arg224, i64 16
  %28 = load i64, ptr addrspace(1) %27, align 16, !invariant.load !9
  %29 = icmp sge i64 %28, %25
  %30 = and i1 %26, %29
  %31 = select i1 %30, i1 %22, i1 false
  %32 = select i1 %31, i1 %16, i1 false
  %.lhs.trunc10 = trunc nuw i32 %0 to i8
  %33 = udiv i8 %.lhs.trunc10, 6
  %urem18 = urem i16 %.lhs.trunc, 768
  %34 = udiv i16 %urem18, 192
  %35 = mul i16 %34, 192
  %.decomposed19 = sub i16 %urem18, %35
  %36 = zext nneg i16 %34 to i64
  %37 = zext nneg i16 %.decomposed19 to i64
  %38 = getelementptr inbounds [4 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg020, i64 0, i64 %36, i64 %37, i64 0, i64 0
  %39 = load i32, ptr addrspace(1) %38, align 4, !invariant.load !9
  %narrow = tail call i32 @llvm.smax.i32(i32 %39, i32 0)
  %40 = tail call i32 @llvm.umin.i32(i32 %narrow, i32 3)
  %41 = getelementptr inbounds i8, ptr addrspace(1) %38, i64 4
  %42 = load i32, ptr addrspace(1) %41, align 4, !invariant.load !9
  %narrow4 = tail call i32 @llvm.smax.i32(i32 %42, i32 0)
  %43 = tail call i32 @llvm.umin.i32(i32 %narrow4, i32 191)
  %44 = getelementptr inbounds i8, ptr addrspace(1) %38, i64 8
  %45 = load i32, ptr addrspace(1) %44, align 4, !invariant.load !9
  %46 = icmp sgt i32 %45, 0
  %47 = zext nneg i8 %33 to i64
  %48 = zext nneg i32 %40 to i64
  %49 = zext nneg i32 %43 to i64
  %50 = zext i1 %46 to i64
  %51 = getelementptr inbounds [24 x [4 x [192 x [2 x double]]]], ptr addrspace(1) %arg122, i64 0, i64 %47, i64 %48, i64 %49, i64 %50
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !9
  %53 = select i1 %32, double %52, double 0.000000e+00
  %54 = zext nneg i32 %linear_index to i64
  %55 = getelementptr double, ptr addrspace(1) %arg326, i64 %54
  store double %53, ptr addrspace(1) %55, align 8
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
!7 = !{i32 0, i32 6}
!8 = !{i32 0, i32 128}
!9 = !{}
!10 = !{i32 0, i32 144}
