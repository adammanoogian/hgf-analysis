; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@tr_tile_0 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x double]]] undef

; Function Attrs: norecurse nounwind
define void @input_transpose_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2) local_unnamed_addr #0 {
entry:
  %arg224 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg122 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg020 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %tile_origin.2 = shl nuw nsw i32 %block.id.x, 5
  %1 = or disjoint i32 %thread.id.2, %tile_origin.2
  %2 = zext nneg i32 %1 to i64
  %3 = zext nneg i32 %thread.id.2 to i64
  %4 = add nuw nsw i32 %0, -4
  %5 = zext nneg i32 %thread.id.x to i64
  %6 = lshr i64 %5, 5
  %7 = mul nuw nsw i64 %6, 1536
  %8 = shl nuw nsw i64 %2, 3
  %9 = add nuw nsw i64 %7, %8
  %scevgep47 = getelementptr i8, ptr addrspace(1) %arg020, i64 %9
  %scevgep50 = getelementptr i8, ptr addrspace(1) %arg122, i64 %9
  %10 = mul nuw nsw i64 %6, 264
  %11 = shl nuw nsw i64 %3, 3
  %12 = add nuw nsw i64 %10, %11
  %scevgep53 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %12
  br label %loop1.loop_body

loop1.loop_body:                                  ; preds = %entry, %loop1.loop_body
  %lsr.iv54 = phi ptr addrspace(3) [ %scevgep53, %entry ], [ %scevgep55, %loop1.loop_body ]
  %lsr.iv51 = phi ptr addrspace(1) [ %scevgep50, %entry ], [ %scevgep52, %loop1.loop_body ]
  %lsr.iv48 = phi ptr addrspace(1) [ %scevgep47, %entry ], [ %scevgep49, %loop1.loop_body ]
  %lsr.iv45 = phi i32 [ %4, %entry ], [ %lsr.iv.next46, %loop1.loop_body ]
  %param_0.12 = load double, ptr addrspace(1) %lsr.iv48, align 8, !invariant.load !5
  %param_13 = load double, ptr addrspace(1) %lsr.iv51, align 8, !invariant.load !5
  %multiply.2.1 = fmul double %param_0.12, %param_13
  store double %multiply.2.1, ptr addrspace(3) %lsr.iv54, align 8
  %lsr.iv.next46 = add nsw i32 %lsr.iv45, 4
  %scevgep49 = getelementptr i8, ptr addrspace(1) %lsr.iv48, i64 6144
  %scevgep52 = getelementptr i8, ptr addrspace(1) %lsr.iv51, i64 6144
  %scevgep55 = getelementptr i8, ptr addrspace(3) %lsr.iv54, i64 1056
  %13 = icmp ugt i32 %lsr.iv.next46, 15
  br i1 %13, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !6

loop1.loop_exit:                                  ; preds = %loop1.loop_body
  %14 = trunc i64 %3 to i32
  tail call void @llvm.nvvm.barrier0()
  %15 = add nuw nsw i32 %0, -16
  %16 = add i32 %0, %tile_origin.2
  %17 = zext nneg i32 %16 to i64
  %18 = mul nuw nsw i64 %17, 160
  %19 = add i64 %18, %11
  %scevgep = getelementptr i8, ptr addrspace(1) %arg224, i64 %19
  %20 = mul nuw nsw i64 %3, 264
  %21 = shl nuw nsw i64 %6, 3
  %22 = add i64 %20, %21
  %23 = add i64 %22, 64
  %scevgep34 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %23
  %24 = zext nneg i32 %block.id.x to i64
  %25 = mul nuw nsw i64 %24, 5120
  %26 = mul nuw nsw i64 %6, 160
  %27 = add i64 %25, %26
  %28 = add i64 %27, %11
  %29 = add i64 %28, 1280
  %scevgep40 = getelementptr i8, ptr addrspace(1) %arg224, i64 %29
  br label %loop1.loop_body6

loop1.loop_header5.loopexit:                      ; preds = %loop2.loop_body12.lr.ph, %loop1.loop_body6
  %30 = icmp ugt i32 %14, 19
  br i1 %30, label %loop1.loop_header5.loopexit.1, label %loop2.loop_body12.lr.ph.1

