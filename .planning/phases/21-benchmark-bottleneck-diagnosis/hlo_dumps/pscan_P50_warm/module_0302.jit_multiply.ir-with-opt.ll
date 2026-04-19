; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@tr_tile_0 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x double]]] undef

; Function Attrs: norecurse nounwind
define void @input_transpose_fusion(ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(73728) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg2) local_unnamed_addr #0 {
entry:
  %arg229 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg127 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg025 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %.cmp = icmp ult i32 %block.id.x, 6
  %.cmp18 = icmp ugt i32 %block.id.x, 5
  %tile_bound.1 = select i1 %.cmp18, i32 16, i32 32
  %tile_origin.1 = select i1 %.cmp18, i32 32, i32 0
  %1 = shl nuw nsw i32 %block.id.x, 5
  %2 = add nsw i32 %1, -192
  %tile_origin.2 = select i1 %.cmp, i32 %1, i32 %2
  %3 = or disjoint i32 %thread.id.2, %tile_origin.2
  %4 = zext nneg i32 %3 to i64
  %5 = zext nneg i32 %thread.id.2 to i64
  %6 = zext nneg i32 %thread.id.x to i64
  %7 = lshr i64 %6, 5
  %8 = zext nneg i32 %tile_origin.1 to i64
  %9 = add nuw i64 %7, %8
  %10 = mul nuw nsw i64 %9, 1536
  %11 = shl nuw nsw i64 %4, 3
  %12 = add nuw nsw i64 %10, %11
  %scevgep46 = getelementptr i8, ptr addrspace(1) %arg025, i64 %12
  %scevgep49 = getelementptr i8, ptr addrspace(1) %arg127, i64 %12
  %13 = mul nuw nsw i64 %7, 264
  %14 = shl nuw nsw i64 %5, 3
  %15 = add nuw nsw i64 %13, %14
  %scevgep52 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %15
  br label %loop1.loop_body

loop1.loop_body:                                  ; preds = %entry, %loop1.loop_body
  %lsr.iv53 = phi ptr addrspace(3) [ %scevgep52, %entry ], [ %scevgep54, %loop1.loop_body ]
  %lsr.iv50 = phi ptr addrspace(1) [ %scevgep49, %entry ], [ %scevgep51, %loop1.loop_body ]
  %lsr.iv47 = phi ptr addrspace(1) [ %scevgep46, %entry ], [ %scevgep48, %loop1.loop_body ]
  %loop1.invar_address.021 = phi i32 [ %0, %entry ], [ %invar.inc, %loop1.loop_body ]
  %invar.inc = add nuw nsw i32 %loop1.invar_address.021, 4
  %param_0.12 = load double, ptr addrspace(1) %lsr.iv47, align 8, !invariant.load !5
  %param_13 = load double, ptr addrspace(1) %lsr.iv50, align 8, !invariant.load !5
  %multiply.2.1 = fmul double %param_0.12, %param_13
  store double %multiply.2.1, ptr addrspace(3) %lsr.iv53, align 8
  %scevgep48 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 6144
  %scevgep51 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 6144
  %scevgep54 = getelementptr i8, ptr addrspace(3) %lsr.iv53, i64 1056
  %.not16 = icmp ult i32 %invar.inc, %tile_bound.1
  br i1 %.not16, label %loop1.loop_body, label %loop1.loop_exit, !llvm.loop !6

loop1.loop_exit:                                  ; preds = %loop1.loop_body
  %16 = trunc i64 %5 to i32
  %17 = trunc i64 %5 to i32
  tail call void @llvm.nvvm.barrier0()
  %18 = or disjoint i32 %16, %tile_origin.1
  %19 = zext nneg i32 %18 to i64
  %20 = mul nuw nsw i64 %5, 264
  %21 = shl nuw nsw i64 %7, 3
  %22 = add i64 %20, %21
  %23 = add i64 %22, 64
  %scevgep = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %23
  %24 = zext i32 %tile_origin.2 to i64
  %25 = add i64 %7, %24
  %26 = mul nuw nsw i64 %25, 384
  %27 = add i32 %tile_origin.1, %17
  %28 = zext nneg i32 %27 to i64
  %29 = shl nuw nsw i64 %28, 3
  %30 = add i64 %26, %29
  %31 = add i64 %30, 3072
  %scevgep41 = getelementptr i8, ptr addrspace(1) %arg229, i64 %31
  br label %loop1.loop_body6

