; ModuleID = 'jit_log_softmax'
source_filename = "jit_log_softmax"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg1) local_unnamed_addr #0 {
entry:
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %0 = lshr i32 %thread.id.x, 1
  %thread.id.2 = and i32 %thread.id.x, 1
  %tile_origin.1 = shl nuw nsw i32 %block.id.x, 7
  %1 = zext nneg i32 %thread.id.2 to i64
  %2 = or disjoint i32 %0, %tile_origin.1
  %.lhs.trunc = trunc nuw nsw i32 %2 to i16
  %3 = urem i16 %.lhs.trunc, 192
  %4 = udiv i16 %.lhs.trunc, 192
  %5 = zext nneg i16 %4 to i64
  %6 = zext nneg i16 %3 to i64
  %param_0.10 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr addrspace(1) %arg019, i64 0, i64 %5, i64 %6, i64 %1
  %param_0.102 = load double, ptr addrspace(1) %param_0.10, align 8, !invariant.load !7
  %add.2.i = fadd double %param_0.102, 0.000000e+00
  %7 = bitcast double %add.2.i to <2 x i32>
  %8 = extractelement <2 x i32> %7, i64 0
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 1, i32 31)
  %10 = extractelement <2 x i32> %7, i64 1
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = icmp eq i32 %thread.id.2, 0
  br i1 %12, label %reduction_write_output-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %entry
  ret void

reduction_write_output-true:                      ; preds = %entry
  %13 = insertelement <2 x i32> poison, i32 %9, i64 0
  %14 = insertelement <2 x i32> %13, i32 %11, i64 1
  %15 = bitcast <2 x i32> %14 to double
  %add.2.i10 = fadd double %add.2.i, %15
  %output_element_address = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg121, i64 0, i64 %5, i64 %6
  %16 = fneg double %add.2.i10
  store double %16, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg4) local_unnamed_addr #3 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !9
  %linear_index = or disjoint i32 %1, %2
  %3 = lshr i32 %linear_index, 1
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !7
  %7 = zext nneg i32 %3 to i64
  %8 = getelementptr inbounds double, ptr addrspace(1) %arg37, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !7
  %10 = getelementptr inbounds double, ptr addrspace(1) %arg25, i64 %7
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !7
  %divide.1.3 = fdiv double %9, %11
  %12 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !7
  %multiply.1.3 = fmul double %divide.1.3, %13
  %add.3.1 = fadd double %6, %multiply.1.3
  %14 = getelementptr double, ptr addrspace(1) %arg49, i64 %4
  store double %add.3.1, ptr addrspace(1) %14, align 8
  ret void
}

attributes #0 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 256}
!2 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 256}
!6 = !{i32 0, i32 30}
!7 = !{}
!8 = !{i32 0, i32 60}
!9 = !{i32 0, i32 128}
