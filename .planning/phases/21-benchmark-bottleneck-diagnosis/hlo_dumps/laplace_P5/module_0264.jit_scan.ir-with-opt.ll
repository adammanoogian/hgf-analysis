; ModuleID = 'jit_scan'
source_filename = "jit_scan"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_94_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !27
  %1 = icmp slt i64 %0, 192
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !27
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load i32, ptr addrspace(1) %9, align 4, !invariant.load !27
  store i32 %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_2(ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !27
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !27
  store double %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_6(ptr noalias nocapture readonly align 16 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %1 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !27
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg02, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !27
  %13 = getelementptr i8, ptr addrspace(1) %arg26, i64 %10
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg18, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg19, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg24) local_unnamed_addr #0 {
entry:
  %arg2466 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2364 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2262 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2160 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2058 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1956 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1854 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1752 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1650 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1548 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1446 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1344 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1242 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1140 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1038 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg936 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg834 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg732 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %1 = load i64, ptr addrspace(1) %arg2364, align 128, !invariant.load !27
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1038, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !27
  %13 = getelementptr double, ptr addrspace(1) %arg120, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !27
  %15 = trunc i8 %12 to i1
  %16 = select i1 %15, double %14, double 0.000000e+00
  %17 = getelementptr double, ptr addrspace(1) %arg2262, i64 %10
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !27
  %19 = select i1 %15, double %18, double 0.000000e+00
  %20 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg2160, i64 0, i64 %9, i64 %10
  %21 = load i8, ptr addrspace(1) %20, align 1, !invariant.load !27
  %22 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2058, i64 0, i64 %9, i64 %10
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !27
  %24 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1956, i64 0, i64 %9, i64 %10
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !27
  %26 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg1854, i64 0, i64 %9, i64 %10
  %27 = load i32, ptr addrspace(1) %26, align 4, !invariant.load !27
  %28 = icmp eq i32 %27, 1
  %29 = getelementptr double, ptr addrspace(1) %arg1752, i64 %10
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !27
  %31 = trunc i8 %25 to i1
  %32 = select i1 %31, i1 %28, i1 false
  %33 = select i1 %32, i1 %15, i1 false
  %34 = select i1 %33, double %30, double 0.000000e+00
  %35 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1650, i64 0, i64 %9, i64 %10
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !27
  %multiply.375.11 = fmul double %36, %34
  %37 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1548, i64 0, i64 %9, i64 %10
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !27
  %multiply.377.7 = fmul double %38, %multiply.375.11
  %39 = fmul double %23, %multiply.375.11
  %add.241.9 = fsub double %multiply.377.7, %39
  %40 = trunc i8 %21 to i1
  %41 = select i1 %40, double %add.241.9, double 0.000000e+00
  %42 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1446, i64 0, i64 %9, i64 %10
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !27
  %44 = getelementptr double, ptr addrspace(1) %arg1344, i64 %10
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !27
  %46 = select i1 %15, double %45, double 0.000000e+00
  %47 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1242, i64 0, i64 %9, i64 %10
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !27
  %multiply.378.19 = fmul double %46, %48
  %49 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1140, i64 0, i64 %9, i64 %10
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !27
  %multiply.379.11 = fmul double %multiply.378.19, %50
  %multiply.380.7 = fmul double %43, %multiply.379.11
  %add.242.7 = fadd double %41, %multiply.380.7
  %add.243.5 = fadd double %19, %add.242.7
  %51 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg018, i64 0, i64 %9, i64 %10
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !27
  %53 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg222, i64 0, i64 %9, i64 %10
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !27
  %55 = fneg double %add.243.5
  %56 = fmul double %52, %55
  %57 = fmul double %54, %56
  %add.244.3 = fadd double %16, %57
  %58 = getelementptr double, ptr addrspace(1) %arg630, i64 %10
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !27
  %60 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg732, i64 0, i64 %9, i64 %10
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !27
  %add.240.9 = fadd double %59, %61
  %62 = select i1 %15, double %add.240.9, double 0.000000e+00
  %63 = getelementptr double, ptr addrspace(1) %arg936, i64 %10
  %64 = load double, ptr addrspace(1) %63, align 8, !invariant.load !27
  %65 = select i1 %15, double %64, double 0.000000e+00
  %multiply.386.9 = fmul double %54, %add.243.5
  %66 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg834, i64 0, i64 %9, i64 %10
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !27
  %multiply.393.7 = fmul double %multiply.386.9, %67
  %add.245.5 = fadd double %65, %multiply.393.7
  %add.246.5 = fadd double %62, %add.245.5
  %68 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg528, i64 0, i64 %9, i64 %10
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !27
  %70 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg426, i64 0, i64 %9, i64 %10
  %71 = load double, ptr addrspace(1) %70, align 8, !invariant.load !27
  %72 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg324, i64 0, i64 %9, i64 %10
  %73 = load double, ptr addrspace(1) %72, align 8, !invariant.load !27
  %74 = fneg double %add.246.5
  %75 = fmul double %69, %74
  %76 = fmul double %71, %75
  %77 = fmul double %73, %76
  %add.247.1 = fadd double %add.244.3, %77
  %78 = getelementptr double, ptr addrspace(1) %arg2466, i64 %10
  store double %add.247.1, ptr addrspace(1) %78, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #0 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %1 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !27
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg02, i64 0, i64 %9, i64 %10
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !27
  %13 = getelementptr double, ptr addrspace(1) %arg26, i64 %10
  store double %12, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_1(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg8) local_unnamed_addr #0 {
entry:
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !27
  %4 = load double, ptr addrspace(1) %arg49, align 128, !invariant.load !27
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !27
  %7 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !27
  %9 = fneg double %6
  %10 = fmul double %8, %9
  %multiply.370.1.clone.1 = fmul double %4, %10
  %11 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !27
  %multiply.371.1.clone.1 = fmul double %12, %multiply.370.1.clone.1
  %multiply.372.1 = fmul double %3, %multiply.371.1.clone.1
  %13 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !27
  %15 = fneg double %10
  %16 = fmul double %14, %15
  %17 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %multiply.372.1, ptr addrspace(1) %17, align 8
  %18 = getelementptr double, ptr addrspace(1) %arg715, i64 %1
  store double %multiply.371.1.clone.1, ptr addrspace(1) %18, align 8
  %19 = getelementptr double, ptr addrspace(1) %arg817, i64 %1
  store double %16, ptr addrspace(1) %19, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_multiply_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #0 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !27
  %4 = getelementptr i8, ptr addrspace(1) %arg25, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !27
  %6 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !27
  %8 = trunc i8 %5 to i1
  %9 = select i1 %8, double %7, double 0.000000e+00
  %10 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !27
  %multiply.373.1 = fmul double %9, %10
  %multiply.374.1 = fmul double %3, %multiply.373.1
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.374.1, ptr addrspace(1) %11, align 8
  %12 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %9, ptr addrspace(1) %12, align 8
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg11, ptr noalias nocapture align 128 dereferenceable(32) %arg12, ptr noalias nocapture align 128 dereferenceable(32) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg18, ptr noalias nocapture align 128 dereferenceable(32) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg26, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg29, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg31, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg33, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg35, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg36, ptr noalias nocapture align 128 dereferenceable(32) %arg37, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg38) local_unnamed_addr #0 {
entry:
  %arg38101 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg3799 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg3697 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg3595 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg3493 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg3391 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg3289 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg3187 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg3085 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg2983 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg2881 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg2779 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg2677 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2575 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2473 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2371 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2269 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2167 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2065 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1963 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1861 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1759 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1657 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1555 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1453 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1351 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1249 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1147 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1045 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg943 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg841 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg739 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg637 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg535 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg433 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg331 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg229 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg127 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg025 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %1 = load i64, ptr addrspace(1) %arg229, align 128, !invariant.load !27
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg127, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !27
  %13 = getelementptr double, ptr addrspace(1) %arg025, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 8
  %15 = trunc i8 %12 to i1
  %16 = select i1 %15, double 0.000000e+00, double %14
  %17 = getelementptr double, ptr addrspace(1) %arg3799, i64 %10
  %18 = load double, ptr addrspace(1) %17, align 8
  %19 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg38101, i64 0, i64 %9, i64 %10
  %20 = load double, ptr addrspace(1) %19, align 8, !invariant.load !27
  %add.240.5.clone.1 = fadd double %18, %20
  %21 = select i1 %15, double 0.000000e+00, double %add.240.5.clone.1
  %22 = getelementptr double, ptr addrspace(1) %arg331, i64 %10
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !27
  %24 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg3697, i64 0, i64 %9, i64 %10
  %25 = load double, ptr addrspace(1) %24, align 8, !invariant.load !27
  %26 = select i1 %15, double %14, double 0.000000e+00
  %27 = getelementptr double, ptr addrspace(1) %arg3595, i64 %10
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !27
  %29 = select i1 %15, double %28, double 0.000000e+00
  %30 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg3493, i64 0, i64 %9, i64 %10
  %31 = load double, ptr addrspace(1) %30, align 8, !invariant.load !27
  %32 = getelementptr double, ptr addrspace(1) %arg3391, i64 %10
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !27
  %34 = select i1 %15, double %33, double 0.000000e+00
  %35 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg3289, i64 0, i64 %9, i64 %10
  %36 = load i8, ptr addrspace(1) %35, align 1, !invariant.load !27
  %37 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg3187, i64 0, i64 %9, i64 %10
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !27
  %39 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg3085, i64 0, i64 %9, i64 %10
  %40 = load i8, ptr addrspace(1) %39, align 1, !invariant.load !27
  %41 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg2983, i64 0, i64 %9, i64 %10
  %42 = load i32, ptr addrspace(1) %41, align 4, !invariant.load !27
  %43 = icmp eq i32 %42, 1
  %44 = getelementptr double, ptr addrspace(1) %arg2881, i64 %10
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !27
  %46 = trunc i8 %40 to i1
  %47 = select i1 %46, i1 %43, i1 false
  %48 = select i1 %47, i1 %15, i1 false
  %49 = select i1 %48, double %45, double 0.000000e+00
  %50 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2779, i64 0, i64 %9, i64 %10
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !27
  %multiply.375.9.clone.1 = fmul double %51, %49
  %52 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2677, i64 0, i64 %9, i64 %10
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !27
  %multiply.377.5.clone.1 = fmul double %53, %multiply.375.9.clone.1
  %54 = fmul double %38, %multiply.375.9.clone.1
  %add.241.7.clone.1 = fsub double %multiply.377.5.clone.1, %54
  %55 = trunc i8 %36 to i1
  %56 = select i1 %55, double %add.241.7.clone.1, double 0.000000e+00
  %57 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2575, i64 0, i64 %9, i64 %10
  %58 = load double, ptr addrspace(1) %57, align 8, !invariant.load !27
  %59 = getelementptr double, ptr addrspace(1) %arg2473, i64 %10
  %60 = load double, ptr addrspace(1) %59, align 8, !invariant.load !27
  %61 = select i1 %15, double %60, double 0.000000e+00
  %62 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2371, i64 0, i64 %9, i64 %10
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !27
  %multiply.378.17.clone.1 = fmul double %61, %63
  %64 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2269, i64 0, i64 %9, i64 %10
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !27
  %multiply.379.9.clone.1 = fmul double %multiply.378.17.clone.1, %65
  %multiply.380.5.clone.1 = fmul double %58, %multiply.379.9.clone.1
  %add.242.5.clone.1 = fadd double %56, %multiply.380.5.clone.1
  %add.243.3.clone.1 = fadd double %34, %add.242.5.clone.1
  %multiply.386.7.clone.1 = fmul double %31, %add.243.3.clone.1
  %66 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2167, i64 0, i64 %9, i64 %10
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !27
  %multiply.393.5.clone.1 = fmul double %67, %multiply.386.7.clone.1
  %add.245.3.clone.1 = fadd double %29, %multiply.393.5.clone.1
  %add.248.3.clone.1 = fsub double %26, %add.245.3.clone.1
  %68 = select i1 %15, double %add.240.5.clone.1, double 0.000000e+00
  %add.246.3.clone.1 = fadd double %68, %add.245.3.clone.1
  %add.249.1.clone.1 = fadd double %23, %add.246.3.clone.1
  %add.250.1.clone.1 = fadd double %add.248.3.clone.1, %add.249.1.clone.1
  %69 = getelementptr double, ptr addrspace(1) %arg2065, i64 %10
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !27
  %71 = select i1 %15, double %70, double 0.000000e+00
  %add.251.3.clone.1 = fadd double %23, %71
  %72 = getelementptr double, ptr addrspace(1) %arg1963, i64 %10
  %73 = load double, ptr addrspace(1) %72, align 8
  %74 = select i1 %15, double %73, double 0.000000e+00
  %75 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1861, i64 0, i64 %9, i64 %10
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !27
  %multiply.397.9.clone.1 = fmul double %76, %add.246.3.clone.1
  %77 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1759, i64 0, i64 %9
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !27
  %multiply.398.7.clone.1 = fmul double %78, %multiply.397.9.clone.1
  %add.252.5.clone.1 = fadd double %23, %multiply.398.7.clone.1
  %add.253.3.clone.1 = fadd double %74, %add.252.5.clone.1
  %79 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1657, i64 0, i64 %9, i64 %10
  %80 = load double, ptr addrspace(1) %79, align 8, !invariant.load !27
  %81 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg1555, i64 0, i64 %9
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !27
  %83 = fneg double %add.253.3.clone.1
  %84 = fdiv double %83, %80
  %85 = fmul double %82, %84
  %add.254.3.clone.1 = fadd double %add.251.3.clone.1, %85
  %86 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1453, i64 0, i64 %9, i64 %10
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !27
  %88 = getelementptr double, ptr addrspace(1) %arg1351, i64 %10
  %89 = load double, ptr addrspace(1) %88, align 8
  %90 = getelementptr double, ptr addrspace(1) %arg1249, i64 %10
  %91 = load double, ptr addrspace(1) %90, align 8
  %92 = fadd double %89, %91
  %add.255.5.clone.1 = select i1 %15, double %92, double 0.000000e+00
  %93 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1147, i64 0, i64 %9, i64 %10
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !27
  %95 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1045, i64 0, i64 %9, i64 %10
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !27
  %multiply.394.3.clone.1 = fmul double %add.246.3.clone.1, %96
  %97 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg943, i64 0, i64 %9, i64 %10
  %98 = load double, ptr addrspace(1) %97, align 8, !invariant.load !27
  %divide.19.5.clone.1 = fdiv double %multiply.394.3.clone.1, %98
  %multiply.400.11.clone.1 = fmul double %94, %divide.19.5.clone.1
  %99 = getelementptr double, ptr addrspace(1) %arg841, i64 %10
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !27
  %add.256.9.clone.1 = fadd double %100, %multiply.400.11.clone.1
  %add.257.7.clone.1 = fadd double %add.255.5.clone.1, %add.256.9.clone.1
  %add.258.5.clone.1 = fadd double %23, %add.257.7.clone.1
  %101 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg739, i64 0, i64 %9, i64 %10
  %102 = load double, ptr addrspace(1) %101, align 8, !invariant.load !27
  %103 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg637, i64 0, i64 %9, i64 %10
  %104 = load double, ptr addrspace(1) %103, align 8, !invariant.load !27
  %105 = fmul double %102, %83
  %106 = fmul double %105, %104
  %add.259.3.clone.1 = fadd double %106, %add.258.5.clone.1
  %107 = fmul double %87, %add.259.3.clone.1
  %add.260.1.clone.1 = fsub double %add.254.3.clone.1, %107
  %108 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg535, i64 0, i64 %9, i64 %10
  %109 = load double, ptr addrspace(1) %108, align 8, !invariant.load !27
  %multiply.404.9.clone.1 = fmul double %109, %add.259.3.clone.1
  %add.261.7.clone.1 = fadd double %multiply.404.9.clone.1, %add.260.1.clone.1
  %110 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg433, i64 0, i64 %9, i64 %10
  %111 = load double, ptr addrspace(1) %110, align 8, !invariant.load !27
  %multiply.405.5.clone.1 = fmul double %111, %add.261.7.clone.1
  %add.262.3.clone.1 = fadd double %add.250.1.clone.1, %multiply.405.5.clone.1
  %multiply.406.5.clone.1 = fmul double %25, %add.262.3.clone.1
  %add.263.3.clone.1 = fadd double %23, %multiply.406.5.clone.1
  %add.264.1.clone.1 = fadd double %21, %add.263.3.clone.1
  %112 = select i1 %15, double 0.000000e+00, double %73
  %113 = select i1 %15, double 0.000000e+00, double %91
  %114 = select i1 %15, double 0.000000e+00, double %89
  store double %16, ptr addrspace(1) %13, align 8
  store double %add.264.1.clone.1, ptr addrspace(1) %17, align 8
  store double %112, ptr addrspace(1) %72, align 8
  store double %113, ptr addrspace(1) %90, align 8
  store double %114, ptr addrspace(1) %88, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_1(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg5, ptr noalias nocapture align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg10, ptr noalias nocapture align 128 dereferenceable(32) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg14, ptr noalias nocapture align 128 dereferenceable(32) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg16, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg17, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg18, ptr noalias nocapture align 128 dereferenceable(32) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg20, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg21, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg22, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg23, ptr noalias nocapture readonly align 16 dereferenceable(1536) %arg24, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg25, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg26, ptr noalias nocapture align 128 dereferenceable(32) %arg27, ptr noalias nocapture align 128 dereferenceable(32) %arg28, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg30, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg31, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg32, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg33, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg34, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg35, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg36, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg37, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg38, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg39, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg40, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg41, ptr noalias nocapture align 128 dereferenceable(32) %arg42, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg43, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg44, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg45, ptr noalias nocapture align 128 dereferenceable(32) %arg46, ptr noalias nocapture align 128 dereferenceable(32) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg48, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg49, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg50, ptr noalias nocapture align 128 dereferenceable(32) %arg51, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg52, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg54, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg55, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg56, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg57, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg58, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg59, ptr noalias nocapture align 128 dereferenceable(32) %arg60, ptr noalias nocapture align 128 dereferenceable(32) %arg61, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg62, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg63, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg64, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg65, ptr noalias nocapture readonly align 16 dereferenceable(768) %arg66, ptr noalias nocapture align 128 dereferenceable(32) %arg67, ptr noalias nocapture readnone align 16 dereferenceable(768) %arg68, ptr noalias nocapture align 128 dereferenceable(32) %arg69, ptr noalias nocapture align 128 dereferenceable(32) %arg70) local_unnamed_addr #0 {
