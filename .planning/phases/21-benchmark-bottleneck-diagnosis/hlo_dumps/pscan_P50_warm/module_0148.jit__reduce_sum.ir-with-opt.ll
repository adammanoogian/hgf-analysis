; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@"shared_cache_$_0" = internal unnamed_addr addrspace(3) global double undef

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(384) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg141 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg039 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %0 = zext nneg i32 %thread.id.x to i64
  %param_08 = getelementptr inbounds [48 x double], ptr addrspace(1) %arg039, i64 0, i64 %0
  %param_09 = load double, ptr addrspace(1) %param_08, align 8, !invariant.load !4
  %add.1.i36 = fadd double %param_09, 0.000000e+00
  %1 = or disjoint i32 %thread.id.x, 32
  %2 = icmp ult i32 %1, 48
  br i1 %2, label %x_in_tile-true.1, label %x_in_tile-after.15

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true.then
  ret void

x_in_tile-true.1:                                 ; preds = %entry
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %param_08, i64 256
  %param_09.1 = load double, ptr addrspace(1) %sunkaddr, align 8, !invariant.load !4
  %add.1.i36.1 = fadd double %add.1.i36, %param_09.1
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.1, %entry
  %partial_reduction_result.1.1 = phi double [ %add.1.i36.1, %x_in_tile-true.1 ], [ %add.1.i36, %entry ]
  %3 = bitcast double %partial_reduction_result.1.1 to <2 x i32>
  %4 = extractelement <2 x i32> %3, i64 0
  %5 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %4, i32 16, i32 31)
  %6 = insertelement <2 x i32> poison, i32 %5, i64 0
  %7 = extractelement <2 x i32> %3, i64 1
  %8 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %7, i32 16, i32 31)
  %9 = insertelement <2 x i32> %6, i32 %8, i64 1
  %10 = bitcast <2 x i32> %9 to double
  %add.1.i = fadd double %partial_reduction_result.1.1, %10
  %11 = bitcast double %add.1.i to <2 x i32>
  %12 = extractelement <2 x i32> %11, i64 0
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 8, i32 31)
  %14 = insertelement <2 x i32> poison, i32 %13, i64 0
  %15 = extractelement <2 x i32> %11, i64 1
  %16 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 8, i32 31)
  %17 = insertelement <2 x i32> %14, i32 %16, i64 1
  %18 = bitcast <2 x i32> %17 to double
  %add.1.i32 = fadd double %add.1.i, %18
  %19 = bitcast double %add.1.i32 to <2 x i32>
  %20 = extractelement <2 x i32> %19, i64 0
  %21 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 4, i32 31)
  %22 = insertelement <2 x i32> poison, i32 %21, i64 0
  %23 = extractelement <2 x i32> %19, i64 1
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 4, i32 31)
  %25 = insertelement <2 x i32> %22, i32 %24, i64 1
  %26 = bitcast <2 x i32> %25 to double
  %add.1.i33 = fadd double %add.1.i32, %26
  %27 = bitcast double %add.1.i33 to <2 x i32>
  %28 = extractelement <2 x i32> %27, i64 0
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 2, i32 31)
  %30 = insertelement <2 x i32> poison, i32 %29, i64 0
  %31 = extractelement <2 x i32> %27, i64 1
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 2, i32 31)
  %33 = insertelement <2 x i32> %30, i32 %32, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %add.1.i34 = fadd double %add.1.i33, %34
  %35 = bitcast double %add.1.i34 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 1, i32 31)
  %38 = extractelement <2 x i32> %35, i64 1
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 1, i32 31)
  %40 = icmp eq i32 %thread.id.x, 0
  %41 = insertelement <2 x i32> poison, i32 %37, i64 0
  %42 = insertelement <2 x i32> %41, i32 %39, i64 1
  %43 = bitcast <2 x i32> %42 to double
  %add.1.i35 = fadd double %add.1.i34, %43
  br i1 %40, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %44 = icmp eq i32 %thread.id.x, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %44, label %reduction_write_output-true.then, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store double %add.1.i35, ptr addrspace(3) @"shared_cache_$_0", align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true.then:                 ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) @"shared_cache_$_0", align 8
  store double %output.then.val, ptr addrspace(1) %arg141, align 128
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

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 32}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 32}
!4 = !{}
