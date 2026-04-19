; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [8 x [1 x double]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [8 x [1 x double]] undef

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #0 {
entry:
  %arg159 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg057 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = icmp eq i32 %block.id.x, 2
  %tile_bound.1 = select i1 %1, i32 4, i32 8
  %tile_origin.1 = shl nuw nsw i32 %block.id.x, 3
  %.not50 = icmp ult i32 %0, %tile_bound.1
  br i1 %.not50, label %loop1.loop_body.preheader, label %loop1.loop_exit

loop1.loop_body.preheader:                        ; preds = %entry
  %2 = or disjoint i32 %0, %tile_origin.1
  %3 = zext nneg i32 %2 to i64
  %4 = shl nuw nsw i32 %thread.id.2, 1
  %5 = zext nneg i32 %4 to i64
  %param_0.416 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr addrspace(1) %arg057, i64 0, i64 0, i64 %3, i64 %5
  %6 = load <2 x double>, ptr addrspace(1) %param_0.416, align 16, !invariant.load !7
  %param_0.41766 = extractelement <2 x double> %6, i32 0
  %param_0.417.167 = extractelement <2 x double> %6, i32 1
  %add.1.i45 = fadd double %param_0.41766, 0.000000e+00
  %add.1.i45.1 = fadd double %add.1.i45, %param_0.417.167
  %param_0.416.15462 = getelementptr inbounds i8, ptr addrspace(1) %param_0.416, i64 512
  %7 = load <2 x double>, ptr addrspace(1) %param_0.416.15462, align 16, !invariant.load !7
  %param_0.417.15568 = extractelement <2 x double> %7, i32 0
  %param_0.417.1.169 = extractelement <2 x double> %7, i32 1
  %add.1.i45.156 = fadd double %add.1.i45.1, %param_0.417.15568
  %add.1.i45.1.1 = fadd double %add.1.i45.156, %param_0.417.1.169
  %param_0.416.264 = getelementptr inbounds i8, ptr addrspace(1) %param_0.416, i64 1024
  %8 = load <2 x double>, ptr addrspace(1) %param_0.416.264, align 16, !invariant.load !7
  %param_0.417.270 = extractelement <2 x double> %8, i32 0
  %param_0.417.1.271 = extractelement <2 x double> %8, i32 1
  %add.1.i45.2 = fadd double %add.1.i45.1.1, %param_0.417.270
  %add.1.i45.1.2 = fadd double %add.1.i45.2, %param_0.417.1.271
  br label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %loop1.loop_body.preheader, %entry
  %partial_reduction_result.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add.1.i45.1.2, %loop1.loop_body.preheader ]
  %9 = icmp ult i32 %0, %tile_bound.1
  %10 = bitcast double %partial_reduction_result.0.lcssa to <2 x i32>
  %11 = extractelement <2 x i32> %10, i64 0
  %12 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %11, i32 16, i32 31)
  %13 = insertelement <2 x i32> poison, i32 %12, i64 0
  %14 = extractelement <2 x i32> %10, i64 1
  %15 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 16, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 1
  %17 = bitcast <2 x i32> %16 to double
  %add.1.i = fadd double %partial_reduction_result.0.lcssa, %17
  %18 = bitcast double %add.1.i to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 8, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 8, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.1.i41 = fadd double %add.1.i, %25
  %26 = bitcast double %add.1.i41 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 4, i32 31)
  %29 = insertelement <2 x i32> poison, i32 %28, i64 0
  %30 = extractelement <2 x i32> %26, i64 1
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 4, i32 31)
  %32 = insertelement <2 x i32> %29, i32 %31, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.1.i42 = fadd double %add.1.i41, %33
  %34 = bitcast double %add.1.i42 to <2 x i32>
  %35 = extractelement <2 x i32> %34, i64 0
  %36 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %35, i32 2, i32 31)
  %37 = insertelement <2 x i32> poison, i32 %36, i64 0
  %38 = extractelement <2 x i32> %34, i64 1
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 2, i32 31)
  %40 = insertelement <2 x i32> %37, i32 %39, i64 1
  %41 = bitcast <2 x i32> %40 to double
  %add.1.i43 = fadd double %add.1.i42, %41
  %42 = bitcast double %add.1.i43 to <2 x i32>
  %43 = extractelement <2 x i32> %42, i64 0
  %44 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %43, i32 1, i32 31)
  %45 = insertelement <2 x i32> poison, i32 %44, i64 0
  %46 = extractelement <2 x i32> %42, i64 1
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 1, i32 31)
  %48 = insertelement <2 x i32> %45, i32 %47, i64 1
  %49 = bitcast <2 x i32> %48 to double
  %add.1.i44 = fadd double %add.1.i43, %49
  br i1 %9, label %thread_in_bounds-true, label %reduce-group-0-after

