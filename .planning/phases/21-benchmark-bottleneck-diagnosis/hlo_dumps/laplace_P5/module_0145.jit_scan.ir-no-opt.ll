; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_42_0 = constant [64 x i8] zeroinitializer, align 128
@0 = private unnamed_addr constant [1 x i8] zeroinitializer
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@2 = private unnamed_addr constant [8 x i8] zeroinitializer
@3 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@4 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@5 = private unnamed_addr constant [8 x i8] zeroinitializer
@6 = private unnamed_addr constant [4 x i8] zeroinitializer
@7 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@8 = private unnamed_addr constant [8 x i8] zeroinitializer
@9 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@10 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@11 = private unnamed_addr constant [8 x i8] zeroinitializer
@12 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@13 = private unnamed_addr constant [1 x i8] zeroinitializer
@14 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@15 = private unnamed_addr constant [8 x i8] zeroinitializer
@16 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@17 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@18 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@19 = private unnamed_addr constant [8 x i8] zeroinitializer
@20 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@21 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@22 = private unnamed_addr constant [8 x i8] zeroinitializer
@23 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@24 = private unnamed_addr constant [8 x i8] zeroinitializer
@25 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@26 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@27 = private unnamed_addr constant [8 x i8] zeroinitializer
@28 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@29 = private unnamed_addr constant [4 x i8] zeroinitializer
@30 = private unnamed_addr constant [8 x i8] zeroinitializer
@31 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@32 = private unnamed_addr constant [4 x i8] zeroinitializer
@33 = private unnamed_addr constant [8 x i8] zeroinitializer
@34 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@35 = private unnamed_addr constant [4 x i8] zeroinitializer
@36 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@37 = private unnamed_addr constant [8 x i8] zeroinitializer
@38 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@39 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@40 = private unnamed_addr constant [8 x i8] zeroinitializer
@41 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@42 = private unnamed_addr constant [8 x i8] zeroinitializer
@43 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@44 = private unnamed_addr constant [8 x i8] zeroinitializer
@45 = private unnamed_addr constant [8 x i8] zeroinitializer
@46 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@47 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@48 = private unnamed_addr constant [8 x i8] zeroinitializer
@49 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@50 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@51 = private unnamed_addr constant [8 x i8] zeroinitializer
@52 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@53 = private unnamed_addr constant [8 x i8] zeroinitializer
@54 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@55 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@56 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@57 = private unnamed_addr constant [8 x i8] zeroinitializer
@58 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@59 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@60 = private unnamed_addr constant [8 x i8] zeroinitializer
@61 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@62 = private unnamed_addr constant [8 x i8] zeroinitializer
@63 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@64 = private unnamed_addr constant [8 x i8] zeroinitializer
@65 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@66 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@67 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@68 = private unnamed_addr constant [8 x i8] zeroinitializer
@69 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@70 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@71 = private unnamed_addr constant [8 x i8] zeroinitializer
@72 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@73 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@74 = private unnamed_addr constant [8 x i8] zeroinitializer
@75 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@76 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@77 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@78 = private unnamed_addr constant [8 x i8] zeroinitializer
@79 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@80 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@81 = private unnamed_addr constant [8 x i8] zeroinitializer
@82 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@83 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@84 = private unnamed_addr constant [8 x i8] zeroinitializer
@85 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@86 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@87 = private unnamed_addr constant [8 x i8] zeroinitializer
@88 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@89 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@90 = private unnamed_addr constant [8 x i8] zeroinitializer
@91 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@92 = private unnamed_addr constant [8 x i8] zeroinitializer
@93 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@94 = private unnamed_addr constant [8 x i8] zeroinitializer
@95 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@96 = private unnamed_addr constant [8 x i8] zeroinitializer
@97 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@98 = private unnamed_addr constant [8 x i8] zeroinitializer
@99 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@100 = private unnamed_addr constant [8 x i8] zeroinitializer
@101 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@102 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@103 = private unnamed_addr constant [8 x i8] zeroinitializer
@104 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@105 = private unnamed_addr constant [8 x i8] zeroinitializer
@106 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@107 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@108 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@109 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@110 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@111 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@112 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@113 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@114 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@115 = private unnamed_addr constant [8 x i8] zeroinitializer
@116 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@117 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@118 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@119 = private unnamed_addr constant [8 x i8] zeroinitializer
@120 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@121 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@122 = private unnamed_addr constant [8 x i8] zeroinitializer
@123 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@124 = private unnamed_addr constant [8 x i8] zeroinitializer
@125 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@126 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@127 = private unnamed_addr constant [8 x i8] zeroinitializer
@128 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@129 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@130 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@131 = private unnamed_addr constant [8 x i8] zeroinitializer
@132 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@133 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@134 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@135 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@136 = private unnamed_addr constant [8 x i8] zeroinitializer
@137 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@138 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@139 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@140 = private unnamed_addr constant [8 x i8] zeroinitializer
@141 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@142 = private unnamed_addr constant [8 x i8] zeroinitializer
@143 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@144 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@145 = private unnamed_addr constant [8 x i8] zeroinitializer
@146 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@147 = private unnamed_addr constant [8 x i8] zeroinitializer
@148 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"

define void @input_slice_fusion(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(768) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !118
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1536
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1536
  br i1 %4, label %input_slice_fusion.in_bounds-true, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.in_bounds-true:                ; preds = %entry
  br label %concatenate.pivot.768.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 4
  %10 = udiv i32 %8, 4
  %11 = udiv i32 %10, 192
  %constant_45_3 = load i8, ptr @0, align 1
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.768.2
  %12 = phi i32 [ 768, %concatenate.pivot.768.2 ]
  %13 = sub nsw i32 %3, %12
  %14 = mul nuw nsw i32 %13, 1
  %15 = add nuw nsw i32 0, %14
  %16 = urem i32 %15, 4
  %17 = udiv i32 %15, 4
  %18 = udiv i32 %17, 192
  %constant_45_31 = load i8, ptr @0, align 1
  br label %concatenate.merge

concatenate.pivot.768.:                           ; preds = %input_slice_fusion.in_bounds-true
  %19 = icmp ult i32 %3, 768
  br i1 %19, label %concatenate.pivot.0., label %concatenate.pivot.768.2

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id0

concatenate.pivot.768.2:                          ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %20 = phi i8 [ %constant_45_3, %concat_index_from_operand_id0 ], [ %constant_45_31, %concat_index_from_operand_id1 ]
  %21 = icmp sge i32 %3, 0
  %22 = icmp slt i32 %3, 768
  %23 = and i1 %21, %22
  br i1 %23, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %24 = icmp sge i32 %3, 768
  %25 = icmp slt i32 %3, 1536
  %26 = and i1 %24, %25
  br i1 %26, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %27 = sub i32 %3, 0
  %28 = getelementptr inbounds [768 x i8], ptr %arg0, i32 0, i32 %27
  store i8 %20, ptr %28, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %29 = sub i32 %3, 768
  %30 = getelementptr inbounds [768 x i8], ptr %arg1, i32 0, i32 %29
  store i8 %20, ptr %30, align 1
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @copy_fusion_10(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(768) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !118
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1536
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1536
  br i1 %4, label %copy_fusion.10.in_bounds-true, label %copy_fusion.10.in_bounds-after

copy_fusion.10.in_bounds-after:                   ; preds = %slice1-after, %entry
  ret void

copy_fusion.10.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.768.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 4
  %10 = udiv i32 %8, 4
  %11 = udiv i32 %10, 192
  %12 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i32 0, i32 %10, i32 %9, i32 0
  %13 = load i8, ptr %12, align 1, !invariant.load !120
  br label %concatenate.4.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.768.1
  %14 = phi i32 [ 768, %concatenate.pivot.768.1 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 4
  %19 = udiv i32 %17, 4
  %20 = udiv i32 %19, 192
  %21 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i32 0, i32 %19, i32 %18, i32 0
  %22 = load i8, ptr %21, align 1, !invariant.load !120
  br label %concatenate.4.merge

concatenate.pivot.768.:                           ; preds = %copy_fusion.10.in_bounds-true
  %23 = icmp ult i32 %3, 768
  br i1 %23, label %concatenate.pivot.0., label %concatenate.pivot.768.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id0

concatenate.pivot.768.1:                          ; preds = %concatenate.pivot.768.
  br label %concat_index_from_operand_id1

concatenate.4.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %24 = phi i8 [ %13, %concat_index_from_operand_id0 ], [ %22, %concat_index_from_operand_id1 ]
  %25 = icmp sge i32 %3, 0
  %26 = icmp slt i32 %3, 768
  %27 = and i1 %25, %26
  br i1 %27, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.4.merge
  %28 = icmp sge i32 %3, 768
  %29 = icmp slt i32 %3, 1536
  %30 = and i1 %28, %29
  br i1 %30, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %copy_fusion.10.in_bounds-after

slice0-true:                                      ; preds = %concatenate.4.merge
  %31 = sub i32 %3, 0
  %32 = getelementptr inbounds [768 x i8], ptr %arg1, i32 0, i32 %31
  store i8 %24, ptr %32, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %33 = sub i32 %3, 768
  %34 = getelementptr inbounds [768 x i8], ptr %arg2, i32 0, i32 %33
  store i8 %24, ptr %34, align 1
  br label %slice1-after
}

define void @input_slice_fusion_1(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(3072) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !121
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1024
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 960
  br i1 %4, label %input_slice_fusion.1.in_bounds-true, label %input_slice_fusion.1.in_bounds-after

input_slice_fusion.1.in_bounds-after:             ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.1.in_bounds-true:              ; preds = %entry
  br label %concatenate.pivot.192.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %constant_49_3 = load i32, ptr @1, align 4
  br label %concatenate.1.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.192.2
  %7 = phi i32 [ 192, %concatenate.pivot.192.2 ]
  %8 = sub nsw i32 %3, %7
  %9 = mul nuw nsw i32 %8, 1
  %10 = add nuw nsw i32 0, %9
  %11 = urem i32 %10, 4
  %12 = udiv i32 %10, 4
  %13 = udiv i32 %12, 192
  %constant_49_31 = load i32, ptr @1, align 4
  br label %concatenate.1.merge

concatenate.pivot.192.:                           ; preds = %input_slice_fusion.1.in_bounds-true
  %14 = icmp ult i32 %3, 192
  br i1 %14, label %concatenate.pivot.0., label %concatenate.pivot.192.2

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id0

concatenate.pivot.192.2:                          ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id1

concatenate.1.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %15 = phi i32 [ %constant_49_3, %concat_index_from_operand_id0 ], [ %constant_49_31, %concat_index_from_operand_id1 ]
  %16 = icmp sge i32 %3, 0
  %17 = icmp slt i32 %3, 192
  %18 = and i1 %16, %17
  br i1 %18, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.1.merge
  %19 = icmp sge i32 %3, 192
  %20 = icmp slt i32 %3, 960
  %21 = and i1 %19, %20
  br i1 %21, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.1.in_bounds-after

slice0-true:                                      ; preds = %concatenate.1.merge
  %22 = sub i32 %3, 0
  %23 = getelementptr inbounds [192 x i32], ptr %arg0, i32 0, i32 %22
  store i32 %15, ptr %23, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %24 = sub i32 %3, 192
  %25 = getelementptr inbounds [768 x i32], ptr %arg1, i32 0, i32 %24
  store i32 %15, ptr %25, align 4
  br label %slice1-after
}

define void @input_slice_fusion_2(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(6144) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !121
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1024
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 960
  br i1 %4, label %input_slice_fusion.2.in_bounds-true, label %input_slice_fusion.2.in_bounds-after

input_slice_fusion.2.in_bounds-after:             ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.2.in_bounds-true:              ; preds = %entry
  br label %concatenate.pivot.192.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %constant_43_3 = load double, ptr @2, align 8
  br label %concatenate.2.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.192.2
  %7 = phi i32 [ 192, %concatenate.pivot.192.2 ]
  %8 = sub nsw i32 %3, %7
  %9 = mul nuw nsw i32 %8, 1
  %10 = add nuw nsw i32 0, %9
  %11 = urem i32 %10, 4
  %12 = udiv i32 %10, 4
  %13 = udiv i32 %12, 192
  %constant_43_31 = load double, ptr @2, align 8
  br label %concatenate.2.merge

concatenate.pivot.192.:                           ; preds = %input_slice_fusion.2.in_bounds-true
  %14 = icmp ult i32 %3, 192
  br i1 %14, label %concatenate.pivot.0., label %concatenate.pivot.192.2

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id0

concatenate.pivot.192.2:                          ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id1

concatenate.2.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %15 = phi double [ %constant_43_3, %concat_index_from_operand_id0 ], [ %constant_43_31, %concat_index_from_operand_id1 ]
  %16 = icmp sge i32 %3, 0
  %17 = icmp slt i32 %3, 192
  %18 = and i1 %16, %17
  br i1 %18, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.2.merge
  %19 = icmp sge i32 %3, 192
  %20 = icmp slt i32 %3, 960
  %21 = and i1 %19, %20
  br i1 %21, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.2.in_bounds-after

slice0-true:                                      ; preds = %concatenate.2.merge
  %22 = sub i32 %3, 0
  %23 = getelementptr inbounds [192 x double], ptr %arg0, i32 0, i32 %22
  store double %15, ptr %23, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %24 = sub i32 %3, 192
  %25 = getelementptr inbounds [768 x double], ptr %arg1, i32 0, i32 %24
  store double %15, ptr %25, align 8
  br label %slice1-after
}

define void @loop_compare_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_compare_fusion.in_bounds-true, label %loop_compare_fusion.in_bounds-after

loop_compare_fusion.in_bounds-after:              ; preds = %loop_compare_fusion.in_bounds-true, %entry
  ret void

loop_compare_fusion.in_bounds-true:               ; preds = %entry
  %4 = load i64, ptr %arg0, align 8, !invariant.load !120
  %constant_352_1 = load i64, ptr @3, align 8
  %5 = icmp slt i64 %4, %constant_352_1
  %6 = zext i1 %5 to i8
  store i8 %6, ptr %arg1, align 1
  br label %loop_compare_fusion.in_bounds-after
}

define void @loop_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %loop_dynamic_slice_fusion.in_bounds-true, label %loop_dynamic_slice_fusion.in_bounds-after

loop_dynamic_slice_fusion.in_bounds-after:        ; preds = %loop_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_dynamic_slice_fusion.in_bounds-true:         ; preds = %entry
  %5 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_357_62 = load i64, ptr @5, align 8
  %6 = icmp slt i64 %5, %constant_357_62
  %7 = zext i1 %6 to i8
  %8 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_356_4 = load i64, ptr @4, align 8
  %9 = add i64 %8, %constant_356_4
  %10 = load i64, ptr %arg1, align 8, !invariant.load !120
  %11 = trunc i8 %7 to i1
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.39.80.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.39.80.start_idx0, %3
  %18 = getelementptr inbounds [192 x double], ptr %arg0, i32 0, i32 %17
  %19 = load double, ptr %18, align 8, !invariant.load !120
  %20 = getelementptr double, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %19, ptr %21, align 8
  br label %loop_dynamic_slice_fusion.in_bounds-after
}

define void @loop_convert_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(4) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %loop_convert_dynamic_slice_fusion.in_bounds-true, label %loop_convert_dynamic_slice_fusion.in_bounds-after

loop_convert_dynamic_slice_fusion.in_bounds-after: ; preds = %loop_convert_dynamic_slice_fusion.in_bounds-true, %entry
  ret void

loop_convert_dynamic_slice_fusion.in_bounds-true: ; preds = %entry
  %5 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_357_63 = load i64, ptr @8, align 8
  %6 = icmp slt i64 %5, %constant_357_63
  %7 = zext i1 %6 to i8
  %8 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_356_5 = load i64, ptr @7, align 8
  %9 = add i64 %8, %constant_356_5
  %10 = load i64, ptr %arg1, align 8, !invariant.load !120
  %11 = trunc i8 %7 to i1
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.40.28.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.40.28.start_idx0, %3
  %18 = getelementptr inbounds [192 x i32], ptr %arg0, i32 0, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !120
  %20 = insertvalue { i32, i32 } undef, i32 %19, 0
  %21 = getelementptr i32, ptr @6, i32 %linear_index
  %constant_360_1_clone_1 = getelementptr inbounds i32, ptr %21, i32 0
  %constant_360_1_clone_11 = load i32, ptr %constant_360_1_clone_1, align 4
  %22 = icmp ne i32 %19, %constant_360_1_clone_11
  %23 = zext i1 %22 to i8
  %24 = zext i8 %23 to i32
  %25 = insertvalue { i32, i32 } %20, i32 %24, 1
  %26 = extractvalue { i32, i32 } %25, 0
  %27 = getelementptr i32, ptr %arg2, i32 %linear_index
  %28 = getelementptr inbounds i32, ptr %27, i32 0
  store i32 %26, ptr %28, align 4
  %29 = extractvalue { i32, i32 } %25, 1
  %30 = getelementptr i32, ptr %arg3, i32 %linear_index
  %31 = getelementptr inbounds i32, ptr %30, i32 0
  store i32 %29, ptr %31, align 4
  br label %loop_convert_dynamic_slice_fusion.in_bounds-after
}

define void @loop_divide_multiply_fusion(ptr noalias align 16 dereferenceable(32) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4, ptr noalias align 128 dereferenceable(8) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(32) %arg7, ptr noalias align 16 dereferenceable(32) %arg8, ptr noalias align 128 dereferenceable(32) %arg9, ptr noalias align 128 dereferenceable(32) %arg10, ptr noalias align 128 dereferenceable(32) %arg11, ptr noalias align 128 dereferenceable(32) %arg12, ptr noalias align 128 dereferenceable(32) %arg13) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_divide_multiply_fusion.in_bounds-true, label %loop_divide_multiply_fusion.in_bounds-after

loop_divide_multiply_fusion.in_bounds-after:      ; preds = %loop_divide_multiply_fusion.in_bounds-true, %entry
  ret void

