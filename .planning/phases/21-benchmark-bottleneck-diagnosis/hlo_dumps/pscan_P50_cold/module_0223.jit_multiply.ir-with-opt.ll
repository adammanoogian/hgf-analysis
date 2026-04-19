; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@tr_tile_0 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x double]]] undef

; Function Attrs: norecurse nounwind
define void @input_transpose_fusion(ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg2) local_unnamed_addr #0 {
entry:
  %arg228 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg126 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg024 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = and i32 %block.id.x, 1
  %.not = icmp eq i32 %1, 0
  %tile_bound.2 = select i1 %.not, i32 32, i32 16
  %2 = shl i32 %block.id.x, 4
  %tile_origin.1 = and i32 %2, 224
  %tile_origin.2 = shl i32 %1, 5
  %3 = zext i32 %thread.id.2 to i64
  %4 = add nuw nsw i32 %0, -16
  %5 = add i32 %0, %tile_origin.1
  %6 = zext nneg i32 %5 to i64
  %7 = mul nuw nsw i64 %6, 384
  %8 = add i32 %tile_origin.2, %thread.id.2
  %9 = zext nneg i32 %8 to i64
  %10 = shl nuw nsw i64 %9, 3
  %11 = add i64 %7, %10
  %scevgep47 = getelementptr i8, ptr addrspace(1) %arg126, i64 %11
  %12 = zext nneg i32 %thread.id.x to i64
  %13 = lshr i64 %12, 5
  %14 = mul nuw nsw i64 %13, 264
  %15 = shl nuw nsw i64 %3, 3
  %16 = add i64 %14, %15
  %17 = add i64 %16, 2112
  %scevgep50 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %17
  %18 = zext nneg i32 %block.id.x to i64
  %19 = lshr i64 %18, 1
  %20 = mul nuw nsw i64 %19, 12288
  %21 = mul nuw nsw i64 %13, 384
  %22 = add i64 %20, %21
  %23 = add i64 %22, %10
  %24 = add i64 %23, 3072
  %scevgep56 = getelementptr i8, ptr addrspace(1) %arg126, i64 %24
  br label %loop1.loop_body

loop1.loop_header.loopexit:                       ; preds = %loop2.loop_body.lr.ph, %loop1.loop_body
  %25 = trunc i64 %3 to i32
  %26 = icmp ult i32 %25, %tile_bound.2
  br i1 %26, label %loop2.loop_body.lr.ph.1, label %loop1.loop_header.loopexit.1

loop2.loop_body.lr.ph.1:                          ; preds = %loop1.loop_header.loopexit
  %sunkaddr = getelementptr i8, ptr addrspace(1) %lsr.iv57, i64 -1536
  %param_1.12.1 = load double, ptr addrspace(1) %sunkaddr, align 8, !invariant.load !5
  %sunkaddr61 = getelementptr i8, ptr addrspace(3) %lsr.iv51, i64 -1056
  store double %param_1.12.1, ptr addrspace(3) %sunkaddr61, align 8
  br label %loop1.loop_header.loopexit.1

loop1.loop_header.loopexit.1:                     ; preds = %loop2.loop_body.lr.ph.1, %loop1.loop_header.loopexit
  %27 = trunc i64 %3 to i32
  %28 = icmp ult i32 %27, %tile_bound.2
  br i1 %28, label %loop2.loop_body.lr.ph.2, label %loop1.loop_header.loopexit.2

loop2.loop_body.lr.ph.2:                          ; preds = %loop1.loop_header.loopexit.1
  %param_1.12.2 = load double, ptr addrspace(1) %lsr.iv57, align 8, !invariant.load !5
  store double %param_1.12.2, ptr addrspace(3) %lsr.iv51, align 8
  br label %loop1.loop_header.loopexit.2

loop1.loop_header.loopexit.2:                     ; preds = %loop2.loop_body.lr.ph.2, %loop1.loop_header.loopexit.1
  %29 = trunc i64 %3 to i32
  %30 = icmp ult i32 %29, %tile_bound.2
  br i1 %30, label %loop2.loop_body.lr.ph.3, label %loop1.loop_header.loopexit.3

loop2.loop_body.lr.ph.3:                          ; preds = %loop1.loop_header.loopexit.2
  %sunkaddr62 = getelementptr i8, ptr addrspace(1) %lsr.iv57, i64 1536
  %param_1.12.3 = load double, ptr addrspace(1) %sunkaddr62, align 8, !invariant.load !5
  %sunkaddr63 = getelementptr i8, ptr addrspace(3) %lsr.iv51, i64 1056
  store double %param_1.12.3, ptr addrspace(3) %sunkaddr63, align 8
  br label %loop1.loop_header.loopexit.3

