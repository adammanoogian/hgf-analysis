; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@tr_tile_0 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x double]]] undef
@tr_tile_01 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x double]]] undef

; Function Attrs: norecurse nounwind
define void @input_transpose_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2) local_unnamed_addr #0 {
entry:
  %arg224 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg122 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg020 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %tile_origin.1 = shl i32 %block.id.x, 5
  %1 = zext i32 %thread.id.2 to i64
  %2 = add nuw nsw i32 %0, -16
  %3 = add i32 %0, %tile_origin.1
  %4 = zext nneg i32 %3 to i64
  %5 = mul nuw nsw i64 %4, 160
  %6 = shl nuw nsw i64 %1, 3
  %7 = add i64 %5, %6
  %scevgep45 = getelementptr i8, ptr addrspace(1) %arg122, i64 %7
  %8 = zext nneg i32 %thread.id.x to i64
  %9 = lshr i64 %8, 5
  %10 = mul nuw nsw i64 %9, 264
  %11 = add i64 %10, %6
  %12 = add i64 %11, 2112
  %scevgep48 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %12
  %13 = zext nneg i32 %block.id.x to i64
  %14 = mul nuw nsw i64 %13, 5120
  %15 = mul nuw nsw i64 %9, 160
  %16 = add i64 %14, %15
  %17 = add i64 %16, %6
  %18 = add i64 %17, 1280
  %scevgep54 = getelementptr i8, ptr addrspace(1) %arg122, i64 %18
  br label %loop1.loop_body

loop1.loop_header.loopexit:                       ; preds = %loop2.loop_body.lr.ph, %loop1.loop_body
  %19 = trunc i64 %1 to i32
  %20 = icmp ugt i32 %19, 19
  br i1 %20, label %loop1.loop_header.loopexit.1, label %loop2.loop_body.lr.ph.1

loop2.loop_body.lr.ph.1:                          ; preds = %loop1.loop_header.loopexit
  %sunkaddr = getelementptr i8, ptr addrspace(1) %lsr.iv55, i64 -640
  %param_1.42.1 = load double, ptr addrspace(1) %sunkaddr, align 8, !invariant.load !7
  %sunkaddr59 = getelementptr i8, ptr addrspace(3) %lsr.iv49, i64 -1056
  store double %param_1.42.1, ptr addrspace(3) %sunkaddr59, align 8
  br label %loop1.loop_header.loopexit.1

loop1.loop_header.loopexit.1:                     ; preds = %loop2.loop_body.lr.ph.1, %loop1.loop_header.loopexit
  %21 = trunc i64 %1 to i32
  %22 = icmp ugt i32 %21, 19
  br i1 %22, label %loop1.loop_header.loopexit.2, label %loop2.loop_body.lr.ph.2

loop2.loop_body.lr.ph.2:                          ; preds = %loop1.loop_header.loopexit.1
  %param_1.42.2 = load double, ptr addrspace(1) %lsr.iv55, align 8, !invariant.load !7
  store double %param_1.42.2, ptr addrspace(3) %lsr.iv49, align 8
  br label %loop1.loop_header.loopexit.2

loop1.loop_header.loopexit.2:                     ; preds = %loop2.loop_body.lr.ph.2, %loop1.loop_header.loopexit.1
  %23 = trunc i64 %1 to i32
  %24 = icmp ugt i32 %23, 19
  br i1 %24, label %loop1.loop_header.loopexit.3, label %loop2.loop_body.lr.ph.3

loop2.loop_body.lr.ph.3:                          ; preds = %loop1.loop_header.loopexit.2
  %sunkaddr60 = getelementptr i8, ptr addrspace(1) %lsr.iv55, i64 640
  %param_1.42.3 = load double, ptr addrspace(1) %sunkaddr60, align 8, !invariant.load !7
  %sunkaddr61 = getelementptr i8, ptr addrspace(3) %lsr.iv49, i64 1056
  store double %param_1.42.3, ptr addrspace(3) %sunkaddr61, align 8
  br label %loop1.loop_header.loopexit.3

loop1.loop_header.loopexit.3:                     ; preds = %loop2.loop_body.lr.ph.3, %loop1.loop_header.loopexit.2
  %lsr.iv.next44 = add nsw i32 %lsr.iv43, 16
  %scevgep47 = getelementptr i8, ptr addrspace(1) %lsr.iv46, i64 2560
  %scevgep50 = getelementptr i8, ptr addrspace(3) %lsr.iv49, i64 4224
  %scevgep56 = getelementptr i8, ptr addrspace(1) %lsr.iv55, i64 2560
  %25 = icmp ugt i32 %lsr.iv.next44, 15
  br i1 %25, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !8