loop1.loop_header5.loopexit:                      ; preds = %loop2.loop_body12.lr.ph, %loop1.loop_body6
  %32 = trunc i64 %5 to i32
  %33 = icmp ult i32 %32, %tile_bound.1
  br i1 %33, label %loop2.loop_body12.lr.ph.1, label %loop1.loop_header5.loopexit.1

loop2.loop_body12.lr.ph.1:                        ; preds = %loop1.loop_header5.loopexit
  %sunkaddr = getelementptr i8, ptr addrspace(3) %lsr.iv, i64 -32
  %34 = load double, ptr addrspace(3) %sunkaddr, align 8
  %sunkaddr55 = getelementptr i8, ptr addrspace(1) %lsr.iv42, i64 -1536
  store double %34, ptr addrspace(1) %sunkaddr55, align 8
  br label %loop1.loop_header5.loopexit.1

loop1.loop_header5.loopexit.1:                    ; preds = %loop2.loop_body12.lr.ph.1, %loop1.loop_header5.loopexit
  %35 = trunc i64 %5 to i32
  %36 = icmp ult i32 %35, %tile_bound.1
  br i1 %36, label %loop2.loop_body12.lr.ph.2, label %loop1.loop_header5.loopexit.2

loop2.loop_body12.lr.ph.2:                        ; preds = %loop1.loop_header5.loopexit.1
  %37 = load double, ptr addrspace(3) %lsr.iv, align 8
  store double %37, ptr addrspace(1) %lsr.iv42, align 8
  br label %loop1.loop_header5.loopexit.2

loop1.loop_header5.loopexit.2:                    ; preds = %loop2.loop_body12.lr.ph.2, %loop1.loop_header5.loopexit.1
  %38 = trunc i64 %5 to i32
  %39 = icmp ult i32 %38, %tile_bound.1
  %invar.inc9.3 = add nuw nsw i32 %loop1.invar_address7.024, 16
  br i1 %39, label %loop2.loop_body12.lr.ph.3, label %loop1.loop_header5.loopexit.3

loop2.loop_body12.lr.ph.3:                        ; preds = %loop1.loop_header5.loopexit.2
  %sunkaddr56 = getelementptr i8, ptr addrspace(3) %lsr.iv, i64 32
  %40 = load double, ptr addrspace(3) %sunkaddr56, align 8
  %sunkaddr57 = getelementptr i8, ptr addrspace(1) %lsr.iv42, i64 1536
  store double %40, ptr addrspace(1) %sunkaddr57, align 8
  br label %loop1.loop_header5.loopexit.3

loop1.loop_header5.loopexit.3:                    ; preds = %loop2.loop_body12.lr.ph.3, %loop1.loop_header5.loopexit.2
  %scevgep37 = getelementptr i8, ptr addrspace(3) %lsr.iv, i64 128
  %scevgep43 = getelementptr i8, ptr addrspace(1) %lsr.iv42, i64 6144
  %41 = icmp ugt i32 %loop1.invar_address7.024, 15
  br i1 %41, label %loop1.loop_exit4, label %loop1.loop_body6, !llvm.loop !8

loop1.loop_body6:                                 ; preds = %loop1.loop_header5.loopexit.3, %loop1.loop_exit
  %lsr.iv42 = phi ptr addrspace(1) [ %scevgep43, %loop1.loop_header5.loopexit.3 ], [ %scevgep41, %loop1.loop_exit ]
  %lsr.iv = phi ptr addrspace(3) [ %scevgep37, %loop1.loop_header5.loopexit.3 ], [ %scevgep, %loop1.loop_exit ]
  %loop1.invar_address7.024 = phi i32 [ %0, %loop1.loop_exit ], [ %invar.inc9.3, %loop1.loop_header5.loopexit.3 ]
  %42 = trunc i64 %5 to i32
  %43 = icmp ult i32 %42, %tile_bound.1
  %44 = add i32 %tile_origin.2, %loop1.invar_address7.024
  %45 = zext nneg i32 %44 to i64
  %46 = getelementptr inbounds [192 x [48 x double]], ptr addrspace(1) %arg229, i64 0, i64 %45, i64 %19
  br i1 %43, label %loop2.loop_body12.lr.ph, label %loop1.loop_header5.loopexit

loop2.loop_body12.lr.ph:                          ; preds = %loop1.loop_body6
  %sunkaddr58 = getelementptr i8, ptr addrspace(3) %lsr.iv, i64 -64
  %47 = load double, ptr addrspace(3) %sunkaddr58, align 8
  store double %47, ptr addrspace(1) %46, align 8
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
!4 = !{i32 0, i32 12}
!5 = !{}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.vectorize.enable", i1 false}
!8 = distinct !{!8, !7}
