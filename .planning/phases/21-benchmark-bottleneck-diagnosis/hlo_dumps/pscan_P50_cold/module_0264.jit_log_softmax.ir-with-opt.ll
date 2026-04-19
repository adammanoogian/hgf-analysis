; ModuleID = 'jit_log_softmax'
source_filename = "jit_log_softmax"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg1) local_unnamed_addr #0 {
entry:
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !9
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %0 = lshr i32 %thread.id.x, 1
  %thread.id.2 = and i32 %thread.id.x, 1
  %tile_origin.1 = shl nuw nsw i32 %block.id.x, 7
  %1 = zext nneg i32 %thread.id.2 to i64
  %2 = or disjoint i32 %0, %tile_origin.1
  %.lhs.trunc = trunc nuw nsw i32 %2 to i16
  %3 = urem i16 %.lhs.trunc, 192
  %4 = udiv i16 %.lhs.trunc, 192
  %5 = zext nneg i16 %4 to i64
  %6 = zext nneg i16 %3 to i64
  %param_0.15 = getelementptr inbounds [48 x [192 x [2 x double]]], ptr addrspace(1) %arg019, i64 0, i64 %5, i64 %6, i64 %1
  %param_0.152 = load double, ptr addrspace(1) %param_0.15, align 8, !invariant.load !11
  %7 = bitcast double %param_0.152 to <2 x i32>
  %8 = extractelement <2 x i32> %7, i64 0
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 1, i32 31)
  %10 = extractelement <2 x i32> %7, i64 1
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = icmp eq i32 %thread.id.2, 0
  br i1 %12, label %reduction_write_output-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %entry
  ret void

reduction_write_output-true:                      ; preds = %entry
  %13 = fcmp uno double %param_0.152, 0.000000e+00
  %14 = insertelement <2 x i32> poison, i32 %9, i64 0
  %15 = insertelement <2 x i32> %14, i32 %11, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %17 = fcmp oge double %param_0.152, %16
  %18 = or i1 %13, %17
  %maximum.1.i10 = select i1 %18, double %param_0.152, double %16
  %output_element_address = getelementptr inbounds [48 x [192 x double]], ptr addrspace(1) %arg121, i64 0, i64 %5, i64 %6
  store double %maximum.1.i10, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #2

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_exponential_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(73728) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg3) local_unnamed_addr #0 {
entry:
  %arg335 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg233 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg131 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg029 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !9
  %block.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %0 = lshr i32 %thread.id.x, 1
  %thread.id.2 = and i32 %thread.id.x, 1
  %tile_origin.1 = shl nuw nsw i32 %block.id.x, 7
  %1 = zext nneg i32 %thread.id.2 to i64
  %2 = or disjoint i32 %0, %tile_origin.1
  %.lhs.trunc = trunc nuw nsw i32 %2 to i16
  %3 = urem i16 %.lhs.trunc, 192
  %4 = udiv i16 %.lhs.trunc, 192
  %5 = zext nneg i16 %4 to i64
  %6 = zext nneg i16 %3 to i64
  %param_0.17 = getelementptr inbounds [48 x [192 x [2 x double]]], ptr addrspace(1) %arg029, i64 0, i64 %5, i64 %6, i64 %1
  %param_0.172 = load double, ptr addrspace(1) %param_0.17, align 8, !invariant.load !11
  %param_1.14 = getelementptr inbounds [48 x [192 x double]], ptr addrspace(1) %arg131, i64 0, i64 %5, i64 %6
  %param_1.143 = load double, ptr addrspace(1) %param_1.14, align 8, !invariant.load !11
  %subtract.2.3.clone.1 = fsub double %param_0.172, %param_1.143
  %7 = tail call double @llvm.fma.f64(double %subtract.2.3.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %8 = tail call i32 @llvm.nvvm.d2i.lo(double %7) #6
  %9 = tail call double @llvm.nvvm.add.rn.d(double %7, double 0xC338000000000000) #6
  %10 = tail call double @llvm.fma.f64(double %9, double 0xBFE62E42FEFA39EF, double %subtract.2.3.clone.1)
  %11 = tail call double @llvm.fma.f64(double %9, double 0xBC7ABC9E3B39803F, double %10)
  %12 = tail call double @llvm.fma.f64(double %11, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %13 = tail call double @llvm.fma.f64(double %12, double %11, double 0x3EC71DEE62401315)
  %14 = tail call double @llvm.fma.f64(double %13, double %11, double 0x3EFA01997C89EB71)
  %15 = tail call double @llvm.fma.f64(double %14, double %11, double 0x3F2A01A014761F65)
  %16 = tail call double @llvm.fma.f64(double %15, double %11, double 0x3F56C16C1852B7AF)
  %17 = tail call double @llvm.fma.f64(double %16, double %11, double 0x3F81111111122322)
  %18 = tail call double @llvm.fma.f64(double %17, double %11, double 0x3FA55555555502A1)
  %19 = tail call double @llvm.fma.f64(double %18, double %11, double 0x3FC5555555555511)
  %20 = tail call double @llvm.fma.f64(double %19, double %11, double 0x3FE000000000000B)
  %21 = tail call double @llvm.fma.f64(double %20, double %11, double 1.000000e+00)
  %22 = tail call double @llvm.fma.f64(double %21, double %11, double 1.000000e+00)
  %23 = tail call i32 @llvm.nvvm.d2i.lo(double %22) #6
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %22) #6
  %25 = shl i32 %8, 20
  %26 = add i32 %24, %25
  %27 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %26) #6
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.2.3.clone.1) #6
  %29 = bitcast i32 %28 to float
  %30 = tail call float @llvm.nvvm.fabs.f(float %29) #6
  %31 = fcmp olt float %30, 0x4010C46560000000
  br i1 %31, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %__nv_exp.exit18
  ret void

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %32 = fcmp olt double %subtract.2.3.clone.1, 0.000000e+00
  %33 = fadd double %subtract.2.3.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %32, double 0.000000e+00, double %33
  %34 = fcmp olt float %30, 0x4010E90000000000
  br i1 %34, label %35, label %__nv_exp.exit

35:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %36 = sdiv i32 %8, 2
  %37 = shl i32 %36, 20
  %38 = add i32 %24, %37
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %38) #6
  %40 = sub nsw i32 %8, %36
  %41 = shl i32 %40, 20
  %42 = add nsw i32 %41, 1072693248
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %42) #6
  %44 = fmul double %43, %39
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %35
  %z.2.i = phi double [ %27, %entry ], [ %44, %35 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %45 = fcmp olt float %30, 0x4010C46560000000
  %add.1.i = fadd double %z.2.i, 0.000000e+00
  br i1 %45, label %__nv_exp.exit18, label %__internal_fast_icmp_abs_lt.exit.i15

__internal_fast_icmp_abs_lt.exit.i15:             ; preds = %__nv_exp.exit
  %46 = fcmp olt double %subtract.2.3.clone.1, 0.000000e+00
  %47 = fadd double %subtract.2.3.clone.1, 0x7FF0000000000000
  %z.0.i16 = select i1 %46, double 0.000000e+00, double %47
  %48 = fcmp olt float %30, 0x4010E90000000000
  br i1 %48, label %49, label %__nv_exp.exit18

49:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i15
  %50 = sdiv i32 %8, 2
  %51 = shl i32 %50, 20
  %52 = add i32 %24, %51
  %53 = tail call double @llvm.nvvm.lohi.i2d(i32 %23, i32 %52) #6
  %54 = sub nsw i32 %8, %50
  %55 = shl i32 %54, 20
  %56 = add nsw i32 %55, 1072693248
  %57 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %56) #6
  %58 = fmul double %57, %53
  br label %__nv_exp.exit18

__nv_exp.exit18:                                  ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i15, %49
  %z.2.i17 = phi double [ %27, %__nv_exp.exit ], [ %58, %49 ], [ %z.0.i16, %__internal_fast_icmp_abs_lt.exit.i15 ]
  %59 = trunc i64 %1 to i32
  %60 = getelementptr inbounds [48 x [192 x [2 x double]]], ptr addrspace(1) %arg335, i64 0, i64 %5, i64 %6, i64 %1
  store double %z.2.i17, ptr addrspace(1) %60, align 8
  %61 = bitcast double %add.1.i to <2 x i32>
  %62 = extractelement <2 x i32> %61, i64 0
  %63 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %62, i32 1, i32 31)
  %64 = extractelement <2 x i32> %61, i64 1
  %65 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 1, i32 31)
  %66 = icmp eq i32 %59, 0
  br i1 %66, label %reduction_write_output-true, label %reduce-group-0-after

reduction_write_output-true:                      ; preds = %__nv_exp.exit18
  %67 = insertelement <2 x i32> poison, i32 %63, i64 0
  %68 = insertelement <2 x i32> %67, i32 %65, i64 1
  %69 = bitcast <2 x i32> %68 to double
  %add.1.i20 = fadd double %add.1.i, %69
  %output_element_address = getelementptr inbounds [48 x [192 x double]], ptr addrspace(1) %arg233, i64 0, i64 %5, i64 %6
  store double %add.1.i20, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_subtract_fusion(ptr noalias nocapture readonly align 16 dereferenceable(147456) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(73728) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(147456) %arg3) local_unnamed_addr #3 {
entry:
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !13
  %linear_index = or disjoint i32 %1, %2
  %3 = lshr i32 %linear_index, 1
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg02, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !11
  %7 = zext nneg i32 %3 to i64
  %8 = getelementptr inbounds double, ptr addrspace(1) %arg14, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !11
  %10 = getelementptr inbounds double, ptr addrspace(1) %arg26, i64 %7
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !11
  %12 = tail call i32 @llvm.nvvm.d2i.hi(double %11) #6
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #6
  %14 = icmp slt i32 %12, 1048576
  %15 = fmul double %11, 0x4350000000000000
  %16 = tail call i32 @llvm.nvvm.d2i.lo(double %15) #6
  %17 = tail call i32 @llvm.nvvm.d2i.hi(double %15) #6
  br i1 %14, label %18, label %19