loop1.loop_body:                                  ; preds = %loop1.loop_header.loopexit.3, %entry
  %lsr.iv55 = phi ptr addrspace(1) [ %scevgep56, %loop1.loop_header.loopexit.3 ], [ %scevgep54, %entry ]
  %lsr.iv49 = phi ptr addrspace(3) [ %scevgep50, %loop1.loop_header.loopexit.3 ], [ %scevgep48, %entry ]
  %lsr.iv46 = phi ptr addrspace(1) [ %scevgep47, %loop1.loop_header.loopexit.3 ], [ %scevgep45, %entry ]
  %lsr.iv43 = phi i32 [ %lsr.iv.next44, %loop1.loop_header.loopexit.3 ], [ %2, %entry ]
  %26 = trunc i64 %1 to i32
  %27 = icmp ugt i32 %26, 19
  br i1 %27, label %loop1.loop_header.loopexit, label %loop2.loop_body.lr.ph

loop2.loop_body.lr.ph:                            ; preds = %loop1.loop_body
  %param_1.42 = load double, ptr addrspace(1) %lsr.iv46, align 8, !invariant.load !7
  %sunkaddr62 = getelementptr i8, ptr addrspace(3) %lsr.iv49, i64 -2112
  store double %param_1.42, ptr addrspace(3) %sunkaddr62, align 8
  br label %loop1.loop_header.loopexit

loop1.loop_exit:                                  ; preds = %loop1.loop_header.loopexit.3
  %28 = trunc i64 %1 to i32
  tail call void @llvm.nvvm.barrier0()
  %29 = or disjoint i32 %28, %tile_origin.1
  %30 = zext nneg i32 %29 to i64
  %31 = add nuw nsw i32 %0, -4
  %32 = mul nuw nsw i64 %9, 1536
  %33 = shl nuw nsw i64 %30, 3
  %34 = add i64 %32, %33
  %scevgep = getelementptr i8, ptr addrspace(1) %arg020, i64 %34
  %scevgep37 = getelementptr i8, ptr addrspace(1) %arg224, i64 %34
  %35 = mul nuw nsw i64 %1, 264
  %36 = shl nuw nsw i64 %9, 3
  %37 = add i64 %35, %36
  %scevgep40 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %37
  br label %loop1.loop_body5

loop1.loop_body5:                                 ; preds = %loop1.loop_exit, %loop1.loop_body5
  %lsr.iv41 = phi ptr addrspace(3) [ %scevgep40, %loop1.loop_exit ], [ %scevgep42, %loop1.loop_body5 ]
  %lsr.iv38 = phi ptr addrspace(1) [ %scevgep37, %loop1.loop_exit ], [ %scevgep39, %loop1.loop_body5 ]
  %lsr.iv35 = phi ptr addrspace(1) [ %scevgep, %loop1.loop_exit ], [ %scevgep36, %loop1.loop_body5 ]
  %lsr.iv = phi i32 [ %31, %loop1.loop_exit ], [ %lsr.iv.next, %loop1.loop_body5 ]
  %38 = load double, ptr addrspace(3) %lsr.iv41, align 8
  %param_0.315 = load double, ptr addrspace(1) %lsr.iv35, align 8, !invariant.load !7
  %multiply.2.1 = fmul double %38, %param_0.315
  store double %multiply.2.1, ptr addrspace(1) %lsr.iv38, align 8
  %lsr.iv.next = add nsw i32 %lsr.iv, 4
  %scevgep36 = getelementptr i8, ptr addrspace(1) %lsr.iv35, i64 6144
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv38, i64 6144
  %scevgep42 = getelementptr i8, ptr addrspace(3) %lsr.iv41, i64 32
  %39 = icmp ugt i32 %lsr.iv.next, 15
  br i1 %39, label %loop1.loop_exit3, label %loop1.loop_body5, !llvm.loop !10