loop_divide_multiply_fusion.in_bounds-true:       ; preds = %entry
  %constant_358_5 = load double, ptr @9, align 8
  %5 = getelementptr double, ptr %arg6, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !120
  %divide.391.1.clone.1 = fdiv double %constant_358_5, %7
  %8 = load i64, ptr %arg5, align 8, !invariant.load !120
  %constant_357_2 = load i64, ptr @11, align 8
  %9 = icmp slt i64 %8, %constant_357_2
  %10 = zext i1 %9 to i8
  %11 = load i64, ptr %arg5, align 8, !invariant.load !120
  %constant_356_1 = load i64, ptr @10, align 8
  %12 = add i64 %11, %constant_356_1
  %13 = load i64, ptr %arg5, align 8, !invariant.load !120
  %14 = trunc i8 %10 to i1
  %15 = select i1 %14, i64 %12, i64 %13
  %16 = trunc i64 %15 to i32
  %17 = icmp sge i32 0, %16
  %18 = select i1 %17, i32 0, i32 %16
  %19 = icmp sle i32 191, %18
  %dynamic-slice.39.61.start_idx0 = select i1 %19, i32 191, i32 %18
  %20 = add i32 %dynamic-slice.39.61.start_idx0, 0
  %21 = getelementptr inbounds [192 x double], ptr %arg4, i32 0, i32 %20
  %22 = load double, ptr %21, align 8, !invariant.load !120
  %23 = getelementptr double, ptr %arg1, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  %25 = load double, ptr %24, align 8, !invariant.load !120
  %26 = getelementptr double, ptr %arg3, i32 %linear_index
  %27 = getelementptr inbounds double, ptr %26, i32 0
  %28 = load double, ptr %27, align 8, !invariant.load !120
  %29 = getelementptr double, ptr %arg2, i32 %linear_index
  %30 = getelementptr inbounds double, ptr %29, i32 0
  %31 = load double, ptr %30, align 8, !invariant.load !120
  %multiply.852.21 = fmul double %28, %31
  %add.342.19 = fadd double %25, %multiply.852.21
  %32 = call double @__nv_exp(double %add.342.19)
  %multiply.853.15 = fmul double %22, %32
  %constant_359_14 = load double, ptr @12, align 8
  %compare.265.15 = fcmp ogt double %multiply.853.15, %constant_359_14
  %33 = zext i1 %compare.265.15 to i8
  %34 = getelementptr double, ptr %arg0, i32 %linear_index
  %35 = getelementptr inbounds double, ptr %34, i32 0
  %36 = load double, ptr %35, align 8, !invariant.load !120
  %37 = trunc i8 %33 to i1
  %38 = select i1 %37, double %multiply.853.15, double %36
  %add.343.2 = fadd double %divide.391.1.clone.1, %38
  %divide.392.1 = fdiv double %constant_358_5, %add.343.2
  %39 = insertvalue { double, double, double, double } undef, double %divide.392.1, 0
  %40 = insertvalue { double, double, double, double } %39, double %divide.391.1.clone.1, 1
  %41 = getelementptr double, ptr %arg8, i32 %linear_index
  %42 = getelementptr inbounds double, ptr %41, i32 0
  %43 = load double, ptr %42, align 8, !invariant.load !120
  %44 = getelementptr double, ptr %arg9, i32 %linear_index
  %45 = getelementptr inbounds double, ptr %44, i32 0
  %46 = load double, ptr %45, align 8, !invariant.load !120
  %multiply.848.7.clone.1.clone.1 = fmul double %43, %46
  %47 = getelementptr double, ptr %arg7, i32 %linear_index
  %48 = getelementptr inbounds double, ptr %47, i32 0
  %49 = load double, ptr %48, align 8, !invariant.load !120
  %multiply.849.9.clone.1.clone.1 = fmul double %22, %49
  %add.340.7.clone.1.clone.1 = fadd double %multiply.848.7.clone.1.clone.1, %multiply.849.9.clone.1.clone.1
  %50 = fneg double %add.340.7.clone.1.clone.1
  %51 = call double @__nv_exp(double %50)
  %add.341.1.clone.1.clone.1 = fadd double %51, %constant_358_5
  %divide.390.1.clone.1.clone.1 = fdiv double %constant_358_5, %add.341.1.clone.1.clone.1
  %subtract.76.5.clone.1 = fsub double %constant_358_5, %divide.390.1.clone.1.clone.1
  %multiply.850.1.clone.1 = fmul double %divide.390.1.clone.1.clone.1, %subtract.76.5.clone.1
  %52 = insertvalue { double, double, double, double } %40, double %multiply.850.1.clone.1, 2
  %53 = insertvalue { double, double, double, double } %52, double %divide.390.1.clone.1.clone.1, 3
  %54 = extractvalue { double, double, double, double } %53, 0
  %55 = getelementptr double, ptr %arg10, i32 %linear_index
  %56 = getelementptr inbounds double, ptr %55, i32 0
  store double %54, ptr %56, align 8
  %57 = extractvalue { double, double, double, double } %53, 1
  %58 = getelementptr double, ptr %arg11, i32 %linear_index
  %59 = getelementptr inbounds double, ptr %58, i32 0
  store double %57, ptr %59, align 8
  %60 = extractvalue { double, double, double, double } %53, 2
  %61 = getelementptr double, ptr %arg12, i32 %linear_index
  %62 = getelementptr inbounds double, ptr %61, i32 0
  store double %60, ptr %62, align 8
  %63 = extractvalue { double, double, double, double } %53, 3
  %64 = getelementptr double, ptr %arg13, i32 %linear_index
  %65 = getelementptr inbounds double, ptr %64, i32 0
  store double %63, ptr %65, align 8
  br label %loop_divide_multiply_fusion.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @loop_broadcast_fusion(ptr noalias align 128 dereferenceable(4) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  %constant_288_1 = load i8, ptr @13, align 1
  %5 = getelementptr i8, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds i8, ptr %5, i32 0
  store i8 %constant_288_1, ptr %6, align 1
  br label %loop_broadcast_fusion.in_bounds-after
}

define void @loop_divide_exponential_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 128 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_divide_exponential_fusion.in_bounds-true, label %loop_divide_exponential_fusion.in_bounds-after

loop_divide_exponential_fusion.in_bounds-after:   ; preds = %loop_divide_exponential_fusion.in_bounds-true, %entry
  ret void

loop_divide_exponential_fusion.in_bounds-true:    ; preds = %entry
  %constant_17_2 = load double, ptr @14, align 8
  %5 = getelementptr double, ptr %arg1, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !120
  %divide.385.7 = fdiv double %constant_17_2, %7
  %8 = load double, ptr %arg0, align 8, !invariant.load !120
  %9 = getelementptr double, ptr %arg2, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !120
  %12 = getelementptr double, ptr %arg4, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  %14 = load double, ptr %13, align 8, !invariant.load !120
  %15 = getelementptr double, ptr %arg3, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !120
  %multiply.841.5.clone.1 = fmul double %14, %17
  %add.335.3.clone.1 = fadd double %11, %multiply.841.5.clone.1
  %18 = call double @__nv_exp(double %add.335.3.clone.1)
  %multiply.842.5 = fmul double %8, %18
  %add.336.5 = fadd double %divide.385.7, %multiply.842.5
  %divide.387.1 = fdiv double %constant_17_2, %add.336.5
  %19 = insertvalue { double, double, double, double } undef, double %divide.387.1, 0
  %20 = getelementptr double, ptr %arg1, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  %22 = load double, ptr %21, align 8, !invariant.load !120
  %23 = getelementptr double, ptr %arg1, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  %25 = load double, ptr %24, align 8, !invariant.load !120
  %multiply.843.1.clone.1 = fmul double %22, %25
  %divide.388.1.clone.1 = fdiv double %constant_17_2, %multiply.843.1.clone.1
  %26 = insertvalue { double, double, double, double } %19, double %divide.388.1.clone.1, 1
  %multiply.844.1.clone.1 = fmul double %add.336.5, %add.336.5
  %divide.389.1.clone.1 = fdiv double %constant_17_2, %multiply.844.1.clone.1
  %27 = insertvalue { double, double, double, double } %26, double %divide.389.1.clone.1, 2
  %28 = insertvalue { double, double, double, double } %27, double %18, 3
  %29 = extractvalue { double, double, double, double } %28, 0
  %30 = getelementptr double, ptr %arg5, i32 %linear_index
  %31 = getelementptr inbounds double, ptr %30, i32 0
  store double %29, ptr %31, align 8
  %32 = extractvalue { double, double, double, double } %28, 1
  %33 = getelementptr double, ptr %arg6, i32 %linear_index
  %34 = getelementptr inbounds double, ptr %33, i32 0
  store double %32, ptr %34, align 8
  %35 = extractvalue { double, double, double, double } %28, 2
  %36 = getelementptr double, ptr %arg7, i32 %linear_index
  %37 = getelementptr inbounds double, ptr %36, i32 0
  store double %35, ptr %37, align 8
  %38 = extractvalue { double, double, double, double } %28, 3
  %39 = getelementptr double, ptr %arg8, i32 %linear_index
  %40 = getelementptr inbounds double, ptr %39, i32 0
  store double %38, ptr %40, align 8
  br label %loop_divide_exponential_fusion.in_bounds-after
}

define void @wrapped_convert(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(8) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %wrapped_convert.in_bounds-true, label %wrapped_convert.in_bounds-after

wrapped_convert.in_bounds-after:                  ; preds = %wrapped_convert.in_bounds-true, %entry
  ret void

wrapped_convert.in_bounds-true:                   ; preds = %entry
  %4 = load i32, ptr %arg0, align 4, !invariant.load !120
  %5 = sitofp i32 %4 to double
  store double %5, ptr %arg1, align 8
  br label %wrapped_convert.in_bounds-after
}

define void @loop_broadcast_fusion_1(ptr noalias align 128 dereferenceable(32) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_broadcast_fusion.1.in_bounds-true, label %loop_broadcast_fusion.1.in_bounds-after

loop_broadcast_fusion.1.in_bounds-after:          ; preds = %loop_broadcast_fusion.1.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.1.in_bounds-true:           ; preds = %entry
  %constant_335_1 = load double, ptr @15, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_335_1, ptr %6, align 8
  br label %loop_broadcast_fusion.1.in_bounds-after
}

define void @loop_compare_multiply_select_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(4) %arg5, ptr noalias align 128 dereferenceable(32) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_compare_multiply_select_fusion.in_bounds-true, label %loop_compare_multiply_select_fusion.in_bounds-after

loop_compare_multiply_select_fusion.in_bounds-after: ; preds = %loop_compare_multiply_select_fusion.in_bounds-true, %entry
  ret void

