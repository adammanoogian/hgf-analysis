; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @loop_add_fusion_1(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 192
  %5 = udiv i32 %linear_index0, 192
  %6 = icmp ult i32 %linear_index, 3840
  br i1 %6, label %loop_add_fusion.1.in_bounds-true, label %loop_add_fusion.1.in_bounds-after

loop_add_fusion.1.in_bounds-after:                ; preds = %loop_add_fusion.1.in_bounds-true, %entry
  ret void

loop_add_fusion.1.in_bounds-true:                 ; preds = %entry
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !6
  %10 = getelementptr inbounds [20 x double], ptr %arg1, i32 0, i32 %5
  %11 = load double, ptr %10, align 8, !invariant.load !6
  %add.2.1 = fadd double %9, %11
  %12 = getelementptr double, ptr %arg2, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  store double %add.2.1, ptr %13, align 8
  br label %loop_add_fusion.1.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_add_fusion(ptr noalias align 16 dereferenceable(3686400) %arg0, ptr noalias align 16 dereferenceable(19200) %arg1, ptr noalias align 128 dereferenceable(3686400) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
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
  br i1 %23, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %24 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %25 = getelementptr inbounds double, ptr %24, i32 0
  %26 = load double, ptr %25, align 8, !invariant.load !6
  %27 = udiv i32 %linear_index0, 192
  %28 = getelementptr inbounds double, ptr %arg1, i32 %27
  %29 = load double, ptr %28, align 8, !invariant.load !6
  %add.3.1 = fadd double %26, %29
  %30 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %31 = getelementptr inbounds double, ptr %30, i32 0
  store double %add.3.1, ptr %31, align 8
  %32 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %33 = getelementptr inbounds double, ptr %32, i32 1
  %34 = load double, ptr %33, align 8, !invariant.load !6
  %35 = udiv i32 %linear_index1, 192
  %36 = getelementptr inbounds double, ptr %arg1, i32 %35
  %37 = load double, ptr %36, align 8, !invariant.load !6
  %add.3.11 = fadd double %34, %37
  %38 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %39 = getelementptr inbounds double, ptr %38, i32 1
  store double %add.3.11, ptr %39, align 8
  %40 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %41 = getelementptr inbounds double, ptr %40, i32 2
  %42 = load double, ptr %41, align 8, !invariant.load !6
  %43 = udiv i32 %linear_index2, 192
  %44 = getelementptr inbounds double, ptr %arg1, i32 %43
  %45 = load double, ptr %44, align 8, !invariant.load !6
  %add.3.12 = fadd double %42, %45
  %46 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %47 = getelementptr inbounds double, ptr %46, i32 2
  store double %add.3.12, ptr %47, align 8
  %48 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %49 = getelementptr inbounds double, ptr %48, i32 3
  %50 = load double, ptr %49, align 8, !invariant.load !6
  %51 = udiv i32 %linear_index3, 192
  %52 = getelementptr inbounds double, ptr %arg1, i32 %51
  %53 = load double, ptr %52, align 8, !invariant.load !6
  %add.3.13 = fadd double %50, %53
  %54 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %55 = getelementptr inbounds double, ptr %54, i32 3
  store double %add.3.13, ptr %55, align 8
  br label %loop_add_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!1 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 128}
!2 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 30}
!5 = !{i32 0, i32 128}
!6 = !{}
!7 = !{i32 0, i32 900}