entry:
  %arg70191 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69189 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg67185 = addrspacecast ptr %arg67 to ptr addrspace(1)
  %arg66183 = addrspacecast ptr %arg66 to ptr addrspace(1)
  %arg65181 = addrspacecast ptr %arg65 to ptr addrspace(1)
  %arg64179 = addrspacecast ptr %arg64 to ptr addrspace(1)
  %arg63177 = addrspacecast ptr %arg63 to ptr addrspace(1)
  %arg62175 = addrspacecast ptr %arg62 to ptr addrspace(1)
  %arg61173 = addrspacecast ptr %arg61 to ptr addrspace(1)
  %arg60171 = addrspacecast ptr %arg60 to ptr addrspace(1)
  %arg59169 = addrspacecast ptr %arg59 to ptr addrspace(1)
  %arg58167 = addrspacecast ptr %arg58 to ptr addrspace(1)
  %arg57165 = addrspacecast ptr %arg57 to ptr addrspace(1)
  %arg56163 = addrspacecast ptr %arg56 to ptr addrspace(1)
  %arg55161 = addrspacecast ptr %arg55 to ptr addrspace(1)
  %arg54159 = addrspacecast ptr %arg54 to ptr addrspace(1)
  %arg53157 = addrspacecast ptr %arg53 to ptr addrspace(1)
  %arg52155 = addrspacecast ptr %arg52 to ptr addrspace(1)
  %arg51153 = addrspacecast ptr %arg51 to ptr addrspace(1)
  %arg50151 = addrspacecast ptr %arg50 to ptr addrspace(1)
  %arg49149 = addrspacecast ptr %arg49 to ptr addrspace(1)
  %arg48147 = addrspacecast ptr %arg48 to ptr addrspace(1)
  %arg47145 = addrspacecast ptr %arg47 to ptr addrspace(1)
  %arg46143 = addrspacecast ptr %arg46 to ptr addrspace(1)
  %arg45141 = addrspacecast ptr %arg45 to ptr addrspace(1)
  %arg44139 = addrspacecast ptr %arg44 to ptr addrspace(1)
  %arg43137 = addrspacecast ptr %arg43 to ptr addrspace(1)
  %arg42135 = addrspacecast ptr %arg42 to ptr addrspace(1)
  %arg41133 = addrspacecast ptr %arg41 to ptr addrspace(1)
  %arg40131 = addrspacecast ptr %arg40 to ptr addrspace(1)
  %arg39129 = addrspacecast ptr %arg39 to ptr addrspace(1)
  %arg38127 = addrspacecast ptr %arg38 to ptr addrspace(1)
  %arg37125 = addrspacecast ptr %arg37 to ptr addrspace(1)
  %arg36123 = addrspacecast ptr %arg36 to ptr addrspace(1)
  %arg35121 = addrspacecast ptr %arg35 to ptr addrspace(1)
  %arg34119 = addrspacecast ptr %arg34 to ptr addrspace(1)
  %arg33117 = addrspacecast ptr %arg33 to ptr addrspace(1)
  %arg32115 = addrspacecast ptr %arg32 to ptr addrspace(1)
  %arg31113 = addrspacecast ptr %arg31 to ptr addrspace(1)
  %arg30111 = addrspacecast ptr %arg30 to ptr addrspace(1)
  %arg29109 = addrspacecast ptr %arg29 to ptr addrspace(1)
  %arg28107 = addrspacecast ptr %arg28 to ptr addrspace(1)
  %arg27105 = addrspacecast ptr %arg27 to ptr addrspace(1)
  %arg26103 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg25101 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2499 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2397 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2295 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2193 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2091 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1989 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1887 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1785 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1683 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1581 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1479 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1377 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1275 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1173 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1071 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg969 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg867 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg765 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg663 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg561 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg459 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg357 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg255 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg153 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg051 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %1 = load i64, ptr addrspace(1) %arg2091, align 128, !invariant.load !27
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg765, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !27
  %13 = getelementptr double, ptr addrspace(1) %arg051, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 8
  %15 = trunc i8 %12 to i1
  %16 = select i1 %15, double 0.000000e+00, double %14
  %17 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg357, i64 0, i64 %9, i64 %10
  %18 = load i8, ptr addrspace(1) %17, align 1, !invariant.load !27
  %19 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg969, i64 0, i64 %9, i64 %10
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !27
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %15, double %14, double 0.000000e+00
  %23 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg867, i64 0, i64 %9, i64 %10
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !27
  %.neg = fneg double %22
  %25 = select i1 %21, double %.neg, double -0.000000e+00
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg255, i64 0, i64 %9, i64 %10
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !27
  %29 = fneg double %26
  %30 = fmul double %28, %29
  %31 = trunc i8 %18 to i1
  %32 = select i1 %31, double %30, double 0.000000e+00
  %33 = getelementptr double, ptr addrspace(1) %arg153, i64 %10
  %34 = load double, ptr addrspace(1) %33, align 8, !invariant.load !27
  %add.289.5 = fadd double %34, %32
  %35 = getelementptr double, ptr addrspace(1) %arg1989, i64 %10
  %36 = load double, ptr addrspace(1) %35, align 8
  %37 = select i1 %15, double %36, double 0.000000e+00
  %38 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1887, i64 0, i64 %9, i64 %10
  %39 = load i8, ptr addrspace(1) %38, align 1, !invariant.load !27
  %40 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1785, i64 0, i64 %9, i64 %10
  %41 = load i8, ptr addrspace(1) %40, align 1, !invariant.load !27
  %42 = icmp eq i32 %20, 1
  %43 = trunc i8 %41 to i1
  %44 = select i1 %43, i1 %42, i1 false
  %45 = select i1 %44, double %22, double 0.000000e+00
  %46 = trunc i8 %39 to i1
  %47 = select i1 %46, double %45, double 0.000000e+00
  %48 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1683, i64 0, i64 %9, i64 %10
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !27
  %50 = getelementptr double, ptr addrspace(1) %arg1581, i64 %10
  %51 = load double, ptr addrspace(1) %50, align 8
  %52 = select i1 %15, double %51, double 0.000000e+00
  %53 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1479, i64 0, i64 %9, i64 %10
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !27
  %multiply.378.15 = fmul double %52, %54
  %55 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1377, i64 0, i64 %9, i64 %10
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !27
  %57 = fneg double %49
  %58 = fmul double %multiply.378.15, %57
  %59 = fmul double %56, %58
  %multiply.431.15 = fmul double %59, 2.000000e+00
  %add.290.13 = fadd double %47, %multiply.431.15
  %add.291.11 = fadd double %37, %add.290.13
  %add.292.9 = fadd double %34, %add.291.11
  %60 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1275, i64 0, i64 %9, i64 %10
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !27
  %62 = getelementptr double, ptr addrspace(1) %arg1173, i64 %10
  %63 = load double, ptr addrspace(1) %62, align 8
  %64 = select i1 %15, double %63, double 0.000000e+00
  %add.293.9 = fadd double %34, %64
  %multiply.432.11 = fmul double %61, %add.293.9
  %add.294.9 = fadd double %multiply.432.11, %add.292.9
  %65 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1071, i64 0, i64 %9, i64 %10
  %66 = load double, ptr addrspace(1) %65, align 8, !invariant.load !27
  %67 = fneg double %add.294.9
  %68 = fmul double %66, %67
  %69 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg561, i64 0, i64 %9, i64 %10
  %70 = load double, ptr addrspace(1) %69, align 8, !invariant.load !27
  %71 = getelementptr double, ptr addrspace(1) %arg663, i64 %10
  %72 = load double, ptr addrspace(1) %71, align 8
  %73 = select i1 %15, double %72, double 0.000000e+00
  %add.296.3 = fadd double %34, %73
  %74 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg459, i64 0, i64 %9, i64 %10
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !27
  %76 = fneg double %add.296.3
  %77 = fmul double %75, %76
  %78 = fmul double %70, %68
  %add.297.3 = fsub double %77, %78
  %add.298.3 = fadd double %add.289.5, %add.297.3
  %add.300.1 = fadd double %16, %add.298.3
  %79 = getelementptr double, ptr addrspace(1) %arg27105, i64 %10
  %80 = load double, ptr addrspace(1) %79, align 8
  %add.302.3.clone.1 = fadd double %80, 0.000000e+00
  %81 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg26103, i64 0, i64 %9, i64 %10
  %82 = load double, ptr addrspace(1) %81, align 8, !invariant.load !27
  %multiply.436.9.clone.1 = fmul double %26, %82
  %83 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg25101, i64 0, i64 %9, i64 %10
  %84 = load double, ptr addrspace(1) %83, align 8, !invariant.load !27
  %multiply.437.7.clone.1 = fmul double %multiply.436.9.clone.1, %84
  %85 = select i1 %31, double %multiply.437.7.clone.1, double 0.000000e+00
  %add.303.5.clone.1 = fadd double %34, %85
  %86 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg2499, i64 0, i64 %9
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !27
  %88 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg2397, i64 0, i64 %9, i64 %10
  %89 = load i8, ptr addrspace(1) %88, align 1, !invariant.load !27
  %90 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2295, i64 0, i64 %9, i64 %10
  %91 = load double, ptr addrspace(1) %90, align 8, !invariant.load !27
  %multiply.438.7.clone.1 = fmul double %add.293.9, %91
  %add.304.5.clone.1 = fadd double %68, %multiply.438.7.clone.1
  %92 = trunc i8 %89 to i1
  %93 = select i1 %92, double %add.304.5.clone.1, double 0.000000e+00
  %multiply.439.5.clone.1 = fmul double %87, %93
  %94 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2193, i64 0, i64 %9, i64 %10
  %95 = load double, ptr addrspace(1) %94, align 8, !invariant.load !27
  %multiply.440.3.clone.1 = fmul double %95, %multiply.439.5.clone.1
  %add.306.3.clone.1 = fadd double %add.303.5.clone.1, %multiply.440.3.clone.1
  %add.308.1.clone.1 = fadd double %add.302.3.clone.1, %add.306.3.clone.1
  %96 = select i1 %15, double 0.000000e+00, double %63
  %97 = select i1 %15, double 0.000000e+00, double %72
  %98 = select i1 %15, double 0.000000e+00, double %36
  %99 = select i1 %15, double 0.000000e+00, double %51
  %100 = getelementptr double, ptr addrspace(1) %arg30111, i64 %10
  %101 = load double, ptr addrspace(1) %100, align 8, !invariant.load !27
  %102 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg44139, i64 0, i64 %9, i64 %10
  %103 = load double, ptr addrspace(1) %102, align 8, !invariant.load !27
  %104 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg43137, i64 0, i64 %9, i64 %10
  %105 = load i8, ptr addrspace(1) %104, align 1, !invariant.load !27
  %106 = getelementptr double, ptr addrspace(1) %arg61173, i64 %10
  %107 = load double, ptr addrspace(1) %106, align 8
  %108 = select i1 %15, double %107, double 0.000000e+00
  %109 = getelementptr double, ptr addrspace(1) %arg60171, i64 %10
  %110 = load double, ptr addrspace(1) %109, align 8
  %111 = select i1 %15, double %110, double 0.000000e+00
  %112 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg59169, i64 0, i64 %9, i64 %10
  %113 = load double, ptr addrspace(1) %112, align 8, !invariant.load !27
  %114 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg40131, i64 0, i64 %9, i64 %10
  %115 = load double, ptr addrspace(1) %114, align 8, !invariant.load !27
  %multiply.375.13.clone.1 = fmul double %45, %115
  %116 = fneg double %multiply.375.13.clone.1
  %117 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg58167, i64 0, i64 %9, i64 %10
  %118 = load double, ptr addrspace(1) %117, align 8, !invariant.load !27
  %multiply.377.9.clone.1 = fmul double %118, %multiply.375.13.clone.1
  %119 = fmul double %113, %multiply.375.13.clone.1
  %add.241.11.clone.1 = fsub double %multiply.377.9.clone.1, %119
  %120 = select i1 %46, double %add.241.11.clone.1, double 0.000000e+00
  %121 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg57165, i64 0, i64 %9, i64 %10
  %122 = load double, ptr addrspace(1) %121, align 8, !invariant.load !27
  %123 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg34119, i64 0, i64 %9, i64 %10
  %124 = load double, ptr addrspace(1) %123, align 8, !invariant.load !27
  %multiply.379.13.clone.1 = fmul double %multiply.378.15, %124
  %multiply.380.9.clone.1 = fmul double %122, %multiply.379.13.clone.1
  %add.242.9.clone.1 = fadd double %120, %multiply.380.9.clone.1
  %add.243.7.clone.1 = fadd double %111, %add.242.9.clone.1
  %125 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg56163, i64 0, i64 %9, i64 %10
  %126 = load double, ptr addrspace(1) %125, align 8, !invariant.load !27
  %multiply.407.13.clone.1 = fmul double %126, %add.243.7.clone.1
  %127 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg55161, i64 0, i64 %9, i64 %10
  %128 = load double, ptr addrspace(1) %127, align 8, !invariant.load !27
  %divide.20.5.clone.1 = fdiv double %add.243.7.clone.1, %128
  %add.265.11.clone.1 = fadd double %multiply.407.13.clone.1, %divide.20.5.clone.1
  %add.266.9.clone.1 = fadd double %108, %add.265.11.clone.1
  %129 = getelementptr double, ptr addrspace(1) %arg54159, i64 %10
  %130 = load double, ptr addrspace(1) %129, align 8, !invariant.load !27
  %add.267.7.clone.1 = fadd double %130, %add.266.9.clone.1
  %131 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg53157, i64 0, i64 %9, i64 %10
  %132 = load double, ptr addrspace(1) %131, align 8, !invariant.load !27
  %133 = getelementptr double, ptr addrspace(1) %arg42135, i64 %10
  %134 = load double, ptr addrspace(1) %133, align 8
  %135 = select i1 %15, double %134, double 0.000000e+00
  %136 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg41133, i64 0, i64 %9, i64 %10
  %137 = load double, ptr addrspace(1) %136, align 8, !invariant.load !27
  %138 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg39129, i64 0, i64 %9, i64 %10
  %139 = load double, ptr addrspace(1) %138, align 8, !invariant.load !27
  %multiply.408.9.clone.1 = fmul double %139, %116
  %multiply.409.15.clone.1 = fmul double %137, %multiply.408.9.clone.1
  %140 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg38127, i64 0, i64 %9, i64 %10
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !27
  %multiply.410.11.clone.1 = fmul double %multiply.375.13.clone.1, %139
  %142 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg37125, i64 0, i64 %9, i64 %10
  %143 = load double, ptr addrspace(1) %142, align 8, !invariant.load !27
  %multiply.411.9.clone.1 = fmul double %multiply.410.11.clone.1, %143
  %multiply.412.7.clone.1 = fmul double %141, %multiply.411.9.clone.1
  %add.268.13.clone.1 = fadd double %multiply.409.15.clone.1, %multiply.412.7.clone.1
  %multiply.413.11.clone.1 = fmul double %multiply.375.13.clone.1, 5.000000e-01
  %144 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg36123, i64 0, i64 %9, i64 %10
  %145 = load double, ptr addrspace(1) %144, align 8, !invariant.load !27
  %multiply.414.9.clone.1 = fmul double %multiply.413.11.clone.1, %145
  %multiply.415.7.clone.1 = fmul double %141, %multiply.414.9.clone.1
  %add.269.11.clone.1 = fadd double %add.268.13.clone.1, %multiply.415.7.clone.1
  %146 = select i1 %46, double %add.269.11.clone.1, double 0.000000e+00
  %147 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg35121, i64 0, i64 %9, i64 %10
  %148 = load double, ptr addrspace(1) %147, align 8, !invariant.load !27
  %149 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg33117, i64 0, i64 %9, i64 %10
  %150 = load double, ptr addrspace(1) %149, align 8, !invariant.load !27
  %multiply.416.9.clone.1 = fmul double %multiply.379.13.clone.1, %150
  %multiply.417.7.clone.1 = fmul double %148, %multiply.416.9.clone.1
  %add.270.9.clone.1 = fadd double %146, %multiply.417.7.clone.1
  %add.271.7.clone.1 = fadd double %135, %add.270.9.clone.1
  %add.272.5.clone.1 = fadd double %34, %add.271.7.clone.1
  %multiply.418.3.clone.1 = fmul double %132, %add.272.5.clone.1
  %add.273.5.clone.1 = fadd double %add.267.7.clone.1, %multiply.418.3.clone.1
  %151 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg52155, i64 0, i64 %9, i64 %10
  %152 = load double, ptr addrspace(1) %151, align 8, !invariant.load !27
  %153 = fneg double %add.273.5.clone.1
  %154 = fmul double %152, %153
  %155 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg32115, i64 0, i64 %9, i64 %10
  %156 = load double, ptr addrspace(1) %155, align 8, !invariant.load !27
  %multiply.422.9.clone.1.clone.1 = fmul double %156, %add.272.5.clone.1
  %add.281.7.clone.1.clone.1 = fadd double %multiply.422.9.clone.1.clone.1, %154
  %157 = trunc i8 %105 to i1
  %158 = select i1 %157, double %add.281.7.clone.1.clone.1, double 0.000000e+00
  %multiply.423.5.clone.1.clone.1 = fmul double %87, %158
  %159 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg31113, i64 0, i64 %9, i64 %10
  %160 = load double, ptr addrspace(1) %159, align 8, !invariant.load !27
  %multiply.424.3.clone.1.clone.1 = fmul double %160, %multiply.423.5.clone.1.clone.1
  %multiply.425.7.clone.1.clone.1 = fmul double %103, %multiply.424.3.clone.1.clone.1
  %add.284.5.clone.1.clone.1 = fadd double %101, %multiply.425.7.clone.1.clone.1
  %161 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg29109, i64 0, i64 %9, i64 %10
  %162 = load double, ptr addrspace(1) %161, align 8, !invariant.load !27
  %163 = getelementptr double, ptr addrspace(1) %arg28107, i64 %10
  %164 = load double, ptr addrspace(1) %163, align 8
  %165 = select i1 %15, double %164, double 0.000000e+00
  %add.285.3.clone.1.clone.1 = fadd double %52, %165
  %add.286.1.clone.1.clone.1 = fadd double %34, %add.285.3.clone.1.clone.1
  %multiply.426.3.clone.1.clone.1 = fmul double %162, %add.286.1.clone.1.clone.1
  %add.287.3.clone.1.clone.1 = fadd double %multiply.426.3.clone.1.clone.1, %add.284.5.clone.1.clone.1
  %add.288.1.clone.1.clone.1 = fadd double %99, %add.287.3.clone.1.clone.1
  %166 = select i1 %15, double 0.000000e+00, double %164
  %167 = getelementptr double, ptr addrspace(1) %arg46143, i64 %10
  %168 = load double, ptr addrspace(1) %167, align 8
  %add.280.3.clone.1 = fadd double %168, 0.000000e+00
  %169 = getelementptr double, ptr addrspace(1) %arg45141, i64 %10
  %170 = load double, ptr addrspace(1) %169, align 8, !invariant.load !27
  %add.282.1.clone.1 = fadd double %170, %multiply.424.3.clone.1.clone.1
  %add.283.1.clone.1 = fadd double %add.280.3.clone.1, %add.282.1.clone.1
  %171 = getelementptr double, ptr addrspace(1) %arg47145, i64 %10
  %172 = load double, ptr addrspace(1) %171, align 8
  %173 = select i1 %15, double 0.000000e+00, double %172
  %174 = getelementptr double, ptr addrspace(1) %arg51153, i64 %10
  %175 = load double, ptr addrspace(1) %174, align 8
  %176 = select i1 %15, double 0.000000e+00, double %175
  %177 = getelementptr double, ptr addrspace(1) %arg48147, i64 %10
  %178 = load double, ptr addrspace(1) %177, align 8, !invariant.load !27
  %179 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg50151, i64 0, i64 %9, i64 %10
  %180 = load double, ptr addrspace(1) %179, align 8, !invariant.load !27
  %181 = select i1 %15, double %172, double 0.000000e+00
  %add.274.3.clone.1 = fadd double %34, %181
  %182 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg49149, i64 0, i64 %9, i64 %10
  %183 = load double, ptr addrspace(1) %182, align 8, !invariant.load !27
  %184 = fneg double %add.274.3.clone.1
  %185 = fmul double %183, %184
  %186 = fmul double %154, %180
  %add.275.3.clone.1 = fsub double %185, %186
  %add.276.3.clone.1 = fadd double %178, %add.275.3.clone.1
  %add.277.1.clone.1 = fadd double %176, %add.276.3.clone.1
  %187 = select i1 %15, double 0.000000e+00, double %134
  %188 = getelementptr double, ptr addrspace(1) %arg67185, i64 %10
  %189 = load double, ptr addrspace(1) %188, align 8
  %add.309.3.clone.1 = fadd double %189, 0.000000e+00
  %190 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg66183, i64 0, i64 %9, i64 %10, i64 0
  %191 = load i8, ptr addrspace(1) %190, align 1, !invariant.load !27
  %192 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg65181, i64 0, i64 %9, i64 %10
  %193 = load double, ptr addrspace(1) %192, align 8, !invariant.load !27
  %multiply.441.11.clone.1 = fmul double %multiply.408.9.clone.1, %193
  %multiply.442.9.clone.1 = fmul double %multiply.441.11.clone.1, 5.000000e-01
  %194 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg64179, i64 0, i64 %9, i64 %10
  %195 = load double, ptr addrspace(1) %194, align 8, !invariant.load !27
  %multiply.443.7.clone.1 = fmul double %195, %multiply.442.9.clone.1
  %multiply.444.9.clone.1 = fmul double %multiply.411.9.clone.1, %193
  %add.310.7.clone.1 = fadd double %multiply.444.9.clone.1, %multiply.443.7.clone.1
  %multiply.445.9.clone.1 = fmul double %multiply.414.9.clone.1, %193
  %add.311.7.clone.1 = fadd double %multiply.445.9.clone.1, %add.310.7.clone.1
  %196 = trunc i8 %191 to i1
  %197 = select i1 %196, double %add.311.7.clone.1, double 0.000000e+00
  %198 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg63177, i64 0, i64 %9, i64 %10
  %199 = load double, ptr addrspace(1) %198, align 8, !invariant.load !27
  %multiply.446.7.clone.1 = fmul double %multiply.416.9.clone.1, %199
  %add.312.5.clone.1 = fadd double %multiply.446.7.clone.1, %197
  %200 = getelementptr double, ptr addrspace(1) %arg62175, i64 %10
  %201 = load double, ptr addrspace(1) %200, align 8, !invariant.load !27
  %add.313.3.clone.1 = fadd double %201, %add.312.5.clone.1
  %add.314.1.clone.1 = fadd double %add.309.3.clone.1, %add.313.3.clone.1
  %202 = select i1 %15, double 0.000000e+00, double %110
  %add.279.1.clone.1 = fadd double %34, %202
  %203 = getelementptr double, ptr addrspace(1) %arg69189, i64 %10
  %204 = load double, ptr addrspace(1) %203, align 8
  %205 = select i1 %15, double 0.000000e+00, double %204
  %add.278.1.clone.1 = fadd double %34, %205
  %206 = select i1 %15, double 0.000000e+00, double %107
  %207 = getelementptr double, ptr addrspace(1) %arg70191, i64 %10
  %208 = load double, ptr addrspace(1) %207, align 8
  %209 = select i1 %15, double 0.000000e+00, double %208
  store double %add.300.1, ptr addrspace(1) %13, align 8
  store double %add.308.1.clone.1, ptr addrspace(1) %79, align 8
  store double %96, ptr addrspace(1) %62, align 8
  store double %97, ptr addrspace(1) %71, align 8
  store double %98, ptr addrspace(1) %35, align 8
  store double %add.288.1.clone.1.clone.1, ptr addrspace(1) %50, align 8
  store double %166, ptr addrspace(1) %163, align 8
  store double %add.283.1.clone.1, ptr addrspace(1) %167, align 8
  store double %173, ptr addrspace(1) %171, align 8
  store double %add.277.1.clone.1, ptr addrspace(1) %174, align 8
  store double %187, ptr addrspace(1) %133, align 8
  store double %add.314.1.clone.1, ptr addrspace(1) %188, align 8
  store double %add.279.1.clone.1, ptr addrspace(1) %109, align 8
  store double %add.278.1.clone.1, ptr addrspace(1) %203, align 8
  store double %206, ptr addrspace(1) %106, align 8
  store double %209, ptr addrspace(1) %207, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_1(ptr noalias nocapture align 128 dereferenceable(8) %arg0) local_unnamed_addr #0 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128
  %1 = add i64 %0, 1
  store i64 %1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25}
