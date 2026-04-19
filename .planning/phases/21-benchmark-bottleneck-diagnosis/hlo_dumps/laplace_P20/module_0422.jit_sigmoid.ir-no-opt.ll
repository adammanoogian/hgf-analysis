; ModuleID = 'jit_sigmoid'
source_filename = "jit_sigmoid"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@1 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"

define void @loop_divide_multiply_fusion(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 20
  %5 = udiv i32 %linear_index0, 20
  %6 = icmp ult i32 %linear_index, 3840
  br i1 %6, label %loop_divide_multiply_fusion.in_bounds-true, label %loop_divide_multiply_fusion.in_bounds-after

loop_divide_multiply_fusion.in_bounds-after:      ; preds = %loop_divide_multiply_fusion.in_bounds-true, %entry
  ret void

loop_divide_multiply_fusion.in_bounds-true:       ; preds = %entry
  %constant_3_3 = load double, ptr @0, align 8
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !6
  %10 = fneg double %9
  %11 = call double @__nv_exp(double %10)
  %add.2.1.clone.1 = fadd double %11, %constant_3_3
  %divide.1.1.clone.1 = fdiv double %constant_3_3, %add.2.1.clone.1
  %subtract.1.2 = fsub double %constant_3_3, %divide.1.1.clone.1
  %multiply.4.1 = fmul double %divide.1.1.clone.1, %subtract.1.2
  %12 = insertvalue { double, double } undef, double %multiply.4.1, 0
  %13 = insertvalue { double, double } %12, double %divide.1.1.clone.1, 1
  %14 = extractvalue { double, double } %13, 0
  %15 = getelementptr double, ptr %arg1, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  store double %14, ptr %16, align 8
  %17 = extractvalue { double, double } %13, 1
  %18 = getelementptr double, ptr %arg2, i32 %linear_index
  %19 = getelementptr inbounds double, ptr %18, i32 0
  store double %17, ptr %19, align 8
  br label %loop_divide_multiply_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @loop_add_multiply_fusion(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(3686400) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2, ptr noalias align 128 dereferenceable(3686400) %arg3, ptr noalias align 128 dereferenceable(3686400) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
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
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 20
  %10 = udiv i32 %linear_index1, 20
  %11 = urem i32 %10, 192
  %12 = udiv i32 %linear_index1, 3840
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 20
  %15 = udiv i32 %linear_index2, 20
  %16 = urem i32 %15, 192
  %17 = udiv i32 %linear_index2, 3840
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 20
  %20 = udiv i32 %linear_index3, 20
  %21 = urem i32 %20, 192
  %22 = udiv i32 %linear_index3, 3840
  %23 = icmp ult i32 %linear_index_base, 460800
  br i1 %23, label %loop_add_multiply_fusion.in_bounds-true, label %loop_add_multiply_fusion.in_bounds-after

loop_add_multiply_fusion.in_bounds-after:         ; preds = %loop_add_multiply_fusion.in_bounds-true, %entry
  ret void

loop_add_multiply_fusion.in_bounds-true:          ; preds = %entry
  %24 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %25 = getelementptr inbounds double, ptr %24, i32 0
  %26 = load double, ptr %25, align 8, !invariant.load !6
  %27 = urem i32 %linear_index0, 3840
  %28 = getelementptr inbounds double, ptr %arg2, i32 %27
  %29 = load double, ptr %28, align 8, !invariant.load !6
  %multiply.5.1.clone.1 = fmul double %26, %29
  %30 = urem i32 %linear_index0, 3840
  %constant_3_1 = load double, ptr @1, align 8
  %31 = getelementptr inbounds double, ptr %arg0, i32 %30
  %32 = load double, ptr %31, align 8, !invariant.load !6
  %subtract.1.1 = fsub double %constant_3_1, %32
  %multiply.6.1 = fmul double %multiply.5.1.clone.1, %subtract.1.1
  %33 = urem i32 %linear_index0, 3840
  %34 = getelementptr inbounds double, ptr %arg0, i32 %33
  %35 = load double, ptr %34, align 8, !invariant.load !6
  %36 = fneg double %multiply.5.1.clone.1
  %multiply.7.1 = fmul double %35, %36
  %add.3.1 = fadd double %multiply.6.1, %multiply.7.1
  %37 = insertvalue { double, double } undef, double %add.3.1, 0
  %38 = insertvalue { double, double } %37, double %multiply.5.1.clone.1, 1
  %39 = extractvalue { double, double } %38, 0
  %40 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %41 = getelementptr inbounds double, ptr %40, i32 0
  store double %39, ptr %41, align 8
  %42 = extractvalue { double, double } %38, 1
  %43 = getelementptr double, ptr %arg4, i32 %linear_index_base
  %44 = getelementptr inbounds double, ptr %43, i32 0
  store double %42, ptr %44, align 8
  %45 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %46 = getelementptr inbounds double, ptr %45, i32 1
  %47 = load double, ptr %46, align 8, !invariant.load !6
  %48 = urem i32 %linear_index1, 3840
  %49 = getelementptr inbounds double, ptr %arg2, i32 %48
  %50 = load double, ptr %49, align 8, !invariant.load !6
  %multiply.5.1.clone.11 = fmul double %47, %50
  %51 = urem i32 %linear_index1, 3840
  %constant_3_12 = load double, ptr @1, align 8
  %52 = getelementptr inbounds double, ptr %arg0, i32 %51
  %53 = load double, ptr %52, align 8, !invariant.load !6
  %subtract.1.13 = fsub double %constant_3_12, %53
  %multiply.6.14 = fmul double %multiply.5.1.clone.11, %subtract.1.13
  %54 = urem i32 %linear_index1, 3840
  %55 = getelementptr inbounds double, ptr %arg0, i32 %54
  %56 = load double, ptr %55, align 8, !invariant.load !6
  %57 = fneg double %multiply.5.1.clone.11
  %multiply.7.15 = fmul double %56, %57
  %add.3.16 = fadd double %multiply.6.14, %multiply.7.15
  %58 = insertvalue { double, double } undef, double %add.3.16, 0
  %59 = insertvalue { double, double } %58, double %multiply.5.1.clone.11, 1
  %60 = extractvalue { double, double } %59, 0
  %61 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %62 = getelementptr inbounds double, ptr %61, i32 1
  store double %60, ptr %62, align 8
  %63 = extractvalue { double, double } %59, 1
  %64 = getelementptr double, ptr %arg4, i32 %linear_index_base
  %65 = getelementptr inbounds double, ptr %64, i32 1
  store double %63, ptr %65, align 8
  %66 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %67 = getelementptr inbounds double, ptr %66, i32 2
  %68 = load double, ptr %67, align 8, !invariant.load !6
  %69 = urem i32 %linear_index2, 3840
  %70 = getelementptr inbounds double, ptr %arg2, i32 %69
  %71 = load double, ptr %70, align 8, !invariant.load !6
  %multiply.5.1.clone.17 = fmul double %68, %71
  %72 = urem i32 %linear_index2, 3840
  %constant_3_18 = load double, ptr @1, align 8
  %73 = getelementptr inbounds double, ptr %arg0, i32 %72
  %74 = load double, ptr %73, align 8, !invariant.load !6
  %subtract.1.19 = fsub double %constant_3_18, %74
  %multiply.6.110 = fmul double %multiply.5.1.clone.17, %subtract.1.19
  %75 = urem i32 %linear_index2, 3840
  %76 = getelementptr inbounds double, ptr %arg0, i32 %75
  %77 = load double, ptr %76, align 8, !invariant.load !6
  %78 = fneg double %multiply.5.1.clone.17
  %multiply.7.111 = fmul double %77, %78
  %add.3.112 = fadd double %multiply.6.110, %multiply.7.111
  %79 = insertvalue { double, double } undef, double %add.3.112, 0
  %80 = insertvalue { double, double } %79, double %multiply.5.1.clone.17, 1
  %81 = extractvalue { double, double } %80, 0
  %82 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %83 = getelementptr inbounds double, ptr %82, i32 2
  store double %81, ptr %83, align 8
  %84 = extractvalue { double, double } %80, 1
  %85 = getelementptr double, ptr %arg4, i32 %linear_index_base
  %86 = getelementptr inbounds double, ptr %85, i32 2
  store double %84, ptr %86, align 8
  %87 = getelementptr double, ptr %arg1, i32 %linear_index_base
  %88 = getelementptr inbounds double, ptr %87, i32 3
  %89 = load double, ptr %88, align 8, !invariant.load !6
  %90 = urem i32 %linear_index3, 3840
  %91 = getelementptr inbounds double, ptr %arg2, i32 %90
  %92 = load double, ptr %91, align 8, !invariant.load !6
  %multiply.5.1.clone.113 = fmul double %89, %92
  %93 = urem i32 %linear_index3, 3840
  %constant_3_114 = load double, ptr @1, align 8
  %94 = getelementptr inbounds double, ptr %arg0, i32 %93
  %95 = load double, ptr %94, align 8, !invariant.load !6
  %subtract.1.115 = fsub double %constant_3_114, %95
  %multiply.6.116 = fmul double %multiply.5.1.clone.113, %subtract.1.115
  %96 = urem i32 %linear_index3, 3840
  %97 = getelementptr inbounds double, ptr %arg0, i32 %96
  %98 = load double, ptr %97, align 8, !invariant.load !6
  %99 = fneg double %multiply.5.1.clone.113
  %multiply.7.117 = fmul double %98, %99
  %add.3.118 = fadd double %multiply.6.116, %multiply.7.117
  %100 = insertvalue { double, double } undef, double %add.3.118, 0
  %101 = insertvalue { double, double } %100, double %multiply.5.1.clone.113, 1
  %102 = extractvalue { double, double } %101, 0
  %103 = getelementptr double, ptr %arg3, i32 %linear_index_base
  %104 = getelementptr inbounds double, ptr %103, i32 3
  store double %102, ptr %104, align 8
  %105 = extractvalue { double, double } %101, 1
  %106 = getelementptr double, ptr %arg4, i32 %linear_index_base
  %107 = getelementptr inbounds double, ptr %106, i32 3
  store double %105, ptr %107, align 8
  br label %loop_add_multiply_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @loop_divide_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_divide_multiply_fusion, !"reqntidx", i32 1024}
!2 = !{ptr @loop_add_multiply_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_multiply_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 4}
!5 = !{i32 0, i32 1024}
!6 = !{}
!7 = !{i32 0, i32 900}
!8 = !{i32 0, i32 128}
