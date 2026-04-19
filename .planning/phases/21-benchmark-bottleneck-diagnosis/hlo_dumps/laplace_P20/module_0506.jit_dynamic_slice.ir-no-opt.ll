; ModuleID = 'jit_dynamic_slice'
source_filename = "jit_dynamic_slice"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [8 x i8] zeroinitializer

define void @loop_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(7372800) %arg0, ptr noalias align 16 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(3686400) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 115200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index0 = add nuw nsw i32 %linear_index_base, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index0, 1
  %6 = urem i32 %5, 192
  %7 = udiv i32 %linear_index0, 192
  %8 = urem i32 %7, 20
  %9 = udiv i32 %linear_index0, 3840
  %10 = urem i32 %9, 1
  %11 = udiv i32 %linear_index0, 3840
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %12 = udiv i32 %linear_index1, 1
  %13 = urem i32 %12, 1
  %14 = udiv i32 %linear_index1, 1
  %15 = urem i32 %14, 192
  %16 = udiv i32 %linear_index1, 192
  %17 = urem i32 %16, 20
  %18 = udiv i32 %linear_index1, 3840
  %19 = urem i32 %18, 1
  %20 = udiv i32 %linear_index1, 3840
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %21 = udiv i32 %linear_index2, 1
  %22 = urem i32 %21, 1
  %23 = udiv i32 %linear_index2, 1
  %24 = urem i32 %23, 192
  %25 = udiv i32 %linear_index2, 192
  %26 = urem i32 %25, 20
  %27 = udiv i32 %linear_index2, 3840
  %28 = urem i32 %27, 1
  %29 = udiv i32 %linear_index2, 3840
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %30 = udiv i32 %linear_index3, 1
  %31 = urem i32 %30, 1
  %32 = udiv i32 %linear_index3, 1
  %33 = urem i32 %32, 192
  %34 = udiv i32 %linear_index3, 192
  %35 = urem i32 %34, 20
  %36 = udiv i32 %linear_index3, 3840
  %37 = urem i32 %36, 1
  %38 = udiv i32 %linear_index3, 3840
  %39 = icmp ult i32 %linear_index_base, 460800
  br i1 %39, label %loop_dynamic_slice_fusion.in_bounds-true, label %loop_dynamic_slice_fusion.in_bounds-after

