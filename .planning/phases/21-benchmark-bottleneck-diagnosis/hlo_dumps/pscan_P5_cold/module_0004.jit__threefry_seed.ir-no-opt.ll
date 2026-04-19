; ModuleID = 'jit__threefry_seed'
source_filename = "jit__threefry_seed"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] c" \00\00\00\00\00\00\00"
@1 = private unnamed_addr constant [8 x i8] c"\FF\FF\FF\FF\00\00\00\00"

define void @input_concatenate_fusion(ptr noalias align 16 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %input_concatenate_fusion.in_bounds-true, label %input_concatenate_fusion.in_bounds-after

input_concatenate_fusion.in_bounds-after:         ; preds = %input_concatenate_fusion.in_bounds-true, %entry
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = mul nuw nsw i32 %5, 1
  %linear_index1 = add nuw nsw i32 %7, %6
  %linear_index_in_range2 = icmp ult i32 %linear_index1, 1
  call void @llvm.assume(i1 %linear_index_in_range2)
  %linear_index03 = add nuw nsw i32 %linear_index1, 0
  %8 = udiv i32 %linear_index03, 1
  %9 = icmp ult i32 %linear_index1, 1
  br i1 %9, label %input_concatenate_fusion.in_bounds-true4, label %input_concatenate_fusion.in_bounds-after5

input_concatenate_fusion.in_bounds-after5:        ; preds = %input_concatenate_fusion.in_bounds-true4, %input_concatenate_fusion.in_bounds-after
  ret void

input_concatenate_fusion.in_bounds-true:          ; preds = %entry
  %10 = add i32 %3, 0
  %11 = load i64, ptr %arg0, align 8, !invariant.load !3
  %constant_3_1 = load i64, ptr @0, align 8
  %12 = lshr i64 %11, %constant_3_1
  %shft.chk = icmp ult i64 %constant_3_1, 64
  %13 = select i1 %shft.chk, i64 %12, i64 0
  %14 = trunc i64 %13 to i32
  %15 = getelementptr inbounds [2 x i32], ptr %arg1, i32 0, i32 %10
  store i32 %14, ptr %15, align 4
  br label %input_concatenate_fusion.in_bounds-after

input_concatenate_fusion.in_bounds-true4:         ; preds = %input_concatenate_fusion.in_bounds-after
  %16 = add i32 %8, 1
  %17 = load i64, ptr %arg0, align 8, !invariant.load !3
  %constant_2_1 = load i64, ptr @1, align 8
  %18 = and i64 %17, %constant_2_1
  %19 = trunc i64 %18 to i32
  %20 = getelementptr inbounds [2 x i32], ptr %arg1, i32 0, i32 %16
  store i32 %19, ptr %20, align 4
  br label %input_concatenate_fusion.in_bounds-after5
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

!0 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!1 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 1}
!2 = !{i32 0, i32 1}
!3 = !{}
