; ModuleID = 'jit_transpose'
source_filename = "jit_transpose"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@tr_tile_0 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x double]]] undef

; Function Attrs: norecurse nounwind
define void @wrapped_transpose(ptr noalias nocapture readonly align 16 dereferenceable(115200) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(115200) %arg1) local_unnamed_addr #0 {
entry:
  %arg128 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg026 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = and i32 %block.id.x, 3
  %2 = lshr i32 %block.id.x, 2
  %3 = icmp eq i32 %2, 3
  %tile_bound.1 = select i1 %3, i32 24, i32 32
  %4 = icmp eq i32 %1, 3
  %tile_bound.2 = select i1 %4, i32 24, i32 32
  %tile_origin.1 = shl i32 %2, 5
  %tile_origin.2 = shl i32 %1, 5
  %5 = zext i32 %thread.id.2 to i64
  %6 = add i32 %0, %tile_origin.1
  %7 = zext nneg i32 %6 to i64
  %8 = mul nuw nsw i64 %7, 960
  %9 = add i32 %tile_origin.2, %thread.id.2
  %10 = zext nneg i32 %9 to i64
  %11 = shl nuw nsw i64 %10, 3
  %12 = add i64 %8, %11
  %scevgep34 = getelementptr i8, ptr addrspace(1) %arg026, i64 %12
  %13 = zext nneg i32 %thread.id.x to i64
  %14 = lshr i64 %13, 5
  %15 = mul nuw nsw i64 %14, 264
  %16 = shl nuw nsw i64 %5, 3
  %17 = add i64 %15, %16
  %scevgep37 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %17
  br label %loop1.loop_body

loop1.loop_header.loopexit:                       ; preds = %loop2.loop_body.lr.ph, %loop1.loop_body
  %scevgep36 = getelementptr i8, ptr addrspace(1) %lsr.iv35, i64 3840
  %scevgep39 = getelementptr i8, ptr addrspace(3) %lsr.iv38, i64 1056
  %.not = icmp ult i32 %invar.inc, %tile_bound.1
  br i1 %.not, label %loop1.loop_body, label %loop1.loop_exit, !llvm.loop !5

loop1.loop_body:                                  ; preds = %entry, %loop1.loop_header.loopexit
  %lsr.iv38 = phi ptr addrspace(3) [ %scevgep37, %entry ], [ %scevgep39, %loop1.loop_header.loopexit ]
  %lsr.iv35 = phi ptr addrspace(1) [ %scevgep34, %entry ], [ %scevgep36, %loop1.loop_header.loopexit ]
  %loop1.invar_address.021 = phi i32 [ %0, %entry ], [ %invar.inc, %loop1.loop_header.loopexit ]
  %18 = trunc i64 %5 to i32
  %19 = icmp ult i32 %18, %tile_bound.2
  %invar.inc = add nuw nsw i32 %loop1.invar_address.021, 4
  br i1 %19, label %loop2.loop_body.lr.ph, label %loop1.loop_header.loopexit

loop2.loop_body.lr.ph:                            ; preds = %loop1.loop_body
  %param_02 = load double, ptr addrspace(1) %lsr.iv35, align 8, !invariant.load !7
  store double %param_02, ptr addrspace(3) %lsr.iv38, align 8
  br label %loop1.loop_header.loopexit

loop1.loop_exit:                                  ; preds = %loop1.loop_header.loopexit
  %20 = trunc i64 %5 to i32
  tail call void @llvm.nvvm.barrier0()
  %21 = add i32 %0, %tile_origin.2
  %22 = zext nneg i32 %21 to i64
  %23 = mul nuw nsw i64 %22, 960
  %24 = add i32 %tile_origin.1, %20
  %25 = zext nneg i32 %24 to i64
  %26 = shl nuw nsw i64 %25, 3
  %27 = add i64 %23, %26
  %scevgep = getelementptr i8, ptr addrspace(1) %arg128, i64 %27
  %28 = mul nuw nsw i64 %5, 264
  %29 = shl nuw nsw i64 %14, 3
  %30 = add i64 %28, %29
  %scevgep31 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %30
  br label %loop1.loop_body5

loop1.loop_header4.loopexit:                      ; preds = %loop2.loop_body11.lr.ph, %loop1.loop_body5
  %scevgep30 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 3840
  %scevgep33 = getelementptr i8, ptr addrspace(3) %lsr.iv32, i64 32
  %.not16 = icmp ult i32 %invar.inc8, %tile_bound.2
  br i1 %.not16, label %loop1.loop_body5, label %loop1.loop_exit3, !llvm.loop !8

loop1.loop_body5:                                 ; preds = %loop1.loop_exit, %loop1.loop_header4.loopexit
  %lsr.iv32 = phi ptr addrspace(3) [ %scevgep31, %loop1.loop_exit ], [ %scevgep33, %loop1.loop_header4.loopexit ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %loop1.loop_exit ], [ %scevgep30, %loop1.loop_header4.loopexit ]
  %loop1.invar_address6.025 = phi i32 [ %0, %loop1.loop_exit ], [ %invar.inc8, %loop1.loop_header4.loopexit ]
  %31 = trunc i64 %5 to i32
  %32 = icmp ult i32 %31, %tile_bound.1
  %invar.inc8 = add nuw nsw i32 %loop1.invar_address6.025, 4
  br i1 %32, label %loop2.loop_body11.lr.ph, label %loop1.loop_header4.loopexit

loop2.loop_body11.lr.ph:                          ; preds = %loop1.loop_body5
  %33 = load double, ptr addrspace(3) %lsr.iv32, align 8
  store double %33, ptr addrspace(1) %lsr.iv, align 8
  br label %loop1.loop_header4.loopexit

loop1.loop_exit3:                                 ; preds = %loop1.loop_header4.loopexit
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

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
!4 = !{i32 0, i32 16}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.vectorize.enable", i1 false}
!7 = !{}
!8 = distinct !{!8, !6}
