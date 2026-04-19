; ModuleID = 'jit_log_softmax'
source_filename = "jit_log_softmax"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion(ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg1) local_unnamed_addr #0 {
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
  %param_0.48 = getelementptr inbounds [1 x [20 x [192 x [2 x double]]]], ptr addrspace(1) %arg019, i64 0, i64 0, i64 %5, i64 %6, i64 %1
  %param_0.482 = load double, ptr addrspace(1) %param_0.48, align 8, !invariant.load !11
  %add.3.i = fadd double %param_0.482, 0.000000e+00
  %7 = bitcast double %add.3.i to <2 x i32>
  %8 = extractelement <2 x i32> %7, i64 0
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 1, i32 31)
  %10 = extractelement <2 x i32> %7, i64 1
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = icmp eq i32 %thread.id.2, 0
  br i1 %12, label %reduction_write_output-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %entry
  ret void

reduction_write_output-true:                      ; preds = %entry
  %13 = insertelement <2 x i32> poison, i32 %9, i64 0
  %14 = insertelement <2 x i32> %13, i32 %11, i64 1
  %15 = bitcast <2 x i32> %14 to double
  %add.3.i10 = fadd double %add.3.i, %15
  %output_element_address = getelementptr inbounds [1 x [20 x [192 x double]]], ptr addrspace(1) %arg121, i64 0, i64 0, i64 %5, i64 %6
  %16 = fneg double %add.3.i10
  store double %16, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_fusion(ptr noalias nocapture readonly align 16 dereferenceable(30720) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(30720) %arg3) local_unnamed_addr #3 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !12
  %linear_index = or disjoint i32 %1, %2
  %3 = zext nneg i32 %linear_index to i64
  %4 = getelementptr double, ptr addrspace(1) %arg01, i64 %3
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !11
  %multiply.13.3 = fmul double %5, %5
  %divide.4.1 = fdiv double 1.000000e+00, %multiply.13.3
  %6 = getelementptr double, ptr addrspace(1) %arg13, i64 %3
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !11
  %divide.3.1.clone.1 = fdiv double %7, %5
  %8 = getelementptr double, ptr addrspace(1) %arg25, i64 %3
  store double %divide.4.1, ptr addrspace(1) %8, align 8
  %9 = getelementptr double, ptr addrspace(1) %arg37, i64 %3
  store double %divide.3.1.clone.1, ptr addrspace(1) %9, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 16 dereferenceable(7372800) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(3686400) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(7372800) %arg6) local_unnamed_addr #3 {
