; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [8 x [1 x double]] undef

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg4) local_unnamed_addr #0 {
entry:
  %arg479 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg377 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg275 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg173 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg071 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %tile_origin.1 = shl nuw nsw i32 %block.id.x, 3
  %1 = or disjoint i32 %0, %tile_origin.1
  %2 = zext nneg i32 %1 to i64
  %param_2.326 = getelementptr inbounds [48 x [1 x double]], ptr addrspace(1) %arg275, i64 0, i64 %2, i64 0
  %3 = shl nuw nsw i32 %thread.id.2, 1
  %param_2.327 = load double, ptr addrspace(1) %param_2.326, align 8, !invariant.load !5
  %4 = zext nneg i32 %3 to i64
  %param_0.720 = getelementptr inbounds [48 x [192 x double]], ptr addrspace(1) %arg071, i64 0, i64 %2, i64 %4
  %5 = load <2 x double>, ptr addrspace(1) %param_0.720, align 16, !invariant.load !5
  %param_0.72191 = extractelement <2 x double> %5, i32 0
  %param_0.721.192 = extractelement <2 x double> %5, i32 1
  %param_1.522 = getelementptr inbounds [48 x [192 x double]], ptr addrspace(1) %arg173, i64 0, i64 %2, i64 %4
  %6 = load <2 x double>, ptr addrspace(1) %param_1.522, align 16, !invariant.load !5
  %param_1.52397 = extractelement <2 x double> %6, i32 0
  %param_1.523.198 = extractelement <2 x double> %6, i32 1
  %multiply.2.124 = fmul double %param_0.72191, %param_1.52397
  %add.1.i57 = fadd double %multiply.2.124, 0.000000e+00
  %multiply.3.1.clone.130 = fmul double %param_0.72191, %param_2.327
  %7 = getelementptr inbounds [48 x [192 x double]], ptr addrspace(1) %arg479, i64 0, i64 %2, i64 %4
  %multiply.2.124.1 = fmul double %param_0.721.192, %param_1.523.198
  %add.1.i57.1 = fadd double %add.1.i57, %multiply.2.124.1
  %multiply.3.1.clone.130.1 = fmul double %param_0.721.192, %param_2.327
  %8 = insertelement <2 x double> poison, double %multiply.3.1.clone.130, i32 0
  %9 = insertelement <2 x double> %8, double %multiply.3.1.clone.130.1, i32 1
  store <2 x double> %9, ptr addrspace(1) %7, align 16
  %param_0.720.16483 = getelementptr inbounds i8, ptr addrspace(1) %param_0.720, i64 512
  %10 = load <2 x double>, ptr addrspace(1) %param_0.720.16483, align 16, !invariant.load !5
  %param_0.721.16593 = extractelement <2 x double> %10, i32 0
  %param_0.721.1.194 = extractelement <2 x double> %10, i32 1
  %param_1.522.16684 = getelementptr inbounds i8, ptr addrspace(1) %param_1.522, i64 512
  %11 = load <2 x double>, ptr addrspace(1) %param_1.522.16684, align 16, !invariant.load !5
  %param_1.523.16799 = extractelement <2 x double> %11, i32 0
  %param_1.523.1.1100 = extractelement <2 x double> %11, i32 1
  %multiply.2.124.168 = fmul double %param_0.721.16593, %param_1.523.16799
  %add.1.i57.169 = fadd double %add.1.i57.1, %multiply.2.124.168
  %multiply.3.1.clone.130.170 = fmul double %param_0.721.16593, %param_2.327
  %12 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 512
  %multiply.2.124.1.1 = fmul double %param_0.721.1.194, %param_1.523.1.1100
  %add.1.i57.1.1 = fadd double %add.1.i57.169, %multiply.2.124.1.1
  %multiply.3.1.clone.130.1.1 = fmul double %param_0.721.1.194, %param_2.327
  %13 = insertelement <2 x double> poison, double %multiply.3.1.clone.130.170, i32 0
  %14 = insertelement <2 x double> %13, double %multiply.3.1.clone.130.1.1, i32 1
  store <2 x double> %14, ptr addrspace(1) %12, align 16
  %param_0.720.287 = getelementptr inbounds i8, ptr addrspace(1) %param_0.720, i64 1024
  %15 = load <2 x double>, ptr addrspace(1) %param_0.720.287, align 16, !invariant.load !5
  %param_0.721.295 = extractelement <2 x double> %15, i32 0
  %param_0.721.1.296 = extractelement <2 x double> %15, i32 1
  %param_1.522.288 = getelementptr inbounds i8, ptr addrspace(1) %param_1.522, i64 1024
  %16 = load <2 x double>, ptr addrspace(1) %param_1.522.288, align 16, !invariant.load !5
  %param_1.523.2101 = extractelement <2 x double> %16, i32 0
  %param_1.523.1.2102 = extractelement <2 x double> %16, i32 1
  %multiply.2.124.2 = fmul double %param_0.721.295, %param_1.523.2101
  %add.1.i57.2 = fadd double %add.1.i57.1.1, %multiply.2.124.2
  %multiply.3.1.clone.130.2 = fmul double %param_0.721.295, %param_2.327
  %17 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 1024
  %multiply.2.124.1.2 = fmul double %param_0.721.1.296, %param_1.523.1.2102
  %add.1.i57.1.2 = fadd double %add.1.i57.2, %multiply.2.124.1.2
  %multiply.3.1.clone.130.1.2 = fmul double %param_0.721.1.296, %param_2.327
  %18 = insertelement <2 x double> poison, double %multiply.3.1.clone.130.2, i32 0
  %19 = insertelement <2 x double> %18, double %multiply.3.1.clone.130.1.2, i32 1
  store <2 x double> %19, ptr addrspace(1) %17, align 16
  %20 = bitcast double %add.1.i57.1.2 to <2 x i32>
  %21 = extractelement <2 x i32> %20, i64 0
  %22 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %21, i32 16, i32 31)
  %23 = insertelement <2 x i32> poison, i32 %22, i64 0
  %24 = extractelement <2 x i32> %20, i64 1
  %25 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %24, i32 16, i32 31)
  %26 = insertelement <2 x i32> %23, i32 %25, i64 1
  %27 = bitcast <2 x i32> %26 to double
  %add.1.i = fadd double %add.1.i57.1.2, %27
  %28 = bitcast double %add.1.i to <2 x i32>
  %29 = extractelement <2 x i32> %28, i64 0
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 8, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %30, i64 0
  %32 = extractelement <2 x i32> %28, i64 1
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 8, i32 31)
  %34 = insertelement <2 x i32> %31, i32 %33, i64 1
  %35 = bitcast <2 x i32> %34 to double
  %add.1.i53 = fadd double %add.1.i, %35
  %36 = bitcast double %add.1.i53 to <2 x i32>
  %37 = extractelement <2 x i32> %36, i64 0
  %38 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 4, i32 31)
  %39 = insertelement <2 x i32> poison, i32 %38, i64 0
  %40 = extractelement <2 x i32> %36, i64 1
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 4, i32 31)
  %42 = insertelement <2 x i32> %39, i32 %41, i64 1
  %43 = bitcast <2 x i32> %42 to double
  %add.1.i54 = fadd double %add.1.i53, %43
  %44 = bitcast double %add.1.i54 to <2 x i32>
  %45 = extractelement <2 x i32> %44, i64 0
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 2, i32 31)
  %47 = insertelement <2 x i32> poison, i32 %46, i64 0
  %48 = extractelement <2 x i32> %44, i64 1
  %49 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 2, i32 31)
  %50 = insertelement <2 x i32> %47, i32 %49, i64 1
  %51 = bitcast <2 x i32> %50 to double
  %add.1.i55 = fadd double %add.1.i54, %51
  %52 = bitcast double %add.1.i55 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 1, i32 31)
  %55 = extractelement <2 x i32> %52, i64 1
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 1, i32 31)
  %57 = icmp eq i32 %thread.id.2, 0
  %58 = zext nneg i32 %0 to i64
  %59 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %58, i64 0
  %60 = insertelement <2 x i32> poison, i32 %54, i64 0
  %61 = insertelement <2 x i32> %60, i32 %56, i64 1
  %62 = bitcast <2 x i32> %61 to double
  %add.1.i56 = fadd double %add.1.i55, %62
  br i1 %57, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %entry
  %63 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [48 x double], ptr addrspace(1) %arg377, i64 0, i64 %2
  br i1 %63, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %entry
  store double %add.1.i56, ptr addrspace(3) %59, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %59, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

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
!1 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 256}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 256}
!4 = !{i32 0, i32 6}
!5 = !{}