loop_compare_multiply_select_fusion.in_bounds-true: ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !120
  %8 = getelementptr double, ptr %arg3, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !120
  %11 = getelementptr double, ptr %arg3, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !120
  %multiply.845.5.clone.1 = fmul double %10, %13
  %14 = getelementptr double, ptr %arg2, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !120
  %multiply.846.9.clone.1 = fmul double %multiply.845.5.clone.1, %16
  %17 = load double, ptr %arg1, align 8, !invariant.load !120
  %multiply.847.7.clone.1 = fmul double %multiply.846.9.clone.1, %17
  %add.337.5.clone.1 = fadd double %7, %multiply.847.7.clone.1
  %constant_22_1_clone_1 = load double, ptr @16, align 8
  %compare.262.1.clone.1 = fcmp ogt double %add.337.5.clone.1, %constant_22_1_clone_1
  %18 = zext i1 %compare.262.1.clone.1 to i8
  %constant_23_1 = load double, ptr @17, align 8
  %19 = trunc i8 %18 to i1
  %20 = select i1 %19, double %add.337.5.clone.1, double %constant_23_1
  %21 = insertvalue { double, i8, double } undef, double %20, 0
  %22 = insertvalue { double, i8, double } %21, i8 %18, 1
  %23 = insertvalue { double, i8, double } %22, double %multiply.845.5.clone.1, 2
  %24 = extractvalue { double, i8, double } %23, 0
  %25 = getelementptr double, ptr %arg4, i32 %linear_index
  %26 = getelementptr inbounds double, ptr %25, i32 0
  store double %24, ptr %26, align 8
  %27 = extractvalue { double, i8, double } %23, 1
  %28 = getelementptr i8, ptr %arg5, i32 %linear_index
  %29 = getelementptr inbounds i8, ptr %28, i32 0
  store i8 %27, ptr %29, align 1
  %30 = extractvalue { double, i8, double } %23, 2
  %31 = getelementptr double, ptr %arg6, i32 %linear_index
  %32 = getelementptr inbounds double, ptr %31, i32 0
  store double %30, ptr %32, align 8
  br label %loop_compare_multiply_select_fusion.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_30(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.618 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_56 = load i64, ptr @19, align 8
  %0 = icmp slt i64 %param_2.618, %constant_357_56
  %1 = zext i1 %0 to i8
  %param_2.6181 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_38 = load i64, ptr @18, align 8
  %2 = add i64 %param_2.6181, %constant_356_38
  %param_2.6182 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6182
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_563 = load i64, ptr @19, align 8
  %9 = icmp sge i64 0, %constant_357_563
  %10 = select i1 %9, i64 0, i64 %constant_357_563
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.887.1.in_bounds-true, label %dynamic-update-slice.887.1.in_bounds-after

dynamic-update-slice.887.1.in_bounds-after:       ; preds = %dynamic-update-slice.887.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.887.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i8, ptr %arg1, i64 %linear_index
  %param_1.705 = getelementptr inbounds i8, ptr %22, i64 0
  %param_1.7054 = load i8, ptr %param_1.705, align 1, !invariant.load !120
  %23 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %param_1.7054, ptr %23, align 1
  br label %dynamic-update-slice.887.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_45(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(1536) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %param_5.445 = load i64, ptr %arg5, align 8, !invariant.load !120
  %constant_357_38 = load i64, ptr @22, align 8
  %0 = icmp slt i64 %param_5.445, %constant_357_38
  %1 = zext i1 %0 to i8
  %param_5.4451 = load i64, ptr %arg5, align 8, !invariant.load !120
  %constant_356_20 = load i64, ptr @21, align 8
  %2 = add i64 %param_5.4451, %constant_356_20
  %param_5.4452 = load i64, ptr %arg5, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_5.4452
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_383 = load i64, ptr @22, align 8
  %9 = icmp sge i64 0, %constant_357_383
  %10 = select i1 %9, i64 0, i64 %constant_357_383
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.871.1.in_bounds-true, label %dynamic-update-slice.871.1.in_bounds-after

dynamic-update-slice.871.1.in_bounds-after:       ; preds = %dynamic-update-slice.871.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.871.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_5.4454 = load i64, ptr %arg5, align 8, !invariant.load !120
  %constant_357_385 = load i64, ptr @22, align 8
  %22 = icmp slt i64 %param_5.4454, %constant_357_385
  %23 = zext i1 %22 to i8
  %param_5.4456 = load i64, ptr %arg5, align 8, !invariant.load !120
  %constant_356_207 = load i64, ptr @21, align 8
  %24 = add i64 %param_5.4456, %constant_356_207
  %param_5.4458 = load i64, ptr %arg5, align 8, !invariant.load !120
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_5.4458
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.39.6.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.39.6.start_idx0, 0
  %param_1.720 = getelementptr inbounds [192 x double], ptr %arg1, i64 0, i64 %30
  %param_1.7209 = load double, ptr %param_1.720, align 8, !invariant.load !120
  %31 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.640 = getelementptr inbounds double, ptr %31, i64 0
  %param_2.64010 = load double, ptr %param_2.640, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.540 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.54011 = load double, ptr %param_4.540, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.612 = getelementptr inbounds double, ptr %33, i64 0
  %param_3.61212 = load double, ptr %param_3.612, align 8, !invariant.load !120
  %multiply.852.9 = fmul double %param_4.54011, %param_3.61212
  %add.342.7 = fadd double %param_2.64010, %multiply.852.9
  %34 = call double @__nv_exp(double %add.342.7)
  %multiply.853.5 = fmul double %param_1.7209, %34
  %constant_359_6 = load double, ptr @20, align 8
  %compare.265.3 = fcmp ogt double %multiply.853.5, %constant_359_6
  %35 = zext i1 %compare.265.3 to i8
  %36 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %35, ptr %36, align 1
  br label %dynamic-update-slice.871.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_8(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.652 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_60 = load i64, ptr @24, align 8
  %0 = icmp slt i64 %param_2.652, %constant_357_60
  %1 = zext i1 %0 to i8
  %param_2.6521 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_2 = load i64, ptr @25, align 8
  %2 = add i64 %param_2.6521, %constant_356_2
  %param_2.6522 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6522
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_603 = load i64, ptr @24, align 8
  %9 = icmp sge i64 0, %constant_357_603
  %10 = select i1 %9, i64 0, i64 %constant_357_603
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_357_604 = load i64, ptr @24, align 8
  %13 = icmp sge i64 0, %constant_357_604
  %14 = select i1 %13, i64 0, i64 %constant_357_604
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 4
  %24 = udiv i64 %linear_index0, 4
  %25 = icmp ult i64 %linear_index, 4
  br i1 %25, label %dynamic-update-slice.910.1.in_bounds-true, label %dynamic-update-slice.910.1.in_bounds-after

dynamic-update-slice.910.1.in_bounds-after:       ; preds = %dynamic-update-slice.910.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.910.1.in_bounds-true:        ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.727 = getelementptr inbounds i64, ptr %29, i64 0
  %param_1.7275 = load i64, ptr %param_1.727, align 8, !invariant.load !120
  %constant_357_606 = load i64, ptr @24, align 8
  %30 = icmp ne i64 %param_1.7275, %constant_357_606
  %31 = zext i1 %30 to i8
  %32 = zext i8 %31 to i32
  %constant_362_3 = load i32, ptr @23, align 4
  %33 = icmp eq i32 %32, %constant_362_3
  %34 = zext i1 %33 to i8
  %35 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %34, ptr %35, align 1
  br label %dynamic-update-slice.910.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_9(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.650 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_5 = load i64, ptr @27, align 8
  %0 = icmp slt i64 %param_2.650, %constant_357_5
  %1 = zext i1 %0 to i8
  %param_2.6501 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_64 = load i64, ptr @28, align 8
  %2 = add i64 %param_2.6501, %constant_356_64
  %param_2.6502 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6502
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_53 = load i64, ptr @27, align 8
  %9 = icmp sge i64 0, %constant_357_53
  %10 = select i1 %9, i64 0, i64 %constant_357_53
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.909.1.in_bounds-true, label %dynamic-update-slice.909.1.in_bounds-after

dynamic-update-slice.909.1.in_bounds-after:       ; preds = %dynamic-update-slice.909.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.909.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.725 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.7254 = load i64, ptr %param_1.725, align 8, !invariant.load !120
  %constant_357_55 = load i64, ptr @27, align 8
  %23 = icmp ne i64 %param_1.7254, %constant_357_55
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %constant_362_1 = load i32, ptr @26, align 4
  %26 = icmp eq i32 %25, %constant_362_1
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.909.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_11(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.656 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_27 = load i64, ptr @30, align 8
  %0 = icmp slt i64 %param_2.656, %constant_357_27
  %1 = zext i1 %0 to i8
  %param_2.6561 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_59 = load i64, ptr @31, align 8
  %2 = add i64 %param_2.6561, %constant_356_59
  %param_2.6562 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6562
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_273 = load i64, ptr @30, align 8
  %9 = icmp sge i64 0, %constant_357_273
  %10 = select i1 %9, i64 0, i64 %constant_357_273
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_357_274 = load i64, ptr @30, align 8
  %13 = icmp sge i64 0, %constant_357_274
  %14 = select i1 %13, i64 0, i64 %constant_357_274
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 4
  %24 = udiv i64 %linear_index0, 4
  %25 = icmp ult i64 %linear_index, 4
  br i1 %25, label %dynamic-update-slice.906.1.in_bounds-true, label %dynamic-update-slice.906.1.in_bounds-after

dynamic-update-slice.906.1.in_bounds-after:       ; preds = %dynamic-update-slice.906.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.906.1.in_bounds-true:        ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.731 = getelementptr inbounds i64, ptr %29, i64 0
  %param_1.7315 = load i64, ptr %param_1.731, align 8, !invariant.load !120
  %constant_357_276 = load i64, ptr @30, align 8
  %30 = icmp ne i64 %param_1.7315, %constant_357_276
  %31 = zext i1 %30 to i8
  %32 = zext i8 %31 to i32
  %constant_364_2 = load i32, ptr @29, align 4
  %33 = icmp eq i32 %32, %constant_364_2
  %34 = zext i1 %33 to i8
  %35 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %34, ptr %35, align 1
  br label %dynamic-update-slice.906.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_12(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.655 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_39 = load i64, ptr @33, align 8
  %0 = icmp slt i64 %param_2.655, %constant_357_39
  %1 = zext i1 %0 to i8
  %param_2.6551 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_58 = load i64, ptr @34, align 8
  %2 = add i64 %param_2.6551, %constant_356_58
  %param_2.6552 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6552
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_393 = load i64, ptr @33, align 8
  %9 = icmp sge i64 0, %constant_357_393
  %10 = select i1 %9, i64 0, i64 %constant_357_393
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.905.1.in_bounds-true, label %dynamic-update-slice.905.1.in_bounds-after

dynamic-update-slice.905.1.in_bounds-after:       ; preds = %dynamic-update-slice.905.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.905.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.730 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.7304 = load i64, ptr %param_1.730, align 8, !invariant.load !120
  %constant_357_395 = load i64, ptr @33, align 8
  %23 = icmp ne i64 %param_1.7304, %constant_357_395
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %constant_364_1 = load i32, ptr @32, align 4
  %26 = icmp eq i32 %25, %constant_364_1
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.905.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_59(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.645 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_65 = load i64, ptr @37, align 8
  %0 = icmp slt i64 %param_2.645, %constant_357_65
  %1 = zext i1 %0 to i8
  %param_2.6451 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_32 = load i64, ptr @36, align 8
  %2 = add i64 %param_2.6451, %constant_356_32
  %param_2.6452 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6452
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.881.1.in_bounds-true, label %dynamic-update-slice.881.1.in_bounds-after

dynamic-update-slice.881.1.in_bounds-after:       ; preds = %dynamic-update-slice.881.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.881.1.in_bounds-true:        ; preds = %entry
  %14 = add i64 %8, %12
  %param_2.6453 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_654 = load i64, ptr @37, align 8
  %15 = icmp slt i64 %param_2.6453, %constant_357_654
  %16 = zext i1 %15 to i8
  %param_2.6455 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_326 = load i64, ptr @36, align 8
  %17 = add i64 %param_2.6455, %constant_356_326
  %param_2.6457 = load i64, ptr %arg2, align 8, !invariant.load !120
  %18 = trunc i8 %16 to i1
  %19 = select i1 %18, i64 %17, i64 %param_2.6457
  %20 = icmp sge i64 0, %19
  %21 = select i1 %20, i64 0, i64 %19
  %22 = icmp sle i64 191, %21
  %dynamic-slice.40.5.start_idx0 = select i1 %22, i64 191, i64 %21
  %23 = add i64 %dynamic-slice.40.5.start_idx0, %12
  %param_1.722 = getelementptr inbounds [192 x i32], ptr %arg1, i64 0, i64 %23
  %param_1.7228 = load i32, ptr %param_1.722, align 4, !invariant.load !120
  %24 = getelementptr i32, ptr @35, i64 %linear_index
  %constant_360_2 = getelementptr inbounds i32, ptr %24, i64 0
  %constant_360_29 = load i32, ptr %constant_360_2, align 4
  %25 = icmp ne i32 %param_1.7228, %constant_360_29
  %26 = zext i1 %25 to i8
  %27 = zext i8 %26 to i32
  %28 = getelementptr inbounds [192 x i32], ptr %arg0, i64 0, i64 %14
  store i32 %27, ptr %28, align 4
  br label %dynamic-update-slice.881.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_53(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(1536) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.611 = load i64, ptr %arg3, align 8, !invariant.load !120
  %constant_357_20 = load i64, ptr @40, align 8
  %0 = icmp slt i64 %param_3.611, %constant_357_20
  %1 = zext i1 %0 to i8
  %param_3.6111 = load i64, ptr %arg3, align 8, !invariant.load !120
  %constant_356_11 = load i64, ptr @39, align 8
  %2 = add i64 %param_3.6111, %constant_356_11
  %param_3.6112 = load i64, ptr %arg3, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.6112
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_203 = load i64, ptr @40, align 8
  %9 = icmp sge i64 0, %constant_357_203
  %10 = select i1 %9, i64 0, i64 %constant_357_203
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.863.1.in_bounds-true, label %dynamic-update-slice.863.1.in_bounds-after

dynamic-update-slice.863.1.in_bounds-after:       ; preds = %dynamic-update-slice.863.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.863.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_3.6114 = load i64, ptr %arg3, align 8, !invariant.load !120
  %constant_357_205 = load i64, ptr @40, align 8
  %22 = icmp slt i64 %param_3.6114, %constant_357_205
  %23 = zext i1 %22 to i8
  %param_3.6116 = load i64, ptr %arg3, align 8, !invariant.load !120
  %constant_356_117 = load i64, ptr @39, align 8
  %24 = add i64 %param_3.6116, %constant_356_117
  %param_3.6118 = load i64, ptr %arg3, align 8, !invariant.load !120
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_3.6118
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.39.15.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.39.15.start_idx0, 0
  %param_2.639 = getelementptr inbounds [192 x double], ptr %arg2, i64 0, i64 %30
  %param_2.6399 = load double, ptr %param_2.639, align 8, !invariant.load !120
  %31 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.719 = getelementptr inbounds double, ptr %31, i64 0
  %param_1.71910 = load double, ptr %param_1.719, align 8, !invariant.load !120
  %32 = call double @__nv_exp(double %param_1.71910)
  %multiply.863.5 = fmul double %param_2.6399, %32
  %constant_359_5 = load double, ptr @38, align 8
  %compare.267.3 = fcmp ogt double %multiply.863.5, %constant_359_5
  %33 = zext i1 %compare.267.3 to i8
  %34 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %33, ptr %34, align 1
  br label %dynamic-update-slice.863.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_34(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.414 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_66 = load i64, ptr @42, align 8
  %0 = icmp slt i64 %param_2.414, %constant_357_66
  %1 = zext i1 %0 to i8
  %param_2.4141 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_34 = load i64, ptr @41, align 8
  %2 = add i64 %param_2.4141, %constant_356_34
  %param_2.4142 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.4142
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.883.1.in_bounds-true, label %dynamic-update-slice.883.1.in_bounds-after

dynamic-update-slice.883.1.in_bounds-after:       ; preds = %dynamic-update-slice.883.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.883.1.in_bounds-true:        ; preds = %entry
  %14 = add i64 %8, %12
  %param_1.518 = load double, ptr %arg1, align 8, !invariant.load !120
  %15 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %param_1.518, ptr %15, align 8
  br label %dynamic-update-slice.883.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_38(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.401 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_64 = load i64, ptr @44, align 8
  %0 = icmp slt i64 %param_2.401, %constant_357_64
  %1 = zext i1 %0 to i8
  %param_2.4011 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_28 = load i64, ptr @43, align 8
  %2 = add i64 %param_2.4011, %constant_356_28
  %param_2.4012 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.4012
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %thread_id_x = zext i32 %10 to i64
  %11 = mul nuw nsw i64 %block_id, 1
  %linear_index = add nuw nsw i64 %11, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %12 = udiv i64 %linear_index0, 1
  %13 = icmp ult i64 %linear_index, 1
  br i1 %13, label %dynamic-update-slice.878.1.in_bounds-true, label %dynamic-update-slice.878.1.in_bounds-after

dynamic-update-slice.878.1.in_bounds-after:       ; preds = %dynamic-update-slice.878.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.878.1.in_bounds-true:        ; preds = %entry
  %14 = add i64 %8, %12
  %param_2.4013 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_644 = load i64, ptr @44, align 8
  %15 = icmp slt i64 %param_2.4013, %constant_357_644
  %16 = zext i1 %15 to i8
  %param_2.4015 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_286 = load i64, ptr @43, align 8
  %17 = add i64 %param_2.4015, %constant_356_286
  %param_2.4017 = load i64, ptr %arg2, align 8, !invariant.load !120
  %18 = trunc i8 %16 to i1
  %19 = select i1 %18, i64 %17, i64 %param_2.4017
  %20 = icmp sge i64 0, %19
  %21 = select i1 %20, i64 0, i64 %19
  %22 = icmp sle i64 191, %21
  %dynamic-slice.40.7.start_idx0 = select i1 %22, i64 191, i64 %21
  %23 = add i64 %dynamic-slice.40.7.start_idx0, 0
  %param_1.506 = getelementptr inbounds [192 x i32], ptr %arg1, i64 0, i64 %23
  %param_1.5068 = load i32, ptr %param_1.506, align 4, !invariant.load !120
  %24 = sitofp i32 %param_1.5068 to double
  %25 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %24, ptr %25, align 8
  br label %dynamic-update-slice.878.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_13(ptr noalias align 128 dereferenceable(3072) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.616 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_54 = load i64, ptr @45, align 8
  %0 = icmp slt i64 %param_2.616, %constant_357_54
  %1 = zext i1 %0 to i8
  %param_2.6161 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_57 = load i64, ptr @46, align 8
  %2 = add i64 %param_2.6161, %constant_356_57
  %param_2.6162 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6162
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_543 = load i64, ptr @45, align 8
  %9 = icmp sge i64 0, %constant_357_543
  %10 = select i1 %9, i64 0, i64 %constant_357_543
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.904.1.in_bounds-true, label %dynamic-update-slice.904.1.in_bounds-after

dynamic-update-slice.904.1.in_bounds-after:       ; preds = %dynamic-update-slice.904.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.904.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.703 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.7034 = load i64, ptr %param_1.703, align 8, !invariant.load !120
  %constant_357_545 = load i64, ptr @45, align 8
  %23 = icmp ne i64 %param_1.7034, %constant_357_545
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %26 = getelementptr inbounds [192 x [4 x i32]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i32 %25, ptr %26, align 4
  br label %dynamic-update-slice.904.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_35(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.567 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_4 = load i64, ptr @48, align 8
  %0 = icmp slt i64 %param_2.567, %constant_357_4
  %1 = zext i1 %0 to i8
  %param_2.5671 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_33 = load i64, ptr @47, align 8
  %2 = add i64 %param_2.5671, %constant_356_33
  %param_2.5672 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.5672
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_43 = load i64, ptr @48, align 8
  %9 = icmp sge i64 0, %constant_357_43
  %10 = select i1 %9, i64 0, i64 %constant_357_43
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.882.1.in_bounds-true, label %dynamic-update-slice.882.1.in_bounds-after

dynamic-update-slice.882.1.in_bounds-after:       ; preds = %dynamic-update-slice.882.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.882.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.654 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6544 = load double, ptr %param_1.654, align 8, !invariant.load !120
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.6544, ptr %23, align 8
  br label %dynamic-update-slice.882.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_26(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.636 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_15 = load i64, ptr @51, align 8
  %0 = icmp slt i64 %param_2.636, %constant_357_15
  %1 = zext i1 %0 to i8
  %param_2.6361 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_42 = load i64, ptr @50, align 8
  %2 = add i64 %param_2.6361, %constant_356_42
  %param_2.6362 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6362
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_153 = load i64, ptr @51, align 8
  %9 = icmp sge i64 0, %constant_357_153
  %10 = select i1 %9, i64 0, i64 %constant_357_153
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.891.1.in_bounds-true, label %dynamic-update-slice.891.1.in_bounds-after

dynamic-update-slice.891.1.in_bounds-after:       ; preds = %dynamic-update-slice.891.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.891.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_17 = load double, ptr @49, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.664 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6644 = load double, ptr %param_1.664, align 8, !invariant.load !120
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.6645 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.6646 = load double, ptr %param_1.6645, align 8, !invariant.load !120
  %multiply.883.1 = fmul double %param_1.6644, %param_1.6646
  %divide.405.1 = fdiv double %constant_358_17, %multiply.883.1
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.405.1, ptr %24, align 8
  br label %dynamic-update-slice.891.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_42(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(1536) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %param_7.285 = load i64, ptr %arg7, align 8, !invariant.load !120
  %constant_357_46 = load i64, ptr @53, align 8
  %0 = icmp slt i64 %param_7.285, %constant_357_46
  %1 = zext i1 %0 to i8
  %param_7.2851 = load i64, ptr %arg7, align 8, !invariant.load !120
  %constant_356_24 = load i64, ptr @52, align 8
  %2 = add i64 %param_7.2851, %constant_356_24
  %param_7.2852 = load i64, ptr %arg7, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_7.2852
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_463 = load i64, ptr @53, align 8
  %9 = icmp sge i64 0, %constant_357_463
  %10 = select i1 %9, i64 0, i64 %constant_357_463
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.874.1.in_bounds-true, label %dynamic-update-slice.874.1.in_bounds-after

dynamic-update-slice.874.1.in_bounds-after:       ; preds = %dynamic-update-slice.874.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.874.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_15 = load double, ptr @55, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.717 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7174 = load double, ptr %param_1.717, align 8, !invariant.load !120
  %param_7.2855 = load i64, ptr %arg7, align 8, !invariant.load !120
  %constant_357_466 = load i64, ptr @53, align 8
  %23 = icmp slt i64 %param_7.2855, %constant_357_466
  %24 = zext i1 %23 to i8
  %param_7.2857 = load i64, ptr %arg7, align 8, !invariant.load !120
  %constant_356_248 = load i64, ptr @52, align 8
  %25 = add i64 %param_7.2857, %constant_356_248
  %param_7.2859 = load i64, ptr %arg7, align 8, !invariant.load !120
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_7.2859
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.55.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.55.start_idx0, 0
  %param_6.393 = getelementptr inbounds [192 x double], ptr %arg6, i64 0, i64 %31
  %param_6.39310 = load double, ptr %param_6.393, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.616 = getelementptr inbounds double, ptr %32, i64 0
  %param_3.61611 = load double, ptr %param_3.616, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.448 = getelementptr inbounds double, ptr %33, i64 0
  %param_5.44812 = load double, ptr %param_5.448, align 8, !invariant.load !120
  %34 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.544 = getelementptr inbounds double, ptr %34, i64 0
  %param_4.54413 = load double, ptr %param_4.544, align 8, !invariant.load !120
  %multiply.852.15 = fmul double %param_5.44812, %param_4.54413
  %add.342.13 = fadd double %param_3.61611, %multiply.852.15
  %35 = call double @__nv_exp(double %add.342.13)
  %multiply.853.9 = fmul double %param_6.39310, %35
  %constant_359_11 = load double, ptr @54, align 8
  %compare.265.9 = fcmp ogt double %multiply.853.9, %constant_359_11
  %36 = zext i1 %compare.265.9 to i8
  %37 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.634 = getelementptr inbounds double, ptr %37, i64 0
  %param_2.63414 = load double, ptr %param_2.634, align 8, !invariant.load !120
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, double %multiply.853.9, double %param_2.63414
  %add.343.3 = fadd double %param_1.7174, %39
  %multiply.881.1 = fmul double %add.343.3, %add.343.3
  %divide.403.1 = fdiv double %constant_358_15, %multiply.881.1
  %40 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.403.1, ptr %40, align 8
  br label %dynamic-update-slice.874.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_37(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(6144) %arg2, ptr noalias align 16 dereferenceable(768) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.523 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_357_57 = load i64, ptr @57, align 8
  %0 = icmp slt i64 %param_4.523, %constant_357_57
  %1 = zext i1 %0 to i8
  %param_4.5231 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_356_30 = load i64, ptr @56, align 8
  %2 = add i64 %param_4.5231, %constant_356_30
  %param_4.5232 = load i64, ptr %arg4, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.5232
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_573 = load i64, ptr @57, align 8
  %9 = icmp sge i64 0, %constant_357_573
  %10 = select i1 %9, i64 0, i64 %constant_357_573
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.879.1.in_bounds-true, label %dynamic-update-slice.879.1.in_bounds-after

dynamic-update-slice.879.1.in_bounds-after:       ; preds = %dynamic-update-slice.879.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.879.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_4.5234 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_357_575 = load i64, ptr @57, align 8
  %22 = icmp slt i64 %param_4.5234, %constant_357_575
  %23 = zext i1 %22 to i8
  %param_4.5236 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_356_307 = load i64, ptr @56, align 8
  %24 = add i64 %param_4.5236, %constant_356_307
  %param_4.5238 = load i64, ptr %arg4, align 8, !invariant.load !120
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_4.5238
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.41.4.start_idx0 = select i1 %29, i64 191, i64 %28
  %constant_357_579 = load i64, ptr @57, align 8
  %30 = icmp sge i64 0, %constant_357_579
  %31 = select i1 %30, i64 0, i64 %constant_357_579
  %32 = icmp sle i64 0, %31
  %dynamic-slice.41.4.start_idx1 = select i1 %32, i64 0, i64 %31
  %constant_357_5710 = load i64, ptr @57, align 8
  %33 = icmp sge i64 0, %constant_357_5710
  %34 = select i1 %33, i64 0, i64 %constant_357_5710
  %35 = icmp sle i64 0, %34
  %dynamic-slice.41.4.start_idx2 = select i1 %35, i64 0, i64 %34
  %36 = add i64 %dynamic-slice.41.4.start_idx0, 0
  %37 = add i64 %dynamic-slice.41.4.start_idx1, %17
  %38 = add i64 %dynamic-slice.41.4.start_idx2, 0
  %param_2.619 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg2, i64 0, i64 %36, i64 %37, i64 0
  %param_2.61911 = load double, ptr %param_2.619, align 8, !invariant.load !120
  %39 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.706 = getelementptr inbounds double, ptr %39, i64 0
  %param_1.70612 = load double, ptr %param_1.706, align 8, !invariant.load !120
  %subtract.77.5 = fsub double %param_2.61911, %param_1.70612
  %40 = icmp sge i64 0, %26
  %41 = select i1 %40, i64 0, i64 %26
  %42 = icmp sle i64 191, %41
  %dynamic-slice.40.15.start_idx0 = select i1 %42, i64 191, i64 %41
  %43 = add i64 %dynamic-slice.40.15.start_idx0, 0
  %param_3.592 = getelementptr inbounds [192 x i32], ptr %arg3, i64 0, i64 %43
  %param_3.59213 = load i32, ptr %param_3.592, align 4, !invariant.load !120
  %44 = sitofp i32 %param_3.59213 to double
  %multiply.854.3 = fmul double %subtract.77.5, %44
  %45 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.854.3, ptr %45, align 8
  br label %dynamic-update-slice.879.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_40(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.637 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_50 = load i64, ptr @60, align 8
  %0 = icmp slt i64 %param_2.637, %constant_357_50
  %1 = zext i1 %0 to i8
  %param_2.6371 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_26 = load i64, ptr @59, align 8
  %2 = add i64 %param_2.6371, %constant_356_26
  %param_2.6372 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6372
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_503 = load i64, ptr @60, align 8
  %9 = icmp sge i64 0, %constant_357_503
  %10 = select i1 %9, i64 0, i64 %constant_357_503
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.876.1.in_bounds-true, label %dynamic-update-slice.876.1.in_bounds-after

dynamic-update-slice.876.1.in_bounds-after:       ; preds = %dynamic-update-slice.876.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.876.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_18 = load double, ptr @58, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.699 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6994 = load double, ptr %param_1.699, align 8, !invariant.load !120
  %subtract.76.3 = fsub double %constant_358_18, %param_1.6994
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %subtract.76.3, ptr %23, align 8
  br label %dynamic-update-slice.876.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_27(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.567 = load i64, ptr %arg3, align 8, !invariant.load !120
  %constant_357_11 = load i64, ptr @62, align 8
  %0 = icmp slt i64 %param_3.567, %constant_357_11
  %1 = zext i1 %0 to i8
  %param_3.5671 = load i64, ptr %arg3, align 8, !invariant.load !120
  %constant_356_41 = load i64, ptr @61, align 8
  %2 = add i64 %param_3.5671, %constant_356_41
  %param_3.5672 = load i64, ptr %arg3, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.5672
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_113 = load i64, ptr @62, align 8
  %9 = icmp sge i64 0, %constant_357_113
  %10 = select i1 %9, i64 0, i64 %constant_357_113
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.890.1.in_bounds-true, label %dynamic-update-slice.890.1.in_bounds-after

dynamic-update-slice.890.1.in_bounds-after:       ; preds = %dynamic-update-slice.890.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.890.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.573 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.5734 = load double, ptr %param_2.573, align 8, !invariant.load !120
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.660 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.6605 = load double, ptr %param_1.660, align 8, !invariant.load !120
  %multiply.851.3 = fmul double %param_2.5734, %param_1.6605
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.851.3, ptr %24, align 8
  br label %dynamic-update-slice.890.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_21(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(1536) %arg6, ptr noalias align 128 dereferenceable(8) %arg7) {
entry:
  %param_7.288 = load i64, ptr %arg7, align 8, !invariant.load !120
  %constant_357_6 = load i64, ptr @64, align 8
  %0 = icmp slt i64 %param_7.288, %constant_357_6
  %1 = zext i1 %0 to i8
  %param_7.2881 = load i64, ptr %arg7, align 8, !invariant.load !120
  %constant_356_49 = load i64, ptr @63, align 8
  %2 = add i64 %param_7.2881, %constant_356_49
  %param_7.2882 = load i64, ptr %arg7, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_7.2882
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_63 = load i64, ptr @64, align 8
  %9 = icmp sge i64 0, %constant_357_63
  %10 = select i1 %9, i64 0, i64 %constant_357_63
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.896.1.in_bounds-true, label %dynamic-update-slice.896.1.in_bounds-after

dynamic-update-slice.896.1.in_bounds-after:       ; preds = %dynamic-update-slice.896.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.896.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_7.2884 = load i64, ptr %arg7, align 8, !invariant.load !120
  %constant_357_65 = load i64, ptr @64, align 8
  %22 = icmp slt i64 %param_7.2884, %constant_357_65
  %23 = zext i1 %22 to i8
  %param_7.2886 = load i64, ptr %arg7, align 8, !invariant.load !120
  %constant_356_497 = load i64, ptr @63, align 8
  %24 = add i64 %param_7.2886, %constant_356_497
  %param_7.2888 = load i64, ptr %arg7, align 8, !invariant.load !120
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_7.2888
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.39.69.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.39.69.start_idx0, 0
  %param_6.398 = getelementptr inbounds [192 x double], ptr %arg6, i64 0, i64 %30
  %param_6.3989 = load double, ptr %param_6.398, align 8, !invariant.load !120
  %31 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.620 = getelementptr inbounds double, ptr %31, i64 0
  %param_3.62010 = load double, ptr %param_3.620, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.453 = getelementptr inbounds double, ptr %32, i64 0
  %param_5.45311 = load double, ptr %param_5.453, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.548 = getelementptr inbounds double, ptr %33, i64 0
  %param_4.54812 = load double, ptr %param_4.548, align 8, !invariant.load !120
  %multiply.852.29 = fmul double %param_5.45311, %param_4.54812
  %add.342.27 = fadd double %param_3.62010, %multiply.852.29
  %34 = call double @__nv_exp(double %add.342.27)
  %multiply.853.23 = fmul double %param_6.3989, %34
  %constant_359_17 = load double, ptr @65, align 8
  %compare.265.23 = fcmp ogt double %multiply.853.23, %constant_359_17
  %35 = zext i1 %compare.265.23 to i8
  %36 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.569 = getelementptr inbounds double, ptr %36, i64 0
  %param_2.56913 = load double, ptr %param_2.569, align 8, !invariant.load !120
  %37 = trunc i8 %35 to i1
  %38 = select i1 %37, double %multiply.853.23, double %param_2.56913
  %39 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.656 = getelementptr inbounds double, ptr %39, i64 0
  %param_1.65614 = load double, ptr %param_1.656, align 8, !invariant.load !120
  %multiply.857.4 = fmul double %38, %param_1.65614
  %40 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.857.4, ptr %40, align 8
  br label %dynamic-update-slice.896.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_7(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(1536) %arg7, ptr noalias align 128 dereferenceable(8) %arg8) {
entry:
  %param_8.286 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_49 = load i64, ptr @68, align 8
  %0 = icmp slt i64 %param_8.286, %constant_357_49
  %1 = zext i1 %0 to i8
  %param_8.2861 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_23 = load i64, ptr @67, align 8
  %2 = add i64 %param_8.2861, %constant_356_23
  %param_8.2862 = load i64, ptr %arg8, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_8.2862
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_493 = load i64, ptr @68, align 8
  %9 = icmp sge i64 0, %constant_357_493
  %10 = select i1 %9, i64 0, i64 %constant_357_493
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.911.1.in_bounds-true, label %dynamic-update-slice.911.1.in_bounds-after

dynamic-update-slice.911.1.in_bounds-after:       ; preds = %dynamic-update-slice.911.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.911.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.648 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.6484 = load double, ptr %param_2.648, align 8, !invariant.load !120
  %param_8.2865 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_496 = load i64, ptr @68, align 8
  %23 = icmp slt i64 %param_8.2865, %constant_357_496
  %24 = zext i1 %23 to i8
  %param_8.2867 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_238 = load i64, ptr @67, align 8
  %25 = add i64 %param_8.2867, %constant_356_238
  %param_8.2869 = load i64, ptr %arg8, align 8, !invariant.load !120
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_8.2869
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.73.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.73.start_idx0, 0
  %param_7.292 = getelementptr inbounds [192 x double], ptr %arg7, i64 0, i64 %31
  %param_7.29210 = load double, ptr %param_7.292, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.551 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.55111 = load double, ptr %param_4.551, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.402 = getelementptr inbounds double, ptr %33, i64 0
  %param_6.40212 = load double, ptr %param_6.402, align 8, !invariant.load !120
  %34 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.457 = getelementptr inbounds double, ptr %34, i64 0
  %param_5.45713 = load double, ptr %param_5.457, align 8, !invariant.load !120
  %multiply.852.33 = fmul double %param_6.40212, %param_5.45713
  %add.342.31 = fadd double %param_4.55111, %multiply.852.33
  %35 = call double @__nv_exp(double %add.342.31)
  %multiply.853.27 = fmul double %param_7.29210, %35
  %constant_359_19 = load double, ptr @69, align 8
  %compare.265.27 = fcmp ogt double %multiply.853.27, %constant_359_19
  %36 = zext i1 %compare.265.27 to i8
  %37 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.622 = getelementptr inbounds double, ptr %37, i64 0
  %param_3.62214 = load double, ptr %param_3.622, align 8, !invariant.load !120
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, double %multiply.853.27, double %param_3.62214
  %40 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.724 = getelementptr inbounds double, ptr %40, i64 0
  %param_1.72415 = load double, ptr %param_1.724, align 8, !invariant.load !120
  %multiply.857.11 = fmul double %39, %param_1.72415
  %multiply.864.7 = fmul double %param_2.6484, %multiply.857.11
  %constant_361_4 = load double, ptr @66, align 8
  %multiply.887.3 = fmul double %multiply.864.7, %constant_361_4
  %41 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.887.3, ptr %41, align 8
  br label %dynamic-update-slice.911.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_6(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(1536) %arg7, ptr noalias align 128 dereferenceable(8) %arg8) {
entry:
  %param_8.277 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_37 = load i64, ptr @71, align 8
  %0 = icmp slt i64 %param_8.277, %constant_357_37
  %1 = zext i1 %0 to i8
  %param_8.2771 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_3 = load i64, ptr @70, align 8
  %2 = add i64 %param_8.2771, %constant_356_3
  %param_8.2772 = load i64, ptr %arg8, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_8.2772
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_373 = load i64, ptr @71, align 8
  %9 = icmp sge i64 0, %constant_357_373
  %10 = select i1 %9, i64 0, i64 %constant_357_373
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.912.1.in_bounds-true, label %dynamic-update-slice.912.1.in_bounds-after

dynamic-update-slice.912.1.in_bounds-after:       ; preds = %dynamic-update-slice.912.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.912.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.599 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.5994 = load double, ptr %param_2.599, align 8, !invariant.load !120
  %param_8.2775 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_376 = load i64, ptr @71, align 8
  %23 = icmp slt i64 %param_8.2775, %constant_357_376
  %24 = zext i1 %23 to i8
  %param_8.2777 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_38 = load i64, ptr @70, align 8
  %25 = add i64 %param_8.2777, %constant_356_38
  %param_8.2779 = load i64, ptr %arg8, align 8, !invariant.load !120
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_8.2779
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.77.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.77.start_idx0, 0
  %param_7.281 = getelementptr inbounds [192 x double], ptr %arg7, i64 0, i64 %31
  %param_7.28110 = load double, ptr %param_7.281, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.537 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.53711 = load double, ptr %param_4.537, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.389 = getelementptr inbounds double, ptr %33, i64 0
  %param_6.38912 = load double, ptr %param_6.389, align 8, !invariant.load !120
  %34 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.442 = getelementptr inbounds double, ptr %34, i64 0
  %param_5.44213 = load double, ptr %param_5.442, align 8, !invariant.load !120
  %multiply.852.37 = fmul double %param_6.38912, %param_5.44213
  %add.342.35 = fadd double %param_4.53711, %multiply.852.37
  %35 = call double @__nv_exp(double %add.342.35)
  %multiply.853.31 = fmul double %param_7.28110, %35
  %constant_359_2 = load double, ptr @72, align 8
  %compare.265.31 = fcmp ogt double %multiply.853.31, %constant_359_2
  %36 = zext i1 %compare.265.31 to i8
  %37 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.583 = getelementptr inbounds double, ptr %37, i64 0
  %param_3.58314 = load double, ptr %param_3.583, align 8, !invariant.load !120
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, double %multiply.853.31, double %param_3.58314
  %40 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.686 = getelementptr inbounds double, ptr %40, i64 0
  %param_1.68615 = load double, ptr %param_1.686, align 8, !invariant.load !120
  %multiply.857.15 = fmul double %39, %param_1.68615
  %multiply.864.11 = fmul double %param_2.5994, %multiply.857.15
  %multiply.869.1 = fmul double %multiply.864.11, %multiply.864.11
  %41 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.869.1, ptr %41, align 8
  br label %dynamic-update-slice.912.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_3(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(1536) %arg7, ptr noalias align 128 dereferenceable(8) %arg8) {
entry:
  %param_8.288 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_25 = load i64, ptr @74, align 8
  %0 = icmp slt i64 %param_8.288, %constant_357_25
  %1 = zext i1 %0 to i8
  %param_8.2881 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_29 = load i64, ptr @73, align 8
  %2 = add i64 %param_8.2881, %constant_356_29
  %param_8.2882 = load i64, ptr %arg8, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_8.2882
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_253 = load i64, ptr @74, align 8
  %9 = icmp sge i64 0, %constant_357_253
  %10 = select i1 %9, i64 0, i64 %constant_357_253
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.915.1.in_bounds-true, label %dynamic-update-slice.915.1.in_bounds-after

dynamic-update-slice.915.1.in_bounds-after:       ; preds = %dynamic-update-slice.915.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.915.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.728 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7284 = load double, ptr %param_1.728, align 8, !invariant.load !120
  %multiply.872.9 = fmul double %param_1.7284, %param_1.7284
  %constant_363_1 = load double, ptr @76, align 8
  %multiply.873.7 = fmul double %multiply.872.9, %constant_363_1
  %param_8.2885 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_256 = load i64, ptr @74, align 8
  %23 = icmp slt i64 %param_8.2885, %constant_357_256
  %24 = zext i1 %23 to i8
  %param_8.2887 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_298 = load i64, ptr @73, align 8
  %25 = add i64 %param_8.2887, %constant_356_298
  %param_8.2889 = load i64, ptr %arg8, align 8, !invariant.load !120
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_8.2889
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.53.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.53.start_idx0, 0
  %param_7.294 = getelementptr inbounds [192 x double], ptr %arg7, i64 0, i64 %31
  %param_7.29410 = load double, ptr %param_7.294, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.553 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.55311 = load double, ptr %param_4.553, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.404 = getelementptr inbounds double, ptr %33, i64 0
  %param_6.40412 = load double, ptr %param_6.404, align 8, !invariant.load !120
  %34 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.459 = getelementptr inbounds double, ptr %34, i64 0
  %param_5.45913 = load double, ptr %param_5.459, align 8, !invariant.load !120
  %multiply.852.13 = fmul double %param_6.40412, %param_5.45913
  %add.342.11 = fadd double %param_4.55311, %multiply.852.13
  %35 = call double @__nv_exp(double %add.342.11)
  %multiply.853.7 = fmul double %param_7.29410, %35
  %constant_359_10 = load double, ptr @75, align 8
  %compare.265.7 = fcmp ogt double %multiply.853.7, %constant_359_10
  %36 = zext i1 %compare.265.7 to i8
  %37 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.624 = getelementptr inbounds double, ptr %37, i64 0
  %param_3.62414 = load double, ptr %param_3.624, align 8, !invariant.load !120
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, double %multiply.853.7, double %param_3.62414
  %40 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.653 = getelementptr inbounds double, ptr %40, i64 0
  %param_2.65315 = load double, ptr %param_2.653, align 8, !invariant.load !120
  %multiply.857.5 = fmul double %39, %param_2.65315
  %multiply.874.1 = fmul double %multiply.873.7, %multiply.857.5
  %41 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.874.1, ptr %41, align 8
  br label %dynamic-update-slice.915.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_18(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(1536) %arg7, ptr noalias align 128 dereferenceable(8) %arg8) {
entry:
  %param_8.284 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_47 = load i64, ptr @78, align 8
  %0 = icmp slt i64 %param_8.284, %constant_357_47
  %1 = zext i1 %0 to i8
  %param_8.2841 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_52 = load i64, ptr @77, align 8
  %2 = add i64 %param_8.2841, %constant_356_52
  %param_8.2842 = load i64, ptr %arg8, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_8.2842
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_473 = load i64, ptr @78, align 8
  %9 = icmp sge i64 0, %constant_357_473
  %10 = select i1 %9, i64 0, i64 %constant_357_473
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.899.1.in_bounds-true, label %dynamic-update-slice.899.1.in_bounds-after

dynamic-update-slice.899.1.in_bounds-after:       ; preds = %dynamic-update-slice.899.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.899.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.609 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.6094 = load double, ptr %param_2.609, align 8, !invariant.load !120
  %param_8.2845 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_476 = load i64, ptr @78, align 8
  %23 = icmp slt i64 %param_8.2845, %constant_357_476
  %24 = zext i1 %23 to i8
  %param_8.2847 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_528 = load i64, ptr @77, align 8
  %25 = add i64 %param_8.2847, %constant_356_528
  %param_8.2849 = load i64, ptr %arg8, align 8, !invariant.load !120
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_8.2849
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.75.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.75.start_idx0, 0
  %param_7.290 = getelementptr inbounds [192 x double], ptr %arg7, i64 0, i64 %31
  %param_7.29010 = load double, ptr %param_7.290, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.549 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.54911 = load double, ptr %param_4.549, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.400 = getelementptr inbounds double, ptr %33, i64 0
  %param_6.40012 = load double, ptr %param_6.400, align 8, !invariant.load !120
  %34 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.455 = getelementptr inbounds double, ptr %34, i64 0
  %param_5.45513 = load double, ptr %param_5.455, align 8, !invariant.load !120
  %multiply.852.35 = fmul double %param_6.40012, %param_5.45513
  %add.342.33 = fadd double %param_4.54911, %multiply.852.35
  %35 = call double @__nv_exp(double %add.342.33)
  %multiply.853.29 = fmul double %param_7.29010, %35
  %constant_359_20 = load double, ptr @79, align 8
  %compare.265.29 = fcmp ogt double %multiply.853.29, %constant_359_20
  %36 = zext i1 %compare.265.29 to i8
  %37 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.588 = getelementptr inbounds double, ptr %37, i64 0
  %param_3.58814 = load double, ptr %param_3.588, align 8, !invariant.load !120
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, double %multiply.853.29, double %param_3.58814
  %40 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.696 = getelementptr inbounds double, ptr %40, i64 0
  %param_1.69615 = load double, ptr %param_1.696, align 8, !invariant.load !120
  %multiply.857.13 = fmul double %39, %param_1.69615
  %multiply.864.9 = fmul double %param_2.6094, %multiply.857.13
  %41 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.864.9, ptr %41, align 8
  br label %dynamic-update-slice.899.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_43(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(1536) %arg5, ptr noalias align 128 dereferenceable(8) %arg6) {
entry:
  %param_6.394 = load i64, ptr %arg6, align 8, !invariant.load !120
  %constant_357_42 = load i64, ptr @81, align 8
  %0 = icmp slt i64 %param_6.394, %constant_357_42
  %1 = zext i1 %0 to i8
  %param_6.3941 = load i64, ptr %arg6, align 8, !invariant.load !120
  %constant_356_22 = load i64, ptr @80, align 8
  %2 = add i64 %param_6.3941, %constant_356_22
  %param_6.3942 = load i64, ptr %arg6, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_6.3942
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_423 = load i64, ptr @81, align 8
  %9 = icmp sge i64 0, %constant_357_423
  %10 = select i1 %9, i64 0, i64 %constant_357_423
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.873.1.in_bounds-true, label %dynamic-update-slice.873.1.in_bounds-after

dynamic-update-slice.873.1.in_bounds-after:       ; preds = %dynamic-update-slice.873.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.873.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_6.3944 = load i64, ptr %arg6, align 8, !invariant.load !120
  %constant_357_425 = load i64, ptr @81, align 8
  %22 = icmp slt i64 %param_6.3944, %constant_357_425
  %23 = zext i1 %22 to i8
  %param_6.3946 = load i64, ptr %arg6, align 8, !invariant.load !120
  %constant_356_227 = load i64, ptr @80, align 8
  %24 = add i64 %param_6.3946, %constant_356_227
  %param_6.3948 = load i64, ptr %arg6, align 8, !invariant.load !120
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_6.3948
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.39.57.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.39.57.start_idx0, 0
  %param_5.449 = getelementptr inbounds [192 x double], ptr %arg5, i64 0, i64 %30
  %param_5.4499 = load double, ptr %param_5.449, align 8, !invariant.load !120
  %31 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.643 = getelementptr inbounds double, ptr %31, i64 0
  %param_2.64310 = load double, ptr %param_2.643, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.545 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.54511 = load double, ptr %param_4.545, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.617 = getelementptr inbounds double, ptr %33, i64 0
  %param_3.61712 = load double, ptr %param_3.617, align 8, !invariant.load !120
  %multiply.852.17 = fmul double %param_4.54511, %param_3.61712
  %add.342.15 = fadd double %param_2.64310, %multiply.852.17
  %34 = call double @__nv_exp(double %add.342.15)
  %multiply.853.11 = fmul double %param_5.4499, %34
  %constant_359_12 = load double, ptr @82, align 8
  %compare.265.11 = fcmp ogt double %multiply.853.11, %constant_359_12
  %35 = zext i1 %compare.265.11 to i8
  %36 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.691 = getelementptr inbounds double, ptr %36, i64 0
  %param_1.69113 = load double, ptr %param_1.691, align 8, !invariant.load !120
  %37 = trunc i8 %35 to i1
  %38 = select i1 %37, double %multiply.853.11, double %param_1.69113
  %39 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %38, ptr %39, align 8
  br label %dynamic-update-slice.873.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_46(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.515 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_357_36 = load i64, ptr @84, align 8
  %0 = icmp slt i64 %param_4.515, %constant_357_36
  %1 = zext i1 %0 to i8
  %param_4.5151 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_356_19 = load i64, ptr @83, align 8
  %2 = add i64 %param_4.5151, %constant_356_19
  %param_4.5152 = load i64, ptr %arg4, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.5152
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_363 = load i64, ptr @84, align 8
  %9 = icmp sge i64 0, %constant_357_363
  %10 = select i1 %9, i64 0, i64 %constant_357_363
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.870.1.in_bounds-true, label %dynamic-update-slice.870.1.in_bounds-after

dynamic-update-slice.870.1.in_bounds-after:       ; preds = %dynamic-update-slice.870.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.870.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.685 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6854 = load double, ptr %param_1.685, align 8, !invariant.load !120
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.582 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.5825 = load double, ptr %param_3.582, align 8, !invariant.load !120
  %24 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.598 = getelementptr inbounds double, ptr %24, i64 0
  %param_2.5986 = load double, ptr %param_2.598, align 8, !invariant.load !120
  %multiply.852.7 = fmul double %param_3.5825, %param_2.5986
  %add.342.5 = fadd double %param_1.6854, %multiply.852.7
  %25 = call double @__nv_exp(double %add.342.5)
  %26 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %25, ptr %26, align 8
  br label %dynamic-update-slice.870.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_4(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.654 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_29 = load i64, ptr @87, align 8
  %0 = icmp slt i64 %param_2.654, %constant_357_29
  %1 = zext i1 %0 to i8
  %param_2.6541 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_45 = load i64, ptr @86, align 8
  %2 = add i64 %param_2.6541, %constant_356_45
  %param_2.6542 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6542
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_293 = load i64, ptr @87, align 8
  %9 = icmp sge i64 0, %constant_357_293
  %10 = select i1 %9, i64 0, i64 %constant_357_293
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.914.1.in_bounds-true, label %dynamic-update-slice.914.1.in_bounds-after

dynamic-update-slice.914.1.in_bounds-after:       ; preds = %dynamic-update-slice.914.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.914.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.729 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7294 = load double, ptr %param_1.729, align 8, !invariant.load !120
  %multiply.872.5 = fmul double %param_1.7294, %param_1.7294
  %constant_363_3 = load double, ptr @85, align 8
  %multiply.873.3 = fmul double %multiply.872.5, %constant_363_3
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.873.3, ptr %23, align 8
  br label %dynamic-update-slice.914.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_5(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.646 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_33 = load i64, ptr @90, align 8
  %0 = icmp slt i64 %param_2.646, %constant_357_33
  %1 = zext i1 %0 to i8
  %param_2.6461 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_46 = load i64, ptr @89, align 8
  %2 = add i64 %param_2.6461, %constant_356_46
  %param_2.6462 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6462
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_333 = load i64, ptr @90, align 8
  %9 = icmp sge i64 0, %constant_357_333
  %10 = select i1 %9, i64 0, i64 %constant_357_333
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.913.1.in_bounds-true, label %dynamic-update-slice.913.1.in_bounds-after

dynamic-update-slice.913.1.in_bounds-after:       ; preds = %dynamic-update-slice.913.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.913.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.682 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6824 = load double, ptr %param_1.682, align 8, !invariant.load !120
  %constant_361_1 = load double, ptr @88, align 8
  %multiply.888.3 = fmul double %param_1.6824, %constant_361_1
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.888.3, ptr %23, align 8
  br label %dynamic-update-slice.913.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_58(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(1536) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.606 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_44 = load i64, ptr @92, align 8
  %0 = icmp slt i64 %param_2.606, %constant_357_44
  %1 = zext i1 %0 to i8
  %param_2.6061 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_61 = load i64, ptr @91, align 8
  %2 = add i64 %param_2.6061, %constant_356_61
  %param_2.6062 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6062
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_443 = load i64, ptr @92, align 8
  %9 = icmp sge i64 0, %constant_357_443
  %10 = select i1 %9, i64 0, i64 %constant_357_443
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.907.1.in_bounds-true, label %dynamic-update-slice.907.1.in_bounds-after

dynamic-update-slice.907.1.in_bounds-after:       ; preds = %dynamic-update-slice.907.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.907.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_2.6064 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_445 = load i64, ptr @92, align 8
  %22 = icmp slt i64 %param_2.6064, %constant_357_445
  %23 = zext i1 %22 to i8
  %param_2.6066 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_617 = load i64, ptr @91, align 8
  %24 = add i64 %param_2.6066, %constant_356_617
  %param_2.6068 = load i64, ptr %arg2, align 8, !invariant.load !120
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_2.6068
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.39.2.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.39.2.start_idx0, 0
  %param_1.693 = getelementptr inbounds [192 x double], ptr %arg1, i64 0, i64 %30
  %param_1.6939 = load double, ptr %param_1.693, align 8, !invariant.load !120
  %31 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.6939, ptr %31, align 8
  br label %dynamic-update-slice.907.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_14(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.583 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_21 = load i64, ptr @94, align 8
  %0 = icmp slt i64 %param_2.583, %constant_357_21
  %1 = zext i1 %0 to i8
  %param_2.5831 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_56 = load i64, ptr @93, align 8
  %2 = add i64 %param_2.5831, %constant_356_56
  %param_2.5832 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.5832
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_213 = load i64, ptr @94, align 8
  %9 = icmp sge i64 0, %constant_357_213
  %10 = select i1 %9, i64 0, i64 %constant_357_213
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.903.1.in_bounds-true, label %dynamic-update-slice.903.1.in_bounds-after

dynamic-update-slice.903.1.in_bounds-after:       ; preds = %dynamic-update-slice.903.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.903.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.670 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.6704 = load i64, ptr %param_1.670, align 8, !invariant.load !120
  %23 = sitofp i64 %param_1.6704 to double
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %23, ptr %24, align 8
  br label %dynamic-update-slice.903.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_20(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.605 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_43 = load i64, ptr @96, align 8
  %0 = icmp slt i64 %param_2.605, %constant_357_43
  %1 = zext i1 %0 to i8
  %param_2.6051 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_50 = load i64, ptr @95, align 8
  %2 = add i64 %param_2.6051, %constant_356_50
  %param_2.6052 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6052
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_433 = load i64, ptr @96, align 8
  %9 = icmp sge i64 0, %constant_357_433
  %10 = select i1 %9, i64 0, i64 %constant_357_433
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.897.1.in_bounds-true, label %dynamic-update-slice.897.1.in_bounds-after

dynamic-update-slice.897.1.in_bounds-after:       ; preds = %dynamic-update-slice.897.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.897.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.692 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6924 = load double, ptr %param_1.692, align 8, !invariant.load !120
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.6924, ptr %23, align 8
  br label %dynamic-update-slice.897.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_48(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.594 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_32 = load i64, ptr @98, align 8
  %0 = icmp slt i64 %param_2.594, %constant_357_32
  %1 = zext i1 %0 to i8
  %param_2.5941 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_17 = load i64, ptr @97, align 8
  %2 = add i64 %param_2.5941, %constant_356_17
  %param_2.5942 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.5942
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_323 = load i64, ptr @98, align 8
  %9 = icmp sge i64 0, %constant_357_323
  %10 = select i1 %9, i64 0, i64 %constant_357_323
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.868.1.in_bounds-true, label %dynamic-update-slice.868.1.in_bounds-after

dynamic-update-slice.868.1.in_bounds-after:       ; preds = %dynamic-update-slice.868.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.868.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.681 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6814 = load double, ptr %param_1.681, align 8, !invariant.load !120
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.6814, ptr %23, align 8
  br label %dynamic-update-slice.868.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_51(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(1536) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.543 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_357_24 = load i64, ptr @100, align 8
  %0 = icmp slt i64 %param_4.543, %constant_357_24
  %1 = zext i1 %0 to i8
  %param_4.5431 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_356_13 = load i64, ptr @99, align 8
  %2 = add i64 %param_4.5431, %constant_356_13
  %param_4.5432 = load i64, ptr %arg4, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.5432
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_243 = load i64, ptr @100, align 8
  %9 = icmp sge i64 0, %constant_357_243
  %10 = select i1 %9, i64 0, i64 %constant_357_243
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.865.1.in_bounds-true, label %dynamic-update-slice.865.1.in_bounds-after

dynamic-update-slice.865.1.in_bounds-after:       ; preds = %dynamic-update-slice.865.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.865.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_4.5434 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_357_245 = load i64, ptr @100, align 8
  %22 = icmp slt i64 %param_4.5434, %constant_357_245
  %23 = zext i1 %22 to i8
  %param_4.5436 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_356_137 = load i64, ptr @99, align 8
  %24 = add i64 %param_4.5436, %constant_356_137
  %param_4.5438 = load i64, ptr %arg4, align 8, !invariant.load !120
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_4.5438
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.39.25.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.39.25.start_idx0, 0
  %param_3.615 = getelementptr inbounds [192 x double], ptr %arg3, i64 0, i64 %30
  %param_3.6159 = load double, ptr %param_3.615, align 8, !invariant.load !120
  %31 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.642 = getelementptr inbounds double, ptr %31, i64 0
  %param_2.64210 = load double, ptr %param_2.642, align 8, !invariant.load !120
  %32 = call double @__nv_exp(double %param_2.64210)
  %multiply.863.15 = fmul double %param_3.6159, %32
  %constant_359_9 = load double, ptr @101, align 8
  %compare.267.11 = fcmp ogt double %multiply.863.15, %constant_359_9
  %33 = zext i1 %compare.267.11 to i8
  %34 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.673 = getelementptr inbounds double, ptr %34, i64 0
  %param_1.67311 = load double, ptr %param_1.673, align 8, !invariant.load !120
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %multiply.863.15, double %param_1.67311
  %37 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %36, ptr %37, align 8
  br label %dynamic-update-slice.865.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_54(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.580 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_18 = load i64, ptr @103, align 8
  %0 = icmp slt i64 %param_2.580, %constant_357_18
  %1 = zext i1 %0 to i8
  %param_2.5801 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_10 = load i64, ptr @102, align 8
  %2 = add i64 %param_2.5801, %constant_356_10
  %param_2.5802 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.5802
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_183 = load i64, ptr @103, align 8
  %9 = icmp sge i64 0, %constant_357_183
  %10 = select i1 %9, i64 0, i64 %constant_357_183
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.862.1.in_bounds-true, label %dynamic-update-slice.862.1.in_bounds-after

dynamic-update-slice.862.1.in_bounds-after:       ; preds = %dynamic-update-slice.862.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.862.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.667 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6674 = load double, ptr %param_1.667, align 8, !invariant.load !120
  %23 = call double @__nv_exp(double %param_1.6674)
  %24 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %23, ptr %24, align 8
  br label %dynamic-update-slice.862.1.in_bounds-after
}

define void @loop_add_divide_select_fusion(ptr noalias align 128 dereferenceable(32) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(1536) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(32) %arg7, ptr noalias align 16 dereferenceable(32) %arg8, ptr noalias align 16 dereferenceable(32) %arg9, ptr noalias align 128 dereferenceable(8) %arg10, ptr noalias align 16 dereferenceable(768) %arg11, ptr noalias align 16 dereferenceable(32) %arg12, ptr noalias align 16 dereferenceable(32) %arg13, ptr noalias align 128 dereferenceable(32) %arg14, ptr noalias align 128 dereferenceable(32) %arg15, ptr noalias align 16 dereferenceable(32) %arg16, ptr noalias align 16 dereferenceable(32) %arg17, ptr noalias align 128 dereferenceable(32) %arg18, ptr noalias align 128 dereferenceable(32) %arg19, ptr noalias align 16 dereferenceable(32) %arg20, ptr noalias align 128 dereferenceable(32) %arg21, ptr noalias align 128 dereferenceable(32) %arg22, ptr noalias align 128 dereferenceable(32) %arg23, ptr noalias align 128 dereferenceable(32) %arg24, ptr noalias align 128 dereferenceable(32) %arg25, ptr noalias align 128 dereferenceable(32) %arg26, ptr noalias align 128 dereferenceable(32) %arg27, ptr noalias align 128 dereferenceable(32) %arg28, ptr noalias align 128 dereferenceable(32) %arg29, ptr noalias align 128 dereferenceable(32) %arg30, ptr noalias align 128 dereferenceable(32) %arg31, ptr noalias align 128 dereferenceable(32) %arg32, ptr noalias align 128 dereferenceable(32) %arg33, ptr noalias align 16 dereferenceable(6144) %arg34, ptr noalias align 128 dereferenceable(16) %arg35, ptr noalias align 128 dereferenceable(32) %arg36, ptr noalias align 128 dereferenceable(32) %arg37, ptr noalias align 128 dereferenceable(32) %arg38, ptr noalias align 128 dereferenceable(32) %arg39, ptr noalias align 128 dereferenceable(32) %arg40, ptr noalias align 128 dereferenceable(32) %arg41, ptr noalias align 16 dereferenceable(32) %arg42, ptr noalias align 128 dereferenceable(32) %arg43, ptr noalias align 128 dereferenceable(32) %arg44, ptr noalias align 128 dereferenceable(32) %arg45, ptr noalias align 128 dereferenceable(32) %arg46, ptr noalias align 128 dereferenceable(32) %arg47, ptr noalias align 128 dereferenceable(32) %arg48) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %loop_add_divide_select_fusion.in_bounds-true, label %loop_add_divide_select_fusion.in_bounds-after

loop_add_divide_select_fusion.in_bounds-after:    ; preds = %loop_add_divide_select_fusion.in_bounds-true, %entry
  ret void

loop_add_divide_select_fusion.in_bounds-true:     ; preds = %entry
  %5 = getelementptr double, ptr %arg13, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !120
  %8 = getelementptr double, ptr %arg14, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !120
  %multiply.848.63 = fmul double %7, %10
  %11 = load i64, ptr %arg10, align 8, !invariant.load !120
  %constant_357_75 = load i64, ptr @105, align 8
  %12 = icmp slt i64 %11, %constant_357_75
  %13 = zext i1 %12 to i8
  %14 = load i64, ptr %arg10, align 8, !invariant.load !120
  %constant_356_74 = load i64, ptr @104, align 8
  %15 = add i64 %14, %constant_356_74
  %16 = load i64, ptr %arg10, align 8, !invariant.load !120
  %17 = trunc i8 %13 to i1
  %18 = select i1 %17, i64 %15, i64 %16
  %19 = trunc i64 %18 to i32
  %20 = icmp sge i32 0, %19
  %21 = select i1 %20, i32 0, i32 %19
  %22 = icmp sle i32 191, %21
  %dynamic-slice.39.116.start_idx0 = select i1 %22, i32 191, i32 %21
  %23 = add i32 %dynamic-slice.39.116.start_idx0, 0
  %24 = getelementptr inbounds [192 x double], ptr %arg3, i32 0, i32 %23
  %25 = load double, ptr %24, align 8, !invariant.load !120
  %26 = getelementptr double, ptr %arg12, i32 %linear_index
  %27 = getelementptr inbounds double, ptr %26, i32 0
  %28 = load double, ptr %27, align 8, !invariant.load !120
  %multiply.849.65 = fmul double %25, %28
  %add.340.63 = fadd double %multiply.848.63, %multiply.849.65
  %29 = getelementptr double, ptr %arg42, i32 %linear_index
  %30 = getelementptr inbounds double, ptr %29, i32 0
  %31 = load double, ptr %30, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg31, i32 %linear_index
  %33 = getelementptr inbounds double, ptr %32, i32 0
  %34 = load double, ptr %33, align 8, !invariant.load !120
  %multiply.851.5.clone.1 = fmul double %31, %34
  %35 = getelementptr double, ptr %arg24, i32 %linear_index
  %36 = getelementptr inbounds double, ptr %35, i32 0
  %37 = load double, ptr %36, align 8
  %divide.393.1.clone.1 = fdiv double %multiply.851.5.clone.1, %37
  %38 = trunc i64 %18 to i32
  %39 = icmp sge i32 0, %38
  %40 = select i1 %39, i32 0, i32 %38
  %41 = icmp sle i32 191, %40
  %dynamic-slice.41.6.clone.1.start_idx0 = select i1 %41, i32 191, i32 %40
  %constant_357_751 = load i64, ptr @105, align 8
  %42 = trunc i64 %constant_357_751 to i32
  %43 = icmp sge i32 0, %42
  %44 = select i1 %43, i32 0, i32 %42
  %45 = icmp sle i32 0, %44
  %dynamic-slice.41.6.clone.1.start_idx1 = select i1 %45, i32 0, i32 %44
  %constant_357_752 = load i64, ptr @105, align 8
  %46 = trunc i64 %constant_357_752 to i32
  %47 = icmp sge i32 0, %46
  %48 = select i1 %47, i32 0, i32 %46
  %49 = icmp sle i32 0, %48
  %dynamic-slice.41.6.clone.1.start_idx2 = select i1 %49, i32 0, i32 %48
  %50 = add i32 %dynamic-slice.41.6.clone.1.start_idx0, 0
  %51 = add i32 %dynamic-slice.41.6.clone.1.start_idx1, %3
  %52 = add i32 %dynamic-slice.41.6.clone.1.start_idx2, 0
  %53 = getelementptr inbounds [192 x [4 x [1 x double]]], ptr %arg34, i32 0, i32 %50, i32 %51, i32 0
  %54 = load double, ptr %53, align 8, !invariant.load !120
  %55 = getelementptr double, ptr %arg28, i32 %linear_index
  %56 = getelementptr inbounds double, ptr %55, i32 0
  %57 = load double, ptr %56, align 8, !invariant.load !120
  %subtract.77.7.clone.1 = fsub double %54, %57
  %58 = trunc i64 %18 to i32
  %59 = icmp sge i32 0, %58
  %60 = select i1 %59, i32 0, i32 %58
  %61 = icmp sle i32 191, %60
  %dynamic-slice.40.9.clone.1.start_idx0 = select i1 %61, i32 191, i32 %60
  %62 = add i32 %dynamic-slice.40.9.clone.1.start_idx0, 0
  %63 = getelementptr inbounds [192 x i32], ptr %arg11, i32 0, i32 %62
  %64 = load i32, ptr %63, align 4, !invariant.load !120
  %65 = sitofp i32 %64 to double
  %multiply.854.5.clone.1 = fmul double %subtract.77.7.clone.1, %65
  %66 = getelementptr double, ptr %arg31, i32 %linear_index
  %67 = getelementptr inbounds double, ptr %66, i32 0
  %68 = load double, ptr %67, align 8, !invariant.load !120
  %divide.394.1.clone.1 = fdiv double %multiply.854.5.clone.1, %68
  %multiply.855.53 = fmul double %divide.394.1.clone.1, %65
  %multiply.856.49 = fmul double %divide.393.1.clone.1, %multiply.855.53
  %add.344.49 = fadd double %add.340.63, %multiply.856.49
  %69 = call double @llvm.fabs.f64(double %add.344.49)
  %70 = fcmp one double %69, 0x7FF0000000000000
  %71 = zext i1 %70 to i8
  %72 = call double @llvm.fabs.f64(double %add.344.49)
  %constant_365_19 = load double, ptr @107, align 8
  %compare.266.37 = fcmp olt double %72, %constant_365_19
  %73 = zext i1 %compare.266.37 to i8
  %74 = and i8 %71, %73
  %75 = getelementptr double, ptr %arg4, i32 %linear_index
  %76 = getelementptr inbounds double, ptr %75, i32 0
  %77 = load double, ptr %76, align 8, !invariant.load !120
  %78 = getelementptr double, ptr %arg0, i32 %linear_index
  %79 = getelementptr inbounds double, ptr %78, i32 0
  %80 = load double, ptr %79, align 8, !invariant.load !120
  %multiply.861.3 = fmul double %77, %80
  %81 = getelementptr double, ptr %arg2, i32 %linear_index
  %82 = getelementptr inbounds double, ptr %81, i32 0
  %83 = load double, ptr %82, align 8, !invariant.load !120
  %multiply.862.5 = fmul double %25, %83
  %add.347.3 = fadd double %multiply.861.3, %multiply.862.5
  %84 = getelementptr double, ptr %arg6, i32 %linear_index
  %85 = getelementptr inbounds double, ptr %84, i32 0
  %86 = load double, ptr %85, align 8, !invariant.load !120
  %87 = getelementptr double, ptr %arg8, i32 %linear_index
  %88 = getelementptr inbounds double, ptr %87, i32 0
  %89 = load double, ptr %88, align 8, !invariant.load !120
  %90 = getelementptr double, ptr %arg9, i32 %linear_index
  %91 = getelementptr inbounds double, ptr %90, i32 0
  %92 = load double, ptr %91, align 8, !invariant.load !120
  %93 = getelementptr double, ptr %arg0, i32 %linear_index
  %94 = getelementptr inbounds double, ptr %93, i32 0
  %95 = load double, ptr %94, align 8, !invariant.load !120
  %multiply.852.31 = fmul double %92, %95
  %add.342.29 = fadd double %89, %multiply.852.31
  %96 = call double @__nv_exp(double %add.342.29)
  %multiply.853.25 = fmul double %25, %96
  %constant_359_18 = load double, ptr @106, align 8
  %compare.265.25 = fcmp ogt double %multiply.853.25, %constant_359_18
  %97 = zext i1 %compare.265.25 to i8
  %98 = getelementptr double, ptr %arg7, i32 %linear_index
  %99 = getelementptr inbounds double, ptr %98, i32 0
  %100 = load double, ptr %99, align 8, !invariant.load !120
  %101 = trunc i8 %97 to i1
  %102 = select i1 %101, double %multiply.853.25, double %100
  %103 = getelementptr double, ptr %arg5, i32 %linear_index
  %104 = getelementptr inbounds double, ptr %103, i32 0
  %105 = load double, ptr %104, align 8, !invariant.load !120
  %multiply.857.9 = fmul double %102, %105
  %multiply.864.5 = fmul double %86, %multiply.857.9
  %constant_358_10 = load double, ptr @109, align 8
  %106 = getelementptr double, ptr %arg25, i32 %linear_index
  %107 = getelementptr inbounds double, ptr %106, i32 0
  %108 = load double, ptr %107, align 8, !invariant.load !120
  %add.343.1.clone.1 = fadd double %108, %102
  %109 = getelementptr double, ptr %arg24, i32 %linear_index
  %110 = getelementptr inbounds double, ptr %109, i32 0
  %111 = load double, ptr %110, align 8
  %multiply.858.3.clone.1 = fmul double %add.343.1.clone.1, %111
  %divide.395.3.clone.1 = fdiv double %constant_358_10, %multiply.858.3.clone.1
  %112 = getelementptr double, ptr %arg5, i32 %linear_index
  %113 = getelementptr inbounds double, ptr %112, i32 0
  %114 = load double, ptr %113, align 8, !invariant.load !120
  %subtract.78.1.clone.1 = fsub double %add.344.49, %add.340.63
  %multiply.859.2.clone.1 = fmul double %subtract.78.1.clone.1, %subtract.78.1.clone.1
  %multiply.860.1.clone.1 = fmul double %114, %multiply.859.2.clone.1
  %add.345.1.clone.1 = fadd double %divide.395.3.clone.1, %multiply.860.1.clone.1
  %constant_366_1_clone_1 = load double, ptr @108, align 8
  %add.346.1.clone.1 = fadd double %add.345.1.clone.1, %constant_366_1_clone_1
  %multiply.865.2 = fmul double %multiply.864.5, %add.346.1.clone.1
  %115 = getelementptr double, ptr %arg15, i32 %linear_index
  %116 = getelementptr inbounds double, ptr %115, i32 0
  %117 = load double, ptr %116, align 8
  %divide.396.1.clone.1 = fdiv double %constant_358_10, %117
  %118 = getelementptr double, ptr %arg17, i32 %linear_index
  %119 = getelementptr inbounds double, ptr %118, i32 0
  %120 = load double, ptr %119, align 8, !invariant.load !120
  %121 = call double @__nv_exp(double %120)
  %multiply.863.13.clone.1 = fmul double %25, %121
  %compare.267.9.clone.1 = fcmp ogt double %multiply.863.13.clone.1, %constant_359_18
  %122 = zext i1 %compare.267.9.clone.1 to i8
  %123 = getelementptr double, ptr %arg20, i32 %linear_index
  %124 = getelementptr inbounds double, ptr %123, i32 0
  %125 = load double, ptr %124, align 8, !invariant.load !120
  %126 = trunc i8 %122 to i1
  %127 = select i1 %126, double %multiply.863.13.clone.1, double %125
  %add.348.2.clone.1 = fadd double %divide.396.1.clone.1, %127
  %divide.397.1.clone.1 = fdiv double %constant_358_10, %add.348.2.clone.1
  %constant_361_2 = load double, ptr @112, align 8
  %multiply.866.9 = fmul double %divide.397.1.clone.1, %constant_361_2
  %divide.398.5 = fdiv double %constant_358_10, %multiply.866.9
  %multiply.867.3 = fmul double %multiply.865.2, %divide.398.5
  %128 = getelementptr i64, ptr %arg1, i32 %linear_index
  %129 = getelementptr inbounds i64, ptr %128, i32 0
  %130 = load i64, ptr %129, align 8, !invariant.load !120
  %131 = sitofp i64 %130 to double
  %multiply.868.3 = fmul double %multiply.867.3, %131
  %add.349.1 = fadd double %add.347.3, %multiply.868.3
  %132 = getelementptr double, ptr %arg0, i32 %linear_index
  %133 = getelementptr inbounds double, ptr %132, i32 0
  %134 = load double, ptr %133, align 8, !invariant.load !120
  %135 = trunc i8 %74 to i1
  %136 = select i1 %135, double %add.349.1, double %134
  %137 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } undef, double %136, 0
  %138 = getelementptr i64, ptr %arg1, i32 %linear_index
  %139 = getelementptr inbounds i64, ptr %138, i32 0
  %140 = load i64, ptr %139, align 8, !invariant.load !120
  %constant_357_753 = load i64, ptr @105, align 8
  %141 = icmp ne i64 %140, %constant_357_753
  %142 = zext i1 %141 to i8
  %143 = zext i8 %142 to i32
  %constant_362_2_clone_1 = load i32, ptr @111, align 4
  %144 = icmp slt i32 %143, %constant_362_2_clone_1
  %145 = zext i1 %144 to i8
  %add.350.2.clone.1 = fadd double %divide.396.1.clone.1, %multiply.863.13.clone.1
  %divide.399.5.clone.1 = fdiv double %constant_358_10, %add.350.2.clone.1
  %multiply.869.4.clone.1 = fmul double %multiply.864.5, %multiply.864.5
  %constant_363_4_clone_1 = load double, ptr @110, align 8
  %multiply.870.7.clone.1 = fmul double %multiply.869.4.clone.1, %constant_363_4_clone_1
  %multiply.871.5.clone.1 = fmul double %multiply.869.4.clone.1, %add.346.1.clone.1
  %add.351.5.clone.1 = fadd double %multiply.870.7.clone.1, %multiply.871.5.clone.1
  %multiply.872.11.clone.1 = fmul double %86, %86
  %multiply.873.9.clone.1 = fmul double %multiply.872.11.clone.1, %constant_363_4_clone_1
  %multiply.874.4.clone.1 = fmul double %multiply.873.9.clone.1, %multiply.857.9
  %multiply.875.5.clone.1 = fmul double %multiply.874.4.clone.1, %add.346.1.clone.1
  %subtract.79.5.clone.1 = fsub double %add.351.5.clone.1, %multiply.875.5.clone.1
  %multiply.876.3.clone.1 = fmul double %subtract.79.5.clone.1, %131
  %add.352.3.clone.1 = fadd double %divide.397.1.clone.1, %multiply.876.3.clone.1
  %compare.270.5.clone.1 = fcmp ogt double %add.352.3.clone.1, %constant_359_18
  %146 = zext i1 %compare.270.5.clone.1 to i8
  %147 = getelementptr double, ptr %arg16, i32 %linear_index
  %148 = getelementptr inbounds double, ptr %147, i32 0
  %149 = load double, ptr %148, align 8, !invariant.load !120
  %150 = trunc i8 %146 to i1
  %151 = select i1 %150, double %add.352.3.clone.1, double %149
  %152 = trunc i8 %145 to i1
  %153 = select i1 %152, double %divide.399.5.clone.1, double %151
  %154 = getelementptr double, ptr %arg15, i32 %linear_index
  %155 = getelementptr inbounds double, ptr %154, i32 0
  %156 = load double, ptr %155, align 8
  %157 = trunc i8 %74 to i1
  %158 = select i1 %157, double %153, double %156
  %159 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %137, double %158, 1
  %160 = getelementptr double, ptr %arg18, i32 %linear_index
  %161 = getelementptr inbounds double, ptr %160, i32 0
  %162 = load double, ptr %161, align 8
  %163 = trunc i8 %74 to i1
  %164 = select i1 %163, double %divide.397.1.clone.1, double %162
  %165 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %159, double %164, 2
  %multiply.877.1.clone.1 = fmul double %127, %divide.397.1.clone.1
  %166 = getelementptr double, ptr %arg19, i32 %linear_index
  %167 = getelementptr inbounds double, ptr %166, i32 0
  %168 = load double, ptr %167, align 8
  %169 = trunc i8 %74 to i1
  %170 = select i1 %169, double %multiply.877.1.clone.1, double %168
  %171 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %165, double %170, 3
  %172 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %171, double %divide.397.1.clone.1, 4
  %173 = getelementptr double, ptr %arg21, i32 %linear_index
  %174 = getelementptr inbounds double, ptr %173, i32 0
  %175 = load double, ptr %174, align 8
  %176 = trunc i8 %74 to i1
  %177 = select i1 %176, double %divide.396.1.clone.1, double %175
  %178 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %172, double %177, 5
  %179 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %178, double %divide.396.1.clone.1, 6
  %180 = getelementptr double, ptr %arg22, i32 %linear_index
  %181 = getelementptr inbounds double, ptr %180, i32 0
  %182 = load double, ptr %181, align 8
  %183 = trunc i8 %74 to i1
  %184 = select i1 %183, double %add.347.3, double %182
  %185 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %179, double %184, 7
  %186 = getelementptr double, ptr %arg23, i32 %linear_index
  %187 = getelementptr inbounds double, ptr %186, i32 0
  %188 = load double, ptr %187, align 8
  %189 = trunc i8 %74 to i1
  %190 = select i1 %189, double %add.346.1.clone.1, double %188
  %191 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %185, double %190, 8
  %192 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %191, double %add.346.1.clone.1, 9
  %193 = getelementptr double, ptr %arg26, i32 %linear_index
  %194 = getelementptr inbounds double, ptr %193, i32 0
  %195 = load double, ptr %194, align 8
  %196 = trunc i8 %74 to i1
  %197 = select i1 %196, double %divide.394.1.clone.1, double %195
  %198 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %192, double %197, 10
  %199 = getelementptr double, ptr %arg14, i32 %linear_index
  %200 = getelementptr inbounds double, ptr %199, i32 0
  %201 = load double, ptr %200, align 8, !invariant.load !120
  %202 = trunc i8 %74 to i1
  %203 = select i1 %202, double %add.344.49, double %201
  %204 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %198, double %203, 11
  %205 = getelementptr double, ptr %arg27, i32 %linear_index
  %206 = getelementptr inbounds double, ptr %205, i32 0
  %207 = load double, ptr %206, align 8
  %208 = trunc i8 %74 to i1
  %209 = select i1 %208, double %subtract.78.1.clone.1, double %207
  %210 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %204, double %209, 12
  %211 = getelementptr double, ptr %arg28, i32 %linear_index
  %212 = getelementptr inbounds double, ptr %211, i32 0
  %213 = load double, ptr %212, align 8, !invariant.load !120
  %214 = getelementptr double, ptr %arg29, i32 %linear_index
  %215 = getelementptr inbounds double, ptr %214, i32 0
  %216 = load double, ptr %215, align 8
  %217 = trunc i8 %74 to i1
  %218 = select i1 %217, double %213, double %216
  %219 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %210, double %218, 13
  %220 = getelementptr double, ptr %arg30, i32 %linear_index
  %221 = getelementptr inbounds double, ptr %220, i32 0
  %222 = load double, ptr %221, align 8
  %223 = trunc i8 %74 to i1
  %224 = select i1 %223, double %25, double %222
  %225 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %219, double %224, 14
  %226 = getelementptr double, ptr %arg31, i32 %linear_index
  %227 = getelementptr inbounds double, ptr %226, i32 0
  %228 = load double, ptr %227, align 8, !invariant.load !120
  %229 = getelementptr double, ptr %arg32, i32 %linear_index
  %230 = getelementptr inbounds double, ptr %229, i32 0
  %231 = load double, ptr %230, align 8
  %232 = trunc i8 %74 to i1
  %233 = select i1 %232, double %228, double %231
  %234 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %225, double %233, 15
  %235 = getelementptr double, ptr %arg33, i32 %linear_index
  %236 = getelementptr inbounds double, ptr %235, i32 0
  %237 = load double, ptr %236, align 8
  %238 = trunc i8 %74 to i1
  %239 = select i1 %238, double %54, double %237
  %240 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %234, double %239, 16
  %241 = getelementptr i32, ptr %arg35, i32 %linear_index
  %242 = getelementptr inbounds i32, ptr %241, i32 0
  %243 = load i32, ptr %242, align 4
  %244 = trunc i8 %74 to i1
  %245 = select i1 %244, i32 %64, i32 %243
  %246 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %240, i32 %245, 17
  %247 = getelementptr double, ptr %arg31, i32 %linear_index
  %248 = getelementptr inbounds double, ptr %247, i32 0
  %249 = load double, ptr %248, align 8, !invariant.load !120
  %250 = getelementptr double, ptr %arg36, i32 %linear_index
  %251 = getelementptr inbounds double, ptr %250, i32 0
  %252 = load double, ptr %251, align 8
  %253 = trunc i8 %74 to i1
  %254 = select i1 %253, double %249, double %252
  %255 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %246, double %254, 18
  %256 = getelementptr double, ptr %arg37, i32 %linear_index
  %257 = getelementptr inbounds double, ptr %256, i32 0
  %258 = load double, ptr %257, align 8
  %259 = trunc i8 %74 to i1
  %260 = select i1 %259, double %add.340.63, double %258
  %261 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %255, double %260, 19
  %262 = getelementptr double, ptr %arg5, i32 %linear_index
  %263 = getelementptr inbounds double, ptr %262, i32 0
  %264 = load double, ptr %263, align 8, !invariant.load !120
  %265 = getelementptr double, ptr %arg38, i32 %linear_index
  %266 = getelementptr inbounds double, ptr %265, i32 0
  %267 = load double, ptr %266, align 8
  %268 = trunc i8 %74 to i1
  %269 = select i1 %268, double %264, double %267
  %270 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %261, double %269, 20
  %271 = getelementptr double, ptr %arg24, i32 %linear_index
  %272 = getelementptr inbounds double, ptr %271, i32 0
  %273 = load double, ptr %272, align 8
  %274 = getelementptr double, ptr %arg39, i32 %linear_index
  %275 = getelementptr inbounds double, ptr %274, i32 0
  %276 = load double, ptr %275, align 8
  %277 = trunc i8 %74 to i1
  %278 = select i1 %277, double %273, double %276
  %279 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %270, double %278, 21
  %280 = getelementptr double, ptr %arg25, i32 %linear_index
  %281 = getelementptr inbounds double, ptr %280, i32 0
  %282 = load double, ptr %281, align 8, !invariant.load !120
  %283 = getelementptr double, ptr %arg40, i32 %linear_index
  %284 = getelementptr inbounds double, ptr %283, i32 0
  %285 = load double, ptr %284, align 8
  %286 = trunc i8 %74 to i1
  %287 = select i1 %286, double %282, double %285
  %288 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %279, double %287, 22
  %289 = getelementptr double, ptr %arg41, i32 %linear_index
  %290 = getelementptr inbounds double, ptr %289, i32 0
  %291 = load double, ptr %290, align 8
  %292 = trunc i8 %74 to i1
  %293 = select i1 %292, double %multiply.857.9, double %291
  %294 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %288, double %293, 23
  %295 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %294, double %divide.394.1.clone.1, 24
  %296 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %295, double %divide.393.1.clone.1, 25
  %297 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 0
  %298 = getelementptr double, ptr %arg43, i32 %linear_index
  %299 = getelementptr inbounds double, ptr %298, i32 0
  store double %297, ptr %299, align 8
  %300 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 1
  %301 = getelementptr double, ptr %arg15, i32 %linear_index
  %302 = getelementptr inbounds double, ptr %301, i32 0
  store double %300, ptr %302, align 8
  %303 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 2
  %304 = getelementptr double, ptr %arg18, i32 %linear_index
  %305 = getelementptr inbounds double, ptr %304, i32 0
  store double %303, ptr %305, align 8
  %306 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 3
  %307 = getelementptr double, ptr %arg19, i32 %linear_index
  %308 = getelementptr inbounds double, ptr %307, i32 0
  store double %306, ptr %308, align 8
  %309 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 4
  %310 = getelementptr double, ptr %arg44, i32 %linear_index
  %311 = getelementptr inbounds double, ptr %310, i32 0
  store double %309, ptr %311, align 8
  %312 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 5
  %313 = getelementptr double, ptr %arg21, i32 %linear_index
  %314 = getelementptr inbounds double, ptr %313, i32 0
  store double %312, ptr %314, align 8
  %315 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 6
  %316 = getelementptr double, ptr %arg45, i32 %linear_index
  %317 = getelementptr inbounds double, ptr %316, i32 0
  store double %315, ptr %317, align 8
  %318 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 7
  %319 = getelementptr double, ptr %arg22, i32 %linear_index
  %320 = getelementptr inbounds double, ptr %319, i32 0
  store double %318, ptr %320, align 8
  %321 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 8
  %322 = getelementptr double, ptr %arg23, i32 %linear_index
  %323 = getelementptr inbounds double, ptr %322, i32 0
  store double %321, ptr %323, align 8
  %324 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 9
  %325 = getelementptr double, ptr %arg24, i32 %linear_index
  %326 = getelementptr inbounds double, ptr %325, i32 0
  store double %324, ptr %326, align 8
  %327 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 10
  %328 = getelementptr double, ptr %arg26, i32 %linear_index
  %329 = getelementptr inbounds double, ptr %328, i32 0
  store double %327, ptr %329, align 8
  %330 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 11
  %331 = getelementptr double, ptr %arg46, i32 %linear_index
  %332 = getelementptr inbounds double, ptr %331, i32 0
  store double %330, ptr %332, align 8
  %333 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 12
  %334 = getelementptr double, ptr %arg27, i32 %linear_index
  %335 = getelementptr inbounds double, ptr %334, i32 0
  store double %333, ptr %335, align 8
  %336 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 13
  %337 = getelementptr double, ptr %arg29, i32 %linear_index
  %338 = getelementptr inbounds double, ptr %337, i32 0
  store double %336, ptr %338, align 8
  %339 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 14
  %340 = getelementptr double, ptr %arg30, i32 %linear_index
  %341 = getelementptr inbounds double, ptr %340, i32 0
  store double %339, ptr %341, align 8
  %342 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 15
  %343 = getelementptr double, ptr %arg32, i32 %linear_index
  %344 = getelementptr inbounds double, ptr %343, i32 0
  store double %342, ptr %344, align 8
  %345 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 16
  %346 = getelementptr double, ptr %arg33, i32 %linear_index
  %347 = getelementptr inbounds double, ptr %346, i32 0
  store double %345, ptr %347, align 8
  %348 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 17
  %349 = getelementptr i32, ptr %arg35, i32 %linear_index
  %350 = getelementptr inbounds i32, ptr %349, i32 0
  store i32 %348, ptr %350, align 4
  %351 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 18
  %352 = getelementptr double, ptr %arg36, i32 %linear_index
  %353 = getelementptr inbounds double, ptr %352, i32 0
  store double %351, ptr %353, align 8
  %354 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 19
  %355 = getelementptr double, ptr %arg37, i32 %linear_index
  %356 = getelementptr inbounds double, ptr %355, i32 0
  store double %354, ptr %356, align 8
  %357 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 20
  %358 = getelementptr double, ptr %arg38, i32 %linear_index
  %359 = getelementptr inbounds double, ptr %358, i32 0
  store double %357, ptr %359, align 8
  %360 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 21
  %361 = getelementptr double, ptr %arg39, i32 %linear_index
  %362 = getelementptr inbounds double, ptr %361, i32 0
  store double %360, ptr %362, align 8
  %363 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 22
  %364 = getelementptr double, ptr %arg40, i32 %linear_index
  %365 = getelementptr inbounds double, ptr %364, i32 0
  store double %363, ptr %365, align 8
  %366 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 23
  %367 = getelementptr double, ptr %arg41, i32 %linear_index
  %368 = getelementptr inbounds double, ptr %367, i32 0
  store double %366, ptr %368, align 8
  %369 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 24
  %370 = getelementptr double, ptr %arg47, i32 %linear_index
  %371 = getelementptr inbounds double, ptr %370, i32 0
  store double %369, ptr %371, align 8
  %372 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %296, 25
  %373 = getelementptr double, ptr %arg48, i32 %linear_index
  %374 = getelementptr inbounds double, ptr %373, i32 0
  store double %372, ptr %374, align 8
  br label %loop_add_divide_select_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #0

define void @loop_dynamic_update_slice_fusion_2(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8, ptr noalias align 16 dereferenceable(32) %arg9, ptr noalias align 16 dereferenceable(1536) %arg10, ptr noalias align 128 dereferenceable(8) %arg11) {
entry:
  %param_11.205 = load i64, ptr %arg11, align 8, !invariant.load !120
  %constant_357_17 = load i64, ptr @115, align 8
  %0 = icmp slt i64 %param_11.205, %constant_357_17
  %1 = zext i1 %0 to i8
  %param_11.2051 = load i64, ptr %arg11, align 8, !invariant.load !120
  %constant_356_62 = load i64, ptr @114, align 8
  %2 = add i64 %param_11.2051, %constant_356_62
  %param_11.2052 = load i64, ptr %arg11, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_11.2052
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_173 = load i64, ptr @115, align 8
  %9 = icmp sge i64 0, %constant_357_173
  %10 = select i1 %9, i64 0, i64 %constant_357_173
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.916.1.in_bounds-true, label %dynamic-update-slice.916.1.in_bounds-after

dynamic-update-slice.916.1.in_bounds-after:       ; preds = %dynamic-update-slice.916.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.916.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.718 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7184 = load double, ptr %param_1.718, align 8, !invariant.load !120
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.460 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.4605 = load double, ptr %param_5.460, align 8, !invariant.load !120
  %param_11.2056 = load i64, ptr %arg11, align 8, !invariant.load !120
  %constant_357_177 = load i64, ptr @115, align 8
  %24 = icmp slt i64 %param_11.2056, %constant_357_177
  %25 = zext i1 %24 to i8
  %param_11.2058 = load i64, ptr %arg11, align 8, !invariant.load !120
  %constant_356_629 = load i64, ptr @114, align 8
  %26 = add i64 %param_11.2058, %constant_356_629
  %param_11.20510 = load i64, ptr %arg11, align 8, !invariant.load !120
  %27 = trunc i8 %25 to i1
  %28 = select i1 %27, i64 %26, i64 %param_11.20510
  %29 = icmp sge i64 0, %28
  %30 = select i1 %29, i64 0, i64 %28
  %31 = icmp sle i64 191, %30
  %dynamic-slice.39.67.start_idx0 = select i1 %31, i64 191, i64 %30
  %32 = add i64 %dynamic-slice.39.67.start_idx0, 0
  %param_10.258 = getelementptr inbounds [192 x double], ptr %arg10, i64 0, i64 %32
  %param_10.25811 = load double, ptr %param_10.258, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.295 = getelementptr inbounds double, ptr %33, i64 0
  %param_7.29512 = load double, ptr %param_7.295, align 8, !invariant.load !120
  %34 = getelementptr double, ptr %arg9, i64 %linear_index
  %param_9.303 = getelementptr inbounds double, ptr %34, i64 0
  %param_9.30313 = load double, ptr %param_9.303, align 8, !invariant.load !120
  %35 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.289 = getelementptr inbounds double, ptr %35, i64 0
  %param_8.28914 = load double, ptr %param_8.289, align 8, !invariant.load !120
  %multiply.852.27 = fmul double %param_9.30313, %param_8.28914
  %add.342.25 = fadd double %param_7.29512, %multiply.852.27
  %36 = call double @__nv_exp(double %add.342.25)
  %multiply.853.21 = fmul double %param_10.25811, %36
  %constant_359_4 = load double, ptr @113, align 8
  %compare.265.21 = fcmp ogt double %multiply.853.21, %constant_359_4
  %37 = zext i1 %compare.265.21 to i8
  %38 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.405 = getelementptr inbounds double, ptr %38, i64 0
  %param_6.40515 = load double, ptr %param_6.405, align 8, !invariant.load !120
  %39 = trunc i8 %37 to i1
  %40 = select i1 %39, double %multiply.853.21, double %param_6.40515
  %41 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.539 = getelementptr inbounds double, ptr %41, i64 0
  %param_4.53916 = load double, ptr %param_4.539, align 8, !invariant.load !120
  %multiply.857.25 = fmul double %40, %param_4.53916
  %multiply.864.17 = fmul double %param_5.4605, %multiply.857.25
  %multiply.869.6 = fmul double %multiply.864.17, %multiply.864.17
  %constant_363_2 = load double, ptr @116, align 8
  %multiply.870.9 = fmul double %multiply.869.6, %constant_363_2
  %42 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.610 = getelementptr inbounds double, ptr %42, i64 0
  %param_3.61017 = load double, ptr %param_3.610, align 8, !invariant.load !120
  %multiply.871.7 = fmul double %multiply.869.6, %param_3.61017
  %add.351.7 = fadd double %multiply.870.9, %multiply.871.7
  %multiply.872.13 = fmul double %param_5.4605, %param_5.4605
  %multiply.873.11 = fmul double %multiply.872.13, %constant_363_2
  %multiply.874.6 = fmul double %multiply.873.11, %multiply.857.25
  %43 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.61018 = getelementptr inbounds double, ptr %43, i64 0
  %param_3.61019 = load double, ptr %param_3.61018, align 8, !invariant.load !120
  %multiply.875.7 = fmul double %multiply.874.6, %param_3.61019
  %subtract.79.7 = fsub double %add.351.7, %multiply.875.7
  %44 = getelementptr i64, ptr %arg2, i64 %linear_index
  %param_2.638 = getelementptr inbounds i64, ptr %44, i64 0
  %param_2.63820 = load i64, ptr %param_2.638, align 8, !invariant.load !120
  %45 = sitofp i64 %param_2.63820 to double
  %multiply.876.5 = fmul double %subtract.79.7, %45
  %add.352.5 = fadd double %param_1.7184, %multiply.876.5
  %compare.270.3 = fcmp ogt double %add.352.5, %constant_359_4
  %46 = zext i1 %compare.270.3 to i8
  %47 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %46, ptr %47, align 1
  br label %dynamic-update-slice.916.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_1(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(768) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(1536) %arg6, ptr noalias align 16 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8) {
entry:
  %param_1.662 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_357_13 = load i64, ptr @119, align 8
  %0 = icmp slt i64 %param_1.662, %constant_357_13
  %1 = zext i1 %0 to i8
  %param_1.6621 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_356_60 = load i64, ptr @118, align 8
  %2 = add i64 %param_1.6621, %constant_356_60
  %param_1.6622 = load i64, ptr %arg1, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6622
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_133 = load i64, ptr @119, align 8
  %9 = icmp sge i64 0, %constant_357_133
  %10 = select i1 %9, i64 0, i64 %constant_357_133
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.917.1.in_bounds-true, label %dynamic-update-slice.917.1.in_bounds-after

dynamic-update-slice.917.1.in_bounds-after:       ; preds = %dynamic-update-slice.917.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.917.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.296 = getelementptr inbounds double, ptr %22, i64 0
  %param_7.2964 = load double, ptr %param_7.296, align 8, !invariant.load !120
  %23 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.290 = getelementptr inbounds double, ptr %23, i64 0
  %param_8.2905 = load double, ptr %param_8.290, align 8, !invariant.load !120
  %multiply.848.73 = fmul double %param_7.2964, %param_8.2905
  %param_1.6626 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_357_137 = load i64, ptr @119, align 8
  %24 = icmp slt i64 %param_1.6626, %constant_357_137
  %25 = zext i1 %24 to i8
  %param_1.6628 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_356_609 = load i64, ptr @118, align 8
  %26 = add i64 %param_1.6628, %constant_356_609
  %param_1.66210 = load i64, ptr %arg1, align 8, !invariant.load !120
  %27 = trunc i8 %25 to i1
  %28 = select i1 %27, i64 %26, i64 %param_1.66210
  %29 = icmp sge i64 0, %28
  %30 = select i1 %29, i64 0, i64 %28
  %31 = icmp sle i64 191, %30
  %dynamic-slice.39.126.start_idx0 = select i1 %31, i64 191, i64 %30
  %32 = add i64 %dynamic-slice.39.126.start_idx0, 0
  %param_6.406 = getelementptr inbounds [192 x double], ptr %arg6, i64 0, i64 %32
  %param_6.40611 = load double, ptr %param_6.406, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.461 = getelementptr inbounds double, ptr %33, i64 0
  %param_5.46112 = load double, ptr %param_5.461, align 8, !invariant.load !120
  %multiply.849.75 = fmul double %param_6.40611, %param_5.46112
  %add.340.73 = fadd double %multiply.848.73, %multiply.849.75
  %34 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.657 = getelementptr inbounds double, ptr %34, i64 0
  %param_2.65713 = load double, ptr %param_2.657, align 8, !invariant.load !120
  %35 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.625 = getelementptr inbounds double, ptr %35, i64 0
  %param_3.62514 = load double, ptr %param_3.625, align 8, !invariant.load !120
  %36 = icmp sge i64 0, %28
  %37 = select i1 %36, i64 0, i64 %28
  %38 = icmp sle i64 191, %37
  %dynamic-slice.40.74.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.40.74.start_idx0, 0
  %param_4.554 = getelementptr inbounds [192 x i32], ptr %arg4, i64 0, i64 %39
  %param_4.55415 = load i32, ptr %param_4.554, align 4, !invariant.load !120
  %40 = sitofp i32 %param_4.55415 to double
  %multiply.855.63 = fmul double %param_3.62514, %40
  %multiply.856.59 = fmul double %param_2.65713, %multiply.855.63
  %add.344.59 = fadd double %add.340.73, %multiply.856.59
  %41 = call double @llvm.fabs.f64(double %add.344.59)
  %42 = fcmp one double %41, 0x7FF0000000000000
  %43 = zext i1 %42 to i8
  %44 = call double @llvm.fabs.f64(double %add.344.59)
  %constant_365_1 = load double, ptr @117, align 8
  %compare.266.47 = fcmp olt double %44, %constant_365_1
  %45 = zext i1 %compare.266.47 to i8
  %46 = and i8 %43, %45
  %47 = getelementptr inbounds [192 x [4 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %46, ptr %47, align 1
  br label %dynamic-update-slice.917.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(768) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 16 dereferenceable(1536) %arg6, ptr noalias align 16 dereferenceable(32) %arg7, ptr noalias align 128 dereferenceable(32) %arg8) {
entry:
  %param_1.657 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_357_7 = load i64, ptr @122, align 8
  %0 = icmp slt i64 %param_1.657, %constant_357_7
  %1 = zext i1 %0 to i8
  %param_1.6571 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_356_14 = load i64, ptr @121, align 8
  %2 = add i64 %param_1.6571, %constant_356_14
  %param_1.6572 = load i64, ptr %arg1, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6572
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_73 = load i64, ptr @122, align 8
  %9 = icmp sge i64 0, %constant_357_73
  %10 = select i1 %9, i64 0, i64 %constant_357_73
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_357_74 = load i64, ptr @122, align 8
  %13 = icmp sge i64 0, %constant_357_74
  %14 = select i1 %13, i64 0, i64 %constant_357_74
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 4
  %24 = udiv i64 %linear_index0, 4
  %25 = icmp ult i64 %linear_index, 4
  br i1 %25, label %dynamic-update-slice.918.1.in_bounds-true, label %dynamic-update-slice.918.1.in_bounds-after

dynamic-update-slice.918.1.in_bounds-after:       ; preds = %dynamic-update-slice.918.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.918.1.in_bounds-true:        ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.313 = getelementptr inbounds double, ptr %29, i64 0
  %param_7.3135 = load double, ptr %param_7.313, align 8, !invariant.load !120
  %30 = getelementptr double, ptr %arg8, i64 %linear_index
  %param_8.308 = getelementptr inbounds double, ptr %30, i64 0
  %param_8.3086 = load double, ptr %param_8.308, align 8, !invariant.load !120
  %multiply.848.71 = fmul double %param_7.3135, %param_8.3086
  %param_1.6577 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_357_78 = load i64, ptr @122, align 8
  %31 = icmp slt i64 %param_1.6577, %constant_357_78
  %32 = zext i1 %31 to i8
  %param_1.6579 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_356_1410 = load i64, ptr @121, align 8
  %33 = add i64 %param_1.6579, %constant_356_1410
  %param_1.65711 = load i64, ptr %arg1, align 8, !invariant.load !120
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, i64 %33, i64 %param_1.65711
  %36 = icmp sge i64 0, %35
  %37 = select i1 %36, i64 0, i64 %35
  %38 = icmp sle i64 191, %37
  %dynamic-slice.39.124.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.39.124.start_idx0, 0
  %param_6.423 = getelementptr inbounds [192 x double], ptr %arg6, i64 0, i64 %39
  %param_6.42312 = load double, ptr %param_6.423, align 8, !invariant.load !120
  %40 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.475 = getelementptr inbounds double, ptr %40, i64 0
  %param_5.47513 = load double, ptr %param_5.475, align 8, !invariant.load !120
  %multiply.849.73 = fmul double %param_6.42312, %param_5.47513
  %add.340.71 = fadd double %multiply.848.71, %multiply.849.73
  %41 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.668 = getelementptr inbounds double, ptr %41, i64 0
  %param_2.66814 = load double, ptr %param_2.668, align 8, !invariant.load !120
  %42 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.639 = getelementptr inbounds double, ptr %42, i64 0
  %param_3.63915 = load double, ptr %param_3.639, align 8, !invariant.load !120
  %43 = icmp sge i64 0, %35
  %44 = select i1 %43, i64 0, i64 %35
  %45 = icmp sle i64 191, %44
  %dynamic-slice.40.72.start_idx0 = select i1 %45, i64 191, i64 %44
  %46 = add i64 %dynamic-slice.40.72.start_idx0, 0
  %param_4.568 = getelementptr inbounds [192 x i32], ptr %arg4, i64 0, i64 %46
  %param_4.56816 = load i32, ptr %param_4.568, align 4, !invariant.load !120
  %47 = sitofp i32 %param_4.56816 to double
  %multiply.855.61 = fmul double %param_3.63915, %47
  %multiply.856.57 = fmul double %param_2.66814, %multiply.855.61
  %add.344.57 = fadd double %add.340.71, %multiply.856.57
  %48 = call double @llvm.fabs.f64(double %add.344.57)
  %49 = fcmp one double %48, 0x7FF0000000000000
  %50 = zext i1 %49 to i8
  %51 = call double @llvm.fabs.f64(double %add.344.57)
  %constant_365_23 = load double, ptr @120, align 8
  %compare.266.45 = fcmp olt double %51, %constant_365_23
  %52 = zext i1 %compare.266.45 to i8
  %53 = and i8 %50, %52
  %54 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %53, ptr %54, align 1
  br label %dynamic-update-slice.918.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_16(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(32) %arg4, ptr noalias align 16 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(32) %arg7, ptr noalias align 16 dereferenceable(1536) %arg8, ptr noalias align 128 dereferenceable(8) %arg9) {
entry:
  %param_9.298 = load i64, ptr %arg9, align 8, !invariant.load !120
  %constant_357_3 = load i64, ptr @124, align 8
  %0 = icmp slt i64 %param_9.298, %constant_357_3
  %1 = zext i1 %0 to i8
  %param_9.2981 = load i64, ptr %arg9, align 8, !invariant.load !120
  %constant_356_54 = load i64, ptr @123, align 8
  %2 = add i64 %param_9.2981, %constant_356_54
  %param_9.2982 = load i64, ptr %arg9, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_9.2982
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_33 = load i64, ptr @124, align 8
  %9 = icmp sge i64 0, %constant_357_33
  %10 = select i1 %9, i64 0, i64 %constant_357_33
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.901.1.in_bounds-true, label %dynamic-update-slice.901.1.in_bounds-after

dynamic-update-slice.901.1.in_bounds-after:       ; preds = %dynamic-update-slice.901.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.901.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.560 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.5604 = load double, ptr %param_3.560, align 8, !invariant.load !120
  %param_9.2985 = load i64, ptr %arg9, align 8, !invariant.load !120
  %constant_357_36 = load i64, ptr @124, align 8
  %23 = icmp slt i64 %param_9.2985, %constant_357_36
  %24 = zext i1 %23 to i8
  %param_9.2987 = load i64, ptr %arg9, align 8, !invariant.load !120
  %constant_356_548 = load i64, ptr @123, align 8
  %25 = add i64 %param_9.2987, %constant_356_548
  %param_9.2989 = load i64, ptr %arg9, align 8, !invariant.load !120
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_9.2989
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.63.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.63.start_idx0, 0
  %param_8.281 = getelementptr inbounds [192 x double], ptr %arg8, i64 0, i64 %31
  %param_8.28110 = load double, ptr %param_8.281, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.451 = getelementptr inbounds double, ptr %32, i64 0
  %param_5.45111 = load double, ptr %param_5.451, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.286 = getelementptr inbounds double, ptr %33, i64 0
  %param_7.28612 = load double, ptr %param_7.286, align 8, !invariant.load !120
  %34 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.396 = getelementptr inbounds double, ptr %34, i64 0
  %param_6.39613 = load double, ptr %param_6.396, align 8, !invariant.load !120
  %multiply.852.23 = fmul double %param_7.28612, %param_6.39613
  %add.342.21 = fadd double %param_5.45111, %multiply.852.23
  %35 = call double @__nv_exp(double %add.342.21)
  %multiply.853.17 = fmul double %param_8.28110, %35
  %constant_359_15 = load double, ptr @125, align 8
  %compare.265.17 = fcmp ogt double %multiply.853.17, %constant_359_15
  %36 = zext i1 %compare.265.17 to i8
  %37 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.502 = getelementptr inbounds double, ptr %37, i64 0
  %param_4.50214 = load double, ptr %param_4.502, align 8, !invariant.load !120
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, double %multiply.853.17, double %param_4.50214
  %40 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.566 = getelementptr inbounds double, ptr %40, i64 0
  %param_2.56615 = load double, ptr %param_2.566, align 8, !invariant.load !120
  %multiply.857.17 = fmul double %39, %param_2.56615
  %multiply.864.13 = fmul double %param_3.5604, %multiply.857.17
  %41 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.653 = getelementptr inbounds double, ptr %41, i64 0
  %param_1.65316 = load double, ptr %param_1.653, align 8, !invariant.load !120
  %multiply.865.1 = fmul double %multiply.864.13, %param_1.65316
  %42 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.865.1, ptr %42, align 8
  br label %dynamic-update-slice.901.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_50(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4, ptr noalias align 128 dereferenceable(8) %arg5) {
entry:
  %param_5.443 = load i64, ptr %arg5, align 8, !invariant.load !120
  %constant_357_28 = load i64, ptr @127, align 8
  %0 = icmp slt i64 %param_5.443, %constant_357_28
  %1 = zext i1 %0 to i8
  %param_5.4431 = load i64, ptr %arg5, align 8, !invariant.load !120
  %constant_356_15 = load i64, ptr @126, align 8
  %2 = add i64 %param_5.4431, %constant_356_15
  %param_5.4432 = load i64, ptr %arg5, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_5.4432
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_283 = load i64, ptr @127, align 8
  %9 = icmp sge i64 0, %constant_357_283
  %10 = select i1 %9, i64 0, i64 %constant_357_283
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.866.1.in_bounds-true, label %dynamic-update-slice.866.1.in_bounds-after

dynamic-update-slice.866.1.in_bounds-after:       ; preds = %dynamic-update-slice.866.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.866.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_13 = load double, ptr @129, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.716 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7164 = load double, ptr %param_1.716, align 8, !invariant.load !120
  %param_5.4435 = load i64, ptr %arg5, align 8, !invariant.load !120
  %constant_357_286 = load i64, ptr @127, align 8
  %23 = icmp slt i64 %param_5.4435, %constant_357_286
  %24 = zext i1 %23 to i8
  %param_5.4437 = load i64, ptr %arg5, align 8, !invariant.load !120
  %constant_356_158 = load i64, ptr @126, align 8
  %25 = add i64 %param_5.4437, %constant_356_158
  %param_5.4439 = load i64, ptr %arg5, align 8, !invariant.load !120
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_5.4439
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.17.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.17.start_idx0, 0
  %param_4.538 = getelementptr inbounds [192 x double], ptr %arg4, i64 0, i64 %31
  %param_4.53810 = load double, ptr %param_4.538, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.609 = getelementptr inbounds double, ptr %32, i64 0
  %param_3.60911 = load double, ptr %param_3.609, align 8, !invariant.load !120
  %33 = call double @__nv_exp(double %param_3.60911)
  %multiply.863.7 = fmul double %param_4.53810, %33
  %constant_359_3 = load double, ptr @128, align 8
  %compare.267.13 = fcmp ogt double %multiply.863.7, %constant_359_3
  %34 = zext i1 %compare.267.13 to i8
  %35 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.632 = getelementptr inbounds double, ptr %35, i64 0
  %param_2.63212 = load double, ptr %param_2.632, align 8, !invariant.load !120
  %36 = trunc i8 %34 to i1
  %37 = select i1 %36, double %multiply.863.7, double %param_2.63212
  %add.348.1 = fadd double %param_1.7164, %37
  %multiply.879.1 = fmul double %add.348.1, %add.348.1
  %divide.401.1 = fdiv double %constant_358_13, %multiply.879.1
  %38 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.401.1, ptr %38, align 8
  br label %dynamic-update-slice.866.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_10(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(32) %arg2, ptr noalias align 16 dereferenceable(1536) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.529 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_357_10 = load i64, ptr @131, align 8
  %0 = icmp slt i64 %param_4.529, %constant_357_10
  %1 = zext i1 %0 to i8
  %param_4.5291 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_356_63 = load i64, ptr @130, align 8
  %2 = add i64 %param_4.5291, %constant_356_63
  %param_4.5292 = load i64, ptr %arg4, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.5292
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_103 = load i64, ptr @131, align 8
  %9 = icmp sge i64 0, %constant_357_103
  %10 = select i1 %9, i64 0, i64 %constant_357_103
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.908.1.in_bounds-true, label %dynamic-update-slice.908.1.in_bounds-after

dynamic-update-slice.908.1.in_bounds-after:       ; preds = %dynamic-update-slice.908.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.908.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_3 = load double, ptr @132, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.712 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7124 = load double, ptr %param_1.712, align 8, !invariant.load !120
  %param_4.5295 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_357_106 = load i64, ptr @131, align 8
  %23 = icmp slt i64 %param_4.5295, %constant_357_106
  %24 = zext i1 %23 to i8
  %param_4.5297 = load i64, ptr %arg4, align 8, !invariant.load !120
  %constant_356_638 = load i64, ptr @130, align 8
  %25 = add i64 %param_4.5297, %constant_356_638
  %param_4.5299 = load i64, ptr %arg4, align 8, !invariant.load !120
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_4.5299
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.19.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.19.start_idx0, 0
  %param_3.601 = getelementptr inbounds [192 x double], ptr %arg3, i64 0, i64 %31
  %param_3.60110 = load double, ptr %param_3.601, align 8, !invariant.load !120
  %32 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.626 = getelementptr inbounds double, ptr %32, i64 0
  %param_2.62611 = load double, ptr %param_2.626, align 8, !invariant.load !120
  %33 = call double @__nv_exp(double %param_2.62611)
  %multiply.863.9 = fmul double %param_3.60110, %33
  %add.350.1 = fadd double %param_1.7124, %multiply.863.9
  %multiply.886.1 = fmul double %add.350.1, %add.350.1
  %divide.407.1 = fdiv double %constant_358_3, %multiply.886.1
  %34 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.407.1, ptr %34, align 8
  br label %dynamic-update-slice.908.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_15(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.649 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_357_35 = load i64, ptr @136, align 8
  %0 = icmp slt i64 %param_2.649, %constant_357_35
  %1 = zext i1 %0 to i8
  %param_2.6491 = load i64, ptr %arg2, align 8, !invariant.load !120
  %constant_356_55 = load i64, ptr @135, align 8
  %2 = add i64 %param_2.6491, %constant_356_55
  %param_2.6492 = load i64, ptr %arg2, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6492
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_353 = load i64, ptr @136, align 8
  %9 = icmp sge i64 0, %constant_357_353
  %10 = select i1 %9, i64 0, i64 %constant_357_353
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.902.1.in_bounds-true, label %dynamic-update-slice.902.1.in_bounds-after

dynamic-update-slice.902.1.in_bounds-after:       ; preds = %dynamic-update-slice.902.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.902.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_1 = load double, ptr @134, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.710 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7104 = load double, ptr %param_1.710, align 8, !invariant.load !120
  %constant_361_5 = load double, ptr @133, align 8
  %multiply.866.3 = fmul double %param_1.7104, %constant_361_5
  %multiply.885.1 = fmul double %multiply.866.3, %multiply.866.3
  %divide.406.1 = fdiv double %constant_358_1, %multiply.885.1
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.406.1, ptr %23, align 8
  br label %dynamic-update-slice.902.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_17(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(32) %arg2) {
entry:
  %param_1.658 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_357_9 = load i64, ptr @140, align 8
  %0 = icmp slt i64 %param_1.658, %constant_357_9
  %1 = zext i1 %0 to i8
  %param_1.6581 = load i64, ptr %arg1, align 8, !invariant.load !120
  %constant_356_53 = load i64, ptr @139, align 8
  %2 = add i64 %param_1.6581, %constant_356_53
  %param_1.6582 = load i64, ptr %arg1, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6582
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_93 = load i64, ptr @140, align 8
  %9 = icmp sge i64 0, %constant_357_93
  %10 = select i1 %9, i64 0, i64 %constant_357_93
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.900.1.in_bounds-true, label %dynamic-update-slice.900.1.in_bounds-after

dynamic-update-slice.900.1.in_bounds-after:       ; preds = %dynamic-update-slice.900.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.900.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_19 = load double, ptr @138, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.571 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.5714 = load double, ptr %param_2.571, align 8, !invariant.load !120
  %constant_361_6 = load double, ptr @137, align 8
  %multiply.866.7 = fmul double %param_2.5714, %constant_361_6
  %divide.398.3 = fdiv double %constant_358_19, %multiply.866.7
  %23 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.398.3, ptr %23, align 8
  br label %dynamic-update-slice.900.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_23(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(1536) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(768) %arg7, ptr noalias align 128 dereferenceable(8) %arg8) {
entry:
  %param_8.263 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_51 = load i64, ptr @142, align 8
  %0 = icmp slt i64 %param_8.263, %constant_357_51
  %1 = zext i1 %0 to i8
  %param_8.2631 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_47 = load i64, ptr @141, align 8
  %2 = add i64 %param_8.2631, %constant_356_47
  %param_8.2632 = load i64, ptr %arg8, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_8.2632
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_513 = load i64, ptr @142, align 8
  %9 = icmp sge i64 0, %constant_357_513
  %10 = select i1 %9, i64 0, i64 %constant_357_513
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.894.1.in_bounds-true, label %dynamic-update-slice.894.1.in_bounds-after

dynamic-update-slice.894.1.in_bounds-after:       ; preds = %dynamic-update-slice.894.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.894.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.591 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.5914 = load double, ptr %param_3.591, align 8, !invariant.load !120
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.522 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.5225 = load double, ptr %param_4.522, align 8, !invariant.load !120
  %multiply.848.19 = fmul double %param_3.5914, %param_4.5225
  %param_8.2636 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_517 = load i64, ptr @142, align 8
  %24 = icmp slt i64 %param_8.2636, %constant_357_517
  %25 = zext i1 %24 to i8
  %param_8.2638 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_479 = load i64, ptr @141, align 8
  %26 = add i64 %param_8.2638, %constant_356_479
  %param_8.26310 = load i64, ptr %arg8, align 8, !invariant.load !120
  %27 = trunc i8 %25 to i1
  %28 = select i1 %27, i64 %26, i64 %param_8.26310
  %29 = icmp sge i64 0, %28
  %30 = select i1 %29, i64 0, i64 %28
  %31 = icmp sle i64 191, %30
  %dynamic-slice.39.43.start_idx0 = select i1 %31, i64 191, i64 %30
  %32 = add i64 %dynamic-slice.39.43.start_idx0, 0
  %param_2.613 = getelementptr inbounds [192 x double], ptr %arg2, i64 0, i64 %32
  %param_2.61311 = load double, ptr %param_2.613, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.700 = getelementptr inbounds double, ptr %33, i64 0
  %param_1.70012 = load double, ptr %param_1.700, align 8, !invariant.load !120
  %multiply.849.21 = fmul double %param_2.61311, %param_1.70012
  %add.340.19 = fadd double %multiply.848.19, %multiply.849.21
  %34 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.430 = getelementptr inbounds double, ptr %34, i64 0
  %param_5.43013 = load double, ptr %param_5.430, align 8, !invariant.load !120
  %35 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.376 = getelementptr inbounds double, ptr %35, i64 0
  %param_6.37614 = load double, ptr %param_6.376, align 8, !invariant.load !120
  %36 = icmp sge i64 0, %28
  %37 = select i1 %36, i64 0, i64 %28
  %38 = icmp sle i64 191, %37
  %dynamic-slice.40.19.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.40.19.start_idx0, 0
  %param_7.268 = getelementptr inbounds [192 x i32], ptr %arg7, i64 0, i64 %39
  %param_7.26815 = load i32, ptr %param_7.268, align 4, !invariant.load !120
  %40 = sitofp i32 %param_7.26815 to double
  %multiply.855.9 = fmul double %param_6.37614, %40
  %multiply.856.5 = fmul double %param_5.43013, %multiply.855.9
  %add.344.5 = fadd double %add.340.19, %multiply.856.5
  %subtract.78.4 = fsub double %add.344.5, %add.340.19
  %multiply.859.1 = fmul double %subtract.78.4, %subtract.78.4
  %41 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.859.1, ptr %41, align 8
  br label %dynamic-update-slice.894.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_22(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(1536) %arg2, ptr noalias align 16 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(32) %arg5, ptr noalias align 128 dereferenceable(32) %arg6, ptr noalias align 16 dereferenceable(768) %arg7, ptr noalias align 128 dereferenceable(8) %arg8) {
entry:
  %param_8.285 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_58 = load i64, ptr @145, align 8
  %0 = icmp slt i64 %param_8.285, %constant_357_58
  %1 = zext i1 %0 to i8
  %param_8.2851 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_48 = load i64, ptr @144, align 8
  %2 = add i64 %param_8.2851, %constant_356_48
  %param_8.2852 = load i64, ptr %arg8, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_8.2852
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_583 = load i64, ptr @145, align 8
  %9 = icmp sge i64 0, %constant_357_583
  %10 = select i1 %9, i64 0, i64 %constant_357_583
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.895.1.in_bounds-true, label %dynamic-update-slice.895.1.in_bounds-after

dynamic-update-slice.895.1.in_bounds-after:       ; preds = %dynamic-update-slice.895.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.895.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.621 = getelementptr inbounds double, ptr %22, i64 0
  %param_3.6214 = load double, ptr %param_3.621, align 8, !invariant.load !120
  %23 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.550 = getelementptr inbounds double, ptr %23, i64 0
  %param_4.5505 = load double, ptr %param_4.550, align 8, !invariant.load !120
  %multiply.848.27 = fmul double %param_3.6214, %param_4.5505
  %param_8.2856 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_357_587 = load i64, ptr @145, align 8
  %24 = icmp slt i64 %param_8.2856, %constant_357_587
  %25 = zext i1 %24 to i8
  %param_8.2858 = load i64, ptr %arg8, align 8, !invariant.load !120
  %constant_356_489 = load i64, ptr @144, align 8
  %26 = add i64 %param_8.2858, %constant_356_489
  %param_8.28510 = load i64, ptr %arg8, align 8, !invariant.load !120
  %27 = trunc i8 %25 to i1
  %28 = select i1 %27, i64 %26, i64 %param_8.28510
  %29 = icmp sge i64 0, %28
  %30 = select i1 %29, i64 0, i64 %28
  %31 = icmp sle i64 191, %30
  %dynamic-slice.39.51.start_idx0 = select i1 %31, i64 191, i64 %30
  %32 = add i64 %dynamic-slice.39.51.start_idx0, 0
  %param_2.647 = getelementptr inbounds [192 x double], ptr %arg2, i64 0, i64 %32
  %param_2.64711 = load double, ptr %param_2.647, align 8, !invariant.load !120
  %33 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.723 = getelementptr inbounds double, ptr %33, i64 0
  %param_1.72312 = load double, ptr %param_1.723, align 8, !invariant.load !120
  %multiply.849.29 = fmul double %param_2.64711, %param_1.72312
  %add.340.27 = fadd double %multiply.848.27, %multiply.849.29
  %34 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.456 = getelementptr inbounds double, ptr %34, i64 0
  %param_5.45613 = load double, ptr %param_5.456, align 8, !invariant.load !120
  %35 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.401 = getelementptr inbounds double, ptr %35, i64 0
  %param_6.40114 = load double, ptr %param_6.401, align 8, !invariant.load !120
  %36 = icmp sge i64 0, %28
  %37 = select i1 %36, i64 0, i64 %28
  %38 = icmp sle i64 191, %37
  %dynamic-slice.40.27.start_idx0 = select i1 %38, i64 191, i64 %37
  %39 = add i64 %dynamic-slice.40.27.start_idx0, 0
  %param_7.291 = getelementptr inbounds [192 x i32], ptr %arg7, i64 0, i64 %39
  %param_7.29115 = load i32, ptr %param_7.291, align 4, !invariant.load !120
  %40 = sitofp i32 %param_7.29115 to double
  %multiply.855.17 = fmul double %param_6.40114, %40
  %multiply.856.13 = fmul double %param_5.45613, %multiply.855.17
  %add.344.13 = fadd double %add.340.27, %multiply.856.13
  %subtract.78.3 = fsub double %add.344.13, %add.340.27
  %constant_361_3 = load double, ptr @143, align 8
  %multiply.884.3 = fmul double %subtract.78.3, %constant_361_3
  %41 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.884.3, ptr %41, align 8
  br label %dynamic-update-slice.895.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_25(ptr noalias align 128 dereferenceable(6144) %arg0, ptr noalias align 128 dereferenceable(32) %arg1, ptr noalias align 16 dereferenceable(768) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.573 = load i64, ptr %arg3, align 8, !invariant.load !120
  %constant_357_23 = load i64, ptr @147, align 8
  %0 = icmp slt i64 %param_3.573, %constant_357_23
  %1 = zext i1 %0 to i8
  %param_3.5731 = load i64, ptr %arg3, align 8, !invariant.load !120
  %constant_356_43 = load i64, ptr @146, align 8
  %2 = add i64 %param_3.5731, %constant_356_43
  %param_3.5732 = load i64, ptr %arg3, align 8, !invariant.load !120
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.5732
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_233 = load i64, ptr @147, align 8
  %9 = icmp sge i64 0, %constant_357_233
  %10 = select i1 %9, i64 0, i64 %constant_357_233
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !123
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 4
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 4
  %18 = udiv i64 %linear_index0, 4
  %19 = icmp ult i64 %linear_index, 4
  br i1 %19, label %dynamic-update-slice.892.1.in_bounds-true, label %dynamic-update-slice.892.1.in_bounds-after

dynamic-update-slice.892.1.in_bounds-after:       ; preds = %dynamic-update-slice.892.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.892.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.672 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6724 = load double, ptr %param_1.672, align 8, !invariant.load !120
  %param_3.5735 = load i64, ptr %arg3, align 8, !invariant.load !120
  %constant_357_236 = load i64, ptr @147, align 8
  %23 = icmp slt i64 %param_3.5735, %constant_357_236
  %24 = zext i1 %23 to i8
  %param_3.5737 = load i64, ptr %arg3, align 8, !invariant.load !120
  %constant_356_438 = load i64, ptr @146, align 8
  %25 = add i64 %param_3.5737, %constant_356_438
  %param_3.5739 = load i64, ptr %arg3, align 8, !invariant.load !120
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_3.5739
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.40.13.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.40.13.start_idx0, 0
  %param_2.585 = getelementptr inbounds [192 x i32], ptr %arg2, i64 0, i64 %31
  %param_2.58510 = load i32, ptr %param_2.585, align 4, !invariant.load !120
  %32 = sitofp i32 %param_2.58510 to double
  %multiply.855.3 = fmul double %param_1.6724, %32
  %33 = getelementptr inbounds [192 x [4 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.855.3, ptr %33, align 8
  br label %dynamic-update-slice.892.1.in_bounds-after
}

define void @loop_add_fusion(ptr noalias align 128 dereferenceable(8) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !122
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %loop_add_fusion.in_bounds-true, label %loop_add_fusion.in_bounds-after

loop_add_fusion.in_bounds-after:                  ; preds = %loop_add_fusion.in_bounds-true, %entry
  ret void

loop_add_fusion.in_bounds-true:                   ; preds = %entry
  %4 = load i64, ptr %arg0, align 8
  %constant_353_1 = load i64, ptr @148, align 8
  %5 = add i64 %4, %constant_353_1
  store i64 %5, ptr %arg0, align 8
  br label %loop_add_fusion.in_bounds-after
}

define void @copy_fusion_5(ptr noalias align 16 dereferenceable(32) %arg0, ptr noalias align 16 dereferenceable(32) %arg1, ptr noalias align 128 dereferenceable(1536) %arg2, ptr noalias align 128 dereferenceable(32) %arg3, ptr noalias align 128 dereferenceable(32) %arg4, ptr noalias align 128 dereferenceable(1536) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !124
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 200
  br i1 %4, label %copy_fusion.5.in_bounds-true, label %copy_fusion.5.in_bounds-after

copy_fusion.5.in_bounds-after:                    ; preds = %slice2-after, %entry
  ret void

copy_fusion.5.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.4.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = getelementptr inbounds [4 x [1 x double]], ptr %arg0, i32 0, i32 %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !120
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.4.1
  %9 = phi i32 [ 4, %concatenate.pivot.4.1 ]
  %10 = sub nsw i32 %3, %9
  %11 = getelementptr inbounds [4 x [1 x double]], ptr %arg1, i32 0, i32 %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !120
  br label %concatenate.3.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.8.2
  %13 = phi i32 [ 8, %concatenate.pivot.8.2 ]
  %14 = sub nsw i32 %3, %13
  %15 = getelementptr inbounds [192 x double], ptr %arg2, i32 0, i32 %14
  %16 = load double, ptr %15, align 8, !invariant.load !120
  br label %concatenate.3.merge

concatenate.pivot.4.:                             ; preds = %copy_fusion.5.in_bounds-true
  %17 = icmp ult i32 %3, 4
  br i1 %17, label %concatenate.pivot.0., label %concatenate.pivot.8.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id0

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.4.
  %18 = icmp ult i32 %3, 8
  br i1 %18, label %concatenate.pivot.4.1, label %concatenate.pivot.8.2

concatenate.pivot.4.1:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id1

concatenate.pivot.8.2:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id2

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %19 = phi double [ %8, %concat_index_from_operand_id0 ], [ %12, %concat_index_from_operand_id1 ], [ %16, %concat_index_from_operand_id2 ]
  %20 = icmp sge i32 %3, 0
  %21 = icmp slt i32 %3, 4
  %22 = and i1 %20, %21
  br i1 %22, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.3.merge
  %23 = icmp sge i32 %3, 4
  %24 = icmp slt i32 %3, 8
  %25 = and i1 %23, %24
  br i1 %25, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %26 = icmp sge i32 %3, 8
  %27 = icmp slt i32 %3, 200
  %28 = and i1 %26, %27
  br i1 %28, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  br label %copy_fusion.5.in_bounds-after

slice0-true:                                      ; preds = %concatenate.3.merge
  %29 = sub i32 %3, 0
  %30 = getelementptr inbounds [4 x double], ptr %arg3, i32 0, i32 %29
  store double %19, ptr %30, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %31 = sub i32 %3, 4
  %32 = getelementptr inbounds [4 x double], ptr %arg4, i32 0, i32 %31
  store double %19, ptr %32, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %33 = sub i32 %3, 8
  %34 = getelementptr inbounds [192 x double], ptr %arg5, i32 0, i32 %33
  store double %19, ptr %34, align 8
  br label %slice2-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!2 = !{ptr @copy_fusion_10, !"kernel", i32 1}
!3 = !{ptr @copy_fusion_10, !"reqntidx", i32 128}
!4 = !{ptr @input_slice_fusion_1, !"kernel", i32 1}
!5 = !{ptr @input_slice_fusion_1, !"reqntidx", i32 128}
!6 = !{ptr @input_slice_fusion_2, !"kernel", i32 1}
!7 = !{ptr @input_slice_fusion_2, !"reqntidx", i32 128}
!8 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!9 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!10 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!11 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!12 = !{ptr @loop_convert_dynamic_slice_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_convert_dynamic_slice_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_divide_multiply_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_divide_multiply_fusion, !"reqntidx", i32 4}
!16 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 4}
!18 = !{ptr @loop_divide_exponential_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_divide_exponential_fusion, !"reqntidx", i32 4}
!20 = !{ptr @wrapped_convert, !"kernel", i32 1}
!21 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!22 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!23 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 4}
!24 = !{ptr @loop_compare_multiply_select_fusion, !"kernel", i32 1}
!25 = !{ptr @loop_compare_multiply_select_fusion, !"reqntidx", i32 4}
!26 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!27 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 4}
!28 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!29 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 4}
!30 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!31 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 4}
!32 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!33 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 4}
!34 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!35 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 4}
!36 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!37 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 4}
!38 = !{ptr @loop_dynamic_update_slice_fusion_59, !"kernel", i32 1}
!39 = !{ptr @loop_dynamic_update_slice_fusion_59, !"reqntidx", i32 1}
!40 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!41 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 4}
!42 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!43 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 1}
!44 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!45 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 1}
!46 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!47 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 4}
!48 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!49 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 4}
!50 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!51 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 4}
!52 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!53 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 4}
!54 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!55 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 4}
!56 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!57 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 4}
!58 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!59 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 4}
!60 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!61 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 4}
!62 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!63 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 4}
!64 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!65 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 4}
!66 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!67 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 4}
!68 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!69 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 4}
!70 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!71 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 4}
!72 = !{ptr @loop_dynamic_update_slice_fusion_46, !"kernel", i32 1}
!73 = !{ptr @loop_dynamic_update_slice_fusion_46, !"reqntidx", i32 4}
!74 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!75 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 4}
!76 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!77 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 4}
!78 = !{ptr @loop_dynamic_update_slice_fusion_58, !"kernel", i32 1}
!79 = !{ptr @loop_dynamic_update_slice_fusion_58, !"reqntidx", i32 4}
!80 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 4}
!82 = !{ptr @loop_dynamic_update_slice_fusion_20, !"kernel", i32 1}
!83 = !{ptr @loop_dynamic_update_slice_fusion_20, !"reqntidx", i32 4}
!84 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!85 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 4}
!86 = !{ptr @loop_dynamic_update_slice_fusion_51, !"kernel", i32 1}
!87 = !{ptr @loop_dynamic_update_slice_fusion_51, !"reqntidx", i32 4}
!88 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 4}
!90 = !{ptr @loop_add_divide_select_fusion, !"kernel", i32 1}
!91 = !{ptr @loop_add_divide_select_fusion, !"reqntidx", i32 4}
!92 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 4}
!94 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 4}
!96 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 4}
!98 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 4}
!100 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 4}
!102 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 4}
!104 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 4}
!106 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 4}
!108 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 4}
!110 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 4}
!112 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 4}
!114 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!115 = !{ptr @loop_add_fusion, !"reqntidx", i32 1}
!116 = !{ptr @copy_fusion_5, !"kernel", i32 1}
!117 = !{ptr @copy_fusion_5, !"reqntidx", i32 128}
!118 = !{i32 0, i32 12}
!119 = !{i32 0, i32 128}
!120 = !{}
!121 = !{i32 0, i32 8}
!122 = !{i32 0, i32 1}
!123 = !{i32 0, i32 4}
!124 = !{i32 0, i32 2}