loop1.loop_exit3:                                 ; preds = %loop1.loop_body5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: norecurse nounwind
define void @input_transpose_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg2) local_unnamed_addr #0 {
entry:
  %arg226 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg124 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg022 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !11
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %.lhs.trunc = trunc i32 %block.id.x to i16
  %1 = udiv i16 %.lhs.trunc, 6
  %2 = mul i16 %1, 6
  %.decomposed = sub i16 %.lhs.trunc, %2
  %3 = shl i16 %.decomposed, 5
  %tile_origin.1 = zext i16 %3 to i32
  %4 = zext i16 %1 to i64
  %5 = zext i32 %thread.id.2 to i64
  %6 = add nuw nsw i32 %0, -16
  %7 = mul nuw nsw i64 %4, 30720
  %8 = add i32 %0, %tile_origin.1
  %9 = zext nneg i32 %8 to i64
  %10 = mul nuw nsw i64 %9, 160
  %11 = add i64 %7, %10
  %12 = shl nuw nsw i64 %5, 3
  %13 = add i64 %11, %12
  %scevgep47 = getelementptr i8, ptr addrspace(1) %arg124, i64 %13
  %14 = zext nneg i32 %thread.id.x to i64
  %15 = lshr i64 %14, 5
  %16 = mul nuw nsw i64 %15, 264
  %17 = add i64 %16, %12
  %18 = add i64 %17, 2112
  %scevgep50 = getelementptr i8, ptr addrspace(3) @tr_tile_01, i64 %18
  %19 = zext i16 %3 to i64
  %20 = add i64 %15, %19
  %21 = mul nuw nsw i64 %20, 160
  %22 = add i64 %7, %21
  %23 = add i64 %22, %12
  %24 = add i64 %23, 1280
  %scevgep56 = getelementptr i8, ptr addrspace(1) %arg124, i64 %24
  br label %loop1.loop_body

loop1.loop_header.loopexit:                       ; preds = %loop2.loop_body.lr.ph, %loop1.loop_body
  %25 = trunc i64 %5 to i32
  %26 = icmp ugt i32 %25, 19
  br i1 %26, label %loop1.loop_header.loopexit.1, label %loop2.loop_body.lr.ph.1

loop2.loop_body.lr.ph.1:                          ; preds = %loop1.loop_header.loopexit
  %sunkaddr = getelementptr i8, ptr addrspace(1) %lsr.iv57, i64 -640
  %param_1.22.1 = load double, ptr addrspace(1) %sunkaddr, align 8, !invariant.load !7
  %sunkaddr61 = getelementptr i8, ptr addrspace(3) %lsr.iv51, i64 -1056
  store double %param_1.22.1, ptr addrspace(3) %sunkaddr61, align 8
  br label %loop1.loop_header.loopexit.1

loop1.loop_header.loopexit.1:                     ; preds = %loop2.loop_body.lr.ph.1, %loop1.loop_header.loopexit
  %27 = trunc i64 %5 to i32
  %28 = icmp ugt i32 %27, 19
  br i1 %28, label %loop1.loop_header.loopexit.2, label %loop2.loop_body.lr.ph.2

loop2.loop_body.lr.ph.2:                          ; preds = %loop1.loop_header.loopexit.1
  %param_1.22.2 = load double, ptr addrspace(1) %lsr.iv57, align 8, !invariant.load !7
  store double %param_1.22.2, ptr addrspace(3) %lsr.iv51, align 8
  br label %loop1.loop_header.loopexit.2

loop1.loop_header.loopexit.2:                     ; preds = %loop2.loop_body.lr.ph.2, %loop1.loop_header.loopexit.1
  %29 = trunc i64 %5 to i32
  %30 = icmp ugt i32 %29, 19
  br i1 %30, label %loop1.loop_header.loopexit.3, label %loop2.loop_body.lr.ph.3

loop2.loop_body.lr.ph.3:                          ; preds = %loop1.loop_header.loopexit.2
  %sunkaddr62 = getelementptr i8, ptr addrspace(1) %lsr.iv57, i64 640
  %param_1.22.3 = load double, ptr addrspace(1) %sunkaddr62, align 8, !invariant.load !7
  %sunkaddr63 = getelementptr i8, ptr addrspace(3) %lsr.iv51, i64 1056
  store double %param_1.22.3, ptr addrspace(3) %sunkaddr63, align 8
  br label %loop1.loop_header.loopexit.3

loop1.loop_header.loopexit.3:                     ; preds = %loop2.loop_body.lr.ph.3, %loop1.loop_header.loopexit.2
  %lsr.iv.next46 = add nsw i32 %lsr.iv45, 16
  %scevgep49 = getelementptr i8, ptr addrspace(1) %lsr.iv48, i64 2560
  %scevgep52 = getelementptr i8, ptr addrspace(3) %lsr.iv51, i64 4224
  %scevgep58 = getelementptr i8, ptr addrspace(1) %lsr.iv57, i64 2560
  %31 = icmp ugt i32 %lsr.iv.next46, 15
  br i1 %31, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !12