18:                                               ; preds = %entry
  br label %19

19:                                               ; preds = %18, %entry
  %.0.i = phi double [ %15, %18 ], [ %11, %entry ]
  %ihi.0.i = phi i32 [ %17, %18 ], [ %12, %entry ]
  %ilo.0.i = phi i32 [ %16, %18 ], [ %13, %entry ]
  %e.0.i = phi i32 [ -1077, %18 ], [ -1023, %entry ]
  %20 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %20, 2146435071
  br i1 %or.cond.i, label %21, label %68

21:                                               ; preds = %19
  %22 = lshr i32 %ihi.0.i, 20
  %23 = add nsw i32 %e.0.i, %22
  %24 = and i32 %ihi.0.i, 1048575
  %25 = or disjoint i32 %24, 1072693248
  %26 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %25) #6
  %27 = icmp ugt i32 %25, 1073127582
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #6
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %26) #6
  %30 = add i32 %29, -1048576
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %30) #6
  %spec.select = select i1 %27, double %31, double %26
  %32 = zext i1 %27 to i32
  %spec.select1 = add nsw i32 %23, %32
  %33 = fadd double %spec.select, -1.000000e+00
  %34 = fadd double %spec.select, 1.000000e+00
  %35 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %34) #6
  %36 = fneg double %34
  %37 = tail call double @llvm.fma.f64(double %36, double %35, double 1.000000e+00)
  %38 = tail call double @llvm.fma.f64(double %37, double %37, double %37)
  %39 = tail call double @llvm.fma.f64(double %38, double %35, double %35)
  %40 = fmul double %33, %39
  %41 = fadd double %40, %40
  %42 = fmul double %41, %41
  %43 = tail call double @llvm.fma.f64(double %42, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %44 = tail call double @llvm.fma.f64(double %43, double %42, double 0x3EF3B2669F02676F)
  %45 = tail call double @llvm.fma.f64(double %44, double %42, double 0x3F1745CBA9AB0956)
  %46 = tail call double @llvm.fma.f64(double %45, double %42, double 0x3F3C71C72D1B5154)
  %47 = tail call double @llvm.fma.f64(double %46, double %42, double 0x3F624924923BE72D)
  %48 = tail call double @llvm.fma.f64(double %47, double %42, double 0x3F8999999999A3C4)
  %49 = tail call double @llvm.fma.f64(double %48, double %42, double 0x3FB5555555555554)
  %50 = fsub double %33, %41
  %51 = fmul double %50, 2.000000e+00
  %52 = fneg double %41
  %53 = tail call double @llvm.fma.f64(double %52, double %33, double %51)
  %54 = fmul double %39, %53
  %55 = fmul double %42, %49
  %56 = tail call double @llvm.fma.f64(double %55, double %41, double %54)
  %57 = xor i32 %spec.select1, -2147483648
  %58 = tail call double @llvm.nvvm.lohi.i2d(i32 %57, i32 1127219200) #6
  %59 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #6
  %60 = fsub double %58, %59
  %61 = tail call double @llvm.fma.f64(double %60, double 0x3FE62E42FEFA39EF, double %41)
  %62 = fneg double %60
  %63 = tail call double @llvm.fma.f64(double %62, double 0x3FE62E42FEFA39EF, double %61)
  %64 = fsub double %63, %41
  %65 = fsub double %56, %64
  %66 = tail call double @llvm.fma.f64(double %60, double 0x3C7ABC9E3B39803F, double %65)
  %67 = fadd double %61, %66
  br label %__nv_log.exit

68:                                               ; preds = %19
  %69 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %70 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #6
  %71 = and i32 %70, 2147483647
  %72 = icmp eq i32 %71, 0
  %q.0.i = select i1 %72, double 0xFFF0000000000000, double %69
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %21, %68
  %q.1.i = phi double [ %67, %21 ], [ %q.0.i, %68 ]
  %subtract.2.5 = fsub double %6, %9
  %subtract.3.1 = fsub double %subtract.2.5, %q.1.i
  %73 = getelementptr double, ptr addrspace(1) %arg38, i64 %4
  store double %subtract.3.1, ptr addrspace(1) %73, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.hi(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.nvvm.d2i.lo(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.lohi.i2d(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare double @llvm.nvvm.rcp.approx.ftz.d(double) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.nvvm.add.rn.d(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.f(float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fma.f64(double, double, double) #5

attributes #0 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}
!nvvmir.version = !{!7}
!llvm.module.flags = !{!8}

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 256}
!2 = !{ptr @input_exponential_reduce_fusion, !"kernel", i32 1}
!3 = !{ptr @input_exponential_reduce_fusion, !"reqntidx", i32 256}
!4 = !{ptr @loop_subtract_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_subtract_fusion, !"reqntidx", i32 128}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!7 = !{i32 2, i32 0}
!8 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!9 = !{i32 0, i32 256}
!10 = !{i32 0, i32 72}
!11 = !{}
!12 = !{i32 0, i32 144}
!13 = !{i32 0, i32 128}
