; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@tr_tile_0 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x double]]] undef

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2) local_unnamed_addr #0 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 20
  %4 = mul i16 %3, 20
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %.decomposed to i64
  %6 = zext nneg i16 %3 to i64
  %7 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr addrspace(1) %arg03, i64 0, i64 0, i64 %5, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !7
  %9 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg15, i64 0, i64 %5, i64 %6
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !7
  %multiply.2.1 = fmul double %8, %10
  %11 = zext nneg i32 %linear_index to i64
  %12 = getelementptr double, ptr addrspace(1) %arg27, i64 %11
  store double %multiply.2.1, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: norecurse nounwind
define void @input_transpose_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg2) local_unnamed_addr #2 {
entry:
  %arg226 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg124 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg022 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %.lhs.trunc = trunc nuw nsw i32 %block.id.x to i16
  %1 = udiv i16 %.lhs.trunc, 6
  %2 = mul i16 %1, 6
  %.decomposed = sub i16 %.lhs.trunc, %2
  %3 = shl nuw nsw i16 %.decomposed, 5
  %tile_origin.2 = zext nneg i16 %3 to i32
  %4 = zext nneg i16 %1 to i64
  %5 = or disjoint i32 %thread.id.2, %tile_origin.2
  %6 = zext nneg i32 %5 to i64
  %7 = zext nneg i32 %thread.id.2 to i64
  %8 = add nuw nsw i32 %0, -4
  %9 = mul nuw nsw i64 %4, 30720
  %10 = zext nneg i32 %thread.id.x to i64
  %11 = lshr i64 %10, 5
  %12 = mul nuw nsw i64 %11, 1536
  %13 = add nuw nsw i64 %9, %12
  %14 = shl nuw nsw i64 %6, 3
  %15 = add nuw nsw i64 %13, %14
  %scevgep67 = getelementptr i8, ptr addrspace(1) %arg022, i64 %15
  %16 = mul nuw nsw i64 %11, 264
  %17 = shl nuw nsw i64 %7, 3
  %18 = add nuw nsw i64 %16, %17
  %scevgep70 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %18
  br label %loop1.loop_body

loop1.loop_body:                                  ; preds = %entry, %loop1.loop_body
  %lsr.iv71 = phi ptr addrspace(3) [ %scevgep70, %entry ], [ %scevgep72, %loop1.loop_body ]
  %lsr.iv68 = phi ptr addrspace(1) [ %scevgep67, %entry ], [ %scevgep69, %loop1.loop_body ]
  %lsr.iv65 = phi i32 [ %8, %entry ], [ %lsr.iv.next66, %loop1.loop_body ]
  %param_0.52 = load double, ptr addrspace(1) %lsr.iv68, align 8, !invariant.load !7
  store double %param_0.52, ptr addrspace(3) %lsr.iv71, align 8
  %lsr.iv.next66 = add nsw i32 %lsr.iv65, 4
  %scevgep69 = getelementptr i8, ptr addrspace(1) %lsr.iv68, i64 6144
  %scevgep72 = getelementptr i8, ptr addrspace(3) %lsr.iv71, i64 1056
  %19 = icmp ugt i32 %lsr.iv.next66, 15
  br i1 %19, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !9

loop1.loop_exit:                                  ; preds = %loop1.loop_body
  %20 = trunc i64 %7 to i32
  tail call void @llvm.nvvm.barrier0()
  %21 = add nuw nsw i32 %0, -16
  %22 = mul nuw nsw i64 %7, 1536
  %23 = add i32 %0, %tile_origin.2
  %24 = zext nneg i32 %23 to i64
  %25 = shl nuw nsw i64 %24, 3
  %26 = add i64 %22, %25
  %scevgep = getelementptr i8, ptr addrspace(1) %arg124, i64 %26
  %27 = mul nuw nsw i64 %24, 160
  %28 = add i64 %9, %27
  %29 = add i64 %28, %17
  %scevgep43 = getelementptr i8, ptr addrspace(1) %arg226, i64 %29
  %30 = mul nuw nsw i64 %7, 264
  %31 = shl nuw nsw i64 %11, 3
  %32 = add i64 %30, %31
  %33 = add i64 %32, 96
  %scevgep46 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %33
  %34 = zext i16 %3 to i64
  %35 = add i64 %11, %34
  %36 = shl nuw nsw i64 %35, 3
  %37 = add i64 %22, %36
  %38 = add i64 %37, 64
  %scevgep54 = getelementptr i8, ptr addrspace(1) %arg124, i64 %38
  %39 = mul nuw nsw i64 %35, 160
  %40 = add i64 %9, %39
  %41 = add i64 %40, %17
  %42 = add i64 %41, 1280
  %scevgep60 = getelementptr i8, ptr addrspace(1) %arg226, i64 %42
  br label %loop1.loop_body5

loop1.loop_header4.loopexit:                      ; preds = %loop2.loop_body11.lr.ph, %loop1.loop_body5
  %43 = icmp ugt i32 %20, 19
  br i1 %43, label %loop1.loop_header4.loopexit.1, label %loop2.loop_body11.lr.ph.1

