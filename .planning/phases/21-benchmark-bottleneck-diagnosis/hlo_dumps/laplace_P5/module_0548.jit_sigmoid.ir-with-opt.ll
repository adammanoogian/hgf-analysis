; ModuleID = 'jit_sigmoid'
source_filename = "jit_sigmoid"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg01, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !7
  %6 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !7
  %multiply.4.1 = fmul double %5, %7
  %8 = getelementptr double, ptr addrspace(1) %arg25, i64 %3
  store double %multiply.4.1, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg01, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !7
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %6 = urem i16 %.lhs.trunc, 768
  %7 = zext nneg i16 %6 to i64
  %8 = getelementptr inbounds double, ptr addrspace(1) %arg37, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !7
  %multiply.5.1 = fmul double %5, %9
  %10 = getelementptr inbounds double, ptr addrspace(1) %arg25, i64 %7
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !7
  %12 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !7
  %multiply.6.3 = fmul double %11, %13
  %add.1.1 = fadd double %multiply.5.1, %multiply.6.3
  %14 = getelementptr double, ptr addrspace(1) %arg49, i64 %3
  store double %add.1.1, ptr addrspace(1) %14, align 8
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!2 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 6}
!6 = !{i32 0, i32 128}
!7 = !{}
!8 = !{i32 0, i32 144}
