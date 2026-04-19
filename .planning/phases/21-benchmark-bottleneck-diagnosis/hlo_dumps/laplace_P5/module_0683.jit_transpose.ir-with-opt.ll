; ModuleID = 'jit_transpose'
source_filename = "jit_transpose"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@tr_tile_0 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x double]]] undef

; Function Attrs: norecurse nounwind
define void @wrapped_transpose(ptr noalias nocapture readonly align 16 dereferenceable(4608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4608) %arg1) local_unnamed_addr #0 {
entry:
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext i32 %thread.id.2 to i64
  %2 = add nuw nsw i32 %0, -4
  %3 = zext nneg i32 %thread.id.x to i64
  %4 = lshr i64 %3, 5
  %5 = mul nuw nsw i64 %4, 192
  %6 = shl nuw nsw i64 %1, 3
  %7 = add i64 %5, %6
  %scevgep30 = getelementptr i8, ptr addrspace(1) %arg019, i64 %7
  %8 = mul nuw nsw i64 %4, 264
  %9 = add i64 %8, %6
  %scevgep33 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %9
  br label %loop1.loop_body

loop1.loop_header.loopexit:                       ; preds = %loop2.loop_body.lr.ph, %loop1.loop_body
  %lsr.iv.next29 = add nsw i32 %lsr.iv28, 4
  %scevgep32 = getelementptr i8, ptr addrspace(1) %lsr.iv31, i64 768
  %scevgep35 = getelementptr i8, ptr addrspace(3) %lsr.iv34, i64 1056
  %10 = icmp ugt i32 %lsr.iv.next29, 19
  br i1 %10, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !4

loop1.loop_body:                                  ; preds = %entry, %loop1.loop_header.loopexit
  %lsr.iv34 = phi ptr addrspace(3) [ %scevgep33, %entry ], [ %scevgep35, %loop1.loop_header.loopexit ]
  %lsr.iv31 = phi ptr addrspace(1) [ %scevgep30, %entry ], [ %scevgep32, %loop1.loop_header.loopexit ]
  %lsr.iv28 = phi i32 [ %2, %entry ], [ %lsr.iv.next29, %loop1.loop_header.loopexit ]
  %11 = trunc i64 %1 to i32
  %12 = icmp ugt i32 %11, 23
  br i1 %12, label %loop1.loop_header.loopexit, label %loop2.loop_body.lr.ph

loop2.loop_body.lr.ph:                            ; preds = %loop1.loop_body
  %param_02 = load double, ptr addrspace(1) %lsr.iv31, align 8, !invariant.load !6
  store double %param_02, ptr addrspace(3) %lsr.iv34, align 8
  br label %loop1.loop_header.loopexit

loop1.loop_exit:                                  ; preds = %loop1.loop_header.loopexit
  tail call void @llvm.nvvm.barrier0()
  %scevgep = getelementptr i8, ptr addrspace(1) %arg121, i64 %7
  %13 = mul nuw nsw i64 %1, 264
  %14 = shl nuw nsw i64 %4, 3
  %15 = add i64 %13, %14
  %scevgep25 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %15
  br label %loop1.loop_body5

loop1.loop_header4.loopexit:                      ; preds = %loop2.loop_body11.lr.ph, %loop1.loop_body5
  %lsr.iv.next = add nsw i32 %lsr.iv, 4
  %scevgep24 = getelementptr i8, ptr addrspace(1) %lsr.iv23, i64 768
  %scevgep27 = getelementptr i8, ptr addrspace(3) %lsr.iv26, i64 32
  %16 = icmp ugt i32 %lsr.iv.next, 19
  br i1 %16, label %loop1.loop_exit3, label %loop1.loop_body5, !llvm.loop !7

loop1.loop_body5:                                 ; preds = %loop1.loop_exit, %loop1.loop_header4.loopexit
  %lsr.iv26 = phi ptr addrspace(3) [ %scevgep25, %loop1.loop_exit ], [ %scevgep27, %loop1.loop_header4.loopexit ]
  %lsr.iv23 = phi ptr addrspace(1) [ %scevgep, %loop1.loop_exit ], [ %scevgep24, %loop1.loop_header4.loopexit ]
  %lsr.iv = phi i32 [ %2, %loop1.loop_exit ], [ %lsr.iv.next, %loop1.loop_header4.loopexit ]
  %17 = trunc i64 %1 to i32
  %18 = icmp ugt i32 %17, 23
  br i1 %18, label %loop1.loop_header4.loopexit, label %loop2.loop_body11.lr.ph

loop2.loop_body11.lr.ph:                          ; preds = %loop1.loop_body5
  %19 = load double, ptr addrspace(3) %lsr.iv26, align 8
  store double %19, ptr addrspace(1) %lsr.iv23, align 8
  br label %loop1.loop_header4.loopexit

loop1.loop_exit3:                                 ; preds = %loop1.loop_header4.loopexit
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

attributes #0 = { norecurse nounwind }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!1 = !{ptr @wrapped_transpose, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 128}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.vectorize.enable", i1 false}
!6 = !{}
!7 = distinct !{!7, !5}
