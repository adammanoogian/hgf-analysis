; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_35_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@tr_tile_0 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x i32]]] undef
@tr_tile_01 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x float]]] undef
@buffer_for_constant_1881_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1880_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1879_0 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\00\00\00\00\F0\FF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_1878_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1786_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@"shared_cache_$_0" = internal unnamed_addr addrspace(3) global double undef
@buffer_for_constant_1739_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1738_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@"shared_cache2_$_0" = internal unnamed_addr addrspace(3) global double undef
@buffer_for_constant_1691_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_1678_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@shared_cache3 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache4 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@"shared_cache5_$_0" = internal unnamed_addr addrspace(3) global double undef
@shared_cache6 = private unnamed_addr addrspace(3) global [1 x [8 x double]] undef
@buffer_for_constant_6721_0 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@shared_cache7 = private unnamed_addr addrspace(3) global [1 x [1 x double]] undef
@shared_cache8 = private unnamed_addr addrspace(3) global [1 x [1 x double]] undef
@shared_cache9 = private unnamed_addr addrspace(3) global [1 x [1 x double]] undef
@shared_cache10 = private unnamed_addr addrspace(3) global [1 x [1 x double]] undef
@buffer_for_constant_9121_0 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_9114_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_9113_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_20(ptr noalias nocapture writeonly align 128 dereferenceable(10) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(10) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  %3 = getelementptr i8, ptr addrspace(1) %arg13, i64 %1
  store i8 0, ptr addrspace(1) %3, align 1
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_19(ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !299
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 0, ptr addrspace(1) %2, align 8
  %3 = getelementptr i64, ptr addrspace(1) %arg13, i64 %1
  store i64 0, ptr addrspace(1) %3, align 8
  %4 = getelementptr i64, ptr addrspace(1) %arg25, i64 %1
  store i64 0, ptr addrspace(1) %4, align 8
  %5 = getelementptr i64, ptr addrspace(1) %arg37, i64 %1
  store i64 0, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @input_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1600) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(9600) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !300
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1410
  br i1 %3, label %concatenate.pivot.10., label %input_slice_fusion.in_bounds-after

input_slice_fusion.in_bounds-after:               ; preds = %slice1-after, %slice2-true, %entry
  ret void

concatenate.pivot.10.:                            ; preds = %entry
  %4 = icmp ult i32 %linear_index, 10
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg05, i64 0, i64 %5
  br i1 %4, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.pivot.10.
  %7 = add nsw i32 %linear_index, -10
  %8 = icmp ult i32 %7, 200
  %9 = zext nneg i32 %7 to i64
  %10 = getelementptr inbounds [200 x double], ptr addrspace(1) %arg17, i64 0, i64 %9
  br i1 %8, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %11 = icmp ugt i32 %linear_index, 209
  %12 = add nsw i32 %linear_index, -210
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds [1200 x double], ptr addrspace(1) %arg29, i64 0, i64 %13
  br i1 %11, label %slice2-true, label %input_slice_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.pivot.10.
  store double 0.000000e+00, ptr addrspace(1) %6, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store double 0.000000e+00, ptr addrspace(1) %10, align 8
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store double 0.000000e+00, ptr addrspace(1) %14, align 8
  br label %input_slice_fusion.in_bounds-after
}

; Function Attrs: norecurse nounwind
define void @wrapped_transpose(ptr noalias nocapture readonly align 16 dereferenceable(15360) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(15360) %arg1) local_unnamed_addr #2 {
entry:
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !302
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %tile_origin.2 = shl nuw nsw i32 %block.id.x, 5
  %1 = or disjoint i32 %thread.id.2, %tile_origin.2
  %2 = zext nneg i32 %1 to i64
  %3 = zext nneg i32 %thread.id.2 to i64
  %4 = add nuw nsw i32 %0, -4
  %5 = zext nneg i32 %thread.id.x to i64
  %6 = lshr i64 %5, 5
  %7 = mul nuw nsw i64 %6, 768
  %8 = shl nuw nsw i64 %2, 2
  %9 = add nuw nsw i64 %7, %8
  %scevgep44 = getelementptr i8, ptr addrspace(1) %arg019, i64 %9
  %10 = mul nuw nsw i64 %6, 132
  %11 = shl nuw nsw i64 %3, 2
  %12 = add nuw nsw i64 %10, %11
  %scevgep47 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %12
  br label %loop1.loop_body

loop1.loop_body:                                  ; preds = %entry, %loop1.loop_body
  %lsr.iv48 = phi ptr addrspace(3) [ %scevgep47, %entry ], [ %scevgep49, %loop1.loop_body ]
  %lsr.iv45 = phi ptr addrspace(1) [ %scevgep44, %entry ], [ %scevgep46, %loop1.loop_body ]
  %lsr.iv42 = phi i32 [ %4, %entry ], [ %lsr.iv.next43, %loop1.loop_body ]
  %param_0.30622 = load i32, ptr addrspace(1) %lsr.iv45, align 4, !invariant.load !303
  store i32 %param_0.30622, ptr addrspace(3) %lsr.iv48, align 4
  %lsr.iv.next43 = add nsw i32 %lsr.iv42, 4
  %scevgep46 = getelementptr i8, ptr addrspace(1) %lsr.iv45, i64 3072
  %scevgep49 = getelementptr i8, ptr addrspace(3) %lsr.iv48, i64 528
  %13 = icmp ugt i32 %lsr.iv.next43, 15
  br i1 %13, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !304

loop1.loop_exit:                                  ; preds = %loop1.loop_body
  %14 = trunc i64 %3 to i32
  tail call void @llvm.nvvm.barrier0()
  %15 = add nuw nsw i32 %0, -16
  %16 = add i32 %0, %tile_origin.2
  %17 = zext nneg i32 %16 to i64
  %18 = mul nuw nsw i64 %17, 80
  %19 = add i64 %18, %11
  %scevgep = getelementptr i8, ptr addrspace(1) %arg121, i64 %19
  %20 = mul nuw nsw i64 %3, 132
  %21 = shl nuw nsw i64 %6, 2
  %22 = add i64 %20, %21
  %23 = add i64 %22, 32
  %scevgep31 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %23
  %24 = zext nneg i32 %block.id.x to i64
  %25 = mul nuw nsw i64 %24, 2560
  %26 = mul nuw nsw i64 %6, 80
  %27 = add i64 %25, %26
  %28 = add i64 %27, %11
  %29 = add i64 %28, 640
  %scevgep37 = getelementptr i8, ptr addrspace(1) %arg121, i64 %29
  br label %loop1.loop_body5

loop1.loop_header4.loopexit:                      ; preds = %loop2.loop_body11.lr.ph, %loop1.loop_body5
  %30 = icmp ugt i32 %14, 19
  br i1 %30, label %loop1.loop_header4.loopexit.1, label %loop2.loop_body11.lr.ph.1

loop2.loop_body11.lr.ph.1:                        ; preds = %loop1.loop_header4.loopexit
  %sunkaddr = getelementptr i8, ptr addrspace(3) %lsr.iv32, i64 -16
  %31 = load i32, ptr addrspace(3) %sunkaddr, align 4
  %sunkaddr50 = getelementptr i8, ptr addrspace(1) %lsr.iv38, i64 -320
  store i32 %31, ptr addrspace(1) %sunkaddr50, align 4
  br label %loop1.loop_header4.loopexit.1

loop1.loop_header4.loopexit.1:                    ; preds = %loop2.loop_body11.lr.ph.1, %loop1.loop_header4.loopexit
  %32 = icmp ugt i32 %14, 19
  br i1 %32, label %loop1.loop_header4.loopexit.2, label %loop2.loop_body11.lr.ph.2

loop2.loop_body11.lr.ph.2:                        ; preds = %loop1.loop_header4.loopexit.1
  %33 = load i32, ptr addrspace(3) %lsr.iv32, align 4
  store i32 %33, ptr addrspace(1) %lsr.iv38, align 4
  br label %loop1.loop_header4.loopexit.2

loop1.loop_header4.loopexit.2:                    ; preds = %loop2.loop_body11.lr.ph.2, %loop1.loop_header4.loopexit.1
  %34 = icmp ugt i32 %14, 19
  br i1 %34, label %loop1.loop_header4.loopexit.3, label %loop2.loop_body11.lr.ph.3

loop2.loop_body11.lr.ph.3:                        ; preds = %loop1.loop_header4.loopexit.2
  %sunkaddr51 = getelementptr i8, ptr addrspace(3) %lsr.iv32, i64 16
  %35 = load i32, ptr addrspace(3) %sunkaddr51, align 4
  %sunkaddr52 = getelementptr i8, ptr addrspace(1) %lsr.iv38, i64 320
  store i32 %35, ptr addrspace(1) %sunkaddr52, align 4
  br label %loop1.loop_header4.loopexit.3

loop1.loop_header4.loopexit.3:                    ; preds = %loop2.loop_body11.lr.ph.3, %loop1.loop_header4.loopexit.2
  %lsr.iv.next = add nsw i32 %lsr.iv, 16
  %scevgep30 = getelementptr i8, ptr addrspace(1) %lsr.iv29, i64 1280
  %scevgep33 = getelementptr i8, ptr addrspace(3) %lsr.iv32, i64 64
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv38, i64 1280
  %36 = icmp ugt i32 %lsr.iv.next, 15
  br i1 %36, label %loop1.loop_exit3, label %loop1.loop_body5, !llvm.loop !306

loop1.loop_body5:                                 ; preds = %loop1.loop_header4.loopexit.3, %loop1.loop_exit
  %lsr.iv38 = phi ptr addrspace(1) [ %scevgep39, %loop1.loop_header4.loopexit.3 ], [ %scevgep37, %loop1.loop_exit ]
  %lsr.iv32 = phi ptr addrspace(3) [ %scevgep33, %loop1.loop_header4.loopexit.3 ], [ %scevgep31, %loop1.loop_exit ]
  %lsr.iv29 = phi ptr addrspace(1) [ %scevgep30, %loop1.loop_header4.loopexit.3 ], [ %scevgep, %loop1.loop_exit ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %loop1.loop_header4.loopexit.3 ], [ %15, %loop1.loop_exit ]
  %37 = icmp ugt i32 %14, 19
  br i1 %37, label %loop1.loop_header4.loopexit, label %loop2.loop_body11.lr.ph

loop2.loop_body11.lr.ph:                          ; preds = %loop1.loop_body5
  %sunkaddr53 = getelementptr i8, ptr addrspace(3) %lsr.iv32, i64 -32
  %38 = load i32, ptr addrspace(3) %sunkaddr53, align 4
  store i32 %38, ptr addrspace(1) %lsr.iv29, align 4
  br label %loop1.loop_header4.loopexit

loop1.loop_exit3:                                 ; preds = %loop1.loop_header4.loopexit.3
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

; Function Attrs: norecurse nounwind
define void @wrapped_transpose_1(ptr noalias nocapture readonly align 16 dereferenceable(15360) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(15360) %arg1) local_unnamed_addr #2 {
entry:
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !302
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %tile_origin.2 = shl nuw nsw i32 %block.id.x, 5
  %1 = or disjoint i32 %thread.id.2, %tile_origin.2
  %2 = zext nneg i32 %1 to i64
  %3 = zext nneg i32 %thread.id.2 to i64
  %4 = add nuw nsw i32 %0, -4
  %5 = zext nneg i32 %thread.id.x to i64
  %6 = lshr i64 %5, 5
  %7 = mul nuw nsw i64 %6, 768
  %8 = shl nuw nsw i64 %2, 2
  %9 = add nuw nsw i64 %7, %8
  %scevgep44 = getelementptr i8, ptr addrspace(1) %arg019, i64 %9
  %10 = mul nuw nsw i64 %6, 132
  %11 = shl nuw nsw i64 %3, 2
  %12 = add nuw nsw i64 %10, %11
  %scevgep47 = getelementptr i8, ptr addrspace(3) @tr_tile_01, i64 %12
  br label %loop1.loop_body

loop1.loop_body:                                  ; preds = %entry, %loop1.loop_body
  %lsr.iv48 = phi ptr addrspace(3) [ %scevgep47, %entry ], [ %scevgep49, %loop1.loop_body ]
  %lsr.iv45 = phi ptr addrspace(1) [ %scevgep44, %entry ], [ %scevgep46, %loop1.loop_body ]
  %lsr.iv42 = phi i32 [ %4, %entry ], [ %lsr.iv.next43, %loop1.loop_body ]
  %param_0.30632 = load float, ptr addrspace(1) %lsr.iv45, align 4, !invariant.load !303
  store float %param_0.30632, ptr addrspace(3) %lsr.iv48, align 4
  %lsr.iv.next43 = add nsw i32 %lsr.iv42, 4
  %scevgep46 = getelementptr i8, ptr addrspace(1) %lsr.iv45, i64 3072
  %scevgep49 = getelementptr i8, ptr addrspace(3) %lsr.iv48, i64 528
  %13 = icmp ugt i32 %lsr.iv.next43, 15
  br i1 %13, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !307

loop1.loop_exit:                                  ; preds = %loop1.loop_body
  %14 = trunc i64 %3 to i32
  tail call void @llvm.nvvm.barrier0()
  %15 = add nuw nsw i32 %0, -16
  %16 = add i32 %0, %tile_origin.2
  %17 = zext nneg i32 %16 to i64
  %18 = mul nuw nsw i64 %17, 80
  %19 = add i64 %18, %11
  %scevgep = getelementptr i8, ptr addrspace(1) %arg121, i64 %19
  %20 = mul nuw nsw i64 %3, 132
  %21 = shl nuw nsw i64 %6, 2
  %22 = add i64 %20, %21
  %23 = add i64 %22, 32
  %scevgep31 = getelementptr i8, ptr addrspace(3) @tr_tile_01, i64 %23
  %24 = zext nneg i32 %block.id.x to i64
  %25 = mul nuw nsw i64 %24, 2560
  %26 = mul nuw nsw i64 %6, 80
  %27 = add i64 %25, %26
  %28 = add i64 %27, %11
  %29 = add i64 %28, 640
  %scevgep37 = getelementptr i8, ptr addrspace(1) %arg121, i64 %29
  br label %loop1.loop_body5

loop1.loop_header4.loopexit:                      ; preds = %loop2.loop_body11.lr.ph, %loop1.loop_body5
  %30 = icmp ugt i32 %14, 19
  br i1 %30, label %loop1.loop_header4.loopexit.1, label %loop2.loop_body11.lr.ph.1

loop2.loop_body11.lr.ph.1:                        ; preds = %loop1.loop_header4.loopexit
  %sunkaddr = getelementptr i8, ptr addrspace(3) %lsr.iv32, i64 -16
  %31 = load float, ptr addrspace(3) %sunkaddr, align 4
  %sunkaddr50 = getelementptr i8, ptr addrspace(1) %lsr.iv38, i64 -320
  store float %31, ptr addrspace(1) %sunkaddr50, align 4
  br label %loop1.loop_header4.loopexit.1

loop1.loop_header4.loopexit.1:                    ; preds = %loop2.loop_body11.lr.ph.1, %loop1.loop_header4.loopexit
  %32 = icmp ugt i32 %14, 19
  br i1 %32, label %loop1.loop_header4.loopexit.2, label %loop2.loop_body11.lr.ph.2

loop2.loop_body11.lr.ph.2:                        ; preds = %loop1.loop_header4.loopexit.1
  %33 = load float, ptr addrspace(3) %lsr.iv32, align 4
  store float %33, ptr addrspace(1) %lsr.iv38, align 4
  br label %loop1.loop_header4.loopexit.2

loop1.loop_header4.loopexit.2:                    ; preds = %loop2.loop_body11.lr.ph.2, %loop1.loop_header4.loopexit.1
  %34 = icmp ugt i32 %14, 19
  br i1 %34, label %loop1.loop_header4.loopexit.3, label %loop2.loop_body11.lr.ph.3

loop2.loop_body11.lr.ph.3:                        ; preds = %loop1.loop_header4.loopexit.2
  %sunkaddr51 = getelementptr i8, ptr addrspace(3) %lsr.iv32, i64 16
  %35 = load float, ptr addrspace(3) %sunkaddr51, align 4
  %sunkaddr52 = getelementptr i8, ptr addrspace(1) %lsr.iv38, i64 320
  store float %35, ptr addrspace(1) %sunkaddr52, align 4
  br label %loop1.loop_header4.loopexit.3

loop1.loop_header4.loopexit.3:                    ; preds = %loop2.loop_body11.lr.ph.3, %loop1.loop_header4.loopexit.2
  %lsr.iv.next = add nsw i32 %lsr.iv, 16
  %scevgep30 = getelementptr i8, ptr addrspace(1) %lsr.iv29, i64 1280
  %scevgep33 = getelementptr i8, ptr addrspace(3) %lsr.iv32, i64 64
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv38, i64 1280
  %36 = icmp ugt i32 %lsr.iv.next, 15
  br i1 %36, label %loop1.loop_exit3, label %loop1.loop_body5, !llvm.loop !308

loop1.loop_body5:                                 ; preds = %loop1.loop_header4.loopexit.3, %loop1.loop_exit
  %lsr.iv38 = phi ptr addrspace(1) [ %scevgep39, %loop1.loop_header4.loopexit.3 ], [ %scevgep37, %loop1.loop_exit ]
  %lsr.iv32 = phi ptr addrspace(3) [ %scevgep33, %loop1.loop_header4.loopexit.3 ], [ %scevgep31, %loop1.loop_exit ]
  %lsr.iv29 = phi ptr addrspace(1) [ %scevgep30, %loop1.loop_header4.loopexit.3 ], [ %scevgep, %loop1.loop_exit ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %loop1.loop_header4.loopexit.3 ], [ %15, %loop1.loop_exit ]
  %37 = icmp ugt i32 %14, 19
  br i1 %37, label %loop1.loop_header4.loopexit, label %loop2.loop_body11.lr.ph

loop2.loop_body11.lr.ph:                          ; preds = %loop1.loop_body5
  %sunkaddr53 = getelementptr i8, ptr addrspace(3) %lsr.iv32, i64 -32
  %38 = load float, ptr addrspace(3) %sunkaddr53, align 4
  store float %38, ptr addrspace(1) %lsr.iv29, align 4
  br label %loop1.loop_header4.loopexit

loop1.loop_exit3:                                 ; preds = %loop1.loop_header4.loopexit.3
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %1 = icmp slt i64 %0, 10
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_clamp_convert_fusion(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #4 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !303
  %1 = icmp slt i64 %0, 0
  %2 = add i64 %0, 10
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = trunc i64 %3 to i32
  %5 = tail call i32 @llvm.smax.i32(i32 %4, i32 0)
  %6 = tail call i32 @llvm.umin.i32(i32 %5, i32 9)
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr [10 x [2 x i64]], ptr addrspace(1) %arg08, i64 0, i64 %7, i64 0
  %9 = load <2 x i64>, ptr addrspace(1) %8, align 16, !invariant.load !303
  %10 = extractelement <2 x i64> %9, i32 0
  %11 = extractelement <2 x i64> %9, i32 1
  %12 = icmp ne i64 %11, 0
  %13 = zext i1 %12 to i32
  %14 = trunc i64 %10 to i32
  %15 = icmp sgt i32 %14, 0
  %16 = zext i1 %15 to i32
  store i32 %13, ptr addrspace(1) %arg212, align 128
  store i32 %16, ptr addrspace(1) %arg314, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #4 {
entry:
  %arg3173 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2171 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1169 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0167 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !309
  %1 = or disjoint i32 %0, 2
  %2 = load i64, ptr addrspace(1) %arg1169, align 128, !invariant.load !303
  %3 = icmp slt i64 %2, 0
  %4 = add i64 %2, 10
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 9)
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds [10 x [2 x i32]], ptr addrspace(1) %arg0167, i64 0, i64 %9, i64 0
  %11 = load <2 x i32>, ptr addrspace(1) %10, align 8, !invariant.load !303
  %12 = extractelement <2 x i32> %11, i32 0
  %13 = extractelement <2 x i32> %11, i32 1
  %14 = add i32 %12, %0
  %15 = add i32 %13, %1
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 13)
  %18 = xor i32 %16, %17
  %19 = add i32 %18, %16
  %20 = tail call i32 @llvm.fshl.i32(i32 %18, i32 %18, i32 15)
  %21 = xor i32 %19, %20
  %22 = add i32 %21, %19
  %23 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %21, i32 26)
  %24 = xor i32 %22, %23
  %25 = add i32 %24, %22
  %26 = add i32 %25, %13
  %27 = tail call i32 @llvm.fshl.i32(i32 %24, i32 %24, i32 6)
  %28 = xor i32 %25, %27
  %29 = xor i32 %12, %13
  %30 = xor i32 %29, 466688986
  %31 = add i32 %30, 1
  %32 = add i32 %31, %28
  %33 = add i32 %26, %32
  %34 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %32, i32 17)
  %35 = xor i32 %33, %34
  %36 = add i32 %35, %33
  %37 = tail call i32 @llvm.fshl.i32(i32 %35, i32 %35, i32 29)
  %38 = xor i32 %36, %37
  %39 = add i32 %38, %36
  %40 = tail call i32 @llvm.fshl.i32(i32 %38, i32 %38, i32 16)
  %41 = xor i32 %39, %40
  %42 = add i32 %41, %39
  %43 = add i32 %42, %30
  %44 = tail call i32 @llvm.fshl.i32(i32 %41, i32 %41, i32 24)
  %45 = xor i32 %42, %44
  %46 = add i32 %12, 2
  %47 = add i32 %46, %45
  %48 = add i32 %43, %47
  %49 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 13)
  %50 = xor i32 %48, %49
  %51 = add i32 %50, %48
  %52 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 15)
  %53 = xor i32 %51, %52
  %54 = add i32 %53, %51
  %55 = tail call i32 @llvm.fshl.i32(i32 %53, i32 %53, i32 26)
  %56 = xor i32 %54, %55
  %57 = add i32 %56, %54
  %58 = add i32 %57, %12
  %59 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 6)
  %60 = xor i32 %57, %59
  %61 = add i32 %13, 3
  %62 = add i32 %61, %60
  %63 = add i32 %58, %62
  %64 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 17)
  %65 = xor i32 %63, %64
  %66 = add i32 %65, %63
  %67 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 29)
  %68 = xor i32 %66, %67
  %69 = add i32 %68, %66
  %70 = tail call i32 @llvm.fshl.i32(i32 %68, i32 %68, i32 16)
  %71 = xor i32 %69, %70
  %72 = add i32 %71, %69
  %73 = add i32 %72, %13
  %74 = tail call i32 @llvm.fshl.i32(i32 %71, i32 %71, i32 24)
  %75 = xor i32 %72, %74
  %76 = add i32 %30, 4
  %77 = add i32 %76, %75
  %78 = add i32 %73, %77
  %79 = tail call i32 @llvm.fshl.i32(i32 %77, i32 %77, i32 13)
  %80 = xor i32 %78, %79
  %81 = add i32 %80, %78
  %82 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 15)
  %83 = xor i32 %81, %82
  %84 = add i32 %83, %81
  %85 = tail call i32 @llvm.fshl.i32(i32 %83, i32 %83, i32 26)
  %86 = xor i32 %84, %85
  %87 = add i32 %86, %84
  %88 = tail call i32 @llvm.fshl.i32(i32 %86, i32 %86, i32 6)
  %89 = xor i32 %87, %88
  %90 = add i32 %12, 5
  %91 = add i32 %90, %89
  %92 = add i32 %87, %30
  %93 = zext nneg i32 %0 to i64
  %94 = getelementptr i32, ptr addrspace(1) %arg2171, i64 %93
  store i32 %91, ptr addrspace(1) %94, align 4
  %95 = getelementptr i32, ptr addrspace(1) %arg3173, i64 %93
  store i32 %92, ptr addrspace(1) %95, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(960) %arg2) local_unnamed_addr #4 {
entry:
  %arg247 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg145 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg043 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !310
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg043, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %4 = load <2 x i32>, ptr addrspace(1) %arg145, align 128, !invariant.load !303
  %5 = extractelement <2 x i32> %4, i32 0
  %6 = extractelement <2 x i32> %4, i32 1
  %7 = add i32 %5, %0
  %8 = add nuw nsw i32 %0, 120
  %9 = add i32 %8, %6
  %10 = add i32 %7, %9
  %11 = tail call i32 @llvm.fshl.i32(i32 %9, i32 %9, i32 13)
  %12 = xor i32 %10, %11
  %13 = add i32 %12, %10
  %14 = tail call i32 @llvm.fshl.i32(i32 %12, i32 %12, i32 15)
  %15 = xor i32 %13, %14
  %16 = add i32 %15, %13
  %17 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 26)
  %18 = xor i32 %16, %17
  %19 = add i32 %18, %16
  %20 = add i32 %19, %6
  %21 = tail call i32 @llvm.fshl.i32(i32 %18, i32 %18, i32 6)
  %22 = xor i32 %19, %21
  %23 = xor i32 %5, %6
  %24 = xor i32 %23, 466688986
  %25 = add i32 %24, 1
  %26 = add i32 %25, %22
  %27 = add i32 %20, %26
  %28 = tail call i32 @llvm.fshl.i32(i32 %26, i32 %26, i32 17)
  %29 = xor i32 %27, %28
  %30 = add i32 %29, %27
  %31 = tail call i32 @llvm.fshl.i32(i32 %29, i32 %29, i32 29)
  %32 = xor i32 %30, %31
  %33 = add i32 %32, %30
  %34 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %32, i32 16)
  %35 = xor i32 %33, %34
  %36 = add i32 %35, %33
  %37 = add i32 %36, %24
  %38 = tail call i32 @llvm.fshl.i32(i32 %35, i32 %35, i32 24)
  %39 = xor i32 %36, %38
  %40 = add i32 %5, 2
  %41 = add i32 %40, %39
  %42 = add i32 %37, %41
  %43 = tail call i32 @llvm.fshl.i32(i32 %41, i32 %41, i32 13)
  %44 = xor i32 %42, %43
  %45 = add i32 %44, %42
  %46 = tail call i32 @llvm.fshl.i32(i32 %44, i32 %44, i32 15)
  %47 = xor i32 %45, %46
  %48 = add i32 %47, %45
  %49 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 26)
  %50 = xor i32 %48, %49
  %51 = add i32 %50, %48
  %52 = add i32 %51, %5
  %53 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 6)
  %54 = xor i32 %51, %53
  %55 = add i32 %6, 3
  %56 = add i32 %55, %54
  %57 = add i32 %52, %56
  %58 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 17)
  %59 = xor i32 %57, %58
  %60 = add i32 %59, %57
  %61 = tail call i32 @llvm.fshl.i32(i32 %59, i32 %59, i32 29)
  %62 = xor i32 %60, %61
  %63 = add i32 %62, %60
  %64 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 16)
  %65 = xor i32 %63, %64
  %66 = add i32 %65, %63
  %67 = add i32 %66, %6
  %68 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 24)
  %69 = xor i32 %66, %68
  %70 = add i32 %24, 4
  %71 = add i32 %70, %69
  %72 = add i32 %67, %71
  %73 = tail call i32 @llvm.fshl.i32(i32 %71, i32 %71, i32 13)
  %74 = xor i32 %72, %73
  %75 = add i32 %74, %72
  %76 = tail call i32 @llvm.fshl.i32(i32 %74, i32 %74, i32 15)
  %77 = xor i32 %75, %76
  %78 = add i32 %77, %75
  %79 = tail call i32 @llvm.fshl.i32(i32 %77, i32 %77, i32 26)
  %80 = xor i32 %78, %79
  %81 = add i32 %80, %78
  %82 = add i32 %81, %24
  %83 = zext i32 %82 to i64
  %84 = shl nuw i64 %83, 32
  %85 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 6)
  %86 = xor i32 %81, %85
  %87 = add i32 %5, 5
  %88 = add i32 %87, %86
  %89 = zext i32 %88 to i64
  %90 = or disjoint i64 %84, %89
  %91 = lshr i64 %90, 12
  %92 = or disjoint i64 %91, 4607182418800017408
  %93 = bitcast i64 %92 to double
  %add.4161.5 = fadd double %93, -1.000000e+00
  %multiply.2984.5 = fmul double %add.4161.5, 2.000000e+00
  %add.4162.3 = fadd double %multiply.2984.5, 0xBFEFFFFFFFFFFFFF
  %94 = fcmp ugt double %add.4162.3, 0xBFEFFFFFFFFFFFFF
  %maximum.44.3 = select i1 %94, double %add.4162.3, double 0xBFEFFFFFFFFFFFFF
  %95 = fneg double %maximum.44.3
  %multiply.2986.3 = fmul double %maximum.44.3, %95
  %96 = tail call i32 @llvm.nvvm.d2i.hi(double %multiply.2986.3) #12
  %97 = bitcast i32 %96 to float
  %98 = fcmp olt float %97, 0x3FFCAAAAA0000000
  %99 = fcmp ogt float %97, 0xBFFB333320000000
  %or.cond.i = and i1 %98, %99
  br i1 %or.cond.i, label %100, label %117

100:                                              ; preds = %entry
  %101 = fadd double %multiply.2986.3, 2.000000e+00
  %102 = fdiv double %multiply.2986.3, %101
  %103 = fneg double %multiply.2986.3
  %104 = fmul double %102, %103
  %105 = fadd double %multiply.2986.3, %104
  %106 = fmul double %105, %105
  %107 = tail call double @llvm.fma.f64(double %106, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %108 = tail call double @llvm.fma.f64(double %107, double %106, double 0x3EF3B9FF890F468C)
  %109 = tail call double @llvm.fma.f64(double %108, double %106, double 0x3F17457EFD51BAF8)
  %110 = tail call double @llvm.fma.f64(double %109, double %106, double 0x3F3C71C8DE3CE825)
  %111 = tail call double @llvm.fma.f64(double %110, double %106, double 0x3F6249248FA4661F)
  %112 = tail call double @llvm.fma.f64(double %111, double %106, double 0x3F899999999D70C4)
  %113 = tail call double @llvm.fma.f64(double %112, double %106, double 0x3FB5555555555462)
  %114 = fmul double %106, %113
  %115 = tail call double @llvm.fma.f64(double %114, double %105, double %104)
  %116 = fadd double %multiply.2986.3, %115
  br label %__nv_log1p.exit

117:                                              ; preds = %entry
  %118 = fadd double %multiply.2986.3, 1.000000e+00
  %119 = tail call i32 @llvm.nvvm.d2i.hi(double %118) #12
  %120 = tail call i32 @llvm.nvvm.d2i.lo(double %118) #12
  %121 = icmp slt i32 %119, 1048576
  %122 = fmul double %118, 0x4350000000000000
  %123 = tail call i32 @llvm.nvvm.d2i.lo(double %122) #12
  %124 = tail call i32 @llvm.nvvm.d2i.hi(double %122) #12
  br i1 %121, label %125, label %126

125:                                              ; preds = %117
  br label %126

126:                                              ; preds = %125, %117
  %.0.i = phi double [ %122, %125 ], [ %118, %117 ]
  %ihi.i.0.i = phi i32 [ %124, %125 ], [ %119, %117 ]
  %ilo.i.0.i = phi i32 [ %123, %125 ], [ %120, %117 ]
  %e.i.0.i = phi i32 [ -1077, %125 ], [ -1023, %117 ]
  %127 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %127, 2146435071
  br i1 %or.cond2.i, label %128, label %175

128:                                              ; preds = %126
  %129 = lshr i32 %ihi.i.0.i, 20
  %130 = add nsw i32 %e.i.0.i, %129
  %131 = and i32 %ihi.i.0.i, 1048575
  %132 = or disjoint i32 %131, 1072693248
  %133 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %132) #12
  %134 = icmp ugt i32 %132, 1073127582
  %135 = tail call i32 @llvm.nvvm.d2i.lo(double %133) #12
  %136 = tail call i32 @llvm.nvvm.d2i.hi(double %133) #12
  %137 = add i32 %136, -1048576
  %138 = tail call double @llvm.nvvm.lohi.i2d(i32 %135, i32 %137) #12
  %spec.select = select i1 %134, double %138, double %133
  %139 = zext i1 %134 to i32
  %spec.select42 = add nsw i32 %130, %139
  %140 = fadd double %spec.select, -1.000000e+00
  %141 = fadd double %spec.select, 1.000000e+00
  %142 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %141) #12
  %143 = fneg double %141
  %144 = tail call double @llvm.fma.f64(double %143, double %142, double 1.000000e+00)
  %145 = tail call double @llvm.fma.f64(double %144, double %144, double %144)
  %146 = tail call double @llvm.fma.f64(double %145, double %142, double %142)
  %147 = fmul double %140, %146
  %148 = fadd double %147, %147
  %149 = fmul double %148, %148
  %150 = tail call double @llvm.fma.f64(double %149, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %151 = tail call double @llvm.fma.f64(double %150, double %149, double 0x3EF3B2669F02676F)
  %152 = tail call double @llvm.fma.f64(double %151, double %149, double 0x3F1745CBA9AB0956)
  %153 = tail call double @llvm.fma.f64(double %152, double %149, double 0x3F3C71C72D1B5154)
  %154 = tail call double @llvm.fma.f64(double %153, double %149, double 0x3F624924923BE72D)
  %155 = tail call double @llvm.fma.f64(double %154, double %149, double 0x3F8999999999A3C4)
  %156 = tail call double @llvm.fma.f64(double %155, double %149, double 0x3FB5555555555554)
  %157 = fsub double %140, %148
  %158 = fmul double %157, 2.000000e+00
  %159 = fneg double %148
  %160 = tail call double @llvm.fma.f64(double %159, double %140, double %158)
  %161 = fmul double %146, %160
  %162 = fmul double %149, %156
  %163 = tail call double @llvm.fma.f64(double %162, double %148, double %161)
  %164 = xor i32 %spec.select42, -2147483648
  %165 = tail call double @llvm.nvvm.lohi.i2d(i32 %164, i32 1127219200) #12
  %166 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %167 = fsub double %165, %166
  %168 = tail call double @llvm.fma.f64(double %167, double 0x3FE62E42FEFA39EF, double %148)
  %169 = fneg double %167
  %170 = tail call double @llvm.fma.f64(double %169, double 0x3FE62E42FEFA39EF, double %168)
  %171 = fsub double %170, %148
  %172 = fsub double %163, %171
  %173 = tail call double @llvm.fma.f64(double %167, double 0x3C7ABC9E3B39803F, double %172)
  %174 = fadd double %168, %173
  br label %__nv_log1p.exit

175:                                              ; preds = %126
  %176 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %177 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %178 = and i32 %177, 2147483647
  %179 = icmp eq i32 %178, 0
  %q.i.0.i = select i1 %179, double 0xFFF0000000000000, double %176
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %100, %128, %175
  %t.0.i = phi double [ %116, %100 ], [ %174, %128 ], [ %q.i.0.i, %175 ]
  %180 = fcmp ugt double %add.4162.3, 0xBFEFFFFFFFFFFFFF
  %181 = tail call double @llvm.fabs.f64(double %add.4162.3)
  %182 = fcmp oeq double %181, 1.000000e+00
  %compare.665.1 = and i1 %180, %182
  %183 = tail call double @llvm.nvvm.rsqrt.approx.d(double %3)
  %184 = fneg double %t.0.i
  %compare.666.1 = fcmp ogt double %t.0.i, -6.250000e+00
  %compare.667.1 = fcmp ogt double %t.0.i, -1.600000e+01
  %185 = select i1 %compare.666.1, double 0x3F2879C2A212F024, double 0x4008ABCC380D5A48
  %186 = select i1 %compare.666.1, double 0xBEED1D1F7B8736F6, double 0x3FF0158A6D641D39
  %187 = select i1 %compare.666.1, double 0xBEB6E8A5434AE8A2, double 0x3F75FFCFE5B76AFC
  %188 = select i1 %compare.667.1, double %187, double 0x4013664DDD1AD7FB
  %189 = select i1 %compare.666.1, double 0x3E9C6B4F5D03B787, double 0xBF6EBADABB891BBD
  %190 = select i1 %compare.667.1, double %189, double 0x3FF02A30D1FBA0DC
  %191 = select i1 %compare.666.1, double 0xBE5F36CD6D3D46A9, double 0x3F6468EECA533CF8
  %192 = select i1 %compare.667.1, double %191, double 0xBF222EA5DF04047C
  %193 = select i1 %compare.666.1, double 0xBE31A9E38DC84D60, double 0xBF5BA924132F38B1
  %194 = select i1 %compare.667.1, double %193, double 0xBF2C2F36A8FC5D53
  %195 = select i1 %compare.666.1, double 0x3E120F47CCF46B3C, double 0x3F4F3CC55AD40C25
  %196 = select i1 %compare.667.1, double %195, double 0x3F13EBF4EB00938F
  %197 = select i1 %compare.666.1, double 0xBDCDC583D118A561, double 0xBF37448A89EF8AA3
  %198 = select i1 %compare.667.1, double %197, double 0xBEF4A3497E1E0FAC
  %199 = select i1 %compare.666.1, double 0xBDAC8859C4E5C0AF, double 0x3EF932CD54C8A222
  %200 = select i1 %compare.667.1, double %199, double 0x3ED2FBD29D093D2B
  %201 = select i1 %compare.666.1, double 0x3D872A22C2D77E20, double 0x3F11E684D0B9188A
  %202 = select i1 %compare.667.1, double %201, double 0xBEB0A8D40EA372CC
  %203 = select i1 %compare.666.1, double 0xBD36F2167040D8E2, double 0xBF08CEF1F80281F2
  %204 = select i1 %compare.667.1, double %203, double 0x3E8EBC8BB824CB54
  %205 = select i1 %compare.666.1, double 0xBD26D33EED66C487, double 0x3EEA29A0CACDFB23
  %206 = select i1 %compare.667.1, double %205, double 0xBE722D220FDF9C3E
  %207 = select i1 %compare.666.1, double 0x3CFDE4ACFD9E26BA, double 0x3EC8860CD5D652F6
  %208 = select i1 %compare.667.1, double %207, double 0x3E5F4C20E1334AF8
  %209 = select i1 %compare.666.1, double 0x3C782E11898132E0, double 0xBED0D5DB812B5083
  %210 = select i1 %compare.667.1, double %209, double 0xBE50102E495FB9C0
  %211 = select i1 %compare.666.1, double 0xBCA33689090A6B96, double 0x3EB936388A3790AD
  %212 = select i1 %compare.667.1, double %211, double 0x3E405AC6A8FBA182
  %213 = select i1 %compare.666.1, double 0x3C69BA72CD589B91, double 0x3E5395ABCD554C6C
  %214 = select i1 %compare.667.1, double %213, double 0xBE30468FB24E2F5F
  %215 = select i1 %compare.666.1, double 0x3C37B83EEF0B7C9F, double 0xBE92777453DD3955
  %216 = select i1 %compare.667.1, double %215, double 0x3E19E6BF2DDA45E3
  %217 = select i1 %compare.666.1, double 0xBC08DDF93324D327, double 0x3E785CBE52878635
  %218 = select i1 %compare.667.1, double %217, double 0xBDF18FEEC0E38727
  %219 = select i1 %compare.666.1, double 0xBBB135D2E746E627, double 0x3E23040F87DBD932
  %220 = select i1 %compare.667.1, double %219, double 0xBDBDCEC3A7785389
  %add.4163.3 = fsub double -3.125000e+00, %t.0.i
  %221 = tail call double @llvm.sqrt.f64(double %184)
  %222 = select i1 %compare.667.1, double 3.250000e+00, double 5.000000e+00
  %subtract.241.5 = fsub double %221, %222
  %223 = select i1 %compare.666.1, double %add.4163.3, double %subtract.241.5
  %multiply.2987.3 = fmul double %220, %223
  %add.4164.3 = fadd double %218, %multiply.2987.3
  %multiply.2988.3 = fmul double %223, %add.4164.3
  %add.4165.3 = fadd double %216, %multiply.2988.3
  %multiply.2989.3 = fmul double %223, %add.4165.3
  %add.4166.3 = fadd double %214, %multiply.2989.3
  %multiply.2990.1 = fmul double %223, %add.4166.3
  %add.4167.1 = fadd double %212, %multiply.2990.1
  %multiply.2991.3 = fmul double %223, %add.4167.1
  %add.4168.3 = fadd double %210, %multiply.2991.3
  %multiply.2992.3 = fmul double %223, %add.4168.3
  %add.4169.3 = fadd double %208, %multiply.2992.3
  %multiply.2993.3 = fmul double %223, %add.4169.3
  %add.4170.3 = fadd double %206, %multiply.2993.3
  %multiply.2994.1 = fmul double %223, %add.4170.3
  %add.4171.1 = fadd double %204, %multiply.2994.1
  %multiply.2995.3 = fmul double %223, %add.4171.1
  %add.4172.3 = fadd double %202, %multiply.2995.3
  %multiply.2996.3 = fmul double %223, %add.4172.3
  %add.4173.3 = fadd double %200, %multiply.2996.3
  %multiply.2997.3 = fmul double %223, %add.4173.3
  %add.4174.3 = fadd double %198, %multiply.2997.3
  %multiply.2998.1 = fmul double %223, %add.4174.3
  %add.4175.1 = fadd double %196, %multiply.2998.1
  %multiply.2999.3 = fmul double %223, %add.4175.1
  %add.4176.3 = fadd double %194, %multiply.2999.3
  %multiply.3000.3 = fmul double %223, %add.4176.3
  %add.4177.3 = fadd double %192, %multiply.3000.3
  %multiply.3001.1 = fmul double %223, %add.4177.3
  %add.4178.1 = fadd double %190, %multiply.3001.1
  %multiply.3002.1 = fmul double %223, %add.4178.1
  %add.4179.1 = fadd double %188, %multiply.3002.1
  %multiply.3003.1 = fmul double %223, %add.4179.1
  %add.4180.1 = fadd double %186, %multiply.3003.1
  %224 = select i1 %compare.667.1, double %add.4180.1, double %add.4179.1
  %multiply.3004.1 = fmul double %223, %224
  %add.4181.1 = fadd double %185, %multiply.3004.1
  %225 = select i1 %compare.667.1, double %add.4181.1, double %add.4179.1
  %multiply.3005.1 = fmul double %223, %225
  %add.4182.1 = fadd double %multiply.3005.1, 0xBF4845769484FCA8
  %226 = select i1 %compare.666.1, double %add.4182.1, double %225
  %multiply.3006.1 = fmul double %223, %226
  %add.4183.1 = fadd double %multiply.3006.1, 0xBF78B6C33114F909
  %227 = select i1 %compare.666.1, double %add.4183.1, double %225
  %multiply.3007.1 = fmul double %223, %227
  %add.4184.1 = fadd double %multiply.3007.1, 0x3FCEBD80D9B13E28
  %228 = select i1 %compare.666.1, double %add.4184.1, double %225
  %multiply.3008.1 = fmul double %223, %228
  %add.4185.1 = fadd double %multiply.3008.1, 0x3FFA755E7C99AE86
  %229 = select i1 %compare.666.1, double %add.4185.1, double %225
  %.v = select i1 %compare.665.1, double 0x7FF0000000000000, double %229
  %230 = fmul double %maximum.44.3, %.v
  %multiply.3010.1 = fmul double %230, 0x3FF6A09E667F3BCD
  %multiply.3011.1 = fmul double %183, %multiply.3010.1
  %231 = getelementptr double, ptr addrspace(1) %arg247, i64 %1
  store double %multiply.3011.1, ptr addrspace(1) %231, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(960) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #2 {
entry:
  %arg268 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg166 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg064 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !311
  %0 = shl nuw nsw i32 %thread.id.x, 1
  %1 = zext nneg i32 %0 to i64
  %param_1.419118 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg166, i64 0, i64 %1
  %2 = load <2 x double>, ptr addrspace(1) %param_1.419118, align 16, !invariant.load !303
  %param_1.41911978 = extractelement <2 x double> %2, i32 0
  %param_1.419119.179 = extractelement <2 x double> %2, i32 1
  %param_0.293920 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg064, i64 0, i64 %1
  %3 = load <2 x double>, ptr addrspace(1) %param_0.293920, align 16, !invariant.load !303
  %param_0.29392180 = extractelement <2 x double> %3, i32 0
  %param_0.293921.181 = extractelement <2 x double> %3, i32 1
  %multiply.3012.322 = fmul double %param_1.41911978, %param_0.29392180
  %multiply.3013.325 = fmul double %param_0.29392180, %multiply.3012.322
  %add.3619.i52 = fadd double %multiply.3013.325, 0.000000e+00
  %multiply.3012.322.1 = fmul double %param_1.419119.179, %param_0.293921.181
  %multiply.3013.325.1 = fmul double %param_0.293921.181, %multiply.3012.322.1
  %add.3619.i52.1 = fadd double %add.3619.i52, %multiply.3013.325.1
  %4 = or disjoint i32 %thread.id.x, 32
  %5 = icmp ult i32 %4, 60
  br i1 %5, label %loop3.loop_header13.preheader.1, label %x_in_tile-after.7

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true.then
  ret void

loop3.loop_header13.preheader.1:                  ; preds = %entry
  %6 = shl nuw nsw i32 %4, 1
  %7 = zext nneg i32 %6 to i64
  %param_1.419118.157 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg166, i64 0, i64 %7
  %8 = load <2 x double>, ptr addrspace(1) %param_1.419118.157, align 16, !invariant.load !303
  %param_1.419119.15874 = extractelement <2 x double> %8, i32 0
  %param_1.419119.1.175 = extractelement <2 x double> %8, i32 1
  %param_0.293920.159 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg064, i64 0, i64 %7
  %9 = load <2 x double>, ptr addrspace(1) %param_0.293920.159, align 16, !invariant.load !303
  %param_0.293921.16076 = extractelement <2 x double> %9, i32 0
  %param_0.293921.1.177 = extractelement <2 x double> %9, i32 1
  %multiply.3012.322.161 = fmul double %param_1.419119.15874, %param_0.293921.16076
  %multiply.3013.325.162 = fmul double %param_0.293921.16076, %multiply.3012.322.161
  %add.3619.i52.163 = fadd double %add.3619.i52.1, %multiply.3013.325.162
  %multiply.3012.322.1.1 = fmul double %param_1.419119.1.175, %param_0.293921.1.177
  %multiply.3013.325.1.1 = fmul double %param_0.293921.1.177, %multiply.3012.322.1.1
  %add.3619.i52.1.1 = fadd double %add.3619.i52.163, %multiply.3013.325.1.1
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %loop3.loop_header13.preheader.1, %entry
  %partial_reduction_result.1.1 = phi double [ %add.3619.i52.1, %entry ], [ %add.3619.i52.1.1, %loop3.loop_header13.preheader.1 ]
  %10 = bitcast double %partial_reduction_result.1.1 to <2 x i32>
  %11 = extractelement <2 x i32> %10, i64 0
  %12 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %11, i32 16, i32 31)
  %13 = insertelement <2 x i32> poison, i32 %12, i64 0
  %14 = extractelement <2 x i32> %10, i64 1
  %15 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 16, i32 31)
  %16 = insertelement <2 x i32> %13, i32 %15, i64 1
  %17 = bitcast <2 x i32> %16 to double
  %add.3619.i = fadd double %partial_reduction_result.1.1, %17
  %18 = bitcast double %add.3619.i to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 8, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 8, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.3619.i48 = fadd double %add.3619.i, %25
  %26 = bitcast double %add.3619.i48 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 4, i32 31)
  %29 = insertelement <2 x i32> poison, i32 %28, i64 0
  %30 = extractelement <2 x i32> %26, i64 1
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 4, i32 31)
  %32 = insertelement <2 x i32> %29, i32 %31, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.3619.i49 = fadd double %add.3619.i48, %33
  %34 = bitcast double %add.3619.i49 to <2 x i32>
  %35 = extractelement <2 x i32> %34, i64 0
  %36 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %35, i32 2, i32 31)
  %37 = insertelement <2 x i32> poison, i32 %36, i64 0
  %38 = extractelement <2 x i32> %34, i64 1
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 2, i32 31)
  %40 = insertelement <2 x i32> %37, i32 %39, i64 1
  %41 = bitcast <2 x i32> %40 to double
  %add.3619.i50 = fadd double %add.3619.i49, %41
  %42 = bitcast double %add.3619.i50 to <2 x i32>
  %43 = extractelement <2 x i32> %42, i64 0
  %44 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %43, i32 1, i32 31)
  %45 = extractelement <2 x i32> %42, i64 1
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 1, i32 31)
  %47 = icmp eq i32 %thread.id.x, 0
  %48 = insertelement <2 x i32> poison, i32 %44, i64 0
  %49 = insertelement <2 x i32> %48, i32 %46, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.3619.i51 = fadd double %add.3619.i50, %50
  br i1 %47, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %51 = icmp eq i32 %thread.id.x, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %51, label %reduction_write_output-true.then, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3619.i51, ptr addrspace(3) @"shared_cache_$_0", align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true.then:                 ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) @"shared_cache_$_0", align 8
  store double %output.then.val, ptr addrspace(1) %arg268, align 128
  br label %reduce-group-0-after
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_18(ptr noalias nocapture align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %1 = load double, ptr addrspace(1) %arg01, align 128
  %multiply.3014.1 = fmul double %1, 5.000000e-01
  %add.4186.1 = fsub double %multiply.3014.1, %0
  store double %add.4186.1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_5(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [120 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 800
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %4, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_4(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [120 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 640
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %4, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_3(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [120 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 480
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %4, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_2(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [120 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 320
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %4, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %3, ptr addrspace(1) %4, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_slice_1(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr [120 x double], ptr addrspace(1) %arg01, i64 0, i64 %1
  %3 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 160
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %4, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_112(ptr noalias nocapture writeonly align 128 dereferenceable(1600) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.3451 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.3451, 0
  %2 = add i64 %param_2.3451, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.3451
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.41664 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr inbounds [10 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.41664, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(9600) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !309
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1200
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.18.in_bounds-true, label %loop_broadcast_fusion.18.in_bounds-after

loop_broadcast_fusion.18.in_bounds-after:         ; preds = %loop_broadcast_fusion.18.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.18.in_bounds-true:          ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.18.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_and_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #4 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %1 = icmp slt i64 %0, 10
  %2 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %3 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %4 = or i8 %3, %2
  %5 = trunc i8 %4 to i1
  %6 = xor i1 %5, true
  %7 = and i1 %1, %6
  %8 = zext i1 %7 to i8
  store i8 %8, ptr addrspace(1) %arg37, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #4 {
entry:
  %arg128 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg026 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg026, align 128, !invariant.load !303
  %1 = and i64 %0, 32
  %2 = and i64 %0, 16
  %3 = and i64 %0, 8
  %4 = and i64 %0, 4
  %5 = and i64 %0, 2
  %6 = and i64 %0, 1
  %.not25 = icmp eq i64 %6, 0
  %7 = select i1 %.not25, i64 1, i64 2
  %8 = shl nuw nsw i64 %7, %5
  %9 = shl nuw nsw i64 %8, %4
  %10 = shl nuw nsw i64 %9, %3
  %11 = shl nuw nsw i64 %10, %2
  %12 = shl nuw i64 %11, %1
  store i64 %12, ptr addrspace(1) %arg128, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg4) local_unnamed_addr #4 {
entry:
  %arg4433 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3431 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2429 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1427 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0425 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg1427, align 128, !invariant.load !303
  %1 = trunc i64 %0 to i32
  %2 = load <2 x i32>, ptr addrspace(1) %arg0425, align 128, !invariant.load !303
  %3 = extractelement <2 x i32> %2, i32 0
  %4 = extractelement <2 x i32> %2, i32 1
  %5 = add i32 %4, %1
  %6 = add i32 %5, %3
  %7 = tail call i32 @llvm.fshl.i32(i32 %5, i32 %5, i32 13)
  %8 = xor i32 %6, %7
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.fshl.i32(i32 %8, i32 %8, i32 15)
  %11 = xor i32 %9, %10
  %12 = add i32 %11, %9
  %13 = tail call i32 @llvm.fshl.i32(i32 %11, i32 %11, i32 26)
  %14 = xor i32 %12, %13
  %15 = add i32 %14, %12
  %16 = add i32 %15, %4
  %17 = tail call i32 @llvm.fshl.i32(i32 %14, i32 %14, i32 6)
  %18 = xor i32 %15, %17
  %19 = xor i32 %3, %4
  %20 = xor i32 %19, 466688986
  %21 = add i32 %20, 1
  %22 = add i32 %21, %18
  %23 = add i32 %16, %22
  %24 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 17)
  %25 = xor i32 %23, %24
  %26 = add i32 %25, %23
  %27 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 29)
  %28 = xor i32 %26, %27
  %29 = add i32 %28, %26
  %30 = tail call i32 @llvm.fshl.i32(i32 %28, i32 %28, i32 16)
  %31 = xor i32 %29, %30
  %32 = add i32 %31, %29
  %33 = add i32 %32, %20
  %34 = tail call i32 @llvm.fshl.i32(i32 %31, i32 %31, i32 24)
  %35 = xor i32 %32, %34
  %36 = add i32 %3, 2
  %37 = add i32 %36, %35
  %38 = add i32 %33, %37
  %39 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 13)
  %40 = xor i32 %38, %39
  %41 = add i32 %40, %38
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 15)
  %43 = xor i32 %41, %42
  %44 = add i32 %43, %41
  %45 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 26)
  %46 = xor i32 %44, %45
  %47 = add i32 %46, %44
  %48 = add i32 %47, %3
  %49 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 6)
  %50 = xor i32 %47, %49
  %51 = add i32 %4, 3
  %52 = add i32 %51, %50
  %53 = add i32 %48, %52
  %54 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 17)
  %55 = xor i32 %53, %54
  %56 = add i32 %55, %53
  %57 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %55, i32 29)
  %58 = xor i32 %56, %57
  %59 = add i32 %58, %56
  %60 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 16)
  %61 = xor i32 %59, %60
  %62 = add i32 %61, %59
  %63 = add i32 %62, %4
  %64 = tail call i32 @llvm.fshl.i32(i32 %61, i32 %61, i32 24)
  %65 = xor i32 %62, %64
  %66 = add i32 %20, 4
  %67 = add i32 %66, %65
  %68 = add i32 %63, %67
  %69 = tail call i32 @llvm.fshl.i32(i32 %67, i32 %67, i32 13)
  %70 = xor i32 %68, %69
  %71 = add i32 %70, %68
  %72 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 15)
  %73 = xor i32 %71, %72
  %74 = add i32 %73, %71
  %75 = tail call i32 @llvm.fshl.i32(i32 %73, i32 %73, i32 26)
  %76 = xor i32 %74, %75
  %77 = add i32 %76, %74
  %78 = add i32 %77, %20
  %79 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 6)
  %80 = xor i32 %77, %79
  %81 = add i32 %80, %3
  %82 = add i32 %81, 5
  %83 = add i32 %81, 8
  %84 = add i32 %83, %78
  %85 = tail call i32 @llvm.fshl.i32(i32 %83, i32 %83, i32 13)
  %86 = xor i32 %84, %85
  %87 = add i32 %86, %84
  %88 = tail call i32 @llvm.fshl.i32(i32 %86, i32 %86, i32 15)
  %89 = xor i32 %87, %88
  %90 = add i32 %89, %87
  %91 = tail call i32 @llvm.fshl.i32(i32 %89, i32 %89, i32 26)
  %92 = xor i32 %90, %91
  %93 = add i32 %92, %90
  %94 = add i32 %93, %82
  %95 = tail call i32 @llvm.fshl.i32(i32 %92, i32 %92, i32 6)
  %96 = xor i32 %93, %95
  %97 = xor i32 %78, %82
  %98 = xor i32 %97, 466688986
  %99 = add i32 %98, 1
  %100 = add i32 %99, %96
  %101 = add i32 %94, %100
  %102 = tail call i32 @llvm.fshl.i32(i32 %100, i32 %100, i32 17)
  %103 = xor i32 %101, %102
  %104 = add i32 %103, %101
  %105 = tail call i32 @llvm.fshl.i32(i32 %103, i32 %103, i32 29)
  %106 = xor i32 %104, %105
  %107 = add i32 %106, %104
  %108 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %106, i32 16)
  %109 = xor i32 %107, %108
  %110 = add i32 %109, %107
  %111 = add i32 %110, %98
  %112 = tail call i32 @llvm.fshl.i32(i32 %109, i32 %109, i32 24)
  %113 = xor i32 %110, %112
  %114 = add i32 %78, 2
  %115 = add i32 %114, %113
  %116 = add i32 %111, %115
  %117 = tail call i32 @llvm.fshl.i32(i32 %115, i32 %115, i32 13)
  %118 = xor i32 %116, %117
  %119 = add i32 %118, %116
  %120 = tail call i32 @llvm.fshl.i32(i32 %118, i32 %118, i32 15)
  %121 = xor i32 %119, %120
  %122 = add i32 %121, %119
  %123 = tail call i32 @llvm.fshl.i32(i32 %121, i32 %121, i32 26)
  %124 = xor i32 %122, %123
  %125 = add i32 %124, %122
  %126 = add i32 %125, %78
  %127 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %124, i32 6)
  %128 = xor i32 %125, %127
  %129 = add i32 %83, %128
  %130 = add i32 %126, %129
  %131 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %129, i32 17)
  %132 = xor i32 %130, %131
  %133 = add i32 %132, %130
  %134 = tail call i32 @llvm.fshl.i32(i32 %132, i32 %132, i32 29)
  %135 = xor i32 %133, %134
  %136 = add i32 %135, %133
  %137 = tail call i32 @llvm.fshl.i32(i32 %135, i32 %135, i32 16)
  %138 = xor i32 %136, %137
  %139 = add i32 %138, %136
  %140 = add i32 %139, %82
  %141 = tail call i32 @llvm.fshl.i32(i32 %138, i32 %138, i32 24)
  %142 = xor i32 %139, %141
  %143 = add i32 %98, 4
  %144 = add i32 %143, %142
  %145 = add i32 %140, %144
  %146 = tail call i32 @llvm.fshl.i32(i32 %144, i32 %144, i32 13)
  %147 = xor i32 %145, %146
  %148 = add i32 %147, %145
  %149 = tail call i32 @llvm.fshl.i32(i32 %147, i32 %147, i32 15)
  %150 = xor i32 %148, %149
  %151 = add i32 %150, %148
  %152 = tail call i32 @llvm.fshl.i32(i32 %150, i32 %150, i32 26)
  %153 = xor i32 %151, %152
  %154 = add i32 %151, %98
  %155 = add i32 %154, %153
  %156 = add i32 %78, 1
  %157 = add i32 %81, 9
  %158 = add i32 %156, %157
  %159 = tail call i32 @llvm.fshl.i32(i32 %157, i32 %157, i32 13)
  %160 = xor i32 %158, %159
  %161 = add i32 %160, %158
  %162 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 15)
  %163 = xor i32 %161, %162
  %164 = add i32 %163, %161
  %165 = tail call i32 @llvm.fshl.i32(i32 %163, i32 %163, i32 26)
  %166 = xor i32 %164, %165
  %167 = add i32 %166, %164
  %168 = add i32 %167, %82
  %169 = tail call i32 @llvm.fshl.i32(i32 %166, i32 %166, i32 6)
  %170 = xor i32 %167, %169
  %171 = add i32 %99, %170
  %172 = add i32 %168, %171
  %173 = tail call i32 @llvm.fshl.i32(i32 %171, i32 %171, i32 17)
  %174 = xor i32 %172, %173
  %175 = add i32 %174, %172
  %176 = tail call i32 @llvm.fshl.i32(i32 %174, i32 %174, i32 29)
  %177 = xor i32 %175, %176
  %178 = add i32 %177, %175
  %179 = tail call i32 @llvm.fshl.i32(i32 %177, i32 %177, i32 16)
  %180 = xor i32 %178, %179
  %181 = add i32 %180, %178
  %182 = add i32 %181, %98
  %183 = tail call i32 @llvm.fshl.i32(i32 %180, i32 %180, i32 24)
  %184 = xor i32 %181, %183
  %185 = add i32 %114, %184
  %186 = add i32 %182, %185
  %187 = tail call i32 @llvm.fshl.i32(i32 %185, i32 %185, i32 13)
  %188 = xor i32 %186, %187
  %189 = add i32 %188, %186
  %190 = tail call i32 @llvm.fshl.i32(i32 %188, i32 %188, i32 15)
  %191 = xor i32 %189, %190
  %192 = add i32 %191, %189
  %193 = tail call i32 @llvm.fshl.i32(i32 %191, i32 %191, i32 26)
  %194 = xor i32 %192, %193
  %195 = add i32 %194, %192
  %196 = add i32 %195, %78
  %197 = tail call i32 @llvm.fshl.i32(i32 %194, i32 %194, i32 6)
  %198 = xor i32 %195, %197
  %199 = add i32 %83, %198
  %200 = add i32 %196, %199
  %201 = tail call i32 @llvm.fshl.i32(i32 %199, i32 %199, i32 17)
  %202 = xor i32 %200, %201
  %203 = add i32 %202, %200
  %204 = tail call i32 @llvm.fshl.i32(i32 %202, i32 %202, i32 29)
  %205 = xor i32 %203, %204
  %206 = add i32 %205, %203
  %207 = tail call i32 @llvm.fshl.i32(i32 %205, i32 %205, i32 16)
  %208 = xor i32 %206, %207
  %209 = add i32 %208, %206
  %210 = add i32 %209, %82
  %211 = tail call i32 @llvm.fshl.i32(i32 %208, i32 %208, i32 24)
  %212 = xor i32 %209, %211
  %213 = add i32 %143, %212
  %214 = add i32 %210, %213
  %215 = tail call i32 @llvm.fshl.i32(i32 %213, i32 %213, i32 13)
  %216 = xor i32 %214, %215
  %217 = add i32 %216, %214
  %218 = tail call i32 @llvm.fshl.i32(i32 %216, i32 %216, i32 15)
  %219 = xor i32 %217, %218
  %220 = add i32 %219, %217
  %221 = tail call i32 @llvm.fshl.i32(i32 %219, i32 %219, i32 26)
  %222 = xor i32 %220, %221
  %223 = add i32 %220, %98
  %224 = add i32 %223, %222
  %225 = add i32 %155, %224
  %226 = tail call i32 @llvm.fshl.i32(i32 %224, i32 %224, i32 13)
  %227 = xor i32 %225, %226
  %228 = add i32 %227, %225
  %229 = tail call i32 @llvm.fshl.i32(i32 %227, i32 %227, i32 15)
  %230 = xor i32 %228, %229
  %231 = add i32 %230, %228
  %232 = tail call i32 @llvm.fshl.i32(i32 %230, i32 %230, i32 26)
  %233 = xor i32 %231, %232
  %234 = add i32 %233, %231
  %235 = add i32 %234, %224
  %236 = tail call i32 @llvm.fshl.i32(i32 %233, i32 %233, i32 6)
  %237 = xor i32 %234, %236
  %238 = xor i32 %224, %155
  %239 = xor i32 %238, 466688986
  %240 = add i32 %239, 1
  %241 = add i32 %240, %237
  %242 = add i32 %235, %241
  %243 = tail call i32 @llvm.fshl.i32(i32 %241, i32 %241, i32 17)
  %244 = xor i32 %242, %243
  %245 = add i32 %244, %242
  %246 = tail call i32 @llvm.fshl.i32(i32 %244, i32 %244, i32 29)
  %247 = xor i32 %245, %246
  %248 = add i32 %247, %245
  %249 = tail call i32 @llvm.fshl.i32(i32 %247, i32 %247, i32 16)
  %250 = xor i32 %248, %249
  %251 = add i32 %250, %248
  %252 = add i32 %251, %239
  %253 = tail call i32 @llvm.fshl.i32(i32 %250, i32 %250, i32 24)
  %254 = xor i32 %251, %253
  %255 = add i32 %155, 2
  %256 = add i32 %255, %254
  %257 = add i32 %252, %256
  %258 = tail call i32 @llvm.fshl.i32(i32 %256, i32 %256, i32 13)
  %259 = xor i32 %257, %258
  %260 = add i32 %259, %257
  %261 = tail call i32 @llvm.fshl.i32(i32 %259, i32 %259, i32 15)
  %262 = xor i32 %260, %261
  %263 = add i32 %262, %260
  %264 = tail call i32 @llvm.fshl.i32(i32 %262, i32 %262, i32 26)
  %265 = xor i32 %263, %264
  %266 = add i32 %265, %263
  %267 = add i32 %266, %155
  %268 = tail call i32 @llvm.fshl.i32(i32 %265, i32 %265, i32 6)
  %269 = xor i32 %266, %268
  %270 = add i32 %224, 3
  %271 = add i32 %270, %269
  %272 = add i32 %267, %271
  %273 = tail call i32 @llvm.fshl.i32(i32 %271, i32 %271, i32 17)
  %274 = xor i32 %272, %273
  %275 = add i32 %274, %272
  %276 = tail call i32 @llvm.fshl.i32(i32 %274, i32 %274, i32 29)
  %277 = xor i32 %275, %276
  %278 = add i32 %277, %275
  %279 = tail call i32 @llvm.fshl.i32(i32 %277, i32 %277, i32 16)
  %280 = xor i32 %278, %279
  %281 = add i32 %280, %278
  %282 = add i32 %281, %224
  %283 = tail call i32 @llvm.fshl.i32(i32 %280, i32 %280, i32 24)
  %284 = xor i32 %281, %283
  %285 = add i32 %239, 4
  %286 = add i32 %285, %284
  %287 = add i32 %282, %286
  %288 = tail call i32 @llvm.fshl.i32(i32 %286, i32 %286, i32 13)
  %289 = xor i32 %287, %288
  %290 = add i32 %289, %287
  %291 = tail call i32 @llvm.fshl.i32(i32 %289, i32 %289, i32 15)
  %292 = xor i32 %290, %291
  %293 = add i32 %292, %290
  %294 = tail call i32 @llvm.fshl.i32(i32 %292, i32 %292, i32 26)
  %295 = xor i32 %293, %294
  %296 = add i32 %293, %239
  %297 = add i32 %296, %295
  %298 = lshr i32 %297, 9
  %299 = or disjoint i32 %298, 1065353216
  %300 = bitcast i32 %299 to float
  %add.4065.1 = fadd float %300, -1.000000e+00
  %301 = tail call float @llvm.maximum.f32(float %add.4065.1, float 0.000000e+00)
  %compare.651.1 = fcmp olt float %301, 5.000000e-01
  %302 = select i1 %compare.651.1, i64 1, i64 -1
  store i64 %302, ptr addrspace(1) %arg2429, align 128
  store i32 %78, ptr addrspace(1) %arg3431, align 128
  store i32 %82, ptr addrspace(1) %arg4433, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_17(ptr noalias nocapture align 128 dereferenceable(8) %arg0) local_unnamed_addr #4 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128
  %1 = add i64 %0, 1
  store i64 %1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg2211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1209 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0207 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg1209, align 128, !invariant.load !303
  %1 = load i32, ptr addrspace(1) %arg0207, align 128, !invariant.load !303
  %2 = add i32 %1, 3
  %3 = add i32 %2, %0
  %4 = tail call i32 @llvm.fshl.i32(i32 %2, i32 %2, i32 13)
  %5 = xor i32 %3, %4
  %6 = add i32 %5, %3
  %7 = tail call i32 @llvm.fshl.i32(i32 %5, i32 %5, i32 15)
  %8 = xor i32 %6, %7
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.fshl.i32(i32 %8, i32 %8, i32 26)
  %11 = xor i32 %9, %10
  %12 = add i32 %11, %9
  %13 = add i32 %12, %1
  %14 = tail call i32 @llvm.fshl.i32(i32 %11, i32 %11, i32 6)
  %15 = xor i32 %12, %14
  %16 = xor i32 %0, %1
  %17 = xor i32 %16, 466688986
  %18 = add i32 %17, 1
  %19 = add i32 %18, %15
  %20 = add i32 %13, %19
  %21 = tail call i32 @llvm.fshl.i32(i32 %19, i32 %19, i32 17)
  %22 = xor i32 %20, %21
  %23 = add i32 %22, %20
  %24 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 29)
  %25 = xor i32 %23, %24
  %26 = add i32 %25, %23
  %27 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 16)
  %28 = xor i32 %26, %27
  %29 = add i32 %28, %26
  %30 = add i32 %29, %17
  %31 = tail call i32 @llvm.fshl.i32(i32 %28, i32 %28, i32 24)
  %32 = xor i32 %29, %31
  %33 = add i32 %0, 2
  %34 = add i32 %33, %32
  %35 = add i32 %30, %34
  %36 = tail call i32 @llvm.fshl.i32(i32 %34, i32 %34, i32 13)
  %37 = xor i32 %35, %36
  %38 = add i32 %37, %35
  %39 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 15)
  %40 = xor i32 %38, %39
  %41 = add i32 %40, %38
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 26)
  %43 = xor i32 %41, %42
  %44 = add i32 %43, %41
  %45 = add i32 %44, %0
  %46 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 6)
  %47 = xor i32 %44, %46
  %48 = add i32 %2, %47
  %49 = add i32 %45, %48
  %50 = tail call i32 @llvm.fshl.i32(i32 %48, i32 %48, i32 17)
  %51 = xor i32 %49, %50
  %52 = add i32 %51, %49
  %53 = tail call i32 @llvm.fshl.i32(i32 %51, i32 %51, i32 29)
  %54 = xor i32 %52, %53
  %55 = add i32 %54, %52
  %56 = tail call i32 @llvm.fshl.i32(i32 %54, i32 %54, i32 16)
  %57 = xor i32 %55, %56
  %58 = add i32 %57, %55
  %59 = add i32 %58, %1
  %60 = tail call i32 @llvm.fshl.i32(i32 %57, i32 %57, i32 24)
  %61 = xor i32 %58, %60
  %62 = add i32 %17, 4
  %63 = add i32 %62, %61
  %64 = add i32 %59, %63
  %65 = tail call i32 @llvm.fshl.i32(i32 %63, i32 %63, i32 13)
  %66 = xor i32 %64, %65
  %67 = add i32 %66, %64
  %68 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 15)
  %69 = xor i32 %67, %68
  %70 = add i32 %69, %67
  %71 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 26)
  %72 = xor i32 %70, %71
  %73 = add i32 %70, %17
  %74 = add i32 %73, %72
  %75 = add i32 %0, 1
  %76 = add i32 %1, 4
  %77 = add i32 %75, %76
  %78 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 13)
  %79 = xor i32 %77, %78
  %80 = add i32 %79, %77
  %81 = tail call i32 @llvm.fshl.i32(i32 %79, i32 %79, i32 15)
  %82 = xor i32 %80, %81
  %83 = add i32 %82, %80
  %84 = tail call i32 @llvm.fshl.i32(i32 %82, i32 %82, i32 26)
  %85 = xor i32 %83, %84
  %86 = add i32 %85, %83
  %87 = add i32 %86, %1
  %88 = tail call i32 @llvm.fshl.i32(i32 %85, i32 %85, i32 6)
  %89 = xor i32 %86, %88
  %90 = add i32 %18, %89
  %91 = add i32 %87, %90
  %92 = tail call i32 @llvm.fshl.i32(i32 %90, i32 %90, i32 17)
  %93 = xor i32 %91, %92
  %94 = add i32 %93, %91
  %95 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %93, i32 29)
  %96 = xor i32 %94, %95
  %97 = add i32 %96, %94
  %98 = tail call i32 @llvm.fshl.i32(i32 %96, i32 %96, i32 16)
  %99 = xor i32 %97, %98
  %100 = add i32 %99, %97
  %101 = add i32 %100, %17
  %102 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %99, i32 24)
  %103 = xor i32 %100, %102
  %104 = add i32 %33, %103
  %105 = add i32 %101, %104
  %106 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %104, i32 13)
  %107 = xor i32 %105, %106
  %108 = add i32 %107, %105
  %109 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %107, i32 15)
  %110 = xor i32 %108, %109
  %111 = add i32 %110, %108
  %112 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %110, i32 26)
  %113 = xor i32 %111, %112
  %114 = add i32 %113, %111
  %115 = add i32 %114, %0
  %116 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %113, i32 6)
  %117 = xor i32 %114, %116
  %118 = add i32 %2, %117
  %119 = add i32 %115, %118
  %120 = tail call i32 @llvm.fshl.i32(i32 %118, i32 %118, i32 17)
  %121 = xor i32 %119, %120
  %122 = add i32 %121, %119
  %123 = tail call i32 @llvm.fshl.i32(i32 %121, i32 %121, i32 29)
  %124 = xor i32 %122, %123
  %125 = add i32 %124, %122
  %126 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %124, i32 16)
  %127 = xor i32 %125, %126
  %128 = add i32 %127, %125
  %129 = add i32 %128, %1
  %130 = tail call i32 @llvm.fshl.i32(i32 %127, i32 %127, i32 24)
  %131 = xor i32 %128, %130
  %132 = add i32 %62, %131
  %133 = add i32 %129, %132
  %134 = tail call i32 @llvm.fshl.i32(i32 %132, i32 %132, i32 13)
  %135 = xor i32 %133, %134
  %136 = add i32 %135, %133
  %137 = tail call i32 @llvm.fshl.i32(i32 %135, i32 %135, i32 15)
  %138 = xor i32 %136, %137
  %139 = add i32 %138, %136
  %140 = tail call i32 @llvm.fshl.i32(i32 %138, i32 %138, i32 26)
  %141 = xor i32 %139, %140
  %142 = add i32 %139, %17
  %143 = add i32 %142, %141
  %144 = add i32 %74, %143
  %145 = tail call i32 @llvm.fshl.i32(i32 %143, i32 %143, i32 13)
  %146 = xor i32 %144, %145
  %147 = add i32 %146, %144
  %148 = tail call i32 @llvm.fshl.i32(i32 %146, i32 %146, i32 15)
  %149 = xor i32 %147, %148
  %150 = add i32 %149, %147
  %151 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 26)
  %152 = xor i32 %150, %151
  %153 = add i32 %152, %150
  %154 = add i32 %153, %143
  %155 = tail call i32 @llvm.fshl.i32(i32 %152, i32 %152, i32 6)
  %156 = xor i32 %153, %155
  %157 = xor i32 %143, %74
  %158 = xor i32 %157, 466688986
  %159 = add i32 %158, 1
  %160 = add i32 %159, %156
  %161 = add i32 %154, %160
  %162 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 17)
  %163 = xor i32 %161, %162
  %164 = add i32 %163, %161
  %165 = tail call i32 @llvm.fshl.i32(i32 %163, i32 %163, i32 29)
  %166 = xor i32 %164, %165
  %167 = add i32 %166, %164
  %168 = tail call i32 @llvm.fshl.i32(i32 %166, i32 %166, i32 16)
  %169 = xor i32 %167, %168
  %170 = add i32 %169, %167
  %171 = add i32 %170, %158
  %172 = tail call i32 @llvm.fshl.i32(i32 %169, i32 %169, i32 24)
  %173 = xor i32 %170, %172
  %174 = add i32 %74, 2
  %175 = add i32 %174, %173
  %176 = add i32 %171, %175
  %177 = tail call i32 @llvm.fshl.i32(i32 %175, i32 %175, i32 13)
  %178 = xor i32 %176, %177
  %179 = add i32 %178, %176
  %180 = tail call i32 @llvm.fshl.i32(i32 %178, i32 %178, i32 15)
  %181 = xor i32 %179, %180
  %182 = add i32 %181, %179
  %183 = tail call i32 @llvm.fshl.i32(i32 %181, i32 %181, i32 26)
  %184 = xor i32 %182, %183
  %185 = add i32 %184, %182
  %186 = add i32 %185, %74
  %187 = tail call i32 @llvm.fshl.i32(i32 %184, i32 %184, i32 6)
  %188 = xor i32 %185, %187
  %189 = add i32 %143, 3
  %190 = add i32 %189, %188
  %191 = add i32 %186, %190
  %192 = tail call i32 @llvm.fshl.i32(i32 %190, i32 %190, i32 17)
  %193 = xor i32 %191, %192
  %194 = add i32 %193, %191
  %195 = tail call i32 @llvm.fshl.i32(i32 %193, i32 %193, i32 29)
  %196 = xor i32 %194, %195
  %197 = add i32 %196, %194
  %198 = tail call i32 @llvm.fshl.i32(i32 %196, i32 %196, i32 16)
  %199 = xor i32 %197, %198
  %200 = add i32 %199, %197
  %201 = add i32 %200, %143
  %202 = tail call i32 @llvm.fshl.i32(i32 %199, i32 %199, i32 24)
  %203 = xor i32 %200, %202
  %204 = add i32 %158, 4
  %205 = add i32 %204, %203
  %206 = add i32 %201, %205
  %207 = tail call i32 @llvm.fshl.i32(i32 %205, i32 %205, i32 13)
  %208 = xor i32 %206, %207
  %209 = add i32 %208, %206
  %210 = tail call i32 @llvm.fshl.i32(i32 %208, i32 %208, i32 15)
  %211 = xor i32 %209, %210
  %212 = add i32 %211, %209
  %213 = tail call i32 @llvm.fshl.i32(i32 %211, i32 %211, i32 26)
  %214 = xor i32 %212, %213
  %215 = add i32 %212, %158
  %216 = add i32 %215, %214
  %217 = lshr i32 %216, 9
  %218 = or disjoint i32 %217, 1065353216
  %219 = bitcast i32 %218 to float
  %add.4065.3 = fadd float %219, -1.000000e+00
  %220 = tail call float @llvm.maximum.f32(float %add.4065.3, float 0.000000e+00)
  %compare.651.3 = fcmp olt float %220, 5.000000e-01
  %221 = zext i1 %compare.651.3 to i32
  store i32 %221, ptr addrspace(1) %arg2211, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg298 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg196 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg094 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !309
  %.not.not = icmp eq i32 %0, 0
  %1 = load i32, ptr addrspace(1) %arg094, align 128, !invariant.load !303
  br i1 %.not.not, label %concatenate.pivot.0., label %concatenate.pivot.3.93

concatenate.pivot.0.:                             ; preds = %entry
  %2 = add i32 %1, 2
  %3 = load i32, ptr addrspace(1) %arg196, align 128, !invariant.load !303
  %4 = add i32 %3, 5
  %5 = add i32 %2, %4
  %6 = tail call i32 @llvm.fshl.i32(i32 %4, i32 %4, i32 13)
  %7 = xor i32 %5, %6
  %8 = add i32 %7, %5
  %9 = tail call i32 @llvm.fshl.i32(i32 %7, i32 %7, i32 15)
  %10 = xor i32 %8, %9
  %11 = add i32 %10, %8
  %12 = tail call i32 @llvm.fshl.i32(i32 %10, i32 %10, i32 26)
  %13 = xor i32 %11, %12
  %14 = add i32 %13, %11
  %15 = add i32 %14, %3
  %16 = tail call i32 @llvm.fshl.i32(i32 %13, i32 %13, i32 6)
  %17 = xor i32 %14, %16
  %18 = xor i32 %1, %3
  %19 = xor i32 %18, 466688986
  %20 = add i32 %19, 1
  %21 = add i32 %20, %17
  %22 = add i32 %15, %21
  %23 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %21, i32 17)
  %24 = xor i32 %22, %23
  %25 = add i32 %24, %22
  %26 = tail call i32 @llvm.fshl.i32(i32 %24, i32 %24, i32 29)
  %27 = xor i32 %25, %26
  %28 = add i32 %27, %25
  %29 = tail call i32 @llvm.fshl.i32(i32 %27, i32 %27, i32 16)
  %30 = xor i32 %28, %29
  %31 = add i32 %30, %28
  %32 = add i32 %31, %19
  %33 = tail call i32 @llvm.fshl.i32(i32 %30, i32 %30, i32 24)
  %34 = xor i32 %31, %33
  %35 = add i32 %2, %34
  %36 = add i32 %32, %35
  %37 = tail call i32 @llvm.fshl.i32(i32 %35, i32 %35, i32 13)
  %38 = xor i32 %36, %37
  %39 = add i32 %38, %36
  %40 = tail call i32 @llvm.fshl.i32(i32 %38, i32 %38, i32 15)
  %41 = xor i32 %39, %40
  %42 = add i32 %41, %39
  %43 = tail call i32 @llvm.fshl.i32(i32 %41, i32 %41, i32 26)
  %44 = xor i32 %42, %43
  %45 = add i32 %44, %42
  %46 = add i32 %45, %1
  %47 = tail call i32 @llvm.fshl.i32(i32 %44, i32 %44, i32 6)
  %48 = xor i32 %45, %47
  %49 = add i32 %3, 3
  %50 = add i32 %49, %48
  %51 = add i32 %46, %50
  %52 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 17)
  %53 = xor i32 %51, %52
  %54 = add i32 %53, %51
  %55 = tail call i32 @llvm.fshl.i32(i32 %53, i32 %53, i32 29)
  %56 = xor i32 %54, %55
  %57 = add i32 %56, %54
  %58 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 16)
  %59 = xor i32 %57, %58
  %60 = add i32 %59, %57
  %61 = add i32 %60, %3
  %62 = tail call i32 @llvm.fshl.i32(i32 %59, i32 %59, i32 24)
  %63 = xor i32 %60, %62
  %64 = add i32 %19, 4
  %65 = add i32 %64, %63
  %66 = add i32 %61, %65
  %67 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 13)
  %68 = xor i32 %66, %67
  %69 = add i32 %68, %66
  %70 = tail call i32 @llvm.fshl.i32(i32 %68, i32 %68, i32 15)
  %71 = xor i32 %69, %70
  %72 = add i32 %71, %69
  %73 = tail call i32 @llvm.fshl.i32(i32 %71, i32 %71, i32 26)
  %74 = xor i32 %72, %73
  %75 = add i32 %72, %19
  %76 = add i32 %75, %74
  br label %concatenate.44.5.merge

concatenate.pivot.3.93:                           ; preds = %entry
  %77 = load i32, ptr addrspace(1) %arg196, align 128, !invariant.load !303
  %78 = add i32 %77, 3
  %79 = add i32 %78, %1
  %80 = tail call i32 @llvm.fshl.i32(i32 %78, i32 %78, i32 13)
  %81 = xor i32 %79, %80
  %82 = add i32 %81, %79
  %83 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 15)
  %84 = xor i32 %82, %83
  %85 = add i32 %84, %82
  %86 = tail call i32 @llvm.fshl.i32(i32 %84, i32 %84, i32 26)
  %87 = xor i32 %85, %86
  %88 = add i32 %87, %85
  %89 = add i32 %88, %77
  %90 = tail call i32 @llvm.fshl.i32(i32 %87, i32 %87, i32 6)
  %91 = xor i32 %88, %90
  %92 = xor i32 %1, %77
  %93 = xor i32 %92, 466688986
  %94 = add i32 %93, 1
  %95 = add i32 %94, %91
  %96 = add i32 %89, %95
  %97 = tail call i32 @llvm.fshl.i32(i32 %95, i32 %95, i32 17)
  %98 = xor i32 %96, %97
  %99 = add i32 %98, %96
  %100 = tail call i32 @llvm.fshl.i32(i32 %98, i32 %98, i32 29)
  %101 = xor i32 %99, %100
  %102 = add i32 %101, %99
  %103 = tail call i32 @llvm.fshl.i32(i32 %101, i32 %101, i32 16)
  %104 = xor i32 %102, %103
  %105 = add i32 %104, %102
  %106 = add i32 %105, %93
  %107 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %104, i32 24)
  %108 = xor i32 %105, %107
  %109 = add i32 %1, 2
  %110 = add i32 %109, %108
  %111 = add i32 %106, %110
  %112 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %110, i32 13)
  %113 = xor i32 %111, %112
  %114 = add i32 %113, %111
  %115 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %113, i32 15)
  %116 = xor i32 %114, %115
  %117 = add i32 %116, %114
  %118 = tail call i32 @llvm.fshl.i32(i32 %116, i32 %116, i32 26)
  %119 = xor i32 %117, %118
  %120 = add i32 %119, %117
  %121 = add i32 %120, %1
  %122 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %119, i32 6)
  %123 = xor i32 %120, %122
  %124 = add i32 %78, %123
  %125 = add i32 %121, %124
  %126 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %124, i32 17)
  %127 = xor i32 %125, %126
  %128 = add i32 %127, %125
  %129 = tail call i32 @llvm.fshl.i32(i32 %127, i32 %127, i32 29)
  %130 = xor i32 %128, %129
  %131 = add i32 %130, %128
  %132 = tail call i32 @llvm.fshl.i32(i32 %130, i32 %130, i32 16)
  %133 = xor i32 %131, %132
  %134 = add i32 %133, %131
  %135 = add i32 %134, %77
  %136 = tail call i32 @llvm.fshl.i32(i32 %133, i32 %133, i32 24)
  %137 = xor i32 %134, %136
  %138 = add i32 %93, 4
  %139 = add i32 %138, %137
  %140 = add i32 %135, %139
  %141 = tail call i32 @llvm.fshl.i32(i32 %139, i32 %139, i32 13)
  %142 = xor i32 %140, %141
  %143 = add i32 %142, %140
  %144 = tail call i32 @llvm.fshl.i32(i32 %142, i32 %142, i32 15)
  %145 = xor i32 %143, %144
  %146 = add i32 %145, %143
  %147 = tail call i32 @llvm.fshl.i32(i32 %145, i32 %145, i32 26)
  %148 = xor i32 %146, %147
  %149 = add i32 %148, %146
  %150 = tail call i32 @llvm.fshl.i32(i32 %148, i32 %148, i32 6)
  %151 = xor i32 %149, %150
  %152 = add i32 %1, 5
  %153 = add i32 %152, %151
  br label %concatenate.44.5.merge

concatenate.44.5.merge:                           ; preds = %concatenate.pivot.3.93, %concatenate.pivot.0.
  %154 = phi i32 [ %76, %concatenate.pivot.0. ], [ %153, %concatenate.pivot.3.93 ]
  %155 = zext nneg i32 %0 to i64
  %156 = getelementptr i32, ptr addrspace(1) %arg298, i64 %155
  store i32 %154, ptr addrspace(1) %156, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_slice_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg298 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg196 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg094 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !309
  %1 = add nuw nsw i32 %0, 1
  %2 = load i32, ptr addrspace(1) %arg094, align 128, !invariant.load !303
  %3 = add i32 %1, %2
  %4 = or disjoint i32 %0, 4
  %5 = load i32, ptr addrspace(1) %arg196, align 128, !invariant.load !303
  %6 = add i32 %5, %4
  %7 = add i32 %3, %6
  %8 = tail call i32 @llvm.fshl.i32(i32 %6, i32 %6, i32 13)
  %9 = xor i32 %7, %8
  %10 = add i32 %9, %7
  %11 = tail call i32 @llvm.fshl.i32(i32 %9, i32 %9, i32 15)
  %12 = xor i32 %10, %11
  %13 = add i32 %12, %10
  %14 = tail call i32 @llvm.fshl.i32(i32 %12, i32 %12, i32 26)
  %15 = xor i32 %13, %14
  %16 = add i32 %15, %13
  %17 = add i32 %16, %5
  %18 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 6)
  %19 = xor i32 %16, %18
  %20 = xor i32 %2, %5
  %21 = xor i32 %20, 466688986
  %22 = add i32 %21, 1
  %23 = add i32 %22, %19
  %24 = add i32 %17, %23
  %25 = tail call i32 @llvm.fshl.i32(i32 %23, i32 %23, i32 17)
  %26 = xor i32 %24, %25
  %27 = add i32 %26, %24
  %28 = tail call i32 @llvm.fshl.i32(i32 %26, i32 %26, i32 29)
  %29 = xor i32 %27, %28
  %30 = add i32 %29, %27
  %31 = tail call i32 @llvm.fshl.i32(i32 %29, i32 %29, i32 16)
  %32 = xor i32 %30, %31
  %33 = add i32 %32, %30
  %34 = add i32 %33, %21
  %35 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %32, i32 24)
  %36 = xor i32 %33, %35
  %37 = add i32 %2, 2
  %38 = add i32 %37, %36
  %39 = add i32 %34, %38
  %40 = tail call i32 @llvm.fshl.i32(i32 %38, i32 %38, i32 13)
  %41 = xor i32 %39, %40
  %42 = add i32 %41, %39
  %43 = tail call i32 @llvm.fshl.i32(i32 %41, i32 %41, i32 15)
  %44 = xor i32 %42, %43
  %45 = add i32 %44, %42
  %46 = tail call i32 @llvm.fshl.i32(i32 %44, i32 %44, i32 26)
  %47 = xor i32 %45, %46
  %48 = add i32 %47, %45
  %49 = add i32 %48, %2
  %50 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 6)
  %51 = xor i32 %48, %50
  %52 = add i32 %5, 3
  %53 = add i32 %52, %51
  %54 = add i32 %49, %53
  %55 = tail call i32 @llvm.fshl.i32(i32 %53, i32 %53, i32 17)
  %56 = xor i32 %54, %55
  %57 = add i32 %56, %54
  %58 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 29)
  %59 = xor i32 %57, %58
  %60 = add i32 %59, %57
  %61 = tail call i32 @llvm.fshl.i32(i32 %59, i32 %59, i32 16)
  %62 = xor i32 %60, %61
  %63 = add i32 %62, %60
  %64 = add i32 %63, %5
  %65 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 24)
  %66 = xor i32 %63, %65
  %67 = add i32 %21, 4
  %68 = add i32 %67, %66
  %69 = add i32 %64, %68
  %70 = tail call i32 @llvm.fshl.i32(i32 %68, i32 %68, i32 13)
  %71 = xor i32 %69, %70
  %72 = add i32 %71, %69
  %73 = tail call i32 @llvm.fshl.i32(i32 %71, i32 %71, i32 15)
  %74 = xor i32 %72, %73
  %75 = add i32 %74, %72
  %76 = tail call i32 @llvm.fshl.i32(i32 %74, i32 %74, i32 26)
  %77 = xor i32 %75, %76
  %78 = add i32 %77, %75
  %79 = tail call i32 @llvm.fshl.i32(i32 %77, i32 %77, i32 6)
  %80 = xor i32 %78, %79
  %81 = add i32 %2, 5
  %82 = add i32 %81, %80
  %83 = zext nneg i32 %0 to i64
  %84 = getelementptr i32, ptr addrspace(1) %arg298, i64 %83
  store i32 %82, ptr addrspace(1) %84, align 4
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7) local_unnamed_addr #2 {
entry:
  %arg7131 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6129 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5127 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4125 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3123 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2121 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0117 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !311
  %0 = shl nuw nsw i32 %thread.id.x, 1
  %1 = zext nneg i32 %0 to i64
  %param_0.230426 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg0117, i64 0, i64 %1
  %param_0.230427 = load double, ptr addrspace(1) %param_0.230426, align 16, !invariant.load !303
  %2 = icmp ult i32 %thread.id.x, 30
  br i1 %2, label %concatenate.pivot.20.48, label %concatenate.pivot.60.54

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true.then
  ret void

loop3.loop_header21.preheader.1:                  ; preds = %concatenate.43.1.merge28.1
  %3 = shl nuw nsw i32 %90, 1
  %4 = zext nneg i32 %3 to i64
  %param_0.230426.194 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg0117, i64 0, i64 %4
  %param_0.230427.195 = load double, ptr addrspace(1) %param_0.230426.194, align 16, !invariant.load !303
  %5 = icmp ult i32 %90, 40
  br i1 %5, label %concatenate.pivot.60.54.1103, label %concatenate.pivot.100.55.197

concatenate.pivot.100.55.197:                     ; preds = %loop3.loop_header21.preheader.1
  %6 = icmp ult i32 %90, 50
  br i1 %6, label %concatenate.pivot.80.56.1101, label %concatenate.pivot.100.57.199

concatenate.pivot.100.57.199:                     ; preds = %concatenate.pivot.100.55.197
  %7 = sext i32 %3 to i64
  %8 = getelementptr [20 x double], ptr addrspace(1) %arg6129, i64 0, i64 %7
  %param_6.110145.198133 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 -800
  br label %concatenate.43.1.merge28.1116

concatenate.pivot.80.56.1101:                     ; preds = %concatenate.pivot.100.55.197
  %9 = add nsw i32 %3, -80
  %10 = zext nneg i32 %9 to i64
  %param_5.131342.1100 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5127, i64 0, i64 %10
  br label %concatenate.43.1.merge28.1116

concatenate.pivot.60.54.1103:                     ; preds = %loop3.loop_header21.preheader.1
  %11 = add nsw i32 %3, -60
  %12 = zext nneg i32 %11 to i64
  %param_4.156839.1102 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4125, i64 0, i64 %12
  br label %concatenate.43.1.merge28.1116

concatenate.43.1.merge28.1116:                    ; preds = %concatenate.pivot.60.54.1103, %concatenate.pivot.80.56.1101, %concatenate.pivot.100.57.199
  %.in.1112 = phi ptr addrspace(1) [ %param_4.156839.1102, %concatenate.pivot.60.54.1103 ], [ %param_5.131342.1100, %concatenate.pivot.80.56.1101 ], [ %param_6.110145.198133, %concatenate.pivot.100.57.199 ]
  %13 = icmp ult i32 %90, 40
  %14 = load double, ptr addrspace(1) %.in.1112, align 8, !invariant.load !303
  %multiply.2971.358.1113 = fmul double %param_0.230427.195, %14
  %multiply.2972.359.1114 = fmul double %14, %multiply.2971.358.1113
  %add.3619.i89.1115 = fadd double %add.3619.i89.1, %multiply.2972.359.1114
  %param_0.230426.1.1134 = getelementptr inbounds i8, ptr addrspace(1) %param_0.230426.194, i64 8
  %param_0.230427.1.1 = load double, ptr addrspace(1) %param_0.230426.1.1134, align 8, !invariant.load !303
  br i1 %13, label %concatenate.pivot.60.54.1.1, label %concatenate.pivot.100.55.1.1

concatenate.pivot.100.55.1.1:                     ; preds = %concatenate.43.1.merge28.1116
  %15 = icmp ult i32 %90, 50
  br i1 %15, label %concatenate.pivot.80.56.1.1, label %concatenate.pivot.100.57.1.1

concatenate.pivot.100.57.1.1:                     ; preds = %concatenate.pivot.100.55.1.1
  %16 = sext i32 %3 to i64
  %17 = getelementptr [20 x double], ptr addrspace(1) %arg6129, i64 0, i64 %16
  %param_6.110145.1.1135 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 -792
  br label %concatenate.43.1.merge28.1.1

concatenate.pivot.80.56.1.1:                      ; preds = %concatenate.pivot.100.55.1.1
  %18 = add nsw i32 %3, -79
  %19 = zext nneg i32 %18 to i64
  %param_5.131342.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5127, i64 0, i64 %19
  br label %concatenate.43.1.merge28.1.1

concatenate.pivot.60.54.1.1:                      ; preds = %concatenate.43.1.merge28.1116
  %20 = add nsw i32 %3, -59
  %21 = zext nneg i32 %20 to i64
  %param_4.156839.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4125, i64 0, i64 %21
  br label %concatenate.43.1.merge28.1.1

concatenate.43.1.merge28.1.1:                     ; preds = %concatenate.pivot.60.54.1.1, %concatenate.pivot.80.56.1.1, %concatenate.pivot.100.57.1.1
  %.in.1.1 = phi ptr addrspace(1) [ %param_4.156839.1.1, %concatenate.pivot.60.54.1.1 ], [ %param_5.131342.1.1, %concatenate.pivot.80.56.1.1 ], [ %param_6.110145.1.1135, %concatenate.pivot.100.57.1.1 ]
  %22 = load double, ptr addrspace(1) %.in.1.1, align 8, !invariant.load !303
  %multiply.2971.358.1.1 = fmul double %param_0.230427.1.1, %22
  %multiply.2972.359.1.1 = fmul double %22, %multiply.2971.358.1.1
  %add.3619.i89.1.1 = fadd double %add.3619.i89.1115, %multiply.2972.359.1.1
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %concatenate.43.1.merge28.1.1, %concatenate.43.1.merge28.1
  %partial_reduction_result.1.1 = phi double [ %add.3619.i89.1, %concatenate.43.1.merge28.1 ], [ %add.3619.i89.1.1, %concatenate.43.1.merge28.1.1 ]
  %23 = bitcast double %partial_reduction_result.1.1 to <2 x i32>
  %24 = extractelement <2 x i32> %23, i64 0
  %25 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %24, i32 16, i32 31)
  %26 = insertelement <2 x i32> poison, i32 %25, i64 0
  %27 = extractelement <2 x i32> %23, i64 1
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 16, i32 31)
  %29 = insertelement <2 x i32> %26, i32 %28, i64 1
  %30 = bitcast <2 x i32> %29 to double
  %add.3619.i = fadd double %partial_reduction_result.1.1, %30
  %31 = bitcast double %add.3619.i to <2 x i32>
  %32 = extractelement <2 x i32> %31, i64 0
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 8, i32 31)
  %34 = insertelement <2 x i32> poison, i32 %33, i64 0
  %35 = extractelement <2 x i32> %31, i64 1
  %36 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %35, i32 8, i32 31)
  %37 = insertelement <2 x i32> %34, i32 %36, i64 1
  %38 = bitcast <2 x i32> %37 to double
  %add.3619.i85 = fadd double %add.3619.i, %38
  %39 = bitcast double %add.3619.i85 to <2 x i32>
  %40 = extractelement <2 x i32> %39, i64 0
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 4, i32 31)
  %42 = insertelement <2 x i32> poison, i32 %41, i64 0
  %43 = extractelement <2 x i32> %39, i64 1
  %44 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %43, i32 4, i32 31)
  %45 = insertelement <2 x i32> %42, i32 %44, i64 1
  %46 = bitcast <2 x i32> %45 to double
  %add.3619.i86 = fadd double %add.3619.i85, %46
  %47 = bitcast double %add.3619.i86 to <2 x i32>
  %48 = extractelement <2 x i32> %47, i64 0
  %49 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 2, i32 31)
  %50 = insertelement <2 x i32> poison, i32 %49, i64 0
  %51 = extractelement <2 x i32> %47, i64 1
  %52 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %51, i32 2, i32 31)
  %53 = insertelement <2 x i32> %50, i32 %52, i64 1
  %54 = bitcast <2 x i32> %53 to double
  %add.3619.i87 = fadd double %add.3619.i86, %54
  %55 = bitcast double %add.3619.i87 to <2 x i32>
  %56 = extractelement <2 x i32> %55, i64 0
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 1, i32 31)
  %58 = extractelement <2 x i32> %55, i64 1
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 1, i32 31)
  %60 = icmp eq i32 %thread.id.x, 0
  %61 = insertelement <2 x i32> poison, i32 %57, i64 0
  %62 = insertelement <2 x i32> %61, i32 %59, i64 1
  %63 = bitcast <2 x i32> %62 to double
  %add.3619.i88 = fadd double %add.3619.i87, %63
  br i1 %60, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

concatenate.pivot.20.48:                          ; preds = %entry
  %64 = icmp ult i32 %thread.id.x, 10
  br i1 %64, label %concatenate.pivot.0.49, label %concatenate.pivot.40.50

concatenate.pivot.0.49:                           ; preds = %concatenate.pivot.20.48
  %param_1.319030 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1119, i64 0, i64 %1
  br label %concatenate.43.1.merge28

concatenate.pivot.40.50:                          ; preds = %concatenate.pivot.20.48
  %65 = icmp ult i32 %thread.id.x, 20
  br i1 %65, label %concatenate.pivot.20.51, label %concatenate.pivot.40.52

concatenate.pivot.20.51:                          ; preds = %concatenate.pivot.40.50
  %66 = trunc i64 %1 to i32
  %67 = add nsw i32 %66, -20
  %68 = zext nneg i32 %67 to i64
  %param_2.265433 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2121, i64 0, i64 %68
  br label %concatenate.43.1.merge28

concatenate.pivot.40.52:                          ; preds = %concatenate.pivot.40.50
  %69 = trunc i64 %1 to i32
  %70 = add nsw i32 %69, -40
  %71 = zext nneg i32 %70 to i64
  %param_3.204736 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3123, i64 0, i64 %71
  br label %concatenate.43.1.merge28

concatenate.pivot.60.54:                          ; preds = %entry
  %72 = trunc i64 %1 to i32
  %73 = add nsw i32 %72, -60
  %74 = zext nneg i32 %73 to i64
  %param_4.156839 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4125, i64 0, i64 %74
  br label %concatenate.43.1.merge28

concatenate.43.1.merge28:                         ; preds = %concatenate.pivot.60.54, %concatenate.pivot.40.52, %concatenate.pivot.20.51, %concatenate.pivot.0.49
  %.in = phi ptr addrspace(1) [ %param_1.319030, %concatenate.pivot.0.49 ], [ %param_2.265433, %concatenate.pivot.20.51 ], [ %param_3.204736, %concatenate.pivot.40.52 ], [ %param_4.156839, %concatenate.pivot.60.54 ]
  %75 = icmp ult i32 %thread.id.x, 30
  %76 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !303
  %multiply.2971.358 = fmul double %param_0.230427, %76
  %multiply.2972.359 = fmul double %76, %multiply.2971.358
  %add.3619.i89 = fadd double %multiply.2972.359, 0.000000e+00
  %param_0.230426.1136 = getelementptr inbounds i8, ptr addrspace(1) %param_0.230426, i64 8
  %param_0.230427.1 = load double, ptr addrspace(1) %param_0.230426.1136, align 8, !invariant.load !303
  br i1 %75, label %concatenate.pivot.20.48.1, label %concatenate.pivot.60.54.1

concatenate.pivot.60.54.1:                        ; preds = %concatenate.43.1.merge28
  %77 = trunc i64 %1 to i32
  %78 = add nsw i32 %77, -59
  %79 = zext nneg i32 %78 to i64
  %param_4.156839.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4125, i64 0, i64 %79
  br label %concatenate.43.1.merge28.1

concatenate.pivot.20.48.1:                        ; preds = %concatenate.43.1.merge28
  %80 = icmp ult i32 %thread.id.x, 10
  br i1 %80, label %concatenate.pivot.0.49.1, label %concatenate.pivot.40.50.1

concatenate.pivot.40.50.1:                        ; preds = %concatenate.pivot.20.48.1
  %81 = icmp ult i32 %thread.id.x, 20
  br i1 %81, label %concatenate.pivot.20.51.1, label %concatenate.pivot.40.52.1

concatenate.pivot.40.52.1:                        ; preds = %concatenate.pivot.40.50.1
  %82 = trunc i64 %1 to i32
  %83 = add nsw i32 %82, -39
  %84 = zext nneg i32 %83 to i64
  %param_3.204736.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3123, i64 0, i64 %84
  br label %concatenate.43.1.merge28.1

concatenate.pivot.20.51.1:                        ; preds = %concatenate.pivot.40.50.1
  %85 = trunc i64 %1 to i32
  %86 = add nsw i32 %85, -19
  %87 = zext nneg i32 %86 to i64
  %param_2.265433.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2121, i64 0, i64 %87
  br label %concatenate.43.1.merge28.1

concatenate.pivot.0.49.1:                         ; preds = %concatenate.pivot.20.48.1
  %88 = getelementptr [20 x double], ptr addrspace(1) %arg1119, i64 0, i64 %1
  %param_1.319030.1137 = getelementptr inbounds i8, ptr addrspace(1) %88, i64 8
  br label %concatenate.43.1.merge28.1

concatenate.43.1.merge28.1:                       ; preds = %concatenate.pivot.0.49.1, %concatenate.pivot.20.51.1, %concatenate.pivot.40.52.1, %concatenate.pivot.60.54.1
  %.in.1 = phi ptr addrspace(1) [ %param_1.319030.1137, %concatenate.pivot.0.49.1 ], [ %param_2.265433.1, %concatenate.pivot.20.51.1 ], [ %param_3.204736.1, %concatenate.pivot.40.52.1 ], [ %param_4.156839.1, %concatenate.pivot.60.54.1 ]
  %89 = load double, ptr addrspace(1) %.in.1, align 8, !invariant.load !303
  %multiply.2971.358.1 = fmul double %param_0.230427.1, %89
  %multiply.2972.359.1 = fmul double %89, %multiply.2971.358.1
  %add.3619.i89.1 = fadd double %add.3619.i89, %multiply.2972.359.1
  %90 = or disjoint i32 %thread.id.x, 32
  %91 = icmp ult i32 %90, 60
  br i1 %91, label %loop3.loop_header21.preheader.1, label %x_in_tile-after.7

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %92 = icmp eq i32 %thread.id.x, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %92, label %reduction_write_output-true.then, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3619.i88, ptr addrspace(3) @"shared_cache2_$_0", align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true.then:                 ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) @"shared_cache2_$_0", align 8
  store double %output.then.val, ptr addrspace(1) %arg7131, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_minimum_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #4 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %1 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %2 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %multiply.2973.1.clone.1 = fmul double %2, 5.000000e-01
  %add.4066.1.clone.1 = fsub double %multiply.2973.1.clone.1, %1
  %subtract.239.1.clone.1 = fsub double %0, %add.4066.1.clone.1
  %compare.653.1.clone.1 = fcmp uno double %subtract.239.1.clone.1, 0.000000e+00
  %3 = select i1 %compare.653.1.clone.1, double 0xFFF0000000000000, double %subtract.239.1.clone.1
  %4 = fcmp ole double %3, 0.000000e+00
  %minimum.9.1 = select i1 %4, double %3, double 0.000000e+00
  store double %minimum.9.1, ptr addrspace(1) %arg37, align 128
  store double %3, ptr addrspace(1) %arg49, align 128
  store double %add.4066.1.clone.1, ptr addrspace(1) %arg511, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_and_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg4) local_unnamed_addr #4 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %1 = load i64, ptr addrspace(1) %arg37, align 128, !invariant.load !303
  %2 = icmp slt i64 %0, %1
  %3 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %4 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %5 = or i8 %4, %3
  %6 = trunc i8 %5 to i1
  %7 = xor i1 %6, true
  %8 = and i1 %2, %7
  %9 = zext i1 %8 to i8
  store i8 %9, ptr addrspace(1) %arg49, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !314
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.11.in_bounds-true, label %loop_broadcast_fusion.11.in_bounds-after

loop_broadcast_fusion.11.in_bounds-after:         ; preds = %loop_broadcast_fusion.11.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.11.in_bounds-true:          ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.11.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_10(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(960) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture align 128 dereferenceable(160) %arg16, ptr noalias nocapture align 128 dereferenceable(160) %arg17, ptr noalias nocapture align 128 dereferenceable(160) %arg18, ptr noalias nocapture align 128 dereferenceable(160) %arg19, ptr noalias nocapture align 128 dereferenceable(160) %arg20) local_unnamed_addr #4 {
entry:
  %arg20351 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19349 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18347 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17345 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16343 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15341 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14339 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13337 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12335 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11333 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10331 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9329 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8327 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7325 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6323 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5321 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4319 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2315 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1313 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0311 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg0311, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load i64, ptr addrspace(1) %arg15341, align 128, !invariant.load !303
  %5 = sitofp i64 %4 to double
  %6 = load double, ptr addrspace(1) %arg14339, align 128, !invariant.load !303
  %multiply.2909.9 = fmul double %6, %5
  %7 = getelementptr [120 x double], ptr addrspace(1) %arg1313, i64 0, i64 %1
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 320
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %10 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg6323, i64 0, i64 %1
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !303
  %multiply.2910.78 = fmul double %multiply.2909.9, 5.000000e-01
  %12 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg7325, i64 0, i64 %1
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !303
  %multiply.2913.15 = fmul double %multiply.2910.78, %13
  %add.3826.15 = fadd double %11, %multiply.2913.15
  %multiply.2917.33 = fmul double %9, %add.3826.15
  %multiply.2918.33 = fmul double %multiply.2917.33, 5.000000e-01
  %multiply.2919.33 = fmul double %add.3826.15, 5.000000e-01
  %multiply.2920.33 = fmul double %9, %multiply.2919.33
  %add.3831.26 = fadd double %multiply.2918.33, %multiply.2920.33
  %multiply.2921.3 = fmul double %multiply.2909.9, %add.3831.26
  %add.3832.1 = fadd double %3, %multiply.2921.3
  %14 = getelementptr double, ptr addrspace(1) %arg16343, i64 %1
  %15 = load double, ptr addrspace(1) %14, align 8
  %16 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 480
  %17 = load double, ptr addrspace(1) %16, align 8, !invariant.load !303
  %18 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg8327, i64 0, i64 %1
  %19 = load double, ptr addrspace(1) %18, align 8, !invariant.load !303
  %20 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg9329, i64 0, i64 %1
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !303
  %multiply.2914.1549 = fmul double %multiply.2910.78, %21
  %add.3827.1550 = fadd double %19, %multiply.2914.1549
  %multiply.2917.3374 = fmul double %17, %add.3827.1550
  %multiply.2918.3375 = fmul double %multiply.2917.3374, 5.000000e-01
  %multiply.2919.3377 = fmul double %add.3827.1550, 5.000000e-01
  %multiply.2920.3378 = fmul double %17, %multiply.2919.3377
  %add.3831.2679 = fadd double %multiply.2918.3375, %multiply.2920.3378
  %multiply.2923.3.clone.1 = fmul double %multiply.2909.9, %add.3831.2679
  %add.3835.1.clone.1 = fadd double %15, %multiply.2923.3.clone.1
  %22 = getelementptr double, ptr addrspace(1) %arg17345, i64 %1
  %23 = load double, ptr addrspace(1) %22, align 8
  %24 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 800
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !303
  %26 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg12335, i64 0, i64 %1
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !303
  %28 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg13337, i64 0, i64 %1
  %29 = load double, ptr addrspace(1) %28, align 8, !invariant.load !303
  %multiply.2916.15117 = fmul double %multiply.2910.78, %29
  %add.3830.15118 = fadd double %27, %multiply.2916.15117
  %multiply.2917.33130 = fmul double %25, %add.3830.15118
  %multiply.2918.33131 = fmul double %multiply.2917.33130, 5.000000e-01
  %multiply.2919.33133 = fmul double %add.3830.15118, 5.000000e-01
  %multiply.2920.33134 = fmul double %25, %multiply.2919.33133
  %add.3831.26135 = fadd double %multiply.2918.33131, %multiply.2920.33134
  %multiply.2924.3.clone.1 = fmul double %multiply.2909.9, %add.3831.26135
  %add.3836.1.clone.1 = fadd double %23, %multiply.2924.3.clone.1
  %30 = getelementptr double, ptr addrspace(1) %arg18347, i64 %1
  %31 = load double, ptr addrspace(1) %30, align 8
  %32 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 160
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !303
  %34 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4319, i64 0, i64 %1
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !303
  %36 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5321, i64 0, i64 %1
  %37 = load double, ptr addrspace(1) %36, align 8, !invariant.load !303
  %multiply.2912.15149 = fmul double %multiply.2910.78, %37
  %add.3825.15150 = fadd double %35, %multiply.2912.15149
  %multiply.2917.33186 = fmul double %33, %add.3825.15150
  %multiply.2918.33187 = fmul double %multiply.2917.33186, 5.000000e-01
  %multiply.2919.33189 = fmul double %add.3825.15150, 5.000000e-01
  %multiply.2920.33190 = fmul double %33, %multiply.2919.33189
  %add.3831.26191 = fadd double %multiply.2918.33187, %multiply.2920.33190
  %multiply.2925.3.clone.1 = fmul double %multiply.2909.9, %add.3831.26191
  %add.3837.1.clone.1 = fadd double %31, %multiply.2925.3.clone.1
  %38 = getelementptr double, ptr addrspace(1) %arg19349, i64 %1
  %39 = load double, ptr addrspace(1) %38, align 8
  %40 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %41 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2315, i64 0, i64 %1
  %42 = load double, ptr addrspace(1) %41, align 8, !invariant.load !303
  %43 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3317, i64 0, i64 %1
  %44 = load double, ptr addrspace(1) %43, align 8, !invariant.load !303
  %multiply.2911.15199 = fmul double %multiply.2910.78, %44
  %add.3822.15200 = fadd double %42, %multiply.2911.15199
  %multiply.2917.33242 = fmul double %40, %add.3822.15200
  %multiply.2918.33243 = fmul double %multiply.2917.33242, 5.000000e-01
  %multiply.2919.33245 = fmul double %add.3822.15200, 5.000000e-01
  %multiply.2920.33246 = fmul double %40, %multiply.2919.33245
  %add.3831.26247 = fadd double %multiply.2918.33243, %multiply.2920.33246
  %multiply.2929.3.clone.1 = fmul double %multiply.2909.9, %add.3831.26247
  %add.3840.1.clone.1 = fadd double %39, %multiply.2929.3.clone.1
  %45 = getelementptr double, ptr addrspace(1) %arg20351, i64 %1
  %46 = load double, ptr addrspace(1) %45, align 8
  %47 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 640
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !303
  %49 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg10331, i64 0, i64 %1
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !303
  %51 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg11333, i64 0, i64 %1
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !303
  %multiply.2915.15279 = fmul double %multiply.2910.78, %52
  %add.3829.15280 = fadd double %50, %multiply.2915.15279
  %multiply.2917.33298 = fmul double %48, %add.3829.15280
  %multiply.2918.33299 = fmul double %multiply.2917.33298, 5.000000e-01
  %multiply.2919.33301 = fmul double %add.3829.15280, 5.000000e-01
  %multiply.2920.33302 = fmul double %48, %multiply.2919.33301
  %add.3831.26303 = fadd double %multiply.2918.33299, %multiply.2920.33302
  %multiply.2922.3.clone.1 = fmul double %multiply.2909.9, %add.3831.26303
  %add.3834.1.clone.1 = fadd double %46, %multiply.2922.3.clone.1
  store double %add.3832.1, ptr addrspace(1) %2, align 8
  store double %add.3835.1.clone.1, ptr addrspace(1) %14, align 8
  store double %add.3836.1.clone.1, ptr addrspace(1) %22, align 8
  store double %add.3837.1.clone.1, ptr addrspace(1) %30, align 8
  store double %add.3840.1.clone.1, ptr addrspace(1) %38, align 8
  store double %add.3834.1.clone.1, ptr addrspace(1) %45, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !314
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr i8, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.7.in_bounds-true, label %loop_broadcast_fusion.7.in_bounds-after

loop_broadcast_fusion.7.in_bounds-after:          ; preds = %loop_broadcast_fusion.7.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.7.in_bounds-true:           ; preds = %entry
  store i8 0, ptr addrspace(1) %5, align 1
  br label %loop_broadcast_fusion.7.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !315
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr i32, ptr addrspace(1) %arg01, i64 %3
  %5 = load i32, ptr addrspace(1) %4, align 4, !invariant.load !303
  %6 = sitofp i32 %5 to double
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  store double %6, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !314
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr i8, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.6.in_bounds-true, label %loop_broadcast_fusion.6.in_bounds-after

loop_broadcast_fusion.6.in_bounds-after:          ; preds = %loop_broadcast_fusion.6.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.6.in_bounds-true:           ; preds = %entry
  store i8 0, ptr addrspace(1) %5, align 1
  br label %loop_broadcast_fusion.6.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_fusion_4(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = load double, ptr addrspace(1) %arg01, align 16, !invariant.load !303
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg13, i64 %2
  store double %1, ptr addrspace(1) %3, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(15360) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !314
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr i32, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.16.in_bounds-true, label %loop_broadcast_fusion.16.in_bounds-after

loop_broadcast_fusion.16.in_bounds-after:         ; preds = %loop_broadcast_fusion.16.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.16.in_bounds-true:          ; preds = %entry
  store i32 0, ptr addrspace(1) %5, align 4
  br label %loop_broadcast_fusion.16.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !316
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !316
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0x7FF8000000000000, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %1 = icmp slt i64 %0, 192
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_56(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #4 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.1643 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !303
  %0 = icmp slt i64 %param_1.1643, 0
  %1 = add i64 %param_1.1643, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1643
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg04, i64 0, i64 %4
  store i32 1, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_55(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #4 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.1645 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !303
  %0 = icmp slt i64 %param_1.1645, 0
  %1 = add i64 %param_1.1645, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.1645
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg04, i64 0, i64 %4
  store double 1.000000e+00, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_41(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #4 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.934 = load i64, ptr addrspace(1) %arg415, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.16354 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.11135 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.13526 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %multiply.2876.9 = fmul double %param_3.11135, %param_2.13526
  %add.3805.7 = fadd double %param_1.16354, %multiply.2876.9
  %4 = tail call double @llvm.fma.f64(double %add.3805.7, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #12
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #12
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.3805.7)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #12
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #12
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #12
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.7) #12
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #12
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.3805.7, 0.000000e+00
  %30 = fadd double %add.3805.7, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #12
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #12
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_4.934, 0
  %43 = add i64 %param_4.934, 192
  %44 = select i1 %42, i64 %43, i64 %param_4.934
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %compare.625.3 = fcmp ogt double %z.2.i, 1.000000e-128
  %47 = zext i1 %compare.625.3 to i8
  %48 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg07, i64 0, i64 %46, i64 %thread_id_x
  store i8 %47, ptr addrspace(1) %48, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_10(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1298 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1298, 0
  %2 = add i64 %param_2.1298, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1298
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15825 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = icmp ne i64 %param_1.15825, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_11(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1300 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1300, 0
  %2 = add i64 %param_2.1300, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1300
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.15844 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = icmp ne i64 %param_1.15844, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1362 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1362, 0
  %2 = add i64 %param_2.1362, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1362
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.16424 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !303
  %.not = icmp eq i64 %param_1.16424, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_48(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1353 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.16364 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = tail call double @llvm.fma.f64(double %param_1.16364, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #12
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #12
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_1.16364)
  %6 = tail call double @llvm.fma.f64(double %4, double 0xBC7ABC9E3B39803F, double %5)
  %7 = tail call double @llvm.fma.f64(double %6, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %8 = tail call double @llvm.fma.f64(double %7, double %6, double 0x3EC71DEE62401315)
  %9 = tail call double @llvm.fma.f64(double %8, double %6, double 0x3EFA01997C89EB71)
  %10 = tail call double @llvm.fma.f64(double %9, double %6, double 0x3F2A01A014761F65)
  %11 = tail call double @llvm.fma.f64(double %10, double %6, double 0x3F56C16C1852B7AF)
  %12 = tail call double @llvm.fma.f64(double %11, double %6, double 0x3F81111111122322)
  %13 = tail call double @llvm.fma.f64(double %12, double %6, double 0x3FA55555555502A1)
  %14 = tail call double @llvm.fma.f64(double %13, double %6, double 0x3FC5555555555511)
  %15 = tail call double @llvm.fma.f64(double %14, double %6, double 0x3FE000000000000B)
  %16 = tail call double @llvm.fma.f64(double %15, double %6, double 1.000000e+00)
  %17 = tail call double @llvm.fma.f64(double %16, double %6, double 1.000000e+00)
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #12
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #12
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #12
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.16364) #12
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #12
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_1.16364, 0.000000e+00
  %28 = fadd double %param_1.16364, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #12
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #12
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_2.1353, 0
  %41 = add i64 %param_2.1353, 192
  %42 = select i1 %40, i64 %41, i64 %param_2.1353
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %compare.629.3 = fcmp ogt double %z.2.i, 1.000000e-128
  %45 = zext i1 %compare.629.3 to i8
  %46 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %44, i64 %thread_id_x
  store i8 %45, ptr addrspace(1) %46, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_14(ptr noalias nocapture writeonly align 128 dereferenceable(15360) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1345 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1345, 0
  %2 = add i64 %param_2.1345, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1345
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.16294 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = icmp ne i64 %param_1.16294, 0
  %8 = zext i1 %7 to i32
  %9 = getelementptr inbounds [192 x [20 x i32]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i32 %8, ptr addrspace(1) %9, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_39(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #4 {
entry:
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_5.781 = load i64, ptr addrspace(1) %arg518, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.13494 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg416, i64 %thread_id_x
  %param_4.9305 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.11096 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %multiply.2876.11 = fmul double %param_4.9305, %param_3.11096
  %add.3805.9 = fadd double %param_2.13494, %multiply.2876.11
  %4 = tail call double @llvm.fma.f64(double %add.3805.9, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #12
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #12
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.3805.9)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #12
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #12
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #12
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.9) #12
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #12
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.3805.9, 0.000000e+00
  %30 = fadd double %add.3805.9, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #12
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #12
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_5.781, 0
  %43 = add i64 %param_5.781, 192
  %44 = select i1 %42, i64 %43, i64 %param_5.781
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %compare.625.11 = fcmp ogt double %z.2.i, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.16177 = load double, ptr addrspace(1) %47, align 8, !invariant.load !303
  %48 = select i1 %compare.625.11, double %z.2.i, double %param_1.16177
  %49 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg08, i64 0, i64 %46, i64 %thread_id_x
  store double %48, ptr addrspace(1) %49, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_42(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #4 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.919 = load i64, ptr addrspace(1) %arg415, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.16114 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.10955 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.13286 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %multiply.2876.7 = fmul double %param_3.10955, %param_2.13286
  %add.3805.5 = fadd double %param_1.16114, %multiply.2876.7
  %4 = tail call double @llvm.fma.f64(double %add.3805.5, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #12
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #12
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.3805.5)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #12
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #12
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #12
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.5) #12
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #12
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.3805.5, 0.000000e+00
  %30 = fadd double %add.3805.5, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #12
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #12
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_4.919, 0
  %43 = add i64 %param_4.919, 192
  %44 = select i1 %42, i64 %43, i64 %param_4.919
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %47 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %46, i64 %thread_id_x
  store double %z.2.i, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_38(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1621 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg621, i64 %thread_id_x
  %param_6.6074 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.11145 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.7856 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %4 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.9357 = load double, ptr addrspace(1) %4, align 8, !invariant.load !303
  %multiply.2876.39 = fmul double %param_5.7856, %param_4.9357
  %add.3805.37 = fadd double %param_3.11145, %multiply.2876.39
  %5 = tail call double @llvm.fma.f64(double %add.3805.37, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #12
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #12
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.3805.37)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #12
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #12
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #12
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.37) #12
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #12
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.3805.37, 0.000000e+00
  %31 = fadd double %add.3805.37, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #12
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #12
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %divide.576.7 = fdiv double 1.000000e+00, %param_6.6074
  %43 = icmp slt i64 %param_1.1621, 0
  %44 = add i64 %param_1.1621, 192
  %45 = select i1 %43, i64 %44, i64 %param_1.1621
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.625.35 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.13378 = load double, ptr addrspace(1) %48, align 8, !invariant.load !303
  %49 = select i1 %compare.625.35, double %z.2.i, double %param_2.13378
  %add.3806.7 = fadd double %divide.576.7, %49
  %multiply.2901.3 = fmul double %add.3806.7, %add.3806.7
  %divide.588.3 = fdiv double 1.000000e+00, %multiply.2901.3
  %50 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg09, i64 0, i64 %47, i64 %thread_id_x
  store double %divide.588.3, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_6(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1361 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1361, 0
  %2 = add i64 %param_2.1361, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1361
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.16414 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %multiply.2893.5 = fmul double %param_1.16414, %param_1.16414
  %multiply.2894.3 = fmul double %multiply.2893.5, 5.000000e-01
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2894.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_7(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1356 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1356, 0
  %2 = add i64 %param_2.1356, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1356
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.16084 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %multiply.2908.3 = fmul double %param_1.16084, 2.000000e+00
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2908.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_53(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #4 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1618 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_1.1618, 0
  %2 = add i64 %param_1.1618, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1618
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg04, i64 0, i64 %5, i64 %thread_id_x
  store double 1.000000e+00, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_15(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1347 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1347, 0
  %2 = add i64 %param_2.1347, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1347
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.16314 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = sitofp i64 %param_1.16314 to double
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_21(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1346 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1346, 0
  %2 = add i64 %param_2.1346, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1346
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.16304 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.16304, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_32(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1314 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1314, 0
  %2 = add i64 %param_2.1314, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1314
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15974 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %multiply.2877.2 = fmul double %param_1.15974, %param_1.15974
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2877.2, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_54(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #4 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1647 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_1.1647, 0
  %2 = add i64 %param_1.1647, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1647
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg04, i64 0, i64 %5, i64 %thread_id_x
  store double 0.000000e+00, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_44(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1322 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1322, 0
  %2 = add i64 %param_2.1322, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1322
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.16054 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %multiply.2900.3 = fmul double %param_1.16054, %param_1.16054
  %divide.587.3 = fdiv double 1.000000e+00, %multiply.2900.3
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.587.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_46(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #4 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1115 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13174 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = tail call double @llvm.fma.f64(double %param_2.13174, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #12
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #12
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_2.13174)
  %6 = tail call double @llvm.fma.f64(double %4, double 0xBC7ABC9E3B39803F, double %5)
  %7 = tail call double @llvm.fma.f64(double %6, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %8 = tail call double @llvm.fma.f64(double %7, double %6, double 0x3EC71DEE62401315)
  %9 = tail call double @llvm.fma.f64(double %8, double %6, double 0x3EFA01997C89EB71)
  %10 = tail call double @llvm.fma.f64(double %9, double %6, double 0x3F2A01A014761F65)
  %11 = tail call double @llvm.fma.f64(double %10, double %6, double 0x3F56C16C1852B7AF)
  %12 = tail call double @llvm.fma.f64(double %11, double %6, double 0x3F81111111122322)
  %13 = tail call double @llvm.fma.f64(double %12, double %6, double 0x3FA55555555502A1)
  %14 = tail call double @llvm.fma.f64(double %13, double %6, double 0x3FC5555555555511)
  %15 = tail call double @llvm.fma.f64(double %14, double %6, double 0x3FE000000000000B)
  %16 = tail call double @llvm.fma.f64(double %15, double %6, double 1.000000e+00)
  %17 = tail call double @llvm.fma.f64(double %16, double %6, double 1.000000e+00)
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #12
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #12
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #12
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.13174) #12
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #12
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_2.13174, 0.000000e+00
  %28 = fadd double %param_2.13174, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #12
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #12
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_3.1115, 0
  %41 = add i64 %param_3.1115, 192
  %42 = select i1 %40, i64 %41, i64 %param_3.1115
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %compare.629.7 = fcmp ogt double %z.2.i, 1.000000e-128
  %45 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.16005 = load double, ptr addrspace(1) %45, align 8, !invariant.load !303
  %46 = select i1 %compare.629.7, double %z.2.i, double %param_1.16005
  %47 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg06, i64 0, i64 %44, i64 %thread_id_x
  store double %46, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_49(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1311 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15944 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = tail call double @llvm.fma.f64(double %param_1.15944, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #12
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #12
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_1.15944)
  %6 = tail call double @llvm.fma.f64(double %4, double 0xBC7ABC9E3B39803F, double %5)
  %7 = tail call double @llvm.fma.f64(double %6, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %8 = tail call double @llvm.fma.f64(double %7, double %6, double 0x3EC71DEE62401315)
  %9 = tail call double @llvm.fma.f64(double %8, double %6, double 0x3EFA01997C89EB71)
  %10 = tail call double @llvm.fma.f64(double %9, double %6, double 0x3F2A01A014761F65)
  %11 = tail call double @llvm.fma.f64(double %10, double %6, double 0x3F56C16C1852B7AF)
  %12 = tail call double @llvm.fma.f64(double %11, double %6, double 0x3F81111111122322)
  %13 = tail call double @llvm.fma.f64(double %12, double %6, double 0x3FA55555555502A1)
  %14 = tail call double @llvm.fma.f64(double %13, double %6, double 0x3FC5555555555511)
  %15 = tail call double @llvm.fma.f64(double %14, double %6, double 0x3FE000000000000B)
  %16 = tail call double @llvm.fma.f64(double %15, double %6, double 1.000000e+00)
  %17 = tail call double @llvm.fma.f64(double %16, double %6, double 1.000000e+00)
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #12
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #12
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #12
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.15944) #12
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #12
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_1.15944, 0.000000e+00
  %28 = fadd double %param_1.15944, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #12
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #12
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_2.1311, 0
  %41 = add i64 %param_2.1311, 192
  %42 = select i1 %40, i64 %41, i64 %param_2.1311
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %45 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %44, i64 %thread_id_x
  store double %z.2.i, ptr addrspace(1) %45, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_50(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1309 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1309, 0
  %2 = add i64 %param_2.1309, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1309
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.15924 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.15924, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg11, ptr noalias nocapture align 128 dereferenceable(160) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg23) local_unnamed_addr #4 {
entry:
  %arg2358 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2256 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2154 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2052 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1950 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1848 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1746 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1644 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1542 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1440 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1338 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1236 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1134 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1032 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg930 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg828 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg726 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg624 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg522 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg318, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %4 = getelementptr double, ptr addrspace(1) %arg522, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !303
  %multiply.2873.19 = fmul double %3, %5
  %6 = getelementptr double, ptr addrspace(1) %arg216, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %add.3802.19 = fadd double %multiply.2873.19, %7
  %8 = getelementptr double, ptr addrspace(1) %arg1134, i64 %1
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %10 = fneg double %add.3802.19
  %11 = tail call double @llvm.fma.f64(double %10, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #12
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #12
  %14 = tail call double @llvm.fma.f64(double %13, double 0xBFE62E42FEFA39EF, double %10)
  %15 = tail call double @llvm.fma.f64(double %13, double 0xBC7ABC9E3B39803F, double %14)
  %16 = tail call double @llvm.fma.f64(double %15, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %17 = tail call double @llvm.fma.f64(double %16, double %15, double 0x3EC71DEE62401315)
  %18 = tail call double @llvm.fma.f64(double %17, double %15, double 0x3EFA01997C89EB71)
  %19 = tail call double @llvm.fma.f64(double %18, double %15, double 0x3F2A01A014761F65)
  %20 = tail call double @llvm.fma.f64(double %19, double %15, double 0x3F56C16C1852B7AF)
  %21 = tail call double @llvm.fma.f64(double %20, double %15, double 0x3F81111111122322)
  %22 = tail call double @llvm.fma.f64(double %21, double %15, double 0x3FA55555555502A1)
  %23 = tail call double @llvm.fma.f64(double %22, double %15, double 0x3FC5555555555511)
  %24 = tail call double @llvm.fma.f64(double %23, double %15, double 0x3FE000000000000B)
  %25 = tail call double @llvm.fma.f64(double %24, double %15, double 1.000000e+00)
  %26 = tail call double @llvm.fma.f64(double %25, double %15, double 1.000000e+00)
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #12
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %26) #12
  %29 = shl i32 %12, 20
  %30 = add i32 %28, %29
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %30) #12
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %10) #12
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #12
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %36 = fcmp ogt double %add.3802.19, 0.000000e+00
  %37 = fsub double 0x7FF0000000000000, %add.3802.19
  %z.0.i = select i1 %36, double 0.000000e+00, double %37
  %38 = fcmp olt float %34, 0x4010E90000000000
  br i1 %38, label %39, label %__nv_exp.exit

39:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %40 = sdiv i32 %12, 2
  %41 = shl i32 %40, 20
  %42 = add i32 %28, %41
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %42) #12
  %44 = sub nsw i32 %12, %40
  %45 = shl i32 %44, 20
  %46 = add nsw i32 %45, 1072693248
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %46) #12
  %48 = fmul double %47, %43
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %39
  %z.2.i = phi double [ %31, %entry ], [ %48, %39 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %49 = getelementptr double, ptr addrspace(1) %arg1236, i64 %1
  %50 = load double, ptr addrspace(1) %49, align 8
  %51 = getelementptr double, ptr addrspace(1) %arg726, i64 %1
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !303
  %53 = getelementptr double, ptr addrspace(1) %arg828, i64 %1
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !303
  %55 = getelementptr double, ptr addrspace(1) %arg012, i64 %1
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !303
  %multiply.2876.37.clone.1 = fmul double %54, %56
  %add.3805.35.clone.1 = fadd double %52, %multiply.2876.37.clone.1
  %57 = tail call double @llvm.fma.f64(double %add.3805.35.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %58 = tail call i32 @llvm.nvvm.d2i.lo(double %57) #12
  %59 = tail call double @llvm.nvvm.add.rn.d(double %57, double 0xC338000000000000) #12
  %60 = tail call double @llvm.fma.f64(double %59, double 0xBFE62E42FEFA39EF, double %add.3805.35.clone.1)
  %61 = tail call double @llvm.fma.f64(double %59, double 0xBC7ABC9E3B39803F, double %60)
  %62 = tail call double @llvm.fma.f64(double %61, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %63 = tail call double @llvm.fma.f64(double %62, double %61, double 0x3EC71DEE62401315)
  %64 = tail call double @llvm.fma.f64(double %63, double %61, double 0x3EFA01997C89EB71)
  %65 = tail call double @llvm.fma.f64(double %64, double %61, double 0x3F2A01A014761F65)
  %66 = tail call double @llvm.fma.f64(double %65, double %61, double 0x3F56C16C1852B7AF)
  %67 = tail call double @llvm.fma.f64(double %66, double %61, double 0x3F81111111122322)
  %68 = tail call double @llvm.fma.f64(double %67, double %61, double 0x3FA55555555502A1)
  %69 = tail call double @llvm.fma.f64(double %68, double %61, double 0x3FC5555555555511)
  %70 = tail call double @llvm.fma.f64(double %69, double %61, double 0x3FE000000000000B)
  %71 = tail call double @llvm.fma.f64(double %70, double %61, double 1.000000e+00)
  %72 = tail call double @llvm.fma.f64(double %71, double %61, double 1.000000e+00)
  %73 = tail call i32 @llvm.nvvm.d2i.lo(double %72) #12
  %74 = tail call i32 @llvm.nvvm.d2i.hi(double %72) #12
  %75 = shl i32 %58, 20
  %76 = add i32 %74, %75
  %77 = tail call double @llvm.nvvm.lohi.i2d(i32 %73, i32 %76) #12
  %78 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.35.clone.1) #12
  %79 = bitcast i32 %78 to float
  %80 = tail call float @llvm.nvvm.fabs.f(float %79) #12
  %81 = fcmp olt float %80, 0x4010C46560000000
  br i1 %81, label %__nv_exp.exit7, label %__internal_fast_icmp_abs_lt.exit.i4

__internal_fast_icmp_abs_lt.exit.i4:              ; preds = %__nv_exp.exit
  %82 = fcmp olt double %add.3805.35.clone.1, 0.000000e+00
  %83 = fadd double %add.3805.35.clone.1, 0x7FF0000000000000
  %z.0.i5 = select i1 %82, double 0.000000e+00, double %83
  %84 = fcmp olt float %80, 0x4010E90000000000
  br i1 %84, label %85, label %__nv_exp.exit7

85:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i4
  %86 = sdiv i32 %58, 2
  %87 = shl i32 %86, 20
  %88 = add i32 %74, %87
  %89 = tail call double @llvm.nvvm.lohi.i2d(i32 %73, i32 %88) #12
  %90 = sub nsw i32 %58, %86
  %91 = shl i32 %90, 20
  %92 = add nsw i32 %91, 1072693248
  %93 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %92) #12
  %94 = fmul double %93, %89
  br label %__nv_exp.exit7

__nv_exp.exit7:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i4, %85
  %z.2.i6 = phi double [ %77, %__nv_exp.exit ], [ %94, %85 ], [ %z.0.i5, %__internal_fast_icmp_abs_lt.exit.i4 ]
  %95 = getelementptr double, ptr addrspace(1) %arg624, i64 %1
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !303
  %97 = load i64, ptr addrspace(1) %arg1440, align 128, !invariant.load !303
  %98 = icmp slt i64 %97, 0
  %99 = add i64 %97, 192
  %100 = select i1 %98, i64 %99, i64 %97
  %101 = trunc i64 %100 to i32
  %102 = tail call i32 @llvm.smax.i32(i32 %101, i32 0)
  %103 = tail call i32 @llvm.umin.i32(i32 %102, i32 191)
  %104 = zext nneg i32 %103 to i64
  %105 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr addrspace(1) %arg1338, i64 0, i64 %104, i64 %1, i64 0
  %106 = load double, ptr addrspace(1) %105, align 8, !invariant.load !303
  %107 = getelementptr double, ptr addrspace(1) %arg420, i64 %1
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !303
  %109 = getelementptr double, ptr addrspace(1) %arg930, i64 %1
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = getelementptr double, ptr addrspace(1) %arg1032, i64 %1
  %112 = load double, ptr addrspace(1) %111, align 8, !invariant.load !303
  %113 = tail call double @llvm.fma.f64(double %112, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %114 = tail call i32 @llvm.nvvm.d2i.lo(double %113) #12
  %115 = tail call double @llvm.nvvm.add.rn.d(double %113, double 0xC338000000000000) #12
  %116 = tail call double @llvm.fma.f64(double %115, double 0xBFE62E42FEFA39EF, double %112)
  %117 = tail call double @llvm.fma.f64(double %115, double 0xBC7ABC9E3B39803F, double %116)
  %118 = tail call double @llvm.fma.f64(double %117, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %119 = tail call double @llvm.fma.f64(double %118, double %117, double 0x3EC71DEE62401315)
  %120 = tail call double @llvm.fma.f64(double %119, double %117, double 0x3EFA01997C89EB71)
  %121 = tail call double @llvm.fma.f64(double %120, double %117, double 0x3F2A01A014761F65)
  %122 = tail call double @llvm.fma.f64(double %121, double %117, double 0x3F56C16C1852B7AF)
  %123 = tail call double @llvm.fma.f64(double %122, double %117, double 0x3F81111111122322)
  %124 = tail call double @llvm.fma.f64(double %123, double %117, double 0x3FA55555555502A1)
  %125 = tail call double @llvm.fma.f64(double %124, double %117, double 0x3FC5555555555511)
  %126 = tail call double @llvm.fma.f64(double %125, double %117, double 0x3FE000000000000B)
  %127 = tail call double @llvm.fma.f64(double %126, double %117, double 1.000000e+00)
  %128 = tail call double @llvm.fma.f64(double %127, double %117, double 1.000000e+00)
  %129 = tail call i32 @llvm.nvvm.d2i.lo(double %128) #12
  %130 = tail call i32 @llvm.nvvm.d2i.hi(double %128) #12
  %131 = shl i32 %114, 20
  %132 = add i32 %130, %131
  %133 = tail call double @llvm.nvvm.lohi.i2d(i32 %129, i32 %132) #12
  %134 = tail call i32 @llvm.nvvm.d2i.hi(double %112) #12
  %135 = bitcast i32 %134 to float
  %136 = tail call float @llvm.nvvm.fabs.f(float %135) #12
  %137 = fcmp olt float %136, 0x4010C46560000000
  br i1 %137, label %__nv_exp.exit11, label %__internal_fast_icmp_abs_lt.exit.i8

__internal_fast_icmp_abs_lt.exit.i8:              ; preds = %__nv_exp.exit7
  %138 = fcmp olt double %112, 0.000000e+00
  %139 = fadd double %112, 0x7FF0000000000000
  %z.0.i9 = select i1 %138, double 0.000000e+00, double %139
  %140 = fcmp olt float %136, 0x4010E90000000000
  br i1 %140, label %141, label %__nv_exp.exit11

141:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i8
  %142 = sdiv i32 %114, 2
  %143 = shl i32 %142, 20
  %144 = add i32 %130, %143
  %145 = tail call double @llvm.nvvm.lohi.i2d(i32 %129, i32 %144) #12
  %146 = sub nsw i32 %114, %142
  %147 = shl i32 %146, 20
  %148 = add nsw i32 %147, 1072693248
  %149 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %148) #12
  %150 = fmul double %149, %145
  br label %__nv_exp.exit11

__nv_exp.exit11:                                  ; preds = %__nv_exp.exit7, %__internal_fast_icmp_abs_lt.exit.i8, %141
  %z.2.i10 = phi double [ %133, %__nv_exp.exit7 ], [ %150, %141 ], [ %z.0.i9, %__internal_fast_icmp_abs_lt.exit.i8 ]
  %divide.581.1.clone.1 = fdiv double 1.000000e+00, %110
  %compare.625.33.clone.1 = fcmp ogt double %z.2.i6, 1.000000e-128
  %151 = select i1 %compare.625.33.clone.1, double %z.2.i6, double %96
  %divide.576.5.clone.1 = fdiv double 1.000000e+00, %50
  %add.3806.5.clone.1 = fadd double %divide.576.5.clone.1, %151
  %divide.577.1.clone.1 = fdiv double 1.000000e+00, %add.3806.5.clone.1
  %multiply.2881.13 = fmul double %151, %divide.577.1.clone.1
  %multiply.2882.5 = fmul double %108, %multiply.2881.13
  %multiply.2877.12.clone.1 = fmul double %9, %9
  %add.3804.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.575.1.clone.1 = fdiv double 1.000000e+00, %add.3804.1.clone.1
  %subtract.229.6.clone.1 = fsub double 1.000000e+00, %divide.575.1.clone.1
  %multiply.2874.5.clone.1 = fmul double %divide.575.1.clone.1, %subtract.229.6.clone.1
  %multiply.2878.11.clone.1 = fmul double %multiply.2877.12.clone.1, %multiply.2874.5.clone.1
  %add.3807.9.clone.1 = fadd double %multiply.2878.11.clone.1, %divide.577.1.clone.1
  %compare.626.9.clone.1 = fcmp ogt double %add.3807.9.clone.1, 1.000000e-128
  %152 = select i1 %compare.626.9.clone.1, double %add.3807.9.clone.1, double 0x7FF8000000000000
  %multiply.2883.1.clone.1 = fmul double %add.3806.5.clone.1, %152
  %divide.580.3.clone.1 = fdiv double 1.000000e+00, %multiply.2883.1.clone.1
  %multiply.2875.5.clone.1 = fmul double %9, %multiply.2874.5.clone.1
  %divide.578.1.clone.1 = fdiv double %multiply.2875.5.clone.1, %152
  %subtract.230.5.clone.1 = fsub double %106, %divide.575.1.clone.1
  %divide.579.1.clone.1 = fdiv double %subtract.230.5.clone.1, %multiply.2874.5.clone.1
  %multiply.2879.17 = fmul double %divide.579.1.clone.1, %divide.578.1.clone.1
  %add.3810.17 = fadd double %add.3802.19, %multiply.2879.17
  %subtract.231.2.clone.1 = fsub double %add.3810.17, %add.3802.19
  %multiply.2884.4.clone.1 = fmul double %subtract.231.2.clone.1, %subtract.231.2.clone.1
  %multiply.2885.3.clone.1 = fmul double %divide.577.1.clone.1, %multiply.2884.4.clone.1
  %add.3812.3.clone.1 = fadd double %divide.580.3.clone.1, %multiply.2885.3.clone.1
  %add.3814.1.clone.1 = fadd double %add.3812.3.clone.1, -1.000000e+00
  %multiply.2886.2 = fmul double %multiply.2882.5, %add.3814.1.clone.1
  %multiply.2880.1 = fmul double %3, %56
  %add.3811.1 = fadd double %7, %multiply.2880.1
  %153 = tail call double @llvm.fabs.f64(double %add.3810.17)
  %154 = call i1 @llvm.is.fpclass.f64(double %add.3810.17, i32 504)
  %compare.628.9 = fcmp olt double %153, 1.400000e+01
  %155 = and i1 %154, %compare.628.9
  %compare.629.9.clone.1 = fcmp ogt double %z.2.i10, 1.000000e-128
  %156 = select i1 %compare.629.9.clone.1, double %z.2.i10, double %96
  %add.3815.2.clone.1 = fadd double %divide.581.1.clone.1, %156
  %divide.582.1.clone.1 = fdiv double 1.000000e+00, %add.3815.2.clone.1
  %multiply.2887.9 = fmul double %divide.582.1.clone.1, 2.000000e+00
  %divide.583.5 = fdiv double 1.000000e+00, %multiply.2887.9
  %multiply.2888.1 = fmul double %multiply.2886.2, %divide.583.5
  %157 = getelementptr i64, ptr addrspace(1) %arg114, i64 %1
  %158 = load i64, ptr addrspace(1) %157, align 8, !invariant.load !303
  %159 = sitofp i64 %158 to double
  %multiply.2889.1 = fmul double %multiply.2888.1, %159
  %add.3816.1 = fadd double %add.3811.1, %multiply.2889.1
  %160 = select i1 %155, double %add.3816.1, double %56
  %.not = icmp eq i64 %158, 0
  %add.3817.2.clone.1 = fadd double %divide.581.1.clone.1, %z.2.i10
  %divide.584.3.clone.1 = fdiv double 1.000000e+00, %add.3817.2.clone.1
  %multiply.2890.23.clone.1 = fmul double %multiply.2882.5, %multiply.2882.5
  %multiply.2891.11.clone.1 = fmul double %multiply.2890.23.clone.1, 5.000000e-01
  %multiply.2892.11.clone.1 = fmul double %multiply.2890.23.clone.1, %add.3814.1.clone.1
  %add.3819.9.clone.1 = fadd double %multiply.2891.11.clone.1, %multiply.2892.11.clone.1
  %multiply.2893.11.clone.1 = fmul double %108, %108
  %multiply.2894.9.clone.1 = fmul double %multiply.2893.11.clone.1, 5.000000e-01
  %multiply.2895.4.clone.1 = fmul double %multiply.2881.13, %multiply.2894.9.clone.1
  %multiply.2896.7.clone.1 = fmul double %multiply.2895.4.clone.1, %add.3814.1.clone.1
  %subtract.232.7.clone.1 = fsub double %add.3819.9.clone.1, %multiply.2896.7.clone.1
  %multiply.2897.5.clone.1 = fmul double %subtract.232.7.clone.1, %159
  %add.3820.3.clone.1 = fadd double %multiply.2897.5.clone.1, %divide.582.1.clone.1
  %compare.632.5.clone.1 = fcmp ogt double %add.3820.3.clone.1, 1.000000e-128
  %161 = select i1 %compare.632.5.clone.1, double %add.3820.3.clone.1, double %96
  %162 = select i1 %.not, double %divide.584.3.clone.1, double %161
  %163 = select i1 %155, double %162, double %110
  %164 = select i1 %155, double %add.3810.17, double %5
  %165 = select i1 %155, double %152, double %50
  %166 = getelementptr double, ptr addrspace(1) %arg1542, i64 %1
  store double %160, ptr addrspace(1) %166, align 8
  store double %163, ptr addrspace(1) %109, align 8
  %167 = getelementptr double, ptr addrspace(1) %arg1644, i64 %1
  store double %divide.582.1.clone.1, ptr addrspace(1) %167, align 8
  %168 = getelementptr double, ptr addrspace(1) %arg1746, i64 %1
  store double %divide.581.1.clone.1, ptr addrspace(1) %168, align 8
  %169 = getelementptr double, ptr addrspace(1) %arg1848, i64 %1
  store double %add.3814.1.clone.1, ptr addrspace(1) %169, align 8
  %170 = getelementptr double, ptr addrspace(1) %arg1950, i64 %1
  store double %164, ptr addrspace(1) %170, align 8
  store double %165, ptr addrspace(1) %49, align 8
  %171 = getelementptr double, ptr addrspace(1) %arg2052, i64 %1
  store double %divide.579.1.clone.1, ptr addrspace(1) %171, align 8
  %172 = getelementptr double, ptr addrspace(1) %arg2154, i64 %1
  store double %divide.578.1.clone.1, ptr addrspace(1) %172, align 8
  %173 = getelementptr double, ptr addrspace(1) %arg2256, i64 %1
  store double %divide.577.1.clone.1, ptr addrspace(1) %173, align 8
  %174 = getelementptr double, ptr addrspace(1) %arg2358, i64 %1
  store double %divide.575.1.clone.1, ptr addrspace(1) %174, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_4(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg10) local_unnamed_addr #4 {
entry:
  %arg1035 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg933 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg831 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg729 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg627 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg525 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg423 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg321 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_5.793 = load i64, ptr addrspace(1) %arg525, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg117, i64 %thread_id_x
  %param_1.16334 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.9445 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg831, i64 %thread_id_x
  %param_8.3946 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %4 = getelementptr double, ptr addrspace(1) %arg1035, i64 %thread_id_x
  %param_10.2997 = load double, ptr addrspace(1) %4, align 8, !invariant.load !303
  %5 = getelementptr double, ptr addrspace(1) %arg933, i64 %thread_id_x
  %param_9.3548 = load double, ptr addrspace(1) %5, align 8, !invariant.load !303
  %multiply.2876.17 = fmul double %param_10.2997, %param_9.3548
  %add.3805.15 = fadd double %param_8.3946, %multiply.2876.17
  %6 = tail call double @llvm.fma.f64(double %add.3805.15, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %7 = tail call i32 @llvm.nvvm.d2i.lo(double %6) #12
  %8 = tail call double @llvm.nvvm.add.rn.d(double %6, double 0xC338000000000000) #12
  %9 = tail call double @llvm.fma.f64(double %8, double 0xBFE62E42FEFA39EF, double %add.3805.15)
  %10 = tail call double @llvm.fma.f64(double %8, double 0xBC7ABC9E3B39803F, double %9)
  %11 = tail call double @llvm.fma.f64(double %10, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %12 = tail call double @llvm.fma.f64(double %11, double %10, double 0x3EC71DEE62401315)
  %13 = tail call double @llvm.fma.f64(double %12, double %10, double 0x3EFA01997C89EB71)
  %14 = tail call double @llvm.fma.f64(double %13, double %10, double 0x3F2A01A014761F65)
  %15 = tail call double @llvm.fma.f64(double %14, double %10, double 0x3F56C16C1852B7AF)
  %16 = tail call double @llvm.fma.f64(double %15, double %10, double 0x3F81111111122322)
  %17 = tail call double @llvm.fma.f64(double %16, double %10, double 0x3FA55555555502A1)
  %18 = tail call double @llvm.fma.f64(double %17, double %10, double 0x3FC5555555555511)
  %19 = tail call double @llvm.fma.f64(double %18, double %10, double 0x3FE000000000000B)
  %20 = tail call double @llvm.fma.f64(double %19, double %10, double 1.000000e+00)
  %21 = tail call double @llvm.fma.f64(double %20, double %10, double 1.000000e+00)
  %22 = tail call i32 @llvm.nvvm.d2i.lo(double %21) #12
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %21) #12
  %24 = shl i32 %7, 20
  %25 = add i32 %23, %24
  %26 = tail call double @llvm.nvvm.lohi.i2d(i32 %22, i32 %25) #12
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.15) #12
  %28 = bitcast i32 %27 to float
  %29 = tail call float @llvm.nvvm.fabs.f(float %28) #12
  %30 = fcmp olt float %29, 0x4010C46560000000
  br i1 %30, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %31 = fcmp olt double %add.3805.15, 0.000000e+00
  %32 = fadd double %add.3805.15, 0x7FF0000000000000
  %z.0.i = select i1 %31, double 0.000000e+00, double %32
  %33 = fcmp olt float %29, 0x4010E90000000000
  br i1 %33, label %34, label %__nv_exp.exit

34:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %35 = sdiv i32 %7, 2
  %36 = shl i32 %35, 20
  %37 = add i32 %23, %36
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 %22, i32 %37) #12
  %39 = sub nsw i32 %7, %35
  %40 = shl i32 %39, 20
  %41 = add nsw i32 %40, 1072693248
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %41) #12
  %43 = fmul double %42, %38
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %34
  %z.2.i = phi double [ %26, %entry ], [ %43, %34 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %44 = icmp slt i64 %param_5.793, 0
  %45 = add i64 %param_5.793, 192
  %46 = select i1 %44, i64 %45, i64 %param_5.793
  %47 = tail call i64 @llvm.smax.i64(i64 %46, i64 0)
  %48 = tail call i64 @llvm.umin.i64(i64 %47, i64 191)
  %compare.625.13 = fcmp ogt double %z.2.i, 1.000000e-128
  %49 = getelementptr double, ptr addrspace(1) %arg729, i64 %thread_id_x
  %param_7.4919 = load double, ptr addrspace(1) %49, align 8, !invariant.load !303
  %50 = select i1 %compare.625.13, double %z.2.i, double %param_7.4919
  %51 = getelementptr double, ptr addrspace(1) %arg627, i64 %thread_id_x
  %param_6.61710 = load double, ptr addrspace(1) %51, align 8, !invariant.load !303
  %multiply.2881.3 = fmul double %50, %param_6.61710
  %multiply.2882.17 = fmul double %param_4.9445, %multiply.2881.3
  %multiply.2890.27 = fmul double %multiply.2882.17, %multiply.2882.17
  %multiply.2891.13 = fmul double %multiply.2890.27, 5.000000e-01
  %52 = getelementptr double, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.111111 = load double, ptr addrspace(1) %52, align 8, !invariant.load !303
  %multiply.2892.13 = fmul double %param_3.111111, %multiply.2890.27
  %add.3819.11 = fadd double %multiply.2891.13, %multiply.2892.13
  %multiply.2893.13 = fmul double %param_4.9445, %param_4.9445
  %multiply.2894.11 = fmul double %multiply.2893.13, 5.000000e-01
  %multiply.2895.6 = fmul double %multiply.2894.11, %multiply.2881.3
  %multiply.2896.9 = fmul double %param_3.111111, %multiply.2895.6
  %subtract.232.9 = fsub double %add.3819.11, %multiply.2896.9
  %53 = getelementptr i64, ptr addrspace(1) %arg219, i64 %thread_id_x
  %param_2.135014 = load i64, ptr addrspace(1) %53, align 8, !invariant.load !303
  %54 = sitofp i64 %param_2.135014 to double
  %multiply.2897.7 = fmul double %subtract.232.9, %54
  %add.3820.5 = fadd double %param_1.16334, %multiply.2897.7
  %compare.632.3 = fcmp ogt double %add.3820.5, 1.000000e-128
  %55 = zext i1 %compare.632.3 to i8
  %56 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg015, i64 0, i64 %48, i64 %thread_id_x
  store i8 %55, ptr addrspace(1) %56, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_2(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1586 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_1.1586, 0
  %2 = add i64 %param_1.1586, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1586
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7945 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.6186 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2873.25 = fmul double %param_5.7945, %param_6.6186
  %8 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9457 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %add.3802.25 = fadd double %multiply.2873.25, %param_4.9457
  %9 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.13638 = load double, ptr addrspace(1) %9, align 8, !invariant.load !303
  %10 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11239 = load double, ptr addrspace(1) %10, align 8, !invariant.load !303
  %multiply.2879.23 = fmul double %param_2.13638, %param_3.11239
  %add.3810.23 = fadd double %add.3802.25, %multiply.2879.23
  %11 = tail call double @llvm.fabs.f64(double %add.3810.23)
  %12 = call i1 @llvm.is.fpclass.f64(double %add.3810.23, i32 504)
  %compare.628.15 = fcmp olt double %11, 1.400000e+01
  %13 = and i1 %12, %compare.628.15
  %14 = zext i1 %13 to i8
  %15 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg010, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %14, ptr addrspace(1) %15, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_3(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1589 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_1.1589, 0
  %2 = add i64 %param_1.1589, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1589
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.7964 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr double, ptr addrspace(1) %arg621, i64 %thread_id_x
  %param_6.6215 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2873.23 = fmul double %param_5.7964, %param_6.6215
  %8 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.9466 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %add.3802.23 = fadd double %multiply.2873.23, %param_4.9466
  %9 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.13647 = load double, ptr addrspace(1) %9, align 8, !invariant.load !303
  %10 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.11248 = load double, ptr addrspace(1) %10, align 8, !invariant.load !303
  %multiply.2879.21 = fmul double %param_2.13647, %param_3.11248
  %add.3810.21 = fadd double %add.3802.23, %multiply.2879.21
  %11 = tail call double @llvm.fabs.f64(double %add.3810.21)
  %12 = call i1 @llvm.is.fpclass.f64(double %add.3810.21, i32 504)
  %compare.628.13 = fcmp olt double %11, 1.400000e+01
  %13 = and i1 %12, %compare.628.13
  %14 = zext i1 %13 to i8
  %15 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg09, i64 0, i64 %5, i64 %thread_id_x
  store i8 %14, ptr addrspace(1) %15, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_31(ptr noalias nocapture writeonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #4 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.933 = load i64, ptr addrspace(1) %arg419, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_4.933, 0
  %2 = add i64 %param_4.933, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.933
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.16344 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.13515 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2877.8 = fmul double %param_2.13515, %param_2.13515
  %8 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11128 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %subtract.229.4 = fsub double 1.000000e+00, %param_3.11128
  %multiply.2874.3 = fmul double %param_3.11128, %subtract.229.4
  %multiply.2878.7 = fmul double %multiply.2877.8, %multiply.2874.3
  %add.3807.5 = fadd double %param_1.16344, %multiply.2878.7
  %compare.626.3 = fcmp ogt double %add.3807.5, 1.000000e-128
  %9 = zext i1 %compare.626.3 to i8
  %10 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store i8 %9, ptr addrspace(1) %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_45(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #4 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.936 = load i64, ptr addrspace(1) %arg415, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.16034 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.10905 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = tail call double @llvm.fma.f64(double %param_3.10905, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #12
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #12
  %6 = tail call double @llvm.fma.f64(double %5, double 0xBFE62E42FEFA39EF, double %param_3.10905)
  %7 = tail call double @llvm.fma.f64(double %5, double 0xBC7ABC9E3B39803F, double %6)
  %8 = tail call double @llvm.fma.f64(double %7, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %9 = tail call double @llvm.fma.f64(double %8, double %7, double 0x3EC71DEE62401315)
  %10 = tail call double @llvm.fma.f64(double %9, double %7, double 0x3EFA01997C89EB71)
  %11 = tail call double @llvm.fma.f64(double %10, double %7, double 0x3F2A01A014761F65)
  %12 = tail call double @llvm.fma.f64(double %11, double %7, double 0x3F56C16C1852B7AF)
  %13 = tail call double @llvm.fma.f64(double %12, double %7, double 0x3F81111111122322)
  %14 = tail call double @llvm.fma.f64(double %13, double %7, double 0x3FA55555555502A1)
  %15 = tail call double @llvm.fma.f64(double %14, double %7, double 0x3FC5555555555511)
  %16 = tail call double @llvm.fma.f64(double %15, double %7, double 0x3FE000000000000B)
  %17 = tail call double @llvm.fma.f64(double %16, double %7, double 1.000000e+00)
  %18 = tail call double @llvm.fma.f64(double %17, double %7, double 1.000000e+00)
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #12
  %20 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #12
  %21 = shl i32 %4, 20
  %22 = add i32 %20, %21
  %23 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %22) #12
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %param_3.10905) #12
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #12
  %27 = fcmp olt float %26, 0x4010C46560000000
  br i1 %27, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %28 = fcmp olt double %param_3.10905, 0.000000e+00
  %29 = fadd double %param_3.10905, 0x7FF0000000000000
  %z.0.i = select i1 %28, double 0.000000e+00, double %29
  %30 = fcmp olt float %26, 0x4010E90000000000
  br i1 %30, label %31, label %__nv_exp.exit

31:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %32 = sdiv i32 %4, 2
  %33 = shl i32 %32, 20
  %34 = add i32 %20, %33
  %35 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %34) #12
  %36 = sub nsw i32 %4, %32
  %37 = shl i32 %36, 20
  %38 = add nsw i32 %37, 1072693248
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %38) #12
  %40 = fmul double %39, %35
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %31
  %z.2.i = phi double [ %23, %entry ], [ %40, %31 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %41 = icmp slt i64 %param_4.936, 0
  %42 = add i64 %param_4.936, 192
  %43 = select i1 %41, i64 %42, i64 %param_4.936
  %44 = tail call i64 @llvm.smax.i64(i64 %43, i64 0)
  %45 = tail call i64 @llvm.umin.i64(i64 %44, i64 191)
  %compare.629.5 = fcmp ogt double %z.2.i, 1.000000e-128
  %46 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.13206 = load double, ptr addrspace(1) %46, align 8, !invariant.load !303
  %47 = select i1 %compare.629.5, double %z.2.i, double %param_2.13206
  %add.3815.1 = fadd double %param_1.16034, %47
  %multiply.2899.3 = fmul double %add.3815.1, %add.3815.1
  %divide.586.3 = fdiv double 1.000000e+00, %multiply.2899.3
  %48 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %45, i64 %thread_id_x
  store double %divide.586.3, ptr addrspace(1) %48, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_12(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #4 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1099 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.16164 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.13335 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = tail call double @llvm.fma.f64(double %param_2.13335, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #12
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #12
  %6 = tail call double @llvm.fma.f64(double %5, double 0xBFE62E42FEFA39EF, double %param_2.13335)
  %7 = tail call double @llvm.fma.f64(double %5, double 0xBC7ABC9E3B39803F, double %6)
  %8 = tail call double @llvm.fma.f64(double %7, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %9 = tail call double @llvm.fma.f64(double %8, double %7, double 0x3EC71DEE62401315)
  %10 = tail call double @llvm.fma.f64(double %9, double %7, double 0x3EFA01997C89EB71)
  %11 = tail call double @llvm.fma.f64(double %10, double %7, double 0x3F2A01A014761F65)
  %12 = tail call double @llvm.fma.f64(double %11, double %7, double 0x3F56C16C1852B7AF)
  %13 = tail call double @llvm.fma.f64(double %12, double %7, double 0x3F81111111122322)
  %14 = tail call double @llvm.fma.f64(double %13, double %7, double 0x3FA55555555502A1)
  %15 = tail call double @llvm.fma.f64(double %14, double %7, double 0x3FC5555555555511)
  %16 = tail call double @llvm.fma.f64(double %15, double %7, double 0x3FE000000000000B)
  %17 = tail call double @llvm.fma.f64(double %16, double %7, double 1.000000e+00)
  %18 = tail call double @llvm.fma.f64(double %17, double %7, double 1.000000e+00)
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #12
  %20 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #12
  %21 = shl i32 %4, 20
  %22 = add i32 %20, %21
  %23 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %22) #12
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.13335) #12
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #12
  %27 = fcmp olt float %26, 0x4010C46560000000
  br i1 %27, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %28 = fcmp olt double %param_2.13335, 0.000000e+00
  %29 = fadd double %param_2.13335, 0x7FF0000000000000
  %z.0.i = select i1 %28, double 0.000000e+00, double %29
  %30 = fcmp olt float %26, 0x4010E90000000000
  br i1 %30, label %31, label %__nv_exp.exit

31:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %32 = sdiv i32 %4, 2
  %33 = shl i32 %32, 20
  %34 = add i32 %20, %33
  %35 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %34) #12
  %36 = sub nsw i32 %4, %32
  %37 = shl i32 %36, 20
  %38 = add nsw i32 %37, 1072693248
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %38) #12
  %40 = fmul double %39, %35
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %31
  %z.2.i = phi double [ %23, %entry ], [ %40, %31 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %41 = icmp slt i64 %param_3.1099, 0
  %42 = add i64 %param_3.1099, 192
  %43 = select i1 %41, i64 %42, i64 %param_3.1099
  %44 = tail call i64 @llvm.smax.i64(i64 %43, i64 0)
  %45 = tail call i64 @llvm.umin.i64(i64 %44, i64 191)
  %add.3817.1 = fadd double %param_1.16164, %z.2.i
  %multiply.2906.3 = fmul double %add.3817.1, %add.3817.1
  %divide.592.3 = fdiv double 1.000000e+00, %multiply.2906.3
  %46 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg06, i64 0, i64 %45, i64 %thread_id_x
  store double %divide.592.3, ptr addrspace(1) %46, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_17(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8) local_unnamed_addr #4 {
entry:
  %arg827 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg725 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg623 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1080 = load i64, ptr addrspace(1) %arg317, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.12994 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg623, i64 %thread_id_x
  %param_6.6095 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg827, i64 %thread_id_x
  %param_8.3916 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %4 = getelementptr double, ptr addrspace(1) %arg725, i64 %thread_id_x
  %param_7.4857 = load double, ptr addrspace(1) %4, align 8, !invariant.load !303
  %multiply.2876.19 = fmul double %param_8.3916, %param_7.4857
  %add.3805.17 = fadd double %param_6.6095, %multiply.2876.19
  %5 = tail call double @llvm.fma.f64(double %add.3805.17, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #12
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #12
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.3805.17)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #12
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #12
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #12
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.17) #12
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #12
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.3805.17, 0.000000e+00
  %31 = fadd double %add.3805.17, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #12
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #12
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = icmp slt i64 %param_3.1080, 0
  %44 = add i64 %param_3.1080, 192
  %45 = select i1 %43, i64 %44, i64 %param_3.1080
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.625.15 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.7638 = load double, ptr addrspace(1) %48, align 8, !invariant.load !303
  %49 = select i1 %compare.625.15, double %z.2.i, double %param_5.7638
  %50 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.9109 = load double, ptr addrspace(1) %50, align 8, !invariant.load !303
  %multiply.2881.5 = fmul double %49, %param_4.9109
  %multiply.2882.13 = fmul double %param_2.12994, %multiply.2881.5
  %51 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.158310 = load double, ptr addrspace(1) %51, align 8, !invariant.load !303
  %multiply.2886.1 = fmul double %param_1.158310, %multiply.2882.13
  %52 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg011, i64 0, i64 %47, i64 %thread_id_x
  store double %multiply.2886.1, ptr addrspace(1) %52, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_16(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1359 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1359, 0
  %2 = add i64 %param_2.1359, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1359
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.16104 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %multiply.2887.3 = fmul double %param_1.16104, 2.000000e+00
  %multiply.2905.3 = fmul double %multiply.2887.3, %multiply.2887.3
  %divide.591.3 = fdiv double 1.000000e+00, %multiply.2905.3
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.591.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_18(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1585 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_1.1585, 0
  %2 = add i64 %param_1.1585, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1585
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.13024 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %multiply.2887.7 = fmul double %param_2.13024, 2.000000e+00
  %divide.583.3 = fdiv double 1.000000e+00, %multiply.2887.7
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.583.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_24(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #4 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_6.603 = load i64, ptr addrspace(1) %arg621, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_6.603, 0
  %2 = add i64 %param_6.603, 192
  %3 = select i1 %1, i64 %2, i64 %param_6.603
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.9274 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.7785 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2873.5 = fmul double %param_4.9274, %param_5.7785
  %8 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.11056 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %add.3802.5 = fadd double %multiply.2873.5, %param_3.11056
  %9 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.16267 = load double, ptr addrspace(1) %9, align 8, !invariant.load !303
  %10 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.13428 = load double, ptr addrspace(1) %10, align 8, !invariant.load !303
  %multiply.2879.7 = fmul double %param_1.16267, %param_2.13428
  %add.3810.7 = fadd double %add.3802.5, %multiply.2879.7
  %subtract.231.3 = fsub double %add.3810.7, %add.3802.5
  %multiply.2884.1 = fmul double %subtract.231.3, %subtract.231.3
  %11 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg09, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2884.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_23(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #4 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_6.614 = load i64, ptr addrspace(1) %arg621, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_6.614, 0
  %2 = add i64 %param_6.614, 192
  %3 = select i1 %1, i64 %2, i64 %param_6.614
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.9414 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.7905 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2873.9 = fmul double %param_4.9414, %param_5.7905
  %8 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.11206 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %add.3802.9 = fadd double %multiply.2873.9, %param_3.11206
  %9 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.16387 = load double, ptr addrspace(1) %9, align 8, !invariant.load !303
  %10 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.13578 = load double, ptr addrspace(1) %10, align 8, !invariant.load !303
  %multiply.2879.9 = fmul double %param_1.16387, %param_2.13578
  %add.3810.9 = fadd double %add.3802.9, %multiply.2879.9
  %subtract.231.1 = fsub double %add.3810.9, %add.3802.9
  %multiply.2904.3 = fmul double %subtract.231.1, 2.000000e+00
  %11 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg09, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2904.3, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_37(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1339 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1339, 0
  %2 = add i64 %param_2.1339, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1339
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.16234 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %subtract.229.12 = fsub double 1.000000e+00, %param_1.16234
  %multiply.2874.11 = fmul double %param_1.16234, %subtract.229.12
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2874.11, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_33(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1297 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1297, 0
  %2 = add i64 %param_2.1297, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1297
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.15814 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %subtract.229.10 = fsub double 1.000000e+00, %param_1.15814
  %multiply.2874.9 = fmul double %param_1.15814, %subtract.229.10
  %multiply.2902.3 = fmul double %multiply.2874.9, %multiply.2874.9
  %divide.589.3 = fdiv double 1.000000e+00, %multiply.2902.3
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.589.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_27(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4) local_unnamed_addr #4 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1591 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_1.1591, 0
  %2 = add i64 %param_1.1591, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1591
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.13694 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.9505 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2877.16 = fmul double %param_4.9505, %param_4.9505
  %8 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11288 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %subtract.229.24 = fsub double 1.000000e+00, %param_3.11288
  %multiply.2874.23 = fmul double %param_3.11288, %subtract.229.24
  %multiply.2878.15 = fmul double %multiply.2877.16, %multiply.2874.23
  %add.3807.13 = fadd double %param_2.13694, %multiply.2878.15
  %compare.626.13 = fcmp ogt double %add.3807.13, 1.000000e-128
  %9 = select i1 %compare.626.13, double %add.3807.13, double 0x7FF8000000000000
  %multiply.2903.3 = fmul double %9, %9
  %divide.590.3 = fdiv double 1.000000e+00, %multiply.2903.3
  %10 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.590.3, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_34(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #4 {
entry:
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1107 = load i64, ptr addrspace(1) %arg319, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_3.1107, 0
  %2 = add i64 %param_3.1107, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.1107
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_2.1348 = getelementptr inbounds [192 x [20 x [1 x double]]], ptr addrspace(1) %arg217, i64 0, i64 %5, i64 %thread_id_x, i64 0
  %param_2.134811 = load double, ptr addrspace(1) %param_2.1348, align 8, !invariant.load !303
  %6 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.163212 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %subtract.230.3 = fsub double %param_2.134811, %param_1.163212
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.230.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_36(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1341 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.1341, 0
  %2 = add i64 %param_2.1341, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.1341
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.16254 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %subtract.229.1 = fsub double 1.000000e+00, %param_1.16254
  %7 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.229.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_28(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #4 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.1089 = load i64, ptr addrspace(1) %arg314, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_3.1089, 0
  %2 = add i64 %param_3.1089, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.1089
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.16024 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.13195 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %subtract.229.14 = fsub double 1.000000e+00, %param_2.13195
  %multiply.2874.13 = fmul double %param_2.13195, %subtract.229.14
  %multiply.2875.3 = fmul double %param_1.16024, %multiply.2874.13
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg08, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.2875.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_29(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4) local_unnamed_addr #4 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1607 = load i64, ptr addrspace(1) %arg113, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_1.1607, 0
  %2 = add i64 %param_1.1607, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.1607
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.13664 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr double, ptr addrspace(1) %arg419, i64 %thread_id_x
  %param_4.9485 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2877.18 = fmul double %param_4.9485, %param_4.9485
  %8 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.11268 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %subtract.229.26 = fsub double 1.000000e+00, %param_3.11268
  %multiply.2874.25 = fmul double %param_3.11268, %subtract.229.26
  %multiply.2878.17 = fmul double %multiply.2877.18, %multiply.2874.25
  %add.3807.15 = fadd double %param_2.13664, %multiply.2878.17
  %compare.626.15 = fcmp ogt double %add.3807.15, 1.000000e-128
  %9 = select i1 %compare.626.15, double %add.3807.15, double 0x7FF8000000000000
  %10 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_22(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.1620 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.9394 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg621, i64 %thread_id_x
  %param_6.6105 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.7886 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %multiply.2876.21 = fmul double %param_6.6105, %param_5.7886
  %add.3805.19 = fadd double %param_4.9394, %multiply.2876.21
  %4 = tail call double @llvm.fma.f64(double %add.3805.19, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #12
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #12
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.3805.19)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #12
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #12
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #12
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.19) #12
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #12
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.3805.19, 0.000000e+00
  %30 = fadd double %add.3805.19, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #12
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #12
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_1.1620, 0
  %43 = add i64 %param_1.1620, 192
  %44 = select i1 %42, i64 %43, i64 %param_1.1620
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %compare.625.17 = fcmp ogt double %z.2.i, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.11017 = load double, ptr addrspace(1) %47, align 8, !invariant.load !303
  %48 = select i1 %compare.625.17, double %z.2.i, double %param_3.11017
  %49 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.13368 = load double, ptr addrspace(1) %49, align 8, !invariant.load !303
  %multiply.2881.7 = fmul double %48, %param_2.13368
  %50 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg09, i64 0, i64 %46, i64 %thread_id_x
  store double %multiply.2881.7, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_8(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7) local_unnamed_addr #4 {
entry:
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1329 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.16124 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7895 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg724, i64 %thread_id_x
  %param_7.4876 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %4 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.6127 = load double, ptr addrspace(1) %4, align 8, !invariant.load !303
  %multiply.2876.25 = fmul double %param_7.4876, %param_6.6127
  %add.3805.23 = fadd double %param_5.7895, %multiply.2876.25
  %5 = tail call double @llvm.fma.f64(double %add.3805.23, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #12
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #12
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.3805.23)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #12
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #12
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #12
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.23) #12
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #12
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.3805.23, 0.000000e+00
  %31 = fadd double %add.3805.23, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #12
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #12
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = icmp slt i64 %param_2.1329, 0
  %44 = add i64 %param_2.1329, 192
  %45 = select i1 %43, i64 %44, i64 %param_2.1329
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.625.21 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9208 = load double, ptr addrspace(1) %48, align 8, !invariant.load !303
  %49 = select i1 %compare.625.21, double %z.2.i, double %param_4.9208
  %50 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.10969 = load double, ptr addrspace(1) %50, align 8, !invariant.load !303
  %multiply.2881.11 = fmul double %49, %param_3.10969
  %multiply.2882.3 = fmul double %param_1.16124, %multiply.2881.11
  %multiply.2890.3 = fmul double %multiply.2882.3, %multiply.2882.3
  %51 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg010, i64 0, i64 %47, i64 %thread_id_x
  store double %multiply.2890.3, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_5(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7) local_unnamed_addr #4 {
entry:
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1360 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.16404 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7925 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg724, i64 %thread_id_x
  %param_7.4906 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %4 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.6167 = load double, ptr addrspace(1) %4, align 8, !invariant.load !303
  %multiply.2876.23 = fmul double %param_7.4906, %param_6.6167
  %add.3805.21 = fadd double %param_5.7925, %multiply.2876.23
  %5 = tail call double @llvm.fma.f64(double %add.3805.21, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #12
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #12
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.3805.21)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #12
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #12
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #12
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.21) #12
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #12
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.3805.21, 0.000000e+00
  %31 = fadd double %add.3805.21, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #12
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #12
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.2893.9 = fmul double %param_1.16404, %param_1.16404
  %multiply.2894.7 = fmul double %multiply.2893.9, 5.000000e-01
  %43 = icmp slt i64 %param_2.1360, 0
  %44 = add i64 %param_2.1360, 192
  %45 = select i1 %43, i64 %44, i64 %param_2.1360
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.625.19 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9438 = load double, ptr addrspace(1) %48, align 8, !invariant.load !303
  %49 = select i1 %compare.625.19, double %z.2.i, double %param_4.9438
  %50 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11229 = load double, ptr addrspace(1) %50, align 8, !invariant.load !303
  %multiply.2881.9 = fmul double %49, %param_3.11229
  %multiply.2895.1 = fmul double %multiply.2894.7, %multiply.2881.9
  %51 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg010, i64 0, i64 %47, i64 %thread_id_x
  store double %multiply.2895.1, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7) local_unnamed_addr #4 {
entry:
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1358 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.16394 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7915 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg724, i64 %thread_id_x
  %param_7.4896 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %4 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.6157 = load double, ptr addrspace(1) %4, align 8, !invariant.load !303
  %multiply.2876.29 = fmul double %param_7.4896, %param_6.6157
  %add.3805.27 = fadd double %param_5.7915, %multiply.2876.29
  %5 = tail call double @llvm.fma.f64(double %add.3805.27, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #12
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #12
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.3805.27)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #12
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #12
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #12
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.27) #12
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #12
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.3805.27, 0.000000e+00
  %31 = fadd double %add.3805.27, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #12
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #12
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = icmp slt i64 %param_2.1358, 0
  %44 = add i64 %param_2.1358, 192
  %45 = select i1 %43, i64 %44, i64 %param_2.1358
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.625.25 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9428 = load double, ptr addrspace(1) %48, align 8, !invariant.load !303
  %49 = select i1 %compare.625.25, double %z.2.i, double %param_4.9428
  %50 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11219 = load double, ptr addrspace(1) %50, align 8, !invariant.load !303
  %multiply.2881.15 = fmul double %49, %param_3.11219
  %multiply.2882.7 = fmul double %param_1.16394, %multiply.2881.15
  %multiply.2907.3 = fmul double %multiply.2882.7, 2.000000e+00
  %51 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg010, i64 0, i64 %47, i64 %thread_id_x
  store double %multiply.2907.3, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_19(ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7) local_unnamed_addr #4 {
entry:
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.1338 = load i64, ptr addrspace(1) %arg214, align 128, !invariant.load !303
  %1 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.16224 = load double, ptr addrspace(1) %1, align 8, !invariant.load !303
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.7845 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %3 = getelementptr double, ptr addrspace(1) %arg724, i64 %thread_id_x
  %param_7.4836 = load double, ptr addrspace(1) %3, align 8, !invariant.load !303
  %4 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.6067 = load double, ptr addrspace(1) %4, align 8, !invariant.load !303
  %multiply.2876.31 = fmul double %param_7.4836, %param_6.6067
  %add.3805.29 = fadd double %param_5.7845, %multiply.2876.31
  %5 = tail call double @llvm.fma.f64(double %add.3805.29, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #12
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #12
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.3805.29)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #12
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #12
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #12
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3805.29) #12
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #12
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.3805.29, 0.000000e+00
  %31 = fadd double %add.3805.29, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #12
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #12
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = icmp slt i64 %param_2.1338, 0
  %44 = add i64 %param_2.1338, 192
  %45 = select i1 %43, i64 %44, i64 %param_2.1338
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.625.27 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.9258 = load double, ptr addrspace(1) %48, align 8, !invariant.load !303
  %49 = select i1 %compare.625.27, double %z.2.i, double %param_4.9258
  %50 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.11039 = load double, ptr addrspace(1) %50, align 8, !invariant.load !303
  %multiply.2881.17 = fmul double %49, %param_3.11039
  %multiply.2882.9 = fmul double %param_1.16224, %multiply.2881.17
  %51 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg010, i64 0, i64 %47, i64 %thread_id_x
  store double %multiply.2882.9, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_reduce_subtract_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg6) local_unnamed_addr #4 {
entry:
  %arg645 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg543 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg441 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg339 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg237 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg135 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg033 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !315
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 20
  %4 = mul i16 %3, 20
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %.decomposed to i64
  %6 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg135, i64 0, i64 %5
  %7 = zext nneg i16 %3 to i64
  %8 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg441, i64 0, i64 %7, i64 %5
  %9 = getelementptr inbounds [192 x [20 x float]], ptr addrspace(1) %arg339, i64 0, i64 %7, i64 %5
  %10 = getelementptr inbounds [192 x [20 x float]], ptr addrspace(1) %arg237, i64 0, i64 %7, i64 %5
  %11 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg033, i64 0, i64 %5
  %12 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %13 = tail call double @llvm.fma.f64(double %12, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %14 = tail call i32 @llvm.nvvm.d2i.lo(double %13) #12
  %15 = tail call double @llvm.nvvm.add.rn.d(double %13, double 0xC338000000000000) #12
  %16 = tail call double @llvm.fma.f64(double %15, double 0xBFE62E42FEFA39EF, double %12)
  %17 = tail call double @llvm.fma.f64(double %15, double 0xBC7ABC9E3B39803F, double %16)
  %18 = tail call double @llvm.fma.f64(double %17, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %19 = tail call double @llvm.fma.f64(double %18, double %17, double 0x3EC71DEE62401315)
  %20 = tail call double @llvm.fma.f64(double %19, double %17, double 0x3EFA01997C89EB71)
  %21 = tail call double @llvm.fma.f64(double %20, double %17, double 0x3F2A01A014761F65)
  %22 = tail call double @llvm.fma.f64(double %21, double %17, double 0x3F56C16C1852B7AF)
  %23 = tail call double @llvm.fma.f64(double %22, double %17, double 0x3F81111111122322)
  %24 = tail call double @llvm.fma.f64(double %23, double %17, double 0x3FA55555555502A1)
  %25 = tail call double @llvm.fma.f64(double %24, double %17, double 0x3FC5555555555511)
  %26 = tail call double @llvm.fma.f64(double %25, double %17, double 0x3FE000000000000B)
  %27 = tail call double @llvm.fma.f64(double %26, double %17, double 1.000000e+00)
  %28 = tail call double @llvm.fma.f64(double %27, double %17, double 1.000000e+00)
  %29 = tail call i32 @llvm.nvvm.d2i.lo(double %28) #12
  %30 = tail call i32 @llvm.nvvm.d2i.hi(double %28) #12
  %31 = shl i32 %14, 20
  %32 = add i32 %30, %31
  %33 = tail call double @llvm.nvvm.lohi.i2d(i32 %29, i32 %32) #12
  %34 = tail call i32 @llvm.nvvm.d2i.hi(double %12) #12
  %35 = bitcast i32 %34 to float
  %36 = tail call float @llvm.nvvm.fabs.f(float %35) #12
  %37 = fcmp olt float %36, 0x4010C46560000000
  br i1 %37, label %__nv_exp.exit.1, label %__internal_fast_icmp_abs_lt.exit.i.1

__internal_fast_icmp_abs_lt.exit.i.1:             ; preds = %entry
  %38 = fcmp olt double %12, 0.000000e+00
  %39 = fadd double %12, 0x7FF0000000000000
  %z.0.i.1 = select i1 %38, double 0.000000e+00, double %39
  %40 = fcmp olt float %36, 0x4010E90000000000
  br i1 %40, label %41, label %__nv_exp.exit.1

41:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i.1
  %42 = sdiv i32 %14, 2
  %43 = shl i32 %42, 20
  %44 = add i32 %30, %43
  %45 = tail call double @llvm.nvvm.lohi.i2d(i32 %29, i32 %44) #12
  %46 = sub nsw i32 %14, %42
  %47 = shl i32 %46, 20
  %48 = add nsw i32 %47, 1072693248
  %49 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %48) #12
  %50 = fmul double %49, %45
  br label %__nv_exp.exit.1

__nv_exp.exit.1:                                  ; preds = %41, %__internal_fast_icmp_abs_lt.exit.i.1, %entry
  %z.2.i.1 = phi double [ %33, %entry ], [ %50, %41 ], [ %z.0.i.1, %__internal_fast_icmp_abs_lt.exit.i.1 ]
  %51 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %52 = fcmp ole double %51, -3.000000e+01
  %53 = select i1 %52, double -3.000000e+01, double %51
  %54 = fcmp oge double %53, 3.000000e+01
  %.neg.1 = fneg double %53
  %55 = select i1 %54, double -3.000000e+01, double %.neg.1
  %56 = tail call double @llvm.fma.f64(double %55, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %57 = tail call i32 @llvm.nvvm.d2i.lo(double %56) #12
  %58 = tail call double @llvm.nvvm.add.rn.d(double %56, double 0xC338000000000000) #12
  %59 = tail call double @llvm.fma.f64(double %58, double 0xBFE62E42FEFA39EF, double %55)
  %60 = tail call double @llvm.fma.f64(double %58, double 0xBC7ABC9E3B39803F, double %59)
  %61 = tail call double @llvm.fma.f64(double %60, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %62 = tail call double @llvm.fma.f64(double %61, double %60, double 0x3EC71DEE62401315)
  %63 = tail call double @llvm.fma.f64(double %62, double %60, double 0x3EFA01997C89EB71)
  %64 = tail call double @llvm.fma.f64(double %63, double %60, double 0x3F2A01A014761F65)
  %65 = tail call double @llvm.fma.f64(double %64, double %60, double 0x3F56C16C1852B7AF)
  %66 = tail call double @llvm.fma.f64(double %65, double %60, double 0x3F81111111122322)
  %67 = tail call double @llvm.fma.f64(double %66, double %60, double 0x3FA55555555502A1)
  %68 = tail call double @llvm.fma.f64(double %67, double %60, double 0x3FC5555555555511)
  %69 = tail call double @llvm.fma.f64(double %68, double %60, double 0x3FE000000000000B)
  %70 = tail call double @llvm.fma.f64(double %69, double %60, double 1.000000e+00)
  %71 = tail call double @llvm.fma.f64(double %70, double %60, double 1.000000e+00)
  %72 = tail call i32 @llvm.nvvm.d2i.lo(double %71) #12
  %73 = tail call i32 @llvm.nvvm.d2i.hi(double %71) #12
  %74 = shl i32 %57, 20
  %75 = add i32 %73, %74
  %76 = tail call double @llvm.nvvm.lohi.i2d(i32 %72, i32 %75) #12
  %77 = tail call i32 @llvm.nvvm.d2i.hi(double %55) #12
  %78 = bitcast i32 %77 to float
  %79 = tail call float @llvm.nvvm.fabs.f(float %78) #12
  %80 = fcmp olt float %79, 0x4010C46560000000
  br i1 %80, label %in_bounds-after.1, label %__internal_fast_icmp_abs_lt.exit.i21.1

__internal_fast_icmp_abs_lt.exit.i21.1:           ; preds = %__nv_exp.exit.1
  %81 = fcmp olt double %55, 0.000000e+00
  %82 = fadd double %55, 0x7FF0000000000000
  %z.0.i22.1 = select i1 %81, double 0.000000e+00, double %82
  %83 = fcmp olt float %79, 0x4010E90000000000
  br i1 %83, label %84, label %in_bounds-after.1

84:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i21.1
  %85 = sdiv i32 %57, 2
  %86 = shl i32 %85, 20
  %87 = add i32 %73, %86
  %88 = tail call double @llvm.nvvm.lohi.i2d(i32 %72, i32 %87) #12
  %89 = sub nsw i32 %57, %85
  %90 = shl i32 %89, 20
  %91 = add nsw i32 %90, 1072693248
  %92 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %91) #12
  %93 = fmul double %92, %88
  br label %in_bounds-after.1

in_bounds-after.1:                                ; preds = %__nv_exp.exit.1, %__internal_fast_icmp_abs_lt.exit.i21.1, %84
  %z.2.i23.1 = phi double [ %76, %__nv_exp.exit.1 ], [ %93, %84 ], [ %z.0.i22.1, %__internal_fast_icmp_abs_lt.exit.i21.1 ]
  %94 = load double, ptr addrspace(1) %11, align 8, !invariant.load !303
  %95 = load float, ptr addrspace(1) %9, align 4, !invariant.load !303
  %96 = load float, ptr addrspace(1) %10, align 4, !invariant.load !303
  %97 = zext nneg i32 %linear_index to i64
  %98 = getelementptr double, ptr addrspace(1) %arg441, i64 %97
  %99 = load double, ptr addrspace(1) %98, align 8, !invariant.load !303
  %100 = fcmp ole double %99, -3.000000e+01
  %101 = select i1 %100, double -3.000000e+01, double %99
  %102 = fcmp oge double %101, 3.000000e+01
  %.neg20 = fneg double %101
  %103 = select i1 %102, double -3.000000e+01, double %.neg20
  %104 = tail call double @llvm.fma.f64(double %103, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %105 = tail call i32 @llvm.nvvm.d2i.lo(double %104) #12
  %106 = tail call double @llvm.nvvm.add.rn.d(double %104, double 0xC338000000000000) #12
  %107 = tail call double @llvm.fma.f64(double %106, double 0xBFE62E42FEFA39EF, double %103)
  %108 = tail call double @llvm.fma.f64(double %106, double 0xBC7ABC9E3B39803F, double %107)
  %109 = tail call double @llvm.fma.f64(double %108, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %110 = tail call double @llvm.fma.f64(double %109, double %108, double 0x3EC71DEE62401315)
  %111 = tail call double @llvm.fma.f64(double %110, double %108, double 0x3EFA01997C89EB71)
  %112 = tail call double @llvm.fma.f64(double %111, double %108, double 0x3F2A01A014761F65)
  %113 = tail call double @llvm.fma.f64(double %112, double %108, double 0x3F56C16C1852B7AF)
  %114 = tail call double @llvm.fma.f64(double %113, double %108, double 0x3F81111111122322)
  %115 = tail call double @llvm.fma.f64(double %114, double %108, double 0x3FA55555555502A1)
  %116 = tail call double @llvm.fma.f64(double %115, double %108, double 0x3FC5555555555511)
  %117 = tail call double @llvm.fma.f64(double %116, double %108, double 0x3FE000000000000B)
  %118 = tail call double @llvm.fma.f64(double %117, double %108, double 1.000000e+00)
  %119 = tail call double @llvm.fma.f64(double %118, double %108, double 1.000000e+00)
  %120 = tail call i32 @llvm.nvvm.d2i.lo(double %119) #12
  %121 = tail call i32 @llvm.nvvm.d2i.hi(double %119) #12
  %122 = shl i32 %105, 20
  %123 = add i32 %121, %122
  %124 = tail call double @llvm.nvvm.lohi.i2d(i32 %120, i32 %123) #12
  %125 = tail call i32 @llvm.nvvm.d2i.hi(double %103) #12
  %126 = bitcast i32 %125 to float
  %127 = tail call float @llvm.nvvm.fabs.f(float %126) #12
  %128 = fcmp olt float %127, 0x4010C46560000000
  br i1 %128, label %__nv_exp.exit28, label %__internal_fast_icmp_abs_lt.exit.i25

__internal_fast_icmp_abs_lt.exit.i25:             ; preds = %in_bounds-after.1
  %129 = fcmp olt double %103, 0.000000e+00
  %130 = fadd double %103, 0x7FF0000000000000
  %z.0.i26 = select i1 %129, double 0.000000e+00, double %130
  %131 = fcmp olt float %127, 0x4010E90000000000
  br i1 %131, label %132, label %__nv_exp.exit28

132:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i25
  %133 = sdiv i32 %105, 2
  %134 = shl i32 %133, 20
  %135 = add i32 %121, %134
  %136 = tail call double @llvm.nvvm.lohi.i2d(i32 %120, i32 %135) #12
  %137 = sub nsw i32 %105, %133
  %138 = shl i32 %137, 20
  %139 = add nsw i32 %138, 1072693248
  %140 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %139) #12
  %141 = fmul double %140, %136
  br label %__nv_exp.exit28

__nv_exp.exit28:                                  ; preds = %in_bounds-after.1, %__internal_fast_icmp_abs_lt.exit.i25, %132
  %z.2.i27 = phi double [ %124, %in_bounds-after.1 ], [ %141, %132 ], [ %z.0.i26, %__internal_fast_icmp_abs_lt.exit.i25 ]
  %add.3839.9.clone.1.1 = fadd double %z.2.i23.1, 1.000000e+00
  %divide.593.9.clone.1.1 = fdiv double 1.000000e+00, %add.3839.9.clone.1.1
  %subtract.233.4.clone.1.1 = fsub double 1.000000e+00, %divide.593.9.clone.1.1
  %142 = fpext float %95 to double
  %multiply.2926.3.clone.1.1 = fmul double %subtract.233.4.clone.1.1, %142
  %143 = fpext float %96 to double
  %multiply.2927.3.clone.1.1 = fmul double %divide.593.9.clone.1.1, %143
  %subtract.234.1.clone.1.1 = fsub double %multiply.2926.3.clone.1.1, %multiply.2927.3.clone.1.1
  %multiply.2928.5.1 = fmul double %z.2.i.1, %subtract.234.1.clone.1.1
  %add.3841.3.1 = fadd double %94, %multiply.2928.5.1
  %144 = fcmp ole double %add.3841.3.1, 0.000000e+00
  %maximum.41.i.1 = select i1 %144, double 0.000000e+00, double %add.3841.3.1
  %add.3839.9.clone.113 = fadd double %z.2.i27, 1.000000e+00
  %divide.593.9.clone.114 = fdiv double 1.000000e+00, %add.3839.9.clone.113
  %subtract.233.4.clone.115 = fsub double 1.000000e+00, %divide.593.9.clone.114
  %145 = getelementptr float, ptr addrspace(1) %arg339, i64 %97
  %146 = load float, ptr addrspace(1) %145, align 4, !invariant.load !303
  %147 = fpext float %146 to double
  %multiply.2926.3.clone.116 = fmul double %subtract.233.4.clone.115, %147
  %148 = getelementptr float, ptr addrspace(1) %arg237, i64 %97
  %149 = load float, ptr addrspace(1) %148, align 4, !invariant.load !303
  %150 = fpext float %149 to double
  %multiply.2927.3.clone.117 = fmul double %divide.593.9.clone.114, %150
  %subtract.234.1.clone.118 = fsub double %multiply.2926.3.clone.116, %multiply.2927.3.clone.117
  %151 = getelementptr double, ptr addrspace(1) %arg543, i64 %97
  store double %maximum.41.i.1, ptr addrspace(1) %151, align 8
  %152 = getelementptr double, ptr addrspace(1) %arg645, i64 %97
  store double %subtract.234.1.clone.118, ptr addrspace(1) %152, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_9(ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !317
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 7680
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.9.in_bounds-true, label %loop_broadcast_fusion.9.in_bounds-after

loop_broadcast_fusion.9.in_bounds-after:          ; preds = %loop_broadcast_fusion.9.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.9.in_bounds-true:           ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.9.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define void @input_scatter_fusion(ptr noalias nocapture align 128 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(15360) %arg2) local_unnamed_addr #6 {
entry:
  %arg238 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg136 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg034 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !315
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %param_2.206421 = getelementptr inbounds [20 x [192 x i32]], ptr addrspace(1) %arg238, i64 0, i64 %5, i64 %6
  %param_2.206422 = load i32, ptr addrspace(1) %param_2.206421, align 4, !invariant.load !303
  %7 = lshr i32 %param_2.206422, 30
  %8 = and i32 %7, 2
  %9 = add i32 %8, %param_2.206422
  %10 = icmp ult i32 %9, 2
  %11 = zext nneg i32 %linear_index to i64
  %12 = getelementptr i8, ptr addrspace(1) %arg136, i64 %11
  %13 = zext nneg i32 %9 to i64
  %14 = getelementptr inbounds [20 x [192 x [2 x double]]], ptr addrspace(1) %arg034, i64 0, i64 %5, i64 %6, i64 %13
  br i1 %10, label %scatter.in_bounds-true, label %scatter.7.1.in_bounds-after

scatter.7.1.in_bounds-after:                      ; preds = %entry, %scatter.in_bounds-true
  ret void

scatter.in_bounds-true:                           ; preds = %entry
  %param_1.240830 = load i8, ptr addrspace(1) %12, align 1, !invariant.load !303
  %15 = trunc i8 %param_1.240830 to i1
  %16 = select i1 %15, double 1.000000e+00, double 0.000000e+00
  %17 = atomicrmw fadd ptr addrspace(1) %14, double %16 seq_cst, align 8
  br label %scatter.7.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion(ptr noalias nocapture readonly align 16 dereferenceable(15360) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(92160) %arg1) local_unnamed_addr #4 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !315
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %7 = getelementptr inbounds [1 x [3 x [20 x [192 x i64]]]], ptr addrspace(1) %arg115, i64 0, i64 0, i64 0, i64 %5, i64 %6
  store i64 %5, ptr addrspace(1) %7, align 8
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 30720
  store i64 %6, ptr addrspace(1) %8, align 8
  %9 = zext nneg i32 %linear_index to i64
  %10 = getelementptr i32, ptr addrspace(1) %arg013, i64 %9
  %11 = load i32, ptr addrspace(1) %10, align 4, !invariant.load !303
  %12 = lshr i32 %11, 30
  %13 = and i32 %12, 2
  %14 = add i32 %13, %11
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 61440
  store i64 %15, ptr addrspace(1) %16, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(92160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(24) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(61440) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg9) local_unnamed_addr #4 {
entry:
  %arg9148 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8146 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7144 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6142 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5140 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4138 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3136 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2134 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1132 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0130 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !315
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !301
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr i8, ptr addrspace(1) %arg0130, i64 %5
  %7 = load i8, ptr addrspace(1) %6, align 1, !invariant.load !303
  %8 = zext nneg i16 %3 to i64
  %9 = zext nneg i16 %.decomposed to i64
  %10 = getelementptr inbounds [1 x [3 x [20 x [192 x i64]]]], ptr addrspace(1) %arg1132, i64 0, i64 0, i64 0, i64 %8, i64 %9
  %11 = load i64, ptr addrspace(1) %10, align 8, !invariant.load !303
  %12 = load <2 x i64>, ptr addrspace(1) %arg5140, align 128, !invariant.load !303
  %13 = extractelement <2 x i64> %12, i32 0
  %14 = extractelement <2 x i64> %12, i32 1
  %15 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 30720
  %16 = load i64, ptr addrspace(1) %15, align 8, !invariant.load !303
  %17 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 61440
  %18 = load i64, ptr addrspace(1) %17, align 8, !invariant.load !303
  %19 = getelementptr inbounds i8, ptr addrspace(1) %arg5140, i64 16
  %20 = load i64, ptr addrspace(1) %19, align 16, !invariant.load !303
  %21 = tail call i64 @llvm.smax.i64(i64 %11, i64 0)
  %22 = tail call i64 @llvm.umin.i64(i64 %21, i64 19)
  %23 = tail call i64 @llvm.smax.i64(i64 %16, i64 0)
  %24 = tail call i64 @llvm.umin.i64(i64 %23, i64 191)
  %25 = icmp sgt i64 %18, 0
  br i1 %25, label %in_bounds-true, label %in_bounds-after

in_bounds-after:                                  ; preds = %entry, %__nv_exp.exit
  %pad_result_addr.0 = phi double [ %add.3841.7, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %26 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2134, i64 0, i64 %24, i64 %22
  %27 = load double, ptr addrspace(1) %26, align 8, !invariant.load !303
  %28 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg6142, i64 0, i64 %22
  %29 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg4138, i64 0, i64 %24, i64 %22
  %30 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3136, i64 0, i64 %22
  %subtract.235.1129 = fsub double 0.000000e+00, %27
  %31 = tail call double @llvm.fma.f64(double %subtract.235.1129, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %32 = tail call i32 @llvm.nvvm.d2i.lo(double %31) #12
  %33 = tail call double @llvm.nvvm.add.rn.d(double %31, double 0xC338000000000000) #12
  %34 = tail call double @llvm.fma.f64(double %33, double 0xBFE62E42FEFA39EF, double %subtract.235.1129)
  %35 = tail call double @llvm.fma.f64(double %33, double 0xBC7ABC9E3B39803F, double %34)
  %36 = tail call double @llvm.fma.f64(double %35, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %37 = tail call double @llvm.fma.f64(double %36, double %35, double 0x3EC71DEE62401315)
  %38 = tail call double @llvm.fma.f64(double %37, double %35, double 0x3EFA01997C89EB71)
  %39 = tail call double @llvm.fma.f64(double %38, double %35, double 0x3F2A01A014761F65)
  %40 = tail call double @llvm.fma.f64(double %39, double %35, double 0x3F56C16C1852B7AF)
  %41 = tail call double @llvm.fma.f64(double %40, double %35, double 0x3F81111111122322)
  %42 = tail call double @llvm.fma.f64(double %41, double %35, double 0x3FA55555555502A1)
  %43 = tail call double @llvm.fma.f64(double %42, double %35, double 0x3FC5555555555511)
  %44 = tail call double @llvm.fma.f64(double %43, double %35, double 0x3FE000000000000B)
  %45 = tail call double @llvm.fma.f64(double %44, double %35, double 1.000000e+00)
  %46 = tail call double @llvm.fma.f64(double %45, double %35, double 1.000000e+00)
  %47 = tail call i32 @llvm.nvvm.d2i.lo(double %46) #12
  %48 = tail call i32 @llvm.nvvm.d2i.hi(double %46) #12
  %49 = shl i32 %32, 20
  %50 = add i32 %48, %49
  %51 = tail call double @llvm.nvvm.lohi.i2d(i32 %47, i32 %50) #12
  %52 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.235.1129) #12
  %53 = bitcast i32 %52 to float
  %54 = tail call float @llvm.nvvm.fabs.f(float %53) #12
  %55 = fcmp olt float %54, 0x4010C46560000000
  br i1 %55, label %__nv_exp.exit95, label %__internal_fast_icmp_abs_lt.exit.i92

__internal_fast_icmp_abs_lt.exit.i92:             ; preds = %in_bounds-after
  %56 = fcmp olt double %subtract.235.1129, 0.000000e+00
  %57 = fadd double %subtract.235.1129, 0x7FF0000000000000
  %z.0.i93 = select i1 %56, double 0.000000e+00, double %57
  %58 = fcmp olt float %54, 0x4010E90000000000
  br i1 %58, label %59, label %__nv_exp.exit95

59:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i92
  %60 = sdiv i32 %32, 2
  %61 = shl i32 %60, 20
  %62 = add i32 %48, %61
  %63 = tail call double @llvm.nvvm.lohi.i2d(i32 %47, i32 %62) #12
  %64 = sub nsw i32 %32, %60
  %65 = shl i32 %64, 20
  %66 = add nsw i32 %65, 1072693248
  %67 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %66) #12
  %68 = fmul double %67, %63
  br label %__nv_exp.exit95

__nv_exp.exit95:                                  ; preds = %in_bounds-after, %__internal_fast_icmp_abs_lt.exit.i92, %59
  %z.2.i94 = phi double [ %51, %in_bounds-after ], [ %68, %59 ], [ %z.0.i93, %__internal_fast_icmp_abs_lt.exit.i92 ]
  %add.3619.i = fadd double %z.2.i94, 0.000000e+00
  %69 = load double, ptr addrspace(1) %28, align 8, !invariant.load !303
  %70 = tail call double @llvm.fma.f64(double %69, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %71 = tail call i32 @llvm.nvvm.d2i.lo(double %70) #12
  %72 = tail call double @llvm.nvvm.add.rn.d(double %70, double 0xC338000000000000) #12
  %73 = tail call double @llvm.fma.f64(double %72, double 0xBFE62E42FEFA39EF, double %69)
  %74 = tail call double @llvm.fma.f64(double %72, double 0xBC7ABC9E3B39803F, double %73)
  %75 = tail call double @llvm.fma.f64(double %74, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %76 = tail call double @llvm.fma.f64(double %75, double %74, double 0x3EC71DEE62401315)
  %77 = tail call double @llvm.fma.f64(double %76, double %74, double 0x3EFA01997C89EB71)
  %78 = tail call double @llvm.fma.f64(double %77, double %74, double 0x3F2A01A014761F65)
  %79 = tail call double @llvm.fma.f64(double %78, double %74, double 0x3F56C16C1852B7AF)
  %80 = tail call double @llvm.fma.f64(double %79, double %74, double 0x3F81111111122322)
  %81 = tail call double @llvm.fma.f64(double %80, double %74, double 0x3FA55555555502A1)
  %82 = tail call double @llvm.fma.f64(double %81, double %74, double 0x3FC5555555555511)
  %83 = tail call double @llvm.fma.f64(double %82, double %74, double 0x3FE000000000000B)
  %84 = tail call double @llvm.fma.f64(double %83, double %74, double 1.000000e+00)
  %85 = tail call double @llvm.fma.f64(double %84, double %74, double 1.000000e+00)
  %86 = tail call i32 @llvm.nvvm.d2i.lo(double %85) #12
  %87 = tail call i32 @llvm.nvvm.d2i.hi(double %85) #12
  %88 = shl i32 %71, 20
  %89 = add i32 %87, %88
  %90 = tail call double @llvm.nvvm.lohi.i2d(i32 %86, i32 %89) #12
  %91 = tail call i32 @llvm.nvvm.d2i.hi(double %69) #12
  %92 = bitcast i32 %91 to float
  %93 = tail call float @llvm.nvvm.fabs.f(float %92) #12
  %94 = fcmp olt float %93, 0x4010C46560000000
  br i1 %94, label %in_bounds-after25.1, label %__internal_fast_icmp_abs_lt.exit.i88.1

__internal_fast_icmp_abs_lt.exit.i88.1:           ; preds = %__nv_exp.exit95
  %95 = fcmp olt double %69, 0.000000e+00
  %96 = fadd double %69, 0x7FF0000000000000
  %z.0.i89.1 = select i1 %95, double 0.000000e+00, double %96
  %97 = fcmp olt float %93, 0x4010E90000000000
  br i1 %97, label %98, label %in_bounds-after25.1

98:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i88.1
  %99 = sdiv i32 %71, 2
  %100 = shl i32 %99, 20
  %101 = add i32 %87, %100
  %102 = tail call double @llvm.nvvm.lohi.i2d(i32 %86, i32 %101) #12
  %103 = sub nsw i32 %71, %99
  %104 = shl i32 %103, 20
  %105 = add nsw i32 %104, 1072693248
  %106 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %105) #12
  %107 = fmul double %106, %102
  br label %in_bounds-after25.1

in_bounds-after25.1:                              ; preds = %__nv_exp.exit95, %__internal_fast_icmp_abs_lt.exit.i88.1, %98
  %z.2.i90.1 = phi double [ %90, %__nv_exp.exit95 ], [ %107, %98 ], [ %z.0.i89.1, %__internal_fast_icmp_abs_lt.exit.i88.1 ]
  %108 = load double, ptr addrspace(1) %29, align 8, !invariant.load !303
  %multiply.2928.926.1 = fmul double %z.2.i90.1, %108
  %109 = load double, ptr addrspace(1) %30, align 8, !invariant.load !303
  %add.3841.727.1 = fadd double %multiply.2928.926.1, %109
  %subtract.235.1129.1 = fsub double %add.3841.727.1, %27
  %110 = tail call double @llvm.fma.f64(double %subtract.235.1129.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %111 = tail call i32 @llvm.nvvm.d2i.lo(double %110) #12
  %112 = tail call double @llvm.nvvm.add.rn.d(double %110, double 0xC338000000000000) #12
  %113 = tail call double @llvm.fma.f64(double %112, double 0xBFE62E42FEFA39EF, double %subtract.235.1129.1)
  %114 = tail call double @llvm.fma.f64(double %112, double 0xBC7ABC9E3B39803F, double %113)
  %115 = tail call double @llvm.fma.f64(double %114, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %116 = tail call double @llvm.fma.f64(double %115, double %114, double 0x3EC71DEE62401315)
  %117 = tail call double @llvm.fma.f64(double %116, double %114, double 0x3EFA01997C89EB71)
  %118 = tail call double @llvm.fma.f64(double %117, double %114, double 0x3F2A01A014761F65)
  %119 = tail call double @llvm.fma.f64(double %118, double %114, double 0x3F56C16C1852B7AF)
  %120 = tail call double @llvm.fma.f64(double %119, double %114, double 0x3F81111111122322)
  %121 = tail call double @llvm.fma.f64(double %120, double %114, double 0x3FA55555555502A1)
  %122 = tail call double @llvm.fma.f64(double %121, double %114, double 0x3FC5555555555511)
  %123 = tail call double @llvm.fma.f64(double %122, double %114, double 0x3FE000000000000B)
  %124 = tail call double @llvm.fma.f64(double %123, double %114, double 1.000000e+00)
  %125 = tail call double @llvm.fma.f64(double %124, double %114, double 1.000000e+00)
  %126 = tail call i32 @llvm.nvvm.d2i.lo(double %125) #12
  %127 = tail call i32 @llvm.nvvm.d2i.hi(double %125) #12
  %128 = shl i32 %111, 20
  %129 = add i32 %127, %128
  %130 = tail call double @llvm.nvvm.lohi.i2d(i32 %126, i32 %129) #12
  %131 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.235.1129.1) #12
  %132 = bitcast i32 %131 to float
  %133 = tail call float @llvm.nvvm.fabs.f(float %132) #12
  %134 = fcmp olt float %133, 0x4010C46560000000
  br i1 %134, label %__nv_exp.exit95.1, label %__internal_fast_icmp_abs_lt.exit.i92.1

__internal_fast_icmp_abs_lt.exit.i92.1:           ; preds = %in_bounds-after25.1
  %135 = fcmp olt double %subtract.235.1129.1, 0.000000e+00
  %136 = fadd double %subtract.235.1129.1, 0x7FF0000000000000
  %z.0.i93.1 = select i1 %135, double 0.000000e+00, double %136
  %137 = fcmp olt float %133, 0x4010E90000000000
  br i1 %137, label %138, label %__nv_exp.exit95.1

138:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i92.1
  %139 = sdiv i32 %111, 2
  %140 = shl i32 %139, 20
  %141 = add i32 %127, %140
  %142 = tail call double @llvm.nvvm.lohi.i2d(i32 %126, i32 %141) #12
  %143 = sub nsw i32 %111, %139
  %144 = shl i32 %143, 20
  %145 = add nsw i32 %144, 1072693248
  %146 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %145) #12
  %147 = fmul double %146, %142
  br label %__nv_exp.exit95.1

__nv_exp.exit95.1:                                ; preds = %138, %__internal_fast_icmp_abs_lt.exit.i92.1, %in_bounds-after25.1
  %z.2.i94.1 = phi double [ %130, %in_bounds-after25.1 ], [ %147, %138 ], [ %z.0.i93.1, %__internal_fast_icmp_abs_lt.exit.i92.1 ]
  %add.3619.i.1 = fadd double %add.3619.i, %z.2.i94.1
  %148 = tail call i32 @llvm.nvvm.d2i.hi(double %add.3619.i.1) #12
  %149 = tail call i32 @llvm.nvvm.d2i.lo(double %add.3619.i.1) #12
  %150 = icmp slt i32 %148, 1048576
  %151 = fmul double %add.3619.i.1, 0x4350000000000000
  %152 = tail call i32 @llvm.nvvm.d2i.lo(double %151) #12
  %153 = tail call i32 @llvm.nvvm.d2i.hi(double %151) #12
  br i1 %150, label %154, label %155

154:                                              ; preds = %__nv_exp.exit95.1
  br label %155

155:                                              ; preds = %154, %__nv_exp.exit95.1
  %.0.i = phi double [ %151, %154 ], [ %add.3619.i.1, %__nv_exp.exit95.1 ]
  %ihi.0.i = phi i32 [ %153, %154 ], [ %148, %__nv_exp.exit95.1 ]
  %ilo.0.i = phi i32 [ %152, %154 ], [ %149, %__nv_exp.exit95.1 ]
  %e.0.i = phi i32 [ -1077, %154 ], [ -1023, %__nv_exp.exit95.1 ]
  %156 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %156, 2146435071
  br i1 %or.cond.i, label %157, label %204

157:                                              ; preds = %155
  %158 = lshr i32 %ihi.0.i, 20
  %159 = add nsw i32 %e.0.i, %158
  %160 = and i32 %ihi.0.i, 1048575
  %161 = or disjoint i32 %160, 1072693248
  %162 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %161) #12
  %163 = icmp ugt i32 %161, 1073127582
  %164 = tail call i32 @llvm.nvvm.d2i.lo(double %162) #12
  %165 = tail call i32 @llvm.nvvm.d2i.hi(double %162) #12
  %166 = add i32 %165, -1048576
  %167 = tail call double @llvm.nvvm.lohi.i2d(i32 %164, i32 %166) #12
  %spec.select = select i1 %163, double %167, double %162
  %168 = zext i1 %163 to i32
  %spec.select116 = add nsw i32 %159, %168
  %169 = fadd double %spec.select, -1.000000e+00
  %170 = fadd double %spec.select, 1.000000e+00
  %171 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %170) #12
  %172 = fneg double %170
  %173 = tail call double @llvm.fma.f64(double %172, double %171, double 1.000000e+00)
  %174 = tail call double @llvm.fma.f64(double %173, double %173, double %173)
  %175 = tail call double @llvm.fma.f64(double %174, double %171, double %171)
  %176 = fmul double %169, %175
  %177 = fadd double %176, %176
  %178 = fmul double %177, %177
  %179 = tail call double @llvm.fma.f64(double %178, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %180 = tail call double @llvm.fma.f64(double %179, double %178, double 0x3EF3B2669F02676F)
  %181 = tail call double @llvm.fma.f64(double %180, double %178, double 0x3F1745CBA9AB0956)
  %182 = tail call double @llvm.fma.f64(double %181, double %178, double 0x3F3C71C72D1B5154)
  %183 = tail call double @llvm.fma.f64(double %182, double %178, double 0x3F624924923BE72D)
  %184 = tail call double @llvm.fma.f64(double %183, double %178, double 0x3F8999999999A3C4)
  %185 = tail call double @llvm.fma.f64(double %184, double %178, double 0x3FB5555555555554)
  %186 = fsub double %169, %177
  %187 = fmul double %186, 2.000000e+00
  %188 = fneg double %177
  %189 = tail call double @llvm.fma.f64(double %188, double %169, double %187)
  %190 = fmul double %175, %189
  %191 = fmul double %178, %185
  %192 = tail call double @llvm.fma.f64(double %191, double %177, double %190)
  %193 = xor i32 %spec.select116, -2147483648
  %194 = tail call double @llvm.nvvm.lohi.i2d(i32 %193, i32 1127219200) #12
  %195 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %196 = fsub double %194, %195
  %197 = tail call double @llvm.fma.f64(double %196, double 0x3FE62E42FEFA39EF, double %177)
  %198 = fneg double %196
  %199 = tail call double @llvm.fma.f64(double %198, double 0x3FE62E42FEFA39EF, double %197)
  %200 = fsub double %199, %177
  %201 = fsub double %192, %200
  %202 = tail call double @llvm.fma.f64(double %196, double 0x3C7ABC9E3B39803F, double %201)
  %203 = fadd double %197, %202
  br label %__nv_log.exit

204:                                              ; preds = %155
  %205 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %206 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %207 = and i32 %206, 2147483647
  %208 = icmp eq i32 %207, 0
  %q.0.i = select i1 %208, double 0xFFF0000000000000, double %205
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %157, %204
  %q.1.i = phi double [ %203, %157 ], [ %q.0.i, %204 ]
  %209 = urem i16 %.lhs.trunc, 20
  %210 = udiv i16 %.lhs.trunc, 20
  %211 = zext nneg i16 %209 to i64
  %212 = zext nneg i16 %210 to i64
  %213 = getelementptr [20 x [192 x [2 x double]]], ptr addrspace(1) %arg7144, i64 0, i64 %211, i64 %212, i64 0
  %214 = load <2 x double>, ptr addrspace(1) %213, align 16, !invariant.load !303
  %215 = extractelement <2 x double> %214, i32 0
  %216 = extractelement <2 x double> %214, i32 1
  %217 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2134, i64 0, i64 %212, i64 %211
  %218 = load double, ptr addrspace(1) %217, align 8, !invariant.load !303
  %219 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg6142, i64 0, i64 %211
  %220 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg4138, i64 0, i64 %212, i64 %211
  %221 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3136, i64 0, i64 %211
  %subtract.235.1164 = fsub double 0.000000e+00, %218
  %222 = tail call double @llvm.fma.f64(double %subtract.235.1164, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %223 = tail call i32 @llvm.nvvm.d2i.lo(double %222) #12
  %224 = tail call double @llvm.nvvm.add.rn.d(double %222, double 0xC338000000000000) #12
  %225 = tail call double @llvm.fma.f64(double %224, double 0xBFE62E42FEFA39EF, double %subtract.235.1164)
  %226 = tail call double @llvm.fma.f64(double %224, double 0xBC7ABC9E3B39803F, double %225)
  %227 = tail call double @llvm.fma.f64(double %226, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %228 = tail call double @llvm.fma.f64(double %227, double %226, double 0x3EC71DEE62401315)
  %229 = tail call double @llvm.fma.f64(double %228, double %226, double 0x3EFA01997C89EB71)
  %230 = tail call double @llvm.fma.f64(double %229, double %226, double 0x3F2A01A014761F65)
  %231 = tail call double @llvm.fma.f64(double %230, double %226, double 0x3F56C16C1852B7AF)
  %232 = tail call double @llvm.fma.f64(double %231, double %226, double 0x3F81111111122322)
  %233 = tail call double @llvm.fma.f64(double %232, double %226, double 0x3FA55555555502A1)
  %234 = tail call double @llvm.fma.f64(double %233, double %226, double 0x3FC5555555555511)
  %235 = tail call double @llvm.fma.f64(double %234, double %226, double 0x3FE000000000000B)
  %236 = tail call double @llvm.fma.f64(double %235, double %226, double 1.000000e+00)
  %237 = tail call double @llvm.fma.f64(double %236, double %226, double 1.000000e+00)
  %238 = tail call i32 @llvm.nvvm.d2i.lo(double %237) #12
  %239 = tail call i32 @llvm.nvvm.d2i.hi(double %237) #12
  %240 = shl i32 %223, 20
  %241 = add i32 %239, %240
  %242 = tail call double @llvm.nvvm.lohi.i2d(i32 %238, i32 %241) #12
  %243 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.235.1164) #12
  %244 = bitcast i32 %243 to float
  %245 = tail call float @llvm.nvvm.fabs.f(float %244) #12
  %246 = fcmp olt float %245, 0x4010C46560000000
  br i1 %246, label %in_bounds-true58.1, label %__internal_fast_icmp_abs_lt.exit.i100

__internal_fast_icmp_abs_lt.exit.i100:            ; preds = %__nv_log.exit
  %247 = fcmp olt double %subtract.235.1164, 0.000000e+00
  %248 = fadd double %subtract.235.1164, 0x7FF0000000000000
  %z.0.i101 = select i1 %247, double 0.000000e+00, double %248
  %249 = fcmp olt float %245, 0x4010E90000000000
  br i1 %249, label %250, label %in_bounds-true58.1

250:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i100
  %251 = sdiv i32 %223, 2
  %252 = shl i32 %251, 20
  %253 = add i32 %239, %252
  %254 = tail call double @llvm.nvvm.lohi.i2d(i32 %238, i32 %253) #12
  %255 = sub nsw i32 %223, %251
  %256 = shl i32 %255, 20
  %257 = add nsw i32 %256, 1072693248
  %258 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %257) #12
  %259 = fmul double %258, %254
  br label %in_bounds-true58.1

in_bounds-true58.1:                               ; preds = %250, %__internal_fast_icmp_abs_lt.exit.i100, %__nv_log.exit
  %z.2.i102 = phi double [ %242, %__nv_log.exit ], [ %259, %250 ], [ %z.0.i101, %__internal_fast_icmp_abs_lt.exit.i100 ]
  %260 = load double, ptr addrspace(1) %219, align 8, !invariant.load !303
  %261 = tail call double @llvm.fma.f64(double %260, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %262 = tail call i32 @llvm.nvvm.d2i.lo(double %261) #12
  %263 = tail call double @llvm.nvvm.add.rn.d(double %261, double 0xC338000000000000) #12
  %264 = tail call double @llvm.fma.f64(double %263, double 0xBFE62E42FEFA39EF, double %260)
  %265 = tail call double @llvm.fma.f64(double %263, double 0xBC7ABC9E3B39803F, double %264)
  %266 = tail call double @llvm.fma.f64(double %265, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %267 = tail call double @llvm.fma.f64(double %266, double %265, double 0x3EC71DEE62401315)
  %268 = tail call double @llvm.fma.f64(double %267, double %265, double 0x3EFA01997C89EB71)
  %269 = tail call double @llvm.fma.f64(double %268, double %265, double 0x3F2A01A014761F65)
  %270 = tail call double @llvm.fma.f64(double %269, double %265, double 0x3F56C16C1852B7AF)
  %271 = tail call double @llvm.fma.f64(double %270, double %265, double 0x3F81111111122322)
  %272 = tail call double @llvm.fma.f64(double %271, double %265, double 0x3FA55555555502A1)
  %273 = tail call double @llvm.fma.f64(double %272, double %265, double 0x3FC5555555555511)
  %274 = tail call double @llvm.fma.f64(double %273, double %265, double 0x3FE000000000000B)
  %275 = tail call double @llvm.fma.f64(double %274, double %265, double 1.000000e+00)
  %276 = tail call double @llvm.fma.f64(double %275, double %265, double 1.000000e+00)
  %277 = tail call i32 @llvm.nvvm.d2i.lo(double %276) #12
  %278 = tail call i32 @llvm.nvvm.d2i.hi(double %276) #12
  %279 = shl i32 %262, 20
  %280 = add i32 %278, %279
  %281 = tail call double @llvm.nvvm.lohi.i2d(i32 %277, i32 %280) #12
  %282 = tail call i32 @llvm.nvvm.d2i.hi(double %260) #12
  %283 = bitcast i32 %282 to float
  %284 = tail call float @llvm.nvvm.fabs.f(float %283) #12
  %285 = fcmp olt float %284, 0x4010C46560000000
  br i1 %285, label %in_bounds-after60.1, label %__internal_fast_icmp_abs_lt.exit.i96.1

__internal_fast_icmp_abs_lt.exit.i96.1:           ; preds = %in_bounds-true58.1
  %286 = fcmp olt double %260, 0.000000e+00
  %287 = fadd double %260, 0x7FF0000000000000
  %z.0.i97.1 = select i1 %286, double 0.000000e+00, double %287
  %288 = fcmp olt float %284, 0x4010E90000000000
  br i1 %288, label %289, label %in_bounds-after60.1

289:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i96.1
  %290 = sdiv i32 %262, 2
  %291 = shl i32 %290, 20
  %292 = add i32 %278, %291
  %293 = tail call double @llvm.nvvm.lohi.i2d(i32 %277, i32 %292) #12
  %294 = sub nsw i32 %262, %290
  %295 = shl i32 %294, 20
  %296 = add nsw i32 %295, 1072693248
  %297 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %296) #12
  %298 = fmul double %297, %293
  br label %in_bounds-after60.1

in_bounds-after60.1:                              ; preds = %in_bounds-true58.1, %__internal_fast_icmp_abs_lt.exit.i96.1, %289
  %z.2.i98.1 = phi double [ %281, %in_bounds-true58.1 ], [ %298, %289 ], [ %z.0.i97.1, %__internal_fast_icmp_abs_lt.exit.i96.1 ]
  %299 = load double, ptr addrspace(1) %220, align 8, !invariant.load !303
  %multiply.2928.961.1 = fmul double %z.2.i98.1, %299
  %300 = load double, ptr addrspace(1) %221, align 8, !invariant.load !303
  %add.3841.762.1 = fadd double %multiply.2928.961.1, %300
  %subtract.235.1164.1 = fsub double %add.3841.762.1, %218
  %301 = tail call double @llvm.fma.f64(double %subtract.235.1164.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %302 = tail call i32 @llvm.nvvm.d2i.lo(double %301) #12
  %303 = tail call double @llvm.nvvm.add.rn.d(double %301, double 0xC338000000000000) #12
  %304 = tail call double @llvm.fma.f64(double %303, double 0xBFE62E42FEFA39EF, double %subtract.235.1164.1)
  %305 = tail call double @llvm.fma.f64(double %303, double 0xBC7ABC9E3B39803F, double %304)
  %306 = tail call double @llvm.fma.f64(double %305, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %307 = tail call double @llvm.fma.f64(double %306, double %305, double 0x3EC71DEE62401315)
  %308 = tail call double @llvm.fma.f64(double %307, double %305, double 0x3EFA01997C89EB71)
  %309 = tail call double @llvm.fma.f64(double %308, double %305, double 0x3F2A01A014761F65)
  %310 = tail call double @llvm.fma.f64(double %309, double %305, double 0x3F56C16C1852B7AF)
  %311 = tail call double @llvm.fma.f64(double %310, double %305, double 0x3F81111111122322)
  %312 = tail call double @llvm.fma.f64(double %311, double %305, double 0x3FA55555555502A1)
  %313 = tail call double @llvm.fma.f64(double %312, double %305, double 0x3FC5555555555511)
  %314 = tail call double @llvm.fma.f64(double %313, double %305, double 0x3FE000000000000B)
  %315 = tail call double @llvm.fma.f64(double %314, double %305, double 1.000000e+00)
  %316 = tail call double @llvm.fma.f64(double %315, double %305, double 1.000000e+00)
  %317 = tail call i32 @llvm.nvvm.d2i.lo(double %316) #12
  %318 = tail call i32 @llvm.nvvm.d2i.hi(double %316) #12
  %319 = shl i32 %302, 20
  %320 = add i32 %318, %319
  %321 = tail call double @llvm.nvvm.lohi.i2d(i32 %317, i32 %320) #12
  %322 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.235.1164.1) #12
  %323 = bitcast i32 %322 to float
  %324 = tail call float @llvm.nvvm.fabs.f(float %323) #12
  %325 = fcmp olt float %324, 0x4010C46560000000
  br i1 %325, label %__nv_exp.exit103.1, label %__internal_fast_icmp_abs_lt.exit.i100.1

__internal_fast_icmp_abs_lt.exit.i100.1:          ; preds = %in_bounds-after60.1
  %326 = fcmp olt double %subtract.235.1164.1, 0.000000e+00
  %327 = fadd double %subtract.235.1164.1, 0x7FF0000000000000
  %z.0.i101.1 = select i1 %326, double 0.000000e+00, double %327
  %328 = fcmp olt float %324, 0x4010E90000000000
  br i1 %328, label %329, label %__nv_exp.exit103.1

329:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i100.1
  %330 = sdiv i32 %302, 2
  %331 = shl i32 %330, 20
  %332 = add i32 %318, %331
  %333 = tail call double @llvm.nvvm.lohi.i2d(i32 %317, i32 %332) #12
  %334 = sub nsw i32 %302, %330
  %335 = shl i32 %334, 20
  %336 = add nsw i32 %335, 1072693248
  %337 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %336) #12
  %338 = fmul double %337, %333
  br label %__nv_exp.exit103.1

__nv_exp.exit103.1:                               ; preds = %329, %__internal_fast_icmp_abs_lt.exit.i100.1, %in_bounds-after60.1
  %z.2.i102.1 = phi double [ %321, %in_bounds-after60.1 ], [ %338, %329 ], [ %z.0.i101.1, %__internal_fast_icmp_abs_lt.exit.i100.1 ]
  %339 = fcmp olt float %284, 0x4010C46560000000
  br i1 %339, label %__nv_exp.exit107, label %__internal_fast_icmp_abs_lt.exit.i104

__internal_fast_icmp_abs_lt.exit.i104:            ; preds = %__nv_exp.exit103.1
  %340 = fcmp olt double %260, 0.000000e+00
  %341 = fadd double %260, 0x7FF0000000000000
  %z.0.i105 = select i1 %340, double 0.000000e+00, double %341
  %342 = fcmp olt float %284, 0x4010E90000000000
  br i1 %342, label %343, label %__nv_exp.exit107

343:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i104
  %344 = sdiv i32 %262, 2
  %345 = shl i32 %344, 20
  %346 = add i32 %278, %345
  %347 = tail call double @llvm.nvvm.lohi.i2d(i32 %277, i32 %346) #12
  %348 = sub nsw i32 %262, %344
  %349 = shl i32 %348, 20
  %350 = add nsw i32 %349, 1072693248
  %351 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %350) #12
  %352 = fmul double %351, %347
  br label %__nv_exp.exit107

__nv_exp.exit107:                                 ; preds = %__nv_exp.exit103.1, %__internal_fast_icmp_abs_lt.exit.i104, %343
  %z.2.i106 = phi double [ %281, %__nv_exp.exit103.1 ], [ %352, %343 ], [ %z.0.i105, %__internal_fast_icmp_abs_lt.exit.i104 ]
  %multiply.2928.978 = fmul double %z.2.i106, %299
  %add.3841.779 = fadd double %multiply.2928.978, %300
  %subtract.235.1181 = fsub double %add.3841.779, %218
  %353 = tail call double @llvm.fma.f64(double %subtract.235.1181, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %354 = tail call i32 @llvm.nvvm.d2i.lo(double %353) #12
  %355 = tail call double @llvm.nvvm.add.rn.d(double %353, double 0xC338000000000000) #12
  %356 = tail call double @llvm.fma.f64(double %355, double 0xBFE62E42FEFA39EF, double %subtract.235.1181)
  %357 = tail call double @llvm.fma.f64(double %355, double 0xBC7ABC9E3B39803F, double %356)
  %358 = tail call double @llvm.fma.f64(double %357, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %359 = tail call double @llvm.fma.f64(double %358, double %357, double 0x3EC71DEE62401315)
  %360 = tail call double @llvm.fma.f64(double %359, double %357, double 0x3EFA01997C89EB71)
  %361 = tail call double @llvm.fma.f64(double %360, double %357, double 0x3F2A01A014761F65)
  %362 = tail call double @llvm.fma.f64(double %361, double %357, double 0x3F56C16C1852B7AF)
  %363 = tail call double @llvm.fma.f64(double %362, double %357, double 0x3F81111111122322)
  %364 = tail call double @llvm.fma.f64(double %363, double %357, double 0x3FA55555555502A1)
  %365 = tail call double @llvm.fma.f64(double %364, double %357, double 0x3FC5555555555511)
  %366 = tail call double @llvm.fma.f64(double %365, double %357, double 0x3FE000000000000B)
  %367 = tail call double @llvm.fma.f64(double %366, double %357, double 1.000000e+00)
  %368 = tail call double @llvm.fma.f64(double %367, double %357, double 1.000000e+00)
  %369 = tail call i32 @llvm.nvvm.d2i.lo(double %368) #12
  %370 = tail call i32 @llvm.nvvm.d2i.hi(double %368) #12
  %371 = shl i32 %354, 20
  %372 = add i32 %370, %371
  %373 = tail call double @llvm.nvvm.lohi.i2d(i32 %369, i32 %372) #12
  %374 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.235.1181) #12
  %375 = bitcast i32 %374 to float
  %376 = tail call float @llvm.nvvm.fabs.f(float %375) #12
  %377 = fcmp olt float %376, 0x4010C46560000000
  br i1 %377, label %__nv_exp.exit111, label %__internal_fast_icmp_abs_lt.exit.i108

__internal_fast_icmp_abs_lt.exit.i108:            ; preds = %__nv_exp.exit107
  %378 = fcmp olt double %subtract.235.1181, 0.000000e+00
  %379 = fadd double %subtract.235.1181, 0x7FF0000000000000
  %z.0.i109 = select i1 %378, double 0.000000e+00, double %379
  %380 = fcmp olt float %376, 0x4010E90000000000
  br i1 %380, label %381, label %__nv_exp.exit111

381:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i108
  %382 = sdiv i32 %354, 2
  %383 = shl i32 %382, 20
  %384 = add i32 %370, %383
  %385 = tail call double @llvm.nvvm.lohi.i2d(i32 %369, i32 %384) #12
  %386 = sub nsw i32 %354, %382
  %387 = shl i32 %386, 20
  %388 = add nsw i32 %387, 1072693248
  %389 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %388) #12
  %390 = fmul double %389, %385
  br label %__nv_exp.exit111

__nv_exp.exit111:                                 ; preds = %__nv_exp.exit107, %__internal_fast_icmp_abs_lt.exit.i108, %381
  %z.2.i110 = phi double [ %373, %__nv_exp.exit107 ], [ %390, %381 ], [ %z.0.i109, %__internal_fast_icmp_abs_lt.exit.i108 ]
  %add.3619.i112 = fadd double %215, 0.000000e+00
  %add.3619.i112.1 = fadd double %add.3619.i112, %216
  %add.3619.i113 = fadd double %z.2.i102, 0.000000e+00
  %add.3619.i113.1 = fadd double %add.3619.i113, %z.2.i102.1
  %391 = icmp sgt i64 %18, -1
  %392 = icmp sle i64 %18, %20
  %393 = and i1 %391, %392
  %394 = icmp sgt i64 %11, -1
  %395 = icmp sle i64 %11, %13
  %396 = and i1 %394, %395
  %397 = icmp sgt i64 %16, -1
  %398 = icmp sle i64 %16, %14
  %399 = and i1 %397, %398
  %400 = select i1 %393, i1 %399, i1 false
  %401 = select i1 %400, i1 %396, i1 false
  %402 = fneg double %add.3619.i112.1
  %divide.594.3.clone.1 = fdiv double %402, %add.3619.i113.1
  %403 = trunc i8 %7 to i1
  %subtract.235.11 = fsub double %pad_result_addr.0, %27
  %subtract.236.7 = fsub double %subtract.235.11, %q.1.i
  %404 = select i1 %401, double %subtract.236.7, double 0x7FF8000000000000
  %405 = select i1 %403, double %404, double 0.000000e+00
  %multiply.2930.1.clone.1 = fmul double %divide.594.3.clone.1, %z.2.i110
  %add.3842.1.clone.1 = fadd double %216, %multiply.2930.1.clone.1
  %406 = getelementptr double, ptr addrspace(1) %arg8146, i64 %5
  store double %405, ptr addrspace(1) %406, align 8
  %407 = getelementptr double, ptr addrspace(1) %arg9148, i64 %5
  store double %add.3842.1.clone.1, ptr addrspace(1) %407, align 8
  ret void

in_bounds-true:                                   ; preds = %entry
  %408 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg6142, i64 0, i64 %22
  %409 = load double, ptr addrspace(1) %408, align 8, !invariant.load !303
  %410 = tail call double @llvm.fma.f64(double %409, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %411 = tail call i32 @llvm.nvvm.d2i.lo(double %410) #12
  %412 = tail call double @llvm.nvvm.add.rn.d(double %410, double 0xC338000000000000) #12
  %413 = tail call double @llvm.fma.f64(double %412, double 0xBFE62E42FEFA39EF, double %409)
  %414 = tail call double @llvm.fma.f64(double %412, double 0xBC7ABC9E3B39803F, double %413)
  %415 = tail call double @llvm.fma.f64(double %414, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %416 = tail call double @llvm.fma.f64(double %415, double %414, double 0x3EC71DEE62401315)
  %417 = tail call double @llvm.fma.f64(double %416, double %414, double 0x3EFA01997C89EB71)
  %418 = tail call double @llvm.fma.f64(double %417, double %414, double 0x3F2A01A014761F65)
  %419 = tail call double @llvm.fma.f64(double %418, double %414, double 0x3F56C16C1852B7AF)
  %420 = tail call double @llvm.fma.f64(double %419, double %414, double 0x3F81111111122322)
  %421 = tail call double @llvm.fma.f64(double %420, double %414, double 0x3FA55555555502A1)
  %422 = tail call double @llvm.fma.f64(double %421, double %414, double 0x3FC5555555555511)
  %423 = tail call double @llvm.fma.f64(double %422, double %414, double 0x3FE000000000000B)
  %424 = tail call double @llvm.fma.f64(double %423, double %414, double 1.000000e+00)
  %425 = tail call double @llvm.fma.f64(double %424, double %414, double 1.000000e+00)
  %426 = tail call i32 @llvm.nvvm.d2i.lo(double %425) #12
  %427 = tail call i32 @llvm.nvvm.d2i.hi(double %425) #12
  %428 = shl i32 %411, 20
  %429 = add i32 %427, %428
  %430 = tail call double @llvm.nvvm.lohi.i2d(i32 %426, i32 %429) #12
  %431 = tail call i32 @llvm.nvvm.d2i.hi(double %409) #12
  %432 = bitcast i32 %431 to float
  %433 = tail call float @llvm.nvvm.fabs.f(float %432) #12
  %434 = fcmp olt float %433, 0x4010C46560000000
  br i1 %434, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %in_bounds-true
  %435 = fcmp olt double %409, 0.000000e+00
  %436 = fadd double %409, 0x7FF0000000000000
  %z.0.i = select i1 %435, double 0.000000e+00, double %436
  %437 = fcmp olt float %433, 0x4010E90000000000
  br i1 %437, label %438, label %__nv_exp.exit

438:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %439 = sdiv i32 %411, 2
  %440 = shl i32 %439, 20
  %441 = add i32 %427, %440
  %442 = tail call double @llvm.nvvm.lohi.i2d(i32 %426, i32 %441) #12
  %443 = sub nsw i32 %411, %439
  %444 = shl i32 %443, 20
  %445 = add nsw i32 %444, 1072693248
  %446 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %445) #12
  %447 = fmul double %446, %442
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %in_bounds-true, %__internal_fast_icmp_abs_lt.exit.i, %438
  %z.2.i = phi double [ %430, %in_bounds-true ], [ %447, %438 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %448 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg4138, i64 0, i64 %24, i64 %22
  %449 = load double, ptr addrspace(1) %448, align 8, !invariant.load !303
  %multiply.2928.9 = fmul double %z.2.i, %449
  %450 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3136, i64 0, i64 %22
  %451 = load double, ptr addrspace(1) %450, align 8, !invariant.load !303
  %add.3841.7 = fadd double %multiply.2928.9, %451
  br label %in_bounds-after
}

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg8) local_unnamed_addr #2 {
entry:
  %arg863 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg761 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg659 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg557 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg455 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg353 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg251 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg149 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg047 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext i32 %thread.id.2 to i64
  %param_6.1308 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg659, i64 0, i64 %1
  %2 = add nuw nsw i32 %0, -32
  %3 = shl nuw nsw i64 %1, 3
  %4 = zext nneg i32 %thread.id.x to i64
  %5 = lshr i64 %4, 5
  %6 = mul nuw nsw i64 %5, 160
  %scevgep = getelementptr i8, ptr addrspace(1) %arg149, i64 %6
  %scevgep68 = getelementptr i8, ptr addrspace(1) %arg047, i64 %6
  %7 = mul nuw nsw i64 %5, 80
  %8 = shl nuw nsw i64 %1, 2
  %9 = add i64 %7, %8
  %scevgep72 = getelementptr i8, ptr addrspace(1) %arg557, i64 %9
  %scevgep75 = getelementptr i8, ptr addrspace(1) %arg455, i64 %9
  %scevgep78 = getelementptr i8, ptr addrspace(1) %arg353, i64 %6
  %scevgep82 = getelementptr i8, ptr addrspace(1) %arg251, i64 %6
  %scevgep86 = getelementptr i8, ptr addrspace(1) %arg863, i64 %6
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv87 = phi ptr addrspace(1) [ %scevgep86, %entry ], [ %scevgep88, %x_in_tile-after ]
  %lsr.iv83 = phi ptr addrspace(1) [ %scevgep82, %entry ], [ %scevgep84, %x_in_tile-after ]
  %lsr.iv79 = phi ptr addrspace(1) [ %scevgep78, %entry ], [ %scevgep80, %x_in_tile-after ]
  %lsr.iv76 = phi ptr addrspace(1) [ %scevgep75, %entry ], [ %scevgep77, %x_in_tile-after ]
  %lsr.iv73 = phi ptr addrspace(1) [ %scevgep72, %entry ], [ %scevgep74, %x_in_tile-after ]
  %lsr.iv69 = phi ptr addrspace(1) [ %scevgep68, %entry ], [ %scevgep70, %x_in_tile-after ]
  %lsr.iv65 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep66, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %2, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.045 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %10 = trunc i64 %1 to i32
  %11 = icmp ult i32 %10, 20
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %__nv_exp.exit35, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.3619.i44, %__nv_exp.exit35 ], [ %partial_reduction_result.045, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep66 = getelementptr i8, ptr addrspace(1) %lsr.iv65, i64 5120
  %scevgep70 = getelementptr i8, ptr addrspace(1) %lsr.iv69, i64 5120
  %scevgep74 = getelementptr i8, ptr addrspace(1) %lsr.iv73, i64 2560
  %scevgep77 = getelementptr i8, ptr addrspace(1) %lsr.iv76, i64 2560
  %scevgep80 = getelementptr i8, ptr addrspace(1) %lsr.iv79, i64 5120
  %scevgep84 = getelementptr i8, ptr addrspace(1) %lsr.iv83, i64 5120
  %scevgep88 = getelementptr i8, ptr addrspace(1) %lsr.iv87, i64 5120
  %12 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %12, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !318

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %13 = trunc i64 %1 to i32
  %14 = zext nneg i32 %0 to i64
  %15 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache3, i64 0, i64 %1, i64 %14
  store double %partial_reduction_result.1, ptr addrspace(3) %15, align 8
  tail call void @llvm.nvvm.barrier0()
  %16 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache3, i64 0, i64 %14, i64 %1
  %partial_reduction_result153031 = load <2 x i32>, ptr addrspace(3) %16, align 8
  %17 = extractelement <2 x i32> %partial_reduction_result153031, i64 0
  %18 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 16, i32 31)
  %19 = insertelement <2 x i32> poison, i32 %18, i64 0
  %20 = extractelement <2 x i32> %partial_reduction_result153031, i64 1
  %21 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 16, i32 31)
  %22 = insertelement <2 x i32> %19, i32 %21, i64 1
  %23 = bitcast <2 x i32> %22 to double
  %24 = bitcast <2 x i32> %partial_reduction_result153031 to double
  %add.3619.i = fadd double %24, %23
  %25 = bitcast double %add.3619.i to <2 x i32>
  %26 = extractelement <2 x i32> %25, i64 0
  %27 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %26, i32 8, i32 31)
  %28 = insertelement <2 x i32> poison, i32 %27, i64 0
  %29 = extractelement <2 x i32> %25, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 8, i32 31)
  %31 = insertelement <2 x i32> %28, i32 %30, i64 1
  %32 = bitcast <2 x i32> %31 to double
  %add.3619.i40 = fadd double %add.3619.i, %32
  %33 = bitcast double %add.3619.i40 to <2 x i32>
  %34 = extractelement <2 x i32> %33, i64 0
  %35 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 4, i32 31)
  %36 = insertelement <2 x i32> poison, i32 %35, i64 0
  %37 = extractelement <2 x i32> %33, i64 1
  %38 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 4, i32 31)
  %39 = insertelement <2 x i32> %36, i32 %38, i64 1
  %40 = bitcast <2 x i32> %39 to double
  %add.3619.i41 = fadd double %add.3619.i40, %40
  %41 = bitcast double %add.3619.i41 to <2 x i32>
  %42 = extractelement <2 x i32> %41, i64 0
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 2, i32 31)
  %44 = insertelement <2 x i32> poison, i32 %43, i64 0
  %45 = extractelement <2 x i32> %41, i64 1
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 2, i32 31)
  %47 = insertelement <2 x i32> %44, i32 %46, i64 1
  %48 = bitcast <2 x i32> %47 to double
  %add.3619.i42 = fadd double %add.3619.i41, %48
  %49 = bitcast double %add.3619.i42 to <2 x i32>
  %50 = extractelement <2 x i32> %49, i64 0
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 1, i32 31)
  %52 = insertelement <2 x i32> poison, i32 %51, i64 0
  %53 = extractelement <2 x i32> %49, i64 1
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 1, i32 31)
  %55 = insertelement <2 x i32> %52, i32 %54, i64 1
  %56 = bitcast <2 x i32> %55 to double
  %add.3619.i43 = fadd double %add.3619.i42, %56
  store double %add.3619.i43, ptr addrspace(3) %16, align 8
  %57 = icmp ult i32 %thread.id.x, 640
  %58 = icmp eq i32 %13, 0
  %59 = and i1 %57, %58
  %output_element_address = getelementptr inbounds [20 x double], ptr addrspace(1) %arg761, i64 0, i64 %14
  br i1 %59, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %scevgep67 = getelementptr i8, ptr addrspace(1) %lsr.iv65, i64 %3
  %param_1.24232 = load double, ptr addrspace(1) %scevgep67, align 8, !invariant.load !303
  %scevgep71 = getelementptr i8, ptr addrspace(1) %lsr.iv69, i64 %3
  %param_0.17423 = load double, ptr addrspace(1) %scevgep71, align 8, !invariant.load !303
  %multiply.2942.3 = fmul double %param_1.24232, %param_0.17423
  %add.3619.i44 = fadd double %partial_reduction_result.045, %multiply.2942.3
  %param_6.13084 = load double, ptr addrspace(1) %param_6.1308, align 8, !invariant.load !303
  %60 = tail call double @llvm.fma.f64(double %param_6.13084, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %61 = tail call i32 @llvm.nvvm.d2i.lo(double %60) #12
  %62 = tail call double @llvm.nvvm.add.rn.d(double %60, double 0xC338000000000000) #12
  %63 = tail call double @llvm.fma.f64(double %62, double 0xBFE62E42FEFA39EF, double %param_6.13084)
  %64 = tail call double @llvm.fma.f64(double %62, double 0xBC7ABC9E3B39803F, double %63)
  %65 = tail call double @llvm.fma.f64(double %64, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %66 = tail call double @llvm.fma.f64(double %65, double %64, double 0x3EC71DEE62401315)
  %67 = tail call double @llvm.fma.f64(double %66, double %64, double 0x3EFA01997C89EB71)
  %68 = tail call double @llvm.fma.f64(double %67, double %64, double 0x3F2A01A014761F65)
  %69 = tail call double @llvm.fma.f64(double %68, double %64, double 0x3F56C16C1852B7AF)
  %70 = tail call double @llvm.fma.f64(double %69, double %64, double 0x3F81111111122322)
  %71 = tail call double @llvm.fma.f64(double %70, double %64, double 0x3FA55555555502A1)
  %72 = tail call double @llvm.fma.f64(double %71, double %64, double 0x3FC5555555555511)
  %73 = tail call double @llvm.fma.f64(double %72, double %64, double 0x3FE000000000000B)
  %74 = tail call double @llvm.fma.f64(double %73, double %64, double 1.000000e+00)
  %75 = tail call double @llvm.fma.f64(double %74, double %64, double 1.000000e+00)
  %76 = tail call i32 @llvm.nvvm.d2i.lo(double %75) #12
  %77 = tail call i32 @llvm.nvvm.d2i.hi(double %75) #12
  %78 = shl i32 %61, 20
  %79 = add i32 %77, %78
  %80 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 %79) #12
  %81 = tail call i32 @llvm.nvvm.d2i.hi(double %param_6.13084) #12
  %82 = bitcast i32 %81 to float
  %83 = tail call float @llvm.nvvm.fabs.f(float %82) #12
  %84 = fcmp olt float %83, 0x4010C46560000000
  br i1 %84, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true
  %85 = fcmp olt double %param_6.13084, 0.000000e+00
  %86 = fadd double %param_6.13084, 0x7FF0000000000000
  %z.0.i = select i1 %85, double 0.000000e+00, double %86
  %87 = fcmp olt float %83, 0x4010E90000000000
  br i1 %87, label %88, label %__nv_exp.exit

88:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %89 = sdiv i32 %61, 2
  %90 = shl i32 %89, 20
  %91 = add i32 %77, %90
  %92 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 %91) #12
  %93 = sub nsw i32 %61, %89
  %94 = shl i32 %93, 20
  %95 = add nsw i32 %94, 1072693248
  %96 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %95) #12
  %97 = fmul double %96, %92
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true, %__internal_fast_icmp_abs_lt.exit.i, %88
  %z.2.i = phi double [ %80, %x_in_tile-true ], [ %97, %88 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.2933.3.clone.1 = fmul double %param_1.24232, %z.2.i
  %param_5.16785 = load float, ptr addrspace(1) %lsr.iv73, align 4, !invariant.load !303
  %98 = fpext float %param_5.16785 to double
  %param_4.20566 = load float, ptr addrspace(1) %lsr.iv76, align 4, !invariant.load !303
  %99 = fpext float %param_4.20566 to double
  %100 = fneg double %multiply.2933.3.clone.1
  %101 = fmul double %100, %99
  %102 = fmul double %multiply.2933.3.clone.1, %98
  %add.3846.7.clone.1 = fsub double %101, %102
  %scevgep81 = getelementptr i8, ptr addrspace(1) %lsr.iv79, i64 %3
  %param_3.26927 = load double, ptr addrspace(1) %scevgep81, align 8, !invariant.load !303
  %103 = fcmp ole double %param_3.26927, -3.000000e+01
  %104 = select i1 %103, double -3.000000e+01, double %param_3.26927
  %105 = fcmp oge double %104, 3.000000e+01
  %106 = select i1 %105, double 3.000000e+01, double %104
  %107 = fneg double %106
  %108 = tail call double @llvm.fma.f64(double %107, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %109 = tail call i32 @llvm.nvvm.d2i.lo(double %108) #12
  %110 = tail call double @llvm.nvvm.add.rn.d(double %108, double 0xC338000000000000) #12
  %111 = tail call double @llvm.fma.f64(double %110, double 0xBFE62E42FEFA39EF, double %107)
  %112 = tail call double @llvm.fma.f64(double %110, double 0xBC7ABC9E3B39803F, double %111)
  %113 = tail call double @llvm.fma.f64(double %112, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %114 = tail call double @llvm.fma.f64(double %113, double %112, double 0x3EC71DEE62401315)
  %115 = tail call double @llvm.fma.f64(double %114, double %112, double 0x3EFA01997C89EB71)
  %116 = tail call double @llvm.fma.f64(double %115, double %112, double 0x3F2A01A014761F65)
  %117 = tail call double @llvm.fma.f64(double %116, double %112, double 0x3F56C16C1852B7AF)
  %118 = tail call double @llvm.fma.f64(double %117, double %112, double 0x3F81111111122322)
  %119 = tail call double @llvm.fma.f64(double %118, double %112, double 0x3FA55555555502A1)
  %120 = tail call double @llvm.fma.f64(double %119, double %112, double 0x3FC5555555555511)
  %121 = tail call double @llvm.fma.f64(double %120, double %112, double 0x3FE000000000000B)
  %122 = tail call double @llvm.fma.f64(double %121, double %112, double 1.000000e+00)
  %123 = tail call double @llvm.fma.f64(double %122, double %112, double 1.000000e+00)
  %124 = tail call i32 @llvm.nvvm.d2i.lo(double %123) #12
  %125 = tail call i32 @llvm.nvvm.d2i.hi(double %123) #12
  %126 = shl i32 %109, 20
  %127 = add i32 %125, %126
  %128 = tail call double @llvm.nvvm.lohi.i2d(i32 %124, i32 %127) #12
  %129 = tail call i32 @llvm.nvvm.d2i.hi(double %107) #12
  %130 = bitcast i32 %129 to float
  %131 = tail call float @llvm.nvvm.fabs.f(float %130) #12
  %132 = fcmp olt float %131, 0x4010C46560000000
  br i1 %132, label %__nv_exp.exit35, label %__internal_fast_icmp_abs_lt.exit.i32

__internal_fast_icmp_abs_lt.exit.i32:             ; preds = %__nv_exp.exit
  %133 = fcmp ogt double %106, 0.000000e+00
  %134 = fsub double 0x7FF0000000000000, %106
  %z.0.i33 = select i1 %133, double 0.000000e+00, double %134
  %135 = fcmp olt float %131, 0x4010E90000000000
  br i1 %135, label %136, label %__nv_exp.exit35

136:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i32
  %137 = sdiv i32 %109, 2
  %138 = shl i32 %137, 20
  %139 = add i32 %125, %138
  %140 = tail call double @llvm.nvvm.lohi.i2d(i32 %124, i32 %139) #12
  %141 = sub nsw i32 %109, %137
  %142 = shl i32 %141, 20
  %143 = add nsw i32 %142, 1072693248
  %144 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %143) #12
  %145 = fmul double %144, %140
  br label %__nv_exp.exit35

__nv_exp.exit35:                                  ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i32, %136
  %z.2.i34 = phi double [ %128, %__nv_exp.exit ], [ %145, %136 ], [ %z.0.i33, %__internal_fast_icmp_abs_lt.exit.i32 ]
  %add.3839.7.clone.1 = fadd double %z.2.i34, 1.000000e+00
  %divide.593.7.clone.1 = fdiv double 1.000000e+00, %add.3839.7.clone.1
  %subtract.233.1.clone.1 = fsub double 1.000000e+00, %divide.593.7.clone.1
  %multiply.2936.1.clone.1 = fmul double %divide.593.7.clone.1, %subtract.233.1.clone.1
  %multiply.2937.5.clone.1 = fmul double %add.3846.7.clone.1, %multiply.2936.1.clone.1
  %compare.638.1.clone.1 = fcmp oeq double %104, %106
  %scevgep85 = getelementptr i8, ptr addrspace(1) %lsr.iv83, i64 %3
  %param_2.352110 = load double, ptr addrspace(1) %scevgep85, align 8, !invariant.load !303
  %146 = select i1 %compare.638.1.clone.1, double 1.000000e+00, double %param_2.352110
  %compare.639.1.clone.1 = fcmp oeq double %106, 3.000000e+01
  %147 = select i1 %compare.639.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.595.5.clone.1 = fdiv double %146, %147
  %multiply.2938.3.clone.1 = fmul double %divide.595.5.clone.1, %multiply.2937.5.clone.1
  %compare.640.1.clone.1 = fcmp oeq double %param_3.26927, %104
  %148 = select i1 %compare.640.1.clone.1, double 1.000000e+00, double %param_2.352110
  %compare.641.1.clone.1 = fcmp oeq double %104, -3.000000e+01
  %149 = select i1 %compare.641.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.596.3.clone.1 = fdiv double %148, %149
  %multiply.2939.1.clone.1 = fmul double %divide.596.3.clone.1, %multiply.2938.3.clone.1
  %scevgep89 = getelementptr i8, ptr addrspace(1) %lsr.iv87, i64 %3
  store double %multiply.2939.1.clone.1, ptr addrspace(1) %scevgep89, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3619.i43, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_13(ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !303
  store double %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load i32, ptr addrspace(1) %9, align 4, !invariant.load !303
  store i32 %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(20) %arg2) local_unnamed_addr #4 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !303
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg02, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !303
  %13 = getelementptr i8, ptr addrspace(1) %arg26, i64 %10
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg2) local_unnamed_addr #4 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !303
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg02, i64 0, i64 %9, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !303
  %13 = getelementptr double, ptr addrspace(1) %arg26, i64 %10
  store double %12, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg28, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg29, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg30) local_unnamed_addr #4 {
entry:
  %arg3076 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2974 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2872 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2770 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2668 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2566 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2464 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2362 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2260 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2158 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2056 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1954 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1852 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1750 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1648 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1546 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1444 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1342 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1240 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1138 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1036 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg934 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg832 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg730 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg628 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg526 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = load i64, ptr addrspace(1) %arg2158, align 128, !invariant.load !303
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg934, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !303
  %13 = getelementptr double, ptr addrspace(1) %arg016, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !303
  %15 = trunc i8 %12 to i1
  %16 = select i1 %15, double %14, double 0.000000e+00
  %17 = getelementptr double, ptr addrspace(1) %arg2056, i64 %10
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !303
  %19 = select i1 %15, double %18, double 0.000000e+00
  %20 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg1954, i64 0, i64 %9, i64 %10
  %21 = load i8, ptr addrspace(1) %20, align 1, !invariant.load !303
  %22 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1852, i64 0, i64 %9, i64 %10
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !303
  %24 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg1750, i64 0, i64 %9, i64 %10
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !303
  %26 = getelementptr inbounds [192 x [20 x i32]], ptr addrspace(1) %arg1648, i64 0, i64 %9, i64 %10
  %27 = load i32, ptr addrspace(1) %26, align 4, !invariant.load !303
  %28 = icmp eq i32 %27, 1
  %29 = getelementptr double, ptr addrspace(1) %arg1546, i64 %10
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !303
  %31 = trunc i8 %25 to i1
  %32 = select i1 %31, i1 %28, i1 false
  %33 = select i1 %32, i1 %15, i1 false
  %34 = select i1 %33, double %30, double 0.000000e+00
  %35 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1138, i64 0, i64 %9, i64 %10
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !303
  %multiply.2798.11 = fmul double %36, %34
  %37 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1444, i64 0, i64 %9, i64 %10
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !303
  %multiply.2800.7 = fmul double %38, %multiply.2798.11
  %39 = fmul double %23, %multiply.2798.11
  %add.3722.7 = fsub double %multiply.2800.7, %39
  %40 = trunc i8 %21 to i1
  %41 = select i1 %40, double %add.3722.7, double 0.000000e+00
  %42 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1342, i64 0, i64 %9, i64 %10
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !303
  %44 = getelementptr double, ptr addrspace(1) %arg1240, i64 %10
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !303
  %46 = select i1 %15, double %45, double 0.000000e+00
  %multiply.2801.17 = fmul double %36, %46
  %47 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1036, i64 0, i64 %9, i64 %10
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !303
  %multiply.2802.13 = fmul double %48, %multiply.2801.17
  %multiply.2803.7 = fmul double %43, %multiply.2802.13
  %add.3723.7 = fadd double %41, %multiply.2803.7
  %add.3724.5 = fadd double %19, %add.3723.7
  %49 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg220, i64 0, i64 %9, i64 %10
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !303
  %51 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg424, i64 0, i64 %9, i64 %10
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !303
  %53 = fneg double %add.3724.5
  %54 = fmul double %50, %53
  %55 = fmul double %52, %54
  %add.3725.3 = fadd double %16, %55
  %56 = getelementptr double, ptr addrspace(1) %arg526, i64 %10
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !303
  %58 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg628, i64 0, i64 %9, i64 %10
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !303
  %add.3721.9 = fadd double %57, %59
  %60 = select i1 %15, double %add.3721.9, double 0.000000e+00
  %61 = getelementptr double, ptr addrspace(1) %arg832, i64 %10
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !303
  %63 = select i1 %15, double %62, double 0.000000e+00
  %multiply.2806.9 = fmul double %52, %add.3724.5
  %64 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg730, i64 0, i64 %9, i64 %10
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !303
  %multiply.2807.7 = fmul double %multiply.2806.9, %65
  %add.3726.5 = fadd double %63, %multiply.2807.7
  %add.3727.5 = fadd double %60, %add.3726.5
  %66 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg322, i64 0, i64 %9, i64 %10
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !303
  %68 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg118, i64 0, i64 %9, i64 %10
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !303
  %70 = fneg double %add.3727.5
  %71 = fmul double %67, %70
  %72 = fmul double %50, %71
  %73 = fmul double %69, %72
  %add.3728.1 = fadd double %add.3725.3, %73
  %74 = getelementptr double, ptr addrspace(1) %arg2260, i64 %10
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !303
  %76 = select i1 %15, double 0.000000e+00, double %75
  %77 = getelementptr double, ptr addrspace(1) %arg2362, i64 %10
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !303
  %79 = select i1 %15, double 0.000000e+00, double %78
  %80 = getelementptr double, ptr addrspace(1) %arg2464, i64 %10
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !303
  %82 = select i1 %15, double 0.000000e+00, double %81
  %83 = getelementptr double, ptr addrspace(1) %arg2566, i64 %10
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !303
  %85 = select i1 %15, double 0.000000e+00, double %84
  %86 = getelementptr double, ptr addrspace(1) %arg2668, i64 %10
  store double %add.3728.1, ptr addrspace(1) %86, align 8
  %87 = getelementptr double, ptr addrspace(1) %arg2770, i64 %10
  store double %76, ptr addrspace(1) %87, align 8
  %88 = getelementptr double, ptr addrspace(1) %arg2872, i64 %10
  store double %79, ptr addrspace(1) %88, align 8
  %89 = getelementptr double, ptr addrspace(1) %arg2974, i64 %10
  store double %82, ptr addrspace(1) %89, align 8
  %90 = getelementptr double, ptr addrspace(1) %arg3076, i64 %10
  store double %85, ptr addrspace(1) %90, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %4 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !303
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !303
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %9 = fneg double %6
  %10 = fmul double %8, %9
  %multiply.2793.1.clone.1 = fmul double %4, %10
  %multiply.2794.1.clone.1 = fmul double %8, %multiply.2793.1.clone.1
  %multiply.2795.1 = fmul double %3, %multiply.2794.1.clone.1
  %11 = fneg double %10
  %12 = fmul double %8, %11
  %13 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.2795.1, ptr addrspace(1) %13, align 8
  %14 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %multiply.2794.1.clone.1, ptr addrspace(1) %14, align 8
  %15 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %12, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(20) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %4 = getelementptr i8, ptr addrspace(1) %arg25, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !303
  %6 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %8 = trunc i8 %5 to i1
  %9 = select i1 %8, double %7, double 0.000000e+00
  %10 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %multiply.2796.1 = fmul double %9, %10
  %multiply.2797.1 = fmul double %3, %multiply.2796.1
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.2797.1, ptr addrspace(1) %11, align 8
  %12 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %9, ptr addrspace(1) %12, align 8
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg12, ptr noalias nocapture align 128 dereferenceable(160) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg18, ptr noalias nocapture align 128 dereferenceable(160) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg22, ptr noalias nocapture align 128 dereferenceable(160) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(15360) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg26, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg27, ptr noalias nocapture align 128 dereferenceable(160) %arg28, ptr noalias nocapture align 128 dereferenceable(160) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg32, ptr noalias nocapture align 128 dereferenceable(160) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg34, ptr noalias nocapture align 128 dereferenceable(160) %arg35, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg36, ptr noalias nocapture align 128 dereferenceable(160) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg38, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg40, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg41, ptr noalias nocapture align 128 dereferenceable(160) %arg42, ptr noalias nocapture readnone align 128 dereferenceable(3840) %arg43, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg44, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg45, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg46, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg48, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg49, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg50, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg51, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg52, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg54, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg55, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg56, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg57, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg58, ptr noalias nocapture align 128 dereferenceable(160) %arg59, ptr noalias nocapture align 128 dereferenceable(160) %arg60, ptr noalias nocapture align 128 dereferenceable(160) %arg61, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg62, ptr noalias nocapture align 128 dereferenceable(160) %arg63, ptr noalias nocapture align 128 dereferenceable(160) %arg64, ptr noalias nocapture align 128 dereferenceable(160) %arg65, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg66, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg67, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg68, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg69, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg70, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg71, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg72, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg73, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg74, ptr noalias nocapture readonly align 128 dereferenceable(3840) %arg75, ptr noalias nocapture align 128 dereferenceable(160) %arg76, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg77) local_unnamed_addr #4 {
entry:
  %arg77206 = addrspacecast ptr %arg77 to ptr addrspace(1)
  %arg76204 = addrspacecast ptr %arg76 to ptr addrspace(1)
  %arg75202 = addrspacecast ptr %arg75 to ptr addrspace(1)
  %arg74200 = addrspacecast ptr %arg74 to ptr addrspace(1)
  %arg73198 = addrspacecast ptr %arg73 to ptr addrspace(1)
  %arg72196 = addrspacecast ptr %arg72 to ptr addrspace(1)
  %arg71194 = addrspacecast ptr %arg71 to ptr addrspace(1)
  %arg70192 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69190 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg68188 = addrspacecast ptr %arg68 to ptr addrspace(1)
  %arg67186 = addrspacecast ptr %arg67 to ptr addrspace(1)
  %arg66184 = addrspacecast ptr %arg66 to ptr addrspace(1)
  %arg65182 = addrspacecast ptr %arg65 to ptr addrspace(1)
  %arg64180 = addrspacecast ptr %arg64 to ptr addrspace(1)
  %arg63178 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62176 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61174 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60172 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59170 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58168 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57166 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56164 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55162 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54160 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53158 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52156 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51154 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50152 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49150 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48148 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47146 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46144 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45142 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg44140 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg42136 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg41134 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg40132 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg39130 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg38128 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37126 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36124 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35122 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34120 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33118 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32116 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31114 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30112 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29110 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28108 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27106 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26104 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25102 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg24100 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2398 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2296 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2194 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2092 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1990 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1888 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1786 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1684 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1582 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1480 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1378 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1276 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1174 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1072 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg970 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg868 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg766 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg664 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg562 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg460 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg358 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg256 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg154 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg052 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = load i64, ptr addrspace(1) %arg256, align 128, !invariant.load !303
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg154, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !303
  %13 = getelementptr double, ptr addrspace(1) %arg052, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 8
  %15 = trunc i8 %12 to i1
  %16 = select i1 %15, double 0.000000e+00, double %14
  %17 = getelementptr double, ptr addrspace(1) %arg1990, i64 %10
  %18 = load double, ptr addrspace(1) %17, align 8
  %19 = select i1 %15, double 0.000000e+00, double %18
  %20 = getelementptr double, ptr addrspace(1) %arg562, i64 %10
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !303
  %22 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg31114, i64 0, i64 %9, i64 %10
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !303
  %24 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg30112, i64 0, i64 %9, i64 %10
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !303
  %26 = getelementptr double, ptr addrspace(1) %arg29110, i64 %10
  %27 = load double, ptr addrspace(1) %26, align 8
  %28 = select i1 %15, double %27, double 0.000000e+00
  %29 = getelementptr double, ptr addrspace(1) %arg28108, i64 %10
  %30 = load double, ptr addrspace(1) %29, align 8
  %31 = select i1 %15, double %30, double 0.000000e+00
  %32 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg27106, i64 0, i64 %9, i64 %10
  %33 = load i8, ptr addrspace(1) %32, align 1, !invariant.load !303
  %34 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg26104, i64 0, i64 %9, i64 %10
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !303
  %36 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg25102, i64 0, i64 %9, i64 %10
  %37 = load i8, ptr addrspace(1) %36, align 1, !invariant.load !303
  %38 = getelementptr inbounds [192 x [20 x i32]], ptr addrspace(1) %arg24100, i64 0, i64 %9, i64 %10
  %39 = load i32, ptr addrspace(1) %38, align 4, !invariant.load !303
  %40 = icmp eq i32 %39, 1
  %41 = getelementptr double, ptr addrspace(1) %arg2398, i64 %10
  %42 = load double, ptr addrspace(1) %41, align 8
  %43 = select i1 %15, double %42, double 0.000000e+00
  %44 = trunc i8 %37 to i1
  %45 = select i1 %44, i1 %40, i1 false
  %46 = select i1 %45, double %43, double 0.000000e+00
  %47 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2296, i64 0, i64 %9, i64 %10
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !303
  %multiply.2798.31.clone.1 = fmul double %48, %46
  %49 = fneg double %multiply.2798.31.clone.1
  %50 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2194, i64 0, i64 %9, i64 %10
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !303
  %multiply.2800.15.clone.1 = fmul double %51, %multiply.2798.31.clone.1
  %52 = fmul double %35, %multiply.2798.31.clone.1
  %add.3722.15.clone.1 = fsub double %multiply.2800.15.clone.1, %52
  %53 = trunc i8 %33 to i1
  %54 = select i1 %53, double %add.3722.15.clone.1, double 0.000000e+00
  %55 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg2092, i64 0, i64 %9, i64 %10
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !303
  %57 = select i1 %15, double %18, double 0.000000e+00
  %multiply.2801.37.clone.1 = fmul double %57, %48
  %58 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1888, i64 0, i64 %9, i64 %10
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !303
  %multiply.2802.33.clone.1 = fmul double %multiply.2801.37.clone.1, %59
  %multiply.2803.15.clone.1 = fmul double %56, %multiply.2802.33.clone.1
  %add.3723.15.clone.1 = fadd double %54, %multiply.2803.15.clone.1
  %add.3724.13.clone.1 = fadd double %31, %add.3723.15.clone.1
  %60 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1786, i64 0, i64 %9, i64 %10
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !303
  %multiply.2821.9.clone.1 = fmul double %61, %add.3724.13.clone.1
  %62 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1684, i64 0, i64 %9, i64 %10
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !303
  %divide.574.17.clone.1 = fdiv double %add.3724.13.clone.1, %63
  %add.3746.15.clone.1 = fadd double %multiply.2821.9.clone.1, %divide.574.17.clone.1
  %add.3747.13.clone.1 = fadd double %28, %add.3746.15.clone.1
  %64 = getelementptr double, ptr addrspace(1) %arg1582, i64 %10
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !303
  %add.3748.11.clone.1 = fadd double %65, %add.3747.13.clone.1
  %66 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1480, i64 0, i64 %9, i64 %10
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !303
  %68 = getelementptr double, ptr addrspace(1) %arg1378, i64 %10
  %69 = load double, ptr addrspace(1) %68, align 8
  %70 = select i1 %15, double %69, double 0.000000e+00
  %71 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1276, i64 0, i64 %9, i64 %10
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !303
  %73 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1174, i64 0, i64 %9, i64 %10
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !303
  %multiply.2822.17.clone.1 = fmul double %74, %49
  %multiply.2823.19.clone.1 = fmul double %72, %multiply.2822.17.clone.1
  %75 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg1072, i64 0, i64 %9, i64 %10
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !303
  %multiply.2824.19.clone.1 = fmul double %multiply.2798.31.clone.1, %74
  %77 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg970, i64 0, i64 %9, i64 %10
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !303
  %multiply.2825.17.clone.1 = fmul double %multiply.2824.19.clone.1, %78
  %multiply.2826.15.clone.1 = fmul double %76, %multiply.2825.17.clone.1
  %add.3749.17.clone.1 = fadd double %multiply.2823.19.clone.1, %multiply.2826.15.clone.1
  %multiply.2827.19.clone.1 = fmul double %multiply.2798.31.clone.1, 5.000000e-01
  %multiply.2828.17.clone.1 = fmul double %multiply.2827.19.clone.1, %78
  %multiply.2829.15.clone.1 = fmul double %76, %multiply.2828.17.clone.1
  %add.3750.15.clone.1 = fadd double %multiply.2829.15.clone.1, %add.3749.17.clone.1
  %79 = select i1 %53, double %add.3750.15.clone.1, double 0.000000e+00
  %multiply.2830.17.clone.1 = fmul double %multiply.2802.33.clone.1, %74
  %multiply.2831.15.clone.1 = fmul double %76, %multiply.2830.17.clone.1
  %add.3751.15.clone.1 = fadd double %multiply.2831.15.clone.1, %79
  %add.3752.15.clone.1 = fadd double %70, %add.3751.15.clone.1
  %80 = getelementptr double, ptr addrspace(1) %arg358, i64 %10
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !303
  %add.3754.13.clone.1 = fadd double %81, %add.3752.15.clone.1
  %multiply.2832.9.clone.1 = fmul double %67, %add.3754.13.clone.1
  %add.3755.9.clone.1 = fadd double %add.3748.11.clone.1, %multiply.2832.9.clone.1
  %82 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg868, i64 0, i64 %9, i64 %10
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !303
  %84 = fneg double %add.3755.9.clone.1
  %85 = fmul double %83, %84
  %86 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg766, i64 0, i64 %9, i64 %10
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !303
  %multiply.2836.9.clone.1 = fmul double %87, %add.3754.13.clone.1
  %add.3765.7.clone.1 = fadd double %multiply.2836.9.clone.1, %85
  %88 = trunc i8 %25 to i1
  %89 = select i1 %88, double %add.3765.7.clone.1, double 0.000000e+00
  %90 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg664, i64 0, i64 %9, i64 %10
  %91 = load double, ptr addrspace(1) %90, align 8, !invariant.load !303
  %multiply.2837.3.clone.1 = fmul double %91, %89
  %multiply.2838.5.clone.1 = fmul double %23, %multiply.2837.3.clone.1
  %add.3769.3.clone.1 = fadd double %21, %multiply.2838.5.clone.1
  %92 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg460, i64 0, i64 %9, i64 %10
  %93 = load double, ptr addrspace(1) %92, align 8, !invariant.load !303
  %94 = select i1 %15, double %14, double 0.000000e+00
  %add.3770.9.clone.1 = fadd double %94, %57
  %add.3771.7.clone.1 = fadd double %add.3770.9.clone.1, %81
  %multiply.2839.5.clone.1 = fmul double %add.3771.7.clone.1, %93
  %add.3772.3.clone.1 = fadd double %multiply.2839.5.clone.1, %add.3769.3.clone.1
  %add.3774.1.clone.1 = fadd double %19, %add.3772.3.clone.1
  %95 = getelementptr double, ptr addrspace(1) %arg33118, i64 %10
  %96 = load double, ptr addrspace(1) %95, align 8
  %add.3764.3.clone.1 = fadd double %96, 0.000000e+00
  %97 = getelementptr double, ptr addrspace(1) %arg32116, i64 %10
  %98 = load double, ptr addrspace(1) %97, align 8, !invariant.load !303
  %add.3766.1.clone.1 = fadd double %98, %multiply.2837.3.clone.1
  %add.3767.1.clone.1 = fadd double %add.3764.3.clone.1, %add.3766.1.clone.1
  %99 = getelementptr double, ptr addrspace(1) %arg37126, i64 %10
  %100 = load double, ptr addrspace(1) %99, align 8
  %101 = select i1 %15, double 0.000000e+00, double %100
  %102 = getelementptr double, ptr addrspace(1) %arg34120, i64 %10
  %103 = load double, ptr addrspace(1) %102, align 8, !invariant.load !303
  %104 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg36124, i64 0, i64 %9, i64 %10
  %105 = load double, ptr addrspace(1) %104, align 8, !invariant.load !303
  %106 = getelementptr double, ptr addrspace(1) %arg35122, i64 %10
  %107 = load double, ptr addrspace(1) %106, align 8
  %108 = select i1 %15, double %107, double 0.000000e+00
  %add.3756.11.clone.1 = fadd double %81, %108
  %109 = fneg double %add.3756.11.clone.1
  %110 = fmul double %105, %109
  %111 = fmul double %105, %85
  %add.3757.5.clone.1 = fsub double %110, %111
  %add.3759.3.clone.1 = fadd double %103, %add.3757.5.clone.1
  %add.3760.1.clone.1 = fadd double %101, %add.3759.3.clone.1
  %112 = select i1 %15, double 0.000000e+00, double %69
  %113 = getelementptr double, ptr addrspace(1) %arg42136, i64 %10
  %114 = load double, ptr addrspace(1) %113, align 8
  %add.3794.3.clone.1 = fadd double %114, 0.000000e+00
  %115 = getelementptr inbounds [192 x [20 x [1 x i8]]], ptr addrspace(1) %arg41134, i64 0, i64 %9, i64 %10, i64 0
  %116 = load i8, ptr addrspace(1) %115, align 1, !invariant.load !303
  %117 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg40132, i64 0, i64 %9, i64 %10
  %118 = load double, ptr addrspace(1) %117, align 8, !invariant.load !303
  %multiply.2866.13.clone.1 = fmul double %multiply.2822.17.clone.1, %118
  %multiply.2868.11.clone.1 = fmul double %multiply.2866.13.clone.1, 5.000000e-01
  %119 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg39130, i64 0, i64 %9, i64 %10
  %120 = load double, ptr addrspace(1) %119, align 8, !invariant.load !303
  %multiply.2869.9.clone.1 = fmul double %120, %multiply.2868.11.clone.1
  %multiply.2870.11.clone.1 = fmul double %multiply.2825.17.clone.1, %118
  %add.3795.9.clone.1 = fadd double %multiply.2870.11.clone.1, %multiply.2869.9.clone.1
  %multiply.2871.11.clone.1 = fmul double %multiply.2828.17.clone.1, %118
  %add.3796.9.clone.1 = fadd double %multiply.2871.11.clone.1, %add.3795.9.clone.1
  %121 = trunc i8 %116 to i1
  %122 = select i1 %121, double %add.3796.9.clone.1, double 0.000000e+00
  %multiply.2872.7.clone.1 = fmul double %multiply.2830.17.clone.1, %118
  %add.3797.5.clone.1 = fadd double %multiply.2872.7.clone.1, %122
  %123 = getelementptr double, ptr addrspace(1) %arg38128, i64 %10
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !303
  %add.3799.3.clone.1 = fadd double %124, %add.3797.5.clone.1
  %add.3800.1.clone.1 = fadd double %add.3794.3.clone.1, %add.3799.3.clone.1
  %125 = select i1 %15, double 0.000000e+00, double %107
  %126 = getelementptr double, ptr addrspace(1) %arg61174, i64 %10
  %127 = load double, ptr addrspace(1) %126, align 8
  %128 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg62176, i64 0, i64 %9, i64 %10
  %129 = load double, ptr addrspace(1) %128, align 8, !invariant.load !303
  %add.3721.5.clone.1 = fadd double %127, %129
  %130 = select i1 %15, double 0.000000e+00, double %add.3721.5.clone.1
  %131 = getelementptr double, ptr addrspace(1) %arg60172, i64 %10
  %132 = load double, ptr addrspace(1) %131, align 8
  %133 = select i1 %15, double %132, double 0.000000e+00
  %134 = getelementptr double, ptr addrspace(1) %arg59170, i64 %10
  %135 = load double, ptr addrspace(1) %134, align 8
  %136 = select i1 %15, double %135, double 0.000000e+00
  %multiply.2806.7.clone.1 = fmul double %add.3724.13.clone.1, %87
  %137 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg58168, i64 0, i64 %9, i64 %10
  %138 = load double, ptr addrspace(1) %137, align 8, !invariant.load !303
  %multiply.2807.5.clone.1 = fmul double %multiply.2806.7.clone.1, %138
  %add.3726.3.clone.1 = fadd double %136, %multiply.2807.5.clone.1
  %add.3729.11.clone.1 = fsub double %133, %add.3726.3.clone.1
  %139 = select i1 %15, double %add.3721.5.clone.1, double 0.000000e+00
  %add.3727.3.clone.1 = fadd double %139, %add.3726.3.clone.1
  %add.3730.7.clone.1 = fadd double %81, %add.3727.3.clone.1
  %add.3731.9.clone.1 = fadd double %add.3729.11.clone.1, %add.3730.7.clone.1
  %140 = getelementptr double, ptr addrspace(1) %arg57166, i64 %10
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !303
  %142 = select i1 %15, double %141, double 0.000000e+00
  %add.3732.17.clone.1 = fadd double %81, %142
  %143 = getelementptr double, ptr addrspace(1) %arg56164, i64 %10
  %144 = load double, ptr addrspace(1) %143, align 8, !invariant.load !303
  %145 = select i1 %15, double %144, double 0.000000e+00
  %146 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg55162, i64 0, i64 %9, i64 %10
  %147 = load double, ptr addrspace(1) %146, align 8, !invariant.load !303
  %multiply.2811.11.clone.1 = fmul double %147, %add.3727.3.clone.1
  %148 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg54160, i64 0, i64 %9
  %149 = load double, ptr addrspace(1) %148, align 8, !invariant.load !303
  %multiply.2812.13.clone.1 = fmul double %multiply.2811.11.clone.1, %149
  %add.3733.11.clone.1 = fadd double %81, %multiply.2812.13.clone.1
  %add.3734.9.clone.1 = fadd double %145, %add.3733.11.clone.1
  %150 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg53158, i64 0, i64 %9, i64 %10
  %151 = load double, ptr addrspace(1) %150, align 8, !invariant.load !303
  %152 = fneg double %add.3734.9.clone.1
  %153 = fdiv double %152, %151
  %154 = fmul double %149, %153
  %add.3735.15.clone.1 = fadd double %add.3732.17.clone.1, %154
  %155 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg52156, i64 0, i64 %9, i64 %10
  %156 = load double, ptr addrspace(1) %155, align 8, !invariant.load !303
  %157 = getelementptr double, ptr addrspace(1) %arg51154, i64 %10
  %158 = load double, ptr addrspace(1) %157, align 8, !invariant.load !303
  %159 = getelementptr double, ptr addrspace(1) %arg50152, i64 %10
  %160 = load double, ptr addrspace(1) %159, align 8, !invariant.load !303
  %161 = fadd double %158, %160
  %add.3736.3.clone.1 = select i1 %15, double %161, double 0.000000e+00
  %162 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg49150, i64 0, i64 %9, i64 %10
  %163 = load double, ptr addrspace(1) %162, align 8, !invariant.load !303
  %164 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg48148, i64 0, i64 %9, i64 %10
  %165 = load double, ptr addrspace(1) %164, align 8, !invariant.load !303
  %multiply.2808.3.clone.1 = fmul double %add.3727.3.clone.1, %165
  %divide.573.13.clone.1 = fdiv double %multiply.2808.3.clone.1, %63
  %multiply.2814.11.clone.1 = fmul double %163, %divide.573.13.clone.1
  %166 = getelementptr double, ptr addrspace(1) %arg47146, i64 %10
  %167 = load double, ptr addrspace(1) %166, align 8, !invariant.load !303
  %add.3737.9.clone.1 = fadd double %167, %multiply.2814.11.clone.1
  %add.3738.7.clone.1 = fadd double %add.3736.3.clone.1, %add.3737.9.clone.1
  %add.3739.5.clone.1 = fadd double %81, %add.3738.7.clone.1
  %168 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg46144, i64 0, i64 %9, i64 %10
  %169 = load double, ptr addrspace(1) %168, align 8, !invariant.load !303
  %170 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg45142, i64 0, i64 %9, i64 %10
  %171 = load double, ptr addrspace(1) %170, align 8, !invariant.load !303
  %172 = fmul double %169, %152
  %173 = fmul double %172, %171
  %add.3740.3.clone.1 = fadd double %173, %add.3739.5.clone.1
  %174 = fmul double %156, %add.3740.3.clone.1
  %add.3741.13.clone.1 = fsub double %add.3735.15.clone.1, %174
  %175 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg44140, i64 0, i64 %9, i64 %10
  %176 = load double, ptr addrspace(1) %175, align 8, !invariant.load !303
  %multiply.2818.3.clone.1 = fmul double %176, %add.3740.3.clone.1
  %add.3742.11.clone.1 = fadd double %multiply.2818.3.clone.1, %add.3741.13.clone.1
  %multiply.2819.9.clone.1 = fmul double %151, %add.3742.11.clone.1
  %add.3743.7.clone.1 = fadd double %add.3731.9.clone.1, %multiply.2819.9.clone.1
  %multiply.2820.5.clone.1 = fmul double %93, %add.3743.7.clone.1
  %add.3744.3.clone.1 = fadd double %81, %multiply.2820.5.clone.1
  %add.3745.1.clone.1 = fadd double %130, %add.3744.3.clone.1
  %177 = getelementptr double, ptr addrspace(1) %arg63178, i64 %10
  %178 = load double, ptr addrspace(1) %177, align 8
  %179 = select i1 %15, double 0.000000e+00, double %178
  %180 = getelementptr double, ptr addrspace(1) %arg64180, i64 %10
  %181 = load double, ptr addrspace(1) %180, align 8
  %182 = select i1 %15, double 0.000000e+00, double %181
  %183 = getelementptr double, ptr addrspace(1) %arg65182, i64 %10
  %184 = load double, ptr addrspace(1) %183, align 8
  %185 = select i1 %15, double 0.000000e+00, double %184
  %186 = getelementptr double, ptr addrspace(1) %arg76204, i64 %10
  %187 = load double, ptr addrspace(1) %186, align 8
  %add.3787.3.clone.1.clone.1 = fadd double %187, 0.000000e+00
  %188 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg75202, i64 0, i64 %9, i64 %10
  %189 = load i8, ptr addrspace(1) %188, align 1, !invariant.load !303
  %190 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg74200, i64 0, i64 %9, i64 %10
  %191 = load double, ptr addrspace(1) %190, align 8, !invariant.load !303
  %192 = icmp eq i32 %39, 0
  %193 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg73198, i64 0, i64 %9, i64 %10
  %194 = load double, ptr addrspace(1) %193, align 8, !invariant.load !303
  %.neg = fneg double %43
  %195 = select i1 %192, double %.neg, double -0.000000e+00
  %196 = fmul double %195, %194
  %multiply.2860.5.clone.1.clone.1 = fmul double %191, %196
  %197 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg72196, i64 0, i64 %9, i64 %10
  %198 = load double, ptr addrspace(1) %197, align 8, !invariant.load !303
  %multiply.2861.3.clone.1.clone.1 = fmul double %198, %multiply.2860.5.clone.1.clone.1
  %199 = trunc i8 %189 to i1
  %200 = select i1 %199, double %multiply.2861.3.clone.1.clone.1, double 0.000000e+00
  %add.3789.5.clone.1.clone.1 = fadd double %81, %200
  %201 = getelementptr inbounds [192 x [20 x i8]], ptr addrspace(1) %arg71194, i64 0, i64 %9, i64 %10
  %202 = load i8, ptr addrspace(1) %201, align 1, !invariant.load !303
  %203 = select i1 %15, double %178, double 0.000000e+00
  %204 = select i1 %53, double %46, double 0.000000e+00
  %205 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg70192, i64 0, i64 %9, i64 %10
  %206 = load double, ptr addrspace(1) %205, align 8, !invariant.load !303
  %207 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg69190, i64 0, i64 %9, i64 %10
  %208 = load double, ptr addrspace(1) %207, align 8, !invariant.load !303
  %209 = fneg double %206
  %210 = fmul double %multiply.2801.37.clone.1, %209
  %211 = fmul double %210, %208
  %multiply.2844.7.clone.1.clone.1 = fmul double %211, 2.000000e+00
  %add.3776.7.clone.1.clone.1 = fadd double %204, %multiply.2844.7.clone.1.clone.1
  %add.3777.11.clone.1.clone.1 = fadd double %203, %add.3776.7.clone.1.clone.1
  %add.3779.9.clone.1.clone.1 = fadd double %81, %add.3777.11.clone.1.clone.1
  %212 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg68188, i64 0, i64 %9, i64 %10
  %213 = load double, ptr addrspace(1) %212, align 8, !invariant.load !303
  %214 = select i1 %15, double %184, double 0.000000e+00
  %add.3780.13.clone.1.clone.1 = fadd double %81, %214
  %multiply.2851.7.clone.1.clone.1 = fmul double %add.3780.13.clone.1.clone.1, %213
  %add.3781.7.clone.1.clone.1 = fadd double %multiply.2851.7.clone.1.clone.1, %add.3779.9.clone.1.clone.1
  %215 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg67186, i64 0, i64 %9, i64 %10
  %216 = load double, ptr addrspace(1) %215, align 8, !invariant.load !303
  %217 = fneg double %add.3781.7.clone.1.clone.1
  %218 = fmul double %216, %217
  %219 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg66184, i64 0, i64 %9, i64 %10
  %220 = load double, ptr addrspace(1) %219, align 8, !invariant.load !303
  %multiply.2862.5.clone.1.clone.1 = fmul double %add.3780.13.clone.1.clone.1, %220
  %add.3790.3.clone.1.clone.1 = fadd double %multiply.2862.5.clone.1.clone.1, %218
  %221 = trunc i8 %202 to i1
  %222 = select i1 %221, double %add.3790.3.clone.1.clone.1, double 0.000000e+00
  %multiply.2864.3.clone.1.clone.1 = fmul double %198, %222
  %add.3791.3.clone.1.clone.1 = fadd double %add.3789.5.clone.1.clone.1, %multiply.2864.3.clone.1.clone.1
  %add.3792.1.clone.1.clone.1 = fadd double %add.3787.3.clone.1.clone.1, %add.3791.3.clone.1.clone.1
  %223 = select i1 %15, double 0.000000e+00, double %42
  %224 = getelementptr inbounds [192 x [20 x double]], ptr addrspace(1) %arg77206, i64 0, i64 %9, i64 %10
  %225 = load double, ptr addrspace(1) %224, align 8, !invariant.load !303
  %226 = fneg double %196
  %227 = fmul double %225, %226
  %228 = select i1 %199, double %227, double 0.000000e+00
  %add.3775.5.clone.1 = fadd double %81, %228
  %229 = select i1 %15, double %181, double 0.000000e+00
  %add.3782.9.clone.1 = fadd double %81, %229
  %230 = fneg double %add.3782.9.clone.1
  %231 = fmul double %225, %230
  %232 = fmul double %225, %218
  %add.3784.3.clone.1 = fsub double %231, %232
  %add.3785.3.clone.1 = fadd double %add.3775.5.clone.1, %add.3784.3.clone.1
  %add.3786.1.clone.1 = fadd double %223, %add.3785.3.clone.1
  %233 = select i1 %15, double 0.000000e+00, double %135
  %add.3761.1.clone.1 = fadd double %81, %233
  %234 = select i1 %15, double 0.000000e+00, double %30
  %add.3762.1.clone.1 = fadd double %234, %81
  %235 = select i1 %15, double 0.000000e+00, double %27
  %236 = select i1 %15, double 0.000000e+00, double %132
  store double %16, ptr addrspace(1) %13, align 8
  store double %add.3774.1.clone.1, ptr addrspace(1) %17, align 8
  store double %add.3767.1.clone.1, ptr addrspace(1) %95, align 8
  store double %add.3760.1.clone.1, ptr addrspace(1) %99, align 8
  store double %112, ptr addrspace(1) %68, align 8
  store double %add.3800.1.clone.1, ptr addrspace(1) %113, align 8
  store double %125, ptr addrspace(1) %106, align 8
  store double %add.3745.1.clone.1, ptr addrspace(1) %126, align 8
  store double %179, ptr addrspace(1) %177, align 8
  store double %182, ptr addrspace(1) %180, align 8
  store double %185, ptr addrspace(1) %183, align 8
  store double %add.3792.1.clone.1.clone.1, ptr addrspace(1) %186, align 8
  store double %add.3786.1.clone.1, ptr addrspace(1) %41, align 8
  store double %add.3761.1.clone.1, ptr addrspace(1) %134, align 8
  store double %add.3762.1.clone.1, ptr addrspace(1) %29, align 8
  store double %235, ptr addrspace(1) %26, align 8
  store double %236, ptr addrspace(1) %131, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_11(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load i64, ptr addrspace(1) %arg37, align 128, !invariant.load !303
  %5 = sitofp i64 %4 to double
  %6 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %multiply.2909.17 = fmul double %6, %5
  %multiply.2910.3 = fmul double %multiply.2909.17, 5.000000e-01
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2916.3 = fmul double %8, %multiply.2910.3
  %add.3830.3 = fadd double %3, %multiply.2916.3
  %9 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !303
  %11 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !303
  %add.3862.5.clone.1 = fadd double %12, 6.000000e+00
  %multiply.2950.3.clone.1 = fmul double %add.3862.5.clone.1, 2.500000e-01
  %13 = fsub double %10, %multiply.2950.3.clone.1
  %multiply.2951.1 = fmul double %multiply.2910.3, %13
  %add.3865.1 = fadd double %add.3830.3, %multiply.2951.1
  store double %add.3865.1, ptr addrspace(1) %2, align 8
  %14 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %13, ptr addrspace(1) %14, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_12(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load i64, ptr addrspace(1) %arg37, align 128, !invariant.load !303
  %5 = sitofp i64 %4 to double
  %6 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %multiply.2909.39 = fmul double %6, %5
  %multiply.2910.25 = fmul double %multiply.2909.39, 5.000000e-01
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2915.3 = fmul double %8, %multiply.2910.25
  %add.3829.3 = fadd double %3, %multiply.2915.3
  %9 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !303
  %11 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !303
  %add.3859.5.clone.1 = fadd double %12, 4.000000e+00
  %multiply.2948.3.clone.1 = fmul double %add.3859.5.clone.1, 2.500000e-01
  %13 = fsub double %10, %multiply.2948.3.clone.1
  %multiply.2949.1 = fmul double %multiply.2910.25, %13
  %add.3861.1 = fadd double %add.3829.3, %multiply.2949.1
  store double %add.3861.1, ptr addrspace(1) %2, align 8
  %14 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %13, ptr addrspace(1) %14, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_13(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load i64, ptr addrspace(1) %arg37, align 128, !invariant.load !303
  %5 = sitofp i64 %4 to double
  %6 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %multiply.2909.37 = fmul double %6, %5
  %multiply.2910.23 = fmul double %multiply.2909.37, 5.000000e-01
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2914.3 = fmul double %8, %multiply.2910.23
  %add.3827.3 = fadd double %3, %multiply.2914.3
  %9 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !303
  %11 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !303
  %add.3855.5.clone.1 = fadd double %12, -1.000000e+00
  %add.3856.1.clone.1 = fsub double %10, %add.3855.5.clone.1
  %multiply.2947.1 = fmul double %multiply.2910.23, %add.3856.1.clone.1
  %add.3857.1 = fadd double %add.3827.3, %multiply.2947.1
  store double %add.3857.1, ptr addrspace(1) %2, align 8
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %add.3856.1.clone.1, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_15(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load i64, ptr addrspace(1) %arg37, align 128, !invariant.load !303
  %5 = sitofp i64 %4 to double
  %6 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %multiply.2909.31 = fmul double %6, %5
  %multiply.2910.17 = fmul double %multiply.2909.31, 5.000000e-01
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2912.3 = fmul double %8, %multiply.2910.17
  %add.3825.3 = fadd double %3, %multiply.2912.3
  %9 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !303
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !303
  %add.3847.5.clone.1 = fadd double %12, -1.000000e+00
  %multiply.2940.1.clone.1 = fmul double %add.3847.5.clone.1, 4.000000e+00
  %13 = fsub double %10, %multiply.2940.1.clone.1
  %multiply.2941.1 = fmul double %multiply.2910.17, %13
  %add.3850.1 = fadd double %add.3825.3, %multiply.2941.1
  store double %add.3850.1, ptr addrspace(1) %2, align 8
  %14 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %13, ptr addrspace(1) %14, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_14(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg6) local_unnamed_addr #4 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load i64, ptr addrspace(1) %arg37, align 128, !invariant.load !303
  %5 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %6 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %8 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !303
  %10 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !303
  %12 = tail call double @llvm.fma.f64(double %11, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #12
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #12
  %15 = tail call double @llvm.fma.f64(double %14, double 0xBFE62E42FEFA39EF, double %11)
  %16 = tail call double @llvm.fma.f64(double %14, double 0xBC7ABC9E3B39803F, double %15)
  %17 = tail call double @llvm.fma.f64(double %16, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %18 = tail call double @llvm.fma.f64(double %17, double %16, double 0x3EC71DEE62401315)
  %19 = tail call double @llvm.fma.f64(double %18, double %16, double 0x3EFA01997C89EB71)
  %20 = tail call double @llvm.fma.f64(double %19, double %16, double 0x3F2A01A014761F65)
  %21 = tail call double @llvm.fma.f64(double %20, double %16, double 0x3F56C16C1852B7AF)
  %22 = tail call double @llvm.fma.f64(double %21, double %16, double 0x3F81111111122322)
  %23 = tail call double @llvm.fma.f64(double %22, double %16, double 0x3FA55555555502A1)
  %24 = tail call double @llvm.fma.f64(double %23, double %16, double 0x3FC5555555555511)
  %25 = tail call double @llvm.fma.f64(double %24, double %16, double 0x3FE000000000000B)
  %26 = tail call double @llvm.fma.f64(double %25, double %16, double 1.000000e+00)
  %27 = tail call double @llvm.fma.f64(double %26, double %16, double 1.000000e+00)
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #12
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #12
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #12
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %11) #12
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #12
  %36 = fcmp olt float %35, 0x4010C46560000000
  br i1 %36, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %37 = fcmp olt double %11, 0.000000e+00
  %38 = fadd double %11, 0x7FF0000000000000
  %z.0.i = select i1 %37, double 0.000000e+00, double %38
  %39 = fcmp olt float %35, 0x4010E90000000000
  br i1 %39, label %40, label %__nv_exp.exit

40:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %41 = sdiv i32 %13, 2
  %42 = shl i32 %41, 20
  %43 = add i32 %29, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #12
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #12
  %49 = fmul double %48, %44
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %40
  %z.2.i = phi double [ %32, %entry ], [ %49, %40 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %50 = sitofp i64 %4 to double
  %multiply.2909.35 = fmul double %5, %50
  %multiply.2910.21 = fmul double %multiply.2909.35, 5.000000e-01
  %multiply.2913.3 = fmul double %7, %multiply.2910.21
  %add.3826.3 = fadd double %3, %multiply.2913.3
  %multiply.2943.1.clone.1 = fmul double %9, %z.2.i
  %add.3851.5.clone.1 = fadd double %11, 0xBFF62E42FEFA39EF
  %multiply.2944.1.clone.1 = fmul double %add.3851.5.clone.1, 0x3FFC71C71C71C71C
  %51 = fsub double %multiply.2943.1.clone.1, %multiply.2944.1.clone.1
  %multiply.2945.1 = fmul double %multiply.2910.21, %51
  %add.3854.1 = fadd double %add.3826.3, %multiply.2945.1
  store double %add.3854.1, ptr addrspace(1) %2, align 8
  %52 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %51, ptr addrspace(1) %52, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #2 {
entry:
  %arg133 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg031 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !313
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext i32 %thread.id.2 to i64
  %2 = add nuw nsw i32 %0, -32
  %3 = zext nneg i32 %thread.id.x to i64
  %4 = lshr i64 %3, 5
  %5 = mul nuw nsw i64 %4, 160
  %6 = shl nuw nsw i64 %1, 3
  %7 = add i64 %5, %6
  %scevgep = getelementptr i8, ptr addrspace(1) %arg031, i64 %7
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv35 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep36, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %2, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.029 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %8 = trunc i64 %1 to i32
  %9 = icmp ult i32 %8, 20
  br i1 %9, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.3619.i28, %x_in_tile-true ], [ %partial_reduction_result.029, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep36 = getelementptr i8, ptr addrspace(1) %lsr.iv35, i64 5120
  %10 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %10, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !319

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %11 = trunc i64 %1 to i32
  %12 = zext nneg i32 %0 to i64
  %13 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache4, i64 0, i64 %1, i64 %12
  store double %partial_reduction_result.1, ptr addrspace(3) %13, align 8
  tail call void @llvm.nvvm.barrier0()
  %14 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache4, i64 0, i64 %12, i64 %1
  %partial_reduction_result31819 = load <2 x i32>, ptr addrspace(3) %14, align 8
  %15 = extractelement <2 x i32> %partial_reduction_result31819, i64 0
  %16 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 16, i32 31)
  %17 = insertelement <2 x i32> poison, i32 %16, i64 0
  %18 = extractelement <2 x i32> %partial_reduction_result31819, i64 1
  %19 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %18, i32 16, i32 31)
  %20 = insertelement <2 x i32> %17, i32 %19, i64 1
  %21 = bitcast <2 x i32> %20 to double
  %22 = bitcast <2 x i32> %partial_reduction_result31819 to double
  %add.3619.i = fadd double %22, %21
  %23 = bitcast double %add.3619.i to <2 x i32>
  %24 = extractelement <2 x i32> %23, i64 0
  %25 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %24, i32 8, i32 31)
  %26 = insertelement <2 x i32> poison, i32 %25, i64 0
  %27 = extractelement <2 x i32> %23, i64 1
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 8, i32 31)
  %29 = insertelement <2 x i32> %26, i32 %28, i64 1
  %30 = bitcast <2 x i32> %29 to double
  %add.3619.i24 = fadd double %add.3619.i, %30
  %31 = bitcast double %add.3619.i24 to <2 x i32>
  %32 = extractelement <2 x i32> %31, i64 0
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 4, i32 31)
  %34 = insertelement <2 x i32> poison, i32 %33, i64 0
  %35 = extractelement <2 x i32> %31, i64 1
  %36 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %35, i32 4, i32 31)
  %37 = insertelement <2 x i32> %34, i32 %36, i64 1
  %38 = bitcast <2 x i32> %37 to double
  %add.3619.i25 = fadd double %add.3619.i24, %38
  %39 = bitcast double %add.3619.i25 to <2 x i32>
  %40 = extractelement <2 x i32> %39, i64 0
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 2, i32 31)
  %42 = insertelement <2 x i32> poison, i32 %41, i64 0
  %43 = extractelement <2 x i32> %39, i64 1
  %44 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %43, i32 2, i32 31)
  %45 = insertelement <2 x i32> %42, i32 %44, i64 1
  %46 = bitcast <2 x i32> %45 to double
  %add.3619.i26 = fadd double %add.3619.i25, %46
  %47 = bitcast double %add.3619.i26 to <2 x i32>
  %48 = extractelement <2 x i32> %47, i64 0
  %49 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 1, i32 31)
  %50 = insertelement <2 x i32> poison, i32 %49, i64 0
  %51 = extractelement <2 x i32> %47, i64 1
  %52 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %51, i32 1, i32 31)
  %53 = insertelement <2 x i32> %50, i32 %52, i64 1
  %54 = bitcast <2 x i32> %53 to double
  %add.3619.i27 = fadd double %add.3619.i26, %54
  store double %add.3619.i27, ptr addrspace(3) %14, align 8
  %55 = icmp ult i32 %thread.id.x, 640
  %56 = icmp eq i32 %11, 0
  %57 = and i1 %55, %56
  %output_element_address = getelementptr inbounds [20 x double], ptr addrspace(1) %arg133, i64 0, i64 %12
  br i1 %57, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %param_0.17452 = load double, ptr addrspace(1) %lsr.iv35, align 8, !invariant.load !303
  %add.3619.i28 = fadd double %partial_reduction_result.029, %param_0.17452
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.3619.i27, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_16(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5) local_unnamed_addr #4 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load i64, ptr addrspace(1) %arg37, align 128, !invariant.load !303
  %5 = sitofp i64 %4 to double
  %6 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %multiply.2909.29 = fmul double %6, %5
  %multiply.2910.15 = fmul double %multiply.2909.29, 5.000000e-01
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %multiply.2911.5 = fmul double %8, %multiply.2910.15
  %add.3822.5 = fadd double %3, %multiply.2911.5
  %9 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  %10 = load double, ptr addrspace(1) %9, align 8
  %11 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !303
  %add.3844.1.clone.1 = fsub double %10, %12
  %multiply.2932.1 = fmul double %multiply.2910.15, %add.3844.1.clone.1
  %add.3845.1 = fadd double %add.3822.5, %multiply.2932.1
  store double %add.3845.1, ptr addrspace(1) %2, align 8
  store double %add.3844.1.clone.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_concatenate_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(960) %arg8) local_unnamed_addr #2 {
entry:
  %arg8214 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7212 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6210 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5208 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4206 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3204 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2202 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1200 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0198 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !311
  %0 = shl nuw nsw i32 %thread.id.x, 1
  %1 = zext nneg i32 %0 to i64
  %param_0.295956 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg0198, i64 0, i64 %1
  %param_0.295957 = load double, ptr addrspace(1) %param_0.295956, align 16, !invariant.load !303
  %2 = icmp ult i32 %thread.id.x, 30
  br i1 %2, label %concatenate.pivot.20.78, label %concatenate.pivot.60.84

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true.then
  ret void

loop3.loop_header51.preheader.1:                  ; preds = %concatenate.40.1.merge91.1
  %3 = shl nuw nsw i32 %151, 1
  %4 = zext nneg i32 %3 to i64
  %param_0.295956.1157 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg0198, i64 0, i64 %4
  %param_0.295957.1158 = load double, ptr addrspace(1) %param_0.295956.1157, align 16, !invariant.load !303
  %5 = icmp ult i32 %151, 40
  br i1 %5, label %concatenate.pivot.60.84.1166, label %concatenate.pivot.100.85.1160

concatenate.pivot.100.85.1160:                    ; preds = %loop3.loop_header51.preheader.1
  %6 = icmp ult i32 %151, 50
  br i1 %6, label %concatenate.pivot.80.86.1164, label %concatenate.pivot.100.87.1162

concatenate.pivot.100.87.1162:                    ; preds = %concatenate.pivot.100.85.1160
  %7 = trunc i64 %4 to i32
  %8 = sext i32 %7 to i64
  %9 = getelementptr [20 x double], ptr addrspace(1) %arg6210, i64 0, i64 %8
  %param_6.126975.1161216 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 -800
  br label %concatenate.40.1.merge58.1179

concatenate.pivot.80.86.1164:                     ; preds = %concatenate.pivot.100.85.1160
  %10 = trunc i64 %4 to i32
  %11 = add nsw i32 %10, -80
  %12 = zext nneg i32 %11 to i64
  %param_5.164572.1163 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5208, i64 0, i64 %12
  br label %concatenate.40.1.merge58.1179

concatenate.pivot.60.84.1166:                     ; preds = %loop3.loop_header51.preheader.1
  %13 = trunc i64 %4 to i32
  %14 = add nsw i32 %13, -60
  %15 = zext nneg i32 %14 to i64
  %param_4.203669.1165 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4206, i64 0, i64 %15
  br label %concatenate.40.1.merge58.1179

concatenate.40.1.merge58.1179:                    ; preds = %concatenate.pivot.60.84.1166, %concatenate.pivot.80.86.1164, %concatenate.pivot.100.87.1162
  %.in.1175 = phi ptr addrspace(1) [ %param_4.203669.1165, %concatenate.pivot.60.84.1166 ], [ %param_5.164572.1163, %concatenate.pivot.80.86.1164 ], [ %param_6.126975.1161216, %concatenate.pivot.100.87.1162 ]
  %16 = icmp ult i32 %151, 40
  %17 = load double, ptr addrspace(1) %.in.1175, align 8, !invariant.load !303
  %multiply.2968.388.1176 = fmul double %param_0.295957.1158, %17
  %multiply.2969.389.1177 = fmul double %17, %multiply.2968.388.1176
  %add.3619.i152.1178 = fadd double %add.3619.i152.1, %multiply.2969.389.1177
  br i1 %16, label %concatenate.pivot.60.117.1187, label %concatenate.pivot.100.118.1181

concatenate.pivot.100.118.1181:                   ; preds = %concatenate.40.1.merge58.1179
  %18 = icmp ult i32 %151, 50
  br i1 %18, label %concatenate.pivot.80.119.1185, label %concatenate.pivot.100.120.1183

concatenate.pivot.100.120.1183:                   ; preds = %concatenate.pivot.100.118.1181
  %19 = trunc i64 %4 to i32
  %20 = sext i32 %19 to i64
  %21 = getelementptr [20 x double], ptr addrspace(1) %arg6210, i64 0, i64 %20
  %param_6.1269108.1182217 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 -800
  br label %concatenate.40.1.merge91.1197

concatenate.pivot.80.119.1185:                    ; preds = %concatenate.pivot.100.118.1181
  %22 = trunc i64 %4 to i32
  %23 = add nsw i32 %22, -80
  %24 = zext nneg i32 %23 to i64
  %param_5.1645105.1184 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5208, i64 0, i64 %24
  br label %concatenate.40.1.merge91.1197

concatenate.pivot.60.117.1187:                    ; preds = %concatenate.40.1.merge58.1179
  %25 = trunc i64 %4 to i32
  %26 = add nsw i32 %25, -60
  %27 = zext nneg i32 %26 to i64
  %param_4.2036102.1186 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4206, i64 0, i64 %27
  br label %concatenate.40.1.merge91.1197

concatenate.40.1.merge91.1197:                    ; preds = %concatenate.pivot.60.117.1187, %concatenate.pivot.80.119.1185, %concatenate.pivot.100.120.1183
  %.in140.1196 = phi ptr addrspace(1) [ %param_4.2036102.1186, %concatenate.pivot.60.117.1187 ], [ %param_5.1645105.1184, %concatenate.pivot.80.119.1185 ], [ %param_6.1269108.1182217, %concatenate.pivot.100.120.1183 ]
  %28 = icmp ult i32 %151, 40
  %29 = load double, ptr addrspace(1) %.in140.1196, align 8, !invariant.load !303
  %30 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg8214, i64 0, i64 %4
  store double %29, ptr addrspace(1) %30, align 16
  %param_0.295956.1.1218 = getelementptr inbounds i8, ptr addrspace(1) %param_0.295956.1157, i64 8
  %param_0.295957.1.1 = load double, ptr addrspace(1) %param_0.295956.1.1218, align 8, !invariant.load !303
  br i1 %28, label %concatenate.pivot.60.84.1.1, label %concatenate.pivot.100.85.1.1

concatenate.pivot.100.85.1.1:                     ; preds = %concatenate.40.1.merge91.1197
  %31 = icmp ult i32 %151, 50
  br i1 %31, label %concatenate.pivot.80.86.1.1, label %concatenate.pivot.100.87.1.1

concatenate.pivot.100.87.1.1:                     ; preds = %concatenate.pivot.100.85.1.1
  %32 = trunc i64 %4 to i32
  %33 = sext i32 %32 to i64
  %34 = getelementptr [20 x double], ptr addrspace(1) %arg6210, i64 0, i64 %33
  %param_6.126975.1.1219 = getelementptr inbounds i8, ptr addrspace(1) %34, i64 -792
  br label %concatenate.40.1.merge58.1.1

concatenate.pivot.80.86.1.1:                      ; preds = %concatenate.pivot.100.85.1.1
  %35 = trunc i64 %4 to i32
  %36 = add nsw i32 %35, -79
  %37 = zext nneg i32 %36 to i64
  %param_5.164572.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5208, i64 0, i64 %37
  br label %concatenate.40.1.merge58.1.1

concatenate.pivot.60.84.1.1:                      ; preds = %concatenate.40.1.merge91.1197
  %38 = trunc i64 %4 to i32
  %39 = add nsw i32 %38, -59
  %40 = zext nneg i32 %39 to i64
  %param_4.203669.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4206, i64 0, i64 %40
  br label %concatenate.40.1.merge58.1.1

concatenate.40.1.merge58.1.1:                     ; preds = %concatenate.pivot.60.84.1.1, %concatenate.pivot.80.86.1.1, %concatenate.pivot.100.87.1.1
  %.in.1.1 = phi ptr addrspace(1) [ %param_4.203669.1.1, %concatenate.pivot.60.84.1.1 ], [ %param_5.164572.1.1, %concatenate.pivot.80.86.1.1 ], [ %param_6.126975.1.1219, %concatenate.pivot.100.87.1.1 ]
  %41 = icmp ult i32 %151, 40
  %42 = load double, ptr addrspace(1) %.in.1.1, align 8, !invariant.load !303
  %multiply.2968.388.1.1 = fmul double %param_0.295957.1.1, %42
  %multiply.2969.389.1.1 = fmul double %42, %multiply.2968.388.1.1
  %add.3619.i152.1.1 = fadd double %add.3619.i152.1178, %multiply.2969.389.1.1
  br i1 %41, label %concatenate.pivot.60.117.1.1, label %concatenate.pivot.100.118.1.1

concatenate.pivot.100.118.1.1:                    ; preds = %concatenate.40.1.merge58.1.1
  %43 = icmp ult i32 %151, 50
  br i1 %43, label %concatenate.pivot.80.119.1.1, label %concatenate.pivot.100.120.1.1

concatenate.pivot.100.120.1.1:                    ; preds = %concatenate.pivot.100.118.1.1
  %44 = trunc i64 %4 to i32
  %45 = sext i32 %44 to i64
  %46 = getelementptr [20 x double], ptr addrspace(1) %arg6210, i64 0, i64 %45
  %param_6.1269108.1.1220 = getelementptr inbounds i8, ptr addrspace(1) %46, i64 -792
  br label %concatenate.40.1.merge91.1.1

concatenate.pivot.80.119.1.1:                     ; preds = %concatenate.pivot.100.118.1.1
  %47 = trunc i64 %4 to i32
  %48 = add nsw i32 %47, -79
  %49 = zext nneg i32 %48 to i64
  %param_5.1645105.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5208, i64 0, i64 %49
  br label %concatenate.40.1.merge91.1.1

concatenate.pivot.60.117.1.1:                     ; preds = %concatenate.40.1.merge58.1.1
  %50 = trunc i64 %4 to i32
  %51 = add nsw i32 %50, -59
  %52 = zext nneg i32 %51 to i64
  %param_4.2036102.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4206, i64 0, i64 %52
  br label %concatenate.40.1.merge91.1.1

concatenate.40.1.merge91.1.1:                     ; preds = %concatenate.pivot.60.117.1.1, %concatenate.pivot.80.119.1.1, %concatenate.pivot.100.120.1.1
  %.in140.1.1 = phi ptr addrspace(1) [ %param_4.2036102.1.1, %concatenate.pivot.60.117.1.1 ], [ %param_5.1645105.1.1, %concatenate.pivot.80.119.1.1 ], [ %param_6.1269108.1.1220, %concatenate.pivot.100.120.1.1 ]
  %53 = load double, ptr addrspace(1) %.in140.1.1, align 8, !invariant.load !303
  %54 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 8
  store double %53, ptr addrspace(1) %54, align 8
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %concatenate.40.1.merge91.1.1, %concatenate.40.1.merge91.1
  %partial_reduction_result.1.1 = phi double [ %add.3619.i152.1, %concatenate.40.1.merge91.1 ], [ %add.3619.i152.1.1, %concatenate.40.1.merge91.1.1 ]
  %55 = bitcast double %partial_reduction_result.1.1 to <2 x i32>
  %56 = extractelement <2 x i32> %55, i64 0
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 16, i32 31)
  %58 = insertelement <2 x i32> poison, i32 %57, i64 0
  %59 = extractelement <2 x i32> %55, i64 1
  %60 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %59, i32 16, i32 31)
  %61 = insertelement <2 x i32> %58, i32 %60, i64 1
  %62 = bitcast <2 x i32> %61 to double
  %add.3619.i = fadd double %partial_reduction_result.1.1, %62
  %63 = bitcast double %add.3619.i to <2 x i32>
  %64 = extractelement <2 x i32> %63, i64 0
  %65 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 8, i32 31)
  %66 = insertelement <2 x i32> poison, i32 %65, i64 0
  %67 = extractelement <2 x i32> %63, i64 1
  %68 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %67, i32 8, i32 31)
  %69 = insertelement <2 x i32> %66, i32 %68, i64 1
  %70 = bitcast <2 x i32> %69 to double
  %add.3619.i148 = fadd double %add.3619.i, %70
  %71 = bitcast double %add.3619.i148 to <2 x i32>
  %72 = extractelement <2 x i32> %71, i64 0
  %73 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %72, i32 4, i32 31)
  %74 = insertelement <2 x i32> poison, i32 %73, i64 0
  %75 = extractelement <2 x i32> %71, i64 1
  %76 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %75, i32 4, i32 31)
  %77 = insertelement <2 x i32> %74, i32 %76, i64 1
  %78 = bitcast <2 x i32> %77 to double
  %add.3619.i149 = fadd double %add.3619.i148, %78
  %79 = bitcast double %add.3619.i149 to <2 x i32>
  %80 = extractelement <2 x i32> %79, i64 0
  %81 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %80, i32 2, i32 31)
  %82 = insertelement <2 x i32> poison, i32 %81, i64 0
  %83 = extractelement <2 x i32> %79, i64 1
  %84 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %83, i32 2, i32 31)
  %85 = insertelement <2 x i32> %82, i32 %84, i64 1
  %86 = bitcast <2 x i32> %85 to double
  %add.3619.i150 = fadd double %add.3619.i149, %86
  %87 = bitcast double %add.3619.i150 to <2 x i32>
  %88 = extractelement <2 x i32> %87, i64 0
  %89 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %88, i32 1, i32 31)
  %90 = extractelement <2 x i32> %87, i64 1
  %91 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %90, i32 1, i32 31)
  %92 = icmp eq i32 %thread.id.x, 0
  %93 = insertelement <2 x i32> poison, i32 %89, i64 0
  %94 = insertelement <2 x i32> %93, i32 %91, i64 1
  %95 = bitcast <2 x i32> %94 to double
  %add.3619.i151 = fadd double %add.3619.i150, %95
  br i1 %92, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

concatenate.pivot.20.78:                          ; preds = %entry
  %96 = icmp ult i32 %thread.id.x, 10
  br i1 %96, label %concatenate.pivot.0.79, label %concatenate.pivot.40.80

concatenate.pivot.0.79:                           ; preds = %concatenate.pivot.20.78
  %param_1.421660 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1200, i64 0, i64 %1
  br label %concatenate.40.1.merge58

concatenate.pivot.40.80:                          ; preds = %concatenate.pivot.20.78
  %97 = icmp ult i32 %thread.id.x, 20
  br i1 %97, label %concatenate.pivot.20.81, label %concatenate.pivot.40.82

concatenate.pivot.20.81:                          ; preds = %concatenate.pivot.40.80
  %98 = trunc i64 %1 to i32
  %99 = add nsw i32 %98, -20
  %100 = zext nneg i32 %99 to i64
  %param_2.351163 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2202, i64 0, i64 %100
  br label %concatenate.40.1.merge58

concatenate.pivot.40.82:                          ; preds = %concatenate.pivot.40.80
  %101 = trunc i64 %1 to i32
  %102 = add nsw i32 %101, -40
  %103 = zext nneg i32 %102 to i64
  %param_3.267966 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3204, i64 0, i64 %103
  br label %concatenate.40.1.merge58

concatenate.pivot.60.84:                          ; preds = %entry
  %104 = trunc i64 %1 to i32
  %105 = add nsw i32 %104, -60
  %106 = zext nneg i32 %105 to i64
  %param_4.203669 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4206, i64 0, i64 %106
  br label %concatenate.40.1.merge58

concatenate.40.1.merge58:                         ; preds = %concatenate.pivot.60.84, %concatenate.pivot.40.82, %concatenate.pivot.20.81, %concatenate.pivot.0.79
  %.in = phi ptr addrspace(1) [ %param_1.421660, %concatenate.pivot.0.79 ], [ %param_2.351163, %concatenate.pivot.20.81 ], [ %param_3.267966, %concatenate.pivot.40.82 ], [ %param_4.203669, %concatenate.pivot.60.84 ]
  %107 = icmp ult i32 %thread.id.x, 30
  %108 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !303
  %multiply.2968.388 = fmul double %param_0.295957, %108
  %multiply.2969.389 = fmul double %108, %multiply.2968.388
  %add.3619.i152 = fadd double %multiply.2969.389, 0.000000e+00
  br i1 %107, label %concatenate.pivot.20.111, label %concatenate.pivot.60.117

concatenate.pivot.20.111:                         ; preds = %concatenate.40.1.merge58
  %109 = icmp ult i32 %thread.id.x, 10
  br i1 %109, label %concatenate.pivot.0.112, label %concatenate.pivot.40.113

concatenate.pivot.0.112:                          ; preds = %concatenate.pivot.20.111
  %param_1.421693 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1200, i64 0, i64 %1
  br label %concatenate.40.1.merge91

concatenate.pivot.40.113:                         ; preds = %concatenate.pivot.20.111
  %110 = icmp ult i32 %thread.id.x, 20
  br i1 %110, label %concatenate.pivot.20.114, label %concatenate.pivot.40.115

concatenate.pivot.20.114:                         ; preds = %concatenate.pivot.40.113
  %111 = trunc i64 %1 to i32
  %112 = add nsw i32 %111, -20
  %113 = zext nneg i32 %112 to i64
  %param_2.351196 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2202, i64 0, i64 %113
  br label %concatenate.40.1.merge91

concatenate.pivot.40.115:                         ; preds = %concatenate.pivot.40.113
  %114 = trunc i64 %1 to i32
  %115 = add nsw i32 %114, -40
  %116 = zext nneg i32 %115 to i64
  %param_3.267999 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3204, i64 0, i64 %116
  br label %concatenate.40.1.merge91

concatenate.pivot.60.117:                         ; preds = %concatenate.40.1.merge58
  %117 = trunc i64 %1 to i32
  %118 = add nsw i32 %117, -60
  %119 = zext nneg i32 %118 to i64
  %param_4.2036102 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4206, i64 0, i64 %119
  br label %concatenate.40.1.merge91

concatenate.40.1.merge91:                         ; preds = %concatenate.pivot.60.117, %concatenate.pivot.40.115, %concatenate.pivot.20.114, %concatenate.pivot.0.112
  %.in140 = phi ptr addrspace(1) [ %param_1.421693, %concatenate.pivot.0.112 ], [ %param_2.351196, %concatenate.pivot.20.114 ], [ %param_3.267999, %concatenate.pivot.40.115 ], [ %param_4.2036102, %concatenate.pivot.60.117 ]
  %120 = icmp ult i32 %thread.id.x, 30
  %121 = load double, ptr addrspace(1) %.in140, align 8, !invariant.load !303
  %122 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg8214, i64 0, i64 %1
  store double %121, ptr addrspace(1) %122, align 16
  %param_0.295956.1221 = getelementptr inbounds i8, ptr addrspace(1) %param_0.295956, i64 8
  %param_0.295957.1 = load double, ptr addrspace(1) %param_0.295956.1221, align 8, !invariant.load !303
  br i1 %120, label %concatenate.pivot.20.78.1, label %concatenate.pivot.60.84.1

concatenate.pivot.60.84.1:                        ; preds = %concatenate.40.1.merge91
  %123 = trunc i64 %1 to i32
  %124 = add nsw i32 %123, -59
  %125 = zext nneg i32 %124 to i64
  %param_4.203669.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4206, i64 0, i64 %125
  br label %concatenate.40.1.merge58.1

concatenate.pivot.20.78.1:                        ; preds = %concatenate.40.1.merge91
  %126 = icmp ult i32 %thread.id.x, 10
  br i1 %126, label %concatenate.pivot.0.79.1, label %concatenate.pivot.40.80.1

concatenate.pivot.40.80.1:                        ; preds = %concatenate.pivot.20.78.1
  %127 = icmp ult i32 %thread.id.x, 20
  br i1 %127, label %concatenate.pivot.20.81.1, label %concatenate.pivot.40.82.1

concatenate.pivot.40.82.1:                        ; preds = %concatenate.pivot.40.80.1
  %128 = trunc i64 %1 to i32
  %129 = add nsw i32 %128, -39
  %130 = zext nneg i32 %129 to i64
  %param_3.267966.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3204, i64 0, i64 %130
  br label %concatenate.40.1.merge58.1

concatenate.pivot.20.81.1:                        ; preds = %concatenate.pivot.40.80.1
  %131 = trunc i64 %1 to i32
  %132 = add nsw i32 %131, -19
  %133 = zext nneg i32 %132 to i64
  %param_2.351163.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2202, i64 0, i64 %133
  br label %concatenate.40.1.merge58.1

concatenate.pivot.0.79.1:                         ; preds = %concatenate.pivot.20.78.1
  %134 = getelementptr [20 x double], ptr addrspace(1) %arg1200, i64 0, i64 %1
  %param_1.421660.1222 = getelementptr inbounds i8, ptr addrspace(1) %134, i64 8
  br label %concatenate.40.1.merge58.1

concatenate.40.1.merge58.1:                       ; preds = %concatenate.pivot.0.79.1, %concatenate.pivot.20.81.1, %concatenate.pivot.40.82.1, %concatenate.pivot.60.84.1
  %.in.1 = phi ptr addrspace(1) [ %param_1.421660.1222, %concatenate.pivot.0.79.1 ], [ %param_2.351163.1, %concatenate.pivot.20.81.1 ], [ %param_3.267966.1, %concatenate.pivot.40.82.1 ], [ %param_4.203669.1, %concatenate.pivot.60.84.1 ]
  %135 = icmp ult i32 %thread.id.x, 30
  %136 = load double, ptr addrspace(1) %.in.1, align 8, !invariant.load !303
  %multiply.2968.388.1 = fmul double %param_0.295957.1, %136
  %multiply.2969.389.1 = fmul double %136, %multiply.2968.388.1
  %add.3619.i152.1 = fadd double %add.3619.i152, %multiply.2969.389.1
  br i1 %135, label %concatenate.pivot.20.111.1, label %concatenate.pivot.60.117.1

concatenate.pivot.60.117.1:                       ; preds = %concatenate.40.1.merge58.1
  %137 = trunc i64 %1 to i32
  %138 = add nsw i32 %137, -59
  %139 = zext nneg i32 %138 to i64
  %param_4.2036102.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4206, i64 0, i64 %139
  br label %concatenate.40.1.merge91.1

concatenate.pivot.20.111.1:                       ; preds = %concatenate.40.1.merge58.1
  %140 = icmp ult i32 %thread.id.x, 10
  br i1 %140, label %concatenate.pivot.0.112.1, label %concatenate.pivot.40.113.1

concatenate.pivot.40.113.1:                       ; preds = %concatenate.pivot.20.111.1
  %141 = icmp ult i32 %thread.id.x, 20
  br i1 %141, label %concatenate.pivot.20.114.1, label %concatenate.pivot.40.115.1

concatenate.pivot.40.115.1:                       ; preds = %concatenate.pivot.40.113.1
  %142 = trunc i64 %1 to i32
  %143 = add nsw i32 %142, -39
  %144 = zext nneg i32 %143 to i64
  %param_3.267999.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3204, i64 0, i64 %144
  br label %concatenate.40.1.merge91.1

concatenate.pivot.20.114.1:                       ; preds = %concatenate.pivot.40.113.1
  %145 = trunc i64 %1 to i32
  %146 = add nsw i32 %145, -19
  %147 = zext nneg i32 %146 to i64
  %param_2.351196.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2202, i64 0, i64 %147
  br label %concatenate.40.1.merge91.1

concatenate.pivot.0.112.1:                        ; preds = %concatenate.pivot.20.111.1
  %148 = getelementptr [20 x double], ptr addrspace(1) %arg1200, i64 0, i64 %1
  %param_1.421693.1223 = getelementptr inbounds i8, ptr addrspace(1) %148, i64 8
  br label %concatenate.40.1.merge91.1

concatenate.40.1.merge91.1:                       ; preds = %concatenate.pivot.0.112.1, %concatenate.pivot.20.114.1, %concatenate.pivot.40.115.1, %concatenate.pivot.60.117.1
  %.in140.1 = phi ptr addrspace(1) [ %param_1.421693.1223, %concatenate.pivot.0.112.1 ], [ %param_2.351196.1, %concatenate.pivot.20.114.1 ], [ %param_3.267999.1, %concatenate.pivot.40.115.1 ], [ %param_4.2036102.1, %concatenate.pivot.60.117.1 ]
  %149 = load double, ptr addrspace(1) %.in140.1, align 8, !invariant.load !303
  %150 = getelementptr inbounds i8, ptr addrspace(1) %122, i64 8
  store double %149, ptr addrspace(1) %150, align 8
  %151 = or disjoint i32 %thread.id.x, 32
  %152 = icmp ult i32 %151, 60
  br i1 %152, label %loop3.loop_header51.preheader.1, label %x_in_tile-after.7

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %153 = icmp eq i32 %thread.id.x, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %153, label %reduction_write_output-true.then, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3619.i151, ptr addrspace(3) @"shared_cache5_$_0", align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true.then:                 ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) @"shared_cache5_$_0", align 8
  store double %output.then.val, ptr addrspace(1) %arg7212, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #2 {
entry:
  %arg1135 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0133 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !320
  %0 = shl nuw nsw i32 %thread.id.x, 1
  %.lhs.trunc = trunc nuw i32 %thread.id.x to i8
  %1 = udiv i8 %.lhs.trunc, 96
  %2 = zext nneg i8 %1 to i64
  %.lhs.trunc87 = trunc nuw nsw i32 %0 to i16
  %3 = urem i16 %.lhs.trunc87, 192
  %4 = zext nneg i16 %3 to i64
  %param_0.174415 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %2, i64 %4
  %param_0.174416 = load double, ptr addrspace(1) %param_0.174415, align 16, !invariant.load !303
  %add.3619.i64 = fadd double %param_0.174416, 0.000000e+00
  %.lhs.trunc89 = or disjoint i16 %.lhs.trunc87, 1
  %5 = urem i16 %.lhs.trunc89, 192
  %6 = zext nneg i16 %5 to i64
  %param_0.174415.1 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %2, i64 %6
  %param_0.174416.1 = load double, ptr addrspace(1) %param_0.174415.1, align 8, !invariant.load !303
  %add.3619.i64.1 = fadd double %add.3619.i64, %param_0.174416.1
  %7 = or disjoint i32 %thread.id.x, 256
  %8 = shl nuw nsw i32 %7, 1
  %.lhs.trunc91 = trunc nuw nsw i32 %7 to i16
  %9 = udiv i16 %.lhs.trunc91, 96
  %10 = zext nneg i16 %9 to i64
  %.lhs.trunc93 = trunc nuw nsw i32 %8 to i16
  %11 = urem i16 %.lhs.trunc93, 192
  %12 = zext nneg i16 %11 to i64
  %param_0.174415.184 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %10, i64 %12
  %param_0.174416.185 = load double, ptr addrspace(1) %param_0.174415.184, align 16, !invariant.load !303
  %add.3619.i64.186 = fadd double %add.3619.i64.1, %param_0.174416.185
  %.lhs.trunc95 = or disjoint i16 %.lhs.trunc93, 1
  %13 = urem i16 %.lhs.trunc95, 192
  %14 = zext nneg i16 %13 to i64
  %param_0.174415.1.1 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %10, i64 %14
  %param_0.174416.1.1 = load double, ptr addrspace(1) %param_0.174415.1.1, align 8, !invariant.load !303
  %add.3619.i64.1.1 = fadd double %add.3619.i64.186, %param_0.174416.1.1
  %15 = or disjoint i32 %thread.id.x, 512
  %16 = shl nuw nsw i32 %15, 1
  %.lhs.trunc97 = trunc nuw nsw i32 %15 to i16
  %17 = udiv i16 %.lhs.trunc97, 96
  %18 = zext nneg i16 %17 to i64
  %.lhs.trunc99 = trunc nuw nsw i32 %16 to i16
  %19 = urem i16 %.lhs.trunc99, 192
  %20 = zext nneg i16 %19 to i64
  %param_0.174415.2 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %18, i64 %20
  %param_0.174416.2 = load double, ptr addrspace(1) %param_0.174415.2, align 16, !invariant.load !303
  %add.3619.i64.2 = fadd double %add.3619.i64.1.1, %param_0.174416.2
  %.lhs.trunc101 = or disjoint i16 %.lhs.trunc99, 1
  %21 = urem i16 %.lhs.trunc101, 192
  %22 = zext nneg i16 %21 to i64
  %param_0.174415.1.2 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %18, i64 %22
  %param_0.174416.1.2 = load double, ptr addrspace(1) %param_0.174415.1.2, align 8, !invariant.load !303
  %add.3619.i64.1.2 = fadd double %add.3619.i64.2, %param_0.174416.1.2
  %23 = or disjoint i32 %thread.id.x, 768
  %24 = shl nuw nsw i32 %23, 1
  %.lhs.trunc103 = trunc nuw nsw i32 %23 to i16
  %25 = udiv i16 %.lhs.trunc103, 96
  %26 = zext nneg i16 %25 to i64
  %.lhs.trunc105 = trunc nuw nsw i32 %24 to i16
  %27 = urem i16 %.lhs.trunc105, 192
  %28 = zext nneg i16 %27 to i64
  %param_0.174415.3 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %26, i64 %28
  %param_0.174416.3 = load double, ptr addrspace(1) %param_0.174415.3, align 16, !invariant.load !303
  %add.3619.i64.3 = fadd double %add.3619.i64.1.2, %param_0.174416.3
  %.lhs.trunc107 = or disjoint i16 %.lhs.trunc105, 1
  %29 = urem i16 %.lhs.trunc107, 192
  %30 = zext nneg i16 %29 to i64
  %param_0.174415.1.3 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %26, i64 %30
  %param_0.174416.1.3 = load double, ptr addrspace(1) %param_0.174415.1.3, align 8, !invariant.load !303
  %add.3619.i64.1.3 = fadd double %add.3619.i64.3, %param_0.174416.1.3
  %31 = or disjoint i32 %thread.id.x, 1024
  %32 = shl nuw nsw i32 %31, 1
  %.lhs.trunc109 = trunc nuw nsw i32 %31 to i16
  %33 = udiv i16 %.lhs.trunc109, 96
  %34 = zext nneg i16 %33 to i64
  %.lhs.trunc111 = trunc nuw nsw i32 %32 to i16
  %35 = urem i16 %.lhs.trunc111, 192
  %36 = zext nneg i16 %35 to i64
  %param_0.174415.4 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %34, i64 %36
  %param_0.174416.4 = load double, ptr addrspace(1) %param_0.174415.4, align 16, !invariant.load !303
  %add.3619.i64.4 = fadd double %add.3619.i64.1.3, %param_0.174416.4
  %.lhs.trunc113 = or disjoint i16 %.lhs.trunc111, 1
  %37 = urem i16 %.lhs.trunc113, 192
  %38 = zext nneg i16 %37 to i64
  %param_0.174415.1.4 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %34, i64 %38
  %param_0.174416.1.4 = load double, ptr addrspace(1) %param_0.174415.1.4, align 8, !invariant.load !303
  %add.3619.i64.1.4 = fadd double %add.3619.i64.4, %param_0.174416.1.4
  %39 = or disjoint i32 %thread.id.x, 1280
  %40 = shl nuw nsw i32 %39, 1
  %.lhs.trunc115 = trunc nuw nsw i32 %39 to i16
  %41 = udiv i16 %.lhs.trunc115, 96
  %42 = zext nneg i16 %41 to i64
  %.lhs.trunc117 = trunc nuw nsw i32 %40 to i16
  %43 = urem i16 %.lhs.trunc117, 192
  %44 = zext nneg i16 %43 to i64
  %param_0.174415.5 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %42, i64 %44
  %param_0.174416.5 = load double, ptr addrspace(1) %param_0.174415.5, align 16, !invariant.load !303
  %add.3619.i64.5 = fadd double %add.3619.i64.1.4, %param_0.174416.5
  %.lhs.trunc119 = or disjoint i16 %.lhs.trunc117, 1
  %45 = urem i16 %.lhs.trunc119, 192
  %46 = zext nneg i16 %45 to i64
  %param_0.174415.1.5 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %42, i64 %46
  %param_0.174416.1.5 = load double, ptr addrspace(1) %param_0.174415.1.5, align 8, !invariant.load !303
  %add.3619.i64.1.5 = fadd double %add.3619.i64.5, %param_0.174416.1.5
  %47 = or disjoint i32 %thread.id.x, 1536
  %48 = shl nuw nsw i32 %47, 1
  %.lhs.trunc121 = trunc nuw nsw i32 %47 to i16
  %49 = udiv i16 %.lhs.trunc121, 96
  %50 = zext nneg i16 %49 to i64
  %.lhs.trunc123 = trunc nuw nsw i32 %48 to i16
  %51 = urem i16 %.lhs.trunc123, 192
  %52 = zext nneg i16 %51 to i64
  %param_0.174415.6 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %50, i64 %52
  %param_0.174416.6 = load double, ptr addrspace(1) %param_0.174415.6, align 16, !invariant.load !303
  %add.3619.i64.6 = fadd double %add.3619.i64.1.5, %param_0.174416.6
  %.lhs.trunc125 = or disjoint i16 %.lhs.trunc123, 1
  %53 = urem i16 %.lhs.trunc125, 192
  %54 = zext nneg i16 %53 to i64
  %param_0.174415.1.6 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %50, i64 %54
  %param_0.174416.1.6 = load double, ptr addrspace(1) %param_0.174415.1.6, align 8, !invariant.load !303
  %add.3619.i64.1.6 = fadd double %add.3619.i64.6, %param_0.174416.1.6
  %55 = or disjoint i32 %thread.id.x, 1792
  %56 = icmp ult i32 %55, 1920
  br i1 %56, label %loop3.loop_header10.preheader.7, label %x_in_tile-after.7

reduce-group-0-after:                             ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont, %reduction_write_output-true, %intra_warp_reduce_write-after
  ret void

loop3.loop_header10.preheader.7:                  ; preds = %entry
  %57 = shl nuw nsw i32 %55, 1
  %.lhs.trunc127 = trunc nuw nsw i32 %55 to i16
  %58 = udiv i16 %.lhs.trunc127, 96
  %59 = zext nneg i16 %58 to i64
  %.lhs.trunc129 = trunc nuw nsw i32 %57 to i16
  %60 = urem i16 %.lhs.trunc129, 192
  %61 = zext nneg i16 %60 to i64
  %param_0.174415.7 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %59, i64 %61
  %param_0.174416.7 = load double, ptr addrspace(1) %param_0.174415.7, align 16, !invariant.load !303
  %add.3619.i64.7 = fadd double %add.3619.i64.1.6, %param_0.174416.7
  %.lhs.trunc131 = or disjoint i16 %.lhs.trunc129, 1
  %62 = urem i16 %.lhs.trunc131, 192
  %63 = zext nneg i16 %62 to i64
  %param_0.174415.1.7 = getelementptr inbounds [20 x [192 x double]], ptr addrspace(1) %arg0133, i64 0, i64 %59, i64 %63
  %param_0.174416.1.7 = load double, ptr addrspace(1) %param_0.174415.1.7, align 8, !invariant.load !303
  %add.3619.i64.1.7 = fadd double %add.3619.i64.7, %param_0.174416.1.7
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %loop3.loop_header10.preheader.7, %entry
  %partial_reduction_result.1.7 = phi double [ %add.3619.i64.1.6, %entry ], [ %add.3619.i64.1.7, %loop3.loop_header10.preheader.7 ]
  %lane_id = and i32 %thread.id.x, 31
  %64 = bitcast double %partial_reduction_result.1.7 to <2 x i32>
  %65 = extractelement <2 x i32> %64, i64 0
  %66 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %65, i32 16, i32 31)
  %67 = insertelement <2 x i32> poison, i32 %66, i64 0
  %68 = extractelement <2 x i32> %64, i64 1
  %69 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %68, i32 16, i32 31)
  %70 = insertelement <2 x i32> %67, i32 %69, i64 1
  %71 = bitcast <2 x i32> %70 to double
  %add.3619.i = fadd double %partial_reduction_result.1.7, %71
  %72 = bitcast double %add.3619.i to <2 x i32>
  %73 = extractelement <2 x i32> %72, i64 0
  %74 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %73, i32 8, i32 31)
  %75 = insertelement <2 x i32> poison, i32 %74, i64 0
  %76 = extractelement <2 x i32> %72, i64 1
  %77 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %76, i32 8, i32 31)
  %78 = insertelement <2 x i32> %75, i32 %77, i64 1
  %79 = bitcast <2 x i32> %78 to double
  %add.3619.i60 = fadd double %add.3619.i, %79
  %80 = bitcast double %add.3619.i60 to <2 x i32>
  %81 = extractelement <2 x i32> %80, i64 0
  %82 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %81, i32 4, i32 31)
  %83 = insertelement <2 x i32> poison, i32 %82, i64 0
  %84 = extractelement <2 x i32> %80, i64 1
  %85 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %84, i32 4, i32 31)
  %86 = insertelement <2 x i32> %83, i32 %85, i64 1
  %87 = bitcast <2 x i32> %86 to double
  %add.3619.i61 = fadd double %add.3619.i60, %87
  %88 = bitcast double %add.3619.i61 to <2 x i32>
  %89 = extractelement <2 x i32> %88, i64 0
  %90 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %89, i32 2, i32 31)
  %91 = insertelement <2 x i32> poison, i32 %90, i64 0
  %92 = extractelement <2 x i32> %88, i64 1
  %93 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %92, i32 2, i32 31)
  %94 = insertelement <2 x i32> %91, i32 %93, i64 1
  %95 = bitcast <2 x i32> %94 to double
  %add.3619.i62 = fadd double %add.3619.i61, %95
  %96 = bitcast double %add.3619.i62 to <2 x i32>
  %97 = extractelement <2 x i32> %96, i64 0
  %98 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %97, i32 1, i32 31)
  %99 = extractelement <2 x i32> %96, i64 1
  %100 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %99, i32 1, i32 31)
  %101 = icmp eq i32 %lane_id, 0
  br i1 %101, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  tail call void @llvm.nvvm.barrier0()
  %102 = icmp ult i32 %thread.id.x, 32
  br i1 %102, label %inter_warp_reduce-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  %103 = lshr exact i32 %thread.id.x, 5
  %104 = zext nneg i32 %103 to i64
  %105 = getelementptr inbounds [1 x [8 x double]], ptr addrspace(3) @shared_cache6, i64 0, i64 0, i64 %104
  %106 = insertelement <2 x i32> poison, i32 %98, i64 0
  %107 = insertelement <2 x i32> %106, i32 %100, i64 1
  %108 = bitcast <2 x i32> %107 to double
  %add.3619.i63 = fadd double %add.3619.i62, %108
  store double %add.3619.i63, ptr addrspace(3) %105, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %109 = zext nneg i32 %lane_id to i64
  %110 = getelementptr inbounds [1 x [8 x double]], ptr addrspace(3) @shared_cache6, i64 0, i64 0, i64 %109
  %111 = icmp ult i32 %thread.id.x, 8
  br i1 %111, label %inter_warp_reduce-true.then71, label %inter_warp_reduce-true.cont70

inter_warp_reduce-true.then71:                    ; preds = %inter_warp_reduce-true
  %partial_reduction_result334950.then.val = load <2 x i32>, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont70

inter_warp_reduce-true.cont70:                    ; preds = %inter_warp_reduce-true, %inter_warp_reduce-true.then71
  %partial_reduction_result334950 = phi <2 x i32> [ %partial_reduction_result334950.then.val, %inter_warp_reduce-true.then71 ], [ zeroinitializer, %inter_warp_reduce-true ]
  %112 = icmp ult i32 %thread.id.x, 8
  %113 = extractelement <2 x i32> %partial_reduction_result334950, i64 0
  %114 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %113, i32 16, i32 31)
  %115 = insertelement <2 x i32> poison, i32 %114, i64 0
  %116 = extractelement <2 x i32> %partial_reduction_result334950, i64 1
  %117 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %116, i32 16, i32 31)
  %118 = insertelement <2 x i32> %115, i32 %117, i64 1
  %119 = bitcast <2 x i32> %118 to double
  br i1 %112, label %inter_warp_reduce-true.then, label %inter_warp_reduce-true.cont

inter_warp_reduce-true.then:                      ; preds = %inter_warp_reduce-true.cont70
  %.val54.then.val = load double, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont

inter_warp_reduce-true.cont:                      ; preds = %inter_warp_reduce-true.cont70, %inter_warp_reduce-true.then
  %.val54 = phi double [ %.val54.then.val, %inter_warp_reduce-true.then ], [ 0.000000e+00, %inter_warp_reduce-true.cont70 ]
  %120 = icmp ult i32 %thread.id.x, 8
  %add.3619.i65 = fadd double %.val54, %119
  br i1 %120, label %inter_warp_reduce-true.cont.then79, label %inter_warp_reduce-true.cont.cont78

inter_warp_reduce-true.cont.then79:               ; preds = %inter_warp_reduce-true.cont
  store double %add.3619.i65, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont.cont78

inter_warp_reduce-true.cont.cont78:               ; preds = %inter_warp_reduce-true.cont, %inter_warp_reduce-true.cont.then79
  %initial_value_addr.0 = phi double [ 0.000000e+00, %inter_warp_reduce-true.cont.then79 ], [ %add.3619.i65, %inter_warp_reduce-true.cont ]
  %121 = icmp ult i32 %thread.id.x, 8
  %122 = bitcast double %add.3619.i65 to <2 x i32>
  %123 = extractelement <2 x i32> %122, i64 0
  %124 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %123, i32 8, i32 31)
  %125 = insertelement <2 x i32> poison, i32 %124, i64 0
  %126 = extractelement <2 x i32> %122, i64 1
  %127 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %126, i32 8, i32 31)
  %128 = insertelement <2 x i32> %125, i32 %127, i64 1
  %129 = bitcast <2 x i32> %128 to double
  br i1 %121, label %inter_warp_reduce-true.cont.then, label %inter_warp_reduce-true.cont.cont

inter_warp_reduce-true.cont.then:                 ; preds = %inter_warp_reduce-true.cont.cont78
  %.val53.then.val = load double, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont.cont

inter_warp_reduce-true.cont.cont:                 ; preds = %inter_warp_reduce-true.cont.cont78, %inter_warp_reduce-true.cont.then
  %.val53 = phi double [ %.val53.then.val, %inter_warp_reduce-true.cont.then ], [ %initial_value_addr.0, %inter_warp_reduce-true.cont.cont78 ]
  %130 = icmp ult i32 %thread.id.x, 8
  %add.3619.i66 = fadd double %.val53, %129
  br i1 %130, label %inter_warp_reduce-true.cont.cont.then77, label %inter_warp_reduce-true.cont.cont.cont76

inter_warp_reduce-true.cont.cont.then77:          ; preds = %inter_warp_reduce-true.cont.cont
  store double %add.3619.i66, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont.cont.cont76

inter_warp_reduce-true.cont.cont.cont76:          ; preds = %inter_warp_reduce-true.cont.cont, %inter_warp_reduce-true.cont.cont.then77
  %initial_value_addr.1 = phi double [ %initial_value_addr.0, %inter_warp_reduce-true.cont.cont.then77 ], [ %add.3619.i66, %inter_warp_reduce-true.cont.cont ]
  %131 = icmp ult i32 %thread.id.x, 8
  %132 = bitcast double %add.3619.i66 to <2 x i32>
  %133 = extractelement <2 x i32> %132, i64 0
  %134 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %133, i32 4, i32 31)
  %135 = insertelement <2 x i32> poison, i32 %134, i64 0
  %136 = extractelement <2 x i32> %132, i64 1
  %137 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %136, i32 4, i32 31)
  %138 = insertelement <2 x i32> %135, i32 %137, i64 1
  %139 = bitcast <2 x i32> %138 to double
  br i1 %131, label %inter_warp_reduce-true.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont

inter_warp_reduce-true.cont.cont.then:            ; preds = %inter_warp_reduce-true.cont.cont.cont76
  %.val52.then.val = load double, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont:            ; preds = %inter_warp_reduce-true.cont.cont.cont76, %inter_warp_reduce-true.cont.cont.then
  %.val52 = phi double [ %.val52.then.val, %inter_warp_reduce-true.cont.cont.then ], [ %initial_value_addr.1, %inter_warp_reduce-true.cont.cont.cont76 ]
  %140 = icmp ult i32 %thread.id.x, 8
  %add.3619.i67 = fadd double %.val52, %139
  br i1 %140, label %inter_warp_reduce-true.cont.cont.cont.then75, label %inter_warp_reduce-true.cont.cont.cont.cont74

inter_warp_reduce-true.cont.cont.cont.then75:     ; preds = %inter_warp_reduce-true.cont.cont.cont
  store double %add.3619.i67, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont74

inter_warp_reduce-true.cont.cont.cont.cont74:     ; preds = %inter_warp_reduce-true.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.then75
  %initial_value_addr.2 = phi double [ %initial_value_addr.1, %inter_warp_reduce-true.cont.cont.cont.then75 ], [ %add.3619.i67, %inter_warp_reduce-true.cont.cont.cont ]
  %141 = icmp ult i32 %thread.id.x, 8
  %142 = bitcast double %add.3619.i67 to <2 x i32>
  %143 = extractelement <2 x i32> %142, i64 0
  %144 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %143, i32 2, i32 31)
  %145 = insertelement <2 x i32> poison, i32 %144, i64 0
  %146 = extractelement <2 x i32> %142, i64 1
  %147 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %146, i32 2, i32 31)
  %148 = insertelement <2 x i32> %145, i32 %147, i64 1
  %149 = bitcast <2 x i32> %148 to double
  br i1 %141, label %inter_warp_reduce-true.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.then:       ; preds = %inter_warp_reduce-true.cont.cont.cont.cont74
  %.val51.then.val = load double, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont:       ; preds = %inter_warp_reduce-true.cont.cont.cont.cont74, %inter_warp_reduce-true.cont.cont.cont.then
  %.val51 = phi double [ %.val51.then.val, %inter_warp_reduce-true.cont.cont.cont.then ], [ %initial_value_addr.2, %inter_warp_reduce-true.cont.cont.cont.cont74 ]
  %150 = icmp ult i32 %thread.id.x, 8
  %add.3619.i68 = fadd double %.val51, %149
  br i1 %150, label %inter_warp_reduce-true.cont.cont.cont.cont.then73, label %inter_warp_reduce-true.cont.cont.cont.cont.cont72

inter_warp_reduce-true.cont.cont.cont.cont.then73: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont
  store double %add.3619.i68, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont72

inter_warp_reduce-true.cont.cont.cont.cont.cont72: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.cont.then73
  %initial_value_addr.3 = phi double [ %initial_value_addr.2, %inter_warp_reduce-true.cont.cont.cont.cont.then73 ], [ %add.3619.i68, %inter_warp_reduce-true.cont.cont.cont.cont ]
  %151 = icmp ult i32 %thread.id.x, 8
  %152 = bitcast double %add.3619.i68 to <2 x i32>
  %153 = extractelement <2 x i32> %152, i64 0
  %154 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %153, i32 1, i32 31)
  %155 = insertelement <2 x i32> poison, i32 %154, i64 0
  %156 = extractelement <2 x i32> %152, i64 1
  %157 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %156, i32 1, i32 31)
  %158 = insertelement <2 x i32> %155, i32 %157, i64 1
  %159 = bitcast <2 x i32> %158 to double
  br i1 %151, label %inter_warp_reduce-true.cont.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.then:  ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont72
  %.val.then.val = load double, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont:  ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont72, %inter_warp_reduce-true.cont.cont.cont.cont.then
  %.val = phi double [ %.val.then.val, %inter_warp_reduce-true.cont.cont.cont.cont.then ], [ %initial_value_addr.3, %inter_warp_reduce-true.cont.cont.cont.cont.cont72 ]
  %160 = icmp ult i32 %thread.id.x, 8
  %add.3619.i69 = fadd double %.val, %159
  br i1 %160, label %inter_warp_reduce-true.cont.cont.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont
  store double %add.3619.i69, ptr addrspace(3) %110, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.cont.cont.then
  %161 = icmp eq i32 %thread.id.x, 0
  br i1 %161, label %reduction_write_output-true, label %reduce-group-0-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont
  store double %add.3619.i69, ptr addrspace(1) %arg1135, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_minimum_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg11) local_unnamed_addr #4 {
entry:
  %arg1193 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1091 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg989 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg887 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg785 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg683 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg581 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg479 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg377 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg275 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg173 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg071 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg071, align 128, !invariant.load !303
  %1 = load <2 x double>, ptr addrspace(1) %arg581, align 128, !invariant.load !303
  %2 = extractelement <2 x double> %1, i32 0
  %3 = extractelement <2 x double> %1, i32 1
  %add.3859.7.clone.1 = fadd double %2, 4.000000e+00
  %multiply.2952.7.clone.1 = fmul double %add.3859.7.clone.1, %add.3859.7.clone.1
  %multiply.2953.7.clone.1 = fmul double %multiply.2952.7.clone.1, 2.500000e-01
  %add.3866.5.clone.1 = fadd double %multiply.2953.7.clone.1, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1 = fmul double %add.3866.5.clone.1, 5.000000e-01
  %add.3859.7.clone.1.1 = fadd double %3, 4.000000e+00
  %multiply.2952.7.clone.1.1 = fmul double %add.3859.7.clone.1.1, %add.3859.7.clone.1.1
  %multiply.2953.7.clone.1.1 = fmul double %multiply.2952.7.clone.1.1, 2.500000e-01
  %add.3866.5.clone.1.1 = fadd double %multiply.2953.7.clone.1.1, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.1 = fmul double %add.3866.5.clone.1.1, 5.000000e-01
  %4 = getelementptr inbounds i8, ptr addrspace(1) %arg581, i64 16
  %5 = load <2 x double>, ptr addrspace(1) %4, align 16, !invariant.load !303
  %6 = extractelement <2 x double> %5, i32 0
  %7 = extractelement <2 x double> %5, i32 1
  %add.3859.7.clone.1.2 = fadd double %6, 4.000000e+00
  %multiply.2952.7.clone.1.2 = fmul double %add.3859.7.clone.1.2, %add.3859.7.clone.1.2
  %multiply.2953.7.clone.1.2 = fmul double %multiply.2952.7.clone.1.2, 2.500000e-01
  %add.3866.5.clone.1.2 = fadd double %multiply.2953.7.clone.1.2, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.2 = fmul double %add.3866.5.clone.1.2, 5.000000e-01
  %add.3859.7.clone.1.3 = fadd double %7, 4.000000e+00
  %multiply.2952.7.clone.1.3 = fmul double %add.3859.7.clone.1.3, %add.3859.7.clone.1.3
  %multiply.2953.7.clone.1.3 = fmul double %multiply.2952.7.clone.1.3, 2.500000e-01
  %add.3866.5.clone.1.3 = fadd double %multiply.2953.7.clone.1.3, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.3 = fmul double %add.3866.5.clone.1.3, 5.000000e-01
  %8 = getelementptr inbounds i8, ptr addrspace(1) %arg581, i64 32
  %9 = load <2 x double>, ptr addrspace(1) %8, align 32, !invariant.load !303
  %10 = extractelement <2 x double> %9, i32 0
  %11 = extractelement <2 x double> %9, i32 1
  %add.3859.7.clone.1.4 = fadd double %10, 4.000000e+00
  %multiply.2952.7.clone.1.4 = fmul double %add.3859.7.clone.1.4, %add.3859.7.clone.1.4
  %multiply.2953.7.clone.1.4 = fmul double %multiply.2952.7.clone.1.4, 2.500000e-01
  %add.3866.5.clone.1.4 = fadd double %multiply.2953.7.clone.1.4, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.4 = fmul double %add.3866.5.clone.1.4, 5.000000e-01
  %add.3859.7.clone.1.5 = fadd double %11, 4.000000e+00
  %multiply.2952.7.clone.1.5 = fmul double %add.3859.7.clone.1.5, %add.3859.7.clone.1.5
  %multiply.2953.7.clone.1.5 = fmul double %multiply.2952.7.clone.1.5, 2.500000e-01
  %add.3866.5.clone.1.5 = fadd double %multiply.2953.7.clone.1.5, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.5 = fmul double %add.3866.5.clone.1.5, 5.000000e-01
  %12 = getelementptr inbounds i8, ptr addrspace(1) %arg581, i64 48
  %13 = load <2 x double>, ptr addrspace(1) %12, align 16, !invariant.load !303
  %14 = extractelement <2 x double> %13, i32 0
  %15 = extractelement <2 x double> %13, i32 1
  %add.3859.7.clone.1.6 = fadd double %14, 4.000000e+00
  %multiply.2952.7.clone.1.6 = fmul double %add.3859.7.clone.1.6, %add.3859.7.clone.1.6
  %multiply.2953.7.clone.1.6 = fmul double %multiply.2952.7.clone.1.6, 2.500000e-01
  %add.3866.5.clone.1.6 = fadd double %multiply.2953.7.clone.1.6, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.6 = fmul double %add.3866.5.clone.1.6, 5.000000e-01
  %add.3859.7.clone.1.7 = fadd double %15, 4.000000e+00
  %multiply.2952.7.clone.1.7 = fmul double %add.3859.7.clone.1.7, %add.3859.7.clone.1.7
  %multiply.2953.7.clone.1.7 = fmul double %multiply.2952.7.clone.1.7, 2.500000e-01
  %add.3866.5.clone.1.7 = fadd double %multiply.2953.7.clone.1.7, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.7 = fmul double %add.3866.5.clone.1.7, 5.000000e-01
  %16 = getelementptr inbounds i8, ptr addrspace(1) %arg581, i64 64
  %17 = load <2 x double>, ptr addrspace(1) %16, align 64, !invariant.load !303
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %add.3859.7.clone.1.8 = fadd double %18, 4.000000e+00
  %multiply.2952.7.clone.1.8 = fmul double %add.3859.7.clone.1.8, %add.3859.7.clone.1.8
  %multiply.2953.7.clone.1.8 = fmul double %multiply.2952.7.clone.1.8, 2.500000e-01
  %add.3866.5.clone.1.8 = fadd double %multiply.2953.7.clone.1.8, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.8 = fmul double %add.3866.5.clone.1.8, 5.000000e-01
  %add.3859.7.clone.1.9 = fadd double %19, 4.000000e+00
  %multiply.2952.7.clone.1.9 = fmul double %add.3859.7.clone.1.9, %add.3859.7.clone.1.9
  %multiply.2953.7.clone.1.9 = fmul double %multiply.2952.7.clone.1.9, 2.500000e-01
  %add.3866.5.clone.1.9 = fadd double %multiply.2953.7.clone.1.9, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.9 = fmul double %add.3866.5.clone.1.9, 5.000000e-01
  %20 = getelementptr inbounds i8, ptr addrspace(1) %arg581, i64 80
  %21 = load <2 x double>, ptr addrspace(1) %20, align 16, !invariant.load !303
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  %add.3859.7.clone.1.10 = fadd double %22, 4.000000e+00
  %multiply.2952.7.clone.1.10 = fmul double %add.3859.7.clone.1.10, %add.3859.7.clone.1.10
  %multiply.2953.7.clone.1.10 = fmul double %multiply.2952.7.clone.1.10, 2.500000e-01
  %add.3866.5.clone.1.10 = fadd double %multiply.2953.7.clone.1.10, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.10 = fmul double %add.3866.5.clone.1.10, 5.000000e-01
  %add.3859.7.clone.1.11 = fadd double %23, 4.000000e+00
  %multiply.2952.7.clone.1.11 = fmul double %add.3859.7.clone.1.11, %add.3859.7.clone.1.11
  %multiply.2953.7.clone.1.11 = fmul double %multiply.2952.7.clone.1.11, 2.500000e-01
  %add.3866.5.clone.1.11 = fadd double %multiply.2953.7.clone.1.11, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.11 = fmul double %add.3866.5.clone.1.11, 5.000000e-01
  %24 = getelementptr inbounds i8, ptr addrspace(1) %arg581, i64 96
  %25 = load <2 x double>, ptr addrspace(1) %24, align 32, !invariant.load !303
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %add.3859.7.clone.1.12 = fadd double %26, 4.000000e+00
  %multiply.2952.7.clone.1.12 = fmul double %add.3859.7.clone.1.12, %add.3859.7.clone.1.12
  %multiply.2953.7.clone.1.12 = fmul double %multiply.2952.7.clone.1.12, 2.500000e-01
  %add.3866.5.clone.1.12 = fadd double %multiply.2953.7.clone.1.12, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.12 = fmul double %add.3866.5.clone.1.12, 5.000000e-01
  %add.3859.7.clone.1.13 = fadd double %27, 4.000000e+00
  %multiply.2952.7.clone.1.13 = fmul double %add.3859.7.clone.1.13, %add.3859.7.clone.1.13
  %multiply.2953.7.clone.1.13 = fmul double %multiply.2952.7.clone.1.13, 2.500000e-01
  %add.3866.5.clone.1.13 = fadd double %multiply.2953.7.clone.1.13, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.13 = fmul double %add.3866.5.clone.1.13, 5.000000e-01
  %28 = getelementptr inbounds i8, ptr addrspace(1) %arg581, i64 112
  %29 = load <2 x double>, ptr addrspace(1) %28, align 16, !invariant.load !303
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %add.3859.7.clone.1.14 = fadd double %30, 4.000000e+00
  %multiply.2952.7.clone.1.14 = fmul double %add.3859.7.clone.1.14, %add.3859.7.clone.1.14
  %multiply.2953.7.clone.1.14 = fmul double %multiply.2952.7.clone.1.14, 2.500000e-01
  %add.3866.5.clone.1.14 = fadd double %multiply.2953.7.clone.1.14, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.14 = fmul double %add.3866.5.clone.1.14, 5.000000e-01
  %add.3859.7.clone.1.15 = fadd double %31, 4.000000e+00
  %multiply.2952.7.clone.1.15 = fmul double %add.3859.7.clone.1.15, %add.3859.7.clone.1.15
  %multiply.2953.7.clone.1.15 = fmul double %multiply.2952.7.clone.1.15, 2.500000e-01
  %add.3866.5.clone.1.15 = fadd double %multiply.2953.7.clone.1.15, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.15 = fmul double %add.3866.5.clone.1.15, 5.000000e-01
  %32 = getelementptr inbounds i8, ptr addrspace(1) %arg581, i64 128
  %33 = load <2 x double>, ptr addrspace(1) %32, align 128, !invariant.load !303
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %add.3859.7.clone.1.16 = fadd double %34, 4.000000e+00
  %multiply.2952.7.clone.1.16 = fmul double %add.3859.7.clone.1.16, %add.3859.7.clone.1.16
  %multiply.2953.7.clone.1.16 = fmul double %multiply.2952.7.clone.1.16, 2.500000e-01
  %add.3866.5.clone.1.16 = fadd double %multiply.2953.7.clone.1.16, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.16 = fmul double %add.3866.5.clone.1.16, 5.000000e-01
  %add.3859.7.clone.1.17 = fadd double %35, 4.000000e+00
  %multiply.2952.7.clone.1.17 = fmul double %add.3859.7.clone.1.17, %add.3859.7.clone.1.17
  %multiply.2953.7.clone.1.17 = fmul double %multiply.2952.7.clone.1.17, 2.500000e-01
  %add.3866.5.clone.1.17 = fadd double %multiply.2953.7.clone.1.17, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.17 = fmul double %add.3866.5.clone.1.17, 5.000000e-01
  %36 = getelementptr inbounds i8, ptr addrspace(1) %arg581, i64 144
  %37 = load <2 x double>, ptr addrspace(1) %36, align 16, !invariant.load !303
  %38 = extractelement <2 x double> %37, i32 0
  %39 = extractelement <2 x double> %37, i32 1
  %add.3859.7.clone.1.18 = fadd double %38, 4.000000e+00
  %multiply.2952.7.clone.1.18 = fmul double %add.3859.7.clone.1.18, %add.3859.7.clone.1.18
  %multiply.2953.7.clone.1.18 = fmul double %multiply.2952.7.clone.1.18, 2.500000e-01
  %add.3866.5.clone.1.18 = fadd double %multiply.2953.7.clone.1.18, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.18 = fmul double %add.3866.5.clone.1.18, 5.000000e-01
  %add.3859.7.clone.1.19 = fadd double %39, 4.000000e+00
  %multiply.2952.7.clone.1.19 = fmul double %add.3859.7.clone.1.19, %add.3859.7.clone.1.19
  %multiply.2953.7.clone.1.19 = fmul double %multiply.2952.7.clone.1.19, 2.500000e-01
  %add.3866.5.clone.1.19 = fadd double %multiply.2953.7.clone.1.19, 0x4009CB1A63AF7C52
  %multiply.2954.3.clone.1.19 = fmul double %add.3866.5.clone.1.19, 5.000000e-01
  %40 = load <2 x double>, ptr addrspace(1) %arg479, align 128, !invariant.load !303
  %41 = extractelement <2 x double> %40, i32 0
  %42 = extractelement <2 x double> %40, i32 1
  %add.3851.7.clone.1 = fadd double %41, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1 = fmul double %add.3851.7.clone.1, %add.3851.7.clone.1
  %multiply.2956.7.clone.1 = fmul double %multiply.2955.7.clone.1, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1 = fadd double %multiply.2956.7.clone.1, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1 = fmul double %add.3867.5.clone.1, 5.000000e-01
  %add.3851.7.clone.1.1 = fadd double %42, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.1 = fmul double %add.3851.7.clone.1.1, %add.3851.7.clone.1.1
  %multiply.2956.7.clone.1.1 = fmul double %multiply.2955.7.clone.1.1, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.1 = fadd double %multiply.2956.7.clone.1.1, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.1 = fmul double %add.3867.5.clone.1.1, 5.000000e-01
  %43 = getelementptr inbounds i8, ptr addrspace(1) %arg479, i64 16
  %44 = load <2 x double>, ptr addrspace(1) %43, align 16, !invariant.load !303
  %45 = extractelement <2 x double> %44, i32 0
  %46 = extractelement <2 x double> %44, i32 1
  %add.3851.7.clone.1.2 = fadd double %45, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.2 = fmul double %add.3851.7.clone.1.2, %add.3851.7.clone.1.2
  %multiply.2956.7.clone.1.2 = fmul double %multiply.2955.7.clone.1.2, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.2 = fadd double %multiply.2956.7.clone.1.2, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.2 = fmul double %add.3867.5.clone.1.2, 5.000000e-01
  %add.3851.7.clone.1.3 = fadd double %46, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.3 = fmul double %add.3851.7.clone.1.3, %add.3851.7.clone.1.3
  %multiply.2956.7.clone.1.3 = fmul double %multiply.2955.7.clone.1.3, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.3 = fadd double %multiply.2956.7.clone.1.3, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.3 = fmul double %add.3867.5.clone.1.3, 5.000000e-01
  %47 = getelementptr inbounds i8, ptr addrspace(1) %arg479, i64 32
  %48 = load <2 x double>, ptr addrspace(1) %47, align 32, !invariant.load !303
  %49 = extractelement <2 x double> %48, i32 0
  %50 = extractelement <2 x double> %48, i32 1
  %add.3851.7.clone.1.4 = fadd double %49, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.4 = fmul double %add.3851.7.clone.1.4, %add.3851.7.clone.1.4
  %multiply.2956.7.clone.1.4 = fmul double %multiply.2955.7.clone.1.4, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.4 = fadd double %multiply.2956.7.clone.1.4, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.4 = fmul double %add.3867.5.clone.1.4, 5.000000e-01
  %add.3851.7.clone.1.5 = fadd double %50, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.5 = fmul double %add.3851.7.clone.1.5, %add.3851.7.clone.1.5
  %multiply.2956.7.clone.1.5 = fmul double %multiply.2955.7.clone.1.5, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.5 = fadd double %multiply.2956.7.clone.1.5, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.5 = fmul double %add.3867.5.clone.1.5, 5.000000e-01
  %51 = getelementptr inbounds i8, ptr addrspace(1) %arg479, i64 48
  %52 = load <2 x double>, ptr addrspace(1) %51, align 16, !invariant.load !303
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %add.3851.7.clone.1.6 = fadd double %53, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.6 = fmul double %add.3851.7.clone.1.6, %add.3851.7.clone.1.6
  %multiply.2956.7.clone.1.6 = fmul double %multiply.2955.7.clone.1.6, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.6 = fadd double %multiply.2956.7.clone.1.6, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.6 = fmul double %add.3867.5.clone.1.6, 5.000000e-01
  %add.3851.7.clone.1.7 = fadd double %54, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.7 = fmul double %add.3851.7.clone.1.7, %add.3851.7.clone.1.7
  %multiply.2956.7.clone.1.7 = fmul double %multiply.2955.7.clone.1.7, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.7 = fadd double %multiply.2956.7.clone.1.7, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.7 = fmul double %add.3867.5.clone.1.7, 5.000000e-01
  %55 = getelementptr inbounds i8, ptr addrspace(1) %arg479, i64 64
  %56 = load <2 x double>, ptr addrspace(1) %55, align 64, !invariant.load !303
  %57 = extractelement <2 x double> %56, i32 0
  %58 = extractelement <2 x double> %56, i32 1
  %add.3851.7.clone.1.8 = fadd double %57, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.8 = fmul double %add.3851.7.clone.1.8, %add.3851.7.clone.1.8
  %multiply.2956.7.clone.1.8 = fmul double %multiply.2955.7.clone.1.8, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.8 = fadd double %multiply.2956.7.clone.1.8, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.8 = fmul double %add.3867.5.clone.1.8, 5.000000e-01
  %add.3851.7.clone.1.9 = fadd double %58, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.9 = fmul double %add.3851.7.clone.1.9, %add.3851.7.clone.1.9
  %multiply.2956.7.clone.1.9 = fmul double %multiply.2955.7.clone.1.9, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.9 = fadd double %multiply.2956.7.clone.1.9, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.9 = fmul double %add.3867.5.clone.1.9, 5.000000e-01
  %59 = getelementptr inbounds i8, ptr addrspace(1) %arg479, i64 80
  %60 = load <2 x double>, ptr addrspace(1) %59, align 16, !invariant.load !303
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %add.3851.7.clone.1.10 = fadd double %61, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.10 = fmul double %add.3851.7.clone.1.10, %add.3851.7.clone.1.10
  %multiply.2956.7.clone.1.10 = fmul double %multiply.2955.7.clone.1.10, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.10 = fadd double %multiply.2956.7.clone.1.10, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.10 = fmul double %add.3867.5.clone.1.10, 5.000000e-01
  %add.3851.7.clone.1.11 = fadd double %62, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.11 = fmul double %add.3851.7.clone.1.11, %add.3851.7.clone.1.11
  %multiply.2956.7.clone.1.11 = fmul double %multiply.2955.7.clone.1.11, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.11 = fadd double %multiply.2956.7.clone.1.11, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.11 = fmul double %add.3867.5.clone.1.11, 5.000000e-01
  %63 = getelementptr inbounds i8, ptr addrspace(1) %arg479, i64 96
  %64 = load <2 x double>, ptr addrspace(1) %63, align 32, !invariant.load !303
  %65 = extractelement <2 x double> %64, i32 0
  %66 = extractelement <2 x double> %64, i32 1
  %add.3851.7.clone.1.12 = fadd double %65, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.12 = fmul double %add.3851.7.clone.1.12, %add.3851.7.clone.1.12
  %multiply.2956.7.clone.1.12 = fmul double %multiply.2955.7.clone.1.12, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.12 = fadd double %multiply.2956.7.clone.1.12, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.12 = fmul double %add.3867.5.clone.1.12, 5.000000e-01
  %add.3851.7.clone.1.13 = fadd double %66, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.13 = fmul double %add.3851.7.clone.1.13, %add.3851.7.clone.1.13
  %multiply.2956.7.clone.1.13 = fmul double %multiply.2955.7.clone.1.13, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.13 = fadd double %multiply.2956.7.clone.1.13, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.13 = fmul double %add.3867.5.clone.1.13, 5.000000e-01
  %67 = getelementptr inbounds i8, ptr addrspace(1) %arg479, i64 112
  %68 = load <2 x double>, ptr addrspace(1) %67, align 16, !invariant.load !303
  %69 = extractelement <2 x double> %68, i32 0
  %70 = extractelement <2 x double> %68, i32 1
  %add.3851.7.clone.1.14 = fadd double %69, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.14 = fmul double %add.3851.7.clone.1.14, %add.3851.7.clone.1.14
  %multiply.2956.7.clone.1.14 = fmul double %multiply.2955.7.clone.1.14, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.14 = fadd double %multiply.2956.7.clone.1.14, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.14 = fmul double %add.3867.5.clone.1.14, 5.000000e-01
  %add.3851.7.clone.1.15 = fadd double %70, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.15 = fmul double %add.3851.7.clone.1.15, %add.3851.7.clone.1.15
  %multiply.2956.7.clone.1.15 = fmul double %multiply.2955.7.clone.1.15, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.15 = fadd double %multiply.2956.7.clone.1.15, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.15 = fmul double %add.3867.5.clone.1.15, 5.000000e-01
  %71 = getelementptr inbounds i8, ptr addrspace(1) %arg479, i64 128
  %72 = load <2 x double>, ptr addrspace(1) %71, align 128, !invariant.load !303
  %73 = extractelement <2 x double> %72, i32 0
  %74 = extractelement <2 x double> %72, i32 1
  %add.3851.7.clone.1.16 = fadd double %73, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.16 = fmul double %add.3851.7.clone.1.16, %add.3851.7.clone.1.16
  %multiply.2956.7.clone.1.16 = fmul double %multiply.2955.7.clone.1.16, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.16 = fadd double %multiply.2956.7.clone.1.16, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.16 = fmul double %add.3867.5.clone.1.16, 5.000000e-01
  %add.3851.7.clone.1.17 = fadd double %74, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.17 = fmul double %add.3851.7.clone.1.17, %add.3851.7.clone.1.17
  %multiply.2956.7.clone.1.17 = fmul double %multiply.2955.7.clone.1.17, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.17 = fadd double %multiply.2956.7.clone.1.17, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.17 = fmul double %add.3867.5.clone.1.17, 5.000000e-01
  %75 = getelementptr inbounds i8, ptr addrspace(1) %arg479, i64 144
  %76 = load <2 x double>, ptr addrspace(1) %75, align 16, !invariant.load !303
  %77 = extractelement <2 x double> %76, i32 0
  %78 = extractelement <2 x double> %76, i32 1
  %add.3851.7.clone.1.18 = fadd double %77, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.18 = fmul double %add.3851.7.clone.1.18, %add.3851.7.clone.1.18
  %multiply.2956.7.clone.1.18 = fmul double %multiply.2955.7.clone.1.18, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.18 = fadd double %multiply.2956.7.clone.1.18, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.18 = fmul double %add.3867.5.clone.1.18, 5.000000e-01
  %add.3851.7.clone.1.19 = fadd double %78, 0xBFF62E42FEFA39EF
  %multiply.2955.7.clone.1.19 = fmul double %add.3851.7.clone.1.19, %add.3851.7.clone.1.19
  %multiply.2956.7.clone.1.19 = fmul double %multiply.2955.7.clone.1.19, 0x3FFC71C71C71C71C
  %add.3867.5.clone.1.19 = fadd double %multiply.2956.7.clone.1.19, 0x3FF43340BFCA50EB
  %multiply.2957.3.clone.1.19 = fmul double %add.3867.5.clone.1.19, 5.000000e-01
  %79 = fsub double 0.000000e+00, %multiply.2954.3.clone.1
  %80 = fsub double %79, %multiply.2954.3.clone.1.1
  %81 = fsub double %80, %multiply.2954.3.clone.1.2
  %82 = fsub double %81, %multiply.2954.3.clone.1.3
  %83 = fsub double %82, %multiply.2954.3.clone.1.4
  %84 = fsub double %83, %multiply.2954.3.clone.1.5
  %85 = fsub double %84, %multiply.2954.3.clone.1.6
  %86 = fsub double %85, %multiply.2954.3.clone.1.7
  %87 = fsub double %86, %multiply.2954.3.clone.1.8
  %88 = fsub double %87, %multiply.2954.3.clone.1.9
  %89 = fsub double %88, %multiply.2954.3.clone.1.10
  %90 = fsub double %89, %multiply.2954.3.clone.1.11
  %91 = fsub double %90, %multiply.2954.3.clone.1.12
  %92 = fsub double %91, %multiply.2954.3.clone.1.13
  %93 = fsub double %92, %multiply.2954.3.clone.1.14
  %94 = fsub double %93, %multiply.2954.3.clone.1.15
  %95 = fsub double %94, %multiply.2954.3.clone.1.16
  %96 = fsub double %95, %multiply.2954.3.clone.1.17
  %97 = fsub double %96, %multiply.2954.3.clone.1.18
  %98 = load <2 x double>, ptr addrspace(1) %arg683, align 128, !invariant.load !303
  %99 = extractelement <2 x double> %98, i32 0
  %100 = extractelement <2 x double> %98, i32 1
  %multiply.2958.5.clone.1 = fmul double %99, %99
  %add.3870.5.clone.1 = fadd double %multiply.2958.5.clone.1, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1 = fmul double %add.3870.5.clone.1, 5.000000e-01
  %multiply.2958.5.clone.1.1 = fmul double %100, %100
  %add.3870.5.clone.1.1 = fadd double %multiply.2958.5.clone.1.1, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.1 = fmul double %add.3870.5.clone.1.1, 5.000000e-01
  %101 = getelementptr inbounds i8, ptr addrspace(1) %arg683, i64 16
  %102 = load <2 x double>, ptr addrspace(1) %101, align 16, !invariant.load !303
  %103 = extractelement <2 x double> %102, i32 0
  %104 = extractelement <2 x double> %102, i32 1
  %multiply.2958.5.clone.1.2 = fmul double %103, %103
  %add.3870.5.clone.1.2 = fadd double %multiply.2958.5.clone.1.2, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.2 = fmul double %add.3870.5.clone.1.2, 5.000000e-01
  %multiply.2958.5.clone.1.3 = fmul double %104, %104
  %add.3870.5.clone.1.3 = fadd double %multiply.2958.5.clone.1.3, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.3 = fmul double %add.3870.5.clone.1.3, 5.000000e-01
  %105 = getelementptr inbounds i8, ptr addrspace(1) %arg683, i64 32
  %106 = load <2 x double>, ptr addrspace(1) %105, align 32, !invariant.load !303
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %multiply.2958.5.clone.1.4 = fmul double %107, %107
  %add.3870.5.clone.1.4 = fadd double %multiply.2958.5.clone.1.4, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.4 = fmul double %add.3870.5.clone.1.4, 5.000000e-01
  %multiply.2958.5.clone.1.5 = fmul double %108, %108
  %add.3870.5.clone.1.5 = fadd double %multiply.2958.5.clone.1.5, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.5 = fmul double %add.3870.5.clone.1.5, 5.000000e-01
  %109 = getelementptr inbounds i8, ptr addrspace(1) %arg683, i64 48
  %110 = load <2 x double>, ptr addrspace(1) %109, align 16, !invariant.load !303
  %111 = extractelement <2 x double> %110, i32 0
  %112 = extractelement <2 x double> %110, i32 1
  %multiply.2958.5.clone.1.6 = fmul double %111, %111
  %add.3870.5.clone.1.6 = fadd double %multiply.2958.5.clone.1.6, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.6 = fmul double %add.3870.5.clone.1.6, 5.000000e-01
  %multiply.2958.5.clone.1.7 = fmul double %112, %112
  %add.3870.5.clone.1.7 = fadd double %multiply.2958.5.clone.1.7, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.7 = fmul double %add.3870.5.clone.1.7, 5.000000e-01
  %113 = getelementptr inbounds i8, ptr addrspace(1) %arg683, i64 64
  %114 = load <2 x double>, ptr addrspace(1) %113, align 64, !invariant.load !303
  %115 = extractelement <2 x double> %114, i32 0
  %116 = extractelement <2 x double> %114, i32 1
  %multiply.2958.5.clone.1.8 = fmul double %115, %115
  %add.3870.5.clone.1.8 = fadd double %multiply.2958.5.clone.1.8, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.8 = fmul double %add.3870.5.clone.1.8, 5.000000e-01
  %multiply.2958.5.clone.1.9 = fmul double %116, %116
  %add.3870.5.clone.1.9 = fadd double %multiply.2958.5.clone.1.9, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.9 = fmul double %add.3870.5.clone.1.9, 5.000000e-01
  %117 = getelementptr inbounds i8, ptr addrspace(1) %arg683, i64 80
  %118 = load <2 x double>, ptr addrspace(1) %117, align 16, !invariant.load !303
  %119 = extractelement <2 x double> %118, i32 0
  %120 = extractelement <2 x double> %118, i32 1
  %multiply.2958.5.clone.1.10 = fmul double %119, %119
  %add.3870.5.clone.1.10 = fadd double %multiply.2958.5.clone.1.10, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.10 = fmul double %add.3870.5.clone.1.10, 5.000000e-01
  %multiply.2958.5.clone.1.11 = fmul double %120, %120
  %add.3870.5.clone.1.11 = fadd double %multiply.2958.5.clone.1.11, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.11 = fmul double %add.3870.5.clone.1.11, 5.000000e-01
  %121 = getelementptr inbounds i8, ptr addrspace(1) %arg683, i64 96
  %122 = load <2 x double>, ptr addrspace(1) %121, align 32, !invariant.load !303
  %123 = extractelement <2 x double> %122, i32 0
  %124 = extractelement <2 x double> %122, i32 1
  %multiply.2958.5.clone.1.12 = fmul double %123, %123
  %add.3870.5.clone.1.12 = fadd double %multiply.2958.5.clone.1.12, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.12 = fmul double %add.3870.5.clone.1.12, 5.000000e-01
  %multiply.2958.5.clone.1.13 = fmul double %124, %124
  %add.3870.5.clone.1.13 = fadd double %multiply.2958.5.clone.1.13, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.13 = fmul double %add.3870.5.clone.1.13, 5.000000e-01
  %125 = getelementptr inbounds i8, ptr addrspace(1) %arg683, i64 112
  %126 = load <2 x double>, ptr addrspace(1) %125, align 16, !invariant.load !303
  %127 = extractelement <2 x double> %126, i32 0
  %128 = extractelement <2 x double> %126, i32 1
  %multiply.2958.5.clone.1.14 = fmul double %127, %127
  %add.3870.5.clone.1.14 = fadd double %multiply.2958.5.clone.1.14, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.14 = fmul double %add.3870.5.clone.1.14, 5.000000e-01
  %multiply.2958.5.clone.1.15 = fmul double %128, %128
  %add.3870.5.clone.1.15 = fadd double %multiply.2958.5.clone.1.15, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.15 = fmul double %add.3870.5.clone.1.15, 5.000000e-01
  %129 = getelementptr inbounds i8, ptr addrspace(1) %arg683, i64 128
  %130 = load <2 x double>, ptr addrspace(1) %129, align 128, !invariant.load !303
  %131 = extractelement <2 x double> %130, i32 0
  %132 = extractelement <2 x double> %130, i32 1
  %multiply.2958.5.clone.1.16 = fmul double %131, %131
  %add.3870.5.clone.1.16 = fadd double %multiply.2958.5.clone.1.16, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.16 = fmul double %add.3870.5.clone.1.16, 5.000000e-01
  %multiply.2958.5.clone.1.17 = fmul double %132, %132
  %add.3870.5.clone.1.17 = fadd double %multiply.2958.5.clone.1.17, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.17 = fmul double %add.3870.5.clone.1.17, 5.000000e-01
  %133 = getelementptr inbounds i8, ptr addrspace(1) %arg683, i64 144
  %134 = load <2 x double>, ptr addrspace(1) %133, align 16, !invariant.load !303
  %135 = extractelement <2 x double> %134, i32 0
  %136 = extractelement <2 x double> %134, i32 1
  %multiply.2958.5.clone.1.18 = fmul double %135, %135
  %add.3870.5.clone.1.18 = fadd double %multiply.2958.5.clone.1.18, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.18 = fmul double %add.3870.5.clone.1.18, 5.000000e-01
  %multiply.2958.5.clone.1.19 = fmul double %136, %136
  %add.3870.5.clone.1.19 = fadd double %multiply.2958.5.clone.1.19, 0x3FFD67F1C864BEB4
  %multiply.2959.3.clone.1.19 = fmul double %add.3870.5.clone.1.19, 5.000000e-01
  %137 = fsub double 0.000000e+00, %multiply.2957.3.clone.1
  %138 = fsub double %137, %multiply.2957.3.clone.1.1
  %139 = fsub double %138, %multiply.2957.3.clone.1.2
  %140 = fsub double %139, %multiply.2957.3.clone.1.3
  %141 = fsub double %140, %multiply.2957.3.clone.1.4
  %142 = fsub double %141, %multiply.2957.3.clone.1.5
  %143 = fsub double %142, %multiply.2957.3.clone.1.6
  %144 = fsub double %143, %multiply.2957.3.clone.1.7
  %145 = fsub double %144, %multiply.2957.3.clone.1.8
  %146 = fsub double %145, %multiply.2957.3.clone.1.9
  %147 = fsub double %146, %multiply.2957.3.clone.1.10
  %148 = fsub double %147, %multiply.2957.3.clone.1.11
  %149 = fsub double %148, %multiply.2957.3.clone.1.12
  %150 = fsub double %149, %multiply.2957.3.clone.1.13
  %151 = fsub double %150, %multiply.2957.3.clone.1.14
  %152 = fsub double %151, %multiply.2957.3.clone.1.15
  %153 = fsub double %152, %multiply.2957.3.clone.1.16
  %154 = fsub double %153, %multiply.2957.3.clone.1.17
  %155 = fsub double %154, %multiply.2957.3.clone.1.18
  %156 = fsub double %155, %multiply.2957.3.clone.1.19
  %157 = load <2 x double>, ptr addrspace(1) %arg785, align 128, !invariant.load !303
  %158 = extractelement <2 x double> %157, i32 0
  %159 = extractelement <2 x double> %157, i32 1
  %add.3862.7.clone.1 = fadd double %158, 6.000000e+00
  %multiply.2960.7.clone.1 = fmul double %add.3862.7.clone.1, %add.3862.7.clone.1
  %multiply.2961.7.clone.1 = fmul double %multiply.2960.7.clone.1, 2.500000e-01
  %add.3872.5.clone.1 = fadd double %multiply.2961.7.clone.1, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1 = fmul double %add.3872.5.clone.1, 5.000000e-01
  %add.3862.7.clone.1.1 = fadd double %159, 6.000000e+00
  %multiply.2960.7.clone.1.1 = fmul double %add.3862.7.clone.1.1, %add.3862.7.clone.1.1
  %multiply.2961.7.clone.1.1 = fmul double %multiply.2960.7.clone.1.1, 2.500000e-01
  %add.3872.5.clone.1.1 = fadd double %multiply.2961.7.clone.1.1, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.1 = fmul double %add.3872.5.clone.1.1, 5.000000e-01
  %160 = getelementptr inbounds i8, ptr addrspace(1) %arg785, i64 16
  %161 = load <2 x double>, ptr addrspace(1) %160, align 16, !invariant.load !303
  %162 = extractelement <2 x double> %161, i32 0
  %163 = extractelement <2 x double> %161, i32 1
  %add.3862.7.clone.1.2 = fadd double %162, 6.000000e+00
  %multiply.2960.7.clone.1.2 = fmul double %add.3862.7.clone.1.2, %add.3862.7.clone.1.2
  %multiply.2961.7.clone.1.2 = fmul double %multiply.2960.7.clone.1.2, 2.500000e-01
  %add.3872.5.clone.1.2 = fadd double %multiply.2961.7.clone.1.2, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.2 = fmul double %add.3872.5.clone.1.2, 5.000000e-01
  %add.3862.7.clone.1.3 = fadd double %163, 6.000000e+00
  %multiply.2960.7.clone.1.3 = fmul double %add.3862.7.clone.1.3, %add.3862.7.clone.1.3
  %multiply.2961.7.clone.1.3 = fmul double %multiply.2960.7.clone.1.3, 2.500000e-01
  %add.3872.5.clone.1.3 = fadd double %multiply.2961.7.clone.1.3, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.3 = fmul double %add.3872.5.clone.1.3, 5.000000e-01
  %164 = getelementptr inbounds i8, ptr addrspace(1) %arg785, i64 32
  %165 = load <2 x double>, ptr addrspace(1) %164, align 32, !invariant.load !303
  %166 = extractelement <2 x double> %165, i32 0
  %167 = extractelement <2 x double> %165, i32 1
  %add.3862.7.clone.1.4 = fadd double %166, 6.000000e+00
  %multiply.2960.7.clone.1.4 = fmul double %add.3862.7.clone.1.4, %add.3862.7.clone.1.4
  %multiply.2961.7.clone.1.4 = fmul double %multiply.2960.7.clone.1.4, 2.500000e-01
  %add.3872.5.clone.1.4 = fadd double %multiply.2961.7.clone.1.4, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.4 = fmul double %add.3872.5.clone.1.4, 5.000000e-01
  %add.3862.7.clone.1.5 = fadd double %167, 6.000000e+00
  %multiply.2960.7.clone.1.5 = fmul double %add.3862.7.clone.1.5, %add.3862.7.clone.1.5
  %multiply.2961.7.clone.1.5 = fmul double %multiply.2960.7.clone.1.5, 2.500000e-01
  %add.3872.5.clone.1.5 = fadd double %multiply.2961.7.clone.1.5, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.5 = fmul double %add.3872.5.clone.1.5, 5.000000e-01
  %168 = getelementptr inbounds i8, ptr addrspace(1) %arg785, i64 48
  %169 = load <2 x double>, ptr addrspace(1) %168, align 16, !invariant.load !303
  %170 = extractelement <2 x double> %169, i32 0
  %171 = extractelement <2 x double> %169, i32 1
  %add.3862.7.clone.1.6 = fadd double %170, 6.000000e+00
  %multiply.2960.7.clone.1.6 = fmul double %add.3862.7.clone.1.6, %add.3862.7.clone.1.6
  %multiply.2961.7.clone.1.6 = fmul double %multiply.2960.7.clone.1.6, 2.500000e-01
  %add.3872.5.clone.1.6 = fadd double %multiply.2961.7.clone.1.6, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.6 = fmul double %add.3872.5.clone.1.6, 5.000000e-01
  %add.3862.7.clone.1.7 = fadd double %171, 6.000000e+00
  %multiply.2960.7.clone.1.7 = fmul double %add.3862.7.clone.1.7, %add.3862.7.clone.1.7
  %multiply.2961.7.clone.1.7 = fmul double %multiply.2960.7.clone.1.7, 2.500000e-01
  %add.3872.5.clone.1.7 = fadd double %multiply.2961.7.clone.1.7, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.7 = fmul double %add.3872.5.clone.1.7, 5.000000e-01
  %172 = getelementptr inbounds i8, ptr addrspace(1) %arg785, i64 64
  %173 = load <2 x double>, ptr addrspace(1) %172, align 64, !invariant.load !303
  %174 = extractelement <2 x double> %173, i32 0
  %175 = extractelement <2 x double> %173, i32 1
  %add.3862.7.clone.1.8 = fadd double %174, 6.000000e+00
  %multiply.2960.7.clone.1.8 = fmul double %add.3862.7.clone.1.8, %add.3862.7.clone.1.8
  %multiply.2961.7.clone.1.8 = fmul double %multiply.2960.7.clone.1.8, 2.500000e-01
  %add.3872.5.clone.1.8 = fadd double %multiply.2961.7.clone.1.8, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.8 = fmul double %add.3872.5.clone.1.8, 5.000000e-01
  %add.3862.7.clone.1.9 = fadd double %175, 6.000000e+00
  %multiply.2960.7.clone.1.9 = fmul double %add.3862.7.clone.1.9, %add.3862.7.clone.1.9
  %multiply.2961.7.clone.1.9 = fmul double %multiply.2960.7.clone.1.9, 2.500000e-01
  %add.3872.5.clone.1.9 = fadd double %multiply.2961.7.clone.1.9, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.9 = fmul double %add.3872.5.clone.1.9, 5.000000e-01
  %176 = getelementptr inbounds i8, ptr addrspace(1) %arg785, i64 80
  %177 = load <2 x double>, ptr addrspace(1) %176, align 16, !invariant.load !303
  %178 = extractelement <2 x double> %177, i32 0
  %179 = extractelement <2 x double> %177, i32 1
  %add.3862.7.clone.1.10 = fadd double %178, 6.000000e+00
  %multiply.2960.7.clone.1.10 = fmul double %add.3862.7.clone.1.10, %add.3862.7.clone.1.10
  %multiply.2961.7.clone.1.10 = fmul double %multiply.2960.7.clone.1.10, 2.500000e-01
  %add.3872.5.clone.1.10 = fadd double %multiply.2961.7.clone.1.10, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.10 = fmul double %add.3872.5.clone.1.10, 5.000000e-01
  %add.3862.7.clone.1.11 = fadd double %179, 6.000000e+00
  %multiply.2960.7.clone.1.11 = fmul double %add.3862.7.clone.1.11, %add.3862.7.clone.1.11
  %multiply.2961.7.clone.1.11 = fmul double %multiply.2960.7.clone.1.11, 2.500000e-01
  %add.3872.5.clone.1.11 = fadd double %multiply.2961.7.clone.1.11, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.11 = fmul double %add.3872.5.clone.1.11, 5.000000e-01
  %180 = getelementptr inbounds i8, ptr addrspace(1) %arg785, i64 96
  %181 = load <2 x double>, ptr addrspace(1) %180, align 32, !invariant.load !303
  %182 = extractelement <2 x double> %181, i32 0
  %183 = extractelement <2 x double> %181, i32 1
  %add.3862.7.clone.1.12 = fadd double %182, 6.000000e+00
  %multiply.2960.7.clone.1.12 = fmul double %add.3862.7.clone.1.12, %add.3862.7.clone.1.12
  %multiply.2961.7.clone.1.12 = fmul double %multiply.2960.7.clone.1.12, 2.500000e-01
  %add.3872.5.clone.1.12 = fadd double %multiply.2961.7.clone.1.12, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.12 = fmul double %add.3872.5.clone.1.12, 5.000000e-01
  %add.3862.7.clone.1.13 = fadd double %183, 6.000000e+00
  %multiply.2960.7.clone.1.13 = fmul double %add.3862.7.clone.1.13, %add.3862.7.clone.1.13
  %multiply.2961.7.clone.1.13 = fmul double %multiply.2960.7.clone.1.13, 2.500000e-01
  %add.3872.5.clone.1.13 = fadd double %multiply.2961.7.clone.1.13, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.13 = fmul double %add.3872.5.clone.1.13, 5.000000e-01
  %184 = getelementptr inbounds i8, ptr addrspace(1) %arg785, i64 112
  %185 = load <2 x double>, ptr addrspace(1) %184, align 16, !invariant.load !303
  %186 = extractelement <2 x double> %185, i32 0
  %187 = extractelement <2 x double> %185, i32 1
  %add.3862.7.clone.1.14 = fadd double %186, 6.000000e+00
  %multiply.2960.7.clone.1.14 = fmul double %add.3862.7.clone.1.14, %add.3862.7.clone.1.14
  %multiply.2961.7.clone.1.14 = fmul double %multiply.2960.7.clone.1.14, 2.500000e-01
  %add.3872.5.clone.1.14 = fadd double %multiply.2961.7.clone.1.14, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.14 = fmul double %add.3872.5.clone.1.14, 5.000000e-01
  %add.3862.7.clone.1.15 = fadd double %187, 6.000000e+00
  %multiply.2960.7.clone.1.15 = fmul double %add.3862.7.clone.1.15, %add.3862.7.clone.1.15
  %multiply.2961.7.clone.1.15 = fmul double %multiply.2960.7.clone.1.15, 2.500000e-01
  %add.3872.5.clone.1.15 = fadd double %multiply.2961.7.clone.1.15, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.15 = fmul double %add.3872.5.clone.1.15, 5.000000e-01
  %188 = getelementptr inbounds i8, ptr addrspace(1) %arg785, i64 128
  %189 = load <2 x double>, ptr addrspace(1) %188, align 128, !invariant.load !303
  %190 = extractelement <2 x double> %189, i32 0
  %191 = extractelement <2 x double> %189, i32 1
  %add.3862.7.clone.1.16 = fadd double %190, 6.000000e+00
  %multiply.2960.7.clone.1.16 = fmul double %add.3862.7.clone.1.16, %add.3862.7.clone.1.16
  %multiply.2961.7.clone.1.16 = fmul double %multiply.2960.7.clone.1.16, 2.500000e-01
  %add.3872.5.clone.1.16 = fadd double %multiply.2961.7.clone.1.16, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.16 = fmul double %add.3872.5.clone.1.16, 5.000000e-01
  %add.3862.7.clone.1.17 = fadd double %191, 6.000000e+00
  %multiply.2960.7.clone.1.17 = fmul double %add.3862.7.clone.1.17, %add.3862.7.clone.1.17
  %multiply.2961.7.clone.1.17 = fmul double %multiply.2960.7.clone.1.17, 2.500000e-01
  %add.3872.5.clone.1.17 = fadd double %multiply.2961.7.clone.1.17, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.17 = fmul double %add.3872.5.clone.1.17, 5.000000e-01
  %192 = getelementptr inbounds i8, ptr addrspace(1) %arg785, i64 144
  %193 = load <2 x double>, ptr addrspace(1) %192, align 16, !invariant.load !303
  %194 = extractelement <2 x double> %193, i32 0
  %195 = extractelement <2 x double> %193, i32 1
  %add.3862.7.clone.1.18 = fadd double %194, 6.000000e+00
  %multiply.2960.7.clone.1.18 = fmul double %add.3862.7.clone.1.18, %add.3862.7.clone.1.18
  %multiply.2961.7.clone.1.18 = fmul double %multiply.2960.7.clone.1.18, 2.500000e-01
  %add.3872.5.clone.1.18 = fadd double %multiply.2961.7.clone.1.18, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.18 = fmul double %add.3872.5.clone.1.18, 5.000000e-01
  %add.3862.7.clone.1.19 = fadd double %195, 6.000000e+00
  %multiply.2960.7.clone.1.19 = fmul double %add.3862.7.clone.1.19, %add.3862.7.clone.1.19
  %multiply.2961.7.clone.1.19 = fmul double %multiply.2960.7.clone.1.19, 2.500000e-01
  %add.3872.5.clone.1.19 = fadd double %multiply.2961.7.clone.1.19, 0x4009CB1A63AF7C52
  %multiply.2962.3.clone.1.19 = fmul double %add.3872.5.clone.1.19, 5.000000e-01
  %196 = fsub double 0.000000e+00, %multiply.2959.3.clone.1
  %197 = fsub double %196, %multiply.2959.3.clone.1.1
  %198 = fsub double %197, %multiply.2959.3.clone.1.2
  %199 = fsub double %198, %multiply.2959.3.clone.1.3
  %200 = fsub double %199, %multiply.2959.3.clone.1.4
  %201 = fsub double %200, %multiply.2959.3.clone.1.5
  %202 = fsub double %201, %multiply.2959.3.clone.1.6
  %203 = fsub double %202, %multiply.2959.3.clone.1.7
  %204 = fsub double %203, %multiply.2959.3.clone.1.8
  %205 = fsub double %204, %multiply.2959.3.clone.1.9
  %206 = fsub double %205, %multiply.2959.3.clone.1.10
  %207 = fsub double %206, %multiply.2959.3.clone.1.11
  %208 = fsub double %207, %multiply.2959.3.clone.1.12
  %209 = fsub double %208, %multiply.2959.3.clone.1.13
  %210 = fsub double %209, %multiply.2959.3.clone.1.14
  %211 = fsub double %210, %multiply.2959.3.clone.1.15
  %212 = fsub double %211, %multiply.2959.3.clone.1.16
  %213 = fsub double %212, %multiply.2959.3.clone.1.17
  %214 = fsub double %213, %multiply.2959.3.clone.1.18
  %215 = fsub double %214, %multiply.2959.3.clone.1.19
  %216 = load <2 x double>, ptr addrspace(1) %arg887, align 128, !invariant.load !303
  %217 = extractelement <2 x double> %216, i32 0
  %218 = extractelement <2 x double> %216, i32 1
  %add.3847.7.clone.1 = fadd double %217, -1.000000e+00
  %multiply.2963.7.clone.1 = fmul double %add.3847.7.clone.1, %add.3847.7.clone.1
  %multiply.2964.7.clone.1 = fmul double %multiply.2963.7.clone.1, 4.000000e+00
  %add.3875.5.clone.1 = fadd double %multiply.2964.7.clone.1, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1 = fmul double %add.3875.5.clone.1, 5.000000e-01
  %add.3847.7.clone.1.1 = fadd double %218, -1.000000e+00
  %multiply.2963.7.clone.1.1 = fmul double %add.3847.7.clone.1.1, %add.3847.7.clone.1.1
  %multiply.2964.7.clone.1.1 = fmul double %multiply.2963.7.clone.1.1, 4.000000e+00
  %add.3875.5.clone.1.1 = fadd double %multiply.2964.7.clone.1.1, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.1 = fmul double %add.3875.5.clone.1.1, 5.000000e-01
  %219 = getelementptr inbounds i8, ptr addrspace(1) %arg887, i64 16
  %220 = load <2 x double>, ptr addrspace(1) %219, align 16, !invariant.load !303
  %221 = extractelement <2 x double> %220, i32 0
  %222 = extractelement <2 x double> %220, i32 1
  %add.3847.7.clone.1.2 = fadd double %221, -1.000000e+00
  %multiply.2963.7.clone.1.2 = fmul double %add.3847.7.clone.1.2, %add.3847.7.clone.1.2
  %multiply.2964.7.clone.1.2 = fmul double %multiply.2963.7.clone.1.2, 4.000000e+00
  %add.3875.5.clone.1.2 = fadd double %multiply.2964.7.clone.1.2, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.2 = fmul double %add.3875.5.clone.1.2, 5.000000e-01
  %add.3847.7.clone.1.3 = fadd double %222, -1.000000e+00
  %multiply.2963.7.clone.1.3 = fmul double %add.3847.7.clone.1.3, %add.3847.7.clone.1.3
  %multiply.2964.7.clone.1.3 = fmul double %multiply.2963.7.clone.1.3, 4.000000e+00
  %add.3875.5.clone.1.3 = fadd double %multiply.2964.7.clone.1.3, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.3 = fmul double %add.3875.5.clone.1.3, 5.000000e-01
  %223 = getelementptr inbounds i8, ptr addrspace(1) %arg887, i64 32
  %224 = load <2 x double>, ptr addrspace(1) %223, align 32, !invariant.load !303
  %225 = extractelement <2 x double> %224, i32 0
  %226 = extractelement <2 x double> %224, i32 1
  %add.3847.7.clone.1.4 = fadd double %225, -1.000000e+00
  %multiply.2963.7.clone.1.4 = fmul double %add.3847.7.clone.1.4, %add.3847.7.clone.1.4
  %multiply.2964.7.clone.1.4 = fmul double %multiply.2963.7.clone.1.4, 4.000000e+00
  %add.3875.5.clone.1.4 = fadd double %multiply.2964.7.clone.1.4, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.4 = fmul double %add.3875.5.clone.1.4, 5.000000e-01
  %add.3847.7.clone.1.5 = fadd double %226, -1.000000e+00
  %multiply.2963.7.clone.1.5 = fmul double %add.3847.7.clone.1.5, %add.3847.7.clone.1.5
  %multiply.2964.7.clone.1.5 = fmul double %multiply.2963.7.clone.1.5, 4.000000e+00
  %add.3875.5.clone.1.5 = fadd double %multiply.2964.7.clone.1.5, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.5 = fmul double %add.3875.5.clone.1.5, 5.000000e-01
  %227 = getelementptr inbounds i8, ptr addrspace(1) %arg887, i64 48
  %228 = load <2 x double>, ptr addrspace(1) %227, align 16, !invariant.load !303
  %229 = extractelement <2 x double> %228, i32 0
  %230 = extractelement <2 x double> %228, i32 1
  %add.3847.7.clone.1.6 = fadd double %229, -1.000000e+00
  %multiply.2963.7.clone.1.6 = fmul double %add.3847.7.clone.1.6, %add.3847.7.clone.1.6
  %multiply.2964.7.clone.1.6 = fmul double %multiply.2963.7.clone.1.6, 4.000000e+00
  %add.3875.5.clone.1.6 = fadd double %multiply.2964.7.clone.1.6, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.6 = fmul double %add.3875.5.clone.1.6, 5.000000e-01
  %add.3847.7.clone.1.7 = fadd double %230, -1.000000e+00
  %multiply.2963.7.clone.1.7 = fmul double %add.3847.7.clone.1.7, %add.3847.7.clone.1.7
  %multiply.2964.7.clone.1.7 = fmul double %multiply.2963.7.clone.1.7, 4.000000e+00
  %add.3875.5.clone.1.7 = fadd double %multiply.2964.7.clone.1.7, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.7 = fmul double %add.3875.5.clone.1.7, 5.000000e-01
  %231 = getelementptr inbounds i8, ptr addrspace(1) %arg887, i64 64
  %232 = load <2 x double>, ptr addrspace(1) %231, align 64, !invariant.load !303
  %233 = extractelement <2 x double> %232, i32 0
  %234 = extractelement <2 x double> %232, i32 1
  %add.3847.7.clone.1.8 = fadd double %233, -1.000000e+00
  %multiply.2963.7.clone.1.8 = fmul double %add.3847.7.clone.1.8, %add.3847.7.clone.1.8
  %multiply.2964.7.clone.1.8 = fmul double %multiply.2963.7.clone.1.8, 4.000000e+00
  %add.3875.5.clone.1.8 = fadd double %multiply.2964.7.clone.1.8, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.8 = fmul double %add.3875.5.clone.1.8, 5.000000e-01
  %add.3847.7.clone.1.9 = fadd double %234, -1.000000e+00
  %multiply.2963.7.clone.1.9 = fmul double %add.3847.7.clone.1.9, %add.3847.7.clone.1.9
  %multiply.2964.7.clone.1.9 = fmul double %multiply.2963.7.clone.1.9, 4.000000e+00
  %add.3875.5.clone.1.9 = fadd double %multiply.2964.7.clone.1.9, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.9 = fmul double %add.3875.5.clone.1.9, 5.000000e-01
  %235 = getelementptr inbounds i8, ptr addrspace(1) %arg887, i64 80
  %236 = load <2 x double>, ptr addrspace(1) %235, align 16, !invariant.load !303
  %237 = extractelement <2 x double> %236, i32 0
  %238 = extractelement <2 x double> %236, i32 1
  %add.3847.7.clone.1.10 = fadd double %237, -1.000000e+00
  %multiply.2963.7.clone.1.10 = fmul double %add.3847.7.clone.1.10, %add.3847.7.clone.1.10
  %multiply.2964.7.clone.1.10 = fmul double %multiply.2963.7.clone.1.10, 4.000000e+00
  %add.3875.5.clone.1.10 = fadd double %multiply.2964.7.clone.1.10, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.10 = fmul double %add.3875.5.clone.1.10, 5.000000e-01
  %add.3847.7.clone.1.11 = fadd double %238, -1.000000e+00
  %multiply.2963.7.clone.1.11 = fmul double %add.3847.7.clone.1.11, %add.3847.7.clone.1.11
  %multiply.2964.7.clone.1.11 = fmul double %multiply.2963.7.clone.1.11, 4.000000e+00
  %add.3875.5.clone.1.11 = fadd double %multiply.2964.7.clone.1.11, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.11 = fmul double %add.3875.5.clone.1.11, 5.000000e-01
  %239 = getelementptr inbounds i8, ptr addrspace(1) %arg887, i64 96
  %240 = load <2 x double>, ptr addrspace(1) %239, align 32, !invariant.load !303
  %241 = extractelement <2 x double> %240, i32 0
  %242 = extractelement <2 x double> %240, i32 1
  %add.3847.7.clone.1.12 = fadd double %241, -1.000000e+00
  %multiply.2963.7.clone.1.12 = fmul double %add.3847.7.clone.1.12, %add.3847.7.clone.1.12
  %multiply.2964.7.clone.1.12 = fmul double %multiply.2963.7.clone.1.12, 4.000000e+00
  %add.3875.5.clone.1.12 = fadd double %multiply.2964.7.clone.1.12, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.12 = fmul double %add.3875.5.clone.1.12, 5.000000e-01
  %add.3847.7.clone.1.13 = fadd double %242, -1.000000e+00
  %multiply.2963.7.clone.1.13 = fmul double %add.3847.7.clone.1.13, %add.3847.7.clone.1.13
  %multiply.2964.7.clone.1.13 = fmul double %multiply.2963.7.clone.1.13, 4.000000e+00
  %add.3875.5.clone.1.13 = fadd double %multiply.2964.7.clone.1.13, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.13 = fmul double %add.3875.5.clone.1.13, 5.000000e-01
  %243 = getelementptr inbounds i8, ptr addrspace(1) %arg887, i64 112
  %244 = load <2 x double>, ptr addrspace(1) %243, align 16, !invariant.load !303
  %245 = extractelement <2 x double> %244, i32 0
  %246 = extractelement <2 x double> %244, i32 1
  %add.3847.7.clone.1.14 = fadd double %245, -1.000000e+00
  %multiply.2963.7.clone.1.14 = fmul double %add.3847.7.clone.1.14, %add.3847.7.clone.1.14
  %multiply.2964.7.clone.1.14 = fmul double %multiply.2963.7.clone.1.14, 4.000000e+00
  %add.3875.5.clone.1.14 = fadd double %multiply.2964.7.clone.1.14, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.14 = fmul double %add.3875.5.clone.1.14, 5.000000e-01
  %add.3847.7.clone.1.15 = fadd double %246, -1.000000e+00
  %multiply.2963.7.clone.1.15 = fmul double %add.3847.7.clone.1.15, %add.3847.7.clone.1.15
  %multiply.2964.7.clone.1.15 = fmul double %multiply.2963.7.clone.1.15, 4.000000e+00
  %add.3875.5.clone.1.15 = fadd double %multiply.2964.7.clone.1.15, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.15 = fmul double %add.3875.5.clone.1.15, 5.000000e-01
  %247 = getelementptr inbounds i8, ptr addrspace(1) %arg887, i64 128
  %248 = load <2 x double>, ptr addrspace(1) %247, align 128, !invariant.load !303
  %249 = extractelement <2 x double> %248, i32 0
  %250 = extractelement <2 x double> %248, i32 1
  %add.3847.7.clone.1.16 = fadd double %249, -1.000000e+00
  %multiply.2963.7.clone.1.16 = fmul double %add.3847.7.clone.1.16, %add.3847.7.clone.1.16
  %multiply.2964.7.clone.1.16 = fmul double %multiply.2963.7.clone.1.16, 4.000000e+00
  %add.3875.5.clone.1.16 = fadd double %multiply.2964.7.clone.1.16, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.16 = fmul double %add.3875.5.clone.1.16, 5.000000e-01
  %add.3847.7.clone.1.17 = fadd double %250, -1.000000e+00
  %multiply.2963.7.clone.1.17 = fmul double %add.3847.7.clone.1.17, %add.3847.7.clone.1.17
  %multiply.2964.7.clone.1.17 = fmul double %multiply.2963.7.clone.1.17, 4.000000e+00
  %add.3875.5.clone.1.17 = fadd double %multiply.2964.7.clone.1.17, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.17 = fmul double %add.3875.5.clone.1.17, 5.000000e-01
  %251 = getelementptr inbounds i8, ptr addrspace(1) %arg887, i64 144
  %252 = load <2 x double>, ptr addrspace(1) %251, align 16, !invariant.load !303
  %253 = extractelement <2 x double> %252, i32 0
  %254 = extractelement <2 x double> %252, i32 1
  %add.3847.7.clone.1.18 = fadd double %253, -1.000000e+00
  %multiply.2963.7.clone.1.18 = fmul double %add.3847.7.clone.1.18, %add.3847.7.clone.1.18
  %multiply.2964.7.clone.1.18 = fmul double %multiply.2963.7.clone.1.18, 4.000000e+00
  %add.3875.5.clone.1.18 = fadd double %multiply.2964.7.clone.1.18, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.18 = fmul double %add.3875.5.clone.1.18, 5.000000e-01
  %add.3847.7.clone.1.19 = fadd double %254, -1.000000e+00
  %multiply.2963.7.clone.1.19 = fmul double %add.3847.7.clone.1.19, %add.3847.7.clone.1.19
  %multiply.2964.7.clone.1.19 = fmul double %multiply.2963.7.clone.1.19, 4.000000e+00
  %add.3875.5.clone.1.19 = fadd double %multiply.2964.7.clone.1.19, 0x3FDCE6BB25AA1315
  %multiply.2965.3.clone.1.19 = fmul double %add.3875.5.clone.1.19, 5.000000e-01
  %255 = fsub double 0.000000e+00, %multiply.2962.3.clone.1
  %256 = fsub double %255, %multiply.2962.3.clone.1.1
  %257 = fsub double %256, %multiply.2962.3.clone.1.2
  %258 = fsub double %257, %multiply.2962.3.clone.1.3
  %259 = fsub double %258, %multiply.2962.3.clone.1.4
  %260 = fsub double %259, %multiply.2962.3.clone.1.5
  %261 = fsub double %260, %multiply.2962.3.clone.1.6
  %262 = fsub double %261, %multiply.2962.3.clone.1.7
  %263 = fsub double %262, %multiply.2962.3.clone.1.8
  %264 = fsub double %263, %multiply.2962.3.clone.1.9
  %265 = fsub double %264, %multiply.2962.3.clone.1.10
  %266 = fsub double %265, %multiply.2962.3.clone.1.11
  %267 = fsub double %266, %multiply.2962.3.clone.1.12
  %268 = fsub double %267, %multiply.2962.3.clone.1.13
  %269 = fsub double %268, %multiply.2962.3.clone.1.14
  %270 = fsub double %269, %multiply.2962.3.clone.1.15
  %271 = fsub double %270, %multiply.2962.3.clone.1.16
  %272 = fsub double %271, %multiply.2962.3.clone.1.17
  %273 = fsub double %272, %multiply.2962.3.clone.1.18
  %274 = fsub double %273, %multiply.2962.3.clone.1.19
  %275 = load <2 x double>, ptr addrspace(1) %arg377, align 128, !invariant.load !303
  %276 = extractelement <2 x double> %275, i32 0
  %277 = extractelement <2 x double> %275, i32 1
  %add.3855.7.clone.1 = fadd double %276, -1.000000e+00
  %multiply.2966.5.clone.1 = fmul double %add.3855.7.clone.1, %add.3855.7.clone.1
  %add.3877.5.clone.1 = fadd double %multiply.2966.5.clone.1, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1 = fmul double %add.3877.5.clone.1, 5.000000e-01
  %278 = fsub double 0.000000e+00, %multiply.2967.3.clone.1
  %add.3855.7.clone.1.1 = fadd double %277, -1.000000e+00
  %multiply.2966.5.clone.1.1 = fmul double %add.3855.7.clone.1.1, %add.3855.7.clone.1.1
  %add.3877.5.clone.1.1 = fadd double %multiply.2966.5.clone.1.1, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.1 = fmul double %add.3877.5.clone.1.1, 5.000000e-01
  %279 = fsub double %278, %multiply.2967.3.clone.1.1
  %280 = getelementptr inbounds i8, ptr addrspace(1) %arg377, i64 16
  %281 = load <2 x double>, ptr addrspace(1) %280, align 16, !invariant.load !303
  %282 = extractelement <2 x double> %281, i32 0
  %283 = extractelement <2 x double> %281, i32 1
  %add.3855.7.clone.1.2 = fadd double %282, -1.000000e+00
  %multiply.2966.5.clone.1.2 = fmul double %add.3855.7.clone.1.2, %add.3855.7.clone.1.2
  %add.3877.5.clone.1.2 = fadd double %multiply.2966.5.clone.1.2, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.2 = fmul double %add.3877.5.clone.1.2, 5.000000e-01
  %284 = fsub double %279, %multiply.2967.3.clone.1.2
  %add.3855.7.clone.1.3 = fadd double %283, -1.000000e+00
  %multiply.2966.5.clone.1.3 = fmul double %add.3855.7.clone.1.3, %add.3855.7.clone.1.3
  %add.3877.5.clone.1.3 = fadd double %multiply.2966.5.clone.1.3, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.3 = fmul double %add.3877.5.clone.1.3, 5.000000e-01
  %285 = fsub double %284, %multiply.2967.3.clone.1.3
  %286 = getelementptr inbounds i8, ptr addrspace(1) %arg377, i64 32
  %287 = load <2 x double>, ptr addrspace(1) %286, align 32, !invariant.load !303
  %288 = extractelement <2 x double> %287, i32 0
  %289 = extractelement <2 x double> %287, i32 1
  %add.3855.7.clone.1.4 = fadd double %288, -1.000000e+00
  %multiply.2966.5.clone.1.4 = fmul double %add.3855.7.clone.1.4, %add.3855.7.clone.1.4
  %add.3877.5.clone.1.4 = fadd double %multiply.2966.5.clone.1.4, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.4 = fmul double %add.3877.5.clone.1.4, 5.000000e-01
  %290 = fsub double %285, %multiply.2967.3.clone.1.4
  %add.3855.7.clone.1.5 = fadd double %289, -1.000000e+00
  %multiply.2966.5.clone.1.5 = fmul double %add.3855.7.clone.1.5, %add.3855.7.clone.1.5
  %add.3877.5.clone.1.5 = fadd double %multiply.2966.5.clone.1.5, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.5 = fmul double %add.3877.5.clone.1.5, 5.000000e-01
  %291 = fsub double %290, %multiply.2967.3.clone.1.5
  %292 = getelementptr inbounds i8, ptr addrspace(1) %arg377, i64 48
  %293 = load <2 x double>, ptr addrspace(1) %292, align 16, !invariant.load !303
  %294 = extractelement <2 x double> %293, i32 0
  %295 = extractelement <2 x double> %293, i32 1
  %add.3855.7.clone.1.6 = fadd double %294, -1.000000e+00
  %multiply.2966.5.clone.1.6 = fmul double %add.3855.7.clone.1.6, %add.3855.7.clone.1.6
  %add.3877.5.clone.1.6 = fadd double %multiply.2966.5.clone.1.6, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.6 = fmul double %add.3877.5.clone.1.6, 5.000000e-01
  %296 = fsub double %291, %multiply.2967.3.clone.1.6
  %add.3855.7.clone.1.7 = fadd double %295, -1.000000e+00
  %multiply.2966.5.clone.1.7 = fmul double %add.3855.7.clone.1.7, %add.3855.7.clone.1.7
  %add.3877.5.clone.1.7 = fadd double %multiply.2966.5.clone.1.7, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.7 = fmul double %add.3877.5.clone.1.7, 5.000000e-01
  %297 = fsub double %296, %multiply.2967.3.clone.1.7
  %298 = getelementptr inbounds i8, ptr addrspace(1) %arg377, i64 64
  %299 = load <2 x double>, ptr addrspace(1) %298, align 64, !invariant.load !303
  %300 = extractelement <2 x double> %299, i32 0
  %301 = extractelement <2 x double> %299, i32 1
  %add.3855.7.clone.1.8 = fadd double %300, -1.000000e+00
  %multiply.2966.5.clone.1.8 = fmul double %add.3855.7.clone.1.8, %add.3855.7.clone.1.8
  %add.3877.5.clone.1.8 = fadd double %multiply.2966.5.clone.1.8, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.8 = fmul double %add.3877.5.clone.1.8, 5.000000e-01
  %302 = fsub double %297, %multiply.2967.3.clone.1.8
  %add.3855.7.clone.1.9 = fadd double %301, -1.000000e+00
  %multiply.2966.5.clone.1.9 = fmul double %add.3855.7.clone.1.9, %add.3855.7.clone.1.9
  %add.3877.5.clone.1.9 = fadd double %multiply.2966.5.clone.1.9, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.9 = fmul double %add.3877.5.clone.1.9, 5.000000e-01
  %303 = fsub double %302, %multiply.2967.3.clone.1.9
  %304 = getelementptr inbounds i8, ptr addrspace(1) %arg377, i64 80
  %305 = load <2 x double>, ptr addrspace(1) %304, align 16, !invariant.load !303
  %306 = extractelement <2 x double> %305, i32 0
  %307 = extractelement <2 x double> %305, i32 1
  %add.3855.7.clone.1.10 = fadd double %306, -1.000000e+00
  %multiply.2966.5.clone.1.10 = fmul double %add.3855.7.clone.1.10, %add.3855.7.clone.1.10
  %add.3877.5.clone.1.10 = fadd double %multiply.2966.5.clone.1.10, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.10 = fmul double %add.3877.5.clone.1.10, 5.000000e-01
  %308 = fsub double %303, %multiply.2967.3.clone.1.10
  %add.3855.7.clone.1.11 = fadd double %307, -1.000000e+00
  %multiply.2966.5.clone.1.11 = fmul double %add.3855.7.clone.1.11, %add.3855.7.clone.1.11
  %add.3877.5.clone.1.11 = fadd double %multiply.2966.5.clone.1.11, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.11 = fmul double %add.3877.5.clone.1.11, 5.000000e-01
  %309 = fsub double %308, %multiply.2967.3.clone.1.11
  %310 = getelementptr inbounds i8, ptr addrspace(1) %arg377, i64 96
  %311 = load <2 x double>, ptr addrspace(1) %310, align 32, !invariant.load !303
  %312 = extractelement <2 x double> %311, i32 0
  %313 = extractelement <2 x double> %311, i32 1
  %add.3855.7.clone.1.12 = fadd double %312, -1.000000e+00
  %multiply.2966.5.clone.1.12 = fmul double %add.3855.7.clone.1.12, %add.3855.7.clone.1.12
  %add.3877.5.clone.1.12 = fadd double %multiply.2966.5.clone.1.12, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.12 = fmul double %add.3877.5.clone.1.12, 5.000000e-01
  %314 = fsub double %309, %multiply.2967.3.clone.1.12
  %add.3855.7.clone.1.13 = fadd double %313, -1.000000e+00
  %multiply.2966.5.clone.1.13 = fmul double %add.3855.7.clone.1.13, %add.3855.7.clone.1.13
  %add.3877.5.clone.1.13 = fadd double %multiply.2966.5.clone.1.13, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.13 = fmul double %add.3877.5.clone.1.13, 5.000000e-01
  %315 = fsub double %314, %multiply.2967.3.clone.1.13
  %316 = getelementptr inbounds i8, ptr addrspace(1) %arg377, i64 112
  %317 = load <2 x double>, ptr addrspace(1) %316, align 16, !invariant.load !303
  %318 = extractelement <2 x double> %317, i32 0
  %319 = extractelement <2 x double> %317, i32 1
  %add.3855.7.clone.1.14 = fadd double %318, -1.000000e+00
  %multiply.2966.5.clone.1.14 = fmul double %add.3855.7.clone.1.14, %add.3855.7.clone.1.14
  %add.3877.5.clone.1.14 = fadd double %multiply.2966.5.clone.1.14, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.14 = fmul double %add.3877.5.clone.1.14, 5.000000e-01
  %320 = fsub double %315, %multiply.2967.3.clone.1.14
  %add.3855.7.clone.1.15 = fadd double %319, -1.000000e+00
  %multiply.2966.5.clone.1.15 = fmul double %add.3855.7.clone.1.15, %add.3855.7.clone.1.15
  %add.3877.5.clone.1.15 = fadd double %multiply.2966.5.clone.1.15, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.15 = fmul double %add.3877.5.clone.1.15, 5.000000e-01
  %321 = fsub double %320, %multiply.2967.3.clone.1.15
  %322 = getelementptr inbounds i8, ptr addrspace(1) %arg377, i64 128
  %323 = load <2 x double>, ptr addrspace(1) %322, align 128, !invariant.load !303
  %324 = extractelement <2 x double> %323, i32 0
  %325 = extractelement <2 x double> %323, i32 1
  %add.3855.7.clone.1.16 = fadd double %324, -1.000000e+00
  %multiply.2966.5.clone.1.16 = fmul double %add.3855.7.clone.1.16, %add.3855.7.clone.1.16
  %add.3877.5.clone.1.16 = fadd double %multiply.2966.5.clone.1.16, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.16 = fmul double %add.3877.5.clone.1.16, 5.000000e-01
  %326 = fsub double %321, %multiply.2967.3.clone.1.16
  %add.3855.7.clone.1.17 = fadd double %325, -1.000000e+00
  %multiply.2966.5.clone.1.17 = fmul double %add.3855.7.clone.1.17, %add.3855.7.clone.1.17
  %add.3877.5.clone.1.17 = fadd double %multiply.2966.5.clone.1.17, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.17 = fmul double %add.3877.5.clone.1.17, 5.000000e-01
  %327 = fsub double %326, %multiply.2967.3.clone.1.17
  %328 = getelementptr inbounds i8, ptr addrspace(1) %arg377, i64 144
  %329 = load <2 x double>, ptr addrspace(1) %328, align 16, !invariant.load !303
  %330 = extractelement <2 x double> %329, i32 0
  %331 = extractelement <2 x double> %329, i32 1
  %add.3855.7.clone.1.18 = fadd double %330, -1.000000e+00
  %multiply.2966.5.clone.1.18 = fmul double %add.3855.7.clone.1.18, %add.3855.7.clone.1.18
  %add.3877.5.clone.1.18 = fadd double %multiply.2966.5.clone.1.18, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.18 = fmul double %add.3877.5.clone.1.18, 5.000000e-01
  %332 = fsub double %327, %multiply.2967.3.clone.1.18
  %add.3855.7.clone.1.19 = fadd double %331, -1.000000e+00
  %multiply.2966.5.clone.1.19 = fmul double %add.3855.7.clone.1.19, %add.3855.7.clone.1.19
  %add.3877.5.clone.1.19 = fadd double %multiply.2966.5.clone.1.19, 0x3FFD67F1C864BEB4
  %multiply.2967.3.clone.1.19 = fmul double %add.3877.5.clone.1.19, 5.000000e-01
  %333 = fsub double %332, %multiply.2967.3.clone.1.19
  %334 = fsub double 0.000000e+00, %multiply.2965.3.clone.1
  %335 = fsub double %334, %multiply.2965.3.clone.1.1
  %336 = fsub double %335, %multiply.2965.3.clone.1.2
  %337 = fsub double %336, %multiply.2965.3.clone.1.3
  %338 = fsub double %337, %multiply.2965.3.clone.1.4
  %339 = fsub double %338, %multiply.2965.3.clone.1.5
  %340 = fsub double %339, %multiply.2965.3.clone.1.6
  %341 = fsub double %340, %multiply.2965.3.clone.1.7
  %342 = fsub double %341, %multiply.2965.3.clone.1.8
  %343 = fsub double %342, %multiply.2965.3.clone.1.9
  %344 = fsub double %343, %multiply.2965.3.clone.1.10
  %345 = fsub double %344, %multiply.2965.3.clone.1.11
  %346 = fsub double %345, %multiply.2965.3.clone.1.12
  %347 = fsub double %346, %multiply.2965.3.clone.1.13
  %348 = fsub double %347, %multiply.2965.3.clone.1.14
  %349 = fsub double %348, %multiply.2965.3.clone.1.15
  %350 = fsub double %349, %multiply.2965.3.clone.1.16
  %351 = fsub double %350, %multiply.2965.3.clone.1.17
  %352 = fsub double %351, %multiply.2965.3.clone.1.18
  %353 = fsub double %352, %multiply.2965.3.clone.1.19
  %354 = fsub double %97, %multiply.2954.3.clone.1.19
  %add.3869.1.clone.1 = fadd double %354, %156
  %add.3871.1.clone.1 = fadd double %add.3869.1.clone.1, %215
  %add.3874.1.clone.1 = fadd double %add.3871.1.clone.1, %274
  %add.3876.1.clone.1 = fadd double %add.3874.1.clone.1, %353
  %add.3879.1.clone.1 = fadd double %add.3876.1.clone.1, %333
  %355 = load double, ptr addrspace(1) %arg275, align 128
  %add.3880.1.clone.1 = fadd double %add.3879.1.clone.1, %355
  %356 = load double, ptr addrspace(1) %arg173, align 128, !invariant.load !303
  %multiply.2970.1.clone.1 = fmul double %356, 5.000000e-01
  %add.3881.1.clone.1 = fsub double %multiply.2970.1.clone.1, %add.3880.1.clone.1
  %subtract.237.1.clone.1 = fsub double %0, %add.3881.1.clone.1
  %compare.644.1.clone.1 = fcmp uno double %subtract.237.1.clone.1, 0.000000e+00
  %357 = select i1 %compare.644.1.clone.1, double 0xFFF0000000000000, double %subtract.237.1.clone.1
  %358 = fcmp ole double %357, 0.000000e+00
  %minimum.8.1 = select i1 %358, double %357, double 0.000000e+00
  store double %minimum.8.1, ptr addrspace(1) %arg275, align 128
  store double %357, ptr addrspace(1) %arg989, align 128
  store double %add.3881.1.clone.1, ptr addrspace(1) %arg1091, align 128
  store double %add.3880.1.clone.1, ptr addrspace(1) %arg1193, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg2252 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1250 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0248 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg1250, align 128, !invariant.load !303
  %1 = trunc i64 %0 to i32
  %2 = load <2 x i32>, ptr addrspace(1) %arg0248, align 128, !invariant.load !303
  %3 = extractelement <2 x i32> %2, i32 0
  %4 = extractelement <2 x i32> %2, i32 1
  %5 = add i32 %4, %1
  %6 = add i32 %5, %3
  %7 = tail call i32 @llvm.fshl.i32(i32 %5, i32 %5, i32 13)
  %8 = xor i32 %6, %7
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.fshl.i32(i32 %8, i32 %8, i32 15)
  %11 = xor i32 %9, %10
  %12 = add i32 %11, %9
  %13 = tail call i32 @llvm.fshl.i32(i32 %11, i32 %11, i32 26)
  %14 = xor i32 %12, %13
  %15 = add i32 %14, %12
  %16 = add i32 %15, %4
  %17 = tail call i32 @llvm.fshl.i32(i32 %14, i32 %14, i32 6)
  %18 = xor i32 %15, %17
  %19 = xor i32 %3, %4
  %20 = xor i32 %19, 466688986
  %21 = add i32 %20, 1
  %22 = add i32 %21, %18
  %23 = add i32 %16, %22
  %24 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 17)
  %25 = xor i32 %23, %24
  %26 = add i32 %25, %23
  %27 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 29)
  %28 = xor i32 %26, %27
  %29 = add i32 %28, %26
  %30 = tail call i32 @llvm.fshl.i32(i32 %28, i32 %28, i32 16)
  %31 = xor i32 %29, %30
  %32 = add i32 %31, %29
  %33 = add i32 %32, %20
  %34 = tail call i32 @llvm.fshl.i32(i32 %31, i32 %31, i32 24)
  %35 = xor i32 %32, %34
  %36 = add i32 %3, 2
  %37 = add i32 %36, %35
  %38 = add i32 %33, %37
  %39 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 13)
  %40 = xor i32 %38, %39
  %41 = add i32 %40, %38
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 15)
  %43 = xor i32 %41, %42
  %44 = add i32 %43, %41
  %45 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 26)
  %46 = xor i32 %44, %45
  %47 = add i32 %46, %44
  %48 = add i32 %47, %3
  %49 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 6)
  %50 = xor i32 %47, %49
  %51 = add i32 %4, 3
  %52 = add i32 %51, %50
  %53 = add i32 %48, %52
  %54 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 17)
  %55 = xor i32 %53, %54
  %56 = add i32 %55, %53
  %57 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %55, i32 29)
  %58 = xor i32 %56, %57
  %59 = add i32 %58, %56
  %60 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 16)
  %61 = xor i32 %59, %60
  %62 = add i32 %61, %59
  %63 = add i32 %62, %4
  %64 = tail call i32 @llvm.fshl.i32(i32 %61, i32 %61, i32 24)
  %65 = xor i32 %62, %64
  %66 = add i32 %20, 4
  %67 = add i32 %66, %65
  %68 = add i32 %63, %67
  %69 = tail call i32 @llvm.fshl.i32(i32 %67, i32 %67, i32 13)
  %70 = xor i32 %68, %69
  %71 = add i32 %70, %68
  %72 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 15)
  %73 = xor i32 %71, %72
  %74 = add i32 %73, %71
  %75 = tail call i32 @llvm.fshl.i32(i32 %73, i32 %73, i32 26)
  %76 = xor i32 %74, %75
  %77 = add i32 %76, %74
  %78 = add i32 %77, %20
  %79 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 6)
  %80 = xor i32 %77, %79
  %81 = add i32 %3, 5
  %82 = add i32 %81, %80
  %83 = insertelement <2 x i32> poison, i32 %78, i32 0
  %84 = insertelement <2 x i32> %83, i32 %82, i32 1
  store <2 x i32> %84, ptr addrspace(1) %arg2252, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %1 = icmp eq i64 %0, 0
  %2 = zext i1 %1 to i32
  store i32 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_3(ptr noalias nocapture align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #4 {
entry:
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128
  %1 = load double, ptr addrspace(1) %arg14, align 128, !invariant.load !303
  %subtract.224.1 = fsub double %0, %1
  %2 = tail call double @llvm.fabs.f64(double %subtract.224.1)
  %3 = fneg double %2
  %4 = tail call double @llvm.fma.f64(double %3, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #12
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #12
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %3)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #12
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #12
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #12
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %3) #12
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #12
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp one double %subtract.224.1, 0.000000e+00
  %30 = fsub double 0x7FF0000000000000, %2
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #12
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #12
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i) #12
  %43 = bitcast i32 %42 to float
  %44 = fcmp olt float %43, 0x3FFCAAAAA0000000
  %45 = fcmp ogt float %43, 0xBFFB333320000000
  %or.cond.i = and i1 %44, %45
  br i1 %or.cond.i, label %46, label %63

46:                                               ; preds = %__nv_exp.exit
  %47 = fadd double %z.2.i, 2.000000e+00
  %48 = fdiv double %z.2.i, %47
  %49 = fneg double %z.2.i
  %50 = fmul double %48, %49
  %51 = fadd double %z.2.i, %50
  %52 = fmul double %51, %51
  %53 = tail call double @llvm.fma.f64(double %52, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %54 = tail call double @llvm.fma.f64(double %53, double %52, double 0x3EF3B9FF890F468C)
  %55 = tail call double @llvm.fma.f64(double %54, double %52, double 0x3F17457EFD51BAF8)
  %56 = tail call double @llvm.fma.f64(double %55, double %52, double 0x3F3C71C8DE3CE825)
  %57 = tail call double @llvm.fma.f64(double %56, double %52, double 0x3F6249248FA4661F)
  %58 = tail call double @llvm.fma.f64(double %57, double %52, double 0x3F899999999D70C4)
  %59 = tail call double @llvm.fma.f64(double %58, double %52, double 0x3FB5555555555462)
  %60 = fmul double %52, %59
  %61 = tail call double @llvm.fma.f64(double %60, double %51, double %50)
  %62 = fadd double %z.2.i, %61
  br label %__nv_log1p.exit

63:                                               ; preds = %__nv_exp.exit
  %64 = fadd double %z.2.i, 1.000000e+00
  %65 = tail call i32 @llvm.nvvm.d2i.hi(double %64) #12
  %66 = tail call i32 @llvm.nvvm.d2i.lo(double %64) #12
  %67 = icmp slt i32 %65, 1048576
  %68 = fmul double %64, 0x4350000000000000
  %69 = tail call i32 @llvm.nvvm.d2i.lo(double %68) #12
  %70 = tail call i32 @llvm.nvvm.d2i.hi(double %68) #12
  br i1 %67, label %71, label %72

71:                                               ; preds = %63
  br label %72

72:                                               ; preds = %71, %63
  %.0.i = phi double [ %68, %71 ], [ %64, %63 ]
  %ihi.i.0.i = phi i32 [ %70, %71 ], [ %65, %63 ]
  %ilo.i.0.i = phi i32 [ %69, %71 ], [ %66, %63 ]
  %e.i.0.i = phi i32 [ -1077, %71 ], [ -1023, %63 ]
  %73 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %73, 2146435071
  br i1 %or.cond2.i, label %74, label %121

74:                                               ; preds = %72
  %75 = lshr i32 %ihi.i.0.i, 20
  %76 = add nsw i32 %e.i.0.i, %75
  %77 = and i32 %ihi.i.0.i, 1048575
  %78 = or disjoint i32 %77, 1072693248
  %79 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %78) #12
  %80 = icmp ugt i32 %78, 1073127582
  %81 = tail call i32 @llvm.nvvm.d2i.lo(double %79) #12
  %82 = tail call i32 @llvm.nvvm.d2i.hi(double %79) #12
  %83 = add i32 %82, -1048576
  %84 = tail call double @llvm.nvvm.lohi.i2d(i32 %81, i32 %83) #12
  %spec.select = select i1 %80, double %84, double %79
  %85 = zext i1 %80 to i32
  %spec.select1 = add nsw i32 %76, %85
  %86 = fadd double %spec.select, -1.000000e+00
  %87 = fadd double %spec.select, 1.000000e+00
  %88 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %87) #12
  %89 = fneg double %87
  %90 = tail call double @llvm.fma.f64(double %89, double %88, double 1.000000e+00)
  %91 = tail call double @llvm.fma.f64(double %90, double %90, double %90)
  %92 = tail call double @llvm.fma.f64(double %91, double %88, double %88)
  %93 = fmul double %86, %92
  %94 = fadd double %93, %93
  %95 = fmul double %94, %94
  %96 = tail call double @llvm.fma.f64(double %95, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %97 = tail call double @llvm.fma.f64(double %96, double %95, double 0x3EF3B2669F02676F)
  %98 = tail call double @llvm.fma.f64(double %97, double %95, double 0x3F1745CBA9AB0956)
  %99 = tail call double @llvm.fma.f64(double %98, double %95, double 0x3F3C71C72D1B5154)
  %100 = tail call double @llvm.fma.f64(double %99, double %95, double 0x3F624924923BE72D)
  %101 = tail call double @llvm.fma.f64(double %100, double %95, double 0x3F8999999999A3C4)
  %102 = tail call double @llvm.fma.f64(double %101, double %95, double 0x3FB5555555555554)
  %103 = fsub double %86, %94
  %104 = fmul double %103, 2.000000e+00
  %105 = fneg double %94
  %106 = tail call double @llvm.fma.f64(double %105, double %86, double %104)
  %107 = fmul double %92, %106
  %108 = fmul double %95, %102
  %109 = tail call double @llvm.fma.f64(double %108, double %94, double %107)
  %110 = xor i32 %spec.select1, -2147483648
  %111 = tail call double @llvm.nvvm.lohi.i2d(i32 %110, i32 1127219200) #12
  %112 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %113 = fsub double %111, %112
  %114 = tail call double @llvm.fma.f64(double %113, double 0x3FE62E42FEFA39EF, double %94)
  %115 = fneg double %113
  %116 = tail call double @llvm.fma.f64(double %115, double 0x3FE62E42FEFA39EF, double %114)
  %117 = fsub double %116, %94
  %118 = fsub double %109, %117
  %119 = tail call double @llvm.fma.f64(double %113, double 0x3C7ABC9E3B39803F, double %118)
  %120 = fadd double %114, %119
  br label %__nv_log1p.exit

121:                                              ; preds = %72
  %122 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %123 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %124 = and i32 %123, 2147483647
  %125 = icmp eq i32 %124, 0
  %q.i.0.i = select i1 %125, double 0xFFF0000000000000, double %122
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %46, %74, %121
  %t.0.i = phi double [ %62, %46 ], [ %120, %74 ], [ %q.i.0.i, %121 ]
  %126 = fcmp uno double %0, 0.000000e+00
  %127 = fcmp oge double %0, %1
  %128 = or i1 %126, %127
  %maximum.40.1 = select i1 %128, double %0, double %1
  %add.3713.1 = fadd double %0, %1
  %compare.613.1 = fcmp uno double %subtract.224.1, 0.000000e+00
  %add.3714.1 = fadd double %maximum.40.1, %t.0.i
  %129 = select i1 %compare.613.1, double %add.3713.1, double %add.3714.1
  store double %129, ptr addrspace(1) %arg02, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !303
  %1 = load double, ptr addrspace(1) %arg14, align 128, !invariant.load !303
  %subtract.223.1 = fsub double %0, %1
  %2 = tail call double @llvm.fabs.f64(double %subtract.223.1)
  %3 = fneg double %2
  %4 = tail call double @llvm.fma.f64(double %3, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #12
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #12
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %3)
  %8 = tail call double @llvm.fma.f64(double %6, double 0xBC7ABC9E3B39803F, double %7)
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %10 = tail call double @llvm.fma.f64(double %9, double %8, double 0x3EC71DEE62401315)
  %11 = tail call double @llvm.fma.f64(double %10, double %8, double 0x3EFA01997C89EB71)
  %12 = tail call double @llvm.fma.f64(double %11, double %8, double 0x3F2A01A014761F65)
  %13 = tail call double @llvm.fma.f64(double %12, double %8, double 0x3F56C16C1852B7AF)
  %14 = tail call double @llvm.fma.f64(double %13, double %8, double 0x3F81111111122322)
  %15 = tail call double @llvm.fma.f64(double %14, double %8, double 0x3FA55555555502A1)
  %16 = tail call double @llvm.fma.f64(double %15, double %8, double 0x3FC5555555555511)
  %17 = tail call double @llvm.fma.f64(double %16, double %8, double 0x3FE000000000000B)
  %18 = tail call double @llvm.fma.f64(double %17, double %8, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %8, double 1.000000e+00)
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #12
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #12
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #12
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %3) #12
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #12
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp one double %subtract.223.1, 0.000000e+00
  %30 = fsub double 0x7FF0000000000000, %2
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #12
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #12
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = tail call i32 @llvm.nvvm.d2i.hi(double %z.2.i) #12
  %43 = bitcast i32 %42 to float
  %44 = fcmp olt float %43, 0x3FFCAAAAA0000000
  %45 = fcmp ogt float %43, 0xBFFB333320000000
  %or.cond.i = and i1 %44, %45
  br i1 %or.cond.i, label %46, label %63

46:                                               ; preds = %__nv_exp.exit
  %47 = fadd double %z.2.i, 2.000000e+00
  %48 = fdiv double %z.2.i, %47
  %49 = fneg double %z.2.i
  %50 = fmul double %48, %49
  %51 = fadd double %z.2.i, %50
  %52 = fmul double %51, %51
  %53 = tail call double @llvm.fma.f64(double %52, double 0x3EB372FB2FBE14B5, double 0x3ED087FFCEB2DC44)
  %54 = tail call double @llvm.fma.f64(double %53, double %52, double 0x3EF3B9FF890F468C)
  %55 = tail call double @llvm.fma.f64(double %54, double %52, double 0x3F17457EFD51BAF8)
  %56 = tail call double @llvm.fma.f64(double %55, double %52, double 0x3F3C71C8DE3CE825)
  %57 = tail call double @llvm.fma.f64(double %56, double %52, double 0x3F6249248FA4661F)
  %58 = tail call double @llvm.fma.f64(double %57, double %52, double 0x3F899999999D70C4)
  %59 = tail call double @llvm.fma.f64(double %58, double %52, double 0x3FB5555555555462)
  %60 = fmul double %52, %59
  %61 = tail call double @llvm.fma.f64(double %60, double %51, double %50)
  %62 = fadd double %z.2.i, %61
  br label %__nv_log1p.exit

63:                                               ; preds = %__nv_exp.exit
  %64 = fadd double %z.2.i, 1.000000e+00
  %65 = tail call i32 @llvm.nvvm.d2i.hi(double %64) #12
  %66 = tail call i32 @llvm.nvvm.d2i.lo(double %64) #12
  %67 = icmp slt i32 %65, 1048576
  %68 = fmul double %64, 0x4350000000000000
  %69 = tail call i32 @llvm.nvvm.d2i.lo(double %68) #12
  %70 = tail call i32 @llvm.nvvm.d2i.hi(double %68) #12
  br i1 %67, label %71, label %72

71:                                               ; preds = %63
  br label %72

72:                                               ; preds = %71, %63
  %.0.i = phi double [ %68, %71 ], [ %64, %63 ]
  %ihi.i.0.i = phi i32 [ %70, %71 ], [ %65, %63 ]
  %ilo.i.0.i = phi i32 [ %69, %71 ], [ %66, %63 ]
  %e.i.0.i = phi i32 [ -1077, %71 ], [ -1023, %63 ]
  %73 = add i32 %ihi.i.0.i, -1
  %or.cond2.i = icmp ult i32 %73, 2146435071
  br i1 %or.cond2.i, label %74, label %121

74:                                               ; preds = %72
  %75 = lshr i32 %ihi.i.0.i, 20
  %76 = add nsw i32 %e.i.0.i, %75
  %77 = and i32 %ihi.i.0.i, 1048575
  %78 = or disjoint i32 %77, 1072693248
  %79 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0.i, i32 %78) #12
  %80 = icmp ugt i32 %78, 1073127582
  %81 = tail call i32 @llvm.nvvm.d2i.lo(double %79) #12
  %82 = tail call i32 @llvm.nvvm.d2i.hi(double %79) #12
  %83 = add i32 %82, -1048576
  %84 = tail call double @llvm.nvvm.lohi.i2d(i32 %81, i32 %83) #12
  %spec.select = select i1 %80, double %84, double %79
  %85 = zext i1 %80 to i32
  %spec.select1 = add nsw i32 %76, %85
  %86 = fadd double %spec.select, -1.000000e+00
  %87 = fadd double %spec.select, 1.000000e+00
  %88 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %87) #12
  %89 = fneg double %87
  %90 = tail call double @llvm.fma.f64(double %89, double %88, double 1.000000e+00)
  %91 = tail call double @llvm.fma.f64(double %90, double %90, double %90)
  %92 = tail call double @llvm.fma.f64(double %91, double %88, double %88)
  %93 = fmul double %86, %92
  %94 = fadd double %93, %93
  %95 = fmul double %94, %94
  %96 = tail call double @llvm.fma.f64(double %95, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %97 = tail call double @llvm.fma.f64(double %96, double %95, double 0x3EF3B2669F02676F)
  %98 = tail call double @llvm.fma.f64(double %97, double %95, double 0x3F1745CBA9AB0956)
  %99 = tail call double @llvm.fma.f64(double %98, double %95, double 0x3F3C71C72D1B5154)
  %100 = tail call double @llvm.fma.f64(double %99, double %95, double 0x3F624924923BE72D)
  %101 = tail call double @llvm.fma.f64(double %100, double %95, double 0x3F8999999999A3C4)
  %102 = tail call double @llvm.fma.f64(double %101, double %95, double 0x3FB5555555555554)
  %103 = fsub double %86, %94
  %104 = fmul double %103, 2.000000e+00
  %105 = fneg double %94
  %106 = tail call double @llvm.fma.f64(double %105, double %86, double %104)
  %107 = fmul double %92, %106
  %108 = fmul double %95, %102
  %109 = tail call double @llvm.fma.f64(double %108, double %94, double %107)
  %110 = xor i32 %spec.select1, -2147483648
  %111 = tail call double @llvm.nvvm.lohi.i2d(i32 %110, i32 1127219200) #12
  %112 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %113 = fsub double %111, %112
  %114 = tail call double @llvm.fma.f64(double %113, double 0x3FE62E42FEFA39EF, double %94)
  %115 = fneg double %113
  %116 = tail call double @llvm.fma.f64(double %115, double 0x3FE62E42FEFA39EF, double %114)
  %117 = fsub double %116, %94
  %118 = fsub double %109, %117
  %119 = tail call double @llvm.fma.f64(double %113, double 0x3C7ABC9E3B39803F, double %118)
  %120 = fadd double %114, %119
  br label %__nv_log1p.exit

121:                                              ; preds = %72
  %122 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %123 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %124 = and i32 %123, 2147483647
  %125 = icmp eq i32 %124, 0
  %q.i.0.i = select i1 %125, double 0xFFF0000000000000, double %122
  br label %__nv_log1p.exit

__nv_log1p.exit:                                  ; preds = %46, %74, %121
  %t.0.i = phi double [ %62, %46 ], [ %120, %74 ], [ %q.i.0.i, %121 ]
  %126 = fcmp uno double %0, 0.000000e+00
  %127 = fcmp oge double %0, %1
  %128 = or i1 %126, %127
  %maximum.39.1 = select i1 %128, double %0, double %1
  %add.3711.1 = fadd double %0, %1
  %compare.612.1 = fcmp uno double %subtract.223.1, 0.000000e+00
  %add.3712.1 = fadd double %maximum.39.1, %t.0.i
  %129 = select i1 %compare.612.1, double %add.3711.1, double %add.3712.1
  store double %129, ptr addrspace(1) %arg26, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #4 {
entry:
  %arg3130 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2128 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1126 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0124 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load <2 x i32>, ptr addrspace(1) %arg2128, align 128, !invariant.load !303
  %1 = extractelement <2 x i32> %0, i32 0
  %2 = extractelement <2 x i32> %0, i32 1
  %3 = load double, ptr addrspace(1) %arg0124, align 128, !invariant.load !303
  %4 = load double, ptr addrspace(1) %arg1126, align 128, !invariant.load !303
  %subtract.222.1 = fsub double %3, %4
  %5 = fneg double %subtract.222.1
  %6 = tail call double @llvm.fma.f64(double %5, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %7 = tail call i32 @llvm.nvvm.d2i.lo(double %6) #12
  %8 = tail call double @llvm.nvvm.add.rn.d(double %6, double 0xC338000000000000) #12
  %9 = tail call double @llvm.fma.f64(double %8, double 0xBFE62E42FEFA39EF, double %5)
  %10 = tail call double @llvm.fma.f64(double %8, double 0xBC7ABC9E3B39803F, double %9)
  %11 = tail call double @llvm.fma.f64(double %10, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %12 = tail call double @llvm.fma.f64(double %11, double %10, double 0x3EC71DEE62401315)
  %13 = tail call double @llvm.fma.f64(double %12, double %10, double 0x3EFA01997C89EB71)
  %14 = tail call double @llvm.fma.f64(double %13, double %10, double 0x3F2A01A014761F65)
  %15 = tail call double @llvm.fma.f64(double %14, double %10, double 0x3F56C16C1852B7AF)
  %16 = tail call double @llvm.fma.f64(double %15, double %10, double 0x3F81111111122322)
  %17 = tail call double @llvm.fma.f64(double %16, double %10, double 0x3FA55555555502A1)
  %18 = tail call double @llvm.fma.f64(double %17, double %10, double 0x3FC5555555555511)
  %19 = tail call double @llvm.fma.f64(double %18, double %10, double 0x3FE000000000000B)
  %20 = tail call double @llvm.fma.f64(double %19, double %10, double 1.000000e+00)
  %21 = tail call double @llvm.fma.f64(double %20, double %10, double 1.000000e+00)
  %22 = tail call i32 @llvm.nvvm.d2i.lo(double %21) #12
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %21) #12
  %24 = shl i32 %7, 20
  %25 = add i32 %23, %24
  %26 = tail call double @llvm.nvvm.lohi.i2d(i32 %22, i32 %25) #12
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %5) #12
  %28 = bitcast i32 %27 to float
  %29 = tail call float @llvm.nvvm.fabs.f(float %28) #12
  %30 = fcmp olt float %29, 0x4010C46560000000
  br i1 %30, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %31 = fcmp ogt double %subtract.222.1, 0.000000e+00
  %32 = fsub double 0x7FF0000000000000, %subtract.222.1
  %z.0.i = select i1 %31, double 0.000000e+00, double %32
  %33 = fcmp olt float %29, 0x4010E90000000000
  br i1 %33, label %34, label %__nv_exp.exit

34:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %35 = sdiv i32 %7, 2
  %36 = shl i32 %35, 20
  %37 = add i32 %23, %36
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 %22, i32 %37) #12
  %39 = sub nsw i32 %7, %35
  %40 = shl i32 %39, 20
  %41 = add nsw i32 %40, 1072693248
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %41) #12
  %43 = fmul double %42, %38
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %34
  %z.2.i = phi double [ %26, %entry ], [ %43, %34 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %44 = add i32 %2, 1
  %45 = add i32 %44, %1
  %46 = tail call i32 @llvm.fshl.i32(i32 %44, i32 %44, i32 13)
  %47 = xor i32 %45, %46
  %48 = add i32 %47, %45
  %49 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 15)
  %50 = xor i32 %48, %49
  %51 = add i32 %50, %48
  %52 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 26)
  %53 = xor i32 %51, %52
  %54 = add i32 %53, %51
  %55 = add i32 %54, %2
  %56 = tail call i32 @llvm.fshl.i32(i32 %53, i32 %53, i32 6)
  %57 = xor i32 %54, %56
  %58 = xor i32 %1, %2
  %59 = xor i32 %58, 466688986
  %60 = add i32 %59, 1
  %61 = add i32 %60, %57
  %62 = add i32 %55, %61
  %63 = tail call i32 @llvm.fshl.i32(i32 %61, i32 %61, i32 17)
  %64 = xor i32 %62, %63
  %65 = add i32 %64, %62
  %66 = tail call i32 @llvm.fshl.i32(i32 %64, i32 %64, i32 29)
  %67 = xor i32 %65, %66
  %68 = add i32 %67, %65
  %69 = tail call i32 @llvm.fshl.i32(i32 %67, i32 %67, i32 16)
  %70 = xor i32 %68, %69
  %71 = add i32 %70, %68
  %72 = add i32 %71, %59
  %73 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 24)
  %74 = xor i32 %71, %73
  %75 = add i32 %1, 2
  %76 = add i32 %75, %74
  %77 = add i32 %72, %76
  %78 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 13)
  %79 = xor i32 %77, %78
  %80 = add i32 %79, %77
  %81 = tail call i32 @llvm.fshl.i32(i32 %79, i32 %79, i32 15)
  %82 = xor i32 %80, %81
  %83 = add i32 %82, %80
  %84 = tail call i32 @llvm.fshl.i32(i32 %82, i32 %82, i32 26)
  %85 = xor i32 %83, %84
  %86 = add i32 %85, %83
  %87 = add i32 %86, %1
  %88 = tail call i32 @llvm.fshl.i32(i32 %85, i32 %85, i32 6)
  %89 = xor i32 %86, %88
  %90 = add i32 %2, 3
  %91 = add i32 %90, %89
  %92 = add i32 %87, %91
  %93 = tail call i32 @llvm.fshl.i32(i32 %91, i32 %91, i32 17)
  %94 = xor i32 %92, %93
  %95 = add i32 %94, %92
  %96 = tail call i32 @llvm.fshl.i32(i32 %94, i32 %94, i32 29)
  %97 = xor i32 %95, %96
  %98 = add i32 %97, %95
  %99 = tail call i32 @llvm.fshl.i32(i32 %97, i32 %97, i32 16)
  %100 = xor i32 %98, %99
  %101 = add i32 %100, %98
  %102 = add i32 %101, %2
  %103 = tail call i32 @llvm.fshl.i32(i32 %100, i32 %100, i32 24)
  %104 = xor i32 %101, %103
  %105 = add i32 %59, 4
  %106 = add i32 %105, %104
  %107 = add i32 %102, %106
  %108 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %106, i32 13)
  %109 = xor i32 %107, %108
  %110 = add i32 %109, %107
  %111 = tail call i32 @llvm.fshl.i32(i32 %109, i32 %109, i32 15)
  %112 = xor i32 %110, %111
  %113 = add i32 %112, %110
  %114 = tail call i32 @llvm.fshl.i32(i32 %112, i32 %112, i32 26)
  %115 = xor i32 %113, %114
  %116 = add i32 %115, %113
  %117 = add i32 %116, %59
  %118 = zext i32 %117 to i64
  %119 = shl nuw i64 %118, 32
  %120 = tail call i32 @llvm.fshl.i32(i32 %115, i32 %115, i32 6)
  %121 = xor i32 %116, %120
  %122 = add i32 %1, 5
  %123 = add i32 %122, %121
  %124 = zext i32 %123 to i64
  %125 = or disjoint i64 %119, %124
  %126 = lshr i64 %125, 12
  %127 = or disjoint i64 %126, 4607182418800017408
  %128 = bitcast i64 %127 to double
  %add.3709.1 = fadd double %128, -1.000000e+00
  %129 = fcmp ole double %add.3709.1, 0.000000e+00
  %maximum.38.1 = select i1 %129, double 0.000000e+00, double %add.3709.1
  %add.3710.1 = fadd double %z.2.i, 1.000000e+00
  %divide.571.1 = fdiv double 1.000000e+00, %add.3710.1
  %compare.611.3 = fcmp olt double %maximum.38.1, %divide.571.1
  %130 = zext i1 %compare.611.3 to i32
  store i32 %130, ptr addrspace(1) %arg3130, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_add(ptr noalias nocapture align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !303
  %add.3666.1 = fadd double %3, %5
  store double %add.3666.1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @wrapped_concatenate(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(960) %arg6) local_unnamed_addr #7 {
entry:
  %arg619 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg517 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !310
  %1 = icmp ult i32 %0, 60
  br i1 %1, label %concatenate.pivot.20., label %concatenate.pivot.80.

concatenate.pivot.20.:                            ; preds = %entry
  %2 = icmp ult i32 %0, 20
  br i1 %2, label %concatenate.42.1.merge, label %concatenate.pivot.40.

concatenate.pivot.40.:                            ; preds = %concatenate.pivot.20.
  %3 = icmp ult i32 %0, 40
  br i1 %3, label %concatenate.pivot.20.1, label %concatenate.pivot.40.2

concatenate.pivot.20.1:                           ; preds = %concatenate.pivot.40.
  %4 = add nsw i32 %0, -20
  br label %concatenate.42.1.merge

concatenate.pivot.40.2:                           ; preds = %concatenate.pivot.40.
  %5 = add nsw i32 %0, -40
  br label %concatenate.42.1.merge

concatenate.pivot.80.:                            ; preds = %entry
  %6 = icmp ult i32 %0, 80
  br i1 %6, label %concatenate.pivot.60.3, label %concatenate.pivot.100.

concatenate.pivot.60.3:                           ; preds = %concatenate.pivot.80.
  %7 = add nsw i32 %0, -60
  br label %concatenate.42.1.merge

concatenate.pivot.100.:                           ; preds = %concatenate.pivot.80.
  %8 = icmp ult i32 %0, 100
  br i1 %8, label %concatenate.pivot.80.4, label %concatenate.pivot.100.5

concatenate.pivot.80.4:                           ; preds = %concatenate.pivot.100.
  %9 = add nsw i32 %0, -80
  br label %concatenate.42.1.merge

concatenate.pivot.100.5:                          ; preds = %concatenate.pivot.100.
  %10 = add nsw i32 %0, -100
  br label %concatenate.42.1.merge

concatenate.42.1.merge:                           ; preds = %concatenate.pivot.20., %concatenate.pivot.100.5, %concatenate.pivot.80.4, %concatenate.pivot.60.3, %concatenate.pivot.40.2, %concatenate.pivot.20.1
  %.sink6 = phi i32 [ %10, %concatenate.pivot.100.5 ], [ %9, %concatenate.pivot.80.4 ], [ %7, %concatenate.pivot.60.3 ], [ %5, %concatenate.pivot.40.2 ], [ %4, %concatenate.pivot.20.1 ], [ %0, %concatenate.pivot.20. ]
  %arg5.sink = phi ptr addrspace(1) [ %arg517, %concatenate.pivot.100.5 ], [ %arg415, %concatenate.pivot.80.4 ], [ %arg313, %concatenate.pivot.60.3 ], [ %arg211, %concatenate.pivot.40.2 ], [ %arg19, %concatenate.pivot.20.1 ], [ %arg07, %concatenate.pivot.20. ]
  %11 = zext nneg i32 %.sink6 to i64
  %12 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5.sink, i64 0, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !303
  %14 = zext nneg i32 %0 to i64
  %15 = getelementptr double, ptr addrspace(1) %arg619, i64 %14
  store double %13, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg1) local_unnamed_addr #4 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg04, align 128, !invariant.load !303
  %1 = icmp slt i64 %0, 0
  %2 = and i64 %0, 1
  %3 = sub nsw i64 0, %2
  %4 = select i1 %1, i64 %3, i64 %2
  %.lobit = lshr i64 %4, 63
  %5 = and i64 %.lobit, %0
  %6 = add nsw i64 %4, 2
  %7 = trunc nuw i64 %5 to i1
  %8 = select i1 %7, i64 %6, i64 %4
  %9 = icmp eq i64 %8, 0
  %10 = zext i1 %9 to i32
  store i32 %10, ptr addrspace(1) %arg16, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_convert_fusion(ptr noalias nocapture align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg02, align 128
  %1 = ashr i64 %0, 1
  %2 = tail call i64 @llvm.abs.i64(i64 %1, i1 true)
  %3 = tail call range(i64 0, 64) i64 @llvm.ctpop.i64(i64 %2)
  %4 = trunc nuw nsw i64 %3 to i32
  %5 = xor i64 %0, -1
  %6 = add i64 %0, 1
  %7 = and i64 %6, %5
  %8 = add i64 %7, -1
  %9 = sub i64 1, %7
  %10 = icmp slt i64 %8, 0
  %11 = select i1 %10, i64 %9, i64 %8
  %12 = tail call range(i64 0, 65) i64 @llvm.ctpop.i64(i64 %11)
  %13 = trunc nuw nsw i64 %12 to i32
  %14 = add nuw nsw i32 %4, 1
  %15 = sub nsw i32 %14, %13
  store i32 %15, ptr addrspace(1) %arg14, align 128
  store i32 %4, ptr addrspace(1) %arg26, align 128
  store i64 %6, ptr addrspace(1) %arg02, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #1

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg2) local_unnamed_addr #8 {
entry:
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !311
  %0 = icmp ult i32 %thread.id.x, 2
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi i8 [ %13, %x_in_tile-true ], [ 1, %entry ]
  %1 = zext nneg i8 %partial_reduction_result.0 to i32
  %2 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %1, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %3 = trunc i32 %2 to i8
  %4 = and i8 %partial_reduction_result.0, %3
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %.not10.not = icmp eq i32 %thread.id.x, 0
  %param_1.122 = load i32, ptr addrspace(1) %arg116, align 128
  %5 = icmp slt i32 %param_1.122, 0
  %6 = add i32 %param_1.122, 10
  %7 = select i1 %5, i32 %6, i32 %param_1.122
  %8 = select i1 %.not10.not, i32 %7, i32 0
  %9 = icmp sgt i32 %8, -1
  %10 = zext nneg i32 %thread.id.x to i64
  %param_0.93 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg014, i64 0, i64 %10
  %param_0.936 = load i32, ptr addrspace(1) %param_0.93, align 4, !invariant.load !303
  %11 = icmp sge i32 %param_0.936, %8
  %12 = and i1 %9, %11
  %13 = zext i1 %12 to i8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store i8 %4, ptr addrspace(1) %arg218, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_1(ptr noalias nocapture align 128 dereferenceable(9600) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(960) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #4 {
entry:
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !310
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.97 = load i32, ptr addrspace(1) %arg319, align 128, !invariant.load !303
  %1 = icmp slt i32 %param_3.97, 0
  %2 = add i32 %param_3.97, 10
  %3 = select i1 %1, i32 %2, i32 %param_3.97
  %4 = tail call i32 @llvm.smax.i32(i32 %3, i32 0)
  %5 = tail call i32 @llvm.umin.i32(i32 %4, i32 9)
  %6 = zext nneg i32 %5 to i64
  %param_2.109 = load i8, ptr addrspace(1) %arg217, align 128, !invariant.load !303
  %7 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.1204 = load double, ptr addrspace(1) %7, align 8, !invariant.load !303
  %param_0.88 = getelementptr inbounds [10 x [120 x double]], ptr addrspace(1) %arg013, i64 0, i64 %6, i64 %thread_id_x
  %param_0.8811 = load double, ptr addrspace(1) %param_0.88, align 8
  %8 = trunc i8 %param_2.109 to i1
  %9 = select i1 %8, double %param_1.1204, double %param_0.8811
  store double %9, ptr addrspace(1) %param_0.88, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_and_fusion(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #4 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %1 = load i32, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %2 = icmp sge i32 %0, %1
  %3 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %4 = trunc i8 %3 to i1
  %5 = xor i1 %4, true
  %6 = and i1 %2, %5
  %7 = zext i1 %6 to i8
  store i8 %7, ptr addrspace(1) %arg37, align 128
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(9600) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(960) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(960) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(9600) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7) local_unnamed_addr #2 {
entry:
  %arg7213 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6211 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5209 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4207 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3205 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2203 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1201 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0199 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !311
  %param_2.13953 = load i32, ptr addrspace(1) %arg2203, align 128
  %0 = icmp slt i32 %param_2.13953, 0
  %1 = add i32 %param_2.13953, 10
  %2 = select i1 %0, i32 %1, i32 %param_2.13953
  %3 = tail call i32 @llvm.smax.i32(i32 %2, i32 0)
  %4 = tail call i32 @llvm.umin.i32(i32 %3, i32 9)
  %5 = zext nneg i32 %4 to i64
  %6 = shl nuw nsw i32 %thread.id.x, 1
  %7 = zext nneg i32 %6 to i64
  %param_0.12451 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg0199, i64 0, i64 %7
  %8 = load <2 x double>, ptr addrspace(1) %param_0.12451, align 16, !invariant.load !303
  %param_0.12452235 = extractelement <2 x double> %8, i32 0
  %param_0.12452.1236 = extractelement <2 x double> %8, i32 1
  %param_1.16461 = getelementptr inbounds [10 x [120 x double]], ptr addrspace(1) %arg1201, i64 0, i64 %5, i64 %7
  %9 = load <2 x double>, ptr addrspace(1) %param_1.16461, align 16, !invariant.load !303
  %param_1.16462237 = extractelement <2 x double> %9, i32 0
  %param_1.16462.1238 = extractelement <2 x double> %9, i32 1
  %multiply.2786.563 = fmul double %param_0.12452235, %param_1.16462237
  %param_4.7964 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg4207, i64 0, i64 %7
  %10 = load <2 x double>, ptr addrspace(1) %param_4.7964, align 16, !invariant.load !303
  %param_4.7965239 = extractelement <2 x double> %10, i32 0
  %param_4.7965.1240 = extractelement <2 x double> %10, i32 1
  %param_5.6269 = getelementptr inbounds [10 x [120 x double]], ptr addrspace(1) %arg5209, i64 0, i64 %5, i64 %7
  %11 = load <2 x double>, ptr addrspace(1) %param_5.6269, align 16, !invariant.load !303
  %param_5.6270241 = extractelement <2 x double> %11, i32 0
  %param_5.6270.1242 = extractelement <2 x double> %11, i32 1
  %subtract.225.771 = fsub double %param_4.7965239, %param_5.6270241
  %add.3718.772 = fadd double %param_1.16462237, %subtract.225.771
  %param_3.11773 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg3205, i64 0, i64 %7
  %12 = load <2 x double>, ptr addrspace(1) %param_3.11773, align 16, !invariant.load !303
  %param_3.11774243 = extractelement <2 x double> %12, i32 0
  %param_3.11774.1244 = extractelement <2 x double> %12, i32 1
  %add.3719.975 = fadd double %param_1.16462237, %param_3.11774243
  %multiply.2787.777 = fmul double %add.3719.975, 5.000000e-01
  %subtract.226.578 = fsub double %add.3718.772, %multiply.2787.777
  %multiply.2788.379 = fmul double %multiply.2786.563, %subtract.226.578
  %add.3619.i165 = fadd double %multiply.2788.379, 0.000000e+00
  %multiply.2789.3.clone.185 = fmul double %param_0.12452235, %param_3.11774243
  %multiply.2790.3.clone.1106 = fmul double %multiply.2789.3.clone.185, %subtract.226.578
  %add.3619.i166 = fadd double %multiply.2790.3.clone.1106, 0.000000e+00
  %multiply.2786.563.1 = fmul double %param_0.12452.1236, %param_1.16462.1238
  %subtract.225.771.1 = fsub double %param_4.7965.1240, %param_5.6270.1242
  %add.3718.772.1 = fadd double %param_1.16462.1238, %subtract.225.771.1
  %add.3719.975.1 = fadd double %param_1.16462.1238, %param_3.11774.1244
  %multiply.2787.777.1 = fmul double %add.3719.975.1, 5.000000e-01
  %subtract.226.578.1 = fsub double %add.3718.772.1, %multiply.2787.777.1
  %multiply.2788.379.1 = fmul double %multiply.2786.563.1, %subtract.226.578.1
  %add.3619.i165.1 = fadd double %add.3619.i165, %multiply.2788.379.1
  %multiply.2789.3.clone.185.1 = fmul double %param_0.12452.1236, %param_3.11774.1244
  %multiply.2790.3.clone.1106.1 = fmul double %multiply.2789.3.clone.185.1, %subtract.226.578.1
  %add.3619.i166.1 = fadd double %add.3619.i166, %multiply.2790.3.clone.1106.1
  %13 = or disjoint i32 %thread.id.x, 32
  %14 = icmp ult i32 %13, 60
  br i1 %14, label %loop3.loop_header46.preheader.1, label %x_in_tile-after.7

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after140, %reduction_write_output-true144.then
  ret void

loop3.loop_header46.preheader.1:                  ; preds = %entry
  %15 = shl nuw nsw i32 %13, 1
  %16 = zext nneg i32 %15 to i64
  %param_0.12451.1178 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg0199, i64 0, i64 %16
  %17 = load <2 x double>, ptr addrspace(1) %param_0.12451.1178, align 16, !invariant.load !303
  %param_0.12452.1179225 = extractelement <2 x double> %17, i32 0
  %param_0.12452.1.1226 = extractelement <2 x double> %17, i32 1
  %param_1.16461.1180 = getelementptr inbounds [10 x [120 x double]], ptr addrspace(1) %arg1201, i64 0, i64 %5, i64 %16
  %18 = load <2 x double>, ptr addrspace(1) %param_1.16461.1180, align 16, !invariant.load !303
  %param_1.16462.1181227 = extractelement <2 x double> %18, i32 0
  %param_1.16462.1.1228 = extractelement <2 x double> %18, i32 1
  %multiply.2786.563.1182 = fmul double %param_0.12452.1179225, %param_1.16462.1181227
  %param_4.7964.1183 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg4207, i64 0, i64 %16
  %19 = load <2 x double>, ptr addrspace(1) %param_4.7964.1183, align 16, !invariant.load !303
  %param_4.7965.1184229 = extractelement <2 x double> %19, i32 0
  %param_4.7965.1.1230 = extractelement <2 x double> %19, i32 1
  %param_5.6269.1185 = getelementptr inbounds [10 x [120 x double]], ptr addrspace(1) %arg5209, i64 0, i64 %5, i64 %16
  %20 = load <2 x double>, ptr addrspace(1) %param_5.6269.1185, align 16, !invariant.load !303
  %param_5.6270.1186231 = extractelement <2 x double> %20, i32 0
  %param_5.6270.1.1232 = extractelement <2 x double> %20, i32 1
  %subtract.225.771.1187 = fsub double %param_4.7965.1184229, %param_5.6270.1186231
  %add.3718.772.1188 = fadd double %param_1.16462.1181227, %subtract.225.771.1187
  %param_3.11773.1189 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg3205, i64 0, i64 %16
  %21 = load <2 x double>, ptr addrspace(1) %param_3.11773.1189, align 16, !invariant.load !303
  %param_3.11774.1190233 = extractelement <2 x double> %21, i32 0
  %param_3.11774.1.1234 = extractelement <2 x double> %21, i32 1
  %add.3719.975.1191 = fadd double %param_1.16462.1181227, %param_3.11774.1190233
  %multiply.2787.777.1192 = fmul double %add.3719.975.1191, 5.000000e-01
  %subtract.226.578.1193 = fsub double %add.3718.772.1188, %multiply.2787.777.1192
  %multiply.2788.379.1194 = fmul double %multiply.2786.563.1182, %subtract.226.578.1193
  %add.3619.i165.1195 = fadd double %add.3619.i165.1, %multiply.2788.379.1194
  %multiply.2789.3.clone.185.1196 = fmul double %param_0.12452.1179225, %param_3.11774.1190233
  %multiply.2790.3.clone.1106.1197 = fmul double %multiply.2789.3.clone.185.1196, %subtract.226.578.1193
  %add.3619.i166.1198 = fadd double %add.3619.i166.1, %multiply.2790.3.clone.1106.1197
  %multiply.2786.563.1.1 = fmul double %param_0.12452.1.1226, %param_1.16462.1.1228
  %subtract.225.771.1.1 = fsub double %param_4.7965.1.1230, %param_5.6270.1.1232
  %add.3718.772.1.1 = fadd double %param_1.16462.1.1228, %subtract.225.771.1.1
  %add.3719.975.1.1 = fadd double %param_1.16462.1.1228, %param_3.11774.1.1234
  %multiply.2787.777.1.1 = fmul double %add.3719.975.1.1, 5.000000e-01
  %subtract.226.578.1.1 = fsub double %add.3718.772.1.1, %multiply.2787.777.1.1
  %multiply.2788.379.1.1 = fmul double %multiply.2786.563.1.1, %subtract.226.578.1.1
  %add.3619.i165.1.1 = fadd double %add.3619.i165.1195, %multiply.2788.379.1.1
  %multiply.2789.3.clone.185.1.1 = fmul double %param_0.12452.1.1226, %param_3.11774.1.1234
  %multiply.2790.3.clone.1106.1.1 = fmul double %multiply.2789.3.clone.185.1.1, %subtract.226.578.1.1
  %add.3619.i166.1.1 = fadd double %add.3619.i166.1198, %multiply.2790.3.clone.1106.1.1
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %loop3.loop_header46.preheader.1, %entry
  %partial_reduction_result.1.1 = phi double [ %add.3619.i165.1, %entry ], [ %add.3619.i165.1.1, %loop3.loop_header46.preheader.1 ]
  %partial_reduction_result2.1.1 = phi double [ %add.3619.i166.1, %entry ], [ %add.3619.i166.1.1, %loop3.loop_header46.preheader.1 ]
  %22 = bitcast double %partial_reduction_result.1.1 to <2 x i32>
  %23 = extractelement <2 x i32> %22, i64 0
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 16, i32 31)
  %25 = insertelement <2 x i32> poison, i32 %24, i64 0
  %26 = extractelement <2 x i32> %22, i64 1
  %27 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %26, i32 16, i32 31)
  %28 = insertelement <2 x i32> %25, i32 %27, i64 1
  %29 = bitcast <2 x i32> %28 to double
  %add.3619.i = fadd double %partial_reduction_result.1.1, %29
  %30 = bitcast double %add.3619.i to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 8, i32 31)
  %33 = insertelement <2 x i32> poison, i32 %32, i64 0
  %34 = extractelement <2 x i32> %30, i64 1
  %35 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 8, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to double
  %add.3619.i161 = fadd double %add.3619.i, %37
  %38 = bitcast double %add.3619.i161 to <2 x i32>
  %39 = extractelement <2 x i32> %38, i64 0
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 4, i32 31)
  %41 = insertelement <2 x i32> poison, i32 %40, i64 0
  %42 = extractelement <2 x i32> %38, i64 1
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 4, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 1
  %45 = bitcast <2 x i32> %44 to double
  %add.3619.i162 = fadd double %add.3619.i161, %45
  %46 = bitcast double %add.3619.i162 to <2 x i32>
  %47 = extractelement <2 x i32> %46, i64 0
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 2, i32 31)
  %49 = insertelement <2 x i32> poison, i32 %48, i64 0
  %50 = extractelement <2 x i32> %46, i64 1
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 2, i32 31)
  %52 = insertelement <2 x i32> %49, i32 %51, i64 1
  %53 = bitcast <2 x i32> %52 to double
  %add.3619.i163 = fadd double %add.3619.i162, %53
  %54 = bitcast double %add.3619.i163 to <2 x i32>
  %55 = extractelement <2 x i32> %54, i64 0
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 1, i32 31)
  %57 = extractelement <2 x i32> %54, i64 1
  %58 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %57, i32 1, i32 31)
  %59 = icmp eq i32 %thread.id.x, 0
  %60 = insertelement <2 x i32> poison, i32 %56, i64 0
  %61 = insertelement <2 x i32> %60, i32 %58, i64 1
  %62 = bitcast <2 x i32> %61 to double
  %add.3619.i164 = fadd double %add.3619.i163, %62
  br i1 %59, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %63 = icmp eq i32 %thread.id.x, 0
  tail call void @llvm.nvvm.barrier0()
  %64 = zext nneg i32 %thread.id.x to i64
  %65 = getelementptr inbounds [1 x [1 x double]], ptr addrspace(3) @shared_cache7, i64 0, i64 0, i64 %64
  br i1 %63, label %reduction_write_output-true.then, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true.then
  %66 = icmp eq i32 %thread.id.x, 0
  %67 = bitcast double %partial_reduction_result2.1.1 to <2 x i32>
  %68 = extractelement <2 x i32> %67, i64 0
  %69 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %68, i32 16, i32 31)
  %70 = insertelement <2 x i32> poison, i32 %69, i64 0
  %71 = extractelement <2 x i32> %67, i64 1
  %72 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %71, i32 16, i32 31)
  %73 = insertelement <2 x i32> %70, i32 %72, i64 1
  %74 = bitcast <2 x i32> %73 to double
  %add.3619.i167 = fadd double %partial_reduction_result2.1.1, %74
  %75 = bitcast double %add.3619.i167 to <2 x i32>
  %76 = extractelement <2 x i32> %75, i64 0
  %77 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %76, i32 8, i32 31)
  %78 = insertelement <2 x i32> poison, i32 %77, i64 0
  %79 = extractelement <2 x i32> %75, i64 1
  %80 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %79, i32 8, i32 31)
  %81 = insertelement <2 x i32> %78, i32 %80, i64 1
  %82 = bitcast <2 x i32> %81 to double
  %add.3619.i168 = fadd double %add.3619.i167, %82
  %83 = bitcast double %add.3619.i168 to <2 x i32>
  %84 = extractelement <2 x i32> %83, i64 0
  %85 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %84, i32 4, i32 31)
  %86 = insertelement <2 x i32> poison, i32 %85, i64 0
  %87 = extractelement <2 x i32> %83, i64 1
  %88 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %87, i32 4, i32 31)
  %89 = insertelement <2 x i32> %86, i32 %88, i64 1
  %90 = bitcast <2 x i32> %89 to double
  %add.3619.i169 = fadd double %add.3619.i168, %90
  %91 = bitcast double %add.3619.i169 to <2 x i32>
  %92 = extractelement <2 x i32> %91, i64 0
  %93 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %92, i32 2, i32 31)
  %94 = insertelement <2 x i32> poison, i32 %93, i64 0
  %95 = extractelement <2 x i32> %91, i64 1
  %96 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %95, i32 2, i32 31)
  %97 = insertelement <2 x i32> %94, i32 %96, i64 1
  %98 = bitcast <2 x i32> %97 to double
  %add.3619.i170 = fadd double %add.3619.i169, %98
  %99 = bitcast double %add.3619.i170 to <2 x i32>
  %100 = extractelement <2 x i32> %99, i64 0
  %101 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %100, i32 1, i32 31)
  %102 = extractelement <2 x i32> %99, i64 1
  %103 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %102, i32 1, i32 31)
  %104 = insertelement <2 x i32> poison, i32 %101, i64 0
  %105 = insertelement <2 x i32> %104, i32 %103, i64 1
  %106 = bitcast <2 x i32> %105 to double
  %add.3619.i171 = fadd double %add.3619.i170, %106
  br i1 %66, label %intra_warp_reduce_write-true139, label %intra_warp_reduce_write-after140

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3619.i164, ptr addrspace(3) @shared_cache7, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true.then:                 ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %65, align 8
  store double %output.then.val, ptr addrspace(1) %arg6211, align 128
  br label %inter_warp_reduce-after

intra_warp_reduce_write-after140:                 ; preds = %intra_warp_reduce_write-true139, %inter_warp_reduce-after
  %107 = icmp eq i32 %thread.id.x, 0
  tail call void @llvm.nvvm.barrier0()
  %108 = getelementptr inbounds [1 x [1 x double]], ptr addrspace(3) @shared_cache8, i64 0, i64 0, i64 %64
  br i1 %107, label %reduction_write_output-true144.then, label %reduce-group-0-after

intra_warp_reduce_write-true139:                  ; preds = %inter_warp_reduce-after
  store double %add.3619.i171, ptr addrspace(3) @shared_cache8, align 8
  br label %intra_warp_reduce_write-after140

reduction_write_output-true144.then:              ; preds = %intra_warp_reduce_write-after140
  %output146.then.val = load double, ptr addrspace(3) %108, align 8
  store double %output146.then.val, ptr addrspace(1) %arg7213, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_7(ptr noalias nocapture align 128 dereferenceable(4) %arg0) local_unnamed_addr #4 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg01, align 128
  %1 = add i32 %0, -1
  store i32 %1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_or_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg2) local_unnamed_addr #4 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg14, align 128, !invariant.load !303
  %compare.618.1 = fcmp ole double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !303
  %compare.619.1 = fcmp ole double %1, 0.000000e+00
  %2 = or i1 %compare.618.1, %compare.619.1
  %3 = zext i1 %2 to i8
  store i8 %3, ptr addrspace(1) %arg26, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %compare.649.1 = fcmp olt double %0, -1.000000e+03
  %1 = zext i1 %compare.649.1 to i8
  store i8 %1, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %1 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %2 = or i8 %1, %0
  %3 = zext i8 %2 to i32
  store i32 %3, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_convert_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #4 {
entry:
  %arg3129 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2127 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1125 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0123 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load <2 x i32>, ptr addrspace(1) %arg2127, align 128, !invariant.load !303
  %1 = extractelement <2 x i32> %0, i32 0
  %2 = extractelement <2 x i32> %0, i32 1
  %3 = load double, ptr addrspace(1) %arg0123, align 128, !invariant.load !303
  %4 = load double, ptr addrspace(1) %arg1125, align 128, !invariant.load !303
  %subtract.218.1 = fsub double %3, %4
  %5 = tail call double @llvm.fma.f64(double %subtract.218.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #12
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #12
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %subtract.218.1)
  %9 = tail call double @llvm.fma.f64(double %7, double 0xBC7ABC9E3B39803F, double %8)
  %10 = tail call double @llvm.fma.f64(double %9, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %11 = tail call double @llvm.fma.f64(double %10, double %9, double 0x3EC71DEE62401315)
  %12 = tail call double @llvm.fma.f64(double %11, double %9, double 0x3EFA01997C89EB71)
  %13 = tail call double @llvm.fma.f64(double %12, double %9, double 0x3F2A01A014761F65)
  %14 = tail call double @llvm.fma.f64(double %13, double %9, double 0x3F56C16C1852B7AF)
  %15 = tail call double @llvm.fma.f64(double %14, double %9, double 0x3F81111111122322)
  %16 = tail call double @llvm.fma.f64(double %15, double %9, double 0x3FA55555555502A1)
  %17 = tail call double @llvm.fma.f64(double %16, double %9, double 0x3FC5555555555511)
  %18 = tail call double @llvm.fma.f64(double %17, double %9, double 0x3FE000000000000B)
  %19 = tail call double @llvm.fma.f64(double %18, double %9, double 1.000000e+00)
  %20 = tail call double @llvm.fma.f64(double %19, double %9, double 1.000000e+00)
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #12
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #12
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #12
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.218.1) #12
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #12
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %subtract.218.1, 0.000000e+00
  %31 = fadd double %subtract.218.1, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #12
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #12
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = add i32 %2, 1
  %44 = add i32 %43, %1
  %45 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 13)
  %46 = xor i32 %44, %45
  %47 = add i32 %46, %44
  %48 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 15)
  %49 = xor i32 %47, %48
  %50 = add i32 %49, %47
  %51 = tail call i32 @llvm.fshl.i32(i32 %49, i32 %49, i32 26)
  %52 = xor i32 %50, %51
  %53 = add i32 %52, %50
  %54 = add i32 %53, %2
  %55 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 6)
  %56 = xor i32 %53, %55
  %57 = xor i32 %1, %2
  %58 = xor i32 %57, 466688986
  %59 = add i32 %58, 1
  %60 = add i32 %59, %56
  %61 = add i32 %54, %60
  %62 = tail call i32 @llvm.fshl.i32(i32 %60, i32 %60, i32 17)
  %63 = xor i32 %61, %62
  %64 = add i32 %63, %61
  %65 = tail call i32 @llvm.fshl.i32(i32 %63, i32 %63, i32 29)
  %66 = xor i32 %64, %65
  %67 = add i32 %66, %64
  %68 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 16)
  %69 = xor i32 %67, %68
  %70 = add i32 %69, %67
  %71 = add i32 %70, %58
  %72 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 24)
  %73 = xor i32 %70, %72
  %74 = add i32 %1, 2
  %75 = add i32 %74, %73
  %76 = add i32 %71, %75
  %77 = tail call i32 @llvm.fshl.i32(i32 %75, i32 %75, i32 13)
  %78 = xor i32 %76, %77
  %79 = add i32 %78, %76
  %80 = tail call i32 @llvm.fshl.i32(i32 %78, i32 %78, i32 15)
  %81 = xor i32 %79, %80
  %82 = add i32 %81, %79
  %83 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 26)
  %84 = xor i32 %82, %83
  %85 = add i32 %84, %82
  %86 = add i32 %85, %1
  %87 = tail call i32 @llvm.fshl.i32(i32 %84, i32 %84, i32 6)
  %88 = xor i32 %85, %87
  %89 = add i32 %2, 3
  %90 = add i32 %89, %88
  %91 = add i32 %86, %90
  %92 = tail call i32 @llvm.fshl.i32(i32 %90, i32 %90, i32 17)
  %93 = xor i32 %91, %92
  %94 = add i32 %93, %91
  %95 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %93, i32 29)
  %96 = xor i32 %94, %95
  %97 = add i32 %96, %94
  %98 = tail call i32 @llvm.fshl.i32(i32 %96, i32 %96, i32 16)
  %99 = xor i32 %97, %98
  %100 = add i32 %99, %97
  %101 = add i32 %100, %2
  %102 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %99, i32 24)
  %103 = xor i32 %100, %102
  %104 = add i32 %58, 4
  %105 = add i32 %104, %103
  %106 = add i32 %101, %105
  %107 = tail call i32 @llvm.fshl.i32(i32 %105, i32 %105, i32 13)
  %108 = xor i32 %106, %107
  %109 = add i32 %108, %106
  %110 = tail call i32 @llvm.fshl.i32(i32 %108, i32 %108, i32 15)
  %111 = xor i32 %109, %110
  %112 = add i32 %111, %109
  %113 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %111, i32 26)
  %114 = xor i32 %112, %113
  %115 = add i32 %114, %112
  %116 = add i32 %115, %58
  %117 = zext i32 %116 to i64
  %118 = shl nuw i64 %117, 32
  %119 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %114, i32 6)
  %120 = xor i32 %115, %119
  %121 = add i32 %1, 5
  %122 = add i32 %121, %120
  %123 = zext i32 %122 to i64
  %124 = or disjoint i64 %118, %123
  %125 = lshr i64 %124, 12
  %126 = or disjoint i64 %125, 4607182418800017408
  %127 = bitcast i64 %126 to double
  %add.3659.1 = fadd double %127, -1.000000e+00
  %128 = fcmp ole double %add.3659.1, 0.000000e+00
  %maximum.34.1 = select i1 %128, double 0.000000e+00, double %add.3659.1
  %129 = fcmp oge double %z.2.i, 1.000000e+00
  %minimum.7.1 = select i1 %129, double 1.000000e+00, double %z.2.i
  %compare.607.3 = fcmp olt double %maximum.34.1, %minimum.7.1
  %130 = zext i1 %compare.607.3 to i32
  store i32 %130, ptr addrspace(1) %arg3129, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_add_12(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %1 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %2 = add i64 %1, %0
  store i64 %2, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_add_11(ptr noalias nocapture readonly align 128 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(160) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !312
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !303
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !303
  %add.4076.1 = fadd double %3, %5
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  store double %add.4076.1, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg20) local_unnamed_addr #2 {
entry:
  %arg20624 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19622 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18620 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17618 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16616 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15614 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14612 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13610 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12608 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11606 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10604 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9602 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8600 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7598 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6596 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5594 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4592 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3590 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2588 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1586 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0584 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !311
  %0 = shl nuw nsw i32 %thread.id.x, 1
  br label %loop3.loop_body228

reduce-group-0-after:                             ; preds = %intra_warp_reduce_write-after522, %reduction_write_output-true526.then
  ret void

x_in_tile-after:                                  ; preds = %concatenate.45.2.merge454
  %1 = or disjoint i32 %thread.id.x, 32
  %2 = icmp ult i32 %1, 60
  br i1 %2, label %loop3.loop_header227.preheader.1, label %x_in_tile-after.7

loop3.loop_header227.preheader.1:                 ; preds = %x_in_tile-after
  %3 = shl nuw nsw i32 %1, 1
  %4 = zext nneg i32 %3 to i64
  %param_0.2305232.1 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg0584, i64 0, i64 %4
  %param_0.2305233.1 = load double, ptr addrspace(1) %param_0.2305232.1, align 16, !invariant.load !303
  %5 = icmp ult i32 %1, 40
  br i1 %5, label %concatenate.pivot.60.260.1, label %concatenate.pivot.100.261.1

concatenate.pivot.100.261.1:                      ; preds = %loop3.loop_header227.preheader.1
  %6 = icmp ult i32 %1, 50
  br i1 %6, label %concatenate.pivot.80.262.1, label %concatenate.pivot.100.263.1

concatenate.pivot.100.263.1:                      ; preds = %concatenate.pivot.100.261.1
  %7 = sext i32 %3 to i64
  %8 = getelementptr [20 x double], ptr addrspace(1) %arg6596, i64 0, i64 %7
  %param_6.1102251.1626 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 -800
  br label %concatenate.45.2.merge234.1

concatenate.pivot.80.262.1:                       ; preds = %concatenate.pivot.100.261.1
  %9 = add nsw i32 %3, -80
  %10 = zext nneg i32 %9 to i64
  %param_5.1314248.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5594, i64 0, i64 %10
  br label %concatenate.45.2.merge234.1

concatenate.pivot.60.260.1:                       ; preds = %loop3.loop_header227.preheader.1
  %11 = add nsw i32 %3, -60
  %12 = zext nneg i32 %11 to i64
  %param_4.1569245.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4592, i64 0, i64 %12
  br label %concatenate.45.2.merge234.1

concatenate.45.2.merge234.1:                      ; preds = %concatenate.pivot.60.260.1, %concatenate.pivot.80.262.1, %concatenate.pivot.100.263.1
  %.in.1 = phi ptr addrspace(1) [ %param_4.1569245.1, %concatenate.pivot.60.260.1 ], [ %param_5.1314248.1, %concatenate.pivot.80.262.1 ], [ %param_6.1102251.1626, %concatenate.pivot.100.263.1 ]
  %13 = icmp ult i32 %1, 40
  %14 = load double, ptr addrspace(1) %.in.1, align 8, !invariant.load !303
  %multiply.2979.3264.1 = fmul double %param_0.2305233.1, %14
  br i1 %13, label %concatenate.pivot.60.291.1, label %concatenate.pivot.100.292.1

concatenate.pivot.100.292.1:                      ; preds = %concatenate.45.2.merge234.1
  %15 = icmp ult i32 %1, 50
  br i1 %15, label %concatenate.pivot.80.293.1, label %concatenate.pivot.100.294.1

concatenate.pivot.100.294.1:                      ; preds = %concatenate.pivot.100.292.1
  %16 = sext i32 %3 to i64
  %17 = getelementptr [20 x double], ptr addrspace(1) %arg18620, i64 0, i64 %16
  %param_18.753282.1627 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 -800
  br label %concatenate.pivot.60.314.1

concatenate.pivot.80.293.1:                       ; preds = %concatenate.pivot.100.292.1
  %18 = add nsw i32 %3, -80
  %19 = zext nneg i32 %18 to i64
  %param_17.638279.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg17618, i64 0, i64 %19
  br label %concatenate.pivot.60.314.1

concatenate.pivot.60.291.1:                       ; preds = %concatenate.45.2.merge234.1
  %20 = add nsw i32 %3, -60
  %21 = zext nneg i32 %20 to i64
  %param_16.567276.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg16616, i64 0, i64 %21
  br label %concatenate.pivot.60.314.1

concatenate.pivot.60.314.1:                       ; preds = %concatenate.pivot.60.291.1, %concatenate.pivot.80.293.1, %concatenate.pivot.100.294.1
  %.in546.1 = phi ptr addrspace(1) [ %param_16.567276.1, %concatenate.pivot.60.291.1 ], [ %param_17.638279.1, %concatenate.pivot.80.293.1 ], [ %param_18.753282.1627, %concatenate.pivot.100.294.1 ]
  %22 = icmp ult i32 %1, 40
  %23 = load double, ptr addrspace(1) %.in546.1, align 8, !invariant.load !303
  br i1 %22, label %concatenate.pivot.60.321.1, label %concatenate.pivot.100.322.1

concatenate.pivot.100.322.1:                      ; preds = %concatenate.pivot.60.314.1
  %24 = icmp ult i32 %1, 50
  br i1 %24, label %concatenate.pivot.80.323.1, label %concatenate.pivot.100.324.1

concatenate.pivot.100.324.1:                      ; preds = %concatenate.pivot.100.322.1
  %25 = sext i32 %3 to i64
  %26 = getelementptr [20 x double], ptr addrspace(1) %arg12608, i64 0, i64 %25
  %param_12.502312.1628 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 -800
  br label %concatenate.pivot.60.344.1

concatenate.pivot.80.323.1:                       ; preds = %concatenate.pivot.100.322.1
  %27 = add nsw i32 %3, -80
  %28 = zext nneg i32 %27 to i64
  %param_11.530309.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg11606, i64 0, i64 %28
  br label %concatenate.pivot.60.344.1

concatenate.pivot.60.321.1:                       ; preds = %concatenate.pivot.60.314.1
  %29 = add nsw i32 %3, -60
  %30 = zext nneg i32 %29 to i64
  %param_10.644306.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg10604, i64 0, i64 %30
  br label %concatenate.pivot.60.344.1

concatenate.pivot.60.344.1:                       ; preds = %concatenate.pivot.60.321.1, %concatenate.pivot.80.323.1, %concatenate.pivot.100.324.1
  %.in547.1 = phi ptr addrspace(1) [ %param_10.644306.1, %concatenate.pivot.60.321.1 ], [ %param_11.530309.1, %concatenate.pivot.80.323.1 ], [ %param_12.502312.1628, %concatenate.pivot.100.324.1 ]
  %31 = icmp ult i32 %1, 40
  %32 = load double, ptr addrspace(1) %.in547.1, align 8, !invariant.load !303
  br i1 %31, label %concatenate.pivot.60.351.1, label %concatenate.pivot.100.352.1

concatenate.pivot.100.352.1:                      ; preds = %concatenate.pivot.60.344.1
  %33 = icmp ult i32 %1, 50
  br i1 %33, label %concatenate.pivot.80.353.1, label %concatenate.pivot.100.354.1

concatenate.pivot.100.354.1:                      ; preds = %concatenate.pivot.100.352.1
  %34 = sext i32 %3 to i64
  %35 = getelementptr [20 x double], ptr addrspace(1) %arg6596, i64 0, i64 %34
  %param_6.1102342.1629 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 -800
  br label %concatenate.45.2.merge325.1

concatenate.pivot.80.353.1:                       ; preds = %concatenate.pivot.100.352.1
  %36 = add nsw i32 %3, -80
  %37 = zext nneg i32 %36 to i64
  %param_5.1314339.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5594, i64 0, i64 %37
  br label %concatenate.45.2.merge325.1

concatenate.pivot.60.351.1:                       ; preds = %concatenate.pivot.60.344.1
  %38 = add nsw i32 %3, -60
  %39 = zext nneg i32 %38 to i64
  %param_4.1569336.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4592, i64 0, i64 %39
  br label %concatenate.45.2.merge325.1

concatenate.45.2.merge325.1:                      ; preds = %concatenate.pivot.60.351.1, %concatenate.pivot.80.353.1, %concatenate.pivot.100.354.1
  %.in548.1 = phi ptr addrspace(1) [ %param_4.1569336.1, %concatenate.pivot.60.351.1 ], [ %param_5.1314339.1, %concatenate.pivot.80.353.1 ], [ %param_6.1102342.1629, %concatenate.pivot.100.354.1 ]
  %40 = icmp ult i32 %1, 40
  %41 = load double, ptr addrspace(1) %.in548.1, align 8, !invariant.load !303
  %add.4079.5355.1 = fadd double %32, %41
  %multiply.2980.5357.1 = fmul double %add.4079.5355.1, 5.000000e-01
  %subtract.240.5358.1 = fsub double %23, %multiply.2980.5357.1
  %multiply.2981.3359.1 = fmul double %multiply.2979.3264.1, %subtract.240.5358.1
  %add.3619.i571.1 = fadd double %add.3619.i571, %multiply.2981.3359.1
  br i1 %40, label %concatenate.pivot.60.389.1, label %concatenate.pivot.100.390.1

concatenate.pivot.100.390.1:                      ; preds = %concatenate.45.2.merge325.1
  %42 = icmp ult i32 %1, 50
  br i1 %42, label %concatenate.pivot.80.391.1, label %concatenate.pivot.100.392.1

concatenate.pivot.100.392.1:                      ; preds = %concatenate.pivot.100.390.1
  %43 = sext i32 %3 to i64
  %44 = getelementptr [20 x double], ptr addrspace(1) %arg12608, i64 0, i64 %43
  %param_12.502380.1630 = getelementptr inbounds i8, ptr addrspace(1) %44, i64 -800
  br label %concatenate.47.6.merge363.1

concatenate.pivot.80.391.1:                       ; preds = %concatenate.pivot.100.390.1
  %45 = add nsw i32 %3, -80
  %46 = zext nneg i32 %45 to i64
  %param_11.530377.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg11606, i64 0, i64 %46
  br label %concatenate.47.6.merge363.1

concatenate.pivot.60.389.1:                       ; preds = %concatenate.45.2.merge325.1
  %47 = add nsw i32 %3, -60
  %48 = zext nneg i32 %47 to i64
  %param_10.644374.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg10604, i64 0, i64 %48
  br label %concatenate.47.6.merge363.1

concatenate.47.6.merge363.1:                      ; preds = %concatenate.pivot.60.389.1, %concatenate.pivot.80.391.1, %concatenate.pivot.100.392.1
  %.in549.1 = phi ptr addrspace(1) [ %param_10.644374.1, %concatenate.pivot.60.389.1 ], [ %param_11.530377.1, %concatenate.pivot.80.391.1 ], [ %param_12.502380.1630, %concatenate.pivot.100.392.1 ]
  %49 = icmp ult i32 %1, 40
  %50 = load double, ptr addrspace(1) %.in549.1, align 8, !invariant.load !303
  %multiply.2982.3.clone.1393.1 = fmul double %param_0.2305233.1, %50
  br i1 %49, label %concatenate.pivot.60.420.1, label %concatenate.pivot.100.421.1

concatenate.pivot.100.421.1:                      ; preds = %concatenate.47.6.merge363.1
  %51 = icmp ult i32 %1, 50
  br i1 %51, label %concatenate.pivot.80.422.1, label %concatenate.pivot.100.423.1

concatenate.pivot.100.423.1:                      ; preds = %concatenate.pivot.100.421.1
  %52 = sext i32 %3 to i64
  %53 = getelementptr [20 x double], ptr addrspace(1) %arg18620, i64 0, i64 %52
  %param_18.753411.1631 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 -800
  br label %concatenate.pivot.60.443.1

concatenate.pivot.80.422.1:                       ; preds = %concatenate.pivot.100.421.1
  %54 = add nsw i32 %3, -80
  %55 = zext nneg i32 %54 to i64
  %param_17.638408.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg17618, i64 0, i64 %55
  br label %concatenate.pivot.60.443.1

concatenate.pivot.60.420.1:                       ; preds = %concatenate.47.6.merge363.1
  %56 = add nsw i32 %3, -60
  %57 = zext nneg i32 %56 to i64
  %param_16.567405.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg16616, i64 0, i64 %57
  br label %concatenate.pivot.60.443.1

concatenate.pivot.60.443.1:                       ; preds = %concatenate.pivot.60.420.1, %concatenate.pivot.80.422.1, %concatenate.pivot.100.423.1
  %.in550.1 = phi ptr addrspace(1) [ %param_16.567405.1, %concatenate.pivot.60.420.1 ], [ %param_17.638408.1, %concatenate.pivot.80.422.1 ], [ %param_18.753411.1631, %concatenate.pivot.100.423.1 ]
  %58 = icmp ult i32 %1, 40
  %59 = load double, ptr addrspace(1) %.in550.1, align 8, !invariant.load !303
  br i1 %58, label %concatenate.pivot.60.450.1, label %concatenate.pivot.100.451.1

concatenate.pivot.100.451.1:                      ; preds = %concatenate.pivot.60.443.1
  %60 = icmp ult i32 %1, 50
  br i1 %60, label %concatenate.pivot.80.452.1, label %concatenate.pivot.100.453.1

concatenate.pivot.100.453.1:                      ; preds = %concatenate.pivot.100.451.1
  %61 = sext i32 %3 to i64
  %62 = getelementptr [20 x double], ptr addrspace(1) %arg12608, i64 0, i64 %61
  %param_12.502441.1632 = getelementptr inbounds i8, ptr addrspace(1) %62, i64 -800
  br label %concatenate.pivot.60.473.1

concatenate.pivot.80.452.1:                       ; preds = %concatenate.pivot.100.451.1
  %63 = add nsw i32 %3, -80
  %64 = zext nneg i32 %63 to i64
  %param_11.530438.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg11606, i64 0, i64 %64
  br label %concatenate.pivot.60.473.1

concatenate.pivot.60.450.1:                       ; preds = %concatenate.pivot.60.443.1
  %65 = add nsw i32 %3, -60
  %66 = zext nneg i32 %65 to i64
  %param_10.644435.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg10604, i64 0, i64 %66
  br label %concatenate.pivot.60.473.1

concatenate.pivot.60.473.1:                       ; preds = %concatenate.pivot.60.450.1, %concatenate.pivot.80.452.1, %concatenate.pivot.100.453.1
  %.in551.1 = phi ptr addrspace(1) [ %param_10.644435.1, %concatenate.pivot.60.450.1 ], [ %param_11.530438.1, %concatenate.pivot.80.452.1 ], [ %param_12.502441.1632, %concatenate.pivot.100.453.1 ]
  %67 = icmp ult i32 %1, 40
  %68 = load double, ptr addrspace(1) %.in551.1, align 8, !invariant.load !303
  br i1 %67, label %concatenate.pivot.60.480.1, label %concatenate.pivot.100.481.1

concatenate.pivot.100.481.1:                      ; preds = %concatenate.pivot.60.473.1
  %69 = icmp ult i32 %1, 50
  br i1 %69, label %concatenate.pivot.80.482.1, label %concatenate.pivot.100.483.1

concatenate.pivot.100.483.1:                      ; preds = %concatenate.pivot.100.481.1
  %70 = sext i32 %3 to i64
  %71 = getelementptr [20 x double], ptr addrspace(1) %arg6596, i64 0, i64 %70
  %param_6.1102471.1633 = getelementptr inbounds i8, ptr addrspace(1) %71, i64 -800
  br label %concatenate.45.2.merge454.1

concatenate.pivot.80.482.1:                       ; preds = %concatenate.pivot.100.481.1
  %72 = add nsw i32 %3, -80
  %73 = zext nneg i32 %72 to i64
  %param_5.1314468.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5594, i64 0, i64 %73
  br label %concatenate.45.2.merge454.1

concatenate.pivot.60.480.1:                       ; preds = %concatenate.pivot.60.473.1
  %74 = add nsw i32 %3, -60
  %75 = zext nneg i32 %74 to i64
  %param_4.1569465.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4592, i64 0, i64 %75
  br label %concatenate.45.2.merge454.1

concatenate.45.2.merge454.1:                      ; preds = %concatenate.pivot.60.480.1, %concatenate.pivot.80.482.1, %concatenate.pivot.100.483.1
  %.in552.1 = phi ptr addrspace(1) [ %param_4.1569465.1, %concatenate.pivot.60.480.1 ], [ %param_5.1314468.1, %concatenate.pivot.80.482.1 ], [ %param_6.1102471.1633, %concatenate.pivot.100.483.1 ]
  %76 = icmp ult i32 %1, 40
  %77 = load double, ptr addrspace(1) %.in552.1, align 8, !invariant.load !303
  %add.4079.5484.1 = fadd double %68, %77
  %multiply.2980.5486.1 = fmul double %add.4079.5484.1, 5.000000e-01
  %subtract.240.5487.1 = fsub double %59, %multiply.2980.5486.1
  %multiply.2983.3.clone.1488.1 = fmul double %multiply.2982.3.clone.1393.1, %subtract.240.5487.1
  %add.3619.i572.1 = fadd double %add.3619.i572, %multiply.2983.3.clone.1488.1
  %param_0.2305232.1.1634 = getelementptr inbounds i8, ptr addrspace(1) %param_0.2305232.1, i64 8
  %param_0.2305233.1.1 = load double, ptr addrspace(1) %param_0.2305232.1.1634, align 8, !invariant.load !303
  br i1 %76, label %concatenate.pivot.60.260.1.1, label %concatenate.pivot.100.261.1.1

concatenate.pivot.100.261.1.1:                    ; preds = %concatenate.45.2.merge454.1
  %78 = icmp ult i32 %1, 50
  br i1 %78, label %concatenate.pivot.80.262.1.1, label %concatenate.pivot.100.263.1.1

concatenate.pivot.100.263.1.1:                    ; preds = %concatenate.pivot.100.261.1.1
  %79 = sext i32 %3 to i64
  %80 = getelementptr [20 x double], ptr addrspace(1) %arg6596, i64 0, i64 %79
  %param_6.1102251.1.1635 = getelementptr inbounds i8, ptr addrspace(1) %80, i64 -792
  br label %concatenate.45.2.merge234.1.1

concatenate.pivot.80.262.1.1:                     ; preds = %concatenate.pivot.100.261.1.1
  %81 = add nsw i32 %3, -79
  %82 = zext nneg i32 %81 to i64
  %param_5.1314248.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5594, i64 0, i64 %82
  br label %concatenate.45.2.merge234.1.1

concatenate.pivot.60.260.1.1:                     ; preds = %concatenate.45.2.merge454.1
  %83 = add nsw i32 %3, -59
  %84 = zext nneg i32 %83 to i64
  %param_4.1569245.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4592, i64 0, i64 %84
  br label %concatenate.45.2.merge234.1.1

concatenate.45.2.merge234.1.1:                    ; preds = %concatenate.pivot.60.260.1.1, %concatenate.pivot.80.262.1.1, %concatenate.pivot.100.263.1.1
  %.in.1.1 = phi ptr addrspace(1) [ %param_4.1569245.1.1, %concatenate.pivot.60.260.1.1 ], [ %param_5.1314248.1.1, %concatenate.pivot.80.262.1.1 ], [ %param_6.1102251.1.1635, %concatenate.pivot.100.263.1.1 ]
  %85 = icmp ult i32 %1, 40
  %86 = load double, ptr addrspace(1) %.in.1.1, align 8, !invariant.load !303
  %multiply.2979.3264.1.1 = fmul double %param_0.2305233.1.1, %86
  br i1 %85, label %concatenate.pivot.60.291.1.1, label %concatenate.pivot.100.292.1.1

concatenate.pivot.100.292.1.1:                    ; preds = %concatenate.45.2.merge234.1.1
  %87 = icmp ult i32 %1, 50
  br i1 %87, label %concatenate.pivot.80.293.1.1, label %concatenate.pivot.100.294.1.1

concatenate.pivot.100.294.1.1:                    ; preds = %concatenate.pivot.100.292.1.1
  %88 = sext i32 %3 to i64
  %89 = getelementptr [20 x double], ptr addrspace(1) %arg18620, i64 0, i64 %88
  %param_18.753282.1.1636 = getelementptr inbounds i8, ptr addrspace(1) %89, i64 -792
  br label %concatenate.pivot.60.314.1.1

concatenate.pivot.80.293.1.1:                     ; preds = %concatenate.pivot.100.292.1.1
  %90 = add nsw i32 %3, -79
  %91 = zext nneg i32 %90 to i64
  %param_17.638279.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg17618, i64 0, i64 %91
  br label %concatenate.pivot.60.314.1.1

concatenate.pivot.60.291.1.1:                     ; preds = %concatenate.45.2.merge234.1.1
  %92 = add nsw i32 %3, -59
  %93 = zext nneg i32 %92 to i64
  %param_16.567276.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg16616, i64 0, i64 %93
  br label %concatenate.pivot.60.314.1.1

concatenate.pivot.60.314.1.1:                     ; preds = %concatenate.pivot.60.291.1.1, %concatenate.pivot.80.293.1.1, %concatenate.pivot.100.294.1.1
  %.in546.1.1 = phi ptr addrspace(1) [ %param_16.567276.1.1, %concatenate.pivot.60.291.1.1 ], [ %param_17.638279.1.1, %concatenate.pivot.80.293.1.1 ], [ %param_18.753282.1.1636, %concatenate.pivot.100.294.1.1 ]
  %94 = icmp ult i32 %1, 40
  %95 = load double, ptr addrspace(1) %.in546.1.1, align 8, !invariant.load !303
  br i1 %94, label %concatenate.pivot.60.321.1.1, label %concatenate.pivot.100.322.1.1

concatenate.pivot.100.322.1.1:                    ; preds = %concatenate.pivot.60.314.1.1
  %96 = icmp ult i32 %1, 50
  br i1 %96, label %concatenate.pivot.80.323.1.1, label %concatenate.pivot.100.324.1.1

concatenate.pivot.100.324.1.1:                    ; preds = %concatenate.pivot.100.322.1.1
  %97 = sext i32 %3 to i64
  %98 = getelementptr [20 x double], ptr addrspace(1) %arg12608, i64 0, i64 %97
  %param_12.502312.1.1637 = getelementptr inbounds i8, ptr addrspace(1) %98, i64 -792
  br label %concatenate.pivot.60.344.1.1

concatenate.pivot.80.323.1.1:                     ; preds = %concatenate.pivot.100.322.1.1
  %99 = add nsw i32 %3, -79
  %100 = zext nneg i32 %99 to i64
  %param_11.530309.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg11606, i64 0, i64 %100
  br label %concatenate.pivot.60.344.1.1

concatenate.pivot.60.321.1.1:                     ; preds = %concatenate.pivot.60.314.1.1
  %101 = add nsw i32 %3, -59
  %102 = zext nneg i32 %101 to i64
  %param_10.644306.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg10604, i64 0, i64 %102
  br label %concatenate.pivot.60.344.1.1

concatenate.pivot.60.344.1.1:                     ; preds = %concatenate.pivot.60.321.1.1, %concatenate.pivot.80.323.1.1, %concatenate.pivot.100.324.1.1
  %.in547.1.1 = phi ptr addrspace(1) [ %param_10.644306.1.1, %concatenate.pivot.60.321.1.1 ], [ %param_11.530309.1.1, %concatenate.pivot.80.323.1.1 ], [ %param_12.502312.1.1637, %concatenate.pivot.100.324.1.1 ]
  %103 = icmp ult i32 %1, 40
  %104 = load double, ptr addrspace(1) %.in547.1.1, align 8, !invariant.load !303
  br i1 %103, label %concatenate.pivot.60.351.1.1, label %concatenate.pivot.100.352.1.1

concatenate.pivot.100.352.1.1:                    ; preds = %concatenate.pivot.60.344.1.1
  %105 = icmp ult i32 %1, 50
  br i1 %105, label %concatenate.pivot.80.353.1.1, label %concatenate.pivot.100.354.1.1

concatenate.pivot.100.354.1.1:                    ; preds = %concatenate.pivot.100.352.1.1
  %106 = sext i32 %3 to i64
  %107 = getelementptr [20 x double], ptr addrspace(1) %arg6596, i64 0, i64 %106
  %param_6.1102342.1.1638 = getelementptr inbounds i8, ptr addrspace(1) %107, i64 -792
  br label %concatenate.45.2.merge325.1.1

concatenate.pivot.80.353.1.1:                     ; preds = %concatenate.pivot.100.352.1.1
  %108 = add nsw i32 %3, -79
  %109 = zext nneg i32 %108 to i64
  %param_5.1314339.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5594, i64 0, i64 %109
  br label %concatenate.45.2.merge325.1.1

concatenate.pivot.60.351.1.1:                     ; preds = %concatenate.pivot.60.344.1.1
  %110 = add nsw i32 %3, -59
  %111 = zext nneg i32 %110 to i64
  %param_4.1569336.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4592, i64 0, i64 %111
  br label %concatenate.45.2.merge325.1.1

concatenate.45.2.merge325.1.1:                    ; preds = %concatenate.pivot.60.351.1.1, %concatenate.pivot.80.353.1.1, %concatenate.pivot.100.354.1.1
  %.in548.1.1 = phi ptr addrspace(1) [ %param_4.1569336.1.1, %concatenate.pivot.60.351.1.1 ], [ %param_5.1314339.1.1, %concatenate.pivot.80.353.1.1 ], [ %param_6.1102342.1.1638, %concatenate.pivot.100.354.1.1 ]
  %112 = icmp ult i32 %1, 40
  %113 = load double, ptr addrspace(1) %.in548.1.1, align 8, !invariant.load !303
  %add.4079.5355.1.1 = fadd double %104, %113
  %multiply.2980.5357.1.1 = fmul double %add.4079.5355.1.1, 5.000000e-01
  %subtract.240.5358.1.1 = fsub double %95, %multiply.2980.5357.1.1
  %multiply.2981.3359.1.1 = fmul double %multiply.2979.3264.1.1, %subtract.240.5358.1.1
  %add.3619.i571.1.1 = fadd double %add.3619.i571.1, %multiply.2981.3359.1.1
  br i1 %112, label %concatenate.pivot.60.389.1.1, label %concatenate.pivot.100.390.1.1

concatenate.pivot.100.390.1.1:                    ; preds = %concatenate.45.2.merge325.1.1
  %114 = icmp ult i32 %1, 50
  br i1 %114, label %concatenate.pivot.80.391.1.1, label %concatenate.pivot.100.392.1.1

concatenate.pivot.100.392.1.1:                    ; preds = %concatenate.pivot.100.390.1.1
  %115 = sext i32 %3 to i64
  %116 = getelementptr [20 x double], ptr addrspace(1) %arg12608, i64 0, i64 %115
  %param_12.502380.1.1639 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 -792
  br label %concatenate.47.6.merge363.1.1

concatenate.pivot.80.391.1.1:                     ; preds = %concatenate.pivot.100.390.1.1
  %117 = add nsw i32 %3, -79
  %118 = zext nneg i32 %117 to i64
  %param_11.530377.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg11606, i64 0, i64 %118
  br label %concatenate.47.6.merge363.1.1

concatenate.pivot.60.389.1.1:                     ; preds = %concatenate.45.2.merge325.1.1
  %119 = add nsw i32 %3, -59
  %120 = zext nneg i32 %119 to i64
  %param_10.644374.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg10604, i64 0, i64 %120
  br label %concatenate.47.6.merge363.1.1

concatenate.47.6.merge363.1.1:                    ; preds = %concatenate.pivot.60.389.1.1, %concatenate.pivot.80.391.1.1, %concatenate.pivot.100.392.1.1
  %.in549.1.1 = phi ptr addrspace(1) [ %param_10.644374.1.1, %concatenate.pivot.60.389.1.1 ], [ %param_11.530377.1.1, %concatenate.pivot.80.391.1.1 ], [ %param_12.502380.1.1639, %concatenate.pivot.100.392.1.1 ]
  %121 = icmp ult i32 %1, 40
  %122 = load double, ptr addrspace(1) %.in549.1.1, align 8, !invariant.load !303
  %multiply.2982.3.clone.1393.1.1 = fmul double %param_0.2305233.1.1, %122
  br i1 %121, label %concatenate.pivot.60.420.1.1, label %concatenate.pivot.100.421.1.1

concatenate.pivot.100.421.1.1:                    ; preds = %concatenate.47.6.merge363.1.1
  %123 = icmp ult i32 %1, 50
  br i1 %123, label %concatenate.pivot.80.422.1.1, label %concatenate.pivot.100.423.1.1

concatenate.pivot.100.423.1.1:                    ; preds = %concatenate.pivot.100.421.1.1
  %124 = sext i32 %3 to i64
  %125 = getelementptr [20 x double], ptr addrspace(1) %arg18620, i64 0, i64 %124
  %param_18.753411.1.1640 = getelementptr inbounds i8, ptr addrspace(1) %125, i64 -792
  br label %concatenate.pivot.60.443.1.1

concatenate.pivot.80.422.1.1:                     ; preds = %concatenate.pivot.100.421.1.1
  %126 = add nsw i32 %3, -79
  %127 = zext nneg i32 %126 to i64
  %param_17.638408.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg17618, i64 0, i64 %127
  br label %concatenate.pivot.60.443.1.1

concatenate.pivot.60.420.1.1:                     ; preds = %concatenate.47.6.merge363.1.1
  %128 = add nsw i32 %3, -59
  %129 = zext nneg i32 %128 to i64
  %param_16.567405.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg16616, i64 0, i64 %129
  br label %concatenate.pivot.60.443.1.1

concatenate.pivot.60.443.1.1:                     ; preds = %concatenate.pivot.60.420.1.1, %concatenate.pivot.80.422.1.1, %concatenate.pivot.100.423.1.1
  %.in550.1.1 = phi ptr addrspace(1) [ %param_16.567405.1.1, %concatenate.pivot.60.420.1.1 ], [ %param_17.638408.1.1, %concatenate.pivot.80.422.1.1 ], [ %param_18.753411.1.1640, %concatenate.pivot.100.423.1.1 ]
  %130 = icmp ult i32 %1, 40
  %131 = load double, ptr addrspace(1) %.in550.1.1, align 8, !invariant.load !303
  br i1 %130, label %concatenate.pivot.60.450.1.1, label %concatenate.pivot.100.451.1.1

concatenate.pivot.100.451.1.1:                    ; preds = %concatenate.pivot.60.443.1.1
  %132 = icmp ult i32 %1, 50
  br i1 %132, label %concatenate.pivot.80.452.1.1, label %concatenate.pivot.100.453.1.1

concatenate.pivot.100.453.1.1:                    ; preds = %concatenate.pivot.100.451.1.1
  %133 = sext i32 %3 to i64
  %134 = getelementptr [20 x double], ptr addrspace(1) %arg12608, i64 0, i64 %133
  %param_12.502441.1.1641 = getelementptr inbounds i8, ptr addrspace(1) %134, i64 -792
  br label %concatenate.pivot.60.473.1.1

concatenate.pivot.80.452.1.1:                     ; preds = %concatenate.pivot.100.451.1.1
  %135 = add nsw i32 %3, -79
  %136 = zext nneg i32 %135 to i64
  %param_11.530438.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg11606, i64 0, i64 %136
  br label %concatenate.pivot.60.473.1.1

concatenate.pivot.60.450.1.1:                     ; preds = %concatenate.pivot.60.443.1.1
  %137 = add nsw i32 %3, -59
  %138 = zext nneg i32 %137 to i64
  %param_10.644435.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg10604, i64 0, i64 %138
  br label %concatenate.pivot.60.473.1.1

concatenate.pivot.60.473.1.1:                     ; preds = %concatenate.pivot.60.450.1.1, %concatenate.pivot.80.452.1.1, %concatenate.pivot.100.453.1.1
  %.in551.1.1 = phi ptr addrspace(1) [ %param_10.644435.1.1, %concatenate.pivot.60.450.1.1 ], [ %param_11.530438.1.1, %concatenate.pivot.80.452.1.1 ], [ %param_12.502441.1.1641, %concatenate.pivot.100.453.1.1 ]
  %139 = icmp ult i32 %1, 40
  %140 = load double, ptr addrspace(1) %.in551.1.1, align 8, !invariant.load !303
  br i1 %139, label %concatenate.pivot.60.480.1.1, label %concatenate.pivot.100.481.1.1

concatenate.pivot.100.481.1.1:                    ; preds = %concatenate.pivot.60.473.1.1
  %141 = icmp ult i32 %1, 50
  br i1 %141, label %concatenate.pivot.80.482.1.1, label %concatenate.pivot.100.483.1.1

concatenate.pivot.100.483.1.1:                    ; preds = %concatenate.pivot.100.481.1.1
  %142 = sext i32 %3 to i64
  %143 = getelementptr [20 x double], ptr addrspace(1) %arg6596, i64 0, i64 %142
  %param_6.1102471.1.1642 = getelementptr inbounds i8, ptr addrspace(1) %143, i64 -792
  br label %concatenate.45.2.merge454.1.1

concatenate.pivot.80.482.1.1:                     ; preds = %concatenate.pivot.100.481.1.1
  %144 = add nsw i32 %3, -79
  %145 = zext nneg i32 %144 to i64
  %param_5.1314468.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg5594, i64 0, i64 %145
  br label %concatenate.45.2.merge454.1.1

concatenate.pivot.60.480.1.1:                     ; preds = %concatenate.pivot.60.473.1.1
  %146 = add nsw i32 %3, -59
  %147 = zext nneg i32 %146 to i64
  %param_4.1569465.1.1 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4592, i64 0, i64 %147
  br label %concatenate.45.2.merge454.1.1

concatenate.45.2.merge454.1.1:                    ; preds = %concatenate.pivot.60.480.1.1, %concatenate.pivot.80.482.1.1, %concatenate.pivot.100.483.1.1
  %.in552.1.1 = phi ptr addrspace(1) [ %param_4.1569465.1.1, %concatenate.pivot.60.480.1.1 ], [ %param_5.1314468.1.1, %concatenate.pivot.80.482.1.1 ], [ %param_6.1102471.1.1642, %concatenate.pivot.100.483.1.1 ]
  %148 = load double, ptr addrspace(1) %.in552.1.1, align 8, !invariant.load !303
  %add.4079.5484.1.1 = fadd double %140, %148
  %multiply.2980.5486.1.1 = fmul double %add.4079.5484.1.1, 5.000000e-01
  %subtract.240.5487.1.1 = fsub double %131, %multiply.2980.5486.1.1
  %multiply.2983.3.clone.1488.1.1 = fmul double %multiply.2982.3.clone.1393.1.1, %subtract.240.5487.1.1
  %add.3619.i572.1.1 = fadd double %add.3619.i572.1, %multiply.2983.3.clone.1488.1.1
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %concatenate.45.2.merge454.1.1, %x_in_tile-after
  %partial_reduction_result.1.1 = phi double [ %add.3619.i571, %x_in_tile-after ], [ %add.3619.i571.1.1, %concatenate.45.2.merge454.1.1 ]
  %partial_reduction_result2.1.1 = phi double [ %add.3619.i572, %x_in_tile-after ], [ %add.3619.i572.1.1, %concatenate.45.2.merge454.1.1 ]
  %149 = bitcast double %partial_reduction_result.1.1 to <2 x i32>
  %150 = extractelement <2 x i32> %149, i64 0
  %151 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %150, i32 16, i32 31)
  %152 = insertelement <2 x i32> poison, i32 %151, i64 0
  %153 = extractelement <2 x i32> %149, i64 1
  %154 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %153, i32 16, i32 31)
  %155 = insertelement <2 x i32> %152, i32 %154, i64 1
  %156 = bitcast <2 x i32> %155 to double
  %add.3619.i = fadd double %partial_reduction_result.1.1, %156
  %157 = bitcast double %add.3619.i to <2 x i32>
  %158 = extractelement <2 x i32> %157, i64 0
  %159 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %158, i32 8, i32 31)
  %160 = insertelement <2 x i32> poison, i32 %159, i64 0
  %161 = extractelement <2 x i32> %157, i64 1
  %162 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %161, i32 8, i32 31)
  %163 = insertelement <2 x i32> %160, i32 %162, i64 1
  %164 = bitcast <2 x i32> %163 to double
  %add.3619.i567 = fadd double %add.3619.i, %164
  %165 = bitcast double %add.3619.i567 to <2 x i32>
  %166 = extractelement <2 x i32> %165, i64 0
  %167 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %166, i32 4, i32 31)
  %168 = insertelement <2 x i32> poison, i32 %167, i64 0
  %169 = extractelement <2 x i32> %165, i64 1
  %170 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %169, i32 4, i32 31)
  %171 = insertelement <2 x i32> %168, i32 %170, i64 1
  %172 = bitcast <2 x i32> %171 to double
  %add.3619.i568 = fadd double %add.3619.i567, %172
  %173 = bitcast double %add.3619.i568 to <2 x i32>
  %174 = extractelement <2 x i32> %173, i64 0
  %175 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %174, i32 2, i32 31)
  %176 = insertelement <2 x i32> poison, i32 %175, i64 0
  %177 = extractelement <2 x i32> %173, i64 1
  %178 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %177, i32 2, i32 31)
  %179 = insertelement <2 x i32> %176, i32 %178, i64 1
  %180 = bitcast <2 x i32> %179 to double
  %add.3619.i569 = fadd double %add.3619.i568, %180
  %181 = bitcast double %add.3619.i569 to <2 x i32>
  %182 = extractelement <2 x i32> %181, i64 0
  %183 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %182, i32 1, i32 31)
  %184 = extractelement <2 x i32> %181, i64 1
  %185 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %184, i32 1, i32 31)
  %186 = icmp eq i32 %thread.id.x, 0
  %187 = insertelement <2 x i32> poison, i32 %183, i64 0
  %188 = insertelement <2 x i32> %187, i32 %185, i64 1
  %189 = bitcast <2 x i32> %188 to double
  %add.3619.i570 = fadd double %add.3619.i569, %189
  br i1 %186, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

loop3.loop_body228:                               ; preds = %entry, %concatenate.45.2.merge454
  %.not = phi i1 [ true, %entry ], [ false, %concatenate.45.2.merge454 ]
  %loop3.invar_address229.0580 = phi i32 [ 0, %entry ], [ 1, %concatenate.45.2.merge454 ]
  %partial_reduction_result2.2579 = phi double [ 0.000000e+00, %entry ], [ %add.3619.i572, %concatenate.45.2.merge454 ]
  %partial_reduction_result.2578 = phi double [ 0.000000e+00, %entry ], [ %add.3619.i571, %concatenate.45.2.merge454 ]
  %190 = icmp ult i32 %thread.id.x, 30
  %191 = or disjoint i32 %loop3.invar_address229.0580, %0
  %192 = zext nneg i32 %191 to i64
  %param_0.2305232 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg0584, i64 0, i64 %192
  %param_0.2305233 = load double, ptr addrspace(1) %param_0.2305232, align 8, !invariant.load !303
  br i1 %190, label %concatenate.pivot.20.254, label %concatenate.pivot.60.260

concatenate.pivot.20.254:                         ; preds = %loop3.loop_body228
  %193 = icmp ult i32 %thread.id.x, 10
  br i1 %193, label %concatenate.pivot.0.255, label %concatenate.pivot.40.256

concatenate.pivot.0.255:                          ; preds = %concatenate.pivot.20.254
  %param_1.3191236 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1586, i64 0, i64 %192
  br label %concatenate.45.2.merge234

concatenate.pivot.40.256:                         ; preds = %concatenate.pivot.20.254
  %194 = icmp ult i32 %thread.id.x, 20
  br i1 %194, label %concatenate.pivot.20.257, label %concatenate.pivot.40.258

concatenate.pivot.20.257:                         ; preds = %concatenate.pivot.40.256
  %195 = trunc i64 %192 to i32
  %196 = add nsw i32 %195, -20
  %197 = zext nneg i32 %196 to i64
  %param_2.2655239 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2588, i64 0, i64 %197
  br label %concatenate.45.2.merge234

concatenate.pivot.40.258:                         ; preds = %concatenate.pivot.40.256
  %198 = trunc i64 %192 to i32
  %199 = add nsw i32 %198, -40
  %200 = zext nneg i32 %199 to i64
  %param_3.2048242 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3590, i64 0, i64 %200
  br label %concatenate.45.2.merge234

concatenate.pivot.60.260:                         ; preds = %loop3.loop_body228
  %201 = trunc i64 %192 to i32
  %202 = add nsw i32 %201, -60
  %203 = zext nneg i32 %202 to i64
  %param_4.1569245 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4592, i64 0, i64 %203
  br label %concatenate.45.2.merge234

concatenate.45.2.merge234:                        ; preds = %concatenate.pivot.60.260, %concatenate.pivot.40.258, %concatenate.pivot.20.257, %concatenate.pivot.0.255
  %.in = phi ptr addrspace(1) [ %param_1.3191236, %concatenate.pivot.0.255 ], [ %param_2.2655239, %concatenate.pivot.20.257 ], [ %param_3.2048242, %concatenate.pivot.40.258 ], [ %param_4.1569245, %concatenate.pivot.60.260 ]
  %204 = icmp ult i32 %thread.id.x, 30
  %205 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !303
  %multiply.2979.3264 = fmul double %param_0.2305233, %205
  br i1 %204, label %concatenate.pivot.20.285, label %concatenate.pivot.60.291

concatenate.pivot.20.285:                         ; preds = %concatenate.45.2.merge234
  %206 = icmp ult i32 %thread.id.x, 10
  br i1 %206, label %concatenate.pivot.0.286, label %concatenate.pivot.40.287

concatenate.pivot.0.286:                          ; preds = %concatenate.pivot.20.285
  %param_13.525267 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg13610, i64 0, i64 %192
  br label %concatenate.pivot.60.314

concatenate.pivot.40.287:                         ; preds = %concatenate.pivot.20.285
  %207 = icmp ult i32 %thread.id.x, 20
  br i1 %207, label %concatenate.pivot.20.288, label %concatenate.pivot.40.289

concatenate.pivot.20.288:                         ; preds = %concatenate.pivot.40.287
  %208 = trunc i64 %192 to i32
  %209 = add nsw i32 %208, -20
  %210 = zext nneg i32 %209 to i64
  %param_14.558270 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg14612, i64 0, i64 %210
  br label %concatenate.pivot.60.314

concatenate.pivot.40.289:                         ; preds = %concatenate.pivot.40.287
  %211 = trunc i64 %192 to i32
  %212 = add nsw i32 %211, -40
  %213 = zext nneg i32 %212 to i64
  %param_15.570273 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg15614, i64 0, i64 %213
  br label %concatenate.pivot.60.314

concatenate.pivot.60.291:                         ; preds = %concatenate.45.2.merge234
  %214 = trunc i64 %192 to i32
  %215 = add nsw i32 %214, -60
  %216 = zext nneg i32 %215 to i64
  %param_16.567276 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg16616, i64 0, i64 %216
  br label %concatenate.pivot.60.314

concatenate.pivot.60.314:                         ; preds = %concatenate.pivot.0.286, %concatenate.pivot.20.288, %concatenate.pivot.40.289, %concatenate.pivot.60.291
  %.in546 = phi ptr addrspace(1) [ %param_13.525267, %concatenate.pivot.0.286 ], [ %param_14.558270, %concatenate.pivot.20.288 ], [ %param_15.570273, %concatenate.pivot.40.289 ], [ %param_16.567276, %concatenate.pivot.60.291 ]
  %217 = icmp ult i32 %thread.id.x, 30
  %218 = load double, ptr addrspace(1) %.in546, align 8, !invariant.load !303
  br i1 %217, label %concatenate.pivot.20.315, label %concatenate.pivot.60.321

concatenate.pivot.20.315:                         ; preds = %concatenate.pivot.60.314
  %219 = icmp ult i32 %thread.id.x, 10
  br i1 %219, label %concatenate.pivot.0.316, label %concatenate.pivot.40.317

concatenate.pivot.0.316:                          ; preds = %concatenate.pivot.20.315
  %param_7.1030297 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg7598, i64 0, i64 %192
  br label %concatenate.pivot.60.344

concatenate.pivot.40.317:                         ; preds = %concatenate.pivot.20.315
  %220 = icmp ult i32 %thread.id.x, 20
  br i1 %220, label %concatenate.pivot.20.318, label %concatenate.pivot.40.319

concatenate.pivot.20.318:                         ; preds = %concatenate.pivot.40.317
  %221 = trunc i64 %192 to i32
  %222 = add nsw i32 %221, -20
  %223 = zext nneg i32 %222 to i64
  %param_8.894300 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg8600, i64 0, i64 %223
  br label %concatenate.pivot.60.344

concatenate.pivot.40.319:                         ; preds = %concatenate.pivot.40.317
  %224 = trunc i64 %192 to i32
  %225 = add nsw i32 %224, -40
  %226 = zext nneg i32 %225 to i64
  %param_9.797303 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg9602, i64 0, i64 %226
  br label %concatenate.pivot.60.344

concatenate.pivot.60.321:                         ; preds = %concatenate.pivot.60.314
  %227 = trunc i64 %192 to i32
  %228 = add nsw i32 %227, -60
  %229 = zext nneg i32 %228 to i64
  %param_10.644306 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg10604, i64 0, i64 %229
  br label %concatenate.pivot.60.344

concatenate.pivot.60.344:                         ; preds = %concatenate.pivot.0.316, %concatenate.pivot.20.318, %concatenate.pivot.40.319, %concatenate.pivot.60.321
  %.in547 = phi ptr addrspace(1) [ %param_7.1030297, %concatenate.pivot.0.316 ], [ %param_8.894300, %concatenate.pivot.20.318 ], [ %param_9.797303, %concatenate.pivot.40.319 ], [ %param_10.644306, %concatenate.pivot.60.321 ]
  %230 = icmp ult i32 %thread.id.x, 30
  %231 = load double, ptr addrspace(1) %.in547, align 8, !invariant.load !303
  br i1 %230, label %concatenate.pivot.20.345, label %concatenate.pivot.60.351

concatenate.pivot.20.345:                         ; preds = %concatenate.pivot.60.344
  %232 = icmp ult i32 %thread.id.x, 10
  br i1 %232, label %concatenate.pivot.0.346, label %concatenate.pivot.40.347

concatenate.pivot.0.346:                          ; preds = %concatenate.pivot.20.345
  %param_1.3191327 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1586, i64 0, i64 %192
  br label %concatenate.45.2.merge325

concatenate.pivot.40.347:                         ; preds = %concatenate.pivot.20.345
  %233 = icmp ult i32 %thread.id.x, 20
  br i1 %233, label %concatenate.pivot.20.348, label %concatenate.pivot.40.349

concatenate.pivot.20.348:                         ; preds = %concatenate.pivot.40.347
  %234 = trunc i64 %192 to i32
  %235 = add nsw i32 %234, -20
  %236 = zext nneg i32 %235 to i64
  %param_2.2655330 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2588, i64 0, i64 %236
  br label %concatenate.45.2.merge325

concatenate.pivot.40.349:                         ; preds = %concatenate.pivot.40.347
  %237 = trunc i64 %192 to i32
  %238 = add nsw i32 %237, -40
  %239 = zext nneg i32 %238 to i64
  %param_3.2048333 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3590, i64 0, i64 %239
  br label %concatenate.45.2.merge325

concatenate.pivot.60.351:                         ; preds = %concatenate.pivot.60.344
  %240 = trunc i64 %192 to i32
  %241 = add nsw i32 %240, -60
  %242 = zext nneg i32 %241 to i64
  %param_4.1569336 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4592, i64 0, i64 %242
  br label %concatenate.45.2.merge325

concatenate.45.2.merge325:                        ; preds = %concatenate.pivot.60.351, %concatenate.pivot.40.349, %concatenate.pivot.20.348, %concatenate.pivot.0.346
  %.in548 = phi ptr addrspace(1) [ %param_1.3191327, %concatenate.pivot.0.346 ], [ %param_2.2655330, %concatenate.pivot.20.348 ], [ %param_3.2048333, %concatenate.pivot.40.349 ], [ %param_4.1569336, %concatenate.pivot.60.351 ]
  %243 = icmp ult i32 %thread.id.x, 30
  %244 = load double, ptr addrspace(1) %.in548, align 8, !invariant.load !303
  %add.4079.5355 = fadd double %231, %244
  %multiply.2980.5357 = fmul double %add.4079.5355, 5.000000e-01
  %subtract.240.5358 = fsub double %218, %multiply.2980.5357
  %multiply.2981.3359 = fmul double %multiply.2979.3264, %subtract.240.5358
  %add.3619.i571 = fadd double %partial_reduction_result.2578, %multiply.2981.3359
  br i1 %243, label %concatenate.pivot.20.383, label %concatenate.pivot.60.389

concatenate.pivot.20.383:                         ; preds = %concatenate.45.2.merge325
  %245 = icmp ult i32 %thread.id.x, 10
  br i1 %245, label %concatenate.pivot.0.384, label %concatenate.pivot.40.385

concatenate.pivot.0.384:                          ; preds = %concatenate.pivot.20.383
  %param_7.1030365 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg7598, i64 0, i64 %192
  br label %concatenate.47.6.merge363

concatenate.pivot.40.385:                         ; preds = %concatenate.pivot.20.383
  %246 = icmp ult i32 %thread.id.x, 20
  br i1 %246, label %concatenate.pivot.20.386, label %concatenate.pivot.40.387

concatenate.pivot.20.386:                         ; preds = %concatenate.pivot.40.385
  %247 = trunc i64 %192 to i32
  %248 = add nsw i32 %247, -20
  %249 = zext nneg i32 %248 to i64
  %param_8.894368 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg8600, i64 0, i64 %249
  br label %concatenate.47.6.merge363

concatenate.pivot.40.387:                         ; preds = %concatenate.pivot.40.385
  %250 = trunc i64 %192 to i32
  %251 = add nsw i32 %250, -40
  %252 = zext nneg i32 %251 to i64
  %param_9.797371 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg9602, i64 0, i64 %252
  br label %concatenate.47.6.merge363

concatenate.pivot.60.389:                         ; preds = %concatenate.45.2.merge325
  %253 = trunc i64 %192 to i32
  %254 = add nsw i32 %253, -60
  %255 = zext nneg i32 %254 to i64
  %param_10.644374 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg10604, i64 0, i64 %255
  br label %concatenate.47.6.merge363

concatenate.47.6.merge363:                        ; preds = %concatenate.pivot.60.389, %concatenate.pivot.40.387, %concatenate.pivot.20.386, %concatenate.pivot.0.384
  %.in549 = phi ptr addrspace(1) [ %param_7.1030365, %concatenate.pivot.0.384 ], [ %param_8.894368, %concatenate.pivot.20.386 ], [ %param_9.797371, %concatenate.pivot.40.387 ], [ %param_10.644374, %concatenate.pivot.60.389 ]
  %256 = icmp ult i32 %thread.id.x, 30
  %257 = load double, ptr addrspace(1) %.in549, align 8, !invariant.load !303
  %multiply.2982.3.clone.1393 = fmul double %param_0.2305233, %257
  br i1 %256, label %concatenate.pivot.20.414, label %concatenate.pivot.60.420

concatenate.pivot.20.414:                         ; preds = %concatenate.47.6.merge363
  %258 = icmp ult i32 %thread.id.x, 10
  br i1 %258, label %concatenate.pivot.0.415, label %concatenate.pivot.40.416

concatenate.pivot.0.415:                          ; preds = %concatenate.pivot.20.414
  %param_13.525396 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg13610, i64 0, i64 %192
  br label %concatenate.pivot.60.443

concatenate.pivot.40.416:                         ; preds = %concatenate.pivot.20.414
  %259 = icmp ult i32 %thread.id.x, 20
  br i1 %259, label %concatenate.pivot.20.417, label %concatenate.pivot.40.418

concatenate.pivot.20.417:                         ; preds = %concatenate.pivot.40.416
  %260 = trunc i64 %192 to i32
  %261 = add nsw i32 %260, -20
  %262 = zext nneg i32 %261 to i64
  %param_14.558399 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg14612, i64 0, i64 %262
  br label %concatenate.pivot.60.443

concatenate.pivot.40.418:                         ; preds = %concatenate.pivot.40.416
  %263 = trunc i64 %192 to i32
  %264 = add nsw i32 %263, -40
  %265 = zext nneg i32 %264 to i64
  %param_15.570402 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg15614, i64 0, i64 %265
  br label %concatenate.pivot.60.443

concatenate.pivot.60.420:                         ; preds = %concatenate.47.6.merge363
  %266 = trunc i64 %192 to i32
  %267 = add nsw i32 %266, -60
  %268 = zext nneg i32 %267 to i64
  %param_16.567405 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg16616, i64 0, i64 %268
  br label %concatenate.pivot.60.443

concatenate.pivot.60.443:                         ; preds = %concatenate.pivot.0.415, %concatenate.pivot.20.417, %concatenate.pivot.40.418, %concatenate.pivot.60.420
  %.in550 = phi ptr addrspace(1) [ %param_13.525396, %concatenate.pivot.0.415 ], [ %param_14.558399, %concatenate.pivot.20.417 ], [ %param_15.570402, %concatenate.pivot.40.418 ], [ %param_16.567405, %concatenate.pivot.60.420 ]
  %269 = icmp ult i32 %thread.id.x, 30
  %270 = load double, ptr addrspace(1) %.in550, align 8, !invariant.load !303
  br i1 %269, label %concatenate.pivot.20.444, label %concatenate.pivot.60.450

concatenate.pivot.20.444:                         ; preds = %concatenate.pivot.60.443
  %271 = icmp ult i32 %thread.id.x, 10
  br i1 %271, label %concatenate.pivot.0.445, label %concatenate.pivot.40.446

concatenate.pivot.0.445:                          ; preds = %concatenate.pivot.20.444
  %param_7.1030426 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg7598, i64 0, i64 %192
  br label %concatenate.pivot.60.473

concatenate.pivot.40.446:                         ; preds = %concatenate.pivot.20.444
  %272 = icmp ult i32 %thread.id.x, 20
  br i1 %272, label %concatenate.pivot.20.447, label %concatenate.pivot.40.448

concatenate.pivot.20.447:                         ; preds = %concatenate.pivot.40.446
  %273 = trunc i64 %192 to i32
  %274 = add nsw i32 %273, -20
  %275 = zext nneg i32 %274 to i64
  %param_8.894429 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg8600, i64 0, i64 %275
  br label %concatenate.pivot.60.473

concatenate.pivot.40.448:                         ; preds = %concatenate.pivot.40.446
  %276 = trunc i64 %192 to i32
  %277 = add nsw i32 %276, -40
  %278 = zext nneg i32 %277 to i64
  %param_9.797432 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg9602, i64 0, i64 %278
  br label %concatenate.pivot.60.473

concatenate.pivot.60.450:                         ; preds = %concatenate.pivot.60.443
  %279 = trunc i64 %192 to i32
  %280 = add nsw i32 %279, -60
  %281 = zext nneg i32 %280 to i64
  %param_10.644435 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg10604, i64 0, i64 %281
  br label %concatenate.pivot.60.473

concatenate.pivot.60.473:                         ; preds = %concatenate.pivot.0.445, %concatenate.pivot.20.447, %concatenate.pivot.40.448, %concatenate.pivot.60.450
  %.in551 = phi ptr addrspace(1) [ %param_7.1030426, %concatenate.pivot.0.445 ], [ %param_8.894429, %concatenate.pivot.20.447 ], [ %param_9.797432, %concatenate.pivot.40.448 ], [ %param_10.644435, %concatenate.pivot.60.450 ]
  %282 = icmp ult i32 %thread.id.x, 30
  %283 = load double, ptr addrspace(1) %.in551, align 8, !invariant.load !303
  br i1 %282, label %concatenate.pivot.20.474, label %concatenate.pivot.60.480

concatenate.pivot.20.474:                         ; preds = %concatenate.pivot.60.473
  %284 = icmp ult i32 %thread.id.x, 10
  br i1 %284, label %concatenate.pivot.0.475, label %concatenate.pivot.40.476

concatenate.pivot.0.475:                          ; preds = %concatenate.pivot.20.474
  %param_1.3191456 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg1586, i64 0, i64 %192
  br label %concatenate.45.2.merge454

concatenate.pivot.40.476:                         ; preds = %concatenate.pivot.20.474
  %285 = icmp ult i32 %thread.id.x, 20
  br i1 %285, label %concatenate.pivot.20.477, label %concatenate.pivot.40.478

concatenate.pivot.20.477:                         ; preds = %concatenate.pivot.40.476
  %286 = trunc i64 %192 to i32
  %287 = add nsw i32 %286, -20
  %288 = zext nneg i32 %287 to i64
  %param_2.2655459 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg2588, i64 0, i64 %288
  br label %concatenate.45.2.merge454

concatenate.pivot.40.478:                         ; preds = %concatenate.pivot.40.476
  %289 = trunc i64 %192 to i32
  %290 = add nsw i32 %289, -40
  %291 = zext nneg i32 %290 to i64
  %param_3.2048462 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg3590, i64 0, i64 %291
  br label %concatenate.45.2.merge454

concatenate.pivot.60.480:                         ; preds = %concatenate.pivot.60.473
  %292 = trunc i64 %192 to i32
  %293 = add nsw i32 %292, -60
  %294 = zext nneg i32 %293 to i64
  %param_4.1569465 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg4592, i64 0, i64 %294
  br label %concatenate.45.2.merge454

concatenate.45.2.merge454:                        ; preds = %concatenate.pivot.60.480, %concatenate.pivot.40.478, %concatenate.pivot.20.477, %concatenate.pivot.0.475
  %.in552 = phi ptr addrspace(1) [ %param_1.3191456, %concatenate.pivot.0.475 ], [ %param_2.2655459, %concatenate.pivot.20.477 ], [ %param_3.2048462, %concatenate.pivot.40.478 ], [ %param_4.1569465, %concatenate.pivot.60.480 ]
  %295 = load double, ptr addrspace(1) %.in552, align 8, !invariant.load !303
  %add.4079.5484 = fadd double %283, %295
  %multiply.2980.5486 = fmul double %add.4079.5484, 5.000000e-01
  %subtract.240.5487 = fsub double %270, %multiply.2980.5486
  %multiply.2983.3.clone.1488 = fmul double %multiply.2982.3.clone.1393, %subtract.240.5487
  %add.3619.i572 = fadd double %partial_reduction_result2.2579, %multiply.2983.3.clone.1488
  br i1 %.not, label %loop3.loop_body228, label %x_in_tile-after, !llvm.loop !321

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.7
  %296 = icmp eq i32 %thread.id.x, 0
  tail call void @llvm.nvvm.barrier0()
  %297 = zext nneg i32 %thread.id.x to i64
  %298 = getelementptr inbounds [1 x [1 x double]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 %297
  br i1 %296, label %reduction_write_output-true.then, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true.then
  %299 = icmp eq i32 %thread.id.x, 0
  %300 = bitcast double %partial_reduction_result2.1.1 to <2 x i32>
  %301 = extractelement <2 x i32> %300, i64 0
  %302 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %301, i32 16, i32 31)
  %303 = insertelement <2 x i32> poison, i32 %302, i64 0
  %304 = extractelement <2 x i32> %300, i64 1
  %305 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %304, i32 16, i32 31)
  %306 = insertelement <2 x i32> %303, i32 %305, i64 1
  %307 = bitcast <2 x i32> %306 to double
  %add.3619.i573 = fadd double %partial_reduction_result2.1.1, %307
  %308 = bitcast double %add.3619.i573 to <2 x i32>
  %309 = extractelement <2 x i32> %308, i64 0
  %310 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %309, i32 8, i32 31)
  %311 = insertelement <2 x i32> poison, i32 %310, i64 0
  %312 = extractelement <2 x i32> %308, i64 1
  %313 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %312, i32 8, i32 31)
  %314 = insertelement <2 x i32> %311, i32 %313, i64 1
  %315 = bitcast <2 x i32> %314 to double
  %add.3619.i574 = fadd double %add.3619.i573, %315
  %316 = bitcast double %add.3619.i574 to <2 x i32>
  %317 = extractelement <2 x i32> %316, i64 0
  %318 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %317, i32 4, i32 31)
  %319 = insertelement <2 x i32> poison, i32 %318, i64 0
  %320 = extractelement <2 x i32> %316, i64 1
  %321 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %320, i32 4, i32 31)
  %322 = insertelement <2 x i32> %319, i32 %321, i64 1
  %323 = bitcast <2 x i32> %322 to double
  %add.3619.i575 = fadd double %add.3619.i574, %323
  %324 = bitcast double %add.3619.i575 to <2 x i32>
  %325 = extractelement <2 x i32> %324, i64 0
  %326 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %325, i32 2, i32 31)
  %327 = insertelement <2 x i32> poison, i32 %326, i64 0
  %328 = extractelement <2 x i32> %324, i64 1
  %329 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %328, i32 2, i32 31)
  %330 = insertelement <2 x i32> %327, i32 %329, i64 1
  %331 = bitcast <2 x i32> %330 to double
  %add.3619.i576 = fadd double %add.3619.i575, %331
  %332 = bitcast double %add.3619.i576 to <2 x i32>
  %333 = extractelement <2 x i32> %332, i64 0
  %334 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %333, i32 1, i32 31)
  %335 = extractelement <2 x i32> %332, i64 1
  %336 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %335, i32 1, i32 31)
  %337 = insertelement <2 x i32> poison, i32 %334, i64 0
  %338 = insertelement <2 x i32> %337, i32 %336, i64 1
  %339 = bitcast <2 x i32> %338 to double
  %add.3619.i577 = fadd double %add.3619.i576, %339
  br i1 %299, label %intra_warp_reduce_write-true521, label %intra_warp_reduce_write-after522

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.7
  store double %add.3619.i570, ptr addrspace(3) @shared_cache9, align 8
  br label %intra_warp_reduce_write-after

reduction_write_output-true.then:                 ; preds = %intra_warp_reduce_write-after
  %output.then.val = load double, ptr addrspace(3) %298, align 8
  store double %output.then.val, ptr addrspace(1) %arg19622, align 128
  br label %inter_warp_reduce-after

intra_warp_reduce_write-after522:                 ; preds = %intra_warp_reduce_write-true521, %inter_warp_reduce-after
  %340 = icmp eq i32 %thread.id.x, 0
  tail call void @llvm.nvvm.barrier0()
  %341 = getelementptr inbounds [1 x [1 x double]], ptr addrspace(3) @shared_cache10, i64 0, i64 0, i64 %297
  br i1 %340, label %reduction_write_output-true526.then, label %reduce-group-0-after

intra_warp_reduce_write-true521:                  ; preds = %inter_warp_reduce-after
  store double %add.3619.i577, ptr addrspace(3) @shared_cache10, align 8
  br label %intra_warp_reduce_write-after522

reduction_write_output-true526.then:              ; preds = %intra_warp_reduce_write-after522
  %output528.then.val = load double, ptr addrspace(3) %341, align 8
  store double %output528.then.val, ptr addrspace(1) %arg20624, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_or_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #4 {
entry:
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i8, ptr addrspace(1) %arg02, align 128, !invariant.load !303
  %1 = load double, ptr addrspace(1) %arg26, align 128, !invariant.load !303
  %compare.660.1 = fcmp ole double %1, 0.000000e+00
  %2 = load double, ptr addrspace(1) %arg14, align 128, !invariant.load !303
  %compare.661.1 = fcmp ole double %2, 0.000000e+00
  %3 = or i1 %compare.660.1, %compare.661.1
  %4 = zext i1 %3 to i8
  %5 = or i8 %0, %4
  store i8 %5, ptr addrspace(1) %arg38, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %1 = tail call double @llvm.fma.f64(double %0, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %2 = tail call i32 @llvm.nvvm.d2i.lo(double %1) #12
  %3 = tail call double @llvm.nvvm.add.rn.d(double %1, double 0xC338000000000000) #12
  %4 = tail call double @llvm.fma.f64(double %3, double 0xBFE62E42FEFA39EF, double %0)
  %5 = tail call double @llvm.fma.f64(double %3, double 0xBC7ABC9E3B39803F, double %4)
  %6 = tail call double @llvm.fma.f64(double %5, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %7 = tail call double @llvm.fma.f64(double %6, double %5, double 0x3EC71DEE62401315)
  %8 = tail call double @llvm.fma.f64(double %7, double %5, double 0x3EFA01997C89EB71)
  %9 = tail call double @llvm.fma.f64(double %8, double %5, double 0x3F2A01A014761F65)
  %10 = tail call double @llvm.fma.f64(double %9, double %5, double 0x3F56C16C1852B7AF)
  %11 = tail call double @llvm.fma.f64(double %10, double %5, double 0x3F81111111122322)
  %12 = tail call double @llvm.fma.f64(double %11, double %5, double 0x3FA55555555502A1)
  %13 = tail call double @llvm.fma.f64(double %12, double %5, double 0x3FC5555555555511)
  %14 = tail call double @llvm.fma.f64(double %13, double %5, double 0x3FE000000000000B)
  %15 = tail call double @llvm.fma.f64(double %14, double %5, double 1.000000e+00)
  %16 = tail call double @llvm.fma.f64(double %15, double %5, double 1.000000e+00)
  %17 = tail call i32 @llvm.nvvm.d2i.lo(double %16) #12
  %18 = tail call i32 @llvm.nvvm.d2i.hi(double %16) #12
  %19 = shl i32 %2, 20
  %20 = add i32 %18, %19
  %21 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %20) #12
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %0) #12
  %23 = bitcast i32 %22 to float
  %24 = tail call float @llvm.nvvm.fabs.f(float %23) #12
  %25 = fcmp olt float %24, 0x4010C46560000000
  br i1 %25, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %26 = fcmp olt double %0, 0.000000e+00
  %27 = fadd double %0, 0x7FF0000000000000
  %z.0.i = select i1 %26, double 0.000000e+00, double %27
  %28 = fcmp olt float %24, 0x4010E90000000000
  br i1 %28, label %29, label %__nv_exp.exit

29:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %30 = sdiv i32 %2, 2
  %31 = shl i32 %30, 20
  %32 = add i32 %18, %31
  %33 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %32) #12
  %34 = sub nsw i32 %2, %30
  %35 = shl i32 %34, 20
  %36 = add nsw i32 %35, 1072693248
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %36) #12
  %38 = fmul double %37, %33
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %29
  %z.2.i = phi double [ %21, %entry ], [ %38, %29 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %39 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %40 = sitofp i64 %39 to double
  %divide.597.1 = fdiv double %z.2.i, %40
  store double %divide.597.1, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_110(ptr noalias nocapture writeonly align 128 dereferenceable(10) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.3293 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !303
  %0 = icmp slt i64 %param_2.3293, 0
  %1 = add i64 %param_2.3293, 10
  %2 = select i1 %0, i64 %1, i64 %param_2.3293
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 9)
  %param_1.4020 = load i8, ptr addrspace(1) %arg15, align 128, !invariant.load !303
  %5 = getelementptr inbounds [10 x i8], ptr addrspace(1) %arg03, i64 0, i64 %4
  store i8 %param_1.4020, ptr addrspace(1) %5, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_70(ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.3377 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !303
  %0 = icmp slt i64 %param_2.3377, 0
  %1 = add i64 %param_2.3377, 10
  %2 = select i1 %0, i64 %1, i64 %param_2.3377
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 9)
  %param_1.4100 = load i64, ptr addrspace(1) %arg15, align 128, !invariant.load !303
  %5 = getelementptr inbounds [10 x i64], ptr addrspace(1) %arg03, i64 0, i64 %4
  store i64 %param_1.4100, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_68(ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_2.3383 = load i64, ptr addrspace(1) %arg27, align 128, !invariant.load !303
  %0 = icmp slt i64 %param_2.3383, 0
  %1 = add i64 %param_2.3383, 10
  %2 = select i1 %0, i64 %1, i64 %param_2.3383
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 9)
  %param_1.4104 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !303
  %5 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg03, i64 0, i64 %4
  store double %param_1.4104, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #4 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %1 = add i64 %0, 1
  store i64 %1, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #4 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg25, align 128, !invariant.load !303
  %1 = sitofp i64 %0 to double
  %2 = tail call i32 @llvm.nvvm.d2i.hi(double %1) #12
  %3 = tail call i32 @llvm.nvvm.d2i.hi(double -7.500000e-01) #12
  %4 = and i32 %3, 2146435072
  %5 = tail call double @llvm.fabs.f64(double %1)
  %6 = icmp eq i64 %0, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %entry
  %8 = icmp eq i32 %4, 1073741824
  %thi.0.i = select i1 %8, i32 %2, i32 0
  %9 = icmp slt i32 %3, 0
  %10 = or i32 %thi.0.i, 2146435072
  %thi.1.i = select i1 %9, i32 %10, i32 %thi.0.i
  %11 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %thi.1.i) #12
  br label %15

12:                                               ; preds = %entry
  %13 = icmp slt i32 %2, 0
  %14 = tail call fastcc double @__internal_accurate_pow(double %5)
  %t.1.i = select i1 %13, double 0xFFF8000000000000, double %14
  br label %15

15:                                               ; preds = %12, %7
  %t.2.i = phi double [ %11, %7 ], [ %t.1.i, %12 ]
  %16 = fadd double %1, -7.500000e-01
  %17 = tail call i32 @llvm.nvvm.d2i.hi(double %16) #12
  %18 = and i32 %17, 2146435072
  %19 = icmp eq i32 %18, 2146435072
  br i1 %19, label %20, label %__nv_pow.exit

20:                                               ; preds = %15
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double -7.500000e-01) #12
  %22 = and i32 %3, 2147483647
  %23 = icmp eq i32 %22, 2146435072
  %24 = icmp eq i32 %21, 0
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %__nv_isinfd.exit.i

26:                                               ; preds = %20
  %27 = fcmp ogt double %5, 1.000000e+00
  %thi.2.i = select i1 %27, i32 2146435072, i32 0
  %28 = icmp slt i32 %3, 0
  %29 = xor i32 %thi.2.i, 2146435072
  %thi.3.i = select i1 %28, i32 %29, i32 %thi.2.i
  %30 = icmp eq i64 %0, -1
  %thi.4.i = select i1 %30, i32 1072693248, i32 %thi.3.i
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %thi.4.i) #12
  br label %__nv_pow.exit

__nv_isinfd.exit.i:                               ; preds = %20
  %32 = tail call i32 @llvm.nvvm.d2i.lo(double %1) #12
  %33 = and i32 %2, 2147483647
  %34 = icmp eq i32 %33, 2146435072
  %35 = icmp eq i32 %32, 0
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %__nv_pow.exit

37:                                               ; preds = %__nv_isinfd.exit.i
  %38 = icmp slt i32 %2, 0
  %39 = icmp eq i32 %4, 1073741824
  %.inv.i = icmp slt i32 %3, 0
  %spec.select.i = select i1 %.inv.i, i32 0, i32 2146435072
  %or.cond3.i = select i1 %38, i1 %39, i1 false
  %40 = icmp ne i32 %22, 1071644672
  %or.cond5.i = and i1 %40, %or.cond3.i
  %41 = or disjoint i32 %spec.select.i, -2147483648
  %thi.6.i = select i1 %or.cond5.i, i32 %41, i32 %spec.select.i
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %thi.6.i) #12
  br label %__nv_pow.exit

__nv_pow.exit:                                    ; preds = %15, %26, %__nv_isinfd.exit.i, %37
  %t.6.i = phi double [ %t.2.i, %15 ], [ %31, %26 ], [ %42, %37 ], [ %t.2.i, %__nv_isinfd.exit.i ]
  %43 = icmp eq i64 %0, 1
  %t.7.i = select i1 %43, double 1.000000e+00, double %t.6.i
  %44 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %multiply.2774.1 = fmul double %t.7.i, %44
  %subtract.211.1 = fsub double 1.000000e+00, %t.7.i
  %45 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !303
  %multiply.2775.1 = fmul double %subtract.211.1, %45
  %add.3607.1 = fadd double %multiply.2774.1, %multiply.2775.1
  store double %add.3607.1, ptr addrspace(1) %arg37, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_exponential_subtract_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #4 {
entry:
  %arg614 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !303
  %1 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !303
  %2 = sitofp i64 %1 to double
  %3 = tail call double @llvm.sqrt.f64(double %2)
  %multiply.2771.1.clone.1 = fmul double %3, 2.000000e+01
  %4 = add i64 %1, 10
  %5 = sitofp i64 %4 to double
  %divide.563.1.clone.1 = fdiv double 1.000000e+00, %5
  %subtract.208.1.clone.1 = fsub double 1.000000e+00, %divide.563.1.clone.1
  %6 = load double, ptr addrspace(1) %arg38, align 128, !invariant.load !303
  %multiply.2772.1.clone.1 = fmul double %6, %subtract.208.1.clone.1
  %7 = load double, ptr addrspace(1) %arg26, align 128, !invariant.load !303
  %subtract.209.1.clone.1 = fsub double 9.000000e-01, %7
  %divide.564.1.clone.1 = fdiv double %subtract.209.1.clone.1, %5
  %add.3606.1.clone.1 = fadd double %divide.564.1.clone.1, %multiply.2772.1.clone.1
  %multiply.2773.1.clone.1 = fmul double %multiply.2771.1.clone.1, %add.3606.1.clone.1
  %subtract.210.1.clone.1 = fsub double %0, %multiply.2773.1.clone.1
  %8 = tail call double @llvm.fma.f64(double %subtract.210.1.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %9 = tail call i32 @llvm.nvvm.d2i.lo(double %8) #12
  %10 = tail call double @llvm.nvvm.add.rn.d(double %8, double 0xC338000000000000) #12
  %11 = tail call double @llvm.fma.f64(double %10, double 0xBFE62E42FEFA39EF, double %subtract.210.1.clone.1)
  %12 = tail call double @llvm.fma.f64(double %10, double 0xBC7ABC9E3B39803F, double %11)
  %13 = tail call double @llvm.fma.f64(double %12, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %14 = tail call double @llvm.fma.f64(double %13, double %12, double 0x3EC71DEE62401315)
  %15 = tail call double @llvm.fma.f64(double %14, double %12, double 0x3EFA01997C89EB71)
  %16 = tail call double @llvm.fma.f64(double %15, double %12, double 0x3F2A01A014761F65)
  %17 = tail call double @llvm.fma.f64(double %16, double %12, double 0x3F56C16C1852B7AF)
  %18 = tail call double @llvm.fma.f64(double %17, double %12, double 0x3F81111111122322)
  %19 = tail call double @llvm.fma.f64(double %18, double %12, double 0x3FA55555555502A1)
  %20 = tail call double @llvm.fma.f64(double %19, double %12, double 0x3FC5555555555511)
  %21 = tail call double @llvm.fma.f64(double %20, double %12, double 0x3FE000000000000B)
  %22 = tail call double @llvm.fma.f64(double %21, double %12, double 1.000000e+00)
  %23 = tail call double @llvm.fma.f64(double %22, double %12, double 1.000000e+00)
  %24 = tail call i32 @llvm.nvvm.d2i.lo(double %23) #12
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %23) #12
  %26 = shl i32 %9, 20
  %27 = add i32 %25, %26
  %28 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %27) #12
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.210.1.clone.1) #12
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.fabs.f(float %30) #12
  %32 = fcmp olt float %31, 0x4010C46560000000
  br i1 %32, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %33 = fcmp olt double %subtract.210.1.clone.1, 0.000000e+00
  %34 = fadd double %subtract.210.1.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %33, double 0.000000e+00, double %34
  %35 = fcmp olt float %31, 0x4010E90000000000
  br i1 %35, label %36, label %__nv_exp.exit

36:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %37 = sdiv i32 %9, 2
  %38 = shl i32 %37, 20
  %39 = add i32 %25, %38
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 %24, i32 %39) #12
  %41 = sub nsw i32 %9, %37
  %42 = shl i32 %41, 20
  %43 = add nsw i32 %42, 1072693248
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %43) #12
  %45 = fmul double %44, %40
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %36
  %z.2.i = phi double [ %28, %entry ], [ %45, %36 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  store double %z.2.i, ptr addrspace(1) %arg410, align 128
  store double %subtract.210.1.clone.1, ptr addrspace(1) %arg512, align 128
  store double %add.3606.1.clone.1, ptr addrspace(1) %arg614, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @loop_concatenate_fusion(ptr noalias nocapture align 128 dereferenceable(960) %arg0, ptr noalias nocapture align 128 dereferenceable(960) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(160) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8) local_unnamed_addr #7 {
entry:
  %arg822 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg720 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg618 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg516 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg414 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !310
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg06, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = icmp ult i32 %0, 60
  br i1 %4, label %concatenate.pivot.20., label %concatenate.pivot.80.

concatenate.pivot.20.:                            ; preds = %entry
  %5 = trunc i64 %1 to i32
  %6 = icmp ult i32 %5, 20
  br i1 %6, label %concatenate.pivot.0., label %concatenate.pivot.40.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.20.
  %7 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg210, i64 0, i64 %1
  br label %concatenate.36.1.merge

concatenate.pivot.40.:                            ; preds = %concatenate.pivot.20.
  %8 = trunc i64 %1 to i32
  %9 = icmp ult i32 %8, 40
  br i1 %9, label %concatenate.pivot.20.1, label %concatenate.pivot.40.2

concatenate.pivot.20.1:                           ; preds = %concatenate.pivot.40.
  %10 = trunc i64 %1 to i32
  %11 = add nsw i32 %10, -20
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg312, i64 0, i64 %12
  br label %concatenate.36.1.merge

concatenate.pivot.40.2:                           ; preds = %concatenate.pivot.40.
  %14 = trunc i64 %1 to i32
  %15 = add nsw i32 %14, -40
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg414, i64 0, i64 %16
  br label %concatenate.36.1.merge

concatenate.pivot.80.:                            ; preds = %entry
  %18 = trunc i64 %1 to i32
  %19 = icmp ult i32 %18, 80
  br i1 %19, label %concatenate.pivot.60.3, label %concatenate.pivot.100.

concatenate.pivot.60.3:                           ; preds = %concatenate.pivot.80.
  %20 = trunc i64 %1 to i32
  %21 = add nsw i32 %20, -60
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg516, i64 0, i64 %22
  br label %concatenate.36.1.merge

concatenate.pivot.100.:                           ; preds = %concatenate.pivot.80.
  %24 = trunc i64 %1 to i32
  %25 = icmp ult i32 %24, 100
  br i1 %25, label %concatenate.pivot.80.4, label %concatenate.pivot.100.5

concatenate.pivot.80.4:                           ; preds = %concatenate.pivot.100.
  %26 = trunc i64 %1 to i32
  %27 = add nsw i32 %26, -80
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg618, i64 0, i64 %28
  br label %concatenate.36.1.merge

concatenate.pivot.100.5:                          ; preds = %concatenate.pivot.100.
  %30 = trunc i64 %1 to i32
  %31 = add nsw i32 %30, -100
  %32 = zext nneg i32 %31 to i64
  %33 = getelementptr inbounds [20 x double], ptr addrspace(1) %arg720, i64 0, i64 %32
  br label %concatenate.36.1.merge

concatenate.36.1.merge:                           ; preds = %concatenate.pivot.100.5, %concatenate.pivot.80.4, %concatenate.pivot.60.3, %concatenate.pivot.40.2, %concatenate.pivot.20.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %7, %concatenate.pivot.0. ], [ %13, %concatenate.pivot.20.1 ], [ %17, %concatenate.pivot.40.2 ], [ %23, %concatenate.pivot.60.3 ], [ %29, %concatenate.pivot.80.4 ], [ %33, %concatenate.pivot.100.5 ]
  %34 = load double, ptr addrspace(1) %.in, align 8, !invariant.load !303
  %35 = getelementptr double, ptr addrspace(1) %arg18, i64 %1
  %36 = load double, ptr addrspace(1) %35, align 8
  %subtract.216.1 = fsub double %34, %36
  %37 = load i64, ptr addrspace(1) %arg822, align 128, !invariant.load !303
  %38 = sitofp i64 %37 to double
  %divide.567.1.clone.1 = fdiv double %subtract.216.1, %38
  %add.3614.1.clone.1 = fadd double %36, %divide.567.1.clone.1
  %subtract.217.1 = fsub double %34, %add.3614.1.clone.1
  %multiply.2781.1 = fmul double %subtract.216.1, %subtract.217.1
  %add.3615.1 = fadd double %3, %multiply.2781.1
  store double %add.3615.1, ptr addrspace(1) %2, align 8
  store double %add.3614.1.clone.1, ptr addrspace(1) %35, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_exponential_log_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !303
  %1 = tail call double @llvm.fma.f64(double %0, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %2 = tail call i32 @llvm.nvvm.d2i.lo(double %1) #12
  %3 = tail call double @llvm.nvvm.add.rn.d(double %1, double 0xC338000000000000) #12
  %4 = tail call double @llvm.fma.f64(double %3, double 0xBFE62E42FEFA39EF, double %0)
  %5 = tail call double @llvm.fma.f64(double %3, double 0xBC7ABC9E3B39803F, double %4)
  %6 = tail call double @llvm.fma.f64(double %5, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %7 = tail call double @llvm.fma.f64(double %6, double %5, double 0x3EC71DEE62401315)
  %8 = tail call double @llvm.fma.f64(double %7, double %5, double 0x3EFA01997C89EB71)
  %9 = tail call double @llvm.fma.f64(double %8, double %5, double 0x3F2A01A014761F65)
  %10 = tail call double @llvm.fma.f64(double %9, double %5, double 0x3F56C16C1852B7AF)
  %11 = tail call double @llvm.fma.f64(double %10, double %5, double 0x3F81111111122322)
  %12 = tail call double @llvm.fma.f64(double %11, double %5, double 0x3FA55555555502A1)
  %13 = tail call double @llvm.fma.f64(double %12, double %5, double 0x3FC5555555555511)
  %14 = tail call double @llvm.fma.f64(double %13, double %5, double 0x3FE000000000000B)
  %15 = tail call double @llvm.fma.f64(double %14, double %5, double 1.000000e+00)
  %16 = tail call double @llvm.fma.f64(double %15, double %5, double 1.000000e+00)
  %17 = tail call i32 @llvm.nvvm.d2i.lo(double %16) #12
  %18 = tail call i32 @llvm.nvvm.d2i.hi(double %16) #12
  %19 = shl i32 %2, 20
  %20 = add i32 %18, %19
  %21 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %20) #12
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %0) #12
  %23 = bitcast i32 %22 to float
  %24 = tail call float @llvm.nvvm.fabs.f(float %23) #12
  %25 = fcmp olt float %24, 0x4010C46560000000
  br i1 %25, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %26 = fcmp olt double %0, 0.000000e+00
  %27 = fadd double %0, 0x7FF0000000000000
  %z.0.i = select i1 %26, double 0.000000e+00, double %27
  %28 = fcmp olt float %24, 0x4010E90000000000
  br i1 %28, label %29, label %__nv_exp.exit

29:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %30 = sdiv i32 %2, 2
  %31 = shl i32 %30, 20
  %32 = add i32 %18, %31
  %33 = tail call double @llvm.nvvm.lohi.i2d(i32 %17, i32 %32) #12
  %34 = sub nsw i32 %2, %30
  %35 = shl i32 %34, 20
  %36 = add nsw i32 %35, 1072693248
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %36) #12
  %38 = fmul double %37, %33
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %29
  %z.2.i = phi double [ %21, %entry ], [ %38, %29 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.2782.1 = fmul double %z.2.i, 1.000000e+01
  %39 = tail call i32 @llvm.nvvm.d2i.hi(double %multiply.2782.1) #12
  %40 = tail call i32 @llvm.nvvm.d2i.lo(double %multiply.2782.1) #12
  %41 = icmp slt i32 %39, 1048576
  %42 = fmul double %multiply.2782.1, 0x4350000000000000
  %43 = tail call i32 @llvm.nvvm.d2i.lo(double %42) #12
  %44 = tail call i32 @llvm.nvvm.d2i.hi(double %42) #12
  br i1 %41, label %45, label %46

45:                                               ; preds = %__nv_exp.exit
  br label %46

46:                                               ; preds = %45, %__nv_exp.exit
  %.0.i = phi double [ %42, %45 ], [ %multiply.2782.1, %__nv_exp.exit ]
  %ihi.0.i = phi i32 [ %44, %45 ], [ %39, %__nv_exp.exit ]
  %ilo.0.i = phi i32 [ %43, %45 ], [ %40, %__nv_exp.exit ]
  %e.0.i = phi i32 [ -1077, %45 ], [ -1023, %__nv_exp.exit ]
  %47 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %47, 2146435071
  br i1 %or.cond.i, label %48, label %95

48:                                               ; preds = %46
  %49 = lshr i32 %ihi.0.i, 20
  %50 = add nsw i32 %e.0.i, %49
  %51 = and i32 %ihi.0.i, 1048575
  %52 = or disjoint i32 %51, 1072693248
  %53 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %52) #12
  %54 = icmp ugt i32 %52, 1073127582
  %55 = tail call i32 @llvm.nvvm.d2i.lo(double %53) #12
  %56 = tail call i32 @llvm.nvvm.d2i.hi(double %53) #12
  %57 = add i32 %56, -1048576
  %58 = tail call double @llvm.nvvm.lohi.i2d(i32 %55, i32 %57) #12
  %spec.select = select i1 %54, double %58, double %53
  %59 = zext i1 %54 to i32
  %spec.select1 = add nsw i32 %50, %59
  %60 = fadd double %spec.select, -1.000000e+00
  %61 = fadd double %spec.select, 1.000000e+00
  %62 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %61) #12
  %63 = fneg double %61
  %64 = tail call double @llvm.fma.f64(double %63, double %62, double 1.000000e+00)
  %65 = tail call double @llvm.fma.f64(double %64, double %64, double %64)
  %66 = tail call double @llvm.fma.f64(double %65, double %62, double %62)
  %67 = fmul double %60, %66
  %68 = fadd double %67, %67
  %69 = fmul double %68, %68
  %70 = tail call double @llvm.fma.f64(double %69, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %71 = tail call double @llvm.fma.f64(double %70, double %69, double 0x3EF3B2669F02676F)
  %72 = tail call double @llvm.fma.f64(double %71, double %69, double 0x3F1745CBA9AB0956)
  %73 = tail call double @llvm.fma.f64(double %72, double %69, double 0x3F3C71C72D1B5154)
  %74 = tail call double @llvm.fma.f64(double %73, double %69, double 0x3F624924923BE72D)
  %75 = tail call double @llvm.fma.f64(double %74, double %69, double 0x3F8999999999A3C4)
  %76 = tail call double @llvm.fma.f64(double %75, double %69, double 0x3FB5555555555554)
  %77 = fsub double %60, %68
  %78 = fmul double %77, 2.000000e+00
  %79 = fneg double %68
  %80 = tail call double @llvm.fma.f64(double %79, double %60, double %78)
  %81 = fmul double %66, %80
  %82 = fmul double %69, %76
  %83 = tail call double @llvm.fma.f64(double %82, double %68, double %81)
  %84 = xor i32 %spec.select1, -2147483648
  %85 = tail call double @llvm.nvvm.lohi.i2d(i32 %84, i32 1127219200) #12
  %86 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %87 = fsub double %85, %86
  %88 = tail call double @llvm.fma.f64(double %87, double 0x3FE62E42FEFA39EF, double %68)
  %89 = fneg double %87
  %90 = tail call double @llvm.fma.f64(double %89, double 0x3FE62E42FEFA39EF, double %88)
  %91 = fsub double %90, %68
  %92 = fsub double %83, %91
  %93 = tail call double @llvm.fma.f64(double %87, double 0x3C7ABC9E3B39803F, double %92)
  %94 = fadd double %88, %93
  br label %__nv_log.exit

95:                                               ; preds = %46
  %96 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %97 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #12
  %98 = and i32 %97, 2147483647
  %99 = icmp eq i32 %98, 0
  %q.0.i = select i1 %99, double 0xFFF0000000000000, double %96
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %48, %95
  %q.1.i = phi double [ %94, %48 ], [ %q.0.i, %95 ]
  store double %q.1.i, ptr addrspace(1) %arg14, align 128
  store double %z.2.i, ptr addrspace(1) %arg26, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(960) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(960) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !310
  %1 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !303
  %2 = sitofp i64 %1 to double
  %3 = add i64 %1, 5
  %4 = sitofp i64 %3 to double
  %divide.568.3 = fdiv double %2, %4
  %5 = zext nneg i32 %0 to i64
  %6 = getelementptr double, ptr addrspace(1) %arg01, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %8 = add i64 %1, -1
  %9 = sitofp i64 %8 to double
  %divide.569.3 = fdiv double %7, %9
  %multiply.2783.3 = fmul double %divide.568.3, %divide.569.3
  %divide.570.3 = fdiv double 5.000000e+00, %4
  %multiply.2785.3 = fmul double %divide.570.3, 1.000000e-03
  %add.3618.1 = fadd double %multiply.2783.3, %multiply.2785.3
  %10 = getelementptr double, ptr addrspace(1) %arg25, i64 %5
  store double %add.3618.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(960) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !310
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_60(ptr noalias nocapture writeonly align 128 dereferenceable(9600) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(960) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #4 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !310
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.3423 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !303
  %1 = icmp slt i64 %param_2.3423, 0
  %2 = add i64 %param_2.3423, 10
  %3 = select i1 %1, i64 %2, i64 %param_2.3423
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.41384 = load double, ptr addrspace(1) %6, align 8, !invariant.load !303
  %7 = getelementptr inbounds [10 x [120 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.41384, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare double @llvm.nvvm.rsqrt.approx.d(double) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.hi(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.lo(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.lohi.i2d(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare double @llvm.nvvm.rcp.approx.ftz.d(double) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.add.rn.d(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.f(float) #1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none)
define internal fastcc double @__internal_accurate_pow(double %a) unnamed_addr #10 {
__internal_log_ext_prec.exit:
  %0 = tail call i32 @llvm.nvvm.d2i.hi(double %a) #12
  %1 = tail call i32 @llvm.nvvm.d2i.lo(double %a) #12
  %2 = lshr i32 %0, 20
  %3 = icmp ult i32 %0, 1048576
  %4 = fmul double %a, 0x4350000000000000
  %5 = tail call i32 @llvm.nvvm.d2i.hi(double %4) #12
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #12
  %7 = lshr i32 %5, 20
  %8 = add nsw i32 %7, -54
  %ilo.i.0 = select i1 %3, i32 %6, i32 %1
  %ihi.i.0 = select i1 %3, i32 %5, i32 %0
  %expo.i.0 = select i1 %3, i32 %8, i32 %2
  %9 = and i32 %ihi.i.0, -2146435073
  %10 = or disjoint i32 %9, 1072693248
  %11 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.i.0, i32 %10) #12
  %12 = icmp ugt i32 %10, 1073127582
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #12
  %14 = tail call i32 @llvm.nvvm.d2i.hi(double %11) #12
  %15 = add i32 %14, -1048576
  %16 = tail call double @llvm.nvvm.lohi.i2d(i32 %13, i32 %15) #12
  %m.i.0 = select i1 %12, double %16, double %11
  %expo.i.1.v = select i1 %12, i32 -1022, i32 -1023
  %expo.i.1 = add nsw i32 %expo.i.1.v, %expo.i.0
  %17 = fadd double %m.i.0, -1.000000e+00
  %18 = fadd double %m.i.0, 1.000000e+00
  %19 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %18) #12
  %20 = fneg double %18
  %21 = tail call double @llvm.fma.f64(double %20, double %19, double 1.000000e+00)
  %22 = tail call double @llvm.fma.f64(double %21, double %21, double %21)
  %23 = tail call double @llvm.fma.f64(double %22, double %19, double %19)
  %24 = fmul double %17, %23
  %25 = fadd double %24, %24
  %26 = fmul double %25, %25
  %27 = tail call double @llvm.fma.f64(double %26, double 0x3EB0F5FF7D2CAFE2, double 0x3ED0F5D241AD3B5A)
  %28 = tail call double @llvm.fma.f64(double %27, double %26, double 0x3EF3B20A75488A3F)
  %29 = tail call double @llvm.fma.f64(double %28, double %26, double 0x3F1745CDE4FAECD5)
  %30 = tail call double @llvm.fma.f64(double %29, double %26, double 0x3F3C71C7258A578B)
  %31 = tail call double @llvm.fma.f64(double %30, double %26, double 0x3F6249249242B910)
  %32 = tail call double @llvm.fma.f64(double %31, double %26, double 0x3F89999999999DFB)
  %33 = fmul double %26, %32
  %34 = fsub double %17, %25
  %35 = fmul double %34, 2.000000e+00
  %36 = fneg double %25
  %37 = tail call double @llvm.fma.f64(double %36, double %17, double %35)
  %38 = fmul double %23, %37
  %39 = fadd double %33, 0x3FB5555555555555
  %40 = fsub double 0x3FB5555555555555, %39
  %41 = fadd double %33, %40
  %42 = fadd double %41, 0xBC46A4CB00B9E7B0
  %43 = fadd double %39, %42
  %44 = fsub double %39, %43
  %45 = fadd double %42, %44
  %46 = tail call double @llvm.nvvm.mul.rn.d(double %25, double %25) #12
  %47 = fneg double %46
  %48 = tail call double @llvm.fma.f64(double %25, double %25, double %47)
  %49 = tail call i32 @llvm.nvvm.d2i.lo(double %38) #12
  %50 = tail call i32 @llvm.nvvm.d2i.hi(double %38) #12
  %51 = add i32 %50, 1048576
  %52 = tail call double @llvm.nvvm.lohi.i2d(i32 %49, i32 %51) #12
  %53 = tail call double @llvm.fma.f64(double %25, double %52, double %48)
  %54 = tail call double @llvm.nvvm.mul.rn.d(double %46, double %25) #12
  %55 = fneg double %54
  %56 = tail call double @llvm.fma.f64(double %46, double %25, double %55)
  %57 = tail call double @llvm.fma.f64(double %46, double %38, double %56)
  %58 = tail call double @llvm.fma.f64(double %53, double %25, double %57)
  %59 = tail call double @llvm.nvvm.mul.rn.d(double %43, double %54) #12
  %60 = fneg double %59
  %61 = tail call double @llvm.fma.f64(double %43, double %54, double %60)
  %62 = tail call double @llvm.fma.f64(double %43, double %58, double %61)
  %63 = tail call double @llvm.fma.f64(double %45, double %54, double %62)
  %64 = fadd double %59, %63
  %65 = fsub double %59, %64
  %66 = fadd double %63, %65
  %67 = fadd double %25, %64
  %68 = fsub double %25, %67
  %69 = fadd double %64, %68
  %70 = fadd double %66, %69
  %71 = fadd double %38, %70
  %72 = fadd double %67, %71
  %73 = fsub double %67, %72
  %74 = fadd double %71, %73
  %75 = xor i32 %expo.i.1, -2147483648
  %76 = tail call double @llvm.nvvm.lohi.i2d(i32 %75, i32 1127219200) #12
  %77 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #12
  %78 = fsub double %76, %77
  %79 = tail call double @llvm.fma.f64(double %78, double 0x3FE62E42FEFA39EF, double %72)
  %80 = fneg double %78
  %81 = tail call double @llvm.fma.f64(double %80, double 0x3FE62E42FEFA39EF, double %79)
  %82 = fsub double %81, %72
  %83 = fsub double %74, %82
  %84 = tail call double @llvm.fma.f64(double %78, double 0x3C7ABC9E3B39803F, double %83)
  %85 = fadd double %79, %84
  %86 = fsub double %79, %85
  %87 = fadd double %84, %86
  %88 = tail call i32 @llvm.nvvm.d2i.hi(double -7.500000e-01) #12
  %89 = tail call i32 @llvm.nvvm.d2i.lo(double -7.500000e-01) #12
  %90 = shl i32 %88, 1
  %91 = icmp ugt i32 %90, -33554433
  %92 = and i32 %88, -15728641
  %spec.select = select i1 %91, i32 %92, i32 %88
  %93 = tail call double @llvm.nvvm.lohi.i2d(i32 %89, i32 %spec.select) #12
  %94 = tail call double @llvm.nvvm.mul.rn.d(double %85, double %93) #12
  %95 = fneg double %94
  %96 = tail call double @llvm.fma.f64(double %85, double %93, double %95)
  %97 = tail call double @llvm.fma.f64(double %87, double %93, double %96)
  %98 = fadd double %94, %97
  %99 = tail call double @llvm.fma.f64(double %98, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %100 = tail call i32 @llvm.nvvm.d2i.lo(double %99) #12
  %101 = tail call double @llvm.nvvm.add.rn.d(double %99, double 0xC338000000000000) #12
  %102 = tail call double @llvm.fma.f64(double %101, double 0xBFE62E42FEFA39EF, double %98)
  %103 = tail call double @llvm.fma.f64(double %101, double 0xBC7ABC9E3B39803F, double %102)
  %104 = tail call double @llvm.fma.f64(double %103, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %105 = tail call double @llvm.fma.f64(double %104, double %103, double 0x3EC71DEE62401315)
  %106 = tail call double @llvm.fma.f64(double %105, double %103, double 0x3EFA01997C89EB71)
  %107 = tail call double @llvm.fma.f64(double %106, double %103, double 0x3F2A01A014761F65)
  %108 = tail call double @llvm.fma.f64(double %107, double %103, double 0x3F56C16C1852B7AF)
  %109 = tail call double @llvm.fma.f64(double %108, double %103, double 0x3F81111111122322)
  %110 = tail call double @llvm.fma.f64(double %109, double %103, double 0x3FA55555555502A1)
  %111 = tail call double @llvm.fma.f64(double %110, double %103, double 0x3FC5555555555511)
  %112 = tail call double @llvm.fma.f64(double %111, double %103, double 0x3FE000000000000B)
  %113 = tail call double @llvm.fma.f64(double %112, double %103, double 1.000000e+00)
  %114 = tail call double @llvm.fma.f64(double %113, double %103, double 1.000000e+00)
  %115 = tail call i32 @llvm.nvvm.d2i.lo(double %114) #12
  %116 = tail call i32 @llvm.nvvm.d2i.hi(double %114) #12
  %117 = shl i32 %100, 20
  %118 = add i32 %116, %117
  %119 = tail call double @llvm.nvvm.lohi.i2d(i32 %115, i32 %118) #12
  %120 = tail call i32 @llvm.nvvm.d2i.hi(double %98) #12
  %121 = bitcast i32 %120 to float
  %122 = tail call float @llvm.nvvm.fabs.f(float %121) #12
  %123 = fcmp olt float %122, 0x4010C46560000000
  br i1 %123, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %__internal_log_ext_prec.exit
  %124 = fcmp olt double %98, 0.000000e+00
  %125 = fadd double %98, 0x7FF0000000000000
  %z.i.0 = select i1 %124, double 0.000000e+00, double %125
  %126 = fcmp olt float %122, 0x4010E90000000000
  br i1 %126, label %127, label %__nv_exp.exit

127:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %128 = sdiv i32 %100, 2
  %129 = shl i32 %128, 20
  %130 = add i32 %116, %129
  %131 = tail call double @llvm.nvvm.lohi.i2d(i32 %115, i32 %130) #12
  %132 = sub nsw i32 %100, %128
  %133 = shl i32 %132, 20
  %134 = add nsw i32 %133, 1072693248
  %135 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %134) #12
  %136 = fmul double %135, %131
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %__internal_log_ext_prec.exit, %127, %__internal_fast_icmp_abs_lt.exit.i
  %z.i.2 = phi double [ %119, %__internal_log_ext_prec.exit ], [ %136, %127 ], [ %z.i.0, %__internal_fast_icmp_abs_lt.exit.i ]
  %137 = fsub double %94, %98
  %138 = fadd double %97, %137
  %139 = tail call i32 @llvm.nvvm.d2i.lo(double %z.i.2) #12
  %140 = tail call i32 @llvm.nvvm.d2i.hi(double %z.i.2) #12
  %141 = and i32 %140, 2147483647
  %142 = icmp eq i32 %141, 2146435072
  %143 = icmp eq i32 %139, 0
  %144 = select i1 %142, i1 %143, i1 false
  %145 = tail call double @llvm.fma.f64(double %z.i.2, double %138, double %z.i.2)
  %tmp.0 = select i1 %144, double %z.i.2, double %145
  ret double %tmp.0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.mul.rn.d(double, double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sqrt.f64(double) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fma.f64(double, double, double) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.is.fpclass.f64(double, i32 immarg) #11

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { norecurse nounwind }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #6 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #8 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #9 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #10 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #12 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294, !295}
!llvm.ident = !{!296}
!nvvmir.version = !{!297}
!llvm.module.flags = !{!298}

!0 = !{ptr @loop_broadcast_fusion_20, !"kernel", i32 1}
!1 = !{ptr @loop_broadcast_fusion_20, !"reqntidx", i32 10}
!2 = !{ptr @loop_broadcast_fusion_19, !"kernel", i32 1}
!3 = !{ptr @loop_broadcast_fusion_19, !"reqntidx", i32 10}
!4 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!5 = !{ptr @input_slice_fusion, !"reqntidx", i32 128}
!6 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!7 = !{ptr @wrapped_transpose, !"reqntidx", i32 128}
!8 = !{ptr @wrapped_transpose_1, !"kernel", i32 1}
!9 = !{ptr @wrapped_transpose_1, !"reqntidx", i32 128}
!10 = !{ptr @loop_compare_fusion_3, !"kernel", i32 1}
!11 = !{ptr @loop_compare_fusion_3, !"reqntidx", i32 1}
!12 = !{ptr @loop_clamp_convert_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_clamp_convert_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_add_slice_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_add_slice_fusion, !"reqntidx", i32 2}
!16 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 120}
!18 = !{ptr @input_reduce_fusion_6, !"kernel", i32 1}
!19 = !{ptr @input_reduce_fusion_6, !"reqntidx", i32 32}
!20 = !{ptr @loop_add_fusion_18, !"kernel", i32 1}
!21 = !{ptr @loop_add_fusion_18, !"reqntidx", i32 1}
!22 = !{ptr @wrapped_slice_5, !"kernel", i32 1}
!23 = !{ptr @wrapped_slice_5, !"reqntidx", i32 20}
!24 = !{ptr @wrapped_slice_4, !"kernel", i32 1}
!25 = !{ptr @wrapped_slice_4, !"reqntidx", i32 20}
!26 = !{ptr @wrapped_slice_3, !"kernel", i32 1}
!27 = !{ptr @wrapped_slice_3, !"reqntidx", i32 20}
!28 = !{ptr @wrapped_slice_2, !"kernel", i32 1}
!29 = !{ptr @wrapped_slice_2, !"reqntidx", i32 20}
!30 = !{ptr @wrapped_slice, !"kernel", i32 1}
!31 = !{ptr @wrapped_slice, !"reqntidx", i32 20}
!32 = !{ptr @wrapped_slice_1, !"kernel", i32 1}
!33 = !{ptr @wrapped_slice_1, !"reqntidx", i32 20}
!34 = !{ptr @loop_dynamic_update_slice_fusion_112, !"kernel", i32 1}
!35 = !{ptr @loop_dynamic_update_slice_fusion_112, !"reqntidx", i32 20}
!36 = !{ptr @loop_broadcast_fusion_18, !"kernel", i32 1}
!37 = !{ptr @loop_broadcast_fusion_18, !"reqntidx", i32 1024}
!38 = !{ptr @loop_and_fusion_2, !"kernel", i32 1}
!39 = !{ptr @loop_and_fusion_2, !"reqntidx", i32 1}
!40 = !{ptr @loop_select_fusion_5, !"kernel", i32 1}
!41 = !{ptr @loop_select_fusion_5, !"reqntidx", i32 1}
!42 = !{ptr @loop_add_select_fusion_2, !"kernel", i32 1}
!43 = !{ptr @loop_add_select_fusion_2, !"reqntidx", i32 1}
!44 = !{ptr @loop_add_fusion_17, !"kernel", i32 1}
!45 = !{ptr @loop_add_fusion_17, !"reqntidx", i32 1}
!46 = !{ptr @loop_convert_fusion_5, !"kernel", i32 1}
!47 = !{ptr @loop_convert_fusion_5, !"reqntidx", i32 1}
!48 = !{ptr @loop_slice_fusion, !"kernel", i32 1}
!49 = !{ptr @loop_slice_fusion, !"reqntidx", i32 2}
!50 = !{ptr @loop_slice_fusion_1, !"kernel", i32 1}
!51 = !{ptr @loop_slice_fusion_1, !"reqntidx", i32 2}
!52 = !{ptr @input_reduce_fusion_5, !"kernel", i32 1}
!53 = !{ptr @input_reduce_fusion_5, !"reqntidx", i32 32}
!54 = !{ptr @loop_add_minimum_select_fusion_1, !"kernel", i32 1}
!55 = !{ptr @loop_add_minimum_select_fusion_1, !"reqntidx", i32 1}
!56 = !{ptr @loop_and_fusion_1, !"kernel", i32 1}
!57 = !{ptr @loop_and_fusion_1, !"reqntidx", i32 1}
!58 = !{ptr @loop_broadcast_fusion_11, !"kernel", i32 1}
!59 = !{ptr @loop_broadcast_fusion_11, !"reqntidx", i32 1024}
!60 = !{ptr @loop_add_fusion_10, !"kernel", i32 1}
!61 = !{ptr @loop_add_fusion_10, !"reqntidx", i32 20}
!62 = !{ptr @loop_broadcast_fusion_10, !"kernel", i32 1}
!63 = !{ptr @loop_broadcast_fusion_10, !"reqntidx", i32 20}
!64 = !{ptr @loop_broadcast_fusion_7, !"kernel", i32 1}
!65 = !{ptr @loop_broadcast_fusion_7, !"reqntidx", i32 1024}
!66 = !{ptr @loop_broadcast_fusion_14, !"kernel", i32 1}
!67 = !{ptr @loop_broadcast_fusion_14, !"reqntidx", i32 20}
!68 = !{ptr @loop_convert_fusion_2, !"kernel", i32 1}
!69 = !{ptr @loop_convert_fusion_2, !"reqntidx", i32 128}
!70 = !{ptr @loop_broadcast_fusion_6, !"kernel", i32 1}
!71 = !{ptr @loop_broadcast_fusion_6, !"reqntidx", i32 1024}
!72 = !{ptr @loop_broadcast_fusion_4, !"kernel", i32 1}
!73 = !{ptr @loop_broadcast_fusion_4, !"reqntidx", i32 20}
!74 = !{ptr @loop_broadcast_fusion_16, !"kernel", i32 1}
!75 = !{ptr @loop_broadcast_fusion_16, !"reqntidx", i32 1024}
!76 = !{ptr @loop_broadcast_fusion_12, !"kernel", i32 1}
!77 = !{ptr @loop_broadcast_fusion_12, !"reqntidx", i32 192}
!78 = !{ptr @loop_broadcast_fusion_15, !"kernel", i32 1}
!79 = !{ptr @loop_broadcast_fusion_15, !"reqntidx", i32 192}
!80 = !{ptr @loop_broadcast_fusion_17, !"kernel", i32 1}
!81 = !{ptr @loop_broadcast_fusion_17, !"reqntidx", i32 20}
!82 = !{ptr @loop_broadcast_fusion_8, !"kernel", i32 1}
!83 = !{ptr @loop_broadcast_fusion_8, !"reqntidx", i32 20}
!84 = !{ptr @loop_compare_fusion_1, !"kernel", i32 1}
!85 = !{ptr @loop_compare_fusion_1, !"reqntidx", i32 1}
!86 = !{ptr @loop_dynamic_update_slice_fusion_56, !"kernel", i32 1}
!87 = !{ptr @loop_dynamic_update_slice_fusion_56, !"reqntidx", i32 1}
!88 = !{ptr @loop_dynamic_update_slice_fusion_55, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_55, !"reqntidx", i32 1}
!90 = !{ptr @loop_dynamic_update_slice_fusion_41, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion_41, !"reqntidx", i32 20}
!92 = !{ptr @loop_dynamic_update_slice_fusion_10, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_10, !"reqntidx", i32 20}
!94 = !{ptr @loop_dynamic_update_slice_fusion_11, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_11, !"reqntidx", i32 20}
!96 = !{ptr @loop_dynamic_update_slice_fusion_13, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_13, !"reqntidx", i32 20}
!98 = !{ptr @loop_dynamic_update_slice_fusion_48, !"kernel", i32 1}
!99 = !{ptr @loop_dynamic_update_slice_fusion_48, !"reqntidx", i32 20}
!100 = !{ptr @loop_dynamic_update_slice_fusion_14, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_14, !"reqntidx", i32 20}
!102 = !{ptr @loop_dynamic_update_slice_fusion_39, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_39, !"reqntidx", i32 20}
!104 = !{ptr @loop_dynamic_update_slice_fusion_42, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_42, !"reqntidx", i32 20}
!106 = !{ptr @loop_dynamic_update_slice_fusion_38, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_38, !"reqntidx", i32 20}
!108 = !{ptr @loop_dynamic_update_slice_fusion_6, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_6, !"reqntidx", i32 20}
!110 = !{ptr @loop_dynamic_update_slice_fusion_7, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_7, !"reqntidx", i32 20}
!112 = !{ptr @loop_dynamic_update_slice_fusion_53, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_53, !"reqntidx", i32 20}
!114 = !{ptr @loop_dynamic_update_slice_fusion_15, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_15, !"reqntidx", i32 20}
!116 = !{ptr @loop_dynamic_update_slice_fusion_21, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_21, !"reqntidx", i32 20}
!118 = !{ptr @loop_dynamic_update_slice_fusion_32, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_32, !"reqntidx", i32 20}
!120 = !{ptr @loop_dynamic_update_slice_fusion_54, !"kernel", i32 1}
!121 = !{ptr @loop_dynamic_update_slice_fusion_54, !"reqntidx", i32 20}
!122 = !{ptr @loop_dynamic_update_slice_fusion_44, !"kernel", i32 1}
!123 = !{ptr @loop_dynamic_update_slice_fusion_44, !"reqntidx", i32 20}
!124 = !{ptr @loop_dynamic_update_slice_fusion_46, !"kernel", i32 1}
!125 = !{ptr @loop_dynamic_update_slice_fusion_46, !"reqntidx", i32 20}
!126 = !{ptr @loop_dynamic_update_slice_fusion_49, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion_49, !"reqntidx", i32 20}
!128 = !{ptr @loop_dynamic_update_slice_fusion_50, !"kernel", i32 1}
!129 = !{ptr @loop_dynamic_update_slice_fusion_50, !"reqntidx", i32 20}
!130 = !{ptr @loop_add_divide_select_fusion, !"kernel", i32 1}
!131 = !{ptr @loop_add_divide_select_fusion, !"reqntidx", i32 20}
!132 = !{ptr @loop_dynamic_update_slice_fusion_4, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_4, !"reqntidx", i32 20}
!134 = !{ptr @loop_dynamic_update_slice_fusion_2, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_2, !"reqntidx", i32 20}
!136 = !{ptr @loop_dynamic_update_slice_fusion_3, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_3, !"reqntidx", i32 20}
!138 = !{ptr @loop_dynamic_update_slice_fusion_31, !"kernel", i32 1}
!139 = !{ptr @loop_dynamic_update_slice_fusion_31, !"reqntidx", i32 20}
!140 = !{ptr @loop_dynamic_update_slice_fusion_45, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_45, !"reqntidx", i32 20}
!142 = !{ptr @loop_dynamic_update_slice_fusion_12, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion_12, !"reqntidx", i32 20}
!144 = !{ptr @loop_dynamic_update_slice_fusion_17, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_17, !"reqntidx", i32 20}
!146 = !{ptr @loop_dynamic_update_slice_fusion_16, !"kernel", i32 1}
!147 = !{ptr @loop_dynamic_update_slice_fusion_16, !"reqntidx", i32 20}
!148 = !{ptr @loop_dynamic_update_slice_fusion_18, !"kernel", i32 1}
!149 = !{ptr @loop_dynamic_update_slice_fusion_18, !"reqntidx", i32 20}
!150 = !{ptr @loop_dynamic_update_slice_fusion_24, !"kernel", i32 1}
!151 = !{ptr @loop_dynamic_update_slice_fusion_24, !"reqntidx", i32 20}
!152 = !{ptr @loop_dynamic_update_slice_fusion_23, !"kernel", i32 1}
!153 = !{ptr @loop_dynamic_update_slice_fusion_23, !"reqntidx", i32 20}
!154 = !{ptr @loop_dynamic_update_slice_fusion_37, !"kernel", i32 1}
!155 = !{ptr @loop_dynamic_update_slice_fusion_37, !"reqntidx", i32 20}
!156 = !{ptr @loop_dynamic_update_slice_fusion_33, !"kernel", i32 1}
!157 = !{ptr @loop_dynamic_update_slice_fusion_33, !"reqntidx", i32 20}
!158 = !{ptr @loop_dynamic_update_slice_fusion_27, !"kernel", i32 1}
!159 = !{ptr @loop_dynamic_update_slice_fusion_27, !"reqntidx", i32 20}
!160 = !{ptr @loop_dynamic_update_slice_fusion_34, !"kernel", i32 1}
!161 = !{ptr @loop_dynamic_update_slice_fusion_34, !"reqntidx", i32 20}
!162 = !{ptr @loop_dynamic_update_slice_fusion_36, !"kernel", i32 1}
!163 = !{ptr @loop_dynamic_update_slice_fusion_36, !"reqntidx", i32 20}
!164 = !{ptr @loop_dynamic_update_slice_fusion_28, !"kernel", i32 1}
!165 = !{ptr @loop_dynamic_update_slice_fusion_28, !"reqntidx", i32 20}
!166 = !{ptr @loop_dynamic_update_slice_fusion_29, !"kernel", i32 1}
!167 = !{ptr @loop_dynamic_update_slice_fusion_29, !"reqntidx", i32 20}
!168 = !{ptr @loop_dynamic_update_slice_fusion_22, !"kernel", i32 1}
!169 = !{ptr @loop_dynamic_update_slice_fusion_22, !"reqntidx", i32 20}
!170 = !{ptr @loop_dynamic_update_slice_fusion_8, !"kernel", i32 1}
!171 = !{ptr @loop_dynamic_update_slice_fusion_8, !"reqntidx", i32 20}
!172 = !{ptr @loop_dynamic_update_slice_fusion_5, !"kernel", i32 1}
!173 = !{ptr @loop_dynamic_update_slice_fusion_5, !"reqntidx", i32 20}
!174 = !{ptr @loop_dynamic_update_slice_fusion_9, !"kernel", i32 1}
!175 = !{ptr @loop_dynamic_update_slice_fusion_9, !"reqntidx", i32 20}
!176 = !{ptr @loop_dynamic_update_slice_fusion_19, !"kernel", i32 1}
!177 = !{ptr @loop_dynamic_update_slice_fusion_19, !"reqntidx", i32 20}
!178 = !{ptr @loop_reduce_subtract_fusion, !"kernel", i32 1}
!179 = !{ptr @loop_reduce_subtract_fusion, !"reqntidx", i32 128}
!180 = !{ptr @loop_broadcast_fusion_9, !"kernel", i32 1}
!181 = !{ptr @loop_broadcast_fusion_9, !"reqntidx", i32 1024}
!182 = !{ptr @input_scatter_fusion, !"kernel", i32 1}
!183 = !{ptr @input_scatter_fusion, !"reqntidx", i32 128}
!184 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!185 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 128}
!186 = !{ptr @loop_select_slice_fusion, !"kernel", i32 1}
!187 = !{ptr @loop_select_slice_fusion, !"reqntidx", i32 128}
!188 = !{ptr @input_multiply_reduce_fusion, !"kernel", i32 1}
!189 = !{ptr @input_multiply_reduce_fusion, !"reqntidx", i32 1024}
!190 = !{ptr @loop_broadcast_fusion_13, !"kernel", i32 1}
!191 = !{ptr @loop_broadcast_fusion_13, !"reqntidx", i32 20}
!192 = !{ptr @loop_dynamic_slice_fusion_2, !"kernel", i32 1}
!193 = !{ptr @loop_dynamic_slice_fusion_2, !"reqntidx", i32 1}
!194 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!195 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!196 = !{ptr @loop_dynamic_slice_fusion_4, !"kernel", i32 1}
!197 = !{ptr @loop_dynamic_slice_fusion_4, !"reqntidx", i32 20}
!198 = !{ptr @loop_dynamic_slice_fusion_3, !"kernel", i32 1}
!199 = !{ptr @loop_dynamic_slice_fusion_3, !"reqntidx", i32 20}
!200 = !{ptr @loop_add_select_fusion_1, !"kernel", i32 1}
!201 = !{ptr @loop_add_select_fusion_1, !"reqntidx", i32 20}
!202 = !{ptr @loop_multiply_negate_fusion, !"kernel", i32 1}
!203 = !{ptr @loop_multiply_negate_fusion, !"reqntidx", i32 20}
!204 = !{ptr @loop_broadcast_multiply_select_fusion, !"kernel", i32 1}
!205 = !{ptr @loop_broadcast_multiply_select_fusion, !"reqntidx", i32 20}
!206 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!207 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 20}
!208 = !{ptr @loop_add_fusion_11, !"kernel", i32 1}
!209 = !{ptr @loop_add_fusion_11, !"reqntidx", i32 20}
!210 = !{ptr @loop_add_fusion_12, !"kernel", i32 1}
!211 = !{ptr @loop_add_fusion_12, !"reqntidx", i32 20}
!212 = !{ptr @loop_add_fusion_13, !"kernel", i32 1}
!213 = !{ptr @loop_add_fusion_13, !"reqntidx", i32 20}
!214 = !{ptr @loop_add_fusion_15, !"kernel", i32 1}
!215 = !{ptr @loop_add_fusion_15, !"reqntidx", i32 20}
!216 = !{ptr @loop_add_fusion_14, !"kernel", i32 1}
!217 = !{ptr @loop_add_fusion_14, !"reqntidx", i32 20}
!218 = !{ptr @input_reduce_fusion_2, !"kernel", i32 1}
!219 = !{ptr @input_reduce_fusion_2, !"reqntidx", i32 1024}
!220 = !{ptr @loop_add_fusion_16, !"kernel", i32 1}
!221 = !{ptr @loop_add_fusion_16, !"reqntidx", i32 20}
!222 = !{ptr @input_concatenate_reduce_fusion, !"kernel", i32 1}
!223 = !{ptr @input_concatenate_reduce_fusion, !"reqntidx", i32 32}
!224 = !{ptr @input_reduce_fusion_3, !"kernel", i32 1}
!225 = !{ptr @input_reduce_fusion_3, !"reqntidx", i32 256}
!226 = !{ptr @loop_add_minimum_select_fusion, !"kernel", i32 1}
!227 = !{ptr @loop_add_minimum_select_fusion, !"reqntidx", i32 1}
!228 = !{ptr @input_concatenate_fusion_1, !"kernel", i32 1}
!229 = !{ptr @input_concatenate_fusion_1, !"reqntidx", i32 1}
!230 = !{ptr @loop_convert_fusion_4, !"kernel", i32 1}
!231 = !{ptr @loop_convert_fusion_4, !"reqntidx", i32 1}
!232 = !{ptr @loop_select_fusion_3, !"kernel", i32 1}
!233 = !{ptr @loop_select_fusion_3, !"reqntidx", i32 1}
!234 = !{ptr @loop_select_fusion_4, !"kernel", i32 1}
!235 = !{ptr @loop_select_fusion_4, !"reqntidx", i32 1}
!236 = !{ptr @loop_convert_fusion_1, !"kernel", i32 1}
!237 = !{ptr @loop_convert_fusion_1, !"reqntidx", i32 1}
!238 = !{ptr @wrapped_add, !"kernel", i32 1}
!239 = !{ptr @wrapped_add, !"reqntidx", i32 20}
!240 = !{ptr @wrapped_concatenate, !"kernel", i32 1}
!241 = !{ptr @wrapped_concatenate, !"reqntidx", i32 120}
!242 = !{ptr @loop_convert_fusion_3, !"kernel", i32 1}
!243 = !{ptr @loop_convert_fusion_3, !"reqntidx", i32 1}
!244 = !{ptr @loop_add_convert_fusion, !"kernel", i32 1}
!245 = !{ptr @loop_add_convert_fusion, !"reqntidx", i32 1}
!246 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!247 = !{ptr @input_reduce_fusion, !"reqntidx", i32 32}
!248 = !{ptr @loop_dynamic_update_slice_fusion_1, !"kernel", i32 1}
!249 = !{ptr @loop_dynamic_update_slice_fusion_1, !"reqntidx", i32 120}
!250 = !{ptr @loop_and_fusion, !"kernel", i32 1}
!251 = !{ptr @loop_and_fusion, !"reqntidx", i32 1}
!252 = !{ptr @input_reduce_fusion_1, !"kernel", i32 1}
!253 = !{ptr @input_reduce_fusion_1, !"reqntidx", i32 32}
!254 = !{ptr @loop_add_fusion_7, !"kernel", i32 1}
!255 = !{ptr @loop_add_fusion_7, !"reqntidx", i32 1}
!256 = !{ptr @loop_or_fusion, !"kernel", i32 1}
!257 = !{ptr @loop_or_fusion, !"reqntidx", i32 1}
!258 = !{ptr @loop_compare_fusion_2, !"kernel", i32 1}
!259 = !{ptr @loop_compare_fusion_2, !"reqntidx", i32 1}
!260 = !{ptr @loop_convert_fusion_6, !"kernel", i32 1}
!261 = !{ptr @loop_convert_fusion_6, !"reqntidx", i32 1}
!262 = !{ptr @loop_convert_fusion, !"kernel", i32 1}
!263 = !{ptr @loop_convert_fusion, !"reqntidx", i32 1}
!264 = !{ptr @wrapped_add_12, !"kernel", i32 1}
!265 = !{ptr @wrapped_add_12, !"reqntidx", i32 1}
!266 = !{ptr @wrapped_add_11, !"kernel", i32 1}
!267 = !{ptr @wrapped_add_11, !"reqntidx", i32 20}
!268 = !{ptr @input_reduce_fusion_4, !"kernel", i32 1}
!269 = !{ptr @input_reduce_fusion_4, !"reqntidx", i32 32}
!270 = !{ptr @loop_or_fusion_1, !"kernel", i32 1}
!271 = !{ptr @loop_or_fusion_1, !"reqntidx", i32 1}
!272 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!273 = !{ptr @loop_divide_fusion, !"reqntidx", i32 1}
!274 = !{ptr @loop_dynamic_update_slice_fusion_110, !"kernel", i32 1}
!275 = !{ptr @loop_dynamic_update_slice_fusion_110, !"reqntidx", i32 1}
!276 = !{ptr @loop_dynamic_update_slice_fusion_70, !"kernel", i32 1}
!277 = !{ptr @loop_dynamic_update_slice_fusion_70, !"reqntidx", i32 1}
!278 = !{ptr @loop_dynamic_update_slice_fusion_68, !"kernel", i32 1}
!279 = !{ptr @loop_dynamic_update_slice_fusion_68, !"reqntidx", i32 1}
!280 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!281 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!282 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!283 = !{ptr @loop_add_fusion, !"reqntidx", i32 1}
!284 = !{ptr @loop_add_exponential_subtract_fusion, !"kernel", i32 1}
!285 = !{ptr @loop_add_exponential_subtract_fusion, !"reqntidx", i32 1}
!286 = !{ptr @loop_concatenate_fusion, !"kernel", i32 1}
!287 = !{ptr @loop_concatenate_fusion, !"reqntidx", i32 120}
!288 = !{ptr @loop_exponential_log_fusion, !"kernel", i32 1}
!289 = !{ptr @loop_exponential_log_fusion, !"reqntidx", i32 1}
!290 = !{ptr @loop_add_fusion_5, !"kernel", i32 1}
!291 = !{ptr @loop_add_fusion_5, !"reqntidx", i32 120}
!292 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!293 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 120}
!294 = !{ptr @loop_dynamic_update_slice_fusion_60, !"kernel", i32 1}
!295 = !{ptr @loop_dynamic_update_slice_fusion_60, !"reqntidx", i32 120}
!296 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!297 = !{i32 2, i32 0}
!298 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!299 = !{i32 0, i32 10}
!300 = !{i32 0, i32 12}
!301 = !{i32 0, i32 128}
!302 = !{i32 0, i32 6}
!303 = !{}
!304 = distinct !{!304, !305}
!305 = !{!"llvm.loop.vectorize.enable", i1 false}
!306 = distinct !{!306, !305}
!307 = distinct !{!307, !305}
!308 = distinct !{!308, !305}
!309 = !{i32 0, i32 2}
!310 = !{i32 0, i32 120}
!311 = !{i32 0, i32 32}
!312 = !{i32 0, i32 20}
!313 = !{i32 0, i32 1024}
!314 = !{i32 0, i32 4}
!315 = !{i32 0, i32 30}
!316 = !{i32 0, i32 192}
!317 = !{i32 0, i32 8}
!318 = distinct !{!318, !305}
!319 = distinct !{!319, !305}
!320 = !{i32 0, i32 256}
!321 = distinct !{!321, !305}
