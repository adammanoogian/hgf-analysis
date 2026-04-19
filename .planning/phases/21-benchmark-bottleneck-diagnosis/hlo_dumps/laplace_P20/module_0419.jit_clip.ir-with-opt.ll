; ModuleID = 'jit_clip'
source_filename = "jit_clip"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_minimum_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg5) local_unnamed_addr #0 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 3840
  br i1 %3, label %loop_divide_minimum_fusion.in_bounds-true, label %loop_divide_minimum_fusion.in_bounds-after

loop_divide_minimum_fusion.in_bounds-after:       ; preds = %loop_divide_minimum_fusion.in_bounds-true, %entry
  ret void

loop_divide_minimum_fusion.in_bounds-true:        ; preds = %entry
  %4 = load double, ptr addrspace(1) %arg25, align 16, !invariant.load !7
  %5 = zext nneg i32 %linear_index to i64
  %6 = getelementptr double, ptr addrspace(1) %arg13, i64 %5
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !7
  %8 = fcmp uno double %4, 0.000000e+00
  %9 = fcmp oge double %4, %7
  %10 = or i1 %8, %9
  %maximum.1.3 = select i1 %10, double %4, double %7
  %11 = load double, ptr addrspace(1) %arg01, align 16, !invariant.load !7
  %12 = fcmp uno double %11, 0.000000e+00
  %13 = fcmp ole double %11, %maximum.1.3
  %14 = or i1 %12, %13
  %minimum.1.1.clone.1 = select i1 %14, double %11, double %maximum.1.3
  %compare.6.1 = fcmp oeq double %maximum.1.3, %minimum.1.1.clone.1
  %15 = select i1 %compare.6.1, double 1.000000e+00, double 0.000000e+00
  %compare.7.1 = fcmp oeq double %11, %minimum.1.1.clone.1
  %16 = select i1 %compare.7.1, double 2.000000e+00, double 1.000000e+00
  %divide.3.1 = fdiv double %15, %16
  %compare.4.1.clone.1 = fcmp oeq double %7, %maximum.1.3
  %17 = select i1 %compare.4.1.clone.1, double 1.000000e+00, double 0.000000e+00
  %compare.5.1.clone.1 = fcmp oeq double %4, %maximum.1.3
  %18 = select i1 %compare.5.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.2.1.clone.1 = fdiv double %17, %18
  %19 = getelementptr double, ptr addrspace(1) %arg37, i64 %5
  store double %divide.3.1, ptr addrspace(1) %19, align 8
  %20 = getelementptr double, ptr addrspace(1) %arg49, i64 %5
  store double %minimum.1.1.clone.1, ptr addrspace(1) %20, align 8
  %21 = getelementptr double, ptr addrspace(1) %arg511, i64 %5
  store double %divide.2.1.clone.1, ptr addrspace(1) %21, align 8
  br label %loop_divide_minimum_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(3686400) %arg3) local_unnamed_addr #0 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !9
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index_base, 3840
  %5 = udiv i32 %linear_index_base, 20
  %.lhs.trunc = trunc nuw nsw i32 %5 to i16
  %6 = urem i16 %.lhs.trunc, 192
  %7 = urem i32 %linear_index3, 20
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %8 = urem i32 %linear_index2, 20
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %9 = urem i32 %linear_index1, 20
  %10 = mul i32 %5, 20
  %.decomposed = sub i32 %linear_index_base, %10
  %11 = zext nneg i16 %6 to i64
  %12 = zext nneg i32 %4 to i64
  %13 = zext nneg i32 %.decomposed to i64
  %14 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg212, i64 0, i64 %11, i64 %12, i64 %13
  %15 = load double, ptr addrspace(1) %14, align 16, !invariant.load !7
  %16 = mul i32 %4, 3840
  %.decomposed7 = sub i32 %linear_index_base, %16
  %17 = zext nneg i32 %.decomposed7 to i64
  %18 = getelementptr inbounds double, ptr addrspace(1) %arg110, i64 %17
  %19 = load double, ptr addrspace(1) %18, align 32, !invariant.load !7
  %multiply.4.1 = fmul double %15, %19
  %20 = getelementptr inbounds double, ptr addrspace(1) %arg08, i64 %17
  %21 = load double, ptr addrspace(1) %20, align 32, !invariant.load !7
  %multiply.5.1 = fmul double %multiply.4.1, %21
  %22 = zext nneg i32 %linear_index_base to i64
  %23 = getelementptr double, ptr addrspace(1) %arg314, i64 %22
  %24 = zext nneg i32 %9 to i64
  %25 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg212, i64 0, i64 %11, i64 %12, i64 %24
  %26 = load double, ptr addrspace(1) %25, align 8, !invariant.load !7
  %27 = urem i32 %linear_index1, 3840
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds double, ptr addrspace(1) %arg110, i64 %28
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !7
  %multiply.4.11 = fmul double %26, %30
  %31 = getelementptr inbounds double, ptr addrspace(1) %arg08, i64 %28
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !7
  %multiply.5.12 = fmul double %multiply.4.11, %32
  %33 = insertelement <2 x double> poison, double %multiply.5.1, i32 0
  %34 = insertelement <2 x double> %33, double %multiply.5.12, i32 1
  store <2 x double> %34, ptr addrspace(1) %23, align 32
  %35 = zext nneg i32 %8 to i64
  %36 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg212, i64 0, i64 %11, i64 %12, i64 %35
  %37 = load double, ptr addrspace(1) %36, align 16, !invariant.load !7
  %38 = urem i32 %linear_index2, 3840
  %39 = zext nneg i32 %38 to i64
  %40 = getelementptr inbounds double, ptr addrspace(1) %arg110, i64 %39
  %41 = load double, ptr addrspace(1) %40, align 16, !invariant.load !7
  %multiply.4.13 = fmul double %37, %41
  %42 = getelementptr inbounds double, ptr addrspace(1) %arg08, i64 %39
  %43 = load double, ptr addrspace(1) %42, align 16, !invariant.load !7
  %multiply.5.14 = fmul double %multiply.4.13, %43
  %44 = getelementptr inbounds i8, ptr addrspace(1) %23, i64 16
  %45 = zext nneg i32 %7 to i64
  %46 = getelementptr inbounds [192 x [120 x [20 x double]]], ptr addrspace(1) %arg212, i64 0, i64 %11, i64 %12, i64 %45
  %47 = load double, ptr addrspace(1) %46, align 8, !invariant.load !7
  %48 = urem i32 %linear_index3, 3840
  %49 = zext nneg i32 %48 to i64
  %50 = getelementptr inbounds double, ptr addrspace(1) %arg110, i64 %49
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !7
  %multiply.4.15 = fmul double %47, %51
  %52 = getelementptr inbounds double, ptr addrspace(1) %arg08, i64 %49
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !7
  %multiply.5.16 = fmul double %multiply.4.15, %53
  %54 = insertelement <2 x double> poison, double %multiply.5.14, i32 0
  %55 = insertelement <2 x double> %54, double %multiply.5.16, i32 1
  store <2 x double> %55, ptr addrspace(1) %44, align 16
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{ptr @loop_divide_minimum_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_divide_minimum_fusion, !"reqntidx", i32 1024}
!2 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 128}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 4}
!6 = !{i32 0, i32 1024}
!7 = !{}
!8 = !{i32 0, i32 900}
!9 = !{i32 0, i32 128}
