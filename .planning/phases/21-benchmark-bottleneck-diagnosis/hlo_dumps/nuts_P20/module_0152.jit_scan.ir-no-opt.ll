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
@9 = private unnamed_addr constant [4 x i8] zeroinitializer
@10 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@11 = private unnamed_addr constant [8 x i8] zeroinitializer
@12 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@13 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@14 = private unnamed_addr constant [8 x i8] zeroinitializer
@15 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@16 = private unnamed_addr constant [1 x i8] zeroinitializer
@17 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@18 = private unnamed_addr constant [8 x i8] zeroinitializer
@19 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@20 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F8\7F"
@21 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@22 = private unnamed_addr constant [8 x i8] zeroinitializer
@23 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@24 = private unnamed_addr constant [8 x i8] zeroinitializer
@25 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@26 = private unnamed_addr constant [8 x i8] zeroinitializer
@27 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@28 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@29 = private unnamed_addr constant [8 x i8] zeroinitializer
@30 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@31 = private unnamed_addr constant [8 x i8] zeroinitializer
@32 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@33 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@34 = private unnamed_addr constant [8 x i8] zeroinitializer
@35 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@36 = private unnamed_addr constant [4 x i8] zeroinitializer
@37 = private unnamed_addr constant [8 x i8] zeroinitializer
@38 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@39 = private unnamed_addr constant [4 x i8] zeroinitializer
@40 = private unnamed_addr constant [8 x i8] zeroinitializer
@41 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@42 = private unnamed_addr constant [8 x i8] zeroinitializer
@43 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@44 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@45 = private unnamed_addr constant [8 x i8] zeroinitializer
@46 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@47 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@48 = private unnamed_addr constant [8 x i8] zeroinitializer
@49 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@50 = private unnamed_addr constant [8 x i8] zeroinitializer
@51 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@52 = private unnamed_addr constant [8 x i8] zeroinitializer
@53 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@54 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@55 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@56 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@57 = private unnamed_addr constant [8 x i8] zeroinitializer
@58 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@59 = private unnamed_addr constant [8 x i8] zeroinitializer
@60 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@61 = private unnamed_addr constant [8 x i8] zeroinitializer
@62 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@63 = private unnamed_addr constant [8 x i8] zeroinitializer
@64 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@65 = private unnamed_addr constant [8 x i8] zeroinitializer
@66 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
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
@77 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@78 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@79 = private unnamed_addr constant [8 x i8] zeroinitializer
@80 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@81 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@82 = private unnamed_addr constant [8 x i8] zeroinitializer
@83 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@84 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@85 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@86 = private unnamed_addr constant [8 x i8] zeroinitializer
@87 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@88 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@89 = private unnamed_addr constant [8 x i8] zeroinitializer
@90 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@91 = private unnamed_addr constant [8 x i8] zeroinitializer
@92 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@93 = private unnamed_addr constant [8 x i8] zeroinitializer
@94 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@95 = private unnamed_addr constant [8 x i8] zeroinitializer
@96 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@97 = private unnamed_addr constant [8 x i8] zeroinitializer
@98 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@99 = private unnamed_addr constant [8 x i8] zeroinitializer
@100 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@101 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@102 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0\BF"
@103 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@104 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@105 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@106 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@107 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@108 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@109 = private unnamed_addr constant [8 x i8] zeroinitializer
@110 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\E0?"
@111 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@112 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@113 = private unnamed_addr constant [8 x i8] zeroinitializer
@114 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00,@"
@115 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@116 = private unnamed_addr constant [8 x i8] zeroinitializer
@117 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@118 = private unnamed_addr constant [8 x i8] zeroinitializer
@119 = private unnamed_addr constant [8 x i8] c"\9D\97\8C\CF\08\BA[%"
@120 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@121 = private unnamed_addr constant [8 x i8] zeroinitializer
@122 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@123 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@124 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@125 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@126 = private unnamed_addr constant [8 x i8] zeroinitializer
@127 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@128 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\F0?"
@129 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@130 = private unnamed_addr constant [8 x i8] zeroinitializer
@131 = private unnamed_addr constant [8 x i8] c"\00\00\00\00\00\00\00@"
@132 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@133 = private unnamed_addr constant [8 x i8] zeroinitializer
@134 = private unnamed_addr constant [8 x i8] c"\C0\00\00\00\00\00\00\00"
@135 = private unnamed_addr constant [8 x i8] zeroinitializer
@136 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"

define void @input_slice_fusion(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(3840) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !110
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !111
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 7680
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 7680
  br i1 %4, label %input_slice_fusion.in_bounds-true, label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %entry
  ret void

input_slice_fusion.in_bounds-true:                ; preds = %entry
  br label %concatenate.pivot.3840.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 20
  %10 = udiv i32 %8, 20
  %11 = udiv i32 %10, 192
  %constant_45_3 = load i8, ptr @0, align 1
  br label %concatenate.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.3840.2
  %12 = phi i32 [ 3840, %concatenate.pivot.3840.2 ]
  %13 = sub nsw i32 %3, %12
  %14 = mul nuw nsw i32 %13, 1
  %15 = add nuw nsw i32 0, %14
  %16 = urem i32 %15, 20
  %17 = udiv i32 %15, 20
  %18 = udiv i32 %17, 192
  %constant_45_31 = load i8, ptr @0, align 1
  br label %concatenate.merge

concatenate.pivot.3840.:                          ; preds = %input_slice_fusion.in_bounds-true
  %19 = icmp ult i32 %3, 3840
  br i1 %19, label %concatenate.pivot.0., label %concatenate.pivot.3840.2

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.3840.
  br label %concat_index_from_operand_id0

concatenate.pivot.3840.2:                         ; preds = %concatenate.pivot.3840.
  br label %concat_index_from_operand_id1

concatenate.merge:                                ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %20 = phi i8 [ %constant_45_3, %concat_index_from_operand_id0 ], [ %constant_45_31, %concat_index_from_operand_id1 ]
  %21 = icmp sge i32 %3, 0
  %22 = icmp slt i32 %3, 3840
  %23 = and i1 %21, %22
  br i1 %23, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.merge
  %24 = icmp sge i32 %3, 3840
  %25 = icmp slt i32 %3, 7680
  %26 = and i1 %24, %25
  br i1 %26, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.merge
  %27 = sub i32 %3, 0
  %28 = getelementptr inbounds [3840 x i8], ptr %arg0, i32 0, i32 %27
  store i8 %20, ptr %28, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %29 = sub i32 %3, 3840
  %30 = getelementptr inbounds [3840 x i8], ptr %arg1, i32 0, i32 %29
  store i8 %20, ptr %30, align 1
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

define void @copy_fusion_10(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(3840) %arg1, ptr noalias align 128 dereferenceable(3840) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !110
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !111
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 7680
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 7680
  br i1 %4, label %copy_fusion.10.in_bounds-true, label %copy_fusion.10.in_bounds-after

copy_fusion.10.in_bounds-after:                   ; preds = %slice1-after, %entry
  ret void

copy_fusion.10.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.3840.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 20
  %10 = udiv i32 %8, 20
  %11 = udiv i32 %10, 192
  %12 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i32 0, i32 %10, i32 %9, i32 0
  %13 = load i8, ptr %12, align 1, !invariant.load !112
  br label %concatenate.4.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.3840.1
  %14 = phi i32 [ 3840, %concatenate.pivot.3840.1 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 20
  %19 = udiv i32 %17, 20
  %20 = udiv i32 %19, 192
  %21 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i32 0, i32 %19, i32 %18, i32 0
  %22 = load i8, ptr %21, align 1, !invariant.load !112
  br label %concatenate.4.merge

concatenate.pivot.3840.:                          ; preds = %copy_fusion.10.in_bounds-true
  %23 = icmp ult i32 %3, 3840
  br i1 %23, label %concatenate.pivot.0., label %concatenate.pivot.3840.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.3840.
  br label %concat_index_from_operand_id0

concatenate.pivot.3840.1:                         ; preds = %concatenate.pivot.3840.
  br label %concat_index_from_operand_id1

concatenate.4.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %24 = phi i8 [ %13, %concat_index_from_operand_id0 ], [ %22, %concat_index_from_operand_id1 ]
  %25 = icmp sge i32 %3, 0
  %26 = icmp slt i32 %3, 3840
  %27 = and i1 %25, %26
  br i1 %27, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.4.merge
  %28 = icmp sge i32 %3, 3840
  %29 = icmp slt i32 %3, 7680
  %30 = and i1 %28, %29
  br i1 %30, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %copy_fusion.10.in_bounds-after

slice0-true:                                      ; preds = %concatenate.4.merge
  %31 = sub i32 %3, 0
  %32 = getelementptr inbounds [3840 x i8], ptr %arg1, i32 0, i32 %31
  store i8 %24, ptr %32, align 1
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %33 = sub i32 %3, 3840
  %34 = getelementptr inbounds [3840 x i8], ptr %arg2, i32 0, i32 %33
  store i8 %24, ptr %34, align 1
  br label %slice1-after
}

define void @input_slice_fusion_1(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(15360) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !113
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !111
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4032
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
  %11 = urem i32 %10, 20
  %12 = udiv i32 %10, 20
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
  %20 = icmp slt i32 %3, 4032
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
  %25 = getelementptr inbounds [3840 x i32], ptr %arg1, i32 0, i32 %24
  store i32 %15, ptr %25, align 4
  br label %slice1-after
}

define void @input_slice_fusion_2(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(30720) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !113
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !111
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 4032
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
  %11 = urem i32 %10, 20
  %12 = udiv i32 %10, 20
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
  %20 = icmp slt i32 %3, 4032
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
  %25 = getelementptr inbounds [3840 x double], ptr %arg1, i32 0, i32 %24
  store double %15, ptr %25, align 8
  br label %slice1-after
}

define void @loop_compare_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(1) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
  %4 = load i64, ptr %arg0, align 8, !invariant.load !112
  %constant_352_1 = load i64, ptr @3, align 8
  %5 = icmp slt i64 %4, %constant_352_1
  %6 = zext i1 %5 to i8
  store i8 %6, ptr %arg1, align 1
  br label %loop_compare_fusion.in_bounds-after
}

define void @loop_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
  %5 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_62 = load i64, ptr @5, align 8
  %6 = icmp slt i64 %5, %constant_357_62
  %7 = zext i1 %6 to i8
  %8 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_4 = load i64, ptr @4, align 8
  %9 = add i64 %8, %constant_356_4
  %10 = load i64, ptr %arg1, align 8, !invariant.load !112
  %11 = trunc i8 %7 to i1
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.39.7.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.39.7.start_idx0, %3
  %18 = getelementptr inbounds [192 x double], ptr %arg0, i32 0, i32 %17
  %19 = load double, ptr %18, align 8, !invariant.load !112
  %20 = getelementptr double, ptr %arg2, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  store double %19, ptr %21, align 8
  br label %loop_dynamic_slice_fusion.in_bounds-after
}

define void @loop_convert_dynamic_slice_fusion(ptr noalias align 16 dereferenceable(768) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(4) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
  %5 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_63 = load i64, ptr @8, align 8
  %6 = icmp slt i64 %5, %constant_357_63
  %7 = zext i1 %6 to i8
  %8 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_5 = load i64, ptr @7, align 8
  %9 = add i64 %8, %constant_356_5
  %10 = load i64, ptr %arg1, align 8, !invariant.load !112
  %11 = trunc i8 %7 to i1
  %12 = select i1 %11, i64 %9, i64 %10
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 0, %13
  %15 = select i1 %14, i32 0, i32 %13
  %16 = icmp sle i32 191, %15
  %dynamic-slice.40.15.start_idx0 = select i1 %16, i32 191, i32 %15
  %17 = add i32 %dynamic-slice.40.15.start_idx0, %3
  %18 = getelementptr inbounds [192 x i32], ptr %arg0, i32 0, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !112
  %20 = insertvalue { i32, i32 } undef, i32 %19, 0
  %21 = getelementptr i32, ptr @6, i32 %linear_index
  %constant_360_2_clone_1 = getelementptr inbounds i32, ptr %21, i32 0
  %constant_360_2_clone_11 = load i32, ptr %constant_360_2_clone_1, align 4
  %22 = icmp ne i32 %19, %constant_360_2_clone_11
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

define void @loop_dynamic_update_slice_fusion_59(ptr noalias align 128 dereferenceable(768) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.640 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_65 = load i64, ptr @11, align 8
  %0 = icmp slt i64 %param_2.640, %constant_357_65
  %1 = zext i1 %0 to i8
  %param_2.6401 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_32 = load i64, ptr @10, align 8
  %2 = add i64 %param_2.6401, %constant_356_32
  %param_2.6402 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6402
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
  %param_2.6403 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_654 = load i64, ptr @11, align 8
  %15 = icmp slt i64 %param_2.6403, %constant_357_654
  %16 = zext i1 %15 to i8
  %param_2.6405 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_326 = load i64, ptr @10, align 8
  %17 = add i64 %param_2.6405, %constant_356_326
  %param_2.6407 = load i64, ptr %arg2, align 8, !invariant.load !112
  %18 = trunc i8 %16 to i1
  %19 = select i1 %18, i64 %17, i64 %param_2.6407
  %20 = icmp sge i64 0, %19
  %21 = select i1 %20, i64 0, i64 %19
  %22 = icmp sle i64 191, %21
  %dynamic-slice.40.1.start_idx0 = select i1 %22, i64 191, i64 %21
  %23 = add i64 %dynamic-slice.40.1.start_idx0, %12
  %param_1.734 = getelementptr inbounds [192 x i32], ptr %arg1, i64 0, i64 %23
  %param_1.7348 = load i32, ptr %param_1.734, align 4, !invariant.load !112
  %24 = getelementptr i32, ptr @9, i64 %linear_index
  %constant_360_1 = getelementptr inbounds i32, ptr %24, i64 0
  %constant_360_19 = load i32, ptr %constant_360_1, align 4
  %25 = icmp ne i32 %param_1.7348, %constant_360_19
  %26 = zext i1 %25 to i8
  %27 = zext i8 %26 to i32
  %28 = getelementptr inbounds [192 x i32], ptr %arg0, i64 0, i64 %14
  store i32 %27, ptr %28, align 4
  br label %dynamic-update-slice.881.1.in_bounds-after
}

define void @loop_divide_exponential_multiply_fusion(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 16 dereferenceable(1536) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(160) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 16 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 128 dereferenceable(160) %arg10, ptr noalias align 128 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(160) %arg12, ptr noalias align 128 dereferenceable(160) %arg13, ptr noalias align 128 dereferenceable(160) %arg14) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_divide_exponential_multiply_fusion.in_bounds-true, label %loop_divide_exponential_multiply_fusion.in_bounds-after

loop_divide_exponential_multiply_fusion.in_bounds-after: ; preds = %loop_divide_exponential_multiply_fusion.in_bounds-true, %entry
  ret void

loop_divide_exponential_multiply_fusion.in_bounds-true: ; preds = %entry
  %constant_358_4 = load double, ptr @12, align 8
  %5 = getelementptr double, ptr %arg3, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !112
  %8 = getelementptr double, ptr %arg4, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !112
  %multiply.848.7.clone.1 = fmul double %7, %10
  %11 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_78_clone_1 = load i64, ptr @14, align 8
  %12 = icmp slt i64 %11, %constant_357_78_clone_1
  %13 = zext i1 %12 to i8
  %14 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_78_clone_1 = load i64, ptr @13, align 8
  %15 = add i64 %14, %constant_356_78_clone_1
  %16 = load i64, ptr %arg2, align 8, !invariant.load !112
  %17 = trunc i8 %13 to i1
  %18 = select i1 %17, i64 %15, i64 %16
  %19 = trunc i64 %18 to i32
  %20 = icmp sge i32 0, %19
  %21 = select i1 %20, i32 0, i32 %19
  %22 = icmp sle i32 191, %21
  %dynamic-slice.39.55.clone.1.start_idx0 = select i1 %22, i32 191, i32 %21
  %23 = add i32 %dynamic-slice.39.55.clone.1.start_idx0, 0
  %24 = getelementptr inbounds [192 x double], ptr %arg1, i32 0, i32 %23
  %25 = load double, ptr %24, align 8, !invariant.load !112
  %26 = getelementptr double, ptr %arg0, i32 %linear_index
  %27 = getelementptr inbounds double, ptr %26, i32 0
  %28 = load double, ptr %27, align 8, !invariant.load !112
  %multiply.849.9.clone.1 = fmul double %25, %28
  %add.340.7.clone.1 = fadd double %multiply.848.7.clone.1, %multiply.849.9.clone.1
  %29 = fneg double %add.340.7.clone.1
  %30 = call double @__nv_exp(double %29)
  %add.341.3.clone.1 = fadd double %30, %constant_358_4
  %divide.390.1.clone.1 = fdiv double %constant_358_4, %add.341.3.clone.1
  %subtract.76.5 = fsub double %constant_358_4, %divide.390.1.clone.1
  %multiply.850.1 = fmul double %divide.390.1.clone.1, %subtract.76.5
  %31 = insertvalue { double, double, double, double, double } undef, double %multiply.850.1, 0
  %32 = insertvalue { double, double, double, double, double } %31, double %divide.390.1.clone.1, 1
  %33 = getelementptr double, ptr %arg9, i32 %linear_index
  %34 = getelementptr inbounds double, ptr %33, i32 0
  %35 = load double, ptr %34, align 8, !invariant.load !112
  %divide.391.1.clone.1.clone.1 = fdiv double %constant_358_4, %35
  %36 = getelementptr double, ptr %arg6, i32 %linear_index
  %37 = getelementptr inbounds double, ptr %36, i32 0
  %38 = load double, ptr %37, align 8, !invariant.load !112
  %39 = getelementptr double, ptr %arg8, i32 %linear_index
  %40 = getelementptr inbounds double, ptr %39, i32 0
  %41 = load double, ptr %40, align 8, !invariant.load !112
  %42 = getelementptr double, ptr %arg7, i32 %linear_index
  %43 = getelementptr inbounds double, ptr %42, i32 0
  %44 = load double, ptr %43, align 8, !invariant.load !112
  %multiply.852.5.clone.1.clone.1 = fmul double %41, %44
  %add.342.3.clone.1.clone.1 = fadd double %38, %multiply.852.5.clone.1.clone.1
  %45 = call double @__nv_exp(double %add.342.3.clone.1.clone.1)
  %multiply.853.13.clone.1 = fmul double %25, %45
  %constant_359_13_clone_1 = load double, ptr @15, align 8
  %compare.265.13.clone.1 = fcmp ogt double %multiply.853.13.clone.1, %constant_359_13_clone_1
  %46 = zext i1 %compare.265.13.clone.1 to i8
  %47 = getelementptr double, ptr %arg5, i32 %linear_index
  %48 = getelementptr inbounds double, ptr %47, i32 0
  %49 = load double, ptr %48, align 8, !invariant.load !112
  %50 = trunc i8 %46 to i1
  %51 = select i1 %50, double %multiply.853.13.clone.1, double %49
  %add.343.5.clone.1 = fadd double %divide.391.1.clone.1.clone.1, %51
  %divide.392.1.clone.1 = fdiv double %constant_358_4, %add.343.5.clone.1
  %52 = insertvalue { double, double, double, double, double } %32, double %divide.392.1.clone.1, 2
  %53 = insertvalue { double, double, double, double, double } %52, double %45, 3
  %54 = insertvalue { double, double, double, double, double } %53, double %divide.391.1.clone.1.clone.1, 4
  %55 = extractvalue { double, double, double, double, double } %54, 0
  %56 = getelementptr double, ptr %arg10, i32 %linear_index
  %57 = getelementptr inbounds double, ptr %56, i32 0
  store double %55, ptr %57, align 8
  %58 = extractvalue { double, double, double, double, double } %54, 1
  %59 = getelementptr double, ptr %arg11, i32 %linear_index
  %60 = getelementptr inbounds double, ptr %59, i32 0
  store double %58, ptr %60, align 8
  %61 = extractvalue { double, double, double, double, double } %54, 2
  %62 = getelementptr double, ptr %arg12, i32 %linear_index
  %63 = getelementptr inbounds double, ptr %62, i32 0
  store double %61, ptr %63, align 8
  %64 = extractvalue { double, double, double, double, double } %54, 3
  %65 = getelementptr double, ptr %arg13, i32 %linear_index
  %66 = getelementptr inbounds double, ptr %65, i32 0
  store double %64, ptr %66, align 8
  %67 = extractvalue { double, double, double, double, double } %54, 4
  %68 = getelementptr double, ptr %arg14, i32 %linear_index
  %69 = getelementptr inbounds double, ptr %68, i32 0
  store double %67, ptr %69, align 8
  br label %loop_divide_exponential_multiply_fusion.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare double @__nv_exp(double) #2

define void @loop_broadcast_fusion(ptr noalias align 128 dereferenceable(20) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_broadcast_fusion.in_bounds-true, label %loop_broadcast_fusion.in_bounds-after

loop_broadcast_fusion.in_bounds-after:            ; preds = %loop_broadcast_fusion.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.in_bounds-true:             ; preds = %entry
  %constant_288_1 = load i8, ptr @16, align 1
  %5 = getelementptr i8, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds i8, ptr %5, i32 0
  store i8 %constant_288_1, ptr %6, align 1
  br label %loop_broadcast_fusion.in_bounds-after
}

define void @loop_divide_exponential_fusion(ptr noalias align 128 dereferenceable(8) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 128 dereferenceable(160) %arg8) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_divide_exponential_fusion.in_bounds-true, label %loop_divide_exponential_fusion.in_bounds-after

loop_divide_exponential_fusion.in_bounds-after:   ; preds = %loop_divide_exponential_fusion.in_bounds-true, %entry
  ret void

loop_divide_exponential_fusion.in_bounds-true:    ; preds = %entry
  %constant_17_2 = load double, ptr @17, align 8
  %5 = getelementptr double, ptr %arg1, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !112
  %divide.385.7 = fdiv double %constant_17_2, %7
  %8 = load double, ptr %arg0, align 8, !invariant.load !112
  %9 = getelementptr double, ptr %arg2, i32 %linear_index
  %10 = getelementptr inbounds double, ptr %9, i32 0
  %11 = load double, ptr %10, align 8, !invariant.load !112
  %12 = getelementptr double, ptr %arg4, i32 %linear_index
  %13 = getelementptr inbounds double, ptr %12, i32 0
  %14 = load double, ptr %13, align 8, !invariant.load !112
  %15 = getelementptr double, ptr %arg3, i32 %linear_index
  %16 = getelementptr inbounds double, ptr %15, i32 0
  %17 = load double, ptr %16, align 8, !invariant.load !112
  %multiply.841.5.clone.1 = fmul double %14, %17
  %add.335.3.clone.1 = fadd double %11, %multiply.841.5.clone.1
  %18 = call double @__nv_exp(double %add.335.3.clone.1)
  %multiply.842.7 = fmul double %8, %18
  %add.336.5 = fadd double %divide.385.7, %multiply.842.7
  %divide.387.1 = fdiv double %constant_17_2, %add.336.5
  %19 = insertvalue { double, double, double, double } undef, double %divide.387.1, 0
  %20 = getelementptr double, ptr %arg1, i32 %linear_index
  %21 = getelementptr inbounds double, ptr %20, i32 0
  %22 = load double, ptr %21, align 8, !invariant.load !112
  %23 = getelementptr double, ptr %arg1, i32 %linear_index
  %24 = getelementptr inbounds double, ptr %23, i32 0
  %25 = load double, ptr %24, align 8, !invariant.load !112
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
  %4 = load i32, ptr %arg0, align 4, !invariant.load !112
  %5 = sitofp i32 %4 to double
  store double %5, ptr %arg1, align 8
  br label %wrapped_convert.in_bounds-after
}

