; ModuleID = 'jit_sigmoid'
source_filename = "jit_sigmoid"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"

define void @loop_divide_multiply_fusion(ptr noalias align 16 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1, ptr noalias align 128 dereferenceable(6144) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 768
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index0, 4
  %6 = icmp ult i32 %linear_index, 768
  br i1 %6, label %loop_divide_multiply_fusion.in_bounds-true, label %loop_divide_multiply_fusion.in_bounds-after

loop_divide_multiply_fusion.in_bounds-after:      ; preds = %loop_divide_multiply_fusion.in_bounds-true, %entry
  ret void

loop_divide_multiply_fusion.in_bounds-true:       ; preds = %entry
  %constant_2_1 = load double, ptr @0, align 8
  %7 = getelementptr double, ptr %arg0, i32 %linear_index
  %8 = getelementptr inbounds double, ptr %7, i32 0
  %9 = load double, ptr %8, align 8, !invariant.load !4
  %10 = fneg double %9
  %11 = call double @__nv_exp(double %10)
  %add.1.3.clone.1 = fadd double %11, %constant_2_1
  %divide.1.1.clone.1 = fdiv double %constant_2_1, %add.1.3.clone.1
  %subtract.1.1 = fsub double %constant_2_1, %divide.1.1.clone.1
  %multiply.1.1 = fmul double %divide.1.1.clone.1, %subtract.1.1
  %12 = insertvalue { double, double } undef, double %multiply.1.1, 0
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

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1}

!0 = !{ptr @loop_divide_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_divide_multiply_fusion, !"reqntidx", i32 768}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 768}
!4 = !{}
