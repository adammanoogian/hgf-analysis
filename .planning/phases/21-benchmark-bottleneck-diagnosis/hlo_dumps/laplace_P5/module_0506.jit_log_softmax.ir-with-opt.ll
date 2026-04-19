; ModuleID = 'jit_log_softmax'
source_filename = "jit_log_softmax"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(12288) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg1) local_unnamed_addr #0 {
entry:
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !9
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %0 = lshr i32 %thread.id.x, 1
  %thread.id.2 = and i32 %thread.id.x, 1
  %tile_origin.1 = shl nuw nsw i32 %block.id.x, 7
  %1 = zext nneg i32 %thread.id.2 to i64
  %2 = or disjoint i32 %0, %tile_origin.1
  %.lhs.trunc = trunc nuw nsw i32 %2 to i16
  %3 = urem i16 %.lhs.trunc, 192
  %4 = udiv i16 %.lhs.trunc, 192
  %5 = zext nneg i16 %4 to i64
  %6 = zext nneg i16 %3 to i64
  %param_0.43 = getelementptr inbounds [1 x [4 x [192 x [2 x double]]]], ptr addrspace(1) %arg019, i64 0, i64 0, i64 %5, i64 %6, i64 %1
  %param_0.432 = load double, ptr addrspace(1) %param_0.43, align 8, !invariant.load !11
  %add.3.i = fadd double %param_0.432, 0.000000e+00
  %7 = bitcast double %add.3.i to <2 x i32>
  %8 = extractelement <2 x i32> %7, i64 0
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 1, i32 31)
  %10 = extractelement <2 x i32> %7, i64 1
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = icmp eq i32 %thread.id.2, 0
  br i1 %12, label %reduction_write_output-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %entry
  ret void

reduction_write_output-true:                      ; preds = %entry
  %13 = insertelement <2 x i32> poison, i32 %9, i64 0
  %14 = insertelement <2 x i32> %13, i32 %11, i64 1
  %15 = bitcast <2 x i32> %14 to double
  %add.3.i10 = fadd double %add.3.i, %15
  %output_element_address = getelementptr inbounds [1 x [4 x [192 x double]]], ptr addrspace(1) %arg121, i64 0, i64 0, i64 %5, i64 %6
  %16 = fneg double %add.3.i10
  store double %16, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg2) local_unnamed_addr #3 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !12
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !11
  %6 = getelementptr double, ptr addrspace(1) %arg01, i64 %3
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !11
  %divide.3.1 = fdiv double %5, %7
  %8 = getelementptr double, ptr addrspace(1) %arg25, i64 %3
  store double %divide.3.1, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 16 dereferenceable(294912) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(12288) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(294912) %arg6) local_unnamed_addr #3 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !12
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %0 to i16
  %3 = udiv i16 %.lhs.trunc, 12
  %4 = udiv i16 %.lhs.trunc, 3
  %5 = and i16 %4, 3
  %6 = lshr i32 %linear_index, 1
  %.lhs.trunc3 = trunc nuw nsw i32 %6 to i16
  %7 = urem i16 %.lhs.trunc3, 192
  %8 = zext nneg i16 %3 to i64
  %9 = zext nneg i16 %5 to i64
  %10 = zext nneg i16 %7 to i64
  %11 = getelementptr inbounds [24 x [4 x [192 x [1 x double]]]], ptr addrspace(1) %arg417, i64 0, i64 %8, i64 %9, i64 %10, i64 0
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !11
  %13 = fneg double %12
  %14 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr addrspace(1) %arg315, i64 0, i64 0, i64 %9, i64 %10
  %15 = load double, ptr addrspace(1) %14, align 8, !invariant.load !11
  %multiply.12.5 = fmul double %15, %13
  %16 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg519, i64 0, i64 %9, i64 %10, i64 0
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !11
  %multiply.13.5 = fmul double %17, %17
  %divide.4.3 = fdiv double 1.000000e+00, %multiply.13.5
  %multiply.14.3 = fmul double %multiply.12.5, %divide.4.3
  %.lhs.trunc5 = trunc nuw i32 %linear_index to i16
  %18 = urem i16 %.lhs.trunc5, 1536
  %19 = zext nneg i16 %18 to i64
  %20 = getelementptr inbounds double, ptr addrspace(1) %arg213, i64 %19
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !11
  %multiply.15.3 = fmul double %21, %multiply.14.3
  %22 = urem i16 %.lhs.trunc3, 768
  %23 = zext nneg i16 %22 to i64
  %24 = getelementptr inbounds double, ptr addrspace(1) %arg111, i64 %23
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !11
  %26 = zext nneg i32 %linear_index to i64
  %27 = getelementptr double, ptr addrspace(1) %arg09, i64 %26
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !11
  %multiply.16.1 = fmul double %25, %28
  %add.5.1 = fadd double %multiply.15.3, %multiply.16.1
  %29 = getelementptr double, ptr addrspace(1) %arg621, i64 %26
  store double %add.5.1, ptr addrspace(1) %29, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(12288) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg3) local_unnamed_addr #3 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !14
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !12
  %linear_index = or disjoint i32 %1, %2
  %3 = lshr i32 %linear_index, 1
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !11
  %7 = zext nneg i32 %3 to i64
  %8 = getelementptr inbounds double, ptr addrspace(1) %arg25, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !11
  %10 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !11
  %multiply.11.1 = fmul double %9, %11
  %add.4.1 = fadd double %6, %multiply.11.1
  %12 = getelementptr double, ptr addrspace(1) %arg37, i64 %4
  store double %add.4.1, ptr addrspace(1) %12, align 8
  ret void
}

attributes #0 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7}
!llvm.module.flags = !{!8}

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 256}
!2 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_divide_fusion, !"reqntidx", i32 128}
!4 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!6 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!7 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 128}
!8 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!9 = !{i32 0, i32 256}
!10 = !{i32 0, i32 6}
!11 = !{}
!12 = !{i32 0, i32 128}
!13 = !{i32 0, i32 288}
!14 = !{i32 0, i32 12}