loop_dynamic_slice_fusion.in_bounds-after:        ; preds = %loop_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.in_bounds-true:         ; preds = %entry
  %constant_2 = load i64, ptr @0, align 8
  %40 = trunc i64 %constant_2 to i32
  %41 = icmp sge i32 0, %40
  %42 = select i1 %41, i32 0, i32 %40
  %43 = icmp sle i32 0, %42
  %dynamic-slice.2.1.start_idx0 = select i1 %43, i32 0, i32 %42
  %constant_21 = load i64, ptr @0, align 8
  %44 = trunc i64 %constant_21 to i32
  %45 = icmp sge i32 0, %44
  %46 = select i1 %45, i32 0, i32 %44
  %47 = icmp sle i32 0, %46
  %dynamic-slice.2.1.start_idx1 = select i1 %47, i32 0, i32 %46
  %constant_22 = load i64, ptr @0, align 8
  %48 = trunc i64 %constant_22 to i32
  %49 = icmp sge i32 0, %48
  %50 = select i1 %49, i32 0, i32 %48
  %51 = icmp sle i32 0, %50
  %dynamic-slice.2.1.start_idx2 = select i1 %51, i32 0, i32 %50
  %constant_23 = load i64, ptr @0, align 8
  %52 = trunc i64 %constant_23 to i32
  %53 = icmp sge i32 0, %52
  %54 = select i1 %53, i32 0, i32 %52
  %55 = icmp sle i32 0, %54
  %dynamic-slice.2.1.start_idx3 = select i1 %55, i32 0, i32 %54
  %56 = load i64, ptr %arg1, align 8, !invariant.load !4
  %57 = trunc i64 %56 to i32
  %58 = icmp sge i32 0, %57
  %59 = select i1 %58, i32 0, i32 %57
  %60 = icmp sle i32 1, %59
  %dynamic-slice.2.1.start_idx4 = select i1 %60, i32 1, i32 %59
  %61 = add i32 %dynamic-slice.2.1.start_idx0, %11
  %62 = add i32 %dynamic-slice.2.1.start_idx1, %10
  %63 = add i32 %dynamic-slice.2.1.start_idx2, %8
  %64 = add i32 %dynamic-slice.2.1.start_idx3, %6
  %65 = add i32 %dynamic-slice.2.1.start_idx4, %4
  %66 = getelementptr inbounds [120 x [1 x [20 x [192 x [2 x double]]]]], ptr %arg0, i32 0, i32 %61, i32 0, i32 %63, i32 %64, i32 %65
  %67 = load double, ptr %66, align 8, !invariant.load !4
  %68 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %69 = getelementptr inbounds double, ptr %68, i32 0
  store double %67, ptr %69, align 8
  %constant_24 = load i64, ptr @0, align 8
  %70 = trunc i64 %constant_24 to i32
  %71 = icmp sge i32 0, %70
  %72 = select i1 %71, i32 0, i32 %70
  %73 = icmp sle i32 0, %72
  %dynamic-slice.2.1.start_idx05 = select i1 %73, i32 0, i32 %72
  %constant_26 = load i64, ptr @0, align 8
  %74 = trunc i64 %constant_26 to i32
  %75 = icmp sge i32 0, %74
  %76 = select i1 %75, i32 0, i32 %74
  %77 = icmp sle i32 0, %76
  %dynamic-slice.2.1.start_idx17 = select i1 %77, i32 0, i32 %76
  %constant_28 = load i64, ptr @0, align 8
  %78 = trunc i64 %constant_28 to i32
  %79 = icmp sge i32 0, %78
  %80 = select i1 %79, i32 0, i32 %78
  %81 = icmp sle i32 0, %80
  %dynamic-slice.2.1.start_idx29 = select i1 %81, i32 0, i32 %80
  %constant_210 = load i64, ptr @0, align 8
  %82 = trunc i64 %constant_210 to i32
  %83 = icmp sge i32 0, %82
  %84 = select i1 %83, i32 0, i32 %82
  %85 = icmp sle i32 0, %84
  %dynamic-slice.2.1.start_idx311 = select i1 %85, i32 0, i32 %84
  %86 = load i64, ptr %arg1, align 8, !invariant.load !4
  %87 = trunc i64 %86 to i32
  %88 = icmp sge i32 0, %87
  %89 = select i1 %88, i32 0, i32 %87
  %90 = icmp sle i32 1, %89
  %dynamic-slice.2.1.start_idx412 = select i1 %90, i32 1, i32 %89
  %91 = add i32 %dynamic-slice.2.1.start_idx05, %20
  %92 = add i32 %dynamic-slice.2.1.start_idx17, %19
  %93 = add i32 %dynamic-slice.2.1.start_idx29, %17
  %94 = add i32 %dynamic-slice.2.1.start_idx311, %15
  %95 = add i32 %dynamic-slice.2.1.start_idx412, %13
  %96 = getelementptr inbounds [120 x [1 x [20 x [192 x [2 x double]]]]], ptr %arg0, i32 0, i32 %91, i32 0, i32 %93, i32 %94, i32 %95
  %97 = load double, ptr %96, align 8, !invariant.load !4
  %98 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %99 = getelementptr inbounds double, ptr %98, i32 1
  store double %97, ptr %99, align 8
  %constant_213 = load i64, ptr @0, align 8
  %100 = trunc i64 %constant_213 to i32
  %101 = icmp sge i32 0, %100
  %102 = select i1 %101, i32 0, i32 %100
  %103 = icmp sle i32 0, %102
  %dynamic-slice.2.1.start_idx014 = select i1 %103, i32 0, i32 %102
  %constant_215 = load i64, ptr @0, align 8
  %104 = trunc i64 %constant_215 to i32
  %105 = icmp sge i32 0, %104
  %106 = select i1 %105, i32 0, i32 %104
  %107 = icmp sle i32 0, %106
  %dynamic-slice.2.1.start_idx116 = select i1 %107, i32 0, i32 %106
  %constant_217 = load i64, ptr @0, align 8
  %108 = trunc i64 %constant_217 to i32
  %109 = icmp sge i32 0, %108
  %110 = select i1 %109, i32 0, i32 %108
  %111 = icmp sle i32 0, %110
  %dynamic-slice.2.1.start_idx218 = select i1 %111, i32 0, i32 %110
  %constant_219 = load i64, ptr @0, align 8
  %112 = trunc i64 %constant_219 to i32
  %113 = icmp sge i32 0, %112
  %114 = select i1 %113, i32 0, i32 %112
  %115 = icmp sle i32 0, %114
  %dynamic-slice.2.1.start_idx320 = select i1 %115, i32 0, i32 %114
  %116 = load i64, ptr %arg1, align 8, !invariant.load !4
  %117 = trunc i64 %116 to i32
  %118 = icmp sge i32 0, %117
  %119 = select i1 %118, i32 0, i32 %117
  %120 = icmp sle i32 1, %119
  %dynamic-slice.2.1.start_idx421 = select i1 %120, i32 1, i32 %119
  %121 = add i32 %dynamic-slice.2.1.start_idx014, %29
  %122 = add i32 %dynamic-slice.2.1.start_idx116, %28
  %123 = add i32 %dynamic-slice.2.1.start_idx218, %26
  %124 = add i32 %dynamic-slice.2.1.start_idx320, %24
  %125 = add i32 %dynamic-slice.2.1.start_idx421, %22
  %126 = getelementptr inbounds [120 x [1 x [20 x [192 x [2 x double]]]]], ptr %arg0, i32 0, i32 %121, i32 0, i32 %123, i32 %124, i32 %125
  %127 = load double, ptr %126, align 8, !invariant.load !4
  %128 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %129 = getelementptr inbounds double, ptr %128, i32 2
  store double %127, ptr %129, align 8
  %constant_222 = load i64, ptr @0, align 8
  %130 = trunc i64 %constant_222 to i32
  %131 = icmp sge i32 0, %130
  %132 = select i1 %131, i32 0, i32 %130
  %133 = icmp sle i32 0, %132
  %dynamic-slice.2.1.start_idx023 = select i1 %133, i32 0, i32 %132
  %constant_224 = load i64, ptr @0, align 8
  %134 = trunc i64 %constant_224 to i32
  %135 = icmp sge i32 0, %134
  %136 = select i1 %135, i32 0, i32 %134
  %137 = icmp sle i32 0, %136
  %dynamic-slice.2.1.start_idx125 = select i1 %137, i32 0, i32 %136
  %constant_226 = load i64, ptr @0, align 8
  %138 = trunc i64 %constant_226 to i32
  %139 = icmp sge i32 0, %138
  %140 = select i1 %139, i32 0, i32 %138
  %141 = icmp sle i32 0, %140
  %dynamic-slice.2.1.start_idx227 = select i1 %141, i32 0, i32 %140
  %constant_228 = load i64, ptr @0, align 8
  %142 = trunc i64 %constant_228 to i32
  %143 = icmp sge i32 0, %142
  %144 = select i1 %143, i32 0, i32 %142
  %145 = icmp sle i32 0, %144
  %dynamic-slice.2.1.start_idx329 = select i1 %145, i32 0, i32 %144
  %146 = load i64, ptr %arg1, align 8, !invariant.load !4
  %147 = trunc i64 %146 to i32
  %148 = icmp sge i32 0, %147
  %149 = select i1 %148, i32 0, i32 %147
  %150 = icmp sle i32 1, %149
  %dynamic-slice.2.1.start_idx430 = select i1 %150, i32 1, i32 %149
  %151 = add i32 %dynamic-slice.2.1.start_idx023, %38
  %152 = add i32 %dynamic-slice.2.1.start_idx125, %37
  %153 = add i32 %dynamic-slice.2.1.start_idx227, %35
  %154 = add i32 %dynamic-slice.2.1.start_idx329, %33
  %155 = add i32 %dynamic-slice.2.1.start_idx430, %31
  %156 = getelementptr inbounds [120 x [1 x [20 x [192 x [2 x double]]]]], ptr %arg0, i32 0, i32 %151, i32 0, i32 %153, i32 %154, i32 %155
  %157 = load double, ptr %156, align 8, !invariant.load !4
  %158 = getelementptr double, ptr %arg2, i32 %linear_index_base
  %159 = getelementptr inbounds double, ptr %158, i32 3
  store double %157, ptr %159, align 8
  br label %loop_dynamic_slice_fusion.in_bounds-after
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

!0 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 128}
!2 = !{i32 0, i32 900}
!3 = !{i32 0, i32 128}
!4 = !{}
