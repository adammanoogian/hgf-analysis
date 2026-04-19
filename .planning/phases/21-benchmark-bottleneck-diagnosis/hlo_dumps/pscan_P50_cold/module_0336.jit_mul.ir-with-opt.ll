; ModuleID = 'jit_mul'
source_filename = "jit_mul"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_multiply(ptr noalias nocapture readonly align 16 dereferenceable(384) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(384) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(384) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !4
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !4
  %multiply.1.1 = fmul double %3, %5
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  store double %multiply.1.1, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_multiply, !"kernel", i32 1}
!1 = !{ptr @wrapped_multiply, !"reqntidx", i32 48}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 48}
!4 = !{}