loop2.loop_body11.lr.ph.1:                        ; preds = %loop1.loop_header4.loopexit
  %scevgep51 = getelementptr i8, ptr addrspace(3) %scevgep48, i64 -64
  %44 = load double, ptr addrspace(3) %scevgep51, align 8
  %scevgep58 = getelementptr i8, ptr addrspace(1) %scevgep54, i64 %lsr.iv40
  %scevgep59 = getelementptr i8, ptr addrspace(1) %scevgep58, i64 -32
  %param_1.715.1 = load double, ptr addrspace(1) %scevgep59, align 8, !invariant.load !7
  %multiply.3.1.1 = fmul double %44, %param_1.715.1
  %scevgep64 = getelementptr i8, ptr addrspace(1) %lsr.iv61, i64 -640
  store double %multiply.3.1.1, ptr addrspace(1) %scevgep64, align 8
  br label %loop1.loop_header4.loopexit.1

loop1.loop_header4.loopexit.1:                    ; preds = %loop2.loop_body11.lr.ph.1, %loop1.loop_header4.loopexit
  %45 = icmp ugt i32 %20, 19
  br i1 %45, label %loop1.loop_header4.loopexit.2, label %loop2.loop_body11.lr.ph.2

loop2.loop_body11.lr.ph.2:                        ; preds = %loop1.loop_header4.loopexit.1
  %scevgep53 = getelementptr i8, ptr addrspace(3) %scevgep48, i64 -32
  %46 = load double, ptr addrspace(3) %scevgep53, align 8
  %scevgep55 = getelementptr i8, ptr addrspace(1) %scevgep54, i64 %lsr.iv40
  %param_1.715.2 = load double, ptr addrspace(1) %scevgep55, align 8, !invariant.load !7
  %multiply.3.1.2 = fmul double %46, %param_1.715.2
  store double %multiply.3.1.2, ptr addrspace(1) %lsr.iv61, align 8
  br label %loop1.loop_header4.loopexit.2

loop1.loop_header4.loopexit.2:                    ; preds = %loop2.loop_body11.lr.ph.2, %loop1.loop_header4.loopexit.1
  %47 = icmp ugt i32 %20, 19
  br i1 %47, label %loop1.loop_header4.loopexit.3, label %loop2.loop_body11.lr.ph.3

loop2.loop_body11.lr.ph.3:                        ; preds = %loop1.loop_header4.loopexit.2
  %48 = load double, ptr addrspace(3) %scevgep48, align 8
  %scevgep56 = getelementptr i8, ptr addrspace(1) %scevgep54, i64 %lsr.iv40
  %scevgep57 = getelementptr i8, ptr addrspace(1) %scevgep56, i64 32
  %param_1.715.3 = load double, ptr addrspace(1) %scevgep57, align 8, !invariant.load !7
  %multiply.3.1.3 = fmul double %48, %param_1.715.3
  %scevgep63 = getelementptr i8, ptr addrspace(1) %lsr.iv61, i64 640
  store double %multiply.3.1.3, ptr addrspace(1) %scevgep63, align 8
  br label %loop1.loop_header4.loopexit.3

loop1.loop_header4.loopexit.3:                    ; preds = %loop2.loop_body11.lr.ph.3, %loop1.loop_header4.loopexit.2
  %lsr.iv.next = add nsw i32 %lsr.iv, 16
  %lsr.iv.next41 = add nuw nsw i64 %lsr.iv40, 128
  %scevgep45 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 2560
  %scevgep62 = getelementptr i8, ptr addrspace(1) %lsr.iv61, i64 2560
  %49 = icmp ugt i32 %lsr.iv.next, 15
  br i1 %49, label %loop1.loop_exit3, label %loop1.loop_body5, !llvm.loop !11

loop1.loop_body5:                                 ; preds = %loop1.loop_header4.loopexit.3, %loop1.loop_exit
  %lsr.iv61 = phi ptr addrspace(1) [ %scevgep62, %loop1.loop_header4.loopexit.3 ], [ %scevgep60, %loop1.loop_exit ]
  %lsr.iv44 = phi ptr addrspace(1) [ %scevgep45, %loop1.loop_header4.loopexit.3 ], [ %scevgep43, %loop1.loop_exit ]
  %lsr.iv40 = phi i64 [ %lsr.iv.next41, %loop1.loop_header4.loopexit.3 ], [ 0, %loop1.loop_exit ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %loop1.loop_header4.loopexit.3 ], [ %21, %loop1.loop_exit ]
  %50 = icmp ugt i32 %20, 19
  %scevgep48 = getelementptr i8, ptr addrspace(3) %scevgep46, i64 %lsr.iv40
  %scevgep42 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %lsr.iv40
  br i1 %50, label %loop1.loop_header4.loopexit, label %loop2.loop_body11.lr.ph

loop2.loop_body11.lr.ph:                          ; preds = %loop1.loop_body5
  %sunkaddr = getelementptr i8, ptr addrspace(3) %scevgep48, i64 -96
  %51 = load double, ptr addrspace(3) %sunkaddr, align 8
  %param_1.715 = load double, ptr addrspace(1) %scevgep42, align 8, !invariant.load !7
  %multiply.3.1 = fmul double %51, %param_1.715
  store double %multiply.3.1, ptr addrspace(1) %lsr.iv44, align 8
  br label %loop1.loop_header4.loopexit

loop1.loop_exit3:                                 ; preds = %loop1.loop_header4.loopexit.3
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { norecurse nounwind }
attributes #3 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!2 = !{ptr @input_transpose_fusion, !"kernel", i32 1}
!3 = !{ptr @input_transpose_fusion, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 30}
!6 = !{i32 0, i32 128}
!7 = !{}
!8 = !{i32 0, i32 720}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.vectorize.enable", i1 false}
!11 = distinct !{!11, !10}