thread_in_bounds-true:                            ; preds = %loop1.loop_exit
  %50 = icmp eq i32 %thread.id.2, 0
  %51 = zext nneg i32 %0 to i64
  %52 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %51, i64 0
  br i1 %50, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %thread_in_bounds-true
  %53 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %54 = or disjoint i32 %tile_origin.1, %0
  %55 = zext nneg i32 %54 to i64
  %output_element_address = getelementptr inbounds [20 x double], ptr addrspace(1) %arg159, i64 0, i64 %55
  br i1 %53, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %thread_in_bounds-true
  store double %add.1.i44, ptr addrspace(3) %52, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %52, align 8
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

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg1) local_unnamed_addr #0 {
entry:
  %arg163 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg061 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %tile_origin.1 = shl nuw nsw i32 %block.id.x, 3
  %1 = or disjoint i32 %0, %tile_origin.1
  %.lhs.trunc = trunc nuw nsw i32 %1 to i16
  %2 = urem i16 %.lhs.trunc, 20
  %3 = udiv i16 %.lhs.trunc, 20
  %4 = zext nneg i16 %3 to i64
  %5 = zext nneg i16 %2 to i64
  %6 = shl nuw nsw i32 %thread.id.2, 1
  %7 = zext nneg i32 %6 to i64
  %param_0.516 = getelementptr inbounds [120 x [1 x [20 x [192 x double]]]], ptr addrspace(1) %arg061, i64 0, i64 %4, i64 0, i64 %5, i64 %7
  %8 = load <2 x double>, ptr addrspace(1) %param_0.516, align 16, !invariant.load !7
  %param_0.51770 = extractelement <2 x double> %8, i32 0
  %param_0.517.171 = extractelement <2 x double> %8, i32 1
  %add.1.i45 = fadd double %param_0.51770, 0.000000e+00
  %add.1.i45.1 = fadd double %add.1.i45, %param_0.517.171
  %param_0.516.15266 = getelementptr inbounds i8, ptr addrspace(1) %param_0.516, i64 512
  %9 = load <2 x double>, ptr addrspace(1) %param_0.516.15266, align 16, !invariant.load !7
  %param_0.517.15372 = extractelement <2 x double> %9, i32 0
  %param_0.517.1.173 = extractelement <2 x double> %9, i32 1
  %add.1.i45.154 = fadd double %add.1.i45.1, %param_0.517.15372
  %add.1.i45.1.1 = fadd double %add.1.i45.154, %param_0.517.1.173
  %param_0.516.268 = getelementptr inbounds i8, ptr addrspace(1) %param_0.516, i64 1024
  %10 = load <2 x double>, ptr addrspace(1) %param_0.516.268, align 16, !invariant.load !7
  %param_0.517.274 = extractelement <2 x double> %10, i32 0
  %param_0.517.1.275 = extractelement <2 x double> %10, i32 1
  %add.1.i45.2 = fadd double %add.1.i45.1.1, %param_0.517.274
  %add.1.i45.1.2 = fadd double %add.1.i45.2, %param_0.517.1.275
  %11 = bitcast double %add.1.i45.1.2 to <2 x i32>
  %12 = extractelement <2 x i32> %11, i64 0
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 16, i32 31)
  %14 = insertelement <2 x i32> poison, i32 %13, i64 0
  %15 = extractelement <2 x i32> %11, i64 1
  %16 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 16, i32 31)
  %17 = insertelement <2 x i32> %14, i32 %16, i64 1
  %18 = bitcast <2 x i32> %17 to double
  %add.1.i = fadd double %add.1.i45.1.2, %18
  %19 = bitcast double %add.1.i to <2 x i32>
  %20 = extractelement <2 x i32> %19, i64 0
  %21 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 8, i32 31)
  %22 = insertelement <2 x i32> poison, i32 %21, i64 0
  %23 = extractelement <2 x i32> %19, i64 1
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 8, i32 31)
  %25 = insertelement <2 x i32> %22, i32 %24, i64 1
  %26 = bitcast <2 x i32> %25 to double
  %add.1.i41 = fadd double %add.1.i, %26
  %27 = bitcast double %add.1.i41 to <2 x i32>
  %28 = extractelement <2 x i32> %27, i64 0
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 4, i32 31)
  %30 = insertelement <2 x i32> poison, i32 %29, i64 0
  %31 = extractelement <2 x i32> %27, i64 1
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 4, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %add.1.i42 = fadd double %add.1.i41, %34
  %35 = bitcast double %add.1.i42 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 2, i32 31)
  %38 = insertelement <2 x i32> poison, i32 %37, i64 0
  %39 = extractelement <2 x i32> %35, i64 1
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 2, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to double
  %add.1.i43 = fadd double %add.1.i42, %42
  %43 = bitcast double %add.1.i43 to <2 x i32>
  %44 = extractelement <2 x i32> %43, i64 0
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 1, i32 31)
  %46 = extractelement <2 x i32> %43, i64 1
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 1, i32 31)
  %48 = icmp eq i32 %thread.id.2, 0
  %49 = zext nneg i32 %0 to i64
  %50 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache1, i64 0, i64 %49, i64 0
  %51 = insertelement <2 x i32> poison, i32 %45, i64 0
  %52 = insertelement <2 x i32> %51, i32 %47, i64 1
  %53 = bitcast <2 x i32> %52 to double
  %add.1.i44 = fadd double %add.1.i43, %53
  br i1 %48, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %entry
  %54 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %54, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %entry
  store double %add.1.i44, ptr addrspace(3) %50, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output_element_address = getelementptr inbounds [120 x [20 x double]], ptr addrspace(1) %arg163, i64 0, i64 %4, i64 %5
  %output.then.val = load double, ptr addrspace(3) %50, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

attributes #0 = { norecurse nounwind }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @input_reduce_fusion_1, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion_1, !"reqntidx", i32 256}
!2 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!3 = !{ptr @input_reduce_fusion, !"reqntidx", i32 256}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 256}
!6 = !{i32 0, i32 3}
!7 = !{}
!8 = !{i32 0, i32 300}
