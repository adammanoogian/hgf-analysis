; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(32) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %0 = icmp ult i32 %thread.id.x, 4
  %1 = zext nneg i32 %thread.id.x to i64
  %param_0 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg015, i64 0, i64 %1
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %add.1.i14, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %2 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %3 = extractelement <2 x i32> %2, i64 0
  %4 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %3, i32 2, i32 31)
  %5 = insertelement <2 x i32> poison, i32 %4, i64 0
  %6 = extractelement <2 x i32> %2, i64 1
  %7 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %6, i32 2, i32 31)
  %8 = insertelement <2 x i32> %5, i32 %7, i64 1
  %9 = bitcast <2 x i32> %8 to double
  %add.1.i = fadd double %partial_reduction_result.0, %9
  %10 = bitcast double %add.1.i to <2 x i32>
  %11 = extractelement <2 x i32> %10, i64 0
  %12 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %11, i32 1, i32 31)
  %13 = extractelement <2 x i32> %10, i64 1
  %14 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %15 = insertelement <2 x i32> poison, i32 %12, i64 0
  %16 = insertelement <2 x i32> %15, i32 %14, i64 1
  %17 = bitcast <2 x i32> %16 to double
  %add.1.i13 = fadd double %add.1.i, %17
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %param_02 = load double, ptr addrspace(1) %param_0, align 8, !invariant.load !4
  %add.1.i14 = fadd double %param_02, 0.000000e+00
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.1.i13, ptr addrspace(1) %arg117, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #2

attributes #0 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 32}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 32}
!4 = !{}
