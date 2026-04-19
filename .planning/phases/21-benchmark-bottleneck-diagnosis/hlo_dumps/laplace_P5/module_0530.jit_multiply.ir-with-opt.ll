; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [4 x [1 x double]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [8 x [1 x double]] undef

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg4) local_unnamed_addr #0 {
entry:
  %arg479 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg377 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg275 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg173 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg071 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %param_2.2026 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg275, i64 0, i64 %1, i64 0
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %param_2.2027 = load double, ptr addrspace(1) %param_2.2026, align 8, !invariant.load !6
  %3 = zext nneg i32 %2 to i64
  %param_0.3720 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr addrspace(1) %arg071, i64 0, i64 0, i64 %1, i64 %3
  %4 = load <2 x double>, ptr addrspace(1) %param_0.3720, align 16, !invariant.load !6
  %param_0.372191 = extractelement <2 x double> %4, i32 0
  %param_0.3721.192 = extractelement <2 x double> %4, i32 1
  %param_1.3522 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg173, i64 0, i64 %1, i64 %3
  %5 = load <2 x double>, ptr addrspace(1) %param_1.3522, align 16, !invariant.load !6
  %param_1.352397 = extractelement <2 x double> %5, i32 0
  %param_1.3523.198 = extractelement <2 x double> %5, i32 1
  %multiply.7.324 = fmul double %param_0.372191, %param_1.352397
  %add.3.i57 = fadd double %multiply.7.324, 0.000000e+00
  %multiply.8.1.clone.130 = fmul double %param_0.372191, %param_2.2027
  %6 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr addrspace(1) %arg479, i64 0, i64 0, i64 %1, i64 %3
  %multiply.7.324.1 = fmul double %param_0.3721.192, %param_1.3523.198
  %add.3.i57.1 = fadd double %add.3.i57, %multiply.7.324.1
  %multiply.8.1.clone.130.1 = fmul double %param_0.3721.192, %param_2.2027
  %7 = insertelement <2 x double> poison, double %multiply.8.1.clone.130, i32 0
  %8 = insertelement <2 x double> %7, double %multiply.8.1.clone.130.1, i32 1
  store <2 x double> %8, ptr addrspace(1) %6, align 16
  %param_0.3720.16483 = getelementptr inbounds i8, ptr addrspace(1) %param_0.3720, i64 512
  %9 = load <2 x double>, ptr addrspace(1) %param_0.3720.16483, align 16, !invariant.load !6
  %param_0.3721.16593 = extractelement <2 x double> %9, i32 0
  %param_0.3721.1.194 = extractelement <2 x double> %9, i32 1
  %param_1.3522.16684 = getelementptr inbounds i8, ptr addrspace(1) %param_1.3522, i64 512
  %10 = load <2 x double>, ptr addrspace(1) %param_1.3522.16684, align 16, !invariant.load !6
  %param_1.3523.16799 = extractelement <2 x double> %10, i32 0
  %param_1.3523.1.1100 = extractelement <2 x double> %10, i32 1
  %multiply.7.324.168 = fmul double %param_0.3721.16593, %param_1.3523.16799
  %add.3.i57.169 = fadd double %add.3.i57.1, %multiply.7.324.168
  %multiply.8.1.clone.130.170 = fmul double %param_0.3721.16593, %param_2.2027
  %11 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 512
  %multiply.7.324.1.1 = fmul double %param_0.3721.1.194, %param_1.3523.1.1100
  %add.3.i57.1.1 = fadd double %add.3.i57.169, %multiply.7.324.1.1
  %multiply.8.1.clone.130.1.1 = fmul double %param_0.3721.1.194, %param_2.2027
  %12 = insertelement <2 x double> poison, double %multiply.8.1.clone.130.170, i32 0
  %13 = insertelement <2 x double> %12, double %multiply.8.1.clone.130.1.1, i32 1
  store <2 x double> %13, ptr addrspace(1) %11, align 16
  %param_0.3720.287 = getelementptr inbounds i8, ptr addrspace(1) %param_0.3720, i64 1024
  %14 = load <2 x double>, ptr addrspace(1) %param_0.3720.287, align 16, !invariant.load !6
  %param_0.3721.295 = extractelement <2 x double> %14, i32 0
  %param_0.3721.1.296 = extractelement <2 x double> %14, i32 1
  %param_1.3522.288 = getelementptr inbounds i8, ptr addrspace(1) %param_1.3522, i64 1024
  %15 = load <2 x double>, ptr addrspace(1) %param_1.3522.288, align 16, !invariant.load !6
  %param_1.3523.2101 = extractelement <2 x double> %15, i32 0
  %param_1.3523.1.2102 = extractelement <2 x double> %15, i32 1
  %multiply.7.324.2 = fmul double %param_0.3721.295, %param_1.3523.2101
  %add.3.i57.2 = fadd double %add.3.i57.1.1, %multiply.7.324.2
  %multiply.8.1.clone.130.2 = fmul double %param_0.3721.295, %param_2.2027
  %16 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 1024
  %multiply.7.324.1.2 = fmul double %param_0.3721.1.296, %param_1.3523.1.2102
  %add.3.i57.1.2 = fadd double %add.3.i57.2, %multiply.7.324.1.2
  %multiply.8.1.clone.130.1.2 = fmul double %param_0.3721.1.296, %param_2.2027
  %17 = insertelement <2 x double> poison, double %multiply.8.1.clone.130.2, i32 0
  %18 = insertelement <2 x double> %17, double %multiply.8.1.clone.130.1.2, i32 1
  store <2 x double> %18, ptr addrspace(1) %16, align 16
  %19 = bitcast double %add.3.i57.1.2 to <2 x i32>
  %20 = extractelement <2 x i32> %19, i64 0
  %21 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 16, i32 31)
  %22 = insertelement <2 x i32> poison, i32 %21, i64 0
  %23 = extractelement <2 x i32> %19, i64 1
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 16, i32 31)
  %25 = insertelement <2 x i32> %22, i32 %24, i64 1
  %26 = bitcast <2 x i32> %25 to double
  %add.3.i = fadd double %add.3.i57.1.2, %26
  %27 = bitcast double %add.3.i to <2 x i32>
  %28 = extractelement <2 x i32> %27, i64 0
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 8, i32 31)
  %30 = insertelement <2 x i32> poison, i32 %29, i64 0
  %31 = extractelement <2 x i32> %27, i64 1
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %add.3.i53 = fadd double %add.3.i, %34
  %35 = bitcast double %add.3.i53 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 4, i32 31)
  %38 = insertelement <2 x i32> poison, i32 %37, i64 0
  %39 = extractelement <2 x i32> %35, i64 1
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to double
  %add.3.i54 = fadd double %add.3.i53, %42
  %43 = bitcast double %add.3.i54 to <2 x i32>
  %44 = extractelement <2 x i32> %43, i64 0
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 2, i32 31)
  %46 = insertelement <2 x i32> poison, i32 %45, i64 0
  %47 = extractelement <2 x i32> %43, i64 1
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> %46, i32 %48, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.3.i55 = fadd double %add.3.i54, %50
  %51 = bitcast double %add.3.i55 to <2 x i32>
  %52 = extractelement <2 x i32> %51, i64 0
  %53 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %52, i32 1, i32 31)
  %54 = extractelement <2 x i32> %51, i64 1
  %55 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %54, i32 1, i32 31)
  %56 = icmp eq i32 %thread.id.2, 0
  %57 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %1, i64 0
  %58 = insertelement <2 x i32> poison, i32 %53, i64 0
  %59 = insertelement <2 x i32> %58, i32 %55, i64 1
  %60 = bitcast <2 x i32> %59 to double
  %add.3.i56 = fadd double %add.3.i55, %60
  br i1 %56, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %entry
  %61 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [4 x double], ptr addrspace(1) %arg377, i64 0, i64 %1
  br i1 %61, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %entry
  store double %add.3.i56, ptr addrspace(3) %57, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %57, align 8
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
define void @input_add_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg7) local_unnamed_addr #0 {
entry:
  %arg7110 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6108 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5106 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4104 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3102 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2100 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg198 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg096 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %tile_origin.1 = shl nuw nsw i32 %block.id.x, 3
  %1 = or disjoint i32 %0, %tile_origin.1
  %2 = and i32 %0, 3
  %3 = lshr i32 %1, 2
  %4 = zext nneg i32 %3 to i64
  %5 = zext nneg i32 %2 to i64
  %param_5.637 = getelementptr inbounds [24 x [4 x [1 x double]]], ptr addrspace(1) %arg5106, i64 0, i64 %4, i64 %5, i64 0
  %param_4.342 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg4104, i64 0, i64 %5, i64 0
  %6 = shl nuw nsw i32 %thread.id.2, 1
  %param_5.638 = load double, ptr addrspace(1) %param_5.637, align 8, !invariant.load !6
  %param_4.343 = load double, ptr addrspace(1) %param_4.342, align 8, !invariant.load !6
  %7 = zext nneg i32 %6 to i64
  %param_2.1725 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr addrspace(1) %arg2100, i64 0, i64 %4, i64 0, i64 %5, i64 %7
  %8 = load <2 x double>, ptr addrspace(1) %param_2.1725, align 16, !invariant.load !6
  %param_2.1726132 = extractelement <2 x double> %8, i32 0
  %param_2.1726.1133 = extractelement <2 x double> %8, i32 1
  %param_3.1427 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg3102, i64 0, i64 %5, i64 %7
  %9 = load <2 x double>, ptr addrspace(1) %param_3.1427, align 16, !invariant.load !6
  %param_3.1428138 = extractelement <2 x double> %9, i32 0
  %param_3.1428.1139 = extractelement <2 x double> %9, i32 1
  %multiply.9.329 = fmul double %param_2.1726132, %param_3.1428138
  %param_1.3630 = getelementptr inbounds [1 x [4 x [192 x double]]], ptr addrspace(1) %arg198, i64 0, i64 0, i64 %5, i64 %7
  %10 = load <2 x double>, ptr addrspace(1) %param_1.3630, align 16, !invariant.load !6
  %param_1.3631144 = extractelement <2 x double> %10, i32 0
  %param_1.3631.1145 = extractelement <2 x double> %10, i32 1
  %param_0.3832 = getelementptr inbounds [24 x [4 x [192 x double]]], ptr addrspace(1) %arg096, i64 0, i64 %4, i64 %5, i64 %7
  %11 = load <2 x double>, ptr addrspace(1) %param_0.3832, align 16, !invariant.load !6
  %param_0.3833150 = extractelement <2 x double> %11, i32 0
  %param_0.3833.1151 = extractelement <2 x double> %11, i32 1
  %multiply.10.534 = fmul double %param_1.3631144, %param_0.3833150
  %add.4.335 = fadd double %multiply.9.329, %multiply.10.534
  %add.3.i74 = fadd double %add.4.335, 0.000000e+00
  %multiply.11.3.clone.141 = fmul double %param_1.3631144, %param_5.638
  %multiply.12.3.clone.146 = fmul double %param_2.1726132, %param_4.343
  %add.5.1.clone.147 = fadd double %multiply.11.3.clone.141, %multiply.12.3.clone.146
  %12 = getelementptr inbounds [24 x [1 x [4 x [192 x double]]]], ptr addrspace(1) %arg7110, i64 0, i64 %4, i64 0, i64 %5, i64 %7
  %multiply.9.329.1 = fmul double %param_2.1726.1133, %param_3.1428.1139
  %multiply.10.534.1 = fmul double %param_1.3631.1145, %param_0.3833.1151
  %add.4.335.1 = fadd double %multiply.9.329.1, %multiply.10.534.1
  %add.3.i74.1 = fadd double %add.3.i74, %add.4.335.1
  %multiply.11.3.clone.141.1 = fmul double %param_1.3631.1145, %param_5.638
  %multiply.12.3.clone.146.1 = fmul double %param_2.1726.1133, %param_4.343
  %add.5.1.clone.147.1 = fadd double %multiply.11.3.clone.141.1, %multiply.12.3.clone.146.1
  %13 = insertelement <2 x double> poison, double %add.5.1.clone.147, i32 0
  %14 = insertelement <2 x double> %13, double %add.5.1.clone.147.1, i32 1
  store <2 x double> %14, ptr addrspace(1) %12, align 16
  %param_2.1725.181116 = getelementptr inbounds i8, ptr addrspace(1) %param_2.1725, i64 512
  %15 = load <2 x double>, ptr addrspace(1) %param_2.1725.181116, align 16, !invariant.load !6
  %param_2.1726.182134 = extractelement <2 x double> %15, i32 0
  %param_2.1726.1.1135 = extractelement <2 x double> %15, i32 1
  %param_3.1427.183117 = getelementptr inbounds i8, ptr addrspace(1) %param_3.1427, i64 512
  %16 = load <2 x double>, ptr addrspace(1) %param_3.1427.183117, align 16, !invariant.load !6
  %param_3.1428.184140 = extractelement <2 x double> %16, i32 0
  %param_3.1428.1.1141 = extractelement <2 x double> %16, i32 1
  %multiply.9.329.185 = fmul double %param_2.1726.182134, %param_3.1428.184140
  %param_1.3630.186118 = getelementptr inbounds i8, ptr addrspace(1) %param_1.3630, i64 512
  %17 = load <2 x double>, ptr addrspace(1) %param_1.3630.186118, align 16, !invariant.load !6
  %param_1.3631.187146 = extractelement <2 x double> %17, i32 0
  %param_1.3631.1.1147 = extractelement <2 x double> %17, i32 1
  %param_0.3832.188119 = getelementptr inbounds i8, ptr addrspace(1) %param_0.3832, i64 512
  %18 = load <2 x double>, ptr addrspace(1) %param_0.3832.188119, align 16, !invariant.load !6
  %param_0.3833.189152 = extractelement <2 x double> %18, i32 0
  %param_0.3833.1.1153 = extractelement <2 x double> %18, i32 1
  %multiply.10.534.190 = fmul double %param_1.3631.187146, %param_0.3833.189152
  %add.4.335.191 = fadd double %multiply.9.329.185, %multiply.10.534.190
  %add.3.i74.192 = fadd double %add.3.i74.1, %add.4.335.191
  %multiply.11.3.clone.141.193 = fmul double %param_1.3631.187146, %param_5.638
  %multiply.12.3.clone.146.194 = fmul double %param_2.1726.182134, %param_4.343
  %add.5.1.clone.147.195 = fadd double %multiply.11.3.clone.141.193, %multiply.12.3.clone.146.194
  %19 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 512
  %multiply.9.329.1.1 = fmul double %param_2.1726.1.1135, %param_3.1428.1.1141
  %multiply.10.534.1.1 = fmul double %param_1.3631.1.1147, %param_0.3833.1.1153
  %add.4.335.1.1 = fadd double %multiply.9.329.1.1, %multiply.10.534.1.1
  %add.3.i74.1.1 = fadd double %add.3.i74.192, %add.4.335.1.1
  %multiply.11.3.clone.141.1.1 = fmul double %param_1.3631.1.1147, %param_5.638
  %multiply.12.3.clone.146.1.1 = fmul double %param_2.1726.1.1135, %param_4.343
  %add.5.1.clone.147.1.1 = fadd double %multiply.11.3.clone.141.1.1, %multiply.12.3.clone.146.1.1
  %20 = insertelement <2 x double> poison, double %add.5.1.clone.147.195, i32 0
  %21 = insertelement <2 x double> %20, double %add.5.1.clone.147.1.1, i32 1
  store <2 x double> %21, ptr addrspace(1) %19, align 16
  %param_2.1725.2124 = getelementptr inbounds i8, ptr addrspace(1) %param_2.1725, i64 1024
  %22 = load <2 x double>, ptr addrspace(1) %param_2.1725.2124, align 16, !invariant.load !6
  %param_2.1726.2136 = extractelement <2 x double> %22, i32 0
  %param_2.1726.1.2137 = extractelement <2 x double> %22, i32 1
  %param_3.1427.2125 = getelementptr inbounds i8, ptr addrspace(1) %param_3.1427, i64 1024
  %23 = load <2 x double>, ptr addrspace(1) %param_3.1427.2125, align 16, !invariant.load !6
  %param_3.1428.2142 = extractelement <2 x double> %23, i32 0
  %param_3.1428.1.2143 = extractelement <2 x double> %23, i32 1
  %multiply.9.329.2 = fmul double %param_2.1726.2136, %param_3.1428.2142
  %param_1.3630.2126 = getelementptr inbounds i8, ptr addrspace(1) %param_1.3630, i64 1024
  %24 = load <2 x double>, ptr addrspace(1) %param_1.3630.2126, align 16, !invariant.load !6
  %param_1.3631.2148 = extractelement <2 x double> %24, i32 0
  %param_1.3631.1.2149 = extractelement <2 x double> %24, i32 1
  %param_0.3832.2127 = getelementptr inbounds i8, ptr addrspace(1) %param_0.3832, i64 1024
  %25 = load <2 x double>, ptr addrspace(1) %param_0.3832.2127, align 16, !invariant.load !6
  %param_0.3833.2154 = extractelement <2 x double> %25, i32 0
  %param_0.3833.1.2155 = extractelement <2 x double> %25, i32 1
  %multiply.10.534.2 = fmul double %param_1.3631.2148, %param_0.3833.2154
  %add.4.335.2 = fadd double %multiply.9.329.2, %multiply.10.534.2
  %add.3.i74.2 = fadd double %add.3.i74.1.1, %add.4.335.2
  %multiply.11.3.clone.141.2 = fmul double %param_1.3631.2148, %param_5.638
  %multiply.12.3.clone.146.2 = fmul double %param_2.1726.2136, %param_4.343
  %add.5.1.clone.147.2 = fadd double %multiply.11.3.clone.141.2, %multiply.12.3.clone.146.2
  %26 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 1024
  %multiply.9.329.1.2 = fmul double %param_2.1726.1.2137, %param_3.1428.1.2143
  %multiply.10.534.1.2 = fmul double %param_1.3631.1.2149, %param_0.3833.1.2155
  %add.4.335.1.2 = fadd double %multiply.9.329.1.2, %multiply.10.534.1.2
  %add.3.i74.1.2 = fadd double %add.3.i74.2, %add.4.335.1.2
  %multiply.11.3.clone.141.1.2 = fmul double %param_1.3631.1.2149, %param_5.638
  %multiply.12.3.clone.146.1.2 = fmul double %param_2.1726.1.2137, %param_4.343
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
  %output_element_address = getelementptr inbounds [24 x [4 x double]], ptr addrspace(1) %arg6108, i64 0, i64 %4, i64 %5
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
!1 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 128}
!2 = !{ptr @input_add_reduce_fusion, !"kernel", i32 1}
!3 = !{ptr @input_add_reduce_fusion, !"reqntidx", i32 256}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 128}
!6 = !{}
!7 = !{i32 0, i32 256}
!8 = !{i32 0, i32 12}