loop1.loop_header.loopexit.3:                     ; preds = %loop2.loop_body.lr.ph.3, %loop1.loop_header.loopexit.2
  %lsr.iv.next = add nsw i32 %lsr.iv46, 16
  %scevgep49 = getelementptr i8, ptr addrspace(1) %lsr.iv48, i64 6144
  %scevgep52 = getelementptr i8, ptr addrspace(3) %lsr.iv51, i64 4224
  %scevgep58 = getelementptr i8, ptr addrspace(1) %lsr.iv57, i64 6144
  %31 = icmp ugt i32 %lsr.iv.next, 15
  br i1 %31, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !6

loop1.loop_body:                                  ; preds = %loop1.loop_header.loopexit.3, %entry
  %lsr.iv57 = phi ptr addrspace(1) [ %scevgep58, %loop1.loop_header.loopexit.3 ], [ %scevgep56, %entry ]
  %lsr.iv51 = phi ptr addrspace(3) [ %scevgep52, %loop1.loop_header.loopexit.3 ], [ %scevgep50, %entry ]
  %lsr.iv48 = phi ptr addrspace(1) [ %scevgep49, %loop1.loop_header.loopexit.3 ], [ %scevgep47, %entry ]
  %lsr.iv46 = phi i32 [ %lsr.iv.next, %loop1.loop_header.loopexit.3 ], [ %4, %entry ]
  %32 = trunc i64 %3 to i32
  %33 = icmp ult i32 %32, %tile_bound.2
  br i1 %33, label %loop2.loop_body.lr.ph, label %loop1.loop_header.loopexit

loop2.loop_body.lr.ph:                            ; preds = %loop1.loop_body
  %param_1.12 = load double, ptr addrspace(1) %lsr.iv48, align 8, !invariant.load !5
  %sunkaddr64 = getelementptr i8, ptr addrspace(3) %lsr.iv51, i64 -2112
  store double %param_1.12, ptr addrspace(3) %sunkaddr64, align 8
  br label %loop1.loop_header.loopexit

loop1.loop_exit:                                  ; preds = %loop1.loop_header.loopexit.3
  %34 = trunc i64 %3 to i32
  tail call void @llvm.nvvm.barrier0()
  %35 = or disjoint i32 %34, %tile_origin.1
  %36 = zext nneg i32 %35 to i64
  %37 = add i32 %0, %tile_origin.2
  %38 = zext nneg i32 %37 to i64
  %39 = mul nuw nsw i64 %38, 1536
  %40 = shl nuw nsw i64 %36, 3
  %41 = add i64 %39, %40
  %scevgep = getelementptr i8, ptr addrspace(1) %arg024, i64 %41
  %scevgep40 = getelementptr i8, ptr addrspace(1) %arg228, i64 %41
  %42 = mul nuw nsw i64 %3, 264
  %43 = shl nuw nsw i64 %13, 3
  %44 = add i64 %42, %43
  %scevgep43 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %44
  br label %loop1.loop_body5

loop1.loop_body5:                                 ; preds = %loop1.loop_exit, %loop1.loop_body5
  %lsr.iv44 = phi ptr addrspace(3) [ %scevgep43, %loop1.loop_exit ], [ %scevgep45, %loop1.loop_body5 ]
  %lsr.iv41 = phi ptr addrspace(1) [ %scevgep40, %loop1.loop_exit ], [ %scevgep42, %loop1.loop_body5 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %loop1.loop_exit ], [ %scevgep39, %loop1.loop_body5 ]
  %loop1.invar_address6.023 = phi i32 [ %0, %loop1.loop_exit ], [ %invar.inc8, %loop1.loop_body5 ]
  %invar.inc8 = add nuw nsw i32 %loop1.invar_address6.023, 4
  %45 = load double, ptr addrspace(3) %lsr.iv44, align 8
  %param_0.115 = load double, ptr addrspace(1) %lsr.iv, align 8, !invariant.load !5
  %multiply.1.1 = fmul double %45, %param_0.115
  store double %multiply.1.1, ptr addrspace(1) %lsr.iv41, align 8
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 6144
  %scevgep42 = getelementptr i8, ptr addrspace(1) %lsr.iv41, i64 6144
  %scevgep45 = getelementptr i8, ptr addrspace(3) %lsr.iv44, i64 32
  %.not17 = icmp ult i32 %invar.inc8, %tile_bound.2
  br i1 %.not17, label %loop1.loop_body5, label %loop1.loop_exit3, !llvm.loop !8

loop1.loop_exit3:                                 ; preds = %loop1.loop_body5
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

!0 = !{ptr @input_transpose_fusion, !"kernel", i32 1}
!1 = !{ptr @input_transpose_fusion, !"reqntidx", i32 128}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 128}
!4 = !{i32 0, i32 12}
!5 = !{}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.vectorize.enable", i1 false}
!8 = distinct !{!8, !7}
