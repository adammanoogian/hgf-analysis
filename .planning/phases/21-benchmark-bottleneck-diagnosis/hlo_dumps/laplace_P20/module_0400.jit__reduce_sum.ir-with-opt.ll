; ModuleID = 'jit__reduce_sum'
source_filename = "jit__reduce_sum"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none)
define void @input_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(160) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(19200) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(960) %arg3) local_unnamed_addr #0 {
entry:
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce.8.2.inner.loop_body.reduction_dim.0.preheader, label %concatenate.pivot.1.8

reduce.8.2.inner.loop_body.reduction_dim.0.preheader: ; preds = %entry
  %2 = load <2 x double>, ptr addrspace(1) %arg019, align 16, !invariant.load !4
  %3 = extractelement <2 x double> %2, i32 0
  %4 = extractelement <2 x double> %2, i32 1
  %add.1.i = fadd double %3, 0.000000e+00
  %add.1.i.1 = fadd double %add.1.i, %4
  %5 = getelementptr inbounds i8, ptr addrspace(1) %arg019, i64 16
  %6 = load <2 x double>, ptr addrspace(1) %5, align 16, !invariant.load !4
  %7 = extractelement <2 x double> %6, i32 0
  %8 = extractelement <2 x double> %6, i32 1
  %add.1.i.2 = fadd double %add.1.i.1, %7
  %add.1.i.3 = fadd double %add.1.i.2, %8
  %9 = getelementptr inbounds i8, ptr addrspace(1) %arg019, i64 32
  %10 = load <2 x double>, ptr addrspace(1) %9, align 16, !invariant.load !4
  %11 = extractelement <2 x double> %10, i32 0
  %12 = extractelement <2 x double> %10, i32 1
  %add.1.i.4 = fadd double %add.1.i.3, %11
  %add.1.i.5 = fadd double %add.1.i.4, %12
  %13 = getelementptr inbounds i8, ptr addrspace(1) %arg019, i64 48
  %14 = load <2 x double>, ptr addrspace(1) %13, align 16, !invariant.load !4
  %15 = extractelement <2 x double> %14, i32 0
  %16 = extractelement <2 x double> %14, i32 1
  %add.1.i.6 = fadd double %add.1.i.5, %15
  %add.1.i.7 = fadd double %add.1.i.6, %16
  %17 = getelementptr inbounds i8, ptr addrspace(1) %arg019, i64 64
  %18 = load <2 x double>, ptr addrspace(1) %17, align 16, !invariant.load !4
  %19 = extractelement <2 x double> %18, i32 0
  %20 = extractelement <2 x double> %18, i32 1
  %add.1.i.8 = fadd double %add.1.i.7, %19
  %add.1.i.9 = fadd double %add.1.i.8, %20
  %21 = getelementptr inbounds i8, ptr addrspace(1) %arg019, i64 80
  %22 = load <2 x double>, ptr addrspace(1) %21, align 16, !invariant.load !4
  %23 = extractelement <2 x double> %22, i32 0
  %24 = extractelement <2 x double> %22, i32 1
  %add.1.i.10 = fadd double %add.1.i.9, %23
  %add.1.i.11 = fadd double %add.1.i.10, %24
  %25 = getelementptr inbounds i8, ptr addrspace(1) %arg019, i64 96
  %26 = load <2 x double>, ptr addrspace(1) %25, align 16, !invariant.load !4
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %add.1.i.12 = fadd double %add.1.i.11, %27
  %add.1.i.13 = fadd double %add.1.i.12, %28
  %29 = getelementptr inbounds i8, ptr addrspace(1) %arg019, i64 112
  %30 = load <2 x double>, ptr addrspace(1) %29, align 16, !invariant.load !4
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %add.1.i.14 = fadd double %add.1.i.13, %31
  %add.1.i.15 = fadd double %add.1.i.14, %32
  %33 = getelementptr inbounds i8, ptr addrspace(1) %arg019, i64 128
  %34 = load <2 x double>, ptr addrspace(1) %33, align 16, !invariant.load !4
  %35 = extractelement <2 x double> %34, i32 0
  %36 = extractelement <2 x double> %34, i32 1
  %add.1.i.16 = fadd double %add.1.i.15, %35
  %add.1.i.17 = fadd double %add.1.i.16, %36
  %37 = getelementptr inbounds i8, ptr addrspace(1) %arg019, i64 144
  %38 = load double, ptr addrspace(1) %37, align 16, !invariant.load !4
  %add.1.i.18 = fadd double %add.1.i.17, %38
  %39 = getelementptr inbounds i8, ptr addrspace(1) %arg019, i64 152
  br label %concatenate.merge

