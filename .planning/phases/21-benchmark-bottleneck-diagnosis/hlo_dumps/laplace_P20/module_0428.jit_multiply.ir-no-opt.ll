; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@tr_tile_0 = private addrspace(3) global [1 x [32 x [33 x double]]] undef
@tr_tile_01 = private addrspace(3) global [1 x [32 x [33 x double]]] undef

define void @input_transpose_fusion_1(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(30720) %arg1, ptr noalias align 128 dereferenceable(30720) %arg2) {
entry:
  %loop2.invar_address12 = alloca i32, align 4
  %loop1.invar_address6 = alloca i32, align 4
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %0 = udiv i32 %thread.id.x, 32
  %thread.id.1 = urem i32 %0, 4
  %thread.id.2 = urem i32 %thread.id.x, 32
  %lane_id = urem i32 %thread.id.x, 32
  %1 = udiv i32 %block.id.x, 1
  %2 = urem i32 %1, 1
  %3 = udiv i32 %block.id.x, 1
  %4 = urem i32 %3, 6
  %5 = udiv i32 %block.id.x, 6
  %6 = icmp eq i32 %2, 0
  %tile_bound.2 = select i1 %6, i32 20, i32 32
  %tile_origin.0 = mul i32 %5, 1
  %tile_origin.1 = mul i32 %4, 32
  %tile_origin.2 = mul i32 %2, 32
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %entry
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %7 = icmp uge i32 %loop1.indvar, 32
  br i1 %7, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 4
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 %thread.id.2, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %loop2.loop_body, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %8 = icmp uge i32 %loop2.indvar, %tile_bound.2
  br i1 %8, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 32
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %9 = add i32 %tile_origin.0, 0
  %10 = add i32 %tile_origin.1, %loop1.indvar
  %11 = add i32 %tile_origin.2, %loop2.indvar
  %param_1.4 = getelementptr inbounds [192 x [20 x double]], ptr %arg1, i32 0, i32 %10, i32 %11
  %param_1.42 = load double, ptr %param_1.4, align 8, !invariant.load !6
  %12 = getelementptr inbounds [1 x [32 x [33 x double]]], ptr addrspace(3) @tr_tile_0, i32 0, i32 0, i32 %loop1.indvar, i32 %loop2.indvar
  %13 = addrspacecast ptr addrspace(3) %12 to ptr
  store double %param_1.42, ptr %13, align 8
  br label %loop2.loop_header, !llvm.loop !7

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !9

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  call void @llvm.nvvm.barrier0()
  store i32 %thread.id.1, ptr %loop1.invar_address6, align 4
  br label %loop1.loop_header4

loop1.loop_header4:                               ; preds = %loop2.loop_exit9, %loop1.loop_exit
  %loop1.indvar7 = load i32, ptr %loop1.invar_address6, align 4
  %14 = icmp uge i32 %loop1.indvar7, %tile_bound.2
  br i1 %14, label %loop1.loop_exit3, label %loop1.loop_body5

loop1.loop_body5:                                 ; preds = %loop1.loop_header4
  %invar.inc8 = add nuw nsw i32 %loop1.indvar7, 4
  store i32 %invar.inc8, ptr %loop1.invar_address6, align 4
  store i32 %thread.id.2, ptr %loop2.invar_address12, align 4
  br label %loop2.loop_header10

loop2.loop_header10:                              ; preds = %loop2.loop_body11, %loop1.loop_body5
  %loop2.indvar13 = load i32, ptr %loop2.invar_address12, align 4
  %15 = icmp uge i32 %loop2.indvar13, 32
  br i1 %15, label %loop2.loop_exit9, label %loop2.loop_body11

loop2.loop_body11:                                ; preds = %loop2.loop_header10
  %invar.inc14 = add nuw nsw i32 %loop2.indvar13, 32
  store i32 %invar.inc14, ptr %loop2.invar_address12, align 4
  %16 = add i32 %tile_origin.0, 0
  %17 = add i32 %tile_origin.2, %loop1.indvar7
  %18 = add i32 %tile_origin.1, %loop2.indvar13
  %19 = getelementptr inbounds [1 x [32 x [33 x double]]], ptr addrspace(3) @tr_tile_0, i32 0, i32 0, i32 %loop2.indvar13, i32 %loop1.indvar7
  %20 = addrspacecast ptr addrspace(3) %19 to ptr
  %21 = load double, ptr %20, align 8
  %param_0.3 = getelementptr inbounds [20 x [192 x double]], ptr %arg0, i32 0, i32 %17, i32 %18
  %param_0.315 = load double, ptr %param_0.3, align 8, !invariant.load !6
  %multiply.2.1 = fmul double %21, %param_0.315
  %22 = getelementptr inbounds [20 x [192 x double]], ptr %arg2, i32 0, i32 %17, i32 %18
  store double %multiply.2.1, ptr %22, align 8
  br label %loop2.loop_header10, !llvm.loop !10

loop2.loop_exit9:                                 ; preds = %loop2.loop_header10
  br label %loop1.loop_header4, !llvm.loop !11

loop1.loop_exit3:                                 ; preds = %loop1.loop_header4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

define void @input_transpose_fusion(ptr noalias align 16 dereferenceable(30720) %arg0, ptr noalias align 16 dereferenceable(3686400) %arg1, ptr noalias align 128 dereferenceable(3686400) %arg2) {
entry:
  %loop2.invar_address12 = alloca i32, align 4
  %loop1.invar_address6 = alloca i32, align 4
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %0 = udiv i32 %thread.id.x, 32
  %thread.id.1 = urem i32 %0, 4
  %thread.id.2 = urem i32 %thread.id.x, 32
  %lane_id = urem i32 %thread.id.x, 32
  %1 = udiv i32 %block.id.x, 1
  %2 = urem i32 %1, 1
  %3 = udiv i32 %block.id.x, 1
  %4 = urem i32 %3, 6
  %5 = udiv i32 %block.id.x, 6
  %6 = icmp eq i32 %2, 0
  %tile_bound.2 = select i1 %6, i32 20, i32 32
  %tile_origin.0 = mul i32 %5, 1
  %tile_origin.1 = mul i32 %4, 32
  %tile_origin.2 = mul i32 %2, 32
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %entry
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %7 = icmp uge i32 %loop1.indvar, 32
  br i1 %7, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 4
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 %thread.id.2, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %loop2.loop_body, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %8 = icmp uge i32 %loop2.indvar, %tile_bound.2
  br i1 %8, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 32
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %9 = add i32 %tile_origin.0, 0
  %10 = add i32 %tile_origin.1, %loop1.indvar
  %11 = add i32 %tile_origin.2, %loop2.indvar
  %param_1.2 = getelementptr inbounds [120 x [192 x [20 x double]]], ptr %arg1, i32 0, i32 %9, i32 %10, i32 %11
  %param_1.22 = load double, ptr %param_1.2, align 8, !invariant.load !6
  %12 = getelementptr inbounds [1 x [32 x [33 x double]]], ptr addrspace(3) @tr_tile_01, i32 0, i32 0, i32 %loop1.indvar, i32 %loop2.indvar
  %13 = addrspacecast ptr addrspace(3) %12 to ptr
  store double %param_1.22, ptr %13, align 8
  br label %loop2.loop_header, !llvm.loop !13

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !14

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  call void @llvm.nvvm.barrier0()
  store i32 %thread.id.1, ptr %loop1.invar_address6, align 4
  br label %loop1.loop_header4

loop1.loop_header4:                               ; preds = %loop2.loop_exit9, %loop1.loop_exit
  %loop1.indvar7 = load i32, ptr %loop1.invar_address6, align 4
  %14 = icmp uge i32 %loop1.indvar7, %tile_bound.2
  br i1 %14, label %loop1.loop_exit3, label %loop1.loop_body5

loop1.loop_body5:                                 ; preds = %loop1.loop_header4
  %invar.inc8 = add nuw nsw i32 %loop1.indvar7, 4
  store i32 %invar.inc8, ptr %loop1.invar_address6, align 4
  store i32 %thread.id.2, ptr %loop2.invar_address12, align 4
  br label %loop2.loop_header10

loop2.loop_header10:                              ; preds = %loop2.loop_body11, %loop1.loop_body5
  %loop2.indvar13 = load i32, ptr %loop2.invar_address12, align 4
  %15 = icmp uge i32 %loop2.indvar13, 32
  br i1 %15, label %loop2.loop_exit9, label %loop2.loop_body11

loop2.loop_body11:                                ; preds = %loop2.loop_header10
  %invar.inc14 = add nuw nsw i32 %loop2.indvar13, 32
  store i32 %invar.inc14, ptr %loop2.invar_address12, align 4
  %16 = add i32 %tile_origin.0, 0
  %17 = add i32 %tile_origin.2, %loop1.indvar7
  %18 = add i32 %tile_origin.1, %loop2.indvar13
  %19 = getelementptr inbounds [1 x [32 x [33 x double]]], ptr addrspace(3) @tr_tile_01, i32 0, i32 0, i32 %loop2.indvar13, i32 %loop1.indvar7
  %20 = addrspacecast ptr addrspace(3) %19 to ptr
  %21 = load double, ptr %20, align 8
  %param_0.1 = getelementptr inbounds [20 x [192 x double]], ptr %arg0, i32 0, i32 %17, i32 %18
  %param_0.115 = load double, ptr %param_0.1, align 8, !invariant.load !6
  %multiply.3.1 = fmul double %21, %param_0.115
  %22 = getelementptr inbounds [120 x [20 x [192 x double]]], ptr %arg2, i32 0, i32 %16, i32 %17, i32 %18
  store double %multiply.3.1, ptr %22, align 8
  br label %loop2.loop_header10, !llvm.loop !15

loop2.loop_exit9:                                 ; preds = %loop2.loop_header10
  br label %loop1.loop_header4, !llvm.loop !16

loop1.loop_exit3:                                 ; preds = %loop1.loop_header4
  ret void
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @input_transpose_fusion_1, !"kernel", i32 1}
!1 = !{ptr @input_transpose_fusion_1, !"reqntidx", i32 128}
!2 = !{ptr @input_transpose_fusion, !"kernel", i32 1}
!3 = !{ptr @input_transpose_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 128}
!5 = !{i32 0, i32 6}
!6 = !{}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.vectorize.enable", i1 false}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = !{i32 0, i32 720}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !8}
