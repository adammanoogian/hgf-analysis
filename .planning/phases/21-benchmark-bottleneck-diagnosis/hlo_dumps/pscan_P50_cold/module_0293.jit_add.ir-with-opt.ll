; ModuleID = 'jit_add'
source_filename = "jit_add"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [8 x [1 x double]] undef

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg1) local_unnamed_addr #0 {
entry:
  %arg157 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg055 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %tile_origin.1 = shl nuw nsw i32 %block.id.x, 3
  %1 = or disjoint i32 %0, %tile_origin.1
  %2 = zext nneg i32 %1 to i64
  %3 = shl nuw nsw i32 %thread.id.2, 1
  %4 = zext nneg i32 %3 to i64
  %param_016 = getelementptr inbounds [48 x [192 x double]], ptr addrspace(1) %arg055, i64 0, i64 %2, i64 %4
  %5 = load <2 x double>, ptr addrspace(1) %param_016, align 16, !invariant.load !5
  %param_01764 = extractelement <2 x double> %5, i32 0
  %param_017.165 = extractelement <2 x double> %5, i32 1
  %add.1.i45 = fadd double %param_01764, 0.000000e+00
  %add.1.i45.1 = fadd double %add.1.i45, %param_017.165
  %param_016.15260 = getelementptr inbounds i8, ptr addrspace(1) %param_016, i64 512
  %6 = load <2 x double>, ptr addrspace(1) %param_016.15260, align 16, !invariant.load !5
  %param_017.15366 = extractelement <2 x double> %6, i32 0
  %param_017.1.167 = extractelement <2 x double> %6, i32 1
  %add.1.i45.154 = fadd double %add.1.i45.1, %param_017.15366
  %add.1.i45.1.1 = fadd double %add.1.i45.154, %param_017.1.167
  %param_016.262 = getelementptr inbounds i8, ptr addrspace(1) %param_016, i64 1024
  %7 = load <2 x double>, ptr addrspace(1) %param_016.262, align 16, !invariant.load !5
  %param_017.268 = extractelement <2 x double> %7, i32 0
  %param_017.1.269 = extractelement <2 x double> %7, i32 1
  %add.1.i45.2 = fadd double %add.1.i45.1.1, %param_017.268
  %add.1.i45.1.2 = fadd double %add.1.i45.2, %param_017.1.269
  %8 = bitcast double %add.1.i45.1.2 to <2 x i32>
  %9 = extractelement <2 x i32> %8, i64 0
  %10 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %9, i32 16, i32 31)
  %11 = insertelement <2 x i32> poison, i32 %10, i64 0
  %12 = extractelement <2 x i32> %8, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 16, i32 31)
  %14 = insertelement <2 x i32> %11, i32 %13, i64 1
  %15 = bitcast <2 x i32> %14 to double
  %add.1.i = fadd double %add.1.i45.1.2, %15
  %16 = bitcast double %add.1.i to <2 x i32>
  %17 = extractelement <2 x i32> %16, i64 0
  %18 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 8, i32 31)
  %19 = insertelement <2 x i32> poison, i32 %18, i64 0
  %20 = extractelement <2 x i32> %16, i64 1
  %21 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 8, i32 31)
  %22 = insertelement <2 x i32> %19, i32 %21, i64 1
  %23 = bitcast <2 x i32> %22 to double
  %add.1.i41 = fadd double %add.1.i, %23
  %24 = bitcast double %add.1.i41 to <2 x i32>
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 4, i32 31)
  %27 = insertelement <2 x i32> poison, i32 %26, i64 0
  %28 = extractelement <2 x i32> %24, i64 1
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 4, i32 31)
  %30 = insertelement <2 x i32> %27, i32 %29, i64 1
  %31 = bitcast <2 x i32> %30 to double
  %add.1.i42 = fadd double %add.1.i41, %31
  %32 = bitcast double %add.1.i42 to <2 x i32>
  %33 = extractelement <2 x i32> %32, i64 0
  %34 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %33, i32 2, i32 31)
  %35 = insertelement <2 x i32> poison, i32 %34, i64 0
  %36 = extractelement <2 x i32> %32, i64 1
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 2, i32 31)
  %38 = insertelement <2 x i32> %35, i32 %37, i64 1
  %39 = bitcast <2 x i32> %38 to double
  %add.1.i43 = fadd double %add.1.i42, %39
  %40 = bitcast double %add.1.i43 to <2 x i32>
  %41 = extractelement <2 x i32> %40, i64 0
  %42 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %41, i32 1, i32 31)
  %43 = extractelement <2 x i32> %40, i64 1
  %44 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %43, i32 1, i32 31)
  %45 = icmp eq i32 %thread.id.2, 0
  %46 = zext nneg i32 %0 to i64
  %47 = getelementptr inbounds [8 x [1 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %46, i64 0
  %48 = insertelement <2 x i32> poison, i32 %42, i64 0
  %49 = insertelement <2 x i32> %48, i32 %44, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.1.i44 = fadd double %add.1.i43, %50
  br i1 %45, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %entry
  %51 = icmp eq i32 %thread.id.2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [48 x double], ptr addrspace(1) %arg157, i64 0, i64 %2
  br i1 %51, label %reduction_write_output-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %entry
  store double %add.1.i44, ptr addrspace(3) %47, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %47, align 8
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

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 256}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 256}
!4 = !{i32 0, i32 6}
!5 = !{}
