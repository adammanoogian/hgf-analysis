; ModuleID = 'jit_clip'
source_filename = "jit_clip"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !4
  %4 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !4
  %multiply.2.1 = fmul double %3, %5
  %6 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !4
  %multiply.3.1 = fmul double %multiply.2.1, %7
  %8 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  store double %multiply.3.1, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 768}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 768}
!4 = !{}
