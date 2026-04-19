; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [8 x [1 x double]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [8 x [1 x double]] undef

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg4) local_unnamed_addr #0 {
entry:
  %arg481 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg379 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg277 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg175 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg073 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %param_2.2026 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg277, i64 0, i64 %3, i64 0
  %4 = shl nuw nsw i32 %thread.id.2, 1
  %param_2.2027 = load double, ptr addrspace(1) %param_2.2026, align 8, !invariant.load !7
  %5 = zext nneg i32 %4 to i64
  %param_0.3620 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr addrspace(1) %arg073, i64 0, i64 0, i64 %3, i64 %5
  %6 = load <2 x double>, ptr addrspace(1) %param_0.3620, align 16, !invariant.load !7
  %param_0.362193 = extractelement <2 x double> %6, i32 0
  %param_0.3621.194 = extractelement <2 x double> %6, i32 1
  %param_1.3522 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg175, i64 0, i64 %3, i64 %5
  %7 = load <2 x double>, ptr addrspace(1) %param_1.3522, align 16, !invariant.load !7
  %param_1.352399 = extractelement <2 x double> %7, i32 0
  %param_1.3523.1100 = extractelement <2 x double> %7, i32 1
  %multiply.7.324 = fmul double %param_0.362193, %param_1.352399
  %add.3.i57 = fadd double %multiply.7.324, 0.000000e+00
  %multiply.8.1.clone.130 = fmul double %param_0.362193, %param_2.2027
  %8 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr addrspace(1) %arg481, i64 0, i64 0, i64 %3, i64 %5
  %multiply.7.324.1 = fmul double %param_0.3621.194, %param_1.3523.1100
  %add.3.i57.1 = fadd double %add.3.i57, %multiply.7.324.1
  %multiply.8.1.clone.130.1 = fmul double %param_0.3621.194, %param_2.2027
  %9 = insertelement <2 x double> poison, double %multiply.8.1.clone.130, i32 0
  %10 = insertelement <2 x double> %9, double %multiply.8.1.clone.130.1, i32 1
  store <2 x double> %10, ptr addrspace(1) %8, align 16
  %param_0.3620.16685 = getelementptr inbounds i8, ptr addrspace(1) %param_0.3620, i64 512
  %11 = load <2 x double>, ptr addrspace(1) %param_0.3620.16685, align 16, !invariant.load !7
  %param_0.3621.16795 = extractelement <2 x double> %11, i32 0
  %param_0.3621.1.196 = extractelement <2 x double> %11, i32 1
  %param_1.3522.16886 = getelementptr inbounds i8, ptr addrspace(1) %param_1.3522, i64 512
  %12 = load <2 x double>, ptr addrspace(1) %param_1.3522.16886, align 16, !invariant.load !7
  %param_1.3523.169101 = extractelement <2 x double> %12, i32 0
  %param_1.3523.1.1102 = extractelement <2 x double> %12, i32 1
  %multiply.7.324.170 = fmul double %param_0.3621.16795, %param_1.3523.169101
  %add.3.i57.171 = fadd double %add.3.i57.1, %multiply.7.324.170
  %multiply.8.1.clone.130.172 = fmul double %param_0.3621.16795, %param_2.2027
  %13 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 512
  %multiply.7.324.1.1 = fmul double %param_0.3621.1.196, %param_1.3523.1.1102
  %add.3.i57.1.1 = fadd double %add.3.i57.171, %multiply.7.324.1.1
  %multiply.8.1.clone.130.1.1 = fmul double %param_0.3621.1.196, %param_2.2027
  %14 = insertelement <2 x double> poison, double %multiply.8.1.clone.130.172, i32 0
  %15 = insertelement <2 x double> %14, double %multiply.8.1.clone.130.1.1, i32 1
  store <2 x double> %15, ptr addrspace(1) %13, align 16
  %param_0.3620.289 = getelementptr inbounds i8, ptr addrspace(1) %param_0.3620, i64 1024
  %16 = load <2 x double>, ptr addrspace(1) %param_0.3620.289, align 16, !invariant.load !7
  %param_0.3621.297 = extractelement <2 x double> %16, i32 0
  %param_0.3621.1.298 = extractelement <2 x double> %16, i32 1
  %param_1.3522.290 = getelementptr inbounds i8, ptr addrspace(1) %param_1.3522, i64 1024
  %17 = load <2 x double>, ptr addrspace(1) %param_1.3522.290, align 16, !invariant.load !7
  %param_1.3523.2103 = extractelement <2 x double> %17, i32 0
  %param_1.3523.1.2104 = extractelement <2 x double> %17, i32 1
  %multiply.7.324.2 = fmul double %param_0.3621.297, %param_1.3523.2103
  %add.3.i57.2 = fadd double %add.3.i57.1.1, %multiply.7.324.2
  %multiply.8.1.clone.130.2 = fmul double %param_0.3621.297, %param_2.2027
  %18 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 1024
  %multiply.7.324.1.2 = fmul double %param_0.3621.1.298, %param_1.3523.1.2104
  %add.3.i57.1.2 = fadd double %add.3.i57.2, %multiply.7.324.1.2
  %multiply.8.1.clone.130.1.2 = fmul double %param_0.3621.1.298, %param_2.2027
  %19 = insertelement <2 x double> poison, double %multiply.8.1.clone.130.2, i32 0
  %20 = insertelement <2 x double> %19, double %multiply.8.1.clone.130.1.2, i32 1
  store <2 x double> %20, ptr addrspace(1) %18, align 16
  br label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %loop1.loop_body.preheader, %entry
  %partial_reduction_result.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add.3.i57.1.2, %loop1.loop_body.preheader ]
  %21 = icmp ult i32 %0, %tile_bound.1
  %22 = bitcast double %partial_reduction_result.0.lcssa to <2 x i32>
  %23 = extractelement <2 x i32> %22, i64 0
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 16, i32 31)
  %25 = insertelement <2 x i32> poison, i32 %24, i64 0
  %26 = extractelement <2 x i32> %22, i64 1
  %27 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %26, i32 16, i32 31)
  %28 = insertelement <2 x i32> %25, i32 %27, i64 1
  %29 = bitcast <2 x i32> %28 to double
  %add.3.i = fadd double %partial_reduction_result.0.lcssa, %29
  %30 = bitcast double %add.3.i to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> poison, i32 %32, i64 0
  %34 = extractelement <2 x i32> %30, i64 1
  %35 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 8, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to double
  %add.3.i53 = fadd double %add.3.i, %37
  %38 = bitcast double %add.3.i53 to <2 x i32>
  %39 = extractelement <2 x i32> %38, i64 0
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> poison, i32 %40, i64 0
  %42 = extractelement <2 x i32> %38, i64 1
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 4, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 1
  %45 = bitcast <2 x i32> %44 to double
  %add.3.i54 = fadd double %add.3.i53, %45
  %46 = bitcast double %add.3.i54 to <2 x i32>
  %47 = extractelement <2 x i32> %46, i64 0
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> poison, i32 %48, i64 0
  %50 = extractelement <2 x i32> %46, i64 1
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 2, i32 31)
  %52 = insertelement <2 x i32> %49, i32 %51, i64 1
  %53 = bitcast <2 x i32> %52 to double
  %add.3.i55 = fadd double %add.3.i54, %53
  %54 = bitcast double %add.3.i55 to <2 x i32>
  %55 = extractelement <2 x i32> %54, i64 0
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 1, i32 31)
  %57 = insertelement <2 x i32> poison, i32 %56, i64 0
  %58 = extractelement <2 x i32> %54, i64 1
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 1, i32 31)
  %60 = insertelement <2 x i32> %57, i32 %59, i64 1
  %61 = bitcast <2 x i32> %60 to double
  %add.3.i56 = fadd double %add.3.i55, %61
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
  store double %add.3.i56, ptr addrspace(3) %64, align 8
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