!llvm.module.flags = !{!26}

!0 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!1 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!2 = !{ptr @loop_dynamic_slice_fusion, !"kernel", i32 1}
!3 = !{ptr @loop_dynamic_slice_fusion, !"reqntidx", i32 1}
!4 = !{ptr @loop_dynamic_slice_fusion_2, !"kernel", i32 1}
!5 = !{ptr @loop_dynamic_slice_fusion_2, !"reqntidx", i32 1}
!6 = !{ptr @loop_dynamic_slice_fusion_6, !"kernel", i32 1}
!7 = !{ptr @loop_dynamic_slice_fusion_6, !"reqntidx", i32 4}
!8 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!9 = !{ptr @loop_add_fusion, !"reqntidx", i32 4}
!10 = !{ptr @loop_dynamic_slice_fusion_5, !"kernel", i32 1}
!11 = !{ptr @loop_dynamic_slice_fusion_5, !"reqntidx", i32 4}
!12 = !{ptr @loop_broadcast_fusion_1, !"kernel", i32 1}
!13 = !{ptr @loop_broadcast_fusion_1, !"reqntidx", i32 4}
!14 = !{ptr @loop_broadcast_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_broadcast_fusion, !"reqntidx", i32 4}
!16 = !{ptr @loop_multiply_negate_fusion, !"kernel", i32 1}
!17 = !{ptr @loop_multiply_negate_fusion, !"reqntidx", i32 4}
!18 = !{ptr @loop_broadcast_multiply_select_fusion, !"kernel", i32 1}
!19 = !{ptr @loop_broadcast_multiply_select_fusion, !"reqntidx", i32 4}
!20 = !{ptr @loop_add_select_fusion, !"kernel", i32 1}
!21 = !{ptr @loop_add_select_fusion, !"reqntidx", i32 4}
!22 = !{ptr @loop_add_select_fusion_1, !"kernel", i32 1}
!23 = !{ptr @loop_add_select_fusion_1, !"reqntidx", i32 4}
!24 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!25 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!26 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!27 = !{}
!28 = !{i32 0, i32 4}