define void @loop_broadcast_fusion_1(ptr noalias align 128 dereferenceable(160) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_broadcast_fusion.1.in_bounds-true, label %loop_broadcast_fusion.1.in_bounds-after

loop_broadcast_fusion.1.in_bounds-after:          ; preds = %loop_broadcast_fusion.1.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.1.in_bounds-true:           ; preds = %entry
  %constant_335_1 = load double, ptr @18, align 8
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  store double %constant_335_1, ptr %6, align 8
  br label %loop_broadcast_fusion.1.in_bounds-after
}

define void @loop_compare_multiply_select_fusion(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(20) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_compare_multiply_select_fusion.in_bounds-true, label %loop_compare_multiply_select_fusion.in_bounds-after

loop_compare_multiply_select_fusion.in_bounds-after: ; preds = %loop_compare_multiply_select_fusion.in_bounds-true, %entry
  ret void

loop_compare_multiply_select_fusion.in_bounds-true: ; preds = %entry
  %5 = getelementptr double, ptr %arg0, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !112
  %8 = getelementptr double, ptr %arg3, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !112
  %11 = getelementptr double, ptr %arg3, i32 %linear_index
  %12 = getelementptr inbounds double, ptr %11, i32 0
  %13 = load double, ptr %12, align 8, !invariant.load !112
  %multiply.845.5.clone.1 = fmul double %10, %13
  %14 = getelementptr double, ptr %arg2, i32 %linear_index
  %15 = getelementptr inbounds double, ptr %14, i32 0
  %16 = load double, ptr %15, align 8, !invariant.load !112
  %multiply.846.7.clone.1 = fmul double %multiply.845.5.clone.1, %16
  %17 = load double, ptr %arg1, align 8, !invariant.load !112
  %multiply.847.7.clone.1 = fmul double %multiply.846.7.clone.1, %17
  %add.337.5.clone.1 = fadd double %7, %multiply.847.7.clone.1
  %constant_22_1_clone_1 = load double, ptr @19, align 8
  %compare.262.1.clone.1 = fcmp ogt double %add.337.5.clone.1, %constant_22_1_clone_1
  %18 = zext i1 %compare.262.1.clone.1 to i8
  %constant_23_1 = load double, ptr @20, align 8
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

define void @loop_dynamic_update_slice_fusion_34(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.340 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_66 = load i64, ptr @22, align 8
  %0 = icmp slt i64 %param_2.340, %constant_357_66
  %1 = zext i1 %0 to i8
  %param_2.3401 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_34 = load i64, ptr @21, align 8
  %2 = add i64 %param_2.3401, %constant_356_34
  %param_2.3402 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.3402
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
  %param_1.469 = load double, ptr %arg1, align 8, !invariant.load !112
  %15 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %param_1.469, ptr %15, align 8
  br label %dynamic-update-slice.883.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_38(ptr noalias align 128 dereferenceable(1536) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.327 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_64 = load i64, ptr @24, align 8
  %0 = icmp slt i64 %param_2.327, %constant_357_64
  %1 = zext i1 %0 to i8
  %param_2.3271 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_28 = load i64, ptr @23, align 8
  %2 = add i64 %param_2.3271, %constant_356_28
  %param_2.3272 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.3272
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %9 to i64
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
  %param_2.3273 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_644 = load i64, ptr @24, align 8
  %15 = icmp slt i64 %param_2.3273, %constant_357_644
  %16 = zext i1 %15 to i8
  %param_2.3275 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_286 = load i64, ptr @23, align 8
  %17 = add i64 %param_2.3275, %constant_356_286
  %param_2.3277 = load i64, ptr %arg2, align 8, !invariant.load !112
  %18 = trunc i8 %16 to i1
  %19 = select i1 %18, i64 %17, i64 %param_2.3277
  %20 = icmp sge i64 0, %19
  %21 = select i1 %20, i64 0, i64 %19
  %22 = icmp sle i64 191, %21
  %dynamic-slice.40.5.start_idx0 = select i1 %22, i64 191, i64 %21
  %23 = add i64 %dynamic-slice.40.5.start_idx0, 0
  %param_1.457 = getelementptr inbounds [192 x i32], ptr %arg1, i64 0, i64 %23
  %param_1.4578 = load i32, ptr %param_1.457, align 4, !invariant.load !112
  %24 = sitofp i32 %param_1.4578 to double
  %25 = getelementptr inbounds [192 x double], ptr %arg0, i64 0, i64 %14
  store double %24, ptr %25, align 8
  br label %dynamic-update-slice.878.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_30(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(20) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.612 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_56 = load i64, ptr @26, align 8
  %0 = icmp slt i64 %param_2.612, %constant_357_56
  %1 = zext i1 %0 to i8
  %param_2.6121 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_38 = load i64, ptr @25, align 8
  %2 = add i64 %param_2.6121, %constant_356_38
  %param_2.6122 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6122
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_563 = load i64, ptr @26, align 8
  %9 = icmp sge i64 0, %constant_357_563
  %10 = select i1 %9, i64 0, i64 %constant_357_563
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.887.1.in_bounds-true, label %dynamic-update-slice.887.1.in_bounds-after

dynamic-update-slice.887.1.in_bounds-after:       ; preds = %dynamic-update-slice.887.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.887.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i8, ptr %arg1, i64 %linear_index
  %param_1.714 = getelementptr inbounds i8, ptr %22, i64 0
  %param_1.7144 = load i8, ptr %param_1.714, align 1, !invariant.load !112
  %23 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %param_1.7144, ptr %23, align 1
  br label %dynamic-update-slice.887.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_45(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(1536) %arg3) {
entry:
  %param_1.733 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_38 = load i64, ptr @29, align 8
  %0 = icmp slt i64 %param_1.733, %constant_357_38
  %1 = zext i1 %0 to i8
  %param_1.7331 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_20 = load i64, ptr @28, align 8
  %2 = add i64 %param_1.7331, %constant_356_20
  %param_1.7332 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.7332
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_383 = load i64, ptr @29, align 8
  %9 = icmp sge i64 0, %constant_357_383
  %10 = select i1 %9, i64 0, i64 %constant_357_383
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.871.1.in_bounds-true, label %dynamic-update-slice.871.1.in_bounds-after

dynamic-update-slice.871.1.in_bounds-after:       ; preds = %dynamic-update-slice.871.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.871.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_1.7334 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_385 = load i64, ptr @29, align 8
  %22 = icmp slt i64 %param_1.7334, %constant_357_385
  %23 = zext i1 %22 to i8
  %param_1.7336 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_207 = load i64, ptr @28, align 8
  %24 = add i64 %param_1.7336, %constant_356_207
  %param_1.7338 = load i64, ptr %arg1, align 8, !invariant.load !112
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_1.7338
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.39.29.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.39.29.start_idx0, 0
  %param_3.613 = getelementptr inbounds [192 x double], ptr %arg3, i64 0, i64 %30
  %param_3.6139 = load double, ptr %param_3.613, align 8, !invariant.load !112
  %31 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.637 = getelementptr inbounds double, ptr %31, i64 0
  %param_2.63710 = load double, ptr %param_2.637, align 8, !invariant.load !112
  %multiply.853.5 = fmul double %param_3.6139, %param_2.63710
  %constant_359_8 = load double, ptr @27, align 8
  %compare.265.3 = fcmp ogt double %multiply.853.5, %constant_359_8
  %32 = zext i1 %compare.265.3 to i8
  %33 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %32, ptr %33, align 1
  br label %dynamic-update-slice.871.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_8(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.647 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_60 = load i64, ptr @31, align 8
  %0 = icmp slt i64 %param_2.647, %constant_357_60
  %1 = zext i1 %0 to i8
  %param_2.6471 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_2 = load i64, ptr @32, align 8
  %2 = add i64 %param_2.6471, %constant_356_2
  %param_2.6472 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6472
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_603 = load i64, ptr @31, align 8
  %9 = icmp sge i64 0, %constant_357_603
  %10 = select i1 %9, i64 0, i64 %constant_357_603
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_357_604 = load i64, ptr @31, align 8
  %13 = icmp sge i64 0, %constant_357_604
  %14 = select i1 %13, i64 0, i64 %constant_357_604
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 20
  %24 = udiv i64 %linear_index0, 20
  %25 = icmp ult i64 %linear_index, 20
  br i1 %25, label %dynamic-update-slice.910.1.in_bounds-true, label %dynamic-update-slice.910.1.in_bounds-after

dynamic-update-slice.910.1.in_bounds-after:       ; preds = %dynamic-update-slice.910.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.910.1.in_bounds-true:        ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.739 = getelementptr inbounds i64, ptr %29, i64 0
  %param_1.7395 = load i64, ptr %param_1.739, align 8, !invariant.load !112
  %constant_357_606 = load i64, ptr @31, align 8
  %30 = icmp ne i64 %param_1.7395, %constant_357_606
  %31 = zext i1 %30 to i8
  %32 = zext i8 %31 to i32
  %constant_362_3 = load i32, ptr @30, align 4
  %33 = icmp eq i32 %32, %constant_362_3
  %34 = zext i1 %33 to i8
  %35 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %34, ptr %35, align 1
  br label %dynamic-update-slice.910.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_9(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.645 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_5 = load i64, ptr @34, align 8
  %0 = icmp slt i64 %param_2.645, %constant_357_5
  %1 = zext i1 %0 to i8
  %param_2.6451 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_64 = load i64, ptr @35, align 8
  %2 = add i64 %param_2.6451, %constant_356_64
  %param_2.6452 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6452
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_53 = load i64, ptr @34, align 8
  %9 = icmp sge i64 0, %constant_357_53
  %10 = select i1 %9, i64 0, i64 %constant_357_53
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.909.1.in_bounds-true, label %dynamic-update-slice.909.1.in_bounds-after

dynamic-update-slice.909.1.in_bounds-after:       ; preds = %dynamic-update-slice.909.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.909.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.738 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.7384 = load i64, ptr %param_1.738, align 8, !invariant.load !112
  %constant_357_55 = load i64, ptr @34, align 8
  %23 = icmp ne i64 %param_1.7384, %constant_357_55
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %constant_362_1 = load i32, ptr @33, align 4
  %26 = icmp eq i32 %25, %constant_362_1
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.909.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_11(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.651 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_27 = load i64, ptr @37, align 8
  %0 = icmp slt i64 %param_2.651, %constant_357_27
  %1 = zext i1 %0 to i8
  %param_2.6511 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_59 = load i64, ptr @38, align 8
  %2 = add i64 %param_2.6511, %constant_356_59
  %param_2.6512 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6512
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_273 = load i64, ptr @37, align 8
  %9 = icmp sge i64 0, %constant_357_273
  %10 = select i1 %9, i64 0, i64 %constant_357_273
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_357_274 = load i64, ptr @37, align 8
  %13 = icmp sge i64 0, %constant_357_274
  %14 = select i1 %13, i64 0, i64 %constant_357_274
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 20
  %24 = udiv i64 %linear_index0, 20
  %25 = icmp ult i64 %linear_index, 20
  br i1 %25, label %dynamic-update-slice.906.1.in_bounds-true, label %dynamic-update-slice.906.1.in_bounds-after

dynamic-update-slice.906.1.in_bounds-after:       ; preds = %dynamic-update-slice.906.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.906.1.in_bounds-true:        ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.741 = getelementptr inbounds i64, ptr %29, i64 0
  %param_1.7415 = load i64, ptr %param_1.741, align 8, !invariant.load !112
  %constant_357_276 = load i64, ptr @37, align 8
  %30 = icmp ne i64 %param_1.7415, %constant_357_276
  %31 = zext i1 %30 to i8
  %32 = zext i8 %31 to i32
  %constant_364_2 = load i32, ptr @36, align 4
  %33 = icmp eq i32 %32, %constant_364_2
  %34 = zext i1 %33 to i8
  %35 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %34, ptr %35, align 1
  br label %dynamic-update-slice.906.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_12(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.650 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_39 = load i64, ptr @40, align 8
  %0 = icmp slt i64 %param_2.650, %constant_357_39
  %1 = zext i1 %0 to i8
  %param_2.6501 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_58 = load i64, ptr @41, align 8
  %2 = add i64 %param_2.6501, %constant_356_58
  %param_2.6502 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6502
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_393 = load i64, ptr @40, align 8
  %9 = icmp sge i64 0, %constant_357_393
  %10 = select i1 %9, i64 0, i64 %constant_357_393
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.905.1.in_bounds-true, label %dynamic-update-slice.905.1.in_bounds-after

dynamic-update-slice.905.1.in_bounds-after:       ; preds = %dynamic-update-slice.905.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.905.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.740 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.7404 = load i64, ptr %param_1.740, align 8, !invariant.load !112
  %constant_357_395 = load i64, ptr @40, align 8
  %23 = icmp ne i64 %param_1.7404, %constant_357_395
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %constant_364_1 = load i32, ptr @39, align 4
  %26 = icmp eq i32 %25, %constant_364_1
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %27, ptr %28, align 1
  br label %dynamic-update-slice.905.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_13(ptr noalias align 128 dereferenceable(15360) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.610 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_54 = load i64, ptr @42, align 8
  %0 = icmp slt i64 %param_2.610, %constant_357_54
  %1 = zext i1 %0 to i8
  %param_2.6101 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_57 = load i64, ptr @43, align 8
  %2 = add i64 %param_2.6101, %constant_356_57
  %param_2.6102 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6102
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_543 = load i64, ptr @42, align 8
  %9 = icmp sge i64 0, %constant_357_543
  %10 = select i1 %9, i64 0, i64 %constant_357_543
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.904.1.in_bounds-true, label %dynamic-update-slice.904.1.in_bounds-after

dynamic-update-slice.904.1.in_bounds-after:       ; preds = %dynamic-update-slice.904.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.904.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.712 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.7124 = load i64, ptr %param_1.712, align 8, !invariant.load !112
  %constant_357_545 = load i64, ptr @42, align 8
  %23 = icmp ne i64 %param_1.7124, %constant_357_545
  %24 = zext i1 %23 to i8
  %25 = zext i8 %24 to i32
  %26 = getelementptr inbounds [192 x [20 x i32]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i32 %25, ptr %26, align 4
  br label %dynamic-update-slice.904.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_35(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.561 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_4 = load i64, ptr @45, align 8
  %0 = icmp slt i64 %param_2.561, %constant_357_4
  %1 = zext i1 %0 to i8
  %param_2.5611 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_33 = load i64, ptr @44, align 8
  %2 = add i64 %param_2.5611, %constant_356_33
  %param_2.5612 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.5612
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_43 = load i64, ptr @45, align 8
  %9 = icmp sge i64 0, %constant_357_43
  %10 = select i1 %9, i64 0, i64 %constant_357_43
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.882.1.in_bounds-true, label %dynamic-update-slice.882.1.in_bounds-after

dynamic-update-slice.882.1.in_bounds-after:       ; preds = %dynamic-update-slice.882.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.882.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.663 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6634 = load double, ptr %param_1.663, align 8, !invariant.load !112
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.6634, ptr %23, align 8
  br label %dynamic-update-slice.882.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_26(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.631 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_15 = load i64, ptr @48, align 8
  %0 = icmp slt i64 %param_2.631, %constant_357_15
  %1 = zext i1 %0 to i8
  %param_2.6311 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_42 = load i64, ptr @47, align 8
  %2 = add i64 %param_2.6311, %constant_356_42
  %param_2.6312 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6312
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_153 = load i64, ptr @48, align 8
  %9 = icmp sge i64 0, %constant_357_153
  %10 = select i1 %9, i64 0, i64 %constant_357_153
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.891.1.in_bounds-true, label %dynamic-update-slice.891.1.in_bounds-after

dynamic-update-slice.891.1.in_bounds-after:       ; preds = %dynamic-update-slice.891.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.891.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_17 = load double, ptr @46, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.730 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7304 = load double, ptr %param_1.730, align 8, !invariant.load !112
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.7305 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.7306 = load double, ptr %param_1.7305, align 8, !invariant.load !112
  %multiply.883.1 = fmul double %param_1.7304, %param_1.7306
  %divide.405.1 = fdiv double %constant_358_17, %multiply.883.1
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.405.1, ptr %24, align 8
  br label %dynamic-update-slice.891.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_24(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(160) %arg4) {
entry:
  %param_1.689 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_31 = load i64, ptr @50, align 8
  %0 = icmp slt i64 %param_1.689, %constant_357_31
  %1 = zext i1 %0 to i8
  %param_1.6891 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_44 = load i64, ptr @49, align 8
  %2 = add i64 %param_1.6891, %constant_356_44
  %param_1.6892 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6892
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_313 = load i64, ptr @50, align 8
  %9 = icmp sge i64 0, %constant_357_313
  %10 = select i1 %9, i64 0, i64 %constant_357_313
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.893.1.in_bounds-true, label %dynamic-update-slice.893.1.in_bounds-after

dynamic-update-slice.893.1.in_bounds-after:       ; preds = %dynamic-update-slice.893.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.893.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.493 = getelementptr inbounds double, ptr %22, i64 0
  %param_4.4934 = load double, ptr %param_4.493, align 8, !invariant.load !112
  %23 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.577 = getelementptr inbounds double, ptr %23, i64 0
  %param_3.5775 = load double, ptr %param_3.577, align 8, !invariant.load !112
  %multiply.851.7 = fmul double %param_4.4934, %param_3.5775
  %24 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.587 = getelementptr inbounds double, ptr %24, i64 0
  %param_2.5876 = load double, ptr %param_2.587, align 8, !invariant.load !112
  %divide.393.3 = fdiv double %multiply.851.7, %param_2.5876
  %25 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.393.3, ptr %25, align 8
  br label %dynamic-update-slice.893.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_42(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(1536) %arg5) {
entry:
  %param_3.607 = load i64, ptr %arg3, align 8, !invariant.load !112
  %constant_357_46 = load i64, ptr @52, align 8
  %0 = icmp slt i64 %param_3.607, %constant_357_46
  %1 = zext i1 %0 to i8
  %param_3.6071 = load i64, ptr %arg3, align 8, !invariant.load !112
  %constant_356_24 = load i64, ptr @51, align 8
  %2 = add i64 %param_3.6071, %constant_356_24
  %param_3.6072 = load i64, ptr %arg3, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.6072
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_463 = load i64, ptr @52, align 8
  %9 = icmp sge i64 0, %constant_357_463
  %10 = select i1 %9, i64 0, i64 %constant_357_463
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.874.1.in_bounds-true, label %dynamic-update-slice.874.1.in_bounds-after

dynamic-update-slice.874.1.in_bounds-after:       ; preds = %dynamic-update-slice.874.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.874.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_15 = load double, ptr @54, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.728 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7284 = load double, ptr %param_1.728, align 8, !invariant.load !112
  %param_3.6075 = load i64, ptr %arg3, align 8, !invariant.load !112
  %constant_357_466 = load i64, ptr @52, align 8
  %23 = icmp slt i64 %param_3.6075, %constant_357_466
  %24 = zext i1 %23 to i8
  %param_3.6077 = load i64, ptr %arg3, align 8, !invariant.load !112
  %constant_356_248 = load i64, ptr @51, align 8
  %25 = add i64 %param_3.6077, %constant_356_248
  %param_3.6079 = load i64, ptr %arg3, align 8, !invariant.load !112
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_3.6079
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.33.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.33.start_idx0, 0
  %param_5.390 = getelementptr inbounds [192 x double], ptr %arg5, i64 0, i64 %31
  %param_5.39010 = load double, ptr %param_5.390, align 8, !invariant.load !112
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.519 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.51911 = load double, ptr %param_4.519, align 8, !invariant.load !112
  %multiply.853.9 = fmul double %param_5.39010, %param_4.51911
  %constant_359_2 = load double, ptr @53, align 8
  %compare.265.15 = fcmp ogt double %multiply.853.9, %constant_359_2
  %33 = zext i1 %compare.265.15 to i8
  %34 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.629 = getelementptr inbounds double, ptr %34, i64 0
  %param_2.62912 = load double, ptr %param_2.629, align 8, !invariant.load !112
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %multiply.853.9, double %param_2.62912
  %add.343.7 = fadd double %param_1.7284, %36
  %multiply.881.1 = fmul double %add.343.7, %add.343.7
  %divide.403.1 = fdiv double %constant_358_15, %multiply.881.1
  %37 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.403.1, ptr %37, align 8
  br label %dynamic-update-slice.874.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_40(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.632 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_50 = load i64, ptr @57, align 8
  %0 = icmp slt i64 %param_2.632, %constant_357_50
  %1 = zext i1 %0 to i8
  %param_2.6321 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_26 = load i64, ptr @56, align 8
  %2 = add i64 %param_2.6321, %constant_356_26
  %param_2.6322 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6322
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_503 = load i64, ptr @57, align 8
  %9 = icmp sge i64 0, %constant_357_503
  %10 = select i1 %9, i64 0, i64 %constant_357_503
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.876.1.in_bounds-true, label %dynamic-update-slice.876.1.in_bounds-after

dynamic-update-slice.876.1.in_bounds-after:       ; preds = %dynamic-update-slice.876.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.876.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_18 = load double, ptr @55, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.708 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7084 = load double, ptr %param_1.708, align 8, !invariant.load !112
  %subtract.76.3 = fsub double %constant_358_18, %param_1.7084
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %subtract.76.3, ptr %23, align 8
  br label %dynamic-update-slice.876.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_25(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(30720) %arg5) {
entry:
  %param_2.579 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_23 = load i64, ptr @59, align 8
  %0 = icmp slt i64 %param_2.579, %constant_357_23
  %1 = zext i1 %0 to i8
  %param_2.5791 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_43 = load i64, ptr @58, align 8
  %2 = add i64 %param_2.5791, %constant_356_43
  %param_2.5792 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.5792
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_233 = load i64, ptr @59, align 8
  %9 = icmp sge i64 0, %constant_357_233
  %10 = select i1 %9, i64 0, i64 %constant_357_233
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.892.1.in_bounds-true, label %dynamic-update-slice.892.1.in_bounds-after

dynamic-update-slice.892.1.in_bounds-after:       ; preds = %dynamic-update-slice.892.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.892.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_2.5794 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_235 = load i64, ptr @59, align 8
  %22 = icmp slt i64 %param_2.5794, %constant_357_235
  %23 = zext i1 %22 to i8
  %param_2.5796 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_437 = load i64, ptr @58, align 8
  %24 = add i64 %param_2.5796, %constant_356_437
  %param_2.5798 = load i64, ptr %arg2, align 8, !invariant.load !112
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_2.5798
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.41.14.start_idx0 = select i1 %29, i64 191, i64 %28
  %constant_357_239 = load i64, ptr @59, align 8
  %30 = icmp sge i64 0, %constant_357_239
  %31 = select i1 %30, i64 0, i64 %constant_357_239
  %32 = icmp sle i64 0, %31
  %dynamic-slice.41.14.start_idx1 = select i1 %32, i64 0, i64 %31
  %constant_357_2310 = load i64, ptr @59, align 8
  %33 = icmp sge i64 0, %constant_357_2310
  %34 = select i1 %33, i64 0, i64 %constant_357_2310
  %35 = icmp sle i64 0, %34
  %dynamic-slice.41.14.start_idx2 = select i1 %35, i64 0, i64 %34
  %36 = add i64 %dynamic-slice.41.14.start_idx0, 0
  %37 = add i64 %dynamic-slice.41.14.start_idx1, %17
  %38 = add i64 %dynamic-slice.41.14.start_idx2, 0
  %param_5.369 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr %arg5, i64 0, i64 %36, i64 %37, i64 0
  %param_5.36911 = load double, ptr %param_5.369, align 8, !invariant.load !112
  %39 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.489 = getelementptr inbounds double, ptr %39, i64 0
  %param_4.48912 = load double, ptr %param_4.489, align 8, !invariant.load !112
  %subtract.77.13 = fsub double %param_5.36911, %param_4.48912
  %40 = icmp sge i64 0, %26
  %41 = select i1 %40, i64 0, i64 %26
  %42 = icmp sle i64 191, %41
  %dynamic-slice.40.21.start_idx0 = select i1 %42, i64 191, i64 %41
  %43 = add i64 %dynamic-slice.40.21.start_idx0, 0
  %param_1.681 = getelementptr inbounds [192 x i32], ptr %arg1, i64 0, i64 %43
  %param_1.68113 = load i32, ptr %param_1.681, align 4, !invariant.load !112
  %44 = sitofp i32 %param_1.68113 to double
  %multiply.854.11 = fmul double %subtract.77.13, %44
  %45 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.570 = getelementptr inbounds double, ptr %45, i64 0
  %param_3.57014 = load double, ptr %param_3.570, align 8, !invariant.load !112
  %divide.394.7 = fdiv double %multiply.854.11, %param_3.57014
  %multiply.855.3 = fmul double %divide.394.7, %44
  %46 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.855.3, ptr %46, align 8
  br label %dynamic-update-slice.892.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_37(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(768) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(30720) %arg3, ptr noalias align 128 dereferenceable(8) %arg4) {
entry:
  %param_4.502 = load i64, ptr %arg4, align 8, !invariant.load !112
  %constant_357_57 = load i64, ptr @61, align 8
  %0 = icmp slt i64 %param_4.502, %constant_357_57
  %1 = zext i1 %0 to i8
  %param_4.5021 = load i64, ptr %arg4, align 8, !invariant.load !112
  %constant_356_30 = load i64, ptr @60, align 8
  %2 = add i64 %param_4.5021, %constant_356_30
  %param_4.5022 = load i64, ptr %arg4, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_4.5022
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_573 = load i64, ptr @61, align 8
  %9 = icmp sge i64 0, %constant_357_573
  %10 = select i1 %9, i64 0, i64 %constant_357_573
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.879.1.in_bounds-true, label %dynamic-update-slice.879.1.in_bounds-after

dynamic-update-slice.879.1.in_bounds-after:       ; preds = %dynamic-update-slice.879.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.879.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_4.5024 = load i64, ptr %arg4, align 8, !invariant.load !112
  %constant_357_575 = load i64, ptr @61, align 8
  %22 = icmp slt i64 %param_4.5024, %constant_357_575
  %23 = zext i1 %22 to i8
  %param_4.5026 = load i64, ptr %arg4, align 8, !invariant.load !112
  %constant_356_307 = load i64, ptr @60, align 8
  %24 = add i64 %param_4.5026, %constant_356_307
  %param_4.5028 = load i64, ptr %arg4, align 8, !invariant.load !112
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_4.5028
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.41.6.start_idx0 = select i1 %29, i64 191, i64 %28
  %constant_357_579 = load i64, ptr @61, align 8
  %30 = icmp sge i64 0, %constant_357_579
  %31 = select i1 %30, i64 0, i64 %constant_357_579
  %32 = icmp sle i64 0, %31
  %dynamic-slice.41.6.start_idx1 = select i1 %32, i64 0, i64 %31
  %constant_357_5710 = load i64, ptr @61, align 8
  %33 = icmp sge i64 0, %constant_357_5710
  %34 = select i1 %33, i64 0, i64 %constant_357_5710
  %35 = icmp sle i64 0, %34
  %dynamic-slice.41.6.start_idx2 = select i1 %35, i64 0, i64 %34
  %36 = add i64 %dynamic-slice.41.6.start_idx0, 0
  %37 = add i64 %dynamic-slice.41.6.start_idx1, %17
  %38 = add i64 %dynamic-slice.41.6.start_idx2, 0
  %param_3.589 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr %arg3, i64 0, i64 %36, i64 %37, i64 0
  %param_3.58911 = load double, ptr %param_3.589, align 8, !invariant.load !112
  %39 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.613 = getelementptr inbounds double, ptr %39, i64 0
  %param_2.61312 = load double, ptr %param_2.613, align 8, !invariant.load !112
  %subtract.77.5 = fsub double %param_3.58911, %param_2.61312
  %40 = icmp sge i64 0, %26
  %41 = select i1 %40, i64 0, i64 %26
  %42 = icmp sle i64 191, %41
  %dynamic-slice.40.12.start_idx0 = select i1 %42, i64 191, i64 %41
  %43 = add i64 %dynamic-slice.40.12.start_idx0, 0
  %param_1.715 = getelementptr inbounds [192 x i32], ptr %arg1, i64 0, i64 %43
  %param_1.71513 = load i32, ptr %param_1.715, align 4, !invariant.load !112
  %44 = sitofp i32 %param_1.71513 to double
  %multiply.854.3 = fmul double %subtract.77.5, %44
  %45 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.854.3, ptr %45, align 8
  br label %dynamic-update-slice.879.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_27(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(8) %arg3) {
entry:
  %param_3.564 = load i64, ptr %arg3, align 8, !invariant.load !112
  %constant_357_11 = load i64, ptr @63, align 8
  %0 = icmp slt i64 %param_3.564, %constant_357_11
  %1 = zext i1 %0 to i8
  %param_3.5641 = load i64, ptr %arg3, align 8, !invariant.load !112
  %constant_356_41 = load i64, ptr @62, align 8
  %2 = add i64 %param_3.5641, %constant_356_41
  %param_3.5642 = load i64, ptr %arg3, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_3.5642
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_113 = load i64, ptr @63, align 8
  %9 = icmp sge i64 0, %constant_357_113
  %10 = select i1 %9, i64 0, i64 %constant_357_113
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.890.1.in_bounds-true, label %dynamic-update-slice.890.1.in_bounds-after

dynamic-update-slice.890.1.in_bounds-after:       ; preds = %dynamic-update-slice.890.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.890.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.567 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.5674 = load double, ptr %param_2.567, align 8, !invariant.load !112
  %23 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.669 = getelementptr inbounds double, ptr %23, i64 0
  %param_1.6695 = load double, ptr %param_1.669, align 8, !invariant.load !112
  %multiply.851.3 = fmul double %param_2.5674, %param_1.6695
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.851.3, ptr %24, align 8
  br label %dynamic-update-slice.890.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_21(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(1536) %arg5) {
entry:
  %param_1.665 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_6 = load i64, ptr @65, align 8
  %0 = icmp slt i64 %param_1.665, %constant_357_6
  %1 = zext i1 %0 to i8
  %param_1.6651 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_49 = load i64, ptr @64, align 8
  %2 = add i64 %param_1.6651, %constant_356_49
  %param_1.6652 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6652
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_63 = load i64, ptr @65, align 8
  %9 = icmp sge i64 0, %constant_357_63
  %10 = select i1 %9, i64 0, i64 %constant_357_63
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.896.1.in_bounds-true, label %dynamic-update-slice.896.1.in_bounds-after

dynamic-update-slice.896.1.in_bounds-after:       ; preds = %dynamic-update-slice.896.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.896.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_1.6654 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_65 = load i64, ptr @65, align 8
  %22 = icmp slt i64 %param_1.6654, %constant_357_65
  %23 = zext i1 %22 to i8
  %param_1.6656 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_497 = load i64, ptr @64, align 8
  %24 = add i64 %param_1.6656, %constant_356_497
  %param_1.6658 = load i64, ptr %arg1, align 8, !invariant.load !112
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_1.6658
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.39.45.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.39.45.start_idx0, 0
  %param_5.397 = getelementptr inbounds [192 x double], ptr %arg5, i64 0, i64 %30
  %param_5.3979 = load double, ptr %param_5.397, align 8, !invariant.load !112
  %31 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.528 = getelementptr inbounds double, ptr %31, i64 0
  %param_4.52810 = load double, ptr %param_4.528, align 8, !invariant.load !112
  %multiply.853.21 = fmul double %param_5.3979, %param_4.52810
  %constant_359_16 = load double, ptr @66, align 8
  %compare.265.23 = fcmp ogt double %multiply.853.21, %constant_359_16
  %32 = zext i1 %compare.265.23 to i8
  %33 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.560 = getelementptr inbounds double, ptr %33, i64 0
  %param_3.56011 = load double, ptr %param_3.560, align 8, !invariant.load !112
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, double %multiply.853.21, double %param_3.56011
  %36 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.563 = getelementptr inbounds double, ptr %36, i64 0
  %param_2.56312 = load double, ptr %param_2.563, align 8, !invariant.load !112
  %multiply.857.9 = fmul double %35, %param_2.56312
  %37 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.857.9, ptr %37, align 8
  br label %dynamic-update-slice.896.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_6(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(1536) %arg5, ptr noalias align 16 dereferenceable(160) %arg6) {
entry:
  %param_1.695 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_37 = load i64, ptr @68, align 8
  %0 = icmp slt i64 %param_1.695, %constant_357_37
  %1 = zext i1 %0 to i8
  %param_1.6951 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_3 = load i64, ptr @67, align 8
  %2 = add i64 %param_1.6951, %constant_356_3
  %param_1.6952 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6952
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_373 = load i64, ptr @68, align 8
  %9 = icmp sge i64 0, %constant_357_373
  %10 = select i1 %9, i64 0, i64 %constant_357_373
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.912.1.in_bounds-true, label %dynamic-update-slice.912.1.in_bounds-after

dynamic-update-slice.912.1.in_bounds-after:       ; preds = %dynamic-update-slice.912.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.912.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.294 = getelementptr inbounds double, ptr %22, i64 0
  %param_6.2944 = load double, ptr %param_6.294, align 8, !invariant.load !112
  %param_1.6955 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_376 = load i64, ptr @68, align 8
  %23 = icmp slt i64 %param_1.6955, %constant_357_376
  %24 = zext i1 %23 to i8
  %param_1.6957 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_38 = load i64, ptr @67, align 8
  %25 = add i64 %param_1.6957, %constant_356_38
  %param_1.6959 = load i64, ptr %arg1, align 8, !invariant.load !112
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_1.6959
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.73.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.73.start_idx0, 0
  %param_5.400 = getelementptr inbounds [192 x double], ptr %arg5, i64 0, i64 %31
  %param_5.40010 = load double, ptr %param_5.400, align 8, !invariant.load !112
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.530 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.53011 = load double, ptr %param_4.530, align 8, !invariant.load !112
  %multiply.853.35 = fmul double %param_5.40010, %param_4.53011
  %constant_359_20 = load double, ptr @69, align 8
  %compare.265.39 = fcmp ogt double %multiply.853.35, %constant_359_20
  %33 = zext i1 %compare.265.39 to i8
  %34 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.580 = getelementptr inbounds double, ptr %34, i64 0
  %param_3.58012 = load double, ptr %param_3.580, align 8, !invariant.load !112
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %multiply.853.35, double %param_3.58012
  %37 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.593 = getelementptr inbounds double, ptr %37, i64 0
  %param_2.59313 = load double, ptr %param_2.593, align 8, !invariant.load !112
  %multiply.857.25 = fmul double %36, %param_2.59313
  %multiply.864.11 = fmul double %param_6.2944, %multiply.857.25
  %multiply.869.1 = fmul double %multiply.864.11, %multiply.864.11
  %38 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.869.1, ptr %38, align 8
  br label %dynamic-update-slice.912.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_18(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(1536) %arg5, ptr noalias align 16 dereferenceable(160) %arg6) {
entry:
  %param_1.705 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_47 = load i64, ptr @71, align 8
  %0 = icmp slt i64 %param_1.705, %constant_357_47
  %1 = zext i1 %0 to i8
  %param_1.7051 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_52 = load i64, ptr @70, align 8
  %2 = add i64 %param_1.7051, %constant_356_52
  %param_1.7052 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.7052
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_473 = load i64, ptr @71, align 8
  %9 = icmp sge i64 0, %constant_357_473
  %10 = select i1 %9, i64 0, i64 %constant_357_473
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.899.1.in_bounds-true, label %dynamic-update-slice.899.1.in_bounds-after

dynamic-update-slice.899.1.in_bounds-after:       ; preds = %dynamic-update-slice.899.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.899.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.293 = getelementptr inbounds double, ptr %22, i64 0
  %param_6.2934 = load double, ptr %param_6.293, align 8, !invariant.load !112
  %param_1.7055 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_476 = load i64, ptr @71, align 8
  %23 = icmp slt i64 %param_1.7055, %constant_357_476
  %24 = zext i1 %23 to i8
  %param_1.7057 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_528 = load i64, ptr @70, align 8
  %25 = add i64 %param_1.7057, %constant_356_528
  %param_1.7059 = load i64, ptr %arg1, align 8, !invariant.load !112
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_1.7059
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.71.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.71.start_idx0, 0
  %param_5.399 = getelementptr inbounds [192 x double], ptr %arg5, i64 0, i64 %31
  %param_5.39910 = load double, ptr %param_5.399, align 8, !invariant.load !112
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.529 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.52911 = load double, ptr %param_4.529, align 8, !invariant.load !112
  %multiply.853.33 = fmul double %param_5.39910, %param_4.52911
  %constant_359_19 = load double, ptr @72, align 8
  %compare.265.37 = fcmp ogt double %multiply.853.33, %constant_359_19
  %33 = zext i1 %compare.265.37 to i8
  %34 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.585 = getelementptr inbounds double, ptr %34, i64 0
  %param_3.58512 = load double, ptr %param_3.585, align 8, !invariant.load !112
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %multiply.853.33, double %param_3.58512
  %37 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.603 = getelementptr inbounds double, ptr %37, i64 0
  %param_2.60313 = load double, ptr %param_2.603, align 8, !invariant.load !112
  %multiply.857.23 = fmul double %36, %param_2.60313
  %multiply.864.9 = fmul double %param_6.2934, %multiply.857.23
  %38 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.864.9, ptr %38, align 8
  br label %dynamic-update-slice.899.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_3(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 16 dereferenceable(1536) %arg6) {
entry:
  %param_1.683 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_25 = load i64, ptr @74, align 8
  %0 = icmp slt i64 %param_1.683, %constant_357_25
  %1 = zext i1 %0 to i8
  %param_1.6831 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_29 = load i64, ptr @73, align 8
  %2 = add i64 %param_1.6831, %constant_356_29
  %param_1.6832 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6832
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_253 = load i64, ptr @74, align 8
  %9 = icmp sge i64 0, %constant_357_253
  %10 = select i1 %9, i64 0, i64 %constant_357_253
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.915.1.in_bounds-true, label %dynamic-update-slice.915.1.in_bounds-after

dynamic-update-slice.915.1.in_bounds-after:       ; preds = %dynamic-update-slice.915.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.915.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.648 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.6484 = load double, ptr %param_2.648, align 8, !invariant.load !112
  %multiply.872.9 = fmul double %param_2.6484, %param_2.6484
  %constant_363_1 = load double, ptr @76, align 8
  %multiply.873.7 = fmul double %multiply.872.9, %constant_363_1
  %param_1.6835 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_256 = load i64, ptr @74, align 8
  %23 = icmp slt i64 %param_1.6835, %constant_357_256
  %24 = zext i1 %23 to i8
  %param_1.6837 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_298 = load i64, ptr @73, align 8
  %25 = add i64 %param_1.6837, %constant_356_298
  %param_1.6839 = load i64, ptr %arg1, align 8, !invariant.load !112
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_1.6839
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.31.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.31.start_idx0, 0
  %param_6.298 = getelementptr inbounds [192 x double], ptr %arg6, i64 0, i64 %31
  %param_6.29810 = load double, ptr %param_6.298, align 8, !invariant.load !112
  %32 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.404 = getelementptr inbounds double, ptr %32, i64 0
  %param_5.40411 = load double, ptr %param_5.404, align 8, !invariant.load !112
  %multiply.853.7 = fmul double %param_6.29810, %param_5.40411
  %constant_359_10 = load double, ptr @75, align 8
  %compare.265.25 = fcmp ogt double %multiply.853.7, %constant_359_10
  %33 = zext i1 %compare.265.25 to i8
  %34 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.534 = getelementptr inbounds double, ptr %34, i64 0
  %param_4.53412 = load double, ptr %param_4.534, align 8, !invariant.load !112
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %multiply.853.7, double %param_4.53412
  %37 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.621 = getelementptr inbounds double, ptr %37, i64 0
  %param_3.62113 = load double, ptr %param_3.621, align 8, !invariant.load !112
  %multiply.857.11 = fmul double %36, %param_3.62113
  %multiply.874.1 = fmul double %multiply.873.7, %multiply.857.11
  %38 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.874.1, ptr %38, align 8
  br label %dynamic-update-slice.915.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_7(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 16 dereferenceable(1536) %arg5, ptr noalias align 16 dereferenceable(160) %arg6) {
entry:
  %param_1.737 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_49 = load i64, ptr @79, align 8
  %0 = icmp slt i64 %param_1.737, %constant_357_49
  %1 = zext i1 %0 to i8
  %param_1.7371 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_23 = load i64, ptr @78, align 8
  %2 = add i64 %param_1.7371, %constant_356_23
  %param_1.7372 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.7372
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_493 = load i64, ptr @79, align 8
  %9 = icmp sge i64 0, %constant_357_493
  %10 = select i1 %9, i64 0, i64 %constant_357_493
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.911.1.in_bounds-true, label %dynamic-update-slice.911.1.in_bounds-after

dynamic-update-slice.911.1.in_bounds-after:       ; preds = %dynamic-update-slice.911.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.911.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.296 = getelementptr inbounds double, ptr %22, i64 0
  %param_6.2964 = load double, ptr %param_6.296, align 8, !invariant.load !112
  %param_1.7375 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_496 = load i64, ptr @79, align 8
  %23 = icmp slt i64 %param_1.7375, %constant_357_496
  %24 = zext i1 %23 to i8
  %param_1.7377 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_238 = load i64, ptr @78, align 8
  %25 = add i64 %param_1.7377, %constant_356_238
  %param_1.7379 = load i64, ptr %arg1, align 8, !invariant.load !112
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_1.7379
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.69.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.69.start_idx0, 0
  %param_5.402 = getelementptr inbounds [192 x double], ptr %arg5, i64 0, i64 %31
  %param_5.40210 = load double, ptr %param_5.402, align 8, !invariant.load !112
  %32 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.532 = getelementptr inbounds double, ptr %32, i64 0
  %param_4.53211 = load double, ptr %param_4.532, align 8, !invariant.load !112
  %multiply.853.31 = fmul double %param_5.40210, %param_4.53211
  %constant_359_18 = load double, ptr @80, align 8
  %compare.265.35 = fcmp ogt double %multiply.853.31, %constant_359_18
  %33 = zext i1 %compare.265.35 to i8
  %34 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.619 = getelementptr inbounds double, ptr %34, i64 0
  %param_3.61912 = load double, ptr %param_3.619, align 8, !invariant.load !112
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %multiply.853.31, double %param_3.61912
  %37 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.643 = getelementptr inbounds double, ptr %37, i64 0
  %param_2.64313 = load double, ptr %param_2.643, align 8, !invariant.load !112
  %multiply.857.21 = fmul double %36, %param_2.64313
  %multiply.864.7 = fmul double %param_6.2964, %multiply.857.21
  %constant_361_4 = load double, ptr @77, align 8
  %multiply.887.3 = fmul double %multiply.864.7, %constant_361_4
  %38 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.887.3, ptr %38, align 8
  br label %dynamic-update-slice.911.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_43(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4) {
entry:
  %param_2.638 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_42 = load i64, ptr @82, align 8
  %0 = icmp slt i64 %param_2.638, %constant_357_42
  %1 = zext i1 %0 to i8
  %param_2.6381 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_22 = load i64, ptr @81, align 8
  %2 = add i64 %param_2.6381, %constant_356_22
  %param_2.6382 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6382
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_423 = load i64, ptr @82, align 8
  %9 = icmp sge i64 0, %constant_357_423
  %10 = select i1 %9, i64 0, i64 %constant_357_423
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.873.1.in_bounds-true, label %dynamic-update-slice.873.1.in_bounds-after

dynamic-update-slice.873.1.in_bounds-after:       ; preds = %dynamic-update-slice.873.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.873.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_2.6384 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_425 = load i64, ptr @82, align 8
  %22 = icmp slt i64 %param_2.6384, %constant_357_425
  %23 = zext i1 %22 to i8
  %param_2.6386 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_227 = load i64, ptr @81, align 8
  %24 = add i64 %param_2.6386, %constant_356_227
  %param_2.6388 = load i64, ptr %arg2, align 8, !invariant.load !112
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_2.6388
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.39.27.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.39.27.start_idx0, 0
  %param_4.524 = getelementptr inbounds [192 x double], ptr %arg4, i64 0, i64 %30
  %param_4.5249 = load double, ptr %param_4.524, align 8, !invariant.load !112
  %31 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.614 = getelementptr inbounds double, ptr %31, i64 0
  %param_3.61410 = load double, ptr %param_3.614, align 8, !invariant.load !112
  %multiply.853.3 = fmul double %param_4.5249, %param_3.61410
  %constant_359_9 = load double, ptr @83, align 8
  %compare.265.5 = fcmp ogt double %multiply.853.3, %constant_359_9
  %32 = zext i1 %compare.265.5 to i8
  %33 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.700 = getelementptr inbounds double, ptr %33, i64 0
  %param_1.70011 = load double, ptr %param_1.700, align 8, !invariant.load !112
  %34 = trunc i8 %32 to i1
  %35 = select i1 %34, double %multiply.853.3, double %param_1.70011
  %36 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %35, ptr %36, align 8
  br label %dynamic-update-slice.873.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_4(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 16 dereferenceable(160) %arg2) {
entry:
  %param_1.687 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_29 = load i64, ptr @86, align 8
  %0 = icmp slt i64 %param_1.687, %constant_357_29
  %1 = zext i1 %0 to i8
  %param_1.6871 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_45 = load i64, ptr @85, align 8
  %2 = add i64 %param_1.6871, %constant_356_45
  %param_1.6872 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6872
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_293 = load i64, ptr @86, align 8
  %9 = icmp sge i64 0, %constant_357_293
  %10 = select i1 %9, i64 0, i64 %constant_357_293
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.914.1.in_bounds-true, label %dynamic-update-slice.914.1.in_bounds-after

dynamic-update-slice.914.1.in_bounds-after:       ; preds = %dynamic-update-slice.914.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.914.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.649 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.6494 = load double, ptr %param_2.649, align 8, !invariant.load !112
  %multiply.872.5 = fmul double %param_2.6494, %param_2.6494
  %constant_363_3 = load double, ptr @84, align 8
  %multiply.873.3 = fmul double %multiply.872.5, %constant_363_3
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.873.3, ptr %23, align 8
  br label %dynamic-update-slice.914.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_5(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.641 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_33 = load i64, ptr @89, align 8
  %0 = icmp slt i64 %param_2.641, %constant_357_33
  %1 = zext i1 %0 to i8
  %param_2.6411 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_46 = load i64, ptr @88, align 8
  %2 = add i64 %param_2.6411, %constant_356_46
  %param_2.6412 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6412
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_333 = load i64, ptr @89, align 8
  %9 = icmp sge i64 0, %constant_357_333
  %10 = select i1 %9, i64 0, i64 %constant_357_333
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.913.1.in_bounds-true, label %dynamic-update-slice.913.1.in_bounds-after

dynamic-update-slice.913.1.in_bounds-after:       ; preds = %dynamic-update-slice.913.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.913.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.691 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6914 = load double, ptr %param_1.691, align 8, !invariant.load !112
  %constant_361_1 = load double, ptr @87, align 8
  %multiply.888.3 = fmul double %param_1.6914, %constant_361_1
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.888.3, ptr %23, align 8
  br label %dynamic-update-slice.913.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_58(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(1536) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.600 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_44 = load i64, ptr @91, align 8
  %0 = icmp slt i64 %param_2.600, %constant_357_44
  %1 = zext i1 %0 to i8
  %param_2.6001 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_61 = load i64, ptr @90, align 8
  %2 = add i64 %param_2.6001, %constant_356_61
  %param_2.6002 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6002
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_443 = load i64, ptr @91, align 8
  %9 = icmp sge i64 0, %constant_357_443
  %10 = select i1 %9, i64 0, i64 %constant_357_443
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.907.1.in_bounds-true, label %dynamic-update-slice.907.1.in_bounds-after

dynamic-update-slice.907.1.in_bounds-after:       ; preds = %dynamic-update-slice.907.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.907.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %param_2.6004 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_445 = load i64, ptr @91, align 8
  %22 = icmp slt i64 %param_2.6004, %constant_357_445
  %23 = zext i1 %22 to i8
  %param_2.6006 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_617 = load i64, ptr @90, align 8
  %24 = add i64 %param_2.6006, %constant_356_617
  %param_2.6008 = load i64, ptr %arg2, align 8, !invariant.load !112
  %25 = trunc i8 %23 to i1
  %26 = select i1 %25, i64 %24, i64 %param_2.6008
  %27 = icmp sge i64 0, %26
  %28 = select i1 %27, i64 0, i64 %26
  %29 = icmp sle i64 191, %28
  %dynamic-slice.39.2.start_idx0 = select i1 %29, i64 191, i64 %28
  %30 = add i64 %dynamic-slice.39.2.start_idx0, 0
  %param_1.702 = getelementptr inbounds [192 x double], ptr %arg1, i64 0, i64 %30
  %param_1.7029 = load double, ptr %param_1.702, align 8, !invariant.load !112
  %31 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.7029, ptr %31, align 8
  br label %dynamic-update-slice.907.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_14(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.577 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_21 = load i64, ptr @93, align 8
  %0 = icmp slt i64 %param_2.577, %constant_357_21
  %1 = zext i1 %0 to i8
  %param_2.5771 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_56 = load i64, ptr @92, align 8
  %2 = add i64 %param_2.5771, %constant_356_56
  %param_2.5772 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.5772
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_213 = load i64, ptr @93, align 8
  %9 = icmp sge i64 0, %constant_357_213
  %10 = select i1 %9, i64 0, i64 %constant_357_213
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.903.1.in_bounds-true, label %dynamic-update-slice.903.1.in_bounds-after

dynamic-update-slice.903.1.in_bounds-after:       ; preds = %dynamic-update-slice.903.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.903.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr i64, ptr %arg1, i64 %linear_index
  %param_1.679 = getelementptr inbounds i64, ptr %22, i64 0
  %param_1.6794 = load i64, ptr %param_1.679, align 8, !invariant.load !112
  %23 = sitofp i64 %param_1.6794 to double
  %24 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %23, ptr %24, align 8
  br label %dynamic-update-slice.903.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_20(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.599 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_43 = load i64, ptr @95, align 8
  %0 = icmp slt i64 %param_2.599, %constant_357_43
  %1 = zext i1 %0 to i8
  %param_2.5991 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_50 = load i64, ptr @94, align 8
  %2 = add i64 %param_2.5991, %constant_356_50
  %param_2.5992 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.5992
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_433 = load i64, ptr @95, align 8
  %9 = icmp sge i64 0, %constant_357_433
  %10 = select i1 %9, i64 0, i64 %constant_357_433
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.897.1.in_bounds-true, label %dynamic-update-slice.897.1.in_bounds-after

dynamic-update-slice.897.1.in_bounds-after:       ; preds = %dynamic-update-slice.897.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.897.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.701 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7014 = load double, ptr %param_1.701, align 8, !invariant.load !112
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.7014, ptr %23, align 8
  br label %dynamic-update-slice.897.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_48(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.588 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_32 = load i64, ptr @97, align 8
  %0 = icmp slt i64 %param_2.588, %constant_357_32
  %1 = zext i1 %0 to i8
  %param_2.5881 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_17 = load i64, ptr @96, align 8
  %2 = add i64 %param_2.5881, %constant_356_17
  %param_2.5882 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.5882
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_323 = load i64, ptr @97, align 8
  %9 = icmp sge i64 0, %constant_357_323
  %10 = select i1 %9, i64 0, i64 %constant_357_323
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.868.1.in_bounds-true, label %dynamic-update-slice.868.1.in_bounds-after

dynamic-update-slice.868.1.in_bounds-after:       ; preds = %dynamic-update-slice.868.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.868.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.690 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.6904 = load double, ptr %param_1.690, align 8, !invariant.load !112
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %param_1.6904, ptr %23, align 8
  br label %dynamic-update-slice.868.1.in_bounds-after
}

define void @loop_add_divide_exponential_select_fusion(ptr noalias align 128 dereferenceable(160) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 16 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(1536) %arg3, ptr noalias align 128 dereferenceable(8) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 16 dereferenceable(160) %arg8, ptr noalias align 128 dereferenceable(160) %arg9, ptr noalias align 16 dereferenceable(160) %arg10, ptr noalias align 16 dereferenceable(160) %arg11, ptr noalias align 128 dereferenceable(160) %arg12, ptr noalias align 128 dereferenceable(160) %arg13, ptr noalias align 16 dereferenceable(160) %arg14, ptr noalias align 16 dereferenceable(160) %arg15, ptr noalias align 128 dereferenceable(160) %arg16, ptr noalias align 128 dereferenceable(160) %arg17, ptr noalias align 128 dereferenceable(160) %arg18, ptr noalias align 16 dereferenceable(160) %arg19, ptr noalias align 16 dereferenceable(160) %arg20, ptr noalias align 128 dereferenceable(160) %arg21, ptr noalias align 128 dereferenceable(160) %arg22, ptr noalias align 128 dereferenceable(160) %arg23, ptr noalias align 128 dereferenceable(160) %arg24, ptr noalias align 128 dereferenceable(160) %arg25, ptr noalias align 128 dereferenceable(160) %arg26, ptr noalias align 128 dereferenceable(160) %arg27, ptr noalias align 128 dereferenceable(160) %arg28, ptr noalias align 128 dereferenceable(160) %arg29, ptr noalias align 128 dereferenceable(160) %arg30, ptr noalias align 16 dereferenceable(30720) %arg31, ptr noalias align 128 dereferenceable(80) %arg32, ptr noalias align 16 dereferenceable(768) %arg33, ptr noalias align 128 dereferenceable(160) %arg34, ptr noalias align 128 dereferenceable(160) %arg35, ptr noalias align 128 dereferenceable(160) %arg36, ptr noalias align 128 dereferenceable(160) %arg37, ptr noalias align 128 dereferenceable(160) %arg38, ptr noalias align 128 dereferenceable(160) %arg39, ptr noalias align 128 dereferenceable(160) %arg40, ptr noalias align 16 dereferenceable(160) %arg41, ptr noalias align 128 dereferenceable(160) %arg42, ptr noalias align 128 dereferenceable(160) %arg43, ptr noalias align 128 dereferenceable(160) %arg44, ptr noalias align 128 dereferenceable(160) %arg45, ptr noalias align 128 dereferenceable(160) %arg46) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %2 = mul nuw nsw i32 %0, 20
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 20
  br i1 %4, label %loop_add_divide_exponential_select_fusion.in_bounds-true, label %loop_add_divide_exponential_select_fusion.in_bounds-after

loop_add_divide_exponential_select_fusion.in_bounds-after: ; preds = %loop_add_divide_exponential_select_fusion.in_bounds-true, %entry
  ret void

loop_add_divide_exponential_select_fusion.in_bounds-true: ; preds = %entry
  %5 = getelementptr double, ptr %arg20, i32 %linear_index
  %6 = getelementptr inbounds double, ptr %5, i32 0
  %7 = load double, ptr %6, align 8, !invariant.load !112
  %8 = getelementptr double, ptr %arg21, i32 %linear_index
  %9 = getelementptr inbounds double, ptr %8, i32 0
  %10 = load double, ptr %9, align 8, !invariant.load !112
  %multiply.848.3.clone.1 = fmul double %7, %10
  %11 = load i64, ptr %arg4, align 8, !invariant.load !112
  %constant_357_1 = load i64, ptr @99, align 8
  %12 = icmp slt i64 %11, %constant_357_1
  %13 = zext i1 %12 to i8
  %14 = load i64, ptr %arg4, align 8, !invariant.load !112
  %constant_356_74 = load i64, ptr @98, align 8
  %15 = add i64 %14, %constant_356_74
  %16 = load i64, ptr %arg4, align 8, !invariant.load !112
  %17 = trunc i8 %13 to i1
  %18 = select i1 %17, i64 %15, i64 %16
  %19 = trunc i64 %18 to i32
  %20 = icmp sge i32 0, %19
  %21 = select i1 %20, i32 0, i32 %19
  %22 = icmp sle i32 191, %21
  %dynamic-slice.39.51.clone.1.start_idx0 = select i1 %22, i32 191, i32 %21
  %23 = add i32 %dynamic-slice.39.51.clone.1.start_idx0, 0
  %24 = getelementptr inbounds [192 x double], ptr %arg3, i32 0, i32 %23
  %25 = load double, ptr %24, align 8, !invariant.load !112
  %26 = getelementptr double, ptr %arg19, i32 %linear_index
  %27 = getelementptr inbounds double, ptr %26, i32 0
  %28 = load double, ptr %27, align 8, !invariant.load !112
  %multiply.849.5.clone.1 = fmul double %25, %28
  %add.340.3.clone.1 = fadd double %multiply.848.3.clone.1, %multiply.849.5.clone.1
  %29 = getelementptr double, ptr %arg41, i32 %linear_index
  %30 = getelementptr inbounds double, ptr %29, i32 0
  %31 = load double, ptr %30, align 8, !invariant.load !112
  %32 = getelementptr double, ptr %arg28, i32 %linear_index
  %33 = getelementptr inbounds double, ptr %32, i32 0
  %34 = load double, ptr %33, align 8, !invariant.load !112
  %multiply.851.9.clone.1 = fmul double %31, %34
  %35 = getelementptr double, ptr %arg22, i32 %linear_index
  %36 = getelementptr inbounds double, ptr %35, i32 0
  %37 = load double, ptr %36, align 8
  %divide.393.5.clone.1 = fdiv double %multiply.851.9.clone.1, %37
  %38 = trunc i64 %18 to i32
  %39 = icmp sge i32 0, %38
  %40 = select i1 %39, i32 0, i32 %38
  %41 = icmp sle i32 191, %40
  %dynamic-slice.41.12.clone.1.start_idx0 = select i1 %41, i32 191, i32 %40
  %constant_357_11 = load i64, ptr @99, align 8
  %42 = trunc i64 %constant_357_11 to i32
  %43 = icmp sge i32 0, %42
  %44 = select i1 %43, i32 0, i32 %42
  %45 = icmp sle i32 0, %44
  %dynamic-slice.41.12.clone.1.start_idx1 = select i1 %45, i32 0, i32 %44
  %constant_357_12 = load i64, ptr @99, align 8
  %46 = trunc i64 %constant_357_12 to i32
  %47 = icmp sge i32 0, %46
  %48 = select i1 %47, i32 0, i32 %46
  %49 = icmp sle i32 0, %48
  %dynamic-slice.41.12.clone.1.start_idx2 = select i1 %49, i32 0, i32 %48
  %50 = add i32 %dynamic-slice.41.12.clone.1.start_idx0, 0
  %51 = add i32 %dynamic-slice.41.12.clone.1.start_idx1, %3
  %52 = add i32 %dynamic-slice.41.12.clone.1.start_idx2, 0
  %53 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr %arg31, i32 0, i32 %50, i32 %51, i32 0
  %54 = load double, ptr %53, align 8, !invariant.load !112
  %55 = getelementptr double, ptr %arg25, i32 %linear_index
  %56 = getelementptr inbounds double, ptr %55, i32 0
  %57 = load double, ptr %56, align 8, !invariant.load !112
  %subtract.77.11.clone.1 = fsub double %54, %57
  %58 = trunc i64 %18 to i32
  %59 = icmp sge i32 0, %58
  %60 = select i1 %59, i32 0, i32 %58
  %61 = icmp sle i32 191, %60
  %dynamic-slice.40.19.clone.1.start_idx0 = select i1 %61, i32 191, i32 %60
  %62 = add i32 %dynamic-slice.40.19.clone.1.start_idx0, 0
  %63 = getelementptr inbounds [192 x i32], ptr %arg33, i32 0, i32 %62
  %64 = load i32, ptr %63, align 4, !invariant.load !112
  %65 = sitofp i32 %64 to double
  %multiply.854.9.clone.1 = fmul double %subtract.77.11.clone.1, %65
  %66 = getelementptr double, ptr %arg28, i32 %linear_index
  %67 = getelementptr inbounds double, ptr %66, i32 0
  %68 = load double, ptr %67, align 8, !invariant.load !112
  %divide.394.5.clone.1 = fdiv double %multiply.854.9.clone.1, %68
  %multiply.855.5.clone.1 = fmul double %divide.394.5.clone.1, %65
  %multiply.856.1.clone.1 = fmul double %divide.393.5.clone.1, %multiply.855.5.clone.1
  %add.344.1.clone.1 = fadd double %add.340.3.clone.1, %multiply.856.1.clone.1
  %69 = call double @llvm.fabs.f64(double %add.344.1.clone.1)
  %70 = fcmp one double %69, 0x7FF0000000000000
  %71 = zext i1 %70 to i8
  %72 = call double @llvm.fabs.f64(double %add.344.1.clone.1)
  %constant_365_20 = load double, ptr @101, align 8
  %compare.266.41 = fcmp olt double %72, %constant_365_20
  %73 = zext i1 %compare.266.41 to i8
  %74 = and i8 %71, %73
  %75 = getelementptr i64, ptr %arg2, i32 %linear_index
  %76 = getelementptr inbounds i64, ptr %75, i32 0
  %77 = load i64, ptr %76, align 8, !invariant.load !112
  %constant_357_13 = load i64, ptr @99, align 8
  %78 = icmp ne i64 %77, %constant_357_13
  %79 = zext i1 %78 to i8
  %80 = zext i8 %79 to i32
  %constant_362_2 = load i32, ptr @106, align 4
  %81 = icmp slt i32 %80, %constant_362_2
  %82 = zext i1 %81 to i8
  %constant_358_11 = load double, ptr @103, align 8
  %83 = getelementptr double, ptr %arg0, i32 %linear_index
  %84 = getelementptr inbounds double, ptr %83, i32 0
  %85 = load double, ptr %84, align 8
  %divide.396.1.clone.1 = fdiv double %constant_358_11, %85
  %86 = getelementptr double, ptr %arg15, i32 %linear_index
  %87 = getelementptr inbounds double, ptr %86, i32 0
  %88 = load double, ptr %87, align 8, !invariant.load !112
  %89 = call double @__nv_exp(double %88)
  %multiply.863.3 = fmul double %25, %89
  %add.350.2 = fadd double %divide.396.1.clone.1, %multiply.863.3
  %divide.399.3 = fdiv double %constant_358_11, %add.350.2
  %constant_359_1 = load double, ptr @100, align 8
  %compare.267.13.clone.1 = fcmp ogt double %multiply.863.3, %constant_359_1
  %90 = zext i1 %compare.267.13.clone.1 to i8
  %91 = getelementptr double, ptr %arg14, i32 %linear_index
  %92 = getelementptr inbounds double, ptr %91, i32 0
  %93 = load double, ptr %92, align 8, !invariant.load !112
  %94 = trunc i8 %90 to i1
  %95 = select i1 %94, double %multiply.863.3, double %93
  %add.348.5.clone.1 = fadd double %divide.396.1.clone.1, %95
  %divide.397.1.clone.1 = fdiv double %constant_358_11, %add.348.5.clone.1
  %96 = getelementptr double, ptr %arg8, i32 %linear_index
  %97 = getelementptr inbounds double, ptr %96, i32 0
  %98 = load double, ptr %97, align 8, !invariant.load !112
  %99 = getelementptr double, ptr %arg7, i32 %linear_index
  %100 = getelementptr inbounds double, ptr %99, i32 0
  %101 = load double, ptr %100, align 8, !invariant.load !112
  %multiply.853.39 = fmul double %25, %101
  %compare.265.43 = fcmp ogt double %multiply.853.39, %constant_359_1
  %102 = zext i1 %compare.265.43 to i8
  %103 = getelementptr double, ptr %arg6, i32 %linear_index
  %104 = getelementptr inbounds double, ptr %103, i32 0
  %105 = load double, ptr %104, align 8, !invariant.load !112
  %106 = trunc i8 %102 to i1
  %107 = select i1 %106, double %multiply.853.39, double %105
  %108 = getelementptr double, ptr %arg5, i32 %linear_index
  %109 = getelementptr inbounds double, ptr %108, i32 0
  %110 = load double, ptr %109, align 8, !invariant.load !112
  %multiply.857.29 = fmul double %107, %110
  %multiply.864.15 = fmul double %98, %multiply.857.29
  %multiply.869.4 = fmul double %multiply.864.15, %multiply.864.15
  %constant_363_4 = load double, ptr @105, align 8
  %multiply.870.9 = fmul double %multiply.869.4, %constant_363_4
  %111 = getelementptr double, ptr %arg23, i32 %linear_index
  %112 = getelementptr inbounds double, ptr %111, i32 0
  %113 = load double, ptr %112, align 8, !invariant.load !112
  %add.343.3.clone.1 = fadd double %113, %107
  %114 = getelementptr double, ptr %arg22, i32 %linear_index
  %115 = getelementptr inbounds double, ptr %114, i32 0
  %116 = load double, ptr %115, align 8
  %multiply.858.1.clone.1 = fmul double %add.343.3.clone.1, %116
  %divide.395.5.clone.1 = fdiv double %constant_358_11, %multiply.858.1.clone.1
  %117 = getelementptr double, ptr %arg5, i32 %linear_index
  %118 = getelementptr inbounds double, ptr %117, i32 0
  %119 = load double, ptr %118, align 8, !invariant.load !112
  %subtract.78.1.clone.1 = fsub double %add.344.1.clone.1, %add.340.3.clone.1
  %multiply.859.2.clone.1 = fmul double %subtract.78.1.clone.1, %subtract.78.1.clone.1
  %multiply.860.1.clone.1 = fmul double %119, %multiply.859.2.clone.1
  %add.345.3.clone.1 = fadd double %divide.395.5.clone.1, %multiply.860.1.clone.1
  %constant_366_1_clone_1 = load double, ptr @102, align 8
  %add.346.1.clone.1 = fadd double %add.345.3.clone.1, %constant_366_1_clone_1
  %multiply.871.3 = fmul double %multiply.869.4, %add.346.1.clone.1
  %add.351.7 = fadd double %multiply.870.9, %multiply.871.3
  %multiply.872.11 = fmul double %98, %98
  %multiply.873.9 = fmul double %multiply.872.11, %constant_363_4
  %multiply.874.4 = fmul double %multiply.873.9, %multiply.857.29
  %multiply.875.3 = fmul double %multiply.874.4, %add.346.1.clone.1
  %subtract.79.5 = fsub double %add.351.7, %multiply.875.3
  %120 = getelementptr i64, ptr %arg2, i32 %linear_index
  %121 = getelementptr inbounds i64, ptr %120, i32 0
  %122 = load i64, ptr %121, align 8, !invariant.load !112
  %123 = sitofp i64 %122 to double
  %multiply.876.5 = fmul double %subtract.79.5, %123
  %add.352.3 = fadd double %divide.397.1.clone.1, %multiply.876.5
  %compare.270.5 = fcmp ogt double %add.352.3, %constant_359_1
  %124 = zext i1 %compare.270.5 to i8
  %125 = getelementptr double, ptr %arg1, i32 %linear_index
  %126 = getelementptr inbounds double, ptr %125, i32 0
  %127 = load double, ptr %126, align 8, !invariant.load !112
  %128 = trunc i8 %124 to i1
  %129 = select i1 %128, double %add.352.3, double %127
  %130 = trunc i8 %82 to i1
  %131 = select i1 %130, double %divide.399.3, double %129
  %132 = getelementptr double, ptr %arg0, i32 %linear_index
  %133 = getelementptr inbounds double, ptr %132, i32 0
  %134 = load double, ptr %133, align 8
  %135 = trunc i8 %74 to i1
  %136 = select i1 %135, double %131, double %134
  %137 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } undef, double %136, 0
  %138 = getelementptr double, ptr %arg11, i32 %linear_index
  %139 = getelementptr inbounds double, ptr %138, i32 0
  %140 = load double, ptr %139, align 8, !invariant.load !112
  %141 = getelementptr double, ptr %arg9, i32 %linear_index
  %142 = getelementptr inbounds double, ptr %141, i32 0
  %143 = load double, ptr %142, align 8
  %multiply.861.3.clone.1 = fmul double %140, %143
  %144 = getelementptr double, ptr %arg10, i32 %linear_index
  %145 = getelementptr inbounds double, ptr %144, i32 0
  %146 = load double, ptr %145, align 8, !invariant.load !112
  %multiply.862.5.clone.1 = fmul double %25, %146
  %add.347.3.clone.1 = fadd double %multiply.861.3.clone.1, %multiply.862.5.clone.1
  %multiply.865.2.clone.1 = fmul double %multiply.864.15, %add.346.1.clone.1
  %constant_361_2_clone_1 = load double, ptr @104, align 8
  %multiply.866.9.clone.1 = fmul double %divide.397.1.clone.1, %constant_361_2_clone_1
  %divide.398.5.clone.1 = fdiv double %constant_358_11, %multiply.866.9.clone.1
  %multiply.867.1.clone.1 = fmul double %multiply.865.2.clone.1, %divide.398.5.clone.1
  %multiply.868.3.clone.1 = fmul double %multiply.867.1.clone.1, %123
  %add.349.1.clone.1 = fadd double %add.347.3.clone.1, %multiply.868.3.clone.1
  %147 = getelementptr double, ptr %arg9, i32 %linear_index
  %148 = getelementptr inbounds double, ptr %147, i32 0
  %149 = load double, ptr %148, align 8
  %150 = trunc i8 %74 to i1
  %151 = select i1 %150, double %add.349.1.clone.1, double %149
  %152 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %137, double %151, 1
  %153 = getelementptr double, ptr %arg12, i32 %linear_index
  %154 = getelementptr inbounds double, ptr %153, i32 0
  %155 = load double, ptr %154, align 8
  %156 = trunc i8 %74 to i1
  %157 = select i1 %156, double %divide.397.1.clone.1, double %155
  %158 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %152, double %157, 2
  %multiply.877.1.clone.1 = fmul double %95, %divide.397.1.clone.1
  %159 = getelementptr double, ptr %arg13, i32 %linear_index
  %160 = getelementptr inbounds double, ptr %159, i32 0
  %161 = load double, ptr %160, align 8
  %162 = trunc i8 %74 to i1
  %163 = select i1 %162, double %multiply.877.1.clone.1, double %161
  %164 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %158, double %163, 3
  %165 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %164, double %divide.397.1.clone.1, 4
  %166 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %165, double %89, 5
  %167 = getelementptr double, ptr %arg16, i32 %linear_index
  %168 = getelementptr inbounds double, ptr %167, i32 0
  %169 = load double, ptr %168, align 8
  %170 = trunc i8 %74 to i1
  %171 = select i1 %170, double %divide.396.1.clone.1, double %169
  %172 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %166, double %171, 6
  %173 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %172, double %divide.396.1.clone.1, 7
  %174 = getelementptr double, ptr %arg17, i32 %linear_index
  %175 = getelementptr inbounds double, ptr %174, i32 0
  %176 = load double, ptr %175, align 8
  %177 = trunc i8 %74 to i1
  %178 = select i1 %177, double %add.347.3.clone.1, double %176
  %179 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %173, double %178, 8
  %180 = getelementptr double, ptr %arg18, i32 %linear_index
  %181 = getelementptr inbounds double, ptr %180, i32 0
  %182 = load double, ptr %181, align 8
  %183 = trunc i8 %74 to i1
  %184 = select i1 %183, double %add.346.1.clone.1, double %182
  %185 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %179, double %184, 9
  %186 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %185, double %add.346.1.clone.1, 10
  %187 = getelementptr double, ptr %arg21, i32 %linear_index
  %188 = getelementptr inbounds double, ptr %187, i32 0
  %189 = load double, ptr %188, align 8, !invariant.load !112
  %190 = trunc i8 %74 to i1
  %191 = select i1 %190, double %add.344.1.clone.1, double %189
  %192 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %186, double %191, 11
  %193 = getelementptr double, ptr %arg24, i32 %linear_index
  %194 = getelementptr inbounds double, ptr %193, i32 0
  %195 = load double, ptr %194, align 8
  %196 = trunc i8 %74 to i1
  %197 = select i1 %196, double %subtract.78.1.clone.1, double %195
  %198 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %192, double %197, 12
  %199 = getelementptr double, ptr %arg25, i32 %linear_index
  %200 = getelementptr inbounds double, ptr %199, i32 0
  %201 = load double, ptr %200, align 8, !invariant.load !112
  %202 = getelementptr double, ptr %arg26, i32 %linear_index
  %203 = getelementptr inbounds double, ptr %202, i32 0
  %204 = load double, ptr %203, align 8
  %205 = trunc i8 %74 to i1
  %206 = select i1 %205, double %201, double %204
  %207 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %198, double %206, 13
  %208 = getelementptr double, ptr %arg27, i32 %linear_index
  %209 = getelementptr inbounds double, ptr %208, i32 0
  %210 = load double, ptr %209, align 8
  %211 = trunc i8 %74 to i1
  %212 = select i1 %211, double %25, double %210
  %213 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %207, double %212, 14
  %214 = getelementptr double, ptr %arg28, i32 %linear_index
  %215 = getelementptr inbounds double, ptr %214, i32 0
  %216 = load double, ptr %215, align 8, !invariant.load !112
  %217 = getelementptr double, ptr %arg29, i32 %linear_index
  %218 = getelementptr inbounds double, ptr %217, i32 0
  %219 = load double, ptr %218, align 8
  %220 = trunc i8 %74 to i1
  %221 = select i1 %220, double %216, double %219
  %222 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %213, double %221, 15
  %223 = getelementptr double, ptr %arg30, i32 %linear_index
  %224 = getelementptr inbounds double, ptr %223, i32 0
  %225 = load double, ptr %224, align 8
  %226 = trunc i8 %74 to i1
  %227 = select i1 %226, double %54, double %225
  %228 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %222, double %227, 16
  %229 = getelementptr i32, ptr %arg32, i32 %linear_index
  %230 = getelementptr inbounds i32, ptr %229, i32 0
  %231 = load i32, ptr %230, align 4
  %232 = trunc i8 %74 to i1
  %233 = select i1 %232, i32 %64, i32 %231
  %234 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %228, i32 %233, 17
  %235 = getelementptr double, ptr %arg28, i32 %linear_index
  %236 = getelementptr inbounds double, ptr %235, i32 0
  %237 = load double, ptr %236, align 8, !invariant.load !112
  %238 = getelementptr double, ptr %arg34, i32 %linear_index
  %239 = getelementptr inbounds double, ptr %238, i32 0
  %240 = load double, ptr %239, align 8
  %241 = trunc i8 %74 to i1
  %242 = select i1 %241, double %237, double %240
  %243 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %234, double %242, 18
  %244 = getelementptr double, ptr %arg35, i32 %linear_index
  %245 = getelementptr inbounds double, ptr %244, i32 0
  %246 = load double, ptr %245, align 8
  %247 = trunc i8 %74 to i1
  %248 = select i1 %247, double %divide.394.5.clone.1, double %246
  %249 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %243, double %248, 19
  %250 = getelementptr double, ptr %arg36, i32 %linear_index
  %251 = getelementptr inbounds double, ptr %250, i32 0
  %252 = load double, ptr %251, align 8
  %253 = trunc i8 %74 to i1
  %254 = select i1 %253, double %add.340.3.clone.1, double %252
  %255 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %249, double %254, 20
  %256 = getelementptr double, ptr %arg5, i32 %linear_index
  %257 = getelementptr inbounds double, ptr %256, i32 0
  %258 = load double, ptr %257, align 8, !invariant.load !112
  %259 = getelementptr double, ptr %arg37, i32 %linear_index
  %260 = getelementptr inbounds double, ptr %259, i32 0
  %261 = load double, ptr %260, align 8
  %262 = trunc i8 %74 to i1
  %263 = select i1 %262, double %258, double %261
  %264 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %255, double %263, 21
  %265 = getelementptr double, ptr %arg22, i32 %linear_index
  %266 = getelementptr inbounds double, ptr %265, i32 0
  %267 = load double, ptr %266, align 8
  %268 = getelementptr double, ptr %arg38, i32 %linear_index
  %269 = getelementptr inbounds double, ptr %268, i32 0
  %270 = load double, ptr %269, align 8
  %271 = trunc i8 %74 to i1
  %272 = select i1 %271, double %267, double %270
  %273 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %264, double %272, 22
  %274 = getelementptr double, ptr %arg23, i32 %linear_index
  %275 = getelementptr inbounds double, ptr %274, i32 0
  %276 = load double, ptr %275, align 8, !invariant.load !112
  %277 = getelementptr double, ptr %arg39, i32 %linear_index
  %278 = getelementptr inbounds double, ptr %277, i32 0
  %279 = load double, ptr %278, align 8
  %280 = trunc i8 %74 to i1
  %281 = select i1 %280, double %276, double %279
  %282 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %273, double %281, 23
  %283 = getelementptr double, ptr %arg40, i32 %linear_index
  %284 = getelementptr inbounds double, ptr %283, i32 0
  %285 = load double, ptr %284, align 8
  %286 = trunc i8 %74 to i1
  %287 = select i1 %286, double %multiply.857.29, double %285
  %288 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %282, double %287, 24
  %289 = insertvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %288, double %add.344.1.clone.1, 25
  %290 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 0
  %291 = getelementptr double, ptr %arg0, i32 %linear_index
  %292 = getelementptr inbounds double, ptr %291, i32 0
  store double %290, ptr %292, align 8
  %293 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 1
  %294 = getelementptr double, ptr %arg9, i32 %linear_index
  %295 = getelementptr inbounds double, ptr %294, i32 0
  store double %293, ptr %295, align 8
  %296 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 2
  %297 = getelementptr double, ptr %arg12, i32 %linear_index
  %298 = getelementptr inbounds double, ptr %297, i32 0
  store double %296, ptr %298, align 8
  %299 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 3
  %300 = getelementptr double, ptr %arg13, i32 %linear_index
  %301 = getelementptr inbounds double, ptr %300, i32 0
  store double %299, ptr %301, align 8
  %302 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 4
  %303 = getelementptr double, ptr %arg42, i32 %linear_index
  %304 = getelementptr inbounds double, ptr %303, i32 0
  store double %302, ptr %304, align 8
  %305 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 5
  %306 = getelementptr double, ptr %arg43, i32 %linear_index
  %307 = getelementptr inbounds double, ptr %306, i32 0
  store double %305, ptr %307, align 8
  %308 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 6
  %309 = getelementptr double, ptr %arg16, i32 %linear_index
  %310 = getelementptr inbounds double, ptr %309, i32 0
  store double %308, ptr %310, align 8
  %311 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 7
  %312 = getelementptr double, ptr %arg44, i32 %linear_index
  %313 = getelementptr inbounds double, ptr %312, i32 0
  store double %311, ptr %313, align 8
  %314 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 8
  %315 = getelementptr double, ptr %arg17, i32 %linear_index
  %316 = getelementptr inbounds double, ptr %315, i32 0
  store double %314, ptr %316, align 8
  %317 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 9
  %318 = getelementptr double, ptr %arg18, i32 %linear_index
  %319 = getelementptr inbounds double, ptr %318, i32 0
  store double %317, ptr %319, align 8
  %320 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 10
  %321 = getelementptr double, ptr %arg22, i32 %linear_index
  %322 = getelementptr inbounds double, ptr %321, i32 0
  store double %320, ptr %322, align 8
  %323 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 11
  %324 = getelementptr double, ptr %arg45, i32 %linear_index
  %325 = getelementptr inbounds double, ptr %324, i32 0
  store double %323, ptr %325, align 8
  %326 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 12
  %327 = getelementptr double, ptr %arg24, i32 %linear_index
  %328 = getelementptr inbounds double, ptr %327, i32 0
  store double %326, ptr %328, align 8
  %329 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 13
  %330 = getelementptr double, ptr %arg26, i32 %linear_index
  %331 = getelementptr inbounds double, ptr %330, i32 0
  store double %329, ptr %331, align 8
  %332 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 14
  %333 = getelementptr double, ptr %arg27, i32 %linear_index
  %334 = getelementptr inbounds double, ptr %333, i32 0
  store double %332, ptr %334, align 8
  %335 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 15
  %336 = getelementptr double, ptr %arg29, i32 %linear_index
  %337 = getelementptr inbounds double, ptr %336, i32 0
  store double %335, ptr %337, align 8
  %338 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 16
  %339 = getelementptr double, ptr %arg30, i32 %linear_index
  %340 = getelementptr inbounds double, ptr %339, i32 0
  store double %338, ptr %340, align 8
  %341 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 17
  %342 = getelementptr i32, ptr %arg32, i32 %linear_index
  %343 = getelementptr inbounds i32, ptr %342, i32 0
  store i32 %341, ptr %343, align 4
  %344 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 18
  %345 = getelementptr double, ptr %arg34, i32 %linear_index
  %346 = getelementptr inbounds double, ptr %345, i32 0
  store double %344, ptr %346, align 8
  %347 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 19
  %348 = getelementptr double, ptr %arg35, i32 %linear_index
  %349 = getelementptr inbounds double, ptr %348, i32 0
  store double %347, ptr %349, align 8
  %350 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 20
  %351 = getelementptr double, ptr %arg36, i32 %linear_index
  %352 = getelementptr inbounds double, ptr %351, i32 0
  store double %350, ptr %352, align 8
  %353 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 21
  %354 = getelementptr double, ptr %arg37, i32 %linear_index
  %355 = getelementptr inbounds double, ptr %354, i32 0
  store double %353, ptr %355, align 8
  %356 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 22
  %357 = getelementptr double, ptr %arg38, i32 %linear_index
  %358 = getelementptr inbounds double, ptr %357, i32 0
  store double %356, ptr %358, align 8
  %359 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 23
  %360 = getelementptr double, ptr %arg39, i32 %linear_index
  %361 = getelementptr inbounds double, ptr %360, i32 0
  store double %359, ptr %361, align 8
  %362 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 24
  %363 = getelementptr double, ptr %arg40, i32 %linear_index
  %364 = getelementptr inbounds double, ptr %363, i32 0
  store double %362, ptr %364, align 8
  %365 = extractvalue { double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, double, double } %289, 25
  %366 = getelementptr double, ptr %arg46, i32 %linear_index
  %367 = getelementptr inbounds double, ptr %366, i32 0
  store double %365, ptr %367, align 8
  br label %loop_add_divide_exponential_select_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #0

define void @loop_dynamic_update_slice_fusion_2(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 16 dereferenceable(160) %arg6, ptr noalias align 128 dereferenceable(160) %arg7, ptr noalias align 16 dereferenceable(1536) %arg8, ptr noalias align 16 dereferenceable(160) %arg9) {
entry:
  %param_1.731 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_17 = load i64, ptr @109, align 8
  %0 = icmp slt i64 %param_1.731, %constant_357_17
  %1 = zext i1 %0 to i8
  %param_1.7311 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_62 = load i64, ptr @108, align 8
  %2 = add i64 %param_1.7311, %constant_356_62
  %param_1.7312 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.7312
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_173 = load i64, ptr @109, align 8
  %9 = icmp sge i64 0, %constant_357_173
  %10 = select i1 %9, i64 0, i64 %constant_357_173
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.916.1.in_bounds-true, label %dynamic-update-slice.916.1.in_bounds-after

dynamic-update-slice.916.1.in_bounds-after:       ; preds = %dynamic-update-slice.916.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.916.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.634 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.6344 = load double, ptr %param_2.634, align 8, !invariant.load !112
  %23 = getelementptr double, ptr %arg9, i64 %linear_index
  %param_9.116 = getelementptr inbounds double, ptr %23, i64 0
  %param_9.1165 = load double, ptr %param_9.116, align 8, !invariant.load !112
  %param_1.7316 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_177 = load i64, ptr @109, align 8
  %24 = icmp slt i64 %param_1.7316, %constant_357_177
  %25 = zext i1 %24 to i8
  %param_1.7318 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_629 = load i64, ptr @108, align 8
  %26 = add i64 %param_1.7318, %constant_356_629
  %param_1.73110 = load i64, ptr %arg1, align 8, !invariant.load !112
  %27 = trunc i8 %25 to i1
  %28 = select i1 %27, i64 %26, i64 %param_1.73110
  %29 = icmp sge i64 0, %28
  %30 = select i1 %29, i64 0, i64 %28
  %31 = icmp sle i64 191, %30
  %dynamic-slice.39.65.start_idx0 = select i1 %31, i64 191, i64 %30
  %32 = add i64 %dynamic-slice.39.65.start_idx0, 0
  %param_8.156 = getelementptr inbounds [192 x double], ptr %arg8, i64 0, i64 %32
  %param_8.15611 = load double, ptr %param_8.156, align 8, !invariant.load !112
  %33 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.215 = getelementptr inbounds double, ptr %33, i64 0
  %param_7.21512 = load double, ptr %param_7.215, align 8, !invariant.load !112
  %multiply.853.27 = fmul double %param_8.15611, %param_7.21512
  %constant_359_4 = load double, ptr @107, align 8
  %compare.265.31 = fcmp ogt double %multiply.853.27, %constant_359_4
  %34 = zext i1 %compare.265.31 to i8
  %35 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.286 = getelementptr inbounds double, ptr %35, i64 0
  %param_6.28613 = load double, ptr %param_6.286, align 8, !invariant.load !112
  %36 = trunc i8 %34 to i1
  %37 = select i1 %36, double %multiply.853.27, double %param_6.28613
  %38 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.391 = getelementptr inbounds double, ptr %38, i64 0
  %param_5.39114 = load double, ptr %param_5.391, align 8, !invariant.load !112
  %multiply.857.17 = fmul double %37, %param_5.39114
  %multiply.864.3 = fmul double %param_9.1165, %multiply.857.17
  %multiply.869.6 = fmul double %multiply.864.3, %multiply.864.3
  %constant_363_2 = load double, ptr @110, align 8
  %multiply.870.11 = fmul double %multiply.869.6, %constant_363_2
  %39 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.521 = getelementptr inbounds double, ptr %39, i64 0
  %param_4.52115 = load double, ptr %param_4.521, align 8, !invariant.load !112
  %multiply.871.5 = fmul double %multiply.869.6, %param_4.52115
  %add.351.9 = fadd double %multiply.870.11, %multiply.871.5
  %multiply.872.13 = fmul double %param_9.1165, %param_9.1165
  %multiply.873.11 = fmul double %multiply.872.13, %constant_363_2
  %multiply.874.6 = fmul double %multiply.873.11, %multiply.857.17
  %40 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.52116 = getelementptr inbounds double, ptr %40, i64 0
  %param_4.52117 = load double, ptr %param_4.52116, align 8, !invariant.load !112
  %multiply.875.5 = fmul double %multiply.874.6, %param_4.52117
  %subtract.79.7 = fsub double %add.351.9, %multiply.875.5
  %41 = getelementptr i64, ptr %arg3, i64 %linear_index
  %param_3.609 = getelementptr inbounds i64, ptr %41, i64 0
  %param_3.60918 = load i64, ptr %param_3.609, align 8, !invariant.load !112
  %42 = sitofp i64 %param_3.60918 to double
  %multiply.876.7 = fmul double %subtract.79.7, %42
  %add.352.5 = fadd double %param_2.6344, %multiply.876.7
  %compare.270.3 = fcmp ogt double %add.352.5, %constant_359_4
  %43 = zext i1 %compare.270.3 to i8
  %44 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %43, ptr %44, align 1
  br label %dynamic-update-slice.916.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %param_1.666 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_7 = load i64, ptr @113, align 8
  %0 = icmp slt i64 %param_1.666, %constant_357_7
  %1 = zext i1 %0 to i8
  %param_1.6661 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_14 = load i64, ptr @112, align 8
  %2 = add i64 %param_1.6661, %constant_356_14
  %param_1.6662 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6662
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_73 = load i64, ptr @113, align 8
  %9 = icmp sge i64 0, %constant_357_73
  %10 = select i1 %9, i64 0, i64 %constant_357_73
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %constant_357_74 = load i64, ptr @113, align 8
  %13 = icmp sge i64 0, %constant_357_74
  %14 = select i1 %13, i64 0, i64 %constant_357_74
  %15 = icmp sle i64 0, %14
  %16 = select i1 %15, i64 0, i64 %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %17 to i64
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %18 to i64
  %19 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %19, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %20 = udiv i64 %linear_index0, 1
  %21 = urem i64 %20, 1
  %22 = udiv i64 %linear_index0, 1
  %23 = urem i64 %22, 20
  %24 = udiv i64 %linear_index0, 20
  %25 = icmp ult i64 %linear_index, 20
  br i1 %25, label %dynamic-update-slice.918.1.in_bounds-true, label %dynamic-update-slice.918.1.in_bounds-after

dynamic-update-slice.918.1.in_bounds-after:       ; preds = %dynamic-update-slice.918.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.918.1.in_bounds-true:        ; preds = %entry
  %26 = add i64 %8, %24
  %27 = add i64 %12, %23
  %28 = add i64 %16, %21
  %29 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.665 = getelementptr inbounds double, ptr %29, i64 0
  %param_2.6655 = load double, ptr %param_2.665, align 8, !invariant.load !112
  %30 = call double @llvm.fabs.f64(double %param_2.6655)
  %31 = fcmp one double %30, 0x7FF0000000000000
  %32 = zext i1 %31 to i8
  %33 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6656 = getelementptr inbounds double, ptr %33, i64 0
  %param_2.6657 = load double, ptr %param_2.6656, align 8, !invariant.load !112
  %34 = call double @llvm.fabs.f64(double %param_2.6657)
  %constant_365_23 = load double, ptr @111, align 8
  %compare.266.47 = fcmp olt double %34, %constant_365_23
  %35 = zext i1 %compare.266.47 to i8
  %36 = and i8 %32, %35
  %37 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr %arg0, i64 0, i64 %26, i64 %27, i64 0
  store i8 %36, ptr %37, align 1
  br label %dynamic-update-slice.918.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_1(ptr noalias align 128 dereferenceable(3840) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %param_1.671 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_13 = load i64, ptr @116, align 8
  %0 = icmp slt i64 %param_1.671, %constant_357_13
  %1 = zext i1 %0 to i8
  %param_1.6711 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_60 = load i64, ptr @115, align 8
  %2 = add i64 %param_1.6711, %constant_356_60
  %param_1.6712 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6712
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_133 = load i64, ptr @116, align 8
  %9 = icmp sge i64 0, %constant_357_133
  %10 = select i1 %9, i64 0, i64 %constant_357_133
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.917.1.in_bounds-true, label %dynamic-update-slice.917.1.in_bounds-after

dynamic-update-slice.917.1.in_bounds-after:       ; preds = %dynamic-update-slice.917.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.917.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.652 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.6524 = load double, ptr %param_2.652, align 8, !invariant.load !112
  %23 = call double @llvm.fabs.f64(double %param_2.6524)
  %24 = fcmp one double %23, 0x7FF0000000000000
  %25 = zext i1 %24 to i8
  %26 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.6525 = getelementptr inbounds double, ptr %26, i64 0
  %param_2.6526 = load double, ptr %param_2.6525, align 8, !invariant.load !112
  %27 = call double @llvm.fabs.f64(double %param_2.6526)
  %constant_365_1 = load double, ptr @114, align 8
  %compare.266.49 = fcmp olt double %27, %constant_365_1
  %28 = zext i1 %compare.266.49 to i8
  %29 = and i8 %25, %28
  %30 = getelementptr inbounds [192 x [20 x i8]], ptr %arg0, i64 0, i64 %20, i64 %21
  store i8 %29, ptr %30, align 1
  br label %dynamic-update-slice.917.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_16(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(160) %arg5, ptr noalias align 16 dereferenceable(1536) %arg6, ptr noalias align 16 dereferenceable(160) %arg7) {
entry:
  %param_2.560 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_3 = load i64, ptr @118, align 8
  %0 = icmp slt i64 %param_2.560, %constant_357_3
  %1 = zext i1 %0 to i8
  %param_2.5601 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_54 = load i64, ptr @117, align 8
  %2 = add i64 %param_2.5601, %constant_356_54
  %param_2.5602 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.5602
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_33 = load i64, ptr @118, align 8
  %9 = icmp sge i64 0, %constant_357_33
  %10 = select i1 %9, i64 0, i64 %constant_357_33
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.901.1.in_bounds-true, label %dynamic-update-slice.901.1.in_bounds-after

dynamic-update-slice.901.1.in_bounds-after:       ; preds = %dynamic-update-slice.901.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.901.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg7, i64 %linear_index
  %param_7.219 = getelementptr inbounds double, ptr %22, i64 0
  %param_7.2194 = load double, ptr %param_7.219, align 8, !invariant.load !112
  %param_2.5605 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_36 = load i64, ptr @118, align 8
  %23 = icmp slt i64 %param_2.5605, %constant_357_36
  %24 = zext i1 %23 to i8
  %param_2.5607 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_548 = load i64, ptr @117, align 8
  %25 = add i64 %param_2.5607, %constant_356_548
  %param_2.5609 = load i64, ptr %arg2, align 8, !invariant.load !112
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_2.5609
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.75.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.75.start_idx0, 0
  %param_6.290 = getelementptr inbounds [192 x double], ptr %arg6, i64 0, i64 %31
  %param_6.29010 = load double, ptr %param_6.290, align 8, !invariant.load !112
  %32 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.395 = getelementptr inbounds double, ptr %32, i64 0
  %param_5.39511 = load double, ptr %param_5.395, align 8, !invariant.load !112
  %multiply.853.37 = fmul double %param_6.29010, %param_5.39511
  %constant_359_14 = load double, ptr @119, align 8
  %compare.265.41 = fcmp ogt double %multiply.853.37, %constant_359_14
  %33 = zext i1 %compare.265.41 to i8
  %34 = getelementptr double, ptr %arg4, i64 %linear_index
  %param_4.483 = getelementptr inbounds double, ptr %34, i64 0
  %param_4.48312 = load double, ptr %param_4.483, align 8, !invariant.load !112
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, double %multiply.853.37, double %param_4.48312
  %37 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.558 = getelementptr inbounds double, ptr %37, i64 0
  %param_3.55813 = load double, ptr %param_3.558, align 8, !invariant.load !112
  %multiply.857.27 = fmul double %36, %param_3.55813
  %multiply.864.13 = fmul double %param_7.2194, %multiply.857.27
  %38 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.662 = getelementptr inbounds double, ptr %38, i64 0
  %param_1.66214 = load double, ptr %param_1.662, align 8, !invariant.load !112
  %multiply.865.1 = fmul double %multiply.864.13, %param_1.66214
  %39 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.865.1, ptr %39, align 8
  br label %dynamic-update-slice.901.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_10(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4) {
entry:
  %param_2.619 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_10 = load i64, ptr @121, align 8
  %0 = icmp slt i64 %param_2.619, %constant_357_10
  %1 = zext i1 %0 to i8
  %param_2.6191 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_63 = load i64, ptr @120, align 8
  %2 = add i64 %param_2.6191, %constant_356_63
  %param_2.6192 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6192
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_103 = load i64, ptr @121, align 8
  %9 = icmp sge i64 0, %constant_357_103
  %10 = select i1 %9, i64 0, i64 %constant_357_103
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.908.1.in_bounds-true, label %dynamic-update-slice.908.1.in_bounds-after

dynamic-update-slice.908.1.in_bounds-after:       ; preds = %dynamic-update-slice.908.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.908.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_1 = load double, ptr @122, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.719 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7194 = load double, ptr %param_1.719, align 8, !invariant.load !112
  %param_2.6195 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_106 = load i64, ptr @121, align 8
  %23 = icmp slt i64 %param_2.6195, %constant_357_106
  %24 = zext i1 %23 to i8
  %param_2.6197 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_638 = load i64, ptr @120, align 8
  %25 = add i64 %param_2.6197, %constant_356_638
  %param_2.6199 = load i64, ptr %arg2, align 8, !invariant.load !112
  %26 = trunc i8 %24 to i1
  %27 = select i1 %26, i64 %25, i64 %param_2.6199
  %28 = icmp sge i64 0, %27
  %29 = select i1 %28, i64 0, i64 %27
  %30 = icmp sle i64 191, %29
  %dynamic-slice.39.23.start_idx0 = select i1 %30, i64 191, i64 %29
  %31 = add i64 %dynamic-slice.39.23.start_idx0, 0
  %param_4.510 = getelementptr inbounds [192 x double], ptr %arg4, i64 0, i64 %31
  %param_4.51010 = load double, ptr %param_4.510, align 8, !invariant.load !112
  %32 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.597 = getelementptr inbounds double, ptr %32, i64 0
  %param_3.59711 = load double, ptr %param_3.597, align 8, !invariant.load !112
  %multiply.863.13 = fmul double %param_4.51010, %param_3.59711
  %add.350.1 = fadd double %param_1.7194, %multiply.863.13
  %multiply.886.1 = fmul double %add.350.1, %add.350.1
  %divide.407.1 = fdiv double %constant_358_1, %multiply.886.1
  %33 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.407.1, ptr %33, align 8
  br label %dynamic-update-slice.908.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_15(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(8) %arg2) {
entry:
  %param_2.644 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_357_35 = load i64, ptr @126, align 8
  %0 = icmp slt i64 %param_2.644, %constant_357_35
  %1 = zext i1 %0 to i8
  %param_2.6441 = load i64, ptr %arg2, align 8, !invariant.load !112
  %constant_356_55 = load i64, ptr @125, align 8
  %2 = add i64 %param_2.6441, %constant_356_55
  %param_2.6442 = load i64, ptr %arg2, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_2.6442
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_353 = load i64, ptr @126, align 8
  %9 = icmp sge i64 0, %constant_357_353
  %10 = select i1 %9, i64 0, i64 %constant_357_353
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.902.1.in_bounds-true, label %dynamic-update-slice.902.1.in_bounds-after

dynamic-update-slice.902.1.in_bounds-after:       ; preds = %dynamic-update-slice.902.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.902.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_3 = load double, ptr @124, align 8
  %22 = getelementptr double, ptr %arg1, i64 %linear_index
  %param_1.721 = getelementptr inbounds double, ptr %22, i64 0
  %param_1.7214 = load double, ptr %param_1.721, align 8, !invariant.load !112
  %constant_361_5 = load double, ptr @123, align 8
  %multiply.866.3 = fmul double %param_1.7214, %constant_361_5
  %multiply.885.1 = fmul double %multiply.866.3, %multiply.866.3
  %divide.406.1 = fdiv double %constant_358_3, %multiply.885.1
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.406.1, ptr %23, align 8
  br label %dynamic-update-slice.902.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_17(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2) {
entry:
  %param_1.667 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_9 = load i64, ptr @130, align 8
  %0 = icmp slt i64 %param_1.667, %constant_357_9
  %1 = zext i1 %0 to i8
  %param_1.6671 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_53 = load i64, ptr @129, align 8
  %2 = add i64 %param_1.6671, %constant_356_53
  %param_1.6672 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.6672
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_93 = load i64, ptr @130, align 8
  %9 = icmp sge i64 0, %constant_357_93
  %10 = select i1 %9, i64 0, i64 %constant_357_93
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.900.1.in_bounds-true, label %dynamic-update-slice.900.1.in_bounds-after

dynamic-update-slice.900.1.in_bounds-after:       ; preds = %dynamic-update-slice.900.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.900.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %constant_358_19 = load double, ptr @128, align 8
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.565 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.5654 = load double, ptr %param_2.565, align 8, !invariant.load !112
  %constant_361_6 = load double, ptr @127, align 8
  %multiply.866.7 = fmul double %param_2.5654, %constant_361_6
  %divide.398.3 = fdiv double %constant_358_19, %multiply.866.7
  %23 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %divide.398.3, ptr %23, align 8
  br label %dynamic-update-slice.900.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_22(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4, ptr noalias align 16 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %param_1.736 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_58 = load i64, ptr @133, align 8
  %0 = icmp slt i64 %param_1.736, %constant_357_58
  %1 = zext i1 %0 to i8
  %param_1.7361 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_48 = load i64, ptr @132, align 8
  %2 = add i64 %param_1.7361, %constant_356_48
  %param_1.7362 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.7362
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_583 = load i64, ptr @133, align 8
  %9 = icmp sge i64 0, %constant_357_583
  %10 = select i1 %9, i64 0, i64 %constant_357_583
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.895.1.in_bounds-true, label %dynamic-update-slice.895.1.in_bounds-after

dynamic-update-slice.895.1.in_bounds-after:       ; preds = %dynamic-update-slice.895.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.895.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.642 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.6424 = load double, ptr %param_2.642, align 8, !invariant.load !112
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.401 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.4015 = load double, ptr %param_5.401, align 8, !invariant.load !112
  %24 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.295 = getelementptr inbounds double, ptr %24, i64 0
  %param_6.2956 = load double, ptr %param_6.295, align 8, !invariant.load !112
  %multiply.848.15 = fmul double %param_5.4015, %param_6.2956
  %param_1.7367 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_588 = load i64, ptr @133, align 8
  %25 = icmp slt i64 %param_1.7367, %constant_357_588
  %26 = zext i1 %25 to i8
  %param_1.7369 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_4810 = load i64, ptr @132, align 8
  %27 = add i64 %param_1.7369, %constant_356_4810
  %param_1.73611 = load i64, ptr %arg1, align 8, !invariant.load !112
  %28 = trunc i8 %26 to i1
  %29 = select i1 %28, i64 %27, i64 %param_1.73611
  %30 = icmp sge i64 0, %29
  %31 = select i1 %30, i64 0, i64 %29
  %32 = icmp sle i64 191, %31
  %dynamic-slice.39.63.start_idx0 = select i1 %32, i64 191, i64 %31
  %33 = add i64 %dynamic-slice.39.63.start_idx0, 0
  %param_4.531 = getelementptr inbounds [192 x double], ptr %arg4, i64 0, i64 %33
  %param_4.53112 = load double, ptr %param_4.531, align 8, !invariant.load !112
  %34 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.618 = getelementptr inbounds double, ptr %34, i64 0
  %param_3.61813 = load double, ptr %param_3.618, align 8, !invariant.load !112
  %multiply.849.17 = fmul double %param_4.53112, %param_3.61813
  %add.340.15 = fadd double %multiply.848.15, %multiply.849.17
  %subtract.78.3 = fsub double %param_2.6424, %add.340.15
  %constant_361_3 = load double, ptr @131, align 8
  %multiply.884.3 = fmul double %subtract.78.3, %constant_361_3
  %35 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.884.3, ptr %35, align 8
  br label %dynamic-update-slice.895.1.in_bounds-after
}

define void @loop_dynamic_update_slice_fusion_23(ptr noalias align 128 dereferenceable(30720) %arg0, ptr noalias align 128 dereferenceable(8) %arg1, ptr noalias align 128 dereferenceable(160) %arg2, ptr noalias align 16 dereferenceable(160) %arg3, ptr noalias align 16 dereferenceable(1536) %arg4, ptr noalias align 16 dereferenceable(160) %arg5, ptr noalias align 128 dereferenceable(160) %arg6) {
entry:
  %param_1.709 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_51 = load i64, ptr @135, align 8
  %0 = icmp slt i64 %param_1.709, %constant_357_51
  %1 = zext i1 %0 to i8
  %param_1.7091 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_47 = load i64, ptr @134, align 8
  %2 = add i64 %param_1.7091, %constant_356_47
  %param_1.7092 = load i64, ptr %arg1, align 8, !invariant.load !112
  %3 = trunc i8 %1 to i1
  %4 = select i1 %3, i64 %2, i64 %param_1.7092
  %5 = icmp sge i64 0, %4
  %6 = select i1 %5, i64 0, i64 %4
  %7 = icmp sle i64 191, %6
  %8 = select i1 %7, i64 191, i64 %6
  %constant_357_513 = load i64, ptr @135, align 8
  %9 = icmp sge i64 0, %constant_357_513
  %10 = select i1 %9, i64 0, i64 %constant_357_513
  %11 = icmp sle i64 0, %10
  %12 = select i1 %11, i64 0, i64 %10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %block_id = zext i32 %13 to i64
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !115
  %thread_id_x = zext i32 %14 to i64
  %15 = mul nuw nsw i64 %block_id, 20
  %linear_index = add nuw nsw i64 %15, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 20
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %16 = udiv i64 %linear_index0, 1
  %17 = urem i64 %16, 20
  %18 = udiv i64 %linear_index0, 20
  %19 = icmp ult i64 %linear_index, 20
  br i1 %19, label %dynamic-update-slice.894.1.in_bounds-true, label %dynamic-update-slice.894.1.in_bounds-after

dynamic-update-slice.894.1.in_bounds-after:       ; preds = %dynamic-update-slice.894.1.in_bounds-true, %entry
  ret void

dynamic-update-slice.894.1.in_bounds-true:        ; preds = %entry
  %20 = add i64 %8, %18
  %21 = add i64 %12, %17
  %22 = getelementptr double, ptr %arg2, i64 %linear_index
  %param_2.607 = getelementptr inbounds double, ptr %22, i64 0
  %param_2.6074 = load double, ptr %param_2.607, align 8, !invariant.load !112
  %23 = getelementptr double, ptr %arg5, i64 %linear_index
  %param_5.378 = getelementptr inbounds double, ptr %23, i64 0
  %param_5.3785 = load double, ptr %param_5.378, align 8, !invariant.load !112
  %24 = getelementptr double, ptr %arg6, i64 %linear_index
  %param_6.274 = getelementptr inbounds double, ptr %24, i64 0
  %param_6.2746 = load double, ptr %param_6.274, align 8, !invariant.load !112
  %multiply.848.9 = fmul double %param_5.3785, %param_6.2746
  %param_1.7097 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_357_518 = load i64, ptr @135, align 8
  %25 = icmp slt i64 %param_1.7097, %constant_357_518
  %26 = zext i1 %25 to i8
  %param_1.7099 = load i64, ptr %arg1, align 8, !invariant.load !112
  %constant_356_4710 = load i64, ptr @134, align 8
  %27 = add i64 %param_1.7099, %constant_356_4710
  %param_1.70911 = load i64, ptr %arg1, align 8, !invariant.load !112
  %28 = trunc i8 %26 to i1
  %29 = select i1 %28, i64 %27, i64 %param_1.70911
  %30 = icmp sge i64 0, %29
  %31 = select i1 %30, i64 0, i64 %29
  %32 = icmp sle i64 191, %31
  %dynamic-slice.39.57.start_idx0 = select i1 %32, i64 191, i64 %31
  %33 = add i64 %dynamic-slice.39.57.start_idx0, 0
  %param_4.501 = getelementptr inbounds [192 x double], ptr %arg4, i64 0, i64 %33
  %param_4.50112 = load double, ptr %param_4.501, align 8, !invariant.load !112
  %34 = getelementptr double, ptr %arg3, i64 %linear_index
  %param_3.588 = getelementptr inbounds double, ptr %34, i64 0
  %param_3.58813 = load double, ptr %param_3.588, align 8, !invariant.load !112
  %multiply.849.11 = fmul double %param_4.50112, %param_3.58813
  %add.340.9 = fadd double %multiply.848.9, %multiply.849.11
  %subtract.78.4 = fsub double %param_2.6074, %add.340.9
  %multiply.859.1 = fmul double %subtract.78.4, %subtract.78.4
  %35 = getelementptr inbounds [192 x [20 x double]], ptr %arg0, i64 0, i64 %20, i64 %21
  store double %multiply.859.1, ptr %35, align 8
  br label %dynamic-update-slice.894.1.in_bounds-after
}

define void @loop_add_fusion(ptr noalias align 128 dereferenceable(8) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !114
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
  %constant_353_1 = load i64, ptr @136, align 8
  %5 = add i64 %4, %constant_353_1
  store i64 %5, ptr %arg0, align 8
  br label %loop_add_fusion.in_bounds-after
}

define void @copy_fusion_5(ptr noalias align 16 dereferenceable(160) %arg0, ptr noalias align 16 dereferenceable(160) %arg1, ptr noalias align 128 dereferenceable(1536) %arg2, ptr noalias align 128 dereferenceable(160) %arg3, ptr noalias align 128 dereferenceable(160) %arg4, ptr noalias align 128 dereferenceable(1536) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !116
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !111
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i32 %linear_index, 0
  %3 = udiv i32 %linear_index0, 1
  %4 = icmp ult i32 %linear_index, 232
  br i1 %4, label %copy_fusion.5.in_bounds-true, label %copy_fusion.5.in_bounds-after

copy_fusion.5.in_bounds-after:                    ; preds = %slice2-after, %entry
  ret void

copy_fusion.5.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.20.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = getelementptr inbounds [20 x [1 x double]], ptr %arg0, i32 0, i32 %6, i32 0
  %8 = load double, ptr %7, align 8, !invariant.load !112
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.20.1
  %9 = phi i32 [ 20, %concatenate.pivot.20.1 ]
  %10 = sub nsw i32 %3, %9
  %11 = getelementptr inbounds [20 x [1 x double]], ptr %arg1, i32 0, i32 %10, i32 0
  %12 = load double, ptr %11, align 8, !invariant.load !112
  br label %concatenate.3.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.40.2
  %13 = phi i32 [ 40, %concatenate.pivot.40.2 ]
  %14 = sub nsw i32 %3, %13
  %15 = getelementptr inbounds [192 x double], ptr %arg2, i32 0, i32 %14
  %16 = load double, ptr %15, align 8, !invariant.load !112
  br label %concatenate.3.merge

concatenate.pivot.20.:                            ; preds = %copy_fusion.5.in_bounds-true
  %17 = icmp ult i32 %3, 20
  br i1 %17, label %concatenate.pivot.0., label %concatenate.pivot.40.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.20.
  br label %concat_index_from_operand_id0

concatenate.pivot.40.:                            ; preds = %concatenate.pivot.20.
  %18 = icmp ult i32 %3, 40
  br i1 %18, label %concatenate.pivot.20.1, label %concatenate.pivot.40.2

concatenate.pivot.20.1:                           ; preds = %concatenate.pivot.40.
  br label %concat_index_from_operand_id1

concatenate.pivot.40.2:                           ; preds = %concatenate.pivot.40.
  br label %concat_index_from_operand_id2

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %19 = phi double [ %8, %concat_index_from_operand_id0 ], [ %12, %concat_index_from_operand_id1 ], [ %16, %concat_index_from_operand_id2 ]
  %20 = icmp sge i32 %3, 0
  %21 = icmp slt i32 %3, 20
  %22 = and i1 %20, %21
  br i1 %22, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.3.merge
  %23 = icmp sge i32 %3, 20
  %24 = icmp slt i32 %3, 40
  %25 = and i1 %23, %24
  br i1 %25, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %26 = icmp sge i32 %3, 40
  %27 = icmp slt i32 %3, 232
  %28 = and i1 %26, %27
  br i1 %28, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  br label %copy_fusion.5.in_bounds-after

slice0-true:                                      ; preds = %concatenate.3.merge
  %29 = sub i32 %3, 0
  %30 = getelementptr inbounds [20 x double], ptr %arg3, i32 0, i32 %29
  store double %19, ptr %30, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %31 = sub i32 %3, 20
  %32 = getelementptr inbounds [20 x double], ptr %arg4, i32 0, i32 %31
  store double %19, ptr %32, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %33 = sub i32 %3, 40
  %34 = getelementptr inbounds [192 x double], ptr %arg5, i32 0, i32 %33
  store double %19, ptr %34, align 8
  br label %slice2-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109}

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
!14 = !{ptr @loop_dynamic_update_slice_fusion_59, !"kernel", i32 1}
!15 = !{ptr @loop_dynamic_update_slice_fusion_59, !"reqntidx", i32 1}
!16 = !{ptr @loop_divide_exponential_multiply_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_divide_exponential_multiply_fusion, !"reqntidx", i32 20}
!18 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 20}
!20 = !{ptr @loop_divide_exponential_fusion, !"kernel", i32 1}
!21 = !{ptr @loop_divide_exponential_fusion, !"reqntidx", i32 20}
!22 = !{ptr @wrapped_convert, !"kernel", i32 1}
!23 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!24 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!25 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 20}
!26 = !{ptr @loop_compare_multiply_select_fusion, !"kernel", i32 1}
!27 = !{ptr @loop_compare_multiply_select_fusion, !"reqntidx", i32 20}
!28 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!29 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 1}
!30 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!31 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 1}
!32 = !{ptr @loop_dynamic_update_slice_fusion_30, !"kernel", i32 1}
!33 = !{ptr @loop_dynamic_update_slice_fusion_30, !"reqntidx", i32 20}
!34 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!35 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 20}
!36 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!37 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 20}
!38 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!39 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 20}
!40 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!41 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 20}
!42 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!43 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 20}
!44 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!45 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 20}
!46 = !{ptr @loop_dynamic_update_slice_fusion_35, !"kernel", i32 1}
!47 = !{ptr @loop_dynamic_update_slice_fusion_35, !"reqntidx", i32 20}
!48 = !{ptr @loop_dynamic_update_slice_fusion_26, !"kernel", i32 1}
!49 = !{ptr @loop_dynamic_update_slice_fusion_26, !"reqntidx", i32 20}
!50 = !{ptr @loop_dynamic_update_slice_fusion_24, !"kernel", i32 1}
!51 = !{ptr @loop_dynamic_update_slice_fusion_24, !"reqntidx", i32 20}
!52 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!53 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 20}
!54 = !{ptr @loop_dynamic_update_slice_fusion_40, !"kernel", i32 1}
!55 = !{ptr @loop_dynamic_update_slice_fusion_40, !"reqntidx", i32 20}
!56 = !{ptr @loop_dynamic_update_slice_fusion_25, !"kernel", i32 1}
!57 = !{ptr @loop_dynamic_update_slice_fusion_25, !"reqntidx", i32 20}
!58 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!59 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 20}
!60 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!61 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 20}
!62 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!63 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 20}
!64 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!65 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 20}
!66 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!67 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 20}
!68 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!69 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 20}
!70 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!71 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 20}
!72 = !{ptr @loop_dynamic_update_slice_fusion_43, !"kernel", i32 1}
!73 = !{ptr @loop_dynamic_update_slice_fusion_43, !"reqntidx", i32 20}
!74 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!75 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 20}
!76 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!77 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 20}
!78 = !{ptr @loop_dynamic_update_slice_fusion_58, !"kernel", i32 1}
!79 = !{ptr @loop_dynamic_update_slice_fusion_58, !"reqntidx", i32 20}
!80 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 20}
!82 = !{ptr @loop_dynamic_update_slice_fusion_20, !"kernel", i32 1}
!83 = !{ptr @loop_dynamic_update_slice_fusion_20, !"reqntidx", i32 20}
!84 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!85 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 20}
!86 = !{ptr @loop_add_divide_exponential_select_fusion, !"kernel", i32 1}
!87 = !{ptr @loop_add_divide_exponential_select_fusion, !"reqntidx", i32 20}
!88 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 20}
!90 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 20}
!92 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 20}
!94 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 20}
!96 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 20}
!98 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 20}
!100 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 20}
!102 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 20}
!104 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 20}
!106 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!107 = !{ptr @loop_add_fusion, !"reqntidx", i32 1}
!108 = !{ptr @copy_fusion_5, !"kernel", i32 1}
!109 = !{ptr @copy_fusion_5, !"reqntidx", i32 128}
!110 = !{i32 0, i32 60}
!111 = !{i32 0, i32 128}
!112 = !{}
!113 = !{i32 0, i32 32}
!114 = !{i32 0, i32 1}
!115 = !{i32 0, i32 20}
!116 = !{i32 0, i32 2}