concatenate.pivot.1.8:                            ; preds = %entry
  %40 = add nsw i32 %0, -1
  %41 = zext nneg i32 %40 to i64
  %42 = getelementptr inbounds [120 x [20 x double]], ptr addrspace(1) %arg121, i64 0, i64 %41, i64 0
  %43 = load <2 x double>, ptr addrspace(1) %42, align 16, !invariant.load !4
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %add.1.i11 = fadd double %44, 0.000000e+00
  %add.1.i11.1 = fadd double %add.1.i11, %45
  %46 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 16
  %47 = load <2 x double>, ptr addrspace(1) %46, align 16, !invariant.load !4
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %add.1.i11.2 = fadd double %add.1.i11.1, %48
  %add.1.i11.3 = fadd double %add.1.i11.2, %49
  %50 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 32
  %51 = load <2 x double>, ptr addrspace(1) %50, align 16, !invariant.load !4
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %add.1.i11.4 = fadd double %add.1.i11.3, %52
  %add.1.i11.5 = fadd double %add.1.i11.4, %53
  %54 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 48
  %55 = load <2 x double>, ptr addrspace(1) %54, align 16, !invariant.load !4
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  %add.1.i11.6 = fadd double %add.1.i11.5, %56
  %add.1.i11.7 = fadd double %add.1.i11.6, %57
  %58 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 64
  %59 = load <2 x double>, ptr addrspace(1) %58, align 16, !invariant.load !4
  %60 = extractelement <2 x double> %59, i32 0
  %61 = extractelement <2 x double> %59, i32 1
  %add.1.i11.8 = fadd double %add.1.i11.7, %60
  %add.1.i11.9 = fadd double %add.1.i11.8, %61
  %62 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 80
  %63 = load <2 x double>, ptr addrspace(1) %62, align 16, !invariant.load !4
  %64 = extractelement <2 x double> %63, i32 0
  %65 = extractelement <2 x double> %63, i32 1
  %add.1.i11.10 = fadd double %add.1.i11.9, %64
  %add.1.i11.11 = fadd double %add.1.i11.10, %65
  %66 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 96
  %67 = load <2 x double>, ptr addrspace(1) %66, align 16, !invariant.load !4
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %add.1.i11.12 = fadd double %add.1.i11.11, %68
  %add.1.i11.13 = fadd double %add.1.i11.12, %69
  %70 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 112
  %71 = load <2 x double>, ptr addrspace(1) %70, align 16, !invariant.load !4
  %72 = extractelement <2 x double> %71, i32 0
  %73 = extractelement <2 x double> %71, i32 1
  %add.1.i11.14 = fadd double %add.1.i11.13, %72
  %add.1.i11.15 = fadd double %add.1.i11.14, %73
  %74 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 128
  %75 = load <2 x double>, ptr addrspace(1) %74, align 16, !invariant.load !4
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %add.1.i11.16 = fadd double %add.1.i11.15, %76
  %add.1.i11.17 = fadd double %add.1.i11.16, %77
  %78 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 144
  %79 = load double, ptr addrspace(1) %78, align 16, !invariant.load !4
  %add.1.i11.18 = fadd double %add.1.i11.17, %79
  %80 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 152
  br label %concatenate.merge

concatenate.merge:                                ; preds = %concatenate.pivot.1.8, %reduce.8.2.inner.loop_body.reduction_dim.0.preheader
  %.pre-phi28 = phi i64 [ %41, %concatenate.pivot.1.8 ], [ 4294967295, %reduce.8.2.inner.loop_body.reduction_dim.0.preheader ]
  %.sink18 = phi ptr addrspace(1) [ %80, %concatenate.pivot.1.8 ], [ %39, %reduce.8.2.inner.loop_body.reduction_dim.0.preheader ]
  %add.1.i11.18.sink = phi double [ %add.1.i11.18, %concatenate.pivot.1.8 ], [ %add.1.i.18, %reduce.8.2.inner.loop_body.reduction_dim.0.preheader ]
  %81 = icmp eq i32 %0, 0
  %82 = load double, ptr addrspace(1) %.sink18, align 8, !invariant.load !4
  %add.1.i11.19 = fadd double %add.1.i11.18.sink, %82
  %83 = getelementptr inbounds [120 x double], ptr addrspace(1) %arg325, i64 0, i64 %.pre-phi28
  %arg2.sink = select i1 %81, ptr addrspace(1) %arg223, ptr addrspace(1) %83
  store double %add.1.i11.19, ptr addrspace(1) %arg2.sink, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @input_slice_fusion, !"kernel", i32 1}
!1 = !{ptr @input_slice_fusion, !"reqntidx", i32 121}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 121}
!4 = !{}