loop1.loop_body:                                  ; preds = %loop1.loop_header.loopexit.3, %entry
  %lsr.iv57 = phi ptr addrspace(1) [ %scevgep58, %loop1.loop_header.loopexit.3 ], [ %scevgep56, %entry ]
  %lsr.iv51 = phi ptr addrspace(3) [ %scevgep52, %loop1.loop_header.loopexit.3 ], [ %scevgep50, %entry ]
  %lsr.iv48 = phi ptr addrspace(1) [ %scevgep49, %loop1.loop_header.loopexit.3 ], [ %scevgep47, %entry ]
  %lsr.iv45 = phi i32 [ %lsr.iv.next46, %loop1.loop_header.loopexit.3 ], [ %6, %entry ]
  %32 = trunc i64 %5 to i32
  %33 = icmp ugt i32 %32, 19
  br i1 %33, label %loop1.loop_header.loopexit, label %loop2.loop_body.lr.ph

loop2.loop_body.lr.ph:                            ; preds = %loop1.loop_body
  %param_1.22 = load double, ptr addrspace(1) %lsr.iv48, align 8, !invariant.load !7
  %sunkaddr64 = getelementptr i8, ptr addrspace(3) %lsr.iv51, i64 -2112
  store double %param_1.22, ptr addrspace(3) %sunkaddr64, align 8
  br label %loop1.loop_header.loopexit

loop1.loop_exit:                                  ; preds = %loop1.loop_header.loopexit.3
  %34 = trunc i64 %5 to i32
  tail call void @llvm.nvvm.barrier0()
  %35 = or disjoint i32 %34, %tile_origin.1
  %36 = zext nneg i32 %35 to i64
  %37 = add nuw nsw i32 %0, -4
  %38 = mul nuw nsw i64 %15, 1536
  %39 = shl nuw nsw i64 %36, 3
  %40 = add i64 %38, %39
  %scevgep = getelementptr i8, ptr addrspace(1) %arg022, i64 %40
  %41 = add i64 %7, %38
  %42 = add i64 %41, %39
  %scevgep39 = getelementptr i8, ptr addrspace(1) %arg226, i64 %42
  %43 = mul nuw nsw i64 %5, 264
  %44 = shl nuw nsw i64 %15, 3
  %45 = add i64 %43, %44
  %scevgep42 = getelementptr i8, ptr addrspace(3) @tr_tile_01, i64 %45
  br label %loop1.loop_body5

loop1.loop_body5:                                 ; preds = %loop1.loop_exit, %loop1.loop_body5
  %lsr.iv43 = phi ptr addrspace(3) [ %scevgep42, %loop1.loop_exit ], [ %scevgep44, %loop1.loop_body5 ]
  %lsr.iv40 = phi ptr addrspace(1) [ %scevgep39, %loop1.loop_exit ], [ %scevgep41, %loop1.loop_body5 ]
  %lsr.iv37 = phi ptr addrspace(1) [ %scevgep, %loop1.loop_exit ], [ %scevgep38, %loop1.loop_body5 ]
  %lsr.iv = phi i32 [ %37, %loop1.loop_exit ], [ %lsr.iv.next, %loop1.loop_body5 ]
  %46 = load double, ptr addrspace(3) %lsr.iv43, align 8
  %param_0.115 = load double, ptr addrspace(1) %lsr.iv37, align 8, !invariant.load !7
  %multiply.3.1 = fmul double %46, %param_0.115
  store double %multiply.3.1, ptr addrspace(1) %lsr.iv40, align 8
  %lsr.iv.next = add nsw i32 %lsr.iv, 4
  %scevgep38 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 6144
  %scevgep41 = getelementptr i8, ptr addrspace(1) %lsr.iv40, i64 6144
  %scevgep44 = getelementptr i8, ptr addrspace(3) %lsr.iv43, i64 32
  %47 = icmp ugt i32 %lsr.iv.next, 15
  br i1 %47, label %loop1.loop_exit3, label %loop1.loop_body5, !llvm.loop !13

loop1.loop_exit3:                                 ; preds = %loop1.loop_body5
  ret void
}

attributes #0 = { norecurse nounwind }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @input_transpose_fusion_1, !"kernel", i32 1}
!1 = !{ptr @input_transpose_fusion_1, !"reqntidx", i32 128}
!2 = !{ptr @input_transpose_fusion, !"kernel", i32 1}
!3 = !{ptr @input_transpose_fusion, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 128}
!6 = !{i32 0, i32 6}
!7 = !{}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.vectorize.enable", i1 false}
!10 = distinct !{!10, !9}
!11 = !{i32 0, i32 720}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