; Function Attrs: norecurse nounwind
define void @input_add_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(19200) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg7) local_unnamed_addr #0 {
entry:
  %arg7116 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6114 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5112 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4110 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3108 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2106 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1104 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0102 = addrspacecast ptr %arg0 to ptr addrspace(1)
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
  %param_5.637 = getelementptr inbounds [120 x [20 x [1 x double]]], ptr addrspace(1) %arg5112, i64 0, i64 %4, i64 %5, i64 0
  %param_4.342 = getelementptr inbounds [20 x [1 x double]], ptr addrspace(1) %arg4110, i64 0, i64 %5, i64 0
  %6 = shl nuw nsw i32 %thread.id.2, 1
  %param_5.638 = load double, ptr addrspace(1) %param_5.637, align 8, !invariant.load !7
  %param_4.343 = load double, ptr addrspace(1) %param_4.342, align 8, !invariant.load !7
  %7 = zext nneg i32 %6 to i64
  %param_2.1725 = getelementptr inbounds [120 x [1 x [20 x [192 x double]]]], ptr addrspace(1) %arg2106, i64 0, i64 %4, i64 0, i64 %5, i64 %7
  %8 = load <2 x double>, ptr addrspace(1) %param_2.1725, align 16, !invariant.load !7
  %param_2.1726138 = extractelement <2 x double> %8, i32 0
  %param_2.1726.1139 = extractelement <2 x double> %8, i32 1
  %param_3.1227 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg3108, i64 0, i64 %5, i64 %7
  %9 = load <2 x double>, ptr addrspace(1) %param_3.1227, align 16, !invariant.load !7
  %param_3.1228144 = extractelement <2 x double> %9, i32 0
  %param_3.1228.1145 = extractelement <2 x double> %9, i32 1
  %multiply.9.329 = fmul double %param_2.1726138, %param_3.1228144
  %param_1.3630 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr addrspace(1) %arg1104, i64 0, i64 0, i64 %5, i64 %7
  %10 = load <2 x double>, ptr addrspace(1) %param_1.3630, align 16, !invariant.load !7
  %param_1.3631150 = extractelement <2 x double> %10, i32 0
  %param_1.3631.1151 = extractelement <2 x double> %10, i32 1
  %param_0.3732 = getelementptr inbounds [120 x [20 x [192 x double]]], ptr addrspace(1) %arg0102, i64 0, i64 %4, i64 %5, i64 %7
  %11 = load <2 x double>, ptr addrspace(1) %param_0.3732, align 16, !invariant.load !7
  %param_0.3733156 = extractelement <2 x double> %11, i32 0
  %param_0.3733.1157 = extractelement <2 x double> %11, i32 1
  %multiply.10.534 = fmul double %param_1.3631150, %param_0.3733156
  %add.4.335 = fadd double %multiply.9.329, %multiply.10.534
  %add.3.i74 = fadd double %add.4.335, 0.000000e+00
  %multiply.11.3.clone.141 = fmul double %param_1.3631150, %param_5.638
  %multiply.12.3.clone.146 = fmul double %param_2.1726138, %param_4.343
  %add.5.1.clone.147 = fadd double %multiply.11.3.clone.141, %multiply.12.3.clone.146
  %12 = getelementptr inbounds [120 x [1 x [20 x [192 x double]]]], ptr addrspace(1) %arg7116, i64 0, i64 %4, i64 0, i64 %5, i64 %7
  %multiply.9.329.1 = fmul double %param_2.1726.1139, %param_3.1228.1145
  %multiply.10.534.1 = fmul double %param_1.3631.1151, %param_0.3733.1157
  %add.4.335.1 = fadd double %multiply.9.329.1, %multiply.10.534.1
  %add.3.i74.1 = fadd double %add.3.i74, %add.4.335.1
  %multiply.11.3.clone.141.1 = fmul double %param_1.3631.1151, %param_5.638
  %multiply.12.3.clone.146.1 = fmul double %param_2.1726.1139, %param_4.343
  %add.5.1.clone.147.1 = fadd double %multiply.11.3.clone.141.1, %multiply.12.3.clone.146.1
  %13 = insertelement <2 x double> poison, double %add.5.1.clone.147, i32 0
  %14 = insertelement <2 x double> %13, double %add.5.1.clone.147.1, i32 1
  store <2 x double> %14, ptr addrspace(1) %12, align 16
  %param_2.1725.181122 = getelementptr inbounds i8, ptr addrspace(1) %param_2.1725, i64 512
  %15 = load <2 x double>, ptr addrspace(1) %param_2.1725.181122, align 16, !invariant.load !7
  %param_2.1726.182140 = extractelement <2 x double> %15, i32 0
  %param_2.1726.1.1141 = extractelement <2 x double> %15, i32 1
  %param_3.1227.183123 = getelementptr inbounds i8, ptr addrspace(1) %param_3.1227, i64 512
  %16 = load <2 x double>, ptr addrspace(1) %param_3.1227.183123, align 16, !invariant.load !7
  %param_3.1228.184146 = extractelement <2 x double> %16, i32 0
  %param_3.1228.1.1147 = extractelement <2 x double> %16, i32 1
  %multiply.9.329.185 = fmul double %param_2.1726.182140, %param_3.1228.184146
  %param_1.3630.186124 = getelementptr inbounds i8, ptr addrspace(1) %param_1.3630, i64 512
  %17 = load <2 x double>, ptr addrspace(1) %param_1.3630.186124, align 16, !invariant.load !7
  %param_1.3631.187152 = extractelement <2 x double> %17, i32 0
  %param_1.3631.1.1153 = extractelement <2 x double> %17, i32 1
  %param_0.3732.188125 = getelementptr inbounds i8, ptr addrspace(1) %param_0.3732, i64 512
  %18 = load <2 x double>, ptr addrspace(1) %param_0.3732.188125, align 16, !invariant.load !7
  %param_0.3733.189158 = extractelement <2 x double> %18, i32 0
  %param_0.3733.1.1159 = extractelement <2 x double> %18, i32 1
  %multiply.10.534.190 = fmul double %param_1.3631.187152, %param_0.3733.189158
  %add.4.335.191 = fadd double %multiply.9.329.185, %multiply.10.534.190
  %add.3.i74.192 = fadd double %add.3.i74.1, %add.4.335.191
  %multiply.11.3.clone.141.193 = fmul double %param_1.3631.187152, %param_5.638
  %multiply.12.3.clone.146.194 = fmul double %param_2.1726.182140, %param_4.343
  %add.5.1.clone.147.195 = fadd double %multiply.11.3.clone.141.193, %multiply.12.3.clone.146.194
  %19 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 512
  %multiply.9.329.1.1 = fmul double %param_2.1726.1.1141, %param_3.1228.1.1147
  %multiply.10.534.1.1 = fmul double %param_1.3631.1.1153, %param_0.3733.1.1159
  %add.4.335.1.1 = fadd double %multiply.9.329.1.1, %multiply.10.534.1.1
  %add.3.i74.1.1 = fadd double %add.3.i74.192, %add.4.335.1.1
  %multiply.11.3.clone.141.1.1 = fmul double %param_1.3631.1.1153, %param_5.638
  %multiply.12.3.clone.146.1.1 = fmul double %param_2.1726.1.1141, %param_4.343
  %add.5.1.clone.147.1.1 = fadd double %multiply.11.3.clone.141.1.1, %multiply.12.3.clone.146.1.1
  %20 = insertelement <2 x double> poison, double %add.5.1.clone.147.195, i32 0
  %21 = insertelement <2 x double> %20, double %add.5.1.clone.147.1.1, i32 1
  store <2 x double> %21, ptr addrspace(1) %19, align 16
  %param_2.1725.2130 = getelementptr inbounds i8, ptr addrspace(1) %param_2.1725, i64 1024
  %22 = load <2 x double>, ptr addrspace(1) %param_2.1725.2130, align 16, !invariant.load !7
  %param_2.1726.2142 = extractelement <2 x double> %22, i32 0
  %param_2.1726.1.2143 = extractelement <2 x double> %22, i32 1
  %param_3.1227.2131 = getelementptr inbounds i8, ptr addrspace(1) %param_3.1227, i64 1024
  %23 = load <2 x double>, ptr addrspace(1) %param_3.1227.2131, align 16, !invariant.load !7
  %param_3.1228.2148 = extractelement <2 x double> %23, i32 0
  %param_3.1228.1.2149 = extractelement <2 x double> %23, i32 1
  %multiply.9.329.2 = fmul double %param_2.1726.2142, %param_3.1228.2148
  %param_1.3630.2132 = getelementptr inbounds i8, ptr addrspace(1) %param_1.3630, i64 1024
  %24 = load <2 x double>, ptr addrspace(1) %param_1.3630.2132, align 16, !invariant.load !7
  %param_1.3631.2154 = extractelement <2 x double> %24, i32 0
  %param_1.3631.1.2155 = extractelement <2 x double> %24, i32 1
  %param_0.3732.2133 = getelementptr inbounds i8, ptr addrspace(1) %param_0.3732, i64 1024
  %25 = load <2 x double>, ptr addrspace(1) %param_0.3732.2133, align 16, !invariant.load !7
  %param_0.3733.2160 = extractelement <2 x double> %25, i32 0
  %param_0.3733.1.2161 = extractelement <2 x double> %25, i32 1
  %multiply.10.534.2 = fmul double %param_1.3631.2154, %param_0.3733.2160
  %add.4.335.2 = fadd double %multiply.9.329.2, %multiply.10.534.2
  %add.3.i74.2 = fadd double %add.3.i74.1.1, %add.4.335.2
  %multiply.11.3.clone.141.2 = fmul double %param_1.3631.2154, %param_5.638
  %multiply.12.3.clone.146.2 = fmul double %param_2.1726.2142, %param_4.343
  %add.5.1.clone.147.2 = fadd double %multiply.11.3.clone.141.2, %multiply.12.3.clone.146.2
  %26 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 1024
  %multiply.9.329.1.2 = fmul double %param_2.1726.1.2143, %param_3.1228.1.2149
  %multiply.10.534.1.2 = fmul double %param_1.3631.1.2155, %param_0.3733.1.2161
  %add.4.335.1.2 = fadd double %multiply.9.329.1.2, %multiply.10.534.1.2
  %add.3.i74.1.2 = fadd double %add.3.i74.2, %add.4.335.1.2
  %multiply.11.3.clone.141.1.2 = fmul double %param_1.3631.1.2155, %param_5.638
  %multiply.12.3.clone.146.1.2 = fmul double %param_2.1726.1.2143, %param_4.343
  %add.5.1.clone.147.1.2 = fadd double %multiply.11.3.clone.141.1.2, %multiply.12.3.clone.146.1.2
  %27 = insertelement <2 x double> poison, double %add.5.1.clone.147.2, i32 0
  %28 = insertelement <2 x double> %27, double %add.5.1.clone.147.1.2, i32 1
  store <2 x double> %28, ptr addrspace(1) %26, align 16
  %29 = bitcast double %add.3.i74.1.2 to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 16, i32 31)
  %32 = insertelement <2 x i32> poison, i32 %31, i64 0
  %33 = extractelement <2 x i32> %29, i64 1
  %34 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %33, i32 16, i32 31)
  %35 = insertelement <2 x i32> %32, i32 %34, i64 1
  %36 = bitcast <2 x i32> %35 to double
  %add.3.i = fadd double %add.3.i74.1.2, %36
  %37 = bitcast double %add.3.i to <2 x i32>
  %38 = extractelement <2 x i32> %37, i64 0
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 8, i32 31)
  %40 = insertelement <2 x i32> poison, i32 %39, i64 0
  %41 = extractelement <2 x i32> %37, i64 1
  %42 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %41, i32 8, i32 31)
  %43 = insertelement <2 x i32> %40, i32 %42, i64 1
  %44 = bitcast <2 x i32> %43 to double
  %add.3.i70 = fadd double %add.3.i, %44
  %45 = bitcast double %add.3.i70 to <2 x i32>
  %46 = extractelement <2 x i32> %45, i64 0
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 4, i32 31)
  %48 = insertelement <2 x i32> poison, i32 %47, i64 0
  %49 = extractelement <2 x i32> %45, i64 1
  %50 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %49, i32 4, i32 31)
  %51 = insertelement <2 x i32> %48, i32 %50, i64 1
  %52 = bitcast <2 x i32> %51 to double
  %add.3.i71 = fadd double %add.3.i70, %52
  %53 = bitcast double %add.3.i71 to <2 x i32>
  %54 = extractelement <2 x i32> %53, i64 0
  %55 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %54, i32 2, i32 31)
  %56 = insertelement <2 x i32> poison, i32 %55, i64 0
  %57 = extractelement <2 x i32> %53, i64 1
  %58 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %57, i32 2, i32 31)
  %59 = insertelement <2 x i32> %56, i32 %58, i64 1
  %60 = bitcast <2 x i32> %59 to double
  %add.3.i72 = fadd double %add.3.i71, %60
  %61 = bitcast double %add.3.i72 to <2 x i32>
  %62 = extractelement <2 x i32> %61, i64 0
  %63 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %62, i32 1, i32 31)
  %64 = extractelement <2 x i32> %61, i64 1
  %65 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 1, i32 31)
  %66 = icmp eq i32 %thread.id.2, 0
  %67 = zext nneg i32 %0 to i64
  %68 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache1, i64 0, i64 %67, i64 0
  %69 = insertelement <2 x i32> poison, i32 %63, i64 0
  %70 = insertelement <2 x i32> %69, i32 %65, i64 1
  %71 = bitcast <2 x i32> %70 to double
  %add.3.i73 = fadd double %add.3.i72, %71
  br i1 %66, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %entry
  %72 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %72, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %entry
  store double %add.3.i73, ptr addrspace(3) %68, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output_element_address = getelementptr inbounds [120 x [20 x double]], ptr addrspace(1) %arg6114, i64 0, i64 %4, i64 %5
  %output.then.val = load double, ptr addrspace(3) %68, align 8
  store double %output.then.val, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

attributes #0 = { norecurse nounwind }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 256}
!2 = !{ptr @input_add_reduce_fusion, !"kernel", i32 1}
!3 = !{ptr @input_add_reduce_fusion, !"reqntidx", i32 256}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 256}
!6 = !{i32 0, i32 3}
!7 = !{}
!8 = !{i32 0, i32 300}