loop2.loop_body12.lr.ph.1:                        ; preds = %loop1.loop_header5.loopexit
  %sunkaddr = getelementptr i8, ptr addrspace(3) %lsr.iv35, i64 -32
  %31 = load double, ptr addrspace(3) %sunkaddr, align 8
  %sunkaddr56 = getelementptr i8, ptr addrspace(1) %lsr.iv41, i64 -640
  store double %31, ptr addrspace(1) %sunkaddr56, align 8
  br label %loop1.loop_header5.loopexit.1

loop1.loop_header5.loopexit.1:                    ; preds = %loop2.loop_body12.lr.ph.1, %loop1.loop_header5.loopexit
  %32 = icmp ugt i32 %14, 19
  br i1 %32, label %loop1.loop_header5.loopexit.2, label %loop2.loop_body12.lr.ph.2

loop2.loop_body12.lr.ph.2:                        ; preds = %loop1.loop_header5.loopexit.1
  %33 = load double, ptr addrspace(3) %lsr.iv35, align 8
  store double %33, ptr addrspace(1) %lsr.iv41, align 8
  br label %loop1.loop_header5.loopexit.2

loop1.loop_header5.loopexit.2:                    ; preds = %loop2.loop_body12.lr.ph.2, %loop1.loop_header5.loopexit.1
  %34 = icmp ugt i32 %14, 19
  br i1 %34, label %loop1.loop_header5.loopexit.3, label %loop2.loop_body12.lr.ph.3

loop2.loop_body12.lr.ph.3:                        ; preds = %loop1.loop_header5.loopexit.2
  %sunkaddr57 = getelementptr i8, ptr addrspace(3) %lsr.iv35, i64 32
  %35 = load double, ptr addrspace(3) %sunkaddr57, align 8
  %sunkaddr58 = getelementptr i8, ptr addrspace(1) %lsr.iv41, i64 640
  store double %35, ptr addrspace(1) %sunkaddr58, align 8
  br label %loop1.loop_header5.loopexit.3

loop1.loop_header5.loopexit.3:                    ; preds = %loop2.loop_body12.lr.ph.3, %loop1.loop_header5.loopexit.2
  %lsr.iv.next = add nsw i32 %lsr.iv, 16
  %scevgep33 = getelementptr i8, ptr addrspace(1) %lsr.iv32, i64 2560
  %scevgep36 = getelementptr i8, ptr addrspace(3) %lsr.iv35, i64 128
  %scevgep42 = getelementptr i8, ptr addrspace(1) %lsr.iv41, i64 2560
  %36 = icmp ugt i32 %lsr.iv.next, 15
  br i1 %36, label %loop1.loop_exit4, label %loop1.loop_body6, !llvm.loop !8

loop1.loop_body6:                                 ; preds = %loop1.loop_header5.loopexit.3, %loop1.loop_exit
  %lsr.iv41 = phi ptr addrspace(1) [ %scevgep42, %loop1.loop_header5.loopexit.3 ], [ %scevgep40, %loop1.loop_exit ]
  %lsr.iv35 = phi ptr addrspace(3) [ %scevgep36, %loop1.loop_header5.loopexit.3 ], [ %scevgep34, %loop1.loop_exit ]
  %lsr.iv32 = phi ptr addrspace(1) [ %scevgep33, %loop1.loop_header5.loopexit.3 ], [ %scevgep, %loop1.loop_exit ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %loop1.loop_header5.loopexit.3 ], [ %15, %loop1.loop_exit ]
  %37 = icmp ugt i32 %14, 19
  br i1 %37, label %loop1.loop_header5.loopexit, label %loop2.loop_body12.lr.ph

loop2.loop_body12.lr.ph:                          ; preds = %loop1.loop_body6
  %sunkaddr59 = getelementptr i8, ptr addrspace(3) %lsr.iv35, i64 -64
  %38 = load double, ptr addrspace(3) %sunkaddr59, align 8
  store double %38, ptr addrspace(1) %lsr.iv32, align 8
  br label %loop1.loop_header5.loopexit

loop1.loop_exit4:                                 ; preds = %loop1.loop_header5.loopexit.3
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
!4 = !{i32 0, i32 6}
!5 = !{}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.vectorize.enable", i1 false}
!8 = distinct !{!8, !7}
