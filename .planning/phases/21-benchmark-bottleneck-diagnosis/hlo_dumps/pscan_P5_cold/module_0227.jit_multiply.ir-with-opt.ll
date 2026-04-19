; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [4 x [1 x double]] undef

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg4) local_unnamed_addr #0 {
entry:
  %arg479 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg377 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg275 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg173 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg071 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %param_2.326 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg275, i64 0, i64 %1, i64 0
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %param_2.327 = load double, ptr addrspace(1) %param_2.326, align 8, !invariant.load !4
  %3 = zext nneg i32 %2 to i64
  %param_0.720 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg071, i64 0, i64 %1, i64 %3
  %4 = load <2 x double>, ptr addrspace(1) %param_0.720, align 16, !invariant.load !4
  %param_0.72191 = extractelement <2 x double> %4, i32 0
  %param_0.721.192 = extractelement <2 x double> %4, i32 1
  %param_1.522 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg173, i64 0, i64 %1, i64 %3
  %5 = load <2 x double>, ptr addrspace(1) %param_1.522, align 16, !invariant.load !4
  %param_1.52397 = extractelement <2 x double> %5, i32 0
  %param_1.523.198 = extractelement <2 x double> %5, i32 1
  %multiply.2.124 = fmul double %param_0.72191, %param_1.52397
  %add.1.i57 = fadd double %multiply.2.124, 0.000000e+00
  %multiply.3.1.clone.130 = fmul double %param_0.72191, %param_2.327
  %6 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg479, i64 0, i64 %1, i64 %3
  %multiply.2.124.1 = fmul double %param_0.721.192, %param_1.523.198
  %add.1.i57.1 = fadd double %add.1.i57, %multiply.2.124.1
  %multiply.3.1.clone.130.1 = fmul double %param_0.721.192, %param_2.327
  %7 = insertelement <2 x double> poison, double %multiply.3.1.clone.130, i32 0
  %8 = insertelement <2 x double> %7, double %multiply.3.1.clone.130.1, i32 1
  store <2 x double> %8, ptr addrspace(1) %6, align 16
  %param_0.720.16483 = getelementptr inbounds i8, ptr addrspace(1) %param_0.720, i64 512
  %9 = load <2 x double>, ptr addrspace(1) %param_0.720.16483, align 16, !invariant.load !4
  %param_0.721.16593 = extractelement <2 x double> %9, i32 0
  %param_0.721.1.194 = extractelement <2 x double> %9, i32 1
  %param_1.522.16684 = getelementptr inbounds i8, ptr addrspace(1) %param_1.522, i64 512
  %10 = load <2 x double>, ptr addrspace(1) %param_1.522.16684, align 16, !invariant.load !4
  %param_1.523.16799 = extractelement <2 x double> %10, i32 0
  %param_1.523.1.1100 = extractelement <2 x double> %10, i32 1
  %multiply.2.124.168 = fmul double %param_0.721.16593, %param_1.523.16799
  %add.1.i57.169 = fadd double %add.1.i57.1, %multiply.2.124.168
  %multiply.3.1.clone.130.170 = fmul double %param_0.721.16593, %param_2.327
  %11 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 512
  %multiply.2.124.1.1 = fmul double %param_0.721.1.194, %param_1.523.1.1100
  %add.1.i57.1.1 = fadd double %add.1.i57.169, %multiply.2.124.1.1
  %multiply.3.1.clone.130.1.1 = fmul double %param_0.721.1.194, %param_2.327
  %12 = insertelement <2 x double> poison, double %multiply.3.1.clone.130.170, i32 0
  %13 = insertelement <2 x double> %12, double %multiply.3.1.clone.130.1.1, i32 1
  store <2 x double> %13, ptr addrspace(1) %11, align 16
  %param_0.720.287 = getelementptr inbounds i8, ptr addrspace(1) %param_0.720, i64 1024
  %14 = load <2 x double>, ptr addrspace(1) %param_0.720.287, align 16, !invariant.load !4
  %param_0.721.295 = extractelement <2 x double> %14, i32 0
  %param_0.721.1.296 = extractelement <2 x double> %14, i32 1
  %param_1.522.288 = getelementptr inbounds i8, ptr addrspace(1) %param_1.522, i64 1024
  %15 = load <2 x double>, ptr addrspace(1) %param_1.522.288, align 16, !invariant.load !4
  %param_1.523.2101 = extractelement <2 x double> %15, i32 0
  %param_1.523.1.2102 = extractelement <2 x double> %15, i32 1
  %multiply.2.124.2 = fmul double %param_0.721.295, %param_1.523.2101
  %add.1.i57.2 = fadd double %add.1.i57.1.1, %multiply.2.124.2
  %multiply.3.1.clone.130.2 = fmul double %param_0.721.295, %param_2.327
  %16 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 1024
  %multiply.2.124.1.2 = fmul double %param_0.721.1.296, %param_1.523.1.2102
  %add.1.i57.1.2 = fadd double %add.1.i57.2, %multiply.2.124.1.2
  %multiply.3.1.clone.130.1.2 = fmul double %param_0.721.1.296, %param_2.327
  %17 = insertelement <2 x double> poison, double %multiply.3.1.clone.130.2, i32 0
  %18 = insertelement <2 x double> %17, double %multiply.3.1.clone.130.1.2, i32 1
  store <2 x double> %18, ptr addrspace(1) %16, align 16
  %19 = bitcast double %add.1.i57.1.2 to <2 x i32>
  %20 = extractelement <2 x i32> %19, i64 0
  %21 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 16, i32 31)
  %22 = insertelement <2 x i32> poison, i32 %21, i64 0
  %23 = extractelement <2 x i32> %19, i64 1
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 16, i32 31)
  %25 = insertelement <2 x i32> %22, i32 %24, i64 1
  %26 = bitcast <2 x i32> %25 to double
  %add.1.i = fadd double %add.1.i57.1.2, %26
  %27 = bitcast double %add.1.i to <2 x i32>
  %28 = extractelement <2 x i32> %27, i64 0
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 8, i32 31)
  %30 = insertelement <2 x i32> poison, i32 %29, i64 0
  %31 = extractelement <2 x i32> %27, i64 1
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %add.1.i53 = fadd double %add.1.i, %34
  %35 = bitcast double %add.1.i53 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 4, i32 31)
  %38 = insertelement <2 x i32> poison, i32 %37, i64 0
  %39 = extractelement <2 x i32> %35, i64 1
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to double
  %add.1.i54 = fadd double %add.1.i53, %42
  %43 = bitcast double %add.1.i54 to <2 x i32>
  %44 = extractelement <2 x i32> %43, i64 0
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 2, i32 31)
  %46 = insertelement <2 x i32> poison, i32 %45, i64 0
  %47 = extractelement <2 x i32> %43, i64 1
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> %46, i32 %48, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.1.i55 = fadd double %add.1.i54, %50
  %51 = bitcast double %add.1.i55 to <2 x i32>
  %52 = extractelement <2 x i32> %51, i64 0
  %53 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %52, i32 1, i32 31)
  %54 = extractelement <2 x i32> %51, i64 1
  %55 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %54, i32 1, i32 31)
  %56 = icmp eq i32 %thread.id.2, 0
  %57 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %1, i64 0
  %58 = insertelement <2 x i32> poison, i32 %53, i64 0
  %59 = insertelement <2 x i32> %58, i32 %55, i64 1
  %60 = bitcast <2 x i32> %59 to double
  %add.1.i56 = fadd double %add.1.i55, %60
  br i1 %56, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %entry
  %61 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [4 x double], ptr addrspace(1) %arg377, i64 0, i64 %1
  br i1 %61, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %entry
  store double %add.1.i56, ptr addrspace(3) %57, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %57, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

attributes #0 = { norecurse nounwind }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 128}
!4 = !{}
