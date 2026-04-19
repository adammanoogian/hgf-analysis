; ModuleID = 'jit_transpose'
source_filename = "jit_transpose"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@tr_tile_0 = private addrspace(3) global [1 x [32 x [33 x double]]] undef

define void @wrapped_transpose(ptr noalias align 16 dereferenceable(73728) %arg0, ptr noalias align 128 dereferenceable(73728) %arg1) {
entry:
  %loop2.invar_address12 = alloca i32, align 4
  %loop1.invar_address6 = alloca i32, align 4
  %loop2.invar_address = alloca i32, align 4
  %loop1.invar_address = alloca i32, align 4
  %thread.id.x = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %block.id.x = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %0 = udiv i32 %thread.id.x, 32
  %thread.id.1 = urem i32 %0, 4
  %thread.id.2 = urem i32 %thread.id.x, 32
  %lane_id = urem i32 %thread.id.x, 32
  %1 = udiv i32 %block.id.x, 1
  %2 = urem i32 %1, 6
  %3 = udiv i32 %block.id.x, 6
  %4 = urem i32 %3, 2
  %5 = udiv i32 %block.id.x, 12
  %6 = icmp eq i32 %4, 1
  %tile_bound.1 = select i1 %6, i32 16, i32 32
  %tile_origin.0 = mul i32 %5, 1
  %tile_origin.1 = mul i32 %4, 32
  %tile_origin.2 = mul i32 %2, 32
  store i32 %thread.id.1, ptr %loop1.invar_address, align 4
  br label %loop1.loop_header

loop1.loop_header:                                ; preds = %loop2.loop_exit, %entry
  %loop1.indvar = load i32, ptr %loop1.invar_address, align 4
  %7 = icmp uge i32 %loop1.indvar, %tile_bound.1
  br i1 %7, label %loop1.loop_exit, label %loop1.loop_body

loop1.loop_body:                                  ; preds = %loop1.loop_header
  %invar.inc = add nuw nsw i32 %loop1.indvar, 4
  store i32 %invar.inc, ptr %loop1.invar_address, align 4
  store i32 %thread.id.2, ptr %loop2.invar_address, align 4
  br label %loop2.loop_header

loop2.loop_header:                                ; preds = %loop2.loop_body, %loop1.loop_body
  %loop2.indvar = load i32, ptr %loop2.invar_address, align 4
  %8 = icmp uge i32 %loop2.indvar, 32
  br i1 %8, label %loop2.loop_exit, label %loop2.loop_body

loop2.loop_body:                                  ; preds = %loop2.loop_header
  %invar.inc1 = add nuw nsw i32 %loop2.indvar, 32
  store i32 %invar.inc1, ptr %loop2.invar_address, align 4
  %9 = add i32 %tile_origin.0, 0
  %10 = add i32 %tile_origin.1, %loop1.indvar
  %11 = add i32 %tile_origin.2, %loop2.indvar
  %param_0 = getelementptr inbounds [48 x [192 x [1 x double]]], ptr %arg0, i32 0, i32 %10, i32 %11, i32 0
  %param_02 = load double, ptr %param_0, align 8, !invariant.load !4
  %12 = getelementptr inbounds [1 x [32 x [33 x double]]], ptr addrspace(3) @tr_tile_0, i32 0, i32 0, i32 %loop1.indvar, i32 %loop2.indvar
  %13 = addrspacecast ptr addrspace(3) %12 to ptr
  store double %param_02, ptr %13, align 8
  br label %loop2.loop_header, !llvm.loop !5

loop2.loop_exit:                                  ; preds = %loop2.loop_header
  br label %loop1.loop_header, !llvm.loop !7

loop1.loop_exit:                                  ; preds = %loop1.loop_header
  call void @llvm.nvvm.barrier0()
  store i32 %thread.id.1, ptr %loop1.invar_address6, align 4
  br label %loop1.loop_header4

loop1.loop_header4:                               ; preds = %loop2.loop_exit9, %loop1.loop_exit
  %loop1.indvar7 = load i32, ptr %loop1.invar_address6, align 4
  %14 = icmp uge i32 %loop1.indvar7, 32
  br i1 %14, label %loop1.loop_exit3, label %loop1.loop_body5

loop1.loop_body5:                                 ; preds = %loop1.loop_header4
  %invar.inc8 = add nuw nsw i32 %loop1.indvar7, 4
  store i32 %invar.inc8, ptr %loop1.invar_address6, align 4
  store i32 %thread.id.2, ptr %loop2.invar_address12, align 4
  br label %loop2.loop_header10

loop2.loop_header10:                              ; preds = %loop2.loop_body11, %loop1.loop_body5
  %loop2.indvar13 = load i32, ptr %loop2.invar_address12, align 4
  %15 = icmp uge i32 %loop2.indvar13, %tile_bound.1
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
  %22 = getelementptr inbounds [192 x [48 x [1 x double]]], ptr %arg1, i32 0, i32 %17, i32 %18, i32 0
  store double %21, ptr %22, align 8
  br label %loop2.loop_header10, !llvm.loop !8

loop2.loop_exit9:                                 ; preds = %loop2.loop_header10
  br label %loop1.loop_header4, !llvm.loop !9

loop1.loop_exit3:                                 ; preds = %loop1.loop_header4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1}

!0 = !{ptr @wrapped_transpose, !"kernel", i32 1}
!1 = !{ptr @wrapped_transpose, !"reqntidx", i32 128}
!2 = !{i32 0, i32 128}
!3 = !{i32 0, i32 12}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.vectorize.enable", i1 false}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
