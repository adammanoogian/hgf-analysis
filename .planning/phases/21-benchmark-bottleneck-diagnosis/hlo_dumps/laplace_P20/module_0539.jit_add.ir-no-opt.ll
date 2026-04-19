; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @wrapped_add(ptr noalias align 16 dereferenceable(3686400) %arg0, ptr noalias align 16 dereferenceable(3686400) %arg1, ptr noalias align 128 dereferenceable(3686400) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 256
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
  br i1 %31, label %wrapped_add.in_bounds-true, label %wrapped_add.in_bounds-after

wrapped_add.in_bounds-after:                      ; preds = %wrapped_add.in_bounds-true, %entry
  ret void

wrapped_add.in_bounds-true:                       ; preds = %entry
  %32 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %33 = getelementptr inbounds double, ptr %32, i32 0
  %34 = load double, ptr %33, align 8, !invariant.load !4
  %35 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %36 = getelementptr inbounds double, ptr %35, i32 0
  %37 = load double, ptr %36, align 8, !invariant.load !4
  %add.1.1 = fadd double %34, %37
  %38 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %39 = getelementptr inbounds double, ptr %38, i32 0
  store double %add.1.1, ptr %39, align 8
  %40 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %41 = getelementptr inbounds double, ptr %40, i32 1
  %42 = load double, ptr %41, align 8, !invariant.load !4
  %43 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %44 = getelementptr inbounds double, ptr %43, i32 1
  %45 = load double, ptr %44, align 8, !invariant.load !4
  %add.1.11 = fadd double %42, %45
  %46 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %47 = getelementptr inbounds double, ptr %46, i32 1
  store double %add.1.11, ptr %47, align 8
  %48 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %49 = getelementptr inbounds double, ptr %48, i32 2
  %50 = load double, ptr %49, align 8, !invariant.load !4
  %51 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %52 = getelementptr inbounds double, ptr %51, i32 2
  %53 = load double, ptr %52, align 8, !invariant.load !4
  %add.1.12 = fadd double %50, %53
  %54 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %55 = getelementptr inbounds double, ptr %54, i32 2
  store double %add.1.12, ptr %55, align 8
  %56 = getelementptr double, ptr %arg0, i32 %linear_index_base
  %57 = getelementptr inbounds double, ptr %56, i32 3
  %58 = load double, ptr %57, align 8, !invariant.load !4
  %59 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %60 = getelementptr inbounds double, ptr %59, i32 3
  %61 = load double, ptr %60, align 8, !invariant.load !4
  %add.1.13 = fadd double %58, %61
  %62 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %63 = getelementptr inbounds double, ptr %62, i32 3
  store double %add.1.13, ptr %63, align 8
  br label %wrapped_add.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!nvvm.annotations = !{!0, !1}

!0 = !{ptr @wrapped_add, !"kernel", i32 1}
!1 = !{ptr @wrapped_add, !"reqntidx", i32 256}
!2 = !{i32 0, i32 450}
!3 = !{i32 0, i32 256}
!4 = !{}
