; ModuleID = 'jit_clip'
source_filename = "jit_clip"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @loop_multiply_fusion(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(30720) %arg1, ptr noalias align 16 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(30720) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3840
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 3840
  %8 = icmp ult i32 %linear_index, 3840
  br i1 %8, label %loop_multiply_fusion.in_bounds-true, label %loop_multiply_fusion.in_bounds-after

loop_multiply_fusion.in_bounds-after:             ; preds = %loop_multiply_fusion.in_bounds-true, %entry
  ret void

loop_multiply_fusion.in_bounds-true:              ; preds = %entry
  %9 = getelementptr double, ptr %arg1, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !6
  %12 = getelementptr double, ptr %arg2, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  %14 = load double, ptr %13, align 8, !invariant.load !6
  %multiply.4.3 = fmul double %11, %14
  %15 = getelementptr double, ptr %arg0, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !6
  %multiply.5.1 = fmul double %multiply.4.3, %17
  %18 = getelementptr double, ptr %arg3, i32 %linear_index
  %19 = getelementptr inbounds double, ptr %18, i32 0
  store double %multiply.5.1, ptr %19, align 8
  br label %loop_multiply_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @loop_multiply_fusion_1(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(3686400) %arg1, ptr noalias align 16 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(3686400) %arg3) {
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
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 3840
  %8 = urem i32 %7, 1
  %9 = udiv i32 %linear_index0, 3840
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 20
  %12 = udiv i32 %linear_index1, 20
  %13 = urem i32 %12, 192
  %14 = udiv i32 %linear_index1, 3840
  %15 = urem i32 %14, 1
  %16 = udiv i32 %linear_index1, 3840
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 20
  %19 = udiv i32 %linear_index2, 20
  %20 = urem i32 %19, 192
  %21 = udiv i32 %linear_index2, 3840
  %22 = urem i32 %21, 1
  %23 = udiv i32 %linear_index2, 3840
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 20
  %26 = udiv i32 %linear_index3, 20
  %27 = urem i32 %26, 192
  %28 = udiv i32 %linear_index3, 3840
  %29 = urem i32 %28, 1
  %30 = udiv i32 %linear_index3, 3840
  %31 = icmp ult i32 %linear_index_base, 460800
  br i1 %31, label %loop_multiply_fusion.1.in_bounds-true, label %loop_multiply_fusion.1.in_bounds-after

loop_multiply_fusion.1.in_bounds-after:           ; preds = %loop_multiply_fusion.1.in_bounds-true, %entry
  ret void

loop_multiply_fusion.1.in_bounds-true:            ; preds = %entry
  %32 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %33 = getelementptr inbounds double, ptr %32, i32 0
  %34 = load double, ptr %33, align 8, !invariant.load !6
  %35 = urem i32 %linear_index0, 3840
  %36 = getelementptr inbounds double, ptr %arg2, i32 %35
  %37 = load double, ptr %36, align 8, !invariant.load !6
  %multiply.7.1 = fmul double %34, %37
  %38 = urem i32 %linear_index0, 3840
  %39 = getelementptr inbounds double, ptr %arg0, i32 %38
  %40 = load double, ptr %39, align 8, !invariant.load !6
  %multiply.8.1 = fmul double %multiply.7.1, %40
  %41 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %42 = getelementptr inbounds double, ptr %41, i32 0
  store double %multiply.8.1, ptr %42, align 8
  %43 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %44 = getelementptr inbounds double, ptr %43, i32 1
  %45 = load double, ptr %44, align 8, !invariant.load !6
  %46 = urem i32 %linear_index1, 3840
  %47 = getelementptr inbounds double, ptr %arg2, i32 %46
  %48 = load double, ptr %47, align 8, !invariant.load !6
  %multiply.7.11 = fmul double %45, %48
  %49 = urem i32 %linear_index1, 3840
  %50 = getelementptr inbounds double, ptr %arg0, i32 %49
  %51 = load double, ptr %50, align 8, !invariant.load !6
  %multiply.8.12 = fmul double %multiply.7.11, %51
  %52 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %53 = getelementptr inbounds double, ptr %52, i32 1
  store double %multiply.8.12, ptr %53, align 8
  %54 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %55 = getelementptr inbounds double, ptr %54, i32 2
  %56 = load double, ptr %55, align 8, !invariant.load !6
  %57 = urem i32 %linear_index2, 3840
  %58 = getelementptr inbounds double, ptr %arg2, i32 %57
  %59 = load double, ptr %58, align 8, !invariant.load !6
  %multiply.7.13 = fmul double %56, %59
  %60 = urem i32 %linear_index2, 3840
  %61 = getelementptr inbounds double, ptr %arg0, i32 %60
  %62 = load double, ptr %61, align 8, !invariant.load !6
  %multiply.8.14 = fmul double %multiply.7.13, %62
  %63 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %64 = getelementptr inbounds double, ptr %63, i32 2
  store double %multiply.8.14, ptr %64, align 8
  %65 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %66 = getelementptr inbounds double, ptr %65, i32 3
  %67 = load double, ptr %66, align 8, !invariant.load !6
  %68 = urem i32 %linear_index3, 3840
  %69 = getelementptr inbounds double, ptr %arg2, i32 %68
  %70 = load double, ptr %69, align 8, !invariant.load !6
  %multiply.7.15 = fmul double %67, %70
  %71 = urem i32 %linear_index3, 3840
  %72 = getelementptr inbounds double, ptr %arg0, i32 %71
  %73 = load double, ptr %72, align 8, !invariant.load !6
  %multiply.8.16 = fmul double %multiply.7.15, %73
  %74 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %75 = getelementptr inbounds double, ptr %74, i32 3
  store double %multiply.8.16, ptr %75, align 8
  br label %loop_multiply_fusion.1.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!2 = !{ptr @loop_multiply_fusion_1, !"kernel", i32 1}
!3 = !{ptr @loop_multiply_fusion_1, !"reqntidx", i32 128}
!4 = !{i32 0, i32 30}
!5 = !{i32 0, i32 128}
!6 = !{}
!7 = !{i32 0, i32 900}
