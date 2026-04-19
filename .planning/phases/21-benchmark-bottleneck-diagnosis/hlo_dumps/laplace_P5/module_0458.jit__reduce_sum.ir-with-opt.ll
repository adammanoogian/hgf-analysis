; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [4 x [1 x double]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [8 x [1 x double]] undef

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #0 {
entry:
  %arg157 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg055 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext nneg i32 %0 to i64
  %2 = shl nuw nsw i32 %thread.id.2, 1
  %3 = zext nneg i32 %2 to i64
  %param_016 = getelementptr inbounds [4 x [192 x double]], ptr addrspace(1) %arg055, i64 0, i64 %1, i64 %3
  %4 = load <2 x double>, ptr addrspace(1) %param_016, align 16, !invariant.load !6
  %param_01764 = extractelement <2 x double> %4, i32 0
  %param_017.165 = extractelement <2 x double> %4, i32 1
  %add.1.i45 = fadd double %param_01764, 0.000000e+00
  %add.1.i45.1 = fadd double %add.1.i45, %param_017.165
  %param_016.15260 = getelementptr inbounds i8, ptr addrspace(1) %param_016, i64 512
  %5 = load <2 x double>, ptr addrspace(1) %param_016.15260, align 16, !invariant.load !6
  %param_017.15366 = extractelement <2 x double> %5, i32 0
  %param_017.1.167 = extractelement <2 x double> %5, i32 1
  %add.1.i45.154 = fadd double %add.1.i45.1, %param_017.15366
  %add.1.i45.1.1 = fadd double %add.1.i45.154, %param_017.1.167
  %param_016.262 = getelementptr inbounds i8, ptr addrspace(1) %param_016, i64 1024
  %6 = load <2 x double>, ptr addrspace(1) %param_016.262, align 16, !invariant.load !6
  %param_017.268 = extractelement <2 x double> %6, i32 0
  %param_017.1.269 = extractelement <2 x double> %6, i32 1
  %add.1.i45.2 = fadd double %add.1.i45.1.1, %param_017.268
  %add.1.i45.1.2 = fadd double %add.1.i45.2, %param_017.1.269
  %7 = bitcast double %add.1.i45.1.2 to <2 x i32>
  %8 = extractelement <2 x i32> %7, i64 0
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 16, i32 31)
  %10 = insertelement <2 x i32> poison, i32 %9, i64 0
  %11 = extractelement <2 x i32> %7, i64 1
  %12 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %11, i32 16, i32 31)
  %13 = insertelement <2 x i32> %10, i32 %12, i64 1
  %14 = bitcast <2 x i32> %13 to double
  %add.1.i = fadd double %add.1.i45.1.2, %14
  %15 = bitcast double %add.1.i to <2 x i32>
  %16 = extractelement <2 x i32> %15, i64 0
  %17 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %16, i32 8, i32 31)
  %18 = insertelement <2 x i32> poison, i32 %17, i64 0
  %19 = extractelement <2 x i32> %15, i64 1
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 8, i32 31)
  %21 = insertelement <2 x i32> %18, i32 %20, i64 1
  %22 = bitcast <2 x i32> %21 to double
  %add.1.i41 = fadd double %add.1.i, %22
  %23 = bitcast double %add.1.i41 to <2 x i32>
  %24 = extractelement <2 x i32> %23, i64 0
  %25 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %24, i32 4, i32 31)
  %26 = insertelement <2 x i32> poison, i32 %25, i64 0
  %27 = extractelement <2 x i32> %23, i64 1
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 4, i32 31)
  %29 = insertelement <2 x i32> %26, i32 %28, i64 1
  %30 = bitcast <2 x i32> %29 to double
  %add.1.i42 = fadd double %add.1.i41, %30
  %31 = bitcast double %add.1.i42 to <2 x i32>
  %32 = extractelement <2 x i32> %31, i64 0
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 2, i32 31)
  %34 = insertelement <2 x i32> poison, i32 %33, i64 0
  %35 = extractelement <2 x i32> %31, i64 1
  %36 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %35, i32 2, i32 31)
  %37 = insertelement <2 x i32> %34, i32 %36, i64 1
  %38 = bitcast <2 x i32> %37 to double
  %add.1.i43 = fadd double %add.1.i42, %38
  %39 = bitcast double %add.1.i43 to <2 x i32>
  %40 = extractelement <2 x i32> %39, i64 0
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 1, i32 31)
  %42 = extractelement <2 x i32> %39, i64 1
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 1, i32 31)
  %44 = icmp eq i32 %thread.id.2, 0
  %45 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %1, i64 0
  %46 = insertelement <2 x i32> poison, i32 %41, i64 0
  %47 = insertelement <2 x i32> %46, i32 %43, i64 1
  %48 = bitcast <2 x i32> %47 to double
  %add.1.i44 = fadd double %add.1.i43, %48
  br i1 %44, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %entry
  %49 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [4 x double], ptr addrspace(1) %arg157, i64 0, i64 %1
  br i1 %49, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %entry
  store double %add.1.i44, ptr addrspace(3) %45, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %45, align 8
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
define void @input_reduce_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg1) local_unnamed_addr #0 {
entry:
  %arg157 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg055 = addrspacecast ptr %arg0 to ptr addrspace(1)
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
  %6 = shl nuw nsw i32 %thread.id.2, 1
  %7 = zext nneg i32 %6 to i64
  %param_0.116 = getelementptr inbounds [24 x [4 x [192 x double]]], ptr addrspace(1) %arg055, i64 0, i64 %4, i64 %5, i64 %7
  %8 = load <2 x double>, ptr addrspace(1) %param_0.116, align 16, !invariant.load !6
  %param_0.11764 = extractelement <2 x double> %8, i32 0
  %param_0.117.165 = extractelement <2 x double> %8, i32 1
  %add.1.i45 = fadd double %param_0.11764, 0.000000e+00
  %add.1.i45.1 = fadd double %add.1.i45, %param_0.117.165
  %param_0.116.15260 = getelementptr inbounds i8, ptr addrspace(1) %param_0.116, i64 512
  %9 = load <2 x double>, ptr addrspace(1) %param_0.116.15260, align 16, !invariant.load !6
  %param_0.117.15366 = extractelement <2 x double> %9, i32 0
  %param_0.117.1.167 = extractelement <2 x double> %9, i32 1
  %add.1.i45.154 = fadd double %add.1.i45.1, %param_0.117.15366
  %add.1.i45.1.1 = fadd double %add.1.i45.154, %param_0.117.1.167
  %param_0.116.262 = getelementptr inbounds i8, ptr addrspace(1) %param_0.116, i64 1024
  %10 = load <2 x double>, ptr addrspace(1) %param_0.116.262, align 16, !invariant.load !6
  %param_0.117.268 = extractelement <2 x double> %10, i32 0
  %param_0.117.1.269 = extractelement <2 x double> %10, i32 1
  %add.1.i45.2 = fadd double %add.1.i45.1.1, %param_0.117.268
  %add.1.i45.1.2 = fadd double %add.1.i45.2, %param_0.117.1.269
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
  %output_element_address = getelementptr inbounds [24 x [4 x double]], ptr addrspace(1) %arg157, i64 0, i64 %4, i64 %5
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

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 128}
!2 = !{ptr @input_reduce_fusion_1, !"kernel", i32 1}
!3 = !{ptr @input_reduce_fusion_1, !"reqntidx", i32 256}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 128}
!6 = !{}
!7 = !{i32 0, i32 256}
!8 = !{i32 0, i32 12}
