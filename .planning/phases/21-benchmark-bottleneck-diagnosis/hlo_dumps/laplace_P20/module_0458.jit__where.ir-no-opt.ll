; ModuleID = 'jit__where'
source_filename = "jit__where"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer
@1 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_select_fusion_1(ptr noalias align 16 dereferenceable(3840) %arg0, ptr noalias align 16 dereferenceable(30720) %arg1, ptr noalias align 16 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = icmp ult i32 %linear_index, 3840
  br i1 %6, label %loop_select_fusion.1.in_bounds-true, label %loop_select_fusion.1.in_bounds-after

loop_select_fusion.1.in_bounds-after:             ; preds = %loop_select_fusion.1.in_bounds-true, %entry
  ret void

loop_select_fusion.1.in_bounds-true:              ; preds = %entry
  %7 = getelementptr i8, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds i8, ptr %7, i32 0
  %9 = load i8, ptr %8, align 1, !invariant.load !8
  %10 = getelementptr double, ptr %arg1, i32 %linear_index
  %11 = getelementptr inbounds double, ptr %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !8
  %13 = load double, ptr %arg2, align 8, !invariant.load !8
  %14 = trunc i8 %9 to i1
  %15 = select i1 %14, double %12, double %13
  %16 = getelementptr double, ptr %arg3, i32 %linear_index
  %17 = getelementptr inbounds double, ptr %16, i32 0
  store double %15, ptr %17, align 8
  br label %loop_select_fusion.1.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_broadcast_fusion(ptr noalias align 128 dereferenceable(30720) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = icmp ult i32 %linear_index, 3840
  br i1 %6, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  %constant_5_2 = load double, ptr @0, align 8
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  store double %constant_5_2, ptr %8, align 8
  br label %loop_broadcast_fusion.in_bounds-after
}

define void @loop_select_fusion(ptr noalias align 16 dereferenceable(3686400) %arg0, ptr noalias align 16 dereferenceable(3840) %arg1, ptr noalias align 128 dereferenceable(3686400) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !10
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 115200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index0 = add nuw nsw i32 %linear_index_base, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = urem i32 %5, 20
  %7 = udiv i32 %linear_index0, 3840
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 192
  %10 = udiv i32 %linear_index1, 192
  %11 = urem i32 %10, 20
  %12 = udiv i32 %linear_index1, 3840
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 192
  %15 = udiv i32 %linear_index2, 192
  %16 = urem i32 %15, 20
  %17 = udiv i32 %linear_index2, 3840
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 192
  %20 = udiv i32 %linear_index3, 192
  %21 = urem i32 %20, 20
  %22 = udiv i32 %linear_index3, 3840
  %23 = icmp ult i32 %linear_index_base, 460800
  br i1 %23, label %loop_select_fusion.in_bounds-true, label %loop_select_fusion.in_bounds-after

loop_select_fusion.in_bounds-after:               ; preds = %loop_select_fusion.in_bounds-true, %entry
  ret void

loop_select_fusion.in_bounds-true:                ; preds = %entry
  %24 = urem i32 %linear_index0, 3840
  %25 = getelementptr inbounds i8, ptr %arg1, i32 %24
  %26 = load i8, ptr %25, align 1, !invariant.load !8
  %27 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %28 = getelementptr inbounds double, ptr %27, i32 0
  %29 = load double, ptr %28, align 8, !invariant.load !8
  %constant_5_1 = load double, ptr @1, align 8
  %30 = trunc i8 %26 to i1
  %31 = select i1 %30, double %29, double %constant_5_1
  %32 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %33 = getelementptr inbounds double, ptr %32, i32 0
  store double %31, ptr %33, align 8
  %34 = urem i32 %linear_index1, 3840
  %35 = getelementptr inbounds i8, ptr %arg1, i32 %34
  %36 = load i8, ptr %35, align 1, !invariant.load !8
  %37 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %38 = getelementptr inbounds double, ptr %37, i32 1
  %39 = load double, ptr %38, align 8, !invariant.load !8
  %constant_5_11 = load double, ptr @1, align 8
  %40 = trunc i8 %36 to i1
  %41 = select i1 %40, double %39, double %constant_5_11
  %42 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %43 = getelementptr inbounds double, ptr %42, i32 1
  store double %41, ptr %43, align 8
  %44 = urem i32 %linear_index2, 3840
  %45 = getelementptr inbounds i8, ptr %arg1, i32 %44
  %46 = load i8, ptr %45, align 1, !invariant.load !8
  %47 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %48 = getelementptr inbounds double, ptr %47, i32 2
  %49 = load double, ptr %48, align 8, !invariant.load !8
  %constant_5_12 = load double, ptr @1, align 8
  %50 = trunc i8 %46 to i1
  %51 = select i1 %50, double %49, double %constant_5_12
  %52 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %53 = getelementptr inbounds double, ptr %52, i32 2
  store double %51, ptr %53, align 8
  %54 = urem i32 %linear_index3, 3840
  %55 = getelementptr inbounds i8, ptr %arg1, i32 %54
  %56 = load i8, ptr %55, align 1, !invariant.load !8
  %57 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %58 = getelementptr inbounds double, ptr %57, i32 3
  %59 = load double, ptr %58, align 8, !invariant.load !8
  %constant_5_13 = load double, ptr @1, align 8
  %60 = trunc i8 %56 to i1
  %61 = select i1 %60, double %59, double %constant_5_13
  %62 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %63 = getelementptr inbounds double, ptr %62, i32 3
  store double %61, ptr %63, align 8
  br label %loop_select_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}

!0 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!1 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 1024}
!2 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 1024}
!4 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_select_fusion, !"reqntidx", i32 128}
!6 = !{i32 0, i32 4}
!7 = !{i32 0, i32 1024}
!8 = !{}
!9 = !{i32 0, i32 900}
!10 = !{i32 0, i32 128}
