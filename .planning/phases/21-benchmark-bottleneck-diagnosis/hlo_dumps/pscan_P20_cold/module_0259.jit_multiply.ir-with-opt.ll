; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [8 x [1 x double]] undef

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg4) local_unnamed_addr #0 {
entry:
  %arg481 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg379 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg277 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg175 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg073 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = icmp eq i32 %block.id.x, 2
  %tile_bound.1 = select i1 %1, i32 4, i32 8
  %tile_origin.1 = shl nuw nsw i32 %block.id.x, 3
  %.not62 = icmp ult i32 %0, %tile_bound.1
  br i1 %.not62, label %loop1.loop_body.preheader, label %loop1.loop_exit

loop1.loop_body.preheader:                        ; preds = %entry
  %2 = or disjoint i32 %0, %tile_origin.1
  %3 = zext nneg i32 %2 to i64
  %param_2.326 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg277, i64 0, i64 %3, i64 0
  %4 = shl nuw nsw i32 %thread.id.2, 1
  %param_2.327 = load double, ptr addrspace(1) %param_2.326, align 8, !invariant.load !5
  %5 = zext nneg i32 %4 to i64
  %param_0.720 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg073, i64 0, i64 %3, i64 %5
  %6 = load <2 x double>, ptr addrspace(1) %param_0.720, align 16, !invariant.load !5
  %param_0.72193 = extractelement <2 x double> %6, i32 0
  %param_0.721.194 = extractelement <2 x double> %6, i32 1
  %param_1.522 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg175, i64 0, i64 %3, i64 %5
  %7 = load <2 x double>, ptr addrspace(1) %param_1.522, align 16, !invariant.load !5
  %param_1.52399 = extractelement <2 x double> %7, i32 0
  %param_1.523.1100 = extractelement <2 x double> %7, i32 1
  %multiply.2.124 = fmul double %param_0.72193, %param_1.52399
  %add.1.i57 = fadd double %multiply.2.124, 0.000000e+00
  %multiply.3.1.clone.130 = fmul double %param_0.72193, %param_2.327
  %8 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg481, i64 0, i64 %3, i64 %5
  %multiply.2.124.1 = fmul double %param_0.721.194, %param_1.523.1100
  %add.1.i57.1 = fadd double %add.1.i57, %multiply.2.124.1
  %multiply.3.1.clone.130.1 = fmul double %param_0.721.194, %param_2.327
  %9 = insertelement <2 x double> poison, double %multiply.3.1.clone.130, i32 0
  %10 = insertelement <2 x double> %9, double %multiply.3.1.clone.130.1, i32 1
  store <2 x double> %10, ptr addrspace(1) %8, align 16
  %param_0.720.16685 = getelementptr inbounds i8, ptr addrspace(1) %param_0.720, i64 512
  %11 = load <2 x double>, ptr addrspace(1) %param_0.720.16685, align 16, !invariant.load !5
  %param_0.721.16795 = extractelement <2 x double> %11, i32 0
  %param_0.721.1.196 = extractelement <2 x double> %11, i32 1
  %param_1.522.16886 = getelementptr inbounds i8, ptr addrspace(1) %param_1.522, i64 512
  %12 = load <2 x double>, ptr addrspace(1) %param_1.522.16886, align 16, !invariant.load !5
  %param_1.523.169101 = extractelement <2 x double> %12, i32 0
  %param_1.523.1.1102 = extractelement <2 x double> %12, i32 1
  %multiply.2.124.170 = fmul double %param_0.721.16795, %param_1.523.169101
  %add.1.i57.171 = fadd double %add.1.i57.1, %multiply.2.124.170
  %multiply.3.1.clone.130.172 = fmul double %param_0.721.16795, %param_2.327
  %13 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 512
  %multiply.2.124.1.1 = fmul double %param_0.721.1.196, %param_1.523.1.1102
  %add.1.i57.1.1 = fadd double %add.1.i57.171, %multiply.2.124.1.1
  %multiply.3.1.clone.130.1.1 = fmul double %param_0.721.1.196, %param_2.327
  %14 = insertelement <2 x double> poison, double %multiply.3.1.clone.130.172, i32 0
  %15 = insertelement <2 x double> %14, double %multiply.3.1.clone.130.1.1, i32 1
  store <2 x double> %15, ptr addrspace(1) %13, align 16
  %param_0.720.289 = getelementptr inbounds i8, ptr addrspace(1) %param_0.720, i64 1024
  %16 = load <2 x double>, ptr addrspace(1) %param_0.720.289, align 16, !invariant.load !5
  %param_0.721.297 = extractelement <2 x double> %16, i32 0
  %param_0.721.1.298 = extractelement <2 x double> %16, i32 1
  %param_1.522.290 = getelementptr inbounds i8, ptr addrspace(1) %param_1.522, i64 1024
  %17 = load <2 x double>, ptr addrspace(1) %param_1.522.290, align 16, !invariant.load !5
  %param_1.523.2103 = extractelement <2 x double> %17, i32 0
  %param_1.523.1.2104 = extractelement <2 x double> %17, i32 1
  %multiply.2.124.2 = fmul double %param_0.721.297, %param_1.523.2103
  %add.1.i57.2 = fadd double %add.1.i57.1.1, %multiply.2.124.2
  %multiply.3.1.clone.130.2 = fmul double %param_0.721.297, %param_2.327
  %18 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 1024
  %multiply.2.124.1.2 = fmul double %param_0.721.1.298, %param_1.523.1.2104
  %add.1.i57.1.2 = fadd double %add.1.i57.2, %multiply.2.124.1.2
  %multiply.3.1.clone.130.1.2 = fmul double %param_0.721.1.298, %param_2.327
  %19 = insertelement <2 x double> poison, double %multiply.3.1.clone.130.2, i32 0
  %20 = insertelement <2 x double> %19, double %multiply.3.1.clone.130.1.2, i32 1
  store <2 x double> %20, ptr addrspace(1) %18, align 16
  br label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %loop1.loop_body.preheader, %entry
  %partial_reduction_result.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add.1.i57.1.2, %loop1.loop_body.preheader ]
  %21 = icmp ult i32 %0, %tile_bound.1
  %22 = bitcast double %partial_reduction_result.0.lcssa to <2 x i32>
  %23 = extractelement <2 x i32> %22, i64 0
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 16, i32 31)
  %25 = insertelement <2 x i32> poison, i32 %24, i64 0
  %26 = extractelement <2 x i32> %22, i64 1
  %27 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %26, i32 16, i32 31)
  %28 = insertelement <2 x i32> %25, i32 %27, i64 1
  %29 = bitcast <2 x i32> %28 to double
  %add.1.i = fadd double %partial_reduction_result.0.lcssa, %29
  %30 = bitcast double %add.1.i to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> poison, i32 %32, i64 0
  %34 = extractelement <2 x i32> %30, i64 1
  %35 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 8, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to double
  %add.1.i53 = fadd double %add.1.i, %37
  %38 = bitcast double %add.1.i53 to <2 x i32>
  %39 = extractelement <2 x i32> %38, i64 0
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> poison, i32 %40, i64 0
  %42 = extractelement <2 x i32> %38, i64 1
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 4, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 1
  %45 = bitcast <2 x i32> %44 to double
  %add.1.i54 = fadd double %add.1.i53, %45
  %46 = bitcast double %add.1.i54 to <2 x i32>
  %47 = extractelement <2 x i32> %46, i64 0
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> poison, i32 %48, i64 0
  %50 = extractelement <2 x i32> %46, i64 1
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 2, i32 31)
  %52 = insertelement <2 x i32> %49, i32 %51, i64 1
  %53 = bitcast <2 x i32> %52 to double
  %add.1.i55 = fadd double %add.1.i54, %53
  %54 = bitcast double %add.1.i55 to <2 x i32>
  %55 = extractelement <2 x i32> %54, i64 0
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 1, i32 31)
  %57 = insertelement <2 x i32> poison, i32 %56, i64 0
  %58 = extractelement <2 x i32> %54, i64 1
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 1, i32 31)
  %60 = insertelement <2 x i32> %57, i32 %59, i64 1
  %61 = bitcast <2 x i32> %60 to double
  %add.1.i56 = fadd double %add.1.i55, %61
  br i1 %21, label %thread_in_bounds-true, label %reduce-group-0-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %62 = icmp eq i32 %thread.id.2, 0
  %63 = zext nneg i32 %0 to i64
  %64 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %63, i64 0
  br i1 %62, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  %65 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %66 = or disjoint i32 %tile_origin.1, %0
  %67 = zext nneg i32 %66 to i64
  %output_element_address = getelementptr inbounds [20 x double], ptr addrspace(1) %arg379, i64 0, i64 %67
  br i1 %65, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  store double %add.1.i56, ptr addrspace(3) %64, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %64, align 8
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
!4 = !{i32 0, i32 3}
!5 = !{}