entry:
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
  %1 = shl nuw nsw i32 %0, 9
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !12
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or disjoint i32 %1, %3
  %linear_index3 = or disjoint i32 %linear_index_base, 3
  %.lhs.trunc = trunc nuw nsw i32 %0 to i16
  %4 = udiv i16 %.lhs.trunc, 15
  %5 = udiv i32 %linear_index_base, 384
  %.lhs.trunc16 = trunc nuw nsw i32 %5 to i16
  %6 = urem i16 %.lhs.trunc16, 20
  %7 = lshr i32 %linear_index3, 1
  %8 = urem i32 %7, 192
  %linear_index2 = or disjoint i32 %linear_index_base, 2
  %9 = lshr exact i32 %linear_index2, 1
  %10 = urem i32 %9, 192
  %linear_index1 = or disjoint i32 %linear_index_base, 1
  %11 = lshr exact i32 %linear_index_base, 1
  %12 = urem i32 %11, 192
  %13 = zext nneg i16 %4 to i64
  %14 = zext nneg i16 %6 to i64
  %15 = zext nneg i32 %12 to i64
  %16 = getelementptr inbounds [120 x [20 x [192 x [1 x double]]]], ptr addrspace(1) %arg528, i64 0, i64 %13, i64 %14, i64 %15, i64 0
  %17 = load double, ptr addrspace(1) %16, align 16, !invariant.load !11
  %18 = fneg double %17
  %19 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr addrspace(1) %arg426, i64 0, i64 0, i64 %14, i64 %15
  %20 = load double, ptr addrspace(1) %19, align 16, !invariant.load !11
  %multiply.12.5 = fmul double %20, %18
  %21 = getelementptr inbounds [1 x [1 x [20 x [192 x double]]]], ptr addrspace(1) %arg324, i64 0, i64 0, i64 0, i64 %14, i64 %15
  %22 = load double, ptr addrspace(1) %21, align 16, !invariant.load !11
  %multiply.14.3 = fmul double %multiply.12.5, %22
  %23 = urem i32 %linear_index_base, 7680
  %24 = zext nneg i32 %23 to i64
  %25 = getelementptr inbounds double, ptr addrspace(1) %arg222, i64 %24
  %26 = load double, ptr addrspace(1) %25, align 16, !invariant.load !11
  %multiply.15.3 = fmul double %multiply.14.3, %26
  %27 = urem i32 %11, 3840
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds double, ptr addrspace(1) %arg120, i64 %28
  %30 = load double, ptr addrspace(1) %29, align 16, !invariant.load !11
  %31 = zext nneg i32 %linear_index_base to i64
  %32 = getelementptr double, ptr addrspace(1) %arg018, i64 %31
  %33 = load <2 x double>, ptr addrspace(1) %32, align 16, !invariant.load !11
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %multiply.16.3 = fmul double %30, %34
  %add.5.1 = fadd double %multiply.15.3, %multiply.16.3
  %36 = getelementptr double, ptr addrspace(1) %arg630, i64 %31
  %37 = urem i32 %linear_index1, 7680
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr inbounds double, ptr addrspace(1) %arg222, i64 %38
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !11
  %multiply.15.33 = fmul double %multiply.14.3, %40
  %multiply.16.34 = fmul double %30, %35
  %add.5.15 = fadd double %multiply.15.33, %multiply.16.34
  %41 = insertelement <2 x double> poison, double %add.5.1, i32 0
  %42 = insertelement <2 x double> %41, double %add.5.15, i32 1
  store <2 x double> %42, ptr addrspace(1) %36, align 32
  %43 = zext nneg i32 %10 to i64
  %44 = getelementptr inbounds [120 x [20 x [192 x [1 x double]]]], ptr addrspace(1) %arg528, i64 0, i64 %13, i64 %14, i64 %43, i64 0
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !11
  %46 = fneg double %45
  %47 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr addrspace(1) %arg426, i64 0, i64 0, i64 %14, i64 %43
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !11
  %multiply.12.56 = fmul double %48, %46
  %49 = getelementptr inbounds [1 x [1 x [20 x [192 x double]]]], ptr addrspace(1) %arg324, i64 0, i64 0, i64 0, i64 %14, i64 %43
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !11
  %multiply.14.37 = fmul double %multiply.12.56, %50
  %51 = urem i32 %linear_index2, 7680
  %52 = zext nneg i32 %51 to i64
  %53 = getelementptr inbounds double, ptr addrspace(1) %arg222, i64 %52
  %54 = load double, ptr addrspace(1) %53, align 16, !invariant.load !11
  %multiply.15.38 = fmul double %multiply.14.37, %54
  %55 = urem i32 %9, 3840
  %56 = zext nneg i32 %55 to i64
  %57 = getelementptr inbounds double, ptr addrspace(1) %arg120, i64 %56
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !11
  %59 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 16
  %60 = load <2 x double>, ptr addrspace(1) %59, align 16, !invariant.load !11
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %multiply.16.39 = fmul double %58, %61
  %add.5.110 = fadd double %multiply.15.38, %multiply.16.39
  %63 = getelementptr inbounds i8, ptr addrspace(1) %36, i64 16
  %64 = zext nneg i32 %8 to i64
  %65 = getelementptr inbounds [120 x [20 x [192 x [1 x double]]]], ptr addrspace(1) %arg528, i64 0, i64 %13, i64 %14, i64 %64, i64 0
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !11
  %67 = fneg double %66
  %68 = getelementptr inbounds [1 x [20 x [192 x double]]], ptr addrspace(1) %arg426, i64 0, i64 0, i64 %14, i64 %64
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !11
  %multiply.12.511 = fmul double %69, %67
  %70 = getelementptr inbounds [1 x [1 x [20 x [192 x double]]]], ptr addrspace(1) %arg324, i64 0, i64 0, i64 0, i64 %14, i64 %64
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !11
  %multiply.14.312 = fmul double %multiply.12.511, %71
  %72 = urem i32 %linear_index3, 7680
  %73 = zext nneg i32 %72 to i64
  %74 = getelementptr inbounds double, ptr addrspace(1) %arg222, i64 %73
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !11
  %multiply.15.313 = fmul double %multiply.14.312, %75
  %76 = urem i32 %7, 3840
  %77 = zext nneg i32 %76 to i64
  %78 = getelementptr inbounds double, ptr addrspace(1) %arg120, i64 %77
  %79 = load double, ptr addrspace(1) %78, align 8, !invariant.load !11
  %multiply.16.314 = fmul double %79, %62
  %add.5.115 = fadd double %multiply.15.313, %multiply.16.314
  %80 = insertelement <2 x double> poison, double %add.5.110, i32 0
  %81 = insertelement <2 x double> %80, double %add.5.115, i32 1
  store <2 x double> %81, ptr addrspace(1) %63, align 16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(30720) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(61440) %arg3) local_unnamed_addr #3 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !14
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !12
  %linear_index = or disjoint i32 %1, %2
  %3 = lshr i32 %linear_index, 1
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !11
  %7 = zext nneg i32 %3 to i64
  %8 = getelementptr inbounds double, ptr addrspace(1) %arg25, i64 %7
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !11
  %10 = getelementptr double, ptr addrspace(1) %arg13, i64 %4
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !11
  %multiply.11.3 = fmul double %9, %11
  %add.4.1 = fadd double %6, %multiply.11.3
  %12 = getelementptr double, ptr addrspace(1) %arg37, i64 %4
  store double %add.4.1, ptr addrspace(1) %12, align 8
  ret void
}

attributes #0 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7}
!llvm.module.flags = !{!8}

!0 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!1 = !{ptr @input_reduce_fusion, !"reqntidx", i32 256}
!2 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_divide_fusion, !"reqntidx", i32 128}
!4 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_add_fusion, !"reqntidx", i32 128}
!6 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!7 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 128}
!8 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!9 = !{i32 0, i32 256}
!10 = !{i32 0, i32 30}
!11 = !{}
!12 = !{i32 0, i32 128}
!13 = !{i32 0, i32 1800}
!14 = !{i32 0, i32 60}
