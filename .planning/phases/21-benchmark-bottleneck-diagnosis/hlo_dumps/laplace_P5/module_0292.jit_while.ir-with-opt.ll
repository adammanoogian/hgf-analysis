; ModuleID = 'jit_while'
source_filename = "jit_while"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2738_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_2459_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_2497_0 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_2458_0 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_2480_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@shared_cache = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [1 x [2 x double]] undef
@buffer_for_constant_3009_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_3113_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_23853_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@shared_cache3 = private unnamed_addr addrspace(3) global [32 x [33 x double]] undef

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_and_fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %compare.2763.1 = fcmp ogt double %0, 1.000000e-05
  %1 = load i64, ptr addrspace(1) %arg01, align 16, !invariant.load !339
  %2 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %3 = add i64 %2, %1
  %4 = icmp slt i64 %3, 199
  %5 = and i1 %compare.2763.1, %4
  %6 = zext i1 %5 to i8
  store i8 %6, ptr addrspace(1) %arg37, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_30(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg2) local_unnamed_addr #0 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !340
  %1 = load i64, ptr addrspace(1) %arg07, align 16, !invariant.load !339
  %2 = load i64, ptr addrspace(1) %arg19, align 128, !invariant.load !339
  %3 = add i64 %2, %1
  %4 = srem i64 %3, 10
  %5 = add nsw i64 %4, 10
  %.not5 = icmp slt i64 %4, 0
  %6 = select i1 %.not5, i64 %5, i64 %4
  %7 = zext nneg i32 %0 to i64
  %8 = add nsw i64 %6, %7
  %.lhs.trunc = trunc nsw i64 %8 to i8
  %9 = srem i8 %.lhs.trunc, 10
  %.sext = sext i8 %9 to i64
  %10 = add nsw i64 %.sext, 10
  %.not6 = icmp slt i8 %9, 0
  %11 = select i1 %.not6, i64 %10, i64 %.sext
  %12 = getelementptr i64, ptr addrspace(1) %arg211, i64 %7
  store i64 %11, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %multiply.11854.1 = fneg double %3
  %4 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  store double %multiply.11854.1, ptr addrspace(1) %4, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_53(ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !340
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %1 = icmp slt i64 %0, 10
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(80) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg19) local_unnamed_addr #3 {
entry:
  %arg19193 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18191 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17189 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16187 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15185 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14183 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13181 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12179 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11177 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10175 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9173 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8171 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7169 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6167 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5165 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4163 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3161 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2159 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1157 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0155 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true100, %thread_in_bounds-after88
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result5.0 = phi double [ %add.9442.i151, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result8.0 = phi double [ %add.9442.i152, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result2.0 = phi double [ %add.9442.i150, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result11.0 = phi double [ %add.9442.i153, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result.0 = phi double [ %add.9442.i149, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result14.0 = phi double [ %add.9442.i154, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i138 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i139 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i139 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i140 = fadd double %add.9442.i139, %33
  br i1 %17, label %reduction_write_output-true56, label %thread_in_bounds-after55

thread_in_bounds-after55:                         ; preds = %reduction_write_output-true56, %thread_in_bounds-after
  %34 = icmp eq i32 %thread.id.x, 0
  %35 = bitcast double %partial_reduction_result5.0 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 2, i32 31)
  %38 = insertelement <2 x i32> poison, i32 %37, i64 0
  %39 = extractelement <2 x i32> %35, i64 1
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 2, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to double
  %add.9442.i141 = fadd double %partial_reduction_result5.0, %42
  %43 = bitcast double %add.9442.i141 to <2 x i32>
  %44 = extractelement <2 x i32> %43, i64 0
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 1, i32 31)
  %46 = extractelement <2 x i32> %43, i64 1
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 1, i32 31)
  %48 = insertelement <2 x i32> poison, i32 %45, i64 0
  %49 = insertelement <2 x i32> %48, i32 %47, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.9442.i142 = fadd double %add.9442.i141, %50
  br i1 %34, label %reduction_write_output-true67, label %thread_in_bounds-after66

thread_in_bounds-after66:                         ; preds = %reduction_write_output-true67, %thread_in_bounds-after55
  %51 = icmp eq i32 %thread.id.x, 0
  %52 = bitcast double %partial_reduction_result8.0 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 2, i32 31)
  %55 = insertelement <2 x i32> poison, i32 %54, i64 0
  %56 = extractelement <2 x i32> %52, i64 1
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 2, i32 31)
  %58 = insertelement <2 x i32> %55, i32 %57, i64 1
  %59 = bitcast <2 x i32> %58 to double
  %add.9442.i143 = fadd double %partial_reduction_result8.0, %59
  %60 = bitcast double %add.9442.i143 to <2 x i32>
  %61 = extractelement <2 x i32> %60, i64 0
  %62 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 1, i32 31)
  %63 = extractelement <2 x i32> %60, i64 1
  %64 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %63, i32 1, i32 31)
  %65 = insertelement <2 x i32> poison, i32 %62, i64 0
  %66 = insertelement <2 x i32> %65, i32 %64, i64 1
  %67 = bitcast <2 x i32> %66 to double
  %add.9442.i144 = fadd double %add.9442.i143, %67
  br i1 %51, label %reduction_write_output-true78, label %thread_in_bounds-after77

thread_in_bounds-after77:                         ; preds = %reduction_write_output-true78, %thread_in_bounds-after66
  %68 = icmp eq i32 %thread.id.x, 0
  %69 = bitcast double %partial_reduction_result11.0 to <2 x i32>
  %70 = extractelement <2 x i32> %69, i64 0
  %71 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %70, i32 2, i32 31)
  %72 = insertelement <2 x i32> poison, i32 %71, i64 0
  %73 = extractelement <2 x i32> %69, i64 1
  %74 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %73, i32 2, i32 31)
  %75 = insertelement <2 x i32> %72, i32 %74, i64 1
  %76 = bitcast <2 x i32> %75 to double
  %add.9442.i145 = fadd double %partial_reduction_result11.0, %76
  %77 = bitcast double %add.9442.i145 to <2 x i32>
  %78 = extractelement <2 x i32> %77, i64 0
  %79 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %78, i32 1, i32 31)
  %80 = extractelement <2 x i32> %77, i64 1
  %81 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %80, i32 1, i32 31)
  %82 = insertelement <2 x i32> poison, i32 %79, i64 0
  %83 = insertelement <2 x i32> %82, i32 %81, i64 1
  %84 = bitcast <2 x i32> %83 to double
  %add.9442.i146 = fadd double %add.9442.i145, %84
  br i1 %68, label %reduction_write_output-true89, label %thread_in_bounds-after88

thread_in_bounds-after88:                         ; preds = %reduction_write_output-true89, %thread_in_bounds-after77
  %85 = icmp eq i32 %thread.id.x, 0
  %86 = bitcast double %partial_reduction_result14.0 to <2 x i32>
  %87 = extractelement <2 x i32> %86, i64 0
  %88 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %87, i32 2, i32 31)
  %89 = insertelement <2 x i32> poison, i32 %88, i64 0
  %90 = extractelement <2 x i32> %86, i64 1
  %91 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %90, i32 2, i32 31)
  %92 = insertelement <2 x i32> %89, i32 %91, i64 1
  %93 = bitcast <2 x i32> %92 to double
  %add.9442.i147 = fadd double %partial_reduction_result14.0, %93
  %94 = bitcast double %add.9442.i147 to <2 x i32>
  %95 = extractelement <2 x i32> %94, i64 0
  %96 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %95, i32 1, i32 31)
  %97 = extractelement <2 x i32> %94, i64 1
  %98 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %97, i32 1, i32 31)
  %99 = insertelement <2 x i32> poison, i32 %96, i64 0
  %100 = insertelement <2 x i32> %99, i32 %98, i64 1
  %101 = bitcast <2 x i32> %100 to double
  %add.9442.i148 = fadd double %add.9442.i147, %101
  br i1 %85, label %reduction_write_output-true100, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %param_3.127 = load i64, ptr addrspace(1) %arg3161, align 128, !invariant.load !339
  %102 = sub i64 9, %param_3.127
  %103 = icmp slt i64 %102, 0
  %104 = sub i64 19, %param_3.127
  %105 = select i1 %103, i64 %104, i64 %102
  %106 = trunc i64 %105 to i32
  %107 = tail call i32 @llvm.smax.i32(i32 %106, i32 0)
  %108 = tail call i32 @llvm.umin.i32(i32 %107, i32 9)
  %109 = zext nneg i32 %108 to i64
  %param_2.109 = getelementptr inbounds [10 x i64], ptr addrspace(1) %arg2159, i64 0, i64 %109
  %param_2.10918 = load i64, ptr addrspace(1) %param_2.109, align 8, !invariant.load !339
  %110 = icmp slt i64 %param_2.10918, 0
  %111 = add i64 %param_2.10918, 10
  %112 = select i1 %110, i64 %111, i64 %param_2.10918
  %113 = trunc i64 %112 to i32
  %114 = tail call i32 @llvm.smax.i32(i32 %113, i32 0)
  %115 = tail call i32 @llvm.umin.i32(i32 %114, i32 9)
  %116 = zext nneg i32 %115 to i64
  %117 = zext nneg i32 %thread.id.x to i64
  %param_1.118 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg1157, i64 0, i64 %116, i64 %117
  %param_1.11821 = load double, ptr addrspace(1) %param_1.118, align 8, !invariant.load !339
  %param_0.88 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg0155, i64 0, i64 %117
  %param_0.8822 = load double, ptr addrspace(1) %param_0.88, align 8, !invariant.load !339
  %multiply.11257.3 = fmul double %param_1.11821, %param_0.8822
  %add.9442.i149 = fadd double %multiply.11257.3, 0.000000e+00
  %param_5.3810 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg5165, i64 0, i64 %116, i64 %117
  %param_5.381024 = load double, ptr addrspace(1) %param_5.3810, align 8, !invariant.load !339
  %param_4.4758 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4163, i64 0, i64 %117
  %param_4.475825 = load double, ptr addrspace(1) %param_4.4758, align 8, !invariant.load !339
  %multiply.11258.3.clone.1 = fmul double %param_5.381024, %param_4.475825
  %add.9442.i150 = fadd double %multiply.11258.3.clone.1, 0.000000e+00
  %param_7.2465 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg7169, i64 0, i64 %116, i64 %117
  %param_7.246528 = load double, ptr addrspace(1) %param_7.2465, align 8, !invariant.load !339
  %param_6.3161 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg6167, i64 0, i64 %117
  %param_6.316129 = load double, ptr addrspace(1) %param_6.3161, align 8, !invariant.load !339
  %multiply.11253.3.clone.1 = fmul double %param_7.246528, %param_6.316129
  %add.9442.i151 = fadd double %multiply.11253.3.clone.1, 0.000000e+00
  %param_9.1690 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg9173, i64 0, i64 %116, i64 %117
  %param_9.169032 = load double, ptr addrspace(1) %param_9.1690, align 8, !invariant.load !339
  %param_8.1973 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg8171, i64 0, i64 %117
  %param_8.197333 = load double, ptr addrspace(1) %param_8.1973, align 8, !invariant.load !339
  %multiply.11254.3.clone.1 = fmul double %param_9.169032, %param_8.197333
  %add.9442.i152 = fadd double %multiply.11254.3.clone.1, 0.000000e+00
  %param_11.1260 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg11177, i64 0, i64 %116, i64 %117
  %param_11.126036 = load double, ptr addrspace(1) %param_11.1260, align 8, !invariant.load !339
  %param_10.1470 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg10175, i64 0, i64 %117
  %param_10.147037 = load double, ptr addrspace(1) %param_10.1470, align 8, !invariant.load !339
  %multiply.11255.3.clone.1 = fmul double %param_11.126036, %param_10.147037
  %add.9442.i153 = fadd double %multiply.11255.3.clone.1, 0.000000e+00
  %param_13.941 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg13181, i64 0, i64 %116, i64 %117
  %param_13.94140 = load double, ptr addrspace(1) %param_13.941, align 8, !invariant.load !339
  %param_12.986 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg12179, i64 0, i64 %117
  %param_12.98641 = load double, ptr addrspace(1) %param_12.986, align 8, !invariant.load !339
  %multiply.11256.3.clone.1 = fmul double %param_13.94140, %param_12.98641
  %add.9442.i154 = fadd double %multiply.11256.3.clone.1, 0.000000e+00
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i138, ptr addrspace(1) %arg14183, align 128
  br label %thread_in_bounds-after

reduction_write_output-true56:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i140, ptr addrspace(1) %arg15185, align 128
  br label %thread_in_bounds-after55

reduction_write_output-true67:                    ; preds = %thread_in_bounds-after55
  store double %add.9442.i142, ptr addrspace(1) %arg16187, align 128
  br label %thread_in_bounds-after66

reduction_write_output-true78:                    ; preds = %thread_in_bounds-after66
  store double %add.9442.i144, ptr addrspace(1) %arg17189, align 128
  br label %thread_in_bounds-after77

reduction_write_output-true89:                    ; preds = %thread_in_bounds-after77
  store double %add.9442.i146, ptr addrspace(1) %arg18191, align 128
  br label %thread_in_bounds-after88

reduction_write_output-true100:                   ; preds = %thread_in_bounds-after88
  store double %add.9442.i148, ptr addrspace(1) %arg19193, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion(ptr noalias nocapture writeonly align 128 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(80) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(80) %arg9) local_unnamed_addr #0 {
entry:
  %arg928 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg826 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.124 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !339
  %0 = sub i64 9, %param_1.124
  %1 = icmp slt i64 %0, 0
  %2 = sub i64 19, %param_1.124
  %3 = select i1 %1, i64 %2, i64 %0
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 9)
  %param_9.76 = getelementptr inbounds [10 x i64], ptr addrspace(1) %arg928, i64 0, i64 %5
  %param_9.767 = load i64, ptr addrspace(1) %param_9.76, align 8, !invariant.load !339
  %6 = icmp slt i64 %param_9.767, 0
  %7 = add i64 %param_9.767, 10
  %8 = select i1 %6, i64 %7, i64 %param_9.767
  %9 = tail call i64 @llvm.smax.i64(i64 %8, i64 0)
  %10 = tail call i64 @llvm.umin.i64(i64 %9, i64 9)
  %param_8.97 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg826, i64 0, i64 %10
  %param_8.979 = load double, ptr addrspace(1) %param_8.97, align 8, !invariant.load !339
  %param_6.161 = load double, ptr addrspace(1) %arg622, align 128, !invariant.load !339
  %param_7.109 = load double, ptr addrspace(1) %arg724, align 128, !invariant.load !339
  %add.9445.3 = fadd double %param_6.161, %param_7.109
  %param_5.109 = load double, ptr addrspace(1) %arg520, align 128, !invariant.load !339
  %add.9446.3 = fadd double %add.9445.3, %param_5.109
  %param_4.116 = load double, ptr addrspace(1) %arg418, align 128, !invariant.load !339
  %add.9447.3 = fadd double %add.9446.3, %param_4.116
  %param_3.119 = load double, ptr addrspace(1) %arg316, align 128, !invariant.load !339
  %add.9448.3 = fadd double %add.9447.3, %param_3.119
  %param_2.115 = load double, ptr addrspace(1) %arg214, align 128, !invariant.load !339
  %add.9449.3 = fadd double %add.9448.3, %param_2.115
  %multiply.11259.3 = fmul double %param_8.979, %add.9449.3
  %11 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg010, i64 0, i64 %5
  store double %multiply.11259.3, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(80) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(80) %arg10, ptr noalias nocapture align 128 dereferenceable(32) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg12, ptr noalias nocapture align 128 dereferenceable(32) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg14, ptr noalias nocapture align 128 dereferenceable(32) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg16, ptr noalias nocapture align 128 dereferenceable(32) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg18, ptr noalias nocapture align 128 dereferenceable(32) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg20) local_unnamed_addr #0 {
entry:
  %arg2048 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1946 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1844 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1742 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1640 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1538 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1436 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1334 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1232 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1130 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1028 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg926 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg824 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg722 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg08, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load i64, ptr addrspace(1) %arg314, align 128, !invariant.load !339
  %5 = sub i64 9, %4
  %6 = icmp slt i64 %5, 0
  %7 = sub i64 19, %4
  %8 = select i1 %6, i64 %7, i64 %5
  %9 = trunc i64 %8 to i32
  %10 = tail call i32 @llvm.smax.i32(i32 %9, i32 0)
  %11 = tail call i32 @llvm.umin.i32(i32 %10, i32 9)
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds [10 x i64], ptr addrspace(1) %arg212, i64 0, i64 %12
  %14 = load i64, ptr addrspace(1) %13, align 8, !invariant.load !339
  %15 = icmp slt i64 %14, 0
  %16 = add i64 %14, 10
  %17 = select i1 %15, i64 %16, i64 %14
  %18 = trunc i64 %17 to i32
  %19 = tail call i32 @llvm.smax.i32(i32 %18, i32 0)
  %20 = tail call i32 @llvm.umin.i32(i32 %19, i32 9)
  %21 = zext nneg i32 %20 to i64
  %22 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg1028, i64 0, i64 %21
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !339
  %24 = load double, ptr addrspace(1) %arg824, align 128, !invariant.load !339
  %25 = load double, ptr addrspace(1) %arg926, align 128, !invariant.load !339
  %add.9445.15 = fadd double %24, %25
  %26 = load double, ptr addrspace(1) %arg722, align 128, !invariant.load !339
  %add.9446.15 = fadd double %add.9445.15, %26
  %27 = load double, ptr addrspace(1) %arg620, align 128, !invariant.load !339
  %add.9447.15 = fadd double %add.9446.15, %27
  %28 = load double, ptr addrspace(1) %arg518, align 128, !invariant.load !339
  %add.9448.15 = fadd double %add.9447.15, %28
  %29 = load double, ptr addrspace(1) %arg416, align 128, !invariant.load !339
  %add.9449.15 = fadd double %add.9448.15, %29
  %30 = fneg double %23
  %31 = fmul double %add.9449.15, %30
  %32 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg110, i64 0, i64 %21, i64 %1
  %33 = load double, ptr addrspace(1) %32, align 8, !invariant.load !339
  %multiply.11263.1 = fmul double %33, %31
  %add.9453.1 = fadd double %3, %multiply.11263.1
  %34 = getelementptr double, ptr addrspace(1) %arg1130, i64 %1
  %35 = load double, ptr addrspace(1) %34, align 8
  %36 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg1232, i64 0, i64 %21, i64 %1
  %37 = load double, ptr addrspace(1) %36, align 8, !invariant.load !339
  %multiply.11264.1.clone.1 = fmul double %31, %37
  %add.9454.1.clone.1 = fadd double %35, %multiply.11264.1.clone.1
  %38 = getelementptr double, ptr addrspace(1) %arg1334, i64 %1
  %39 = load double, ptr addrspace(1) %38, align 8
  %40 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg1436, i64 0, i64 %21, i64 %1
  %41 = load double, ptr addrspace(1) %40, align 8, !invariant.load !339
  %multiply.11265.1.clone.1 = fmul double %31, %41
  %add.9455.1.clone.1 = fadd double %39, %multiply.11265.1.clone.1
  %42 = getelementptr double, ptr addrspace(1) %arg1538, i64 %1
  %43 = load double, ptr addrspace(1) %42, align 8
  %44 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg1640, i64 0, i64 %21, i64 %1
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !339
  %multiply.11261.1.clone.1 = fmul double %31, %45
  %add.9451.1.clone.1 = fadd double %43, %multiply.11261.1.clone.1
  %46 = getelementptr double, ptr addrspace(1) %arg1742, i64 %1
  %47 = load double, ptr addrspace(1) %46, align 8
  %48 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg1844, i64 0, i64 %21, i64 %1
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !339
  %multiply.11260.1.clone.1 = fmul double %31, %49
  %add.9450.1.clone.1 = fadd double %47, %multiply.11260.1.clone.1
  %50 = getelementptr double, ptr addrspace(1) %arg1946, i64 %1
  %51 = load double, ptr addrspace(1) %50, align 8
  %52 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg2048, i64 0, i64 %21, i64 %1
  %53 = load double, ptr addrspace(1) %52, align 8, !invariant.load !339
  %multiply.11262.1.clone.1 = fmul double %31, %53
  %add.9452.1.clone.1 = fadd double %51, %multiply.11262.1.clone.1
  store double %add.9453.1, ptr addrspace(1) %2, align 8
  store double %add.9454.1.clone.1, ptr addrspace(1) %34, align 8
  store double %add.9455.1.clone.1, ptr addrspace(1) %38, align 8
  store double %add.9451.1.clone.1, ptr addrspace(1) %42, align 8
  store double %add.9450.1.clone.1, ptr addrspace(1) %46, align 8
  store double %add.9452.1.clone.1, ptr addrspace(1) %50, align 8
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %multiply.11864.1 = fmul double %1, %4
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %2
  store double %multiply.11864.1, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(80) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg19) local_unnamed_addr #3 {
entry:
  %arg19195 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18193 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17191 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16189 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15187 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14185 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13183 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12181 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11179 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10177 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9175 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8173 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7171 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6169 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5167 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4165 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3163 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2161 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1159 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0157 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true102, %thread_in_bounds-after90
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result5.0 = phi double [ %add.9442.i153, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result8.0 = phi double [ %add.9442.i154, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result2.0 = phi double [ %add.9442.i152, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result11.0 = phi double [ %add.9442.i155, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result.0 = phi double [ %add.9442.i151, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result14.0 = phi double [ %add.9442.i156, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i140 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i141 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i141 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i142 = fadd double %add.9442.i141, %33
  br i1 %17, label %reduction_write_output-true58, label %thread_in_bounds-after57

thread_in_bounds-after57:                         ; preds = %reduction_write_output-true58, %thread_in_bounds-after
  %34 = icmp eq i32 %thread.id.x, 0
  %35 = bitcast double %partial_reduction_result5.0 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 2, i32 31)
  %38 = insertelement <2 x i32> poison, i32 %37, i64 0
  %39 = extractelement <2 x i32> %35, i64 1
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 2, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to double
  %add.9442.i143 = fadd double %partial_reduction_result5.0, %42
  %43 = bitcast double %add.9442.i143 to <2 x i32>
  %44 = extractelement <2 x i32> %43, i64 0
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 1, i32 31)
  %46 = extractelement <2 x i32> %43, i64 1
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 1, i32 31)
  %48 = insertelement <2 x i32> poison, i32 %45, i64 0
  %49 = insertelement <2 x i32> %48, i32 %47, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.9442.i144 = fadd double %add.9442.i143, %50
  br i1 %34, label %reduction_write_output-true69, label %thread_in_bounds-after68

thread_in_bounds-after68:                         ; preds = %reduction_write_output-true69, %thread_in_bounds-after57
  %51 = icmp eq i32 %thread.id.x, 0
  %52 = bitcast double %partial_reduction_result8.0 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 2, i32 31)
  %55 = insertelement <2 x i32> poison, i32 %54, i64 0
  %56 = extractelement <2 x i32> %52, i64 1
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 2, i32 31)
  %58 = insertelement <2 x i32> %55, i32 %57, i64 1
  %59 = bitcast <2 x i32> %58 to double
  %add.9442.i145 = fadd double %partial_reduction_result8.0, %59
  %60 = bitcast double %add.9442.i145 to <2 x i32>
  %61 = extractelement <2 x i32> %60, i64 0
  %62 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 1, i32 31)
  %63 = extractelement <2 x i32> %60, i64 1
  %64 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %63, i32 1, i32 31)
  %65 = insertelement <2 x i32> poison, i32 %62, i64 0
  %66 = insertelement <2 x i32> %65, i32 %64, i64 1
  %67 = bitcast <2 x i32> %66 to double
  %add.9442.i146 = fadd double %add.9442.i145, %67
  br i1 %51, label %reduction_write_output-true80, label %thread_in_bounds-after79

thread_in_bounds-after79:                         ; preds = %reduction_write_output-true80, %thread_in_bounds-after68
  %68 = icmp eq i32 %thread.id.x, 0
  %69 = bitcast double %partial_reduction_result11.0 to <2 x i32>
  %70 = extractelement <2 x i32> %69, i64 0
  %71 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %70, i32 2, i32 31)
  %72 = insertelement <2 x i32> poison, i32 %71, i64 0
  %73 = extractelement <2 x i32> %69, i64 1
  %74 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %73, i32 2, i32 31)
  %75 = insertelement <2 x i32> %72, i32 %74, i64 1
  %76 = bitcast <2 x i32> %75 to double
  %add.9442.i147 = fadd double %partial_reduction_result11.0, %76
  %77 = bitcast double %add.9442.i147 to <2 x i32>
  %78 = extractelement <2 x i32> %77, i64 0
  %79 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %78, i32 1, i32 31)
  %80 = extractelement <2 x i32> %77, i64 1
  %81 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %80, i32 1, i32 31)
  %82 = insertelement <2 x i32> poison, i32 %79, i64 0
  %83 = insertelement <2 x i32> %82, i32 %81, i64 1
  %84 = bitcast <2 x i32> %83 to double
  %add.9442.i148 = fadd double %add.9442.i147, %84
  br i1 %68, label %reduction_write_output-true91, label %thread_in_bounds-after90

thread_in_bounds-after90:                         ; preds = %reduction_write_output-true91, %thread_in_bounds-after79
  %85 = icmp eq i32 %thread.id.x, 0
  %86 = bitcast double %partial_reduction_result14.0 to <2 x i32>
  %87 = extractelement <2 x i32> %86, i64 0
  %88 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %87, i32 2, i32 31)
  %89 = insertelement <2 x i32> poison, i32 %88, i64 0
  %90 = extractelement <2 x i32> %86, i64 1
  %91 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %90, i32 2, i32 31)
  %92 = insertelement <2 x i32> %89, i32 %91, i64 1
  %93 = bitcast <2 x i32> %92 to double
  %add.9442.i149 = fadd double %partial_reduction_result14.0, %93
  %94 = bitcast double %add.9442.i149 to <2 x i32>
  %95 = extractelement <2 x i32> %94, i64 0
  %96 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %95, i32 1, i32 31)
  %97 = extractelement <2 x i32> %94, i64 1
  %98 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %97, i32 1, i32 31)
  %99 = insertelement <2 x i32> poison, i32 %96, i64 0
  %100 = insertelement <2 x i32> %99, i32 %98, i64 1
  %101 = bitcast <2 x i32> %100 to double
  %add.9442.i150 = fadd double %add.9442.i149, %101
  br i1 %85, label %reduction_write_output-true102, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %param_3.211 = load i64, ptr addrspace(1) %arg3163, align 128, !invariant.load !339
  %102 = icmp slt i64 %param_3.211, 0
  %103 = add i64 %param_3.211, 10
  %104 = select i1 %102, i64 %103, i64 %param_3.211
  %105 = trunc i64 %104 to i32
  %106 = tail call i32 @llvm.smax.i32(i32 %105, i32 0)
  %107 = tail call i32 @llvm.umin.i32(i32 %106, i32 9)
  %108 = zext nneg i32 %107 to i64
  %param_2.199 = getelementptr inbounds [10 x i64], ptr addrspace(1) %arg2161, i64 0, i64 %108
  %param_2.19919 = load i64, ptr addrspace(1) %param_2.199, align 8, !invariant.load !339
  %109 = icmp slt i64 %param_2.19919, 0
  %110 = add i64 %param_2.19919, 10
  %111 = select i1 %109, i64 %110, i64 %param_2.19919
  %112 = trunc i64 %111 to i32
  %113 = tail call i32 @llvm.smax.i32(i32 %112, i32 0)
  %114 = tail call i32 @llvm.umin.i32(i32 %113, i32 9)
  %115 = zext nneg i32 %114 to i64
  %116 = zext nneg i32 %thread.id.x to i64
  %param_1.238 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg1159, i64 0, i64 %115, i64 %116
  %param_1.23823 = load double, ptr addrspace(1) %param_1.238, align 8, !invariant.load !339
  %param_0.178 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg0157, i64 0, i64 %116
  %param_0.17824 = load double, ptr addrspace(1) %param_0.178, align 8, !invariant.load !339
  %multiply.11270.3 = fmul double %param_1.23823, %param_0.17824
  %add.9442.i151 = fadd double %multiply.11270.3, 0.000000e+00
  %param_5.3814 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg5167, i64 0, i64 %115, i64 %116
  %param_5.381426 = load double, ptr addrspace(1) %param_5.3814, align 8, !invariant.load !339
  %param_4.4761 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4165, i64 0, i64 %116
  %param_4.476127 = load double, ptr addrspace(1) %param_4.4761, align 8, !invariant.load !339
  %multiply.11269.3.clone.1 = fmul double %param_5.381426, %param_4.476127
  %add.9442.i152 = fadd double %multiply.11269.3.clone.1, 0.000000e+00
  %param_7.2474 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg7171, i64 0, i64 %115, i64 %116
  %param_7.247430 = load double, ptr addrspace(1) %param_7.2474, align 8, !invariant.load !339
  %param_6.3166 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg6169, i64 0, i64 %116
  %param_6.316631 = load double, ptr addrspace(1) %param_6.3166, align 8, !invariant.load !339
  %multiply.11271.3.clone.1 = fmul double %param_7.247430, %param_6.316631
  %add.9442.i153 = fadd double %multiply.11271.3.clone.1, 0.000000e+00
  %param_9.1702 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg9175, i64 0, i64 %115, i64 %116
  %param_9.170234 = load double, ptr addrspace(1) %param_9.1702, align 8, !invariant.load !339
  %param_8.1984 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg8173, i64 0, i64 %116
  %param_8.198435 = load double, ptr addrspace(1) %param_8.1984, align 8, !invariant.load !339
  %multiply.11266.3.clone.1 = fmul double %param_9.170234, %param_8.198435
  %add.9442.i154 = fadd double %multiply.11266.3.clone.1, 0.000000e+00
  %param_11.1272 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg11179, i64 0, i64 %115, i64 %116
  %param_11.127238 = load double, ptr addrspace(1) %param_11.1272, align 8, !invariant.load !339
  %param_10.1481 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg10177, i64 0, i64 %116
  %param_10.148139 = load double, ptr addrspace(1) %param_10.1481, align 8, !invariant.load !339
  %multiply.11267.3.clone.1 = fmul double %param_11.127238, %param_10.148139
  %add.9442.i155 = fadd double %multiply.11267.3.clone.1, 0.000000e+00
  %param_13.957 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg13183, i64 0, i64 %115, i64 %116
  %param_13.95742 = load double, ptr addrspace(1) %param_13.957, align 8, !invariant.load !339
  %param_12.998 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg12181, i64 0, i64 %116
  %param_12.99843 = load double, ptr addrspace(1) %param_12.998, align 8, !invariant.load !339
  %multiply.11268.3.clone.1 = fmul double %param_13.95742, %param_12.99843
  %add.9442.i156 = fadd double %multiply.11268.3.clone.1, 0.000000e+00
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i140, ptr addrspace(1) %arg14185, align 128
  br label %thread_in_bounds-after

reduction_write_output-true58:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i142, ptr addrspace(1) %arg15187, align 128
  br label %thread_in_bounds-after57

reduction_write_output-true69:                    ; preds = %thread_in_bounds-after57
  store double %add.9442.i144, ptr addrspace(1) %arg16189, align 128
  br label %thread_in_bounds-after68

reduction_write_output-true80:                    ; preds = %thread_in_bounds-after68
  store double %add.9442.i146, ptr addrspace(1) %arg17191, align 128
  br label %thread_in_bounds-after79

reduction_write_output-true91:                    ; preds = %thread_in_bounds-after79
  store double %add.9442.i148, ptr addrspace(1) %arg18193, align 128
  br label %thread_in_bounds-after90

reduction_write_output-true102:                   ; preds = %thread_in_bounds-after90
  store double %add.9442.i150, ptr addrspace(1) %arg19195, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_2(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(80) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(80) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(80) %arg11, ptr noalias nocapture align 128 dereferenceable(32) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg13, ptr noalias nocapture align 128 dereferenceable(32) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg15, ptr noalias nocapture align 128 dereferenceable(32) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg17, ptr noalias nocapture align 128 dereferenceable(32) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg19, ptr noalias nocapture align 128 dereferenceable(32) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg21) local_unnamed_addr #0 {
entry:
  %arg2151 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2049 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1947 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1845 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1743 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1641 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1539 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1437 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1335 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1233 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1131 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1029 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg927 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg825 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg723 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg09, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load i64, ptr addrspace(1) %arg315, align 128, !invariant.load !339
  %5 = icmp slt i64 %4, 0
  %6 = add i64 %4, 10
  %7 = select i1 %5, i64 %6, i64 %4
  %8 = trunc i64 %7 to i32
  %9 = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = tail call i32 @llvm.umin.i32(i32 %9, i32 9)
  %11 = zext nneg i32 %10 to i64
  %12 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg1131, i64 0, i64 %11
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !339
  %14 = getelementptr inbounds [10 x i64], ptr addrspace(1) %arg213, i64 0, i64 %11
  %15 = load i64, ptr addrspace(1) %14, align 8, !invariant.load !339
  %16 = icmp slt i64 %15, 0
  %17 = add i64 %15, 10
  %18 = select i1 %16, i64 %17, i64 %15
  %19 = trunc i64 %18 to i32
  %20 = tail call i32 @llvm.smax.i32(i32 %19, i32 0)
  %21 = tail call i32 @llvm.umin.i32(i32 %20, i32 9)
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg1029, i64 0, i64 %22
  %24 = load double, ptr addrspace(1) %23, align 8, !invariant.load !339
  %25 = load double, ptr addrspace(1) %arg825, align 128, !invariant.load !339
  %26 = load double, ptr addrspace(1) %arg927, align 128, !invariant.load !339
  %add.9459.15 = fadd double %25, %26
  %27 = load double, ptr addrspace(1) %arg723, align 128, !invariant.load !339
  %add.9460.15 = fadd double %add.9459.15, %27
  %28 = load double, ptr addrspace(1) %arg621, align 128, !invariant.load !339
  %add.9461.15 = fadd double %add.9460.15, %28
  %29 = load double, ptr addrspace(1) %arg519, align 128, !invariant.load !339
  %add.9462.15 = fadd double %add.9461.15, %29
  %30 = load double, ptr addrspace(1) %arg417, align 128, !invariant.load !339
  %add.9463.15 = fadd double %add.9462.15, %30
  %multiply.11272.15 = fmul double %24, %add.9463.15
  %subtract.815.15 = fsub double %13, %multiply.11272.15
  %31 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg111, i64 0, i64 %22, i64 %1
  %32 = load double, ptr addrspace(1) %31, align 8, !invariant.load !339
  %multiply.11278.1 = fmul double %32, %subtract.815.15
  %add.9469.1 = fadd double %3, %multiply.11278.1
  %33 = getelementptr double, ptr addrspace(1) %arg1233, i64 %1
  %34 = load double, ptr addrspace(1) %33, align 8
  %35 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg1335, i64 0, i64 %22, i64 %1
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !339
  %multiply.11274.1.clone.1 = fmul double %subtract.815.15, %36
  %add.9465.1.clone.1 = fadd double %34, %multiply.11274.1.clone.1
  %37 = getelementptr double, ptr addrspace(1) %arg1437, i64 %1
  %38 = load double, ptr addrspace(1) %37, align 8
  %39 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg1539, i64 0, i64 %22, i64 %1
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !339
  %multiply.11273.1.clone.1 = fmul double %subtract.815.15, %40
  %add.9464.1.clone.1 = fadd double %38, %multiply.11273.1.clone.1
  %41 = getelementptr double, ptr addrspace(1) %arg1641, i64 %1
  %42 = load double, ptr addrspace(1) %41, align 8
  %43 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg1743, i64 0, i64 %22, i64 %1
  %44 = load double, ptr addrspace(1) %43, align 8, !invariant.load !339
  %multiply.11275.1.clone.1 = fmul double %subtract.815.15, %44
  %add.9466.1.clone.1 = fadd double %42, %multiply.11275.1.clone.1
  %45 = getelementptr double, ptr addrspace(1) %arg1845, i64 %1
  %46 = load double, ptr addrspace(1) %45, align 8
  %47 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg1947, i64 0, i64 %22, i64 %1
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !339
  %multiply.11276.1.clone.1 = fmul double %subtract.815.15, %48
  %add.9467.1.clone.1 = fadd double %46, %multiply.11276.1.clone.1
  %49 = getelementptr double, ptr addrspace(1) %arg2049, i64 %1
  %50 = load double, ptr addrspace(1) %49, align 8
  %51 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg2151, i64 0, i64 %22, i64 %1
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !339
  %multiply.11277.1.clone.1 = fmul double %subtract.815.15, %52
  %add.9468.1.clone.1 = fadd double %50, %multiply.11277.1.clone.1
  store double %add.9469.1, ptr addrspace(1) %2, align 8
  store double %add.9465.1.clone.1, ptr addrspace(1) %33, align 8
  store double %add.9464.1.clone.1, ptr addrspace(1) %37, align 8
  store double %add.9466.1.clone.1, ptr addrspace(1) %41, align 8
  store double %add.9467.1.clone.1, ptr addrspace(1) %45, align 8
  store double %add.9468.1.clone.1, ptr addrspace(1) %49, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_minimum_fusion_1(ptr noalias nocapture align 128 dereferenceable(8) %arg0) local_unnamed_addr #0 {
entry:
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg02, align 128
  %compare.2738.1 = fcmp ole double %0, 0x3EB0C6F7A0B5ED8D
  %multiply.11853.1 = fmul double %0, 1.500000e+00
  %1 = select i1 %compare.2738.1, double 1.000000e+00, double %multiply.11853.1
  %2 = fcmp uno double %1, 0.000000e+00
  %3 = fcmp ole double %1, 1.000000e+00
  %4 = or i1 %2, %3
  %minimum.27.1 = select i1 %4, double %1, double 1.000000e+00
  store double %minimum.27.1, ptr addrspace(1) %arg02, align 128
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_add_reduce_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #3 {
entry:
  %arg655 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg553 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg451 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg349 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg247 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg145 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg043 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true24, %thread_in_bounds-after
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %35, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result2.0 = phi double [ %add.9442.i42, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i38 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i39 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i39 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i40 = fadd double %add.9442.i39, %33
  br i1 %17, label %reduction_write_output-true24, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %34 = zext nneg i32 %thread.id.x to i64
  %param_0.5631 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg043, i64 0, i64 %34
  %param_0.56315 = load double, ptr addrspace(1) %param_0.5631, align 8, !invariant.load !339
  %param_2.6496 = load double, ptr addrspace(1) %arg247, align 128, !invariant.load !339
  %param_1.7928 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg145, i64 0, i64 %34
  %param_1.79286 = load double, ptr addrspace(1) %param_1.7928, align 8, !invariant.load !339
  %multiply.11870.1 = fmul double %param_2.6496, %param_1.79286
  %add.10023.1 = fadd double %param_0.56315, %multiply.11870.1
  %add.10030.3.clone.1 = fadd double %add.10023.1, -1.000000e+00
  %multiply.11913.1.clone.1 = fmul double %add.10030.3.clone.1, %add.10030.3.clone.1
  %multiply.11914.5.clone.1 = fmul double %multiply.11913.1.clone.1, 4.000000e+00
  %add.10057.3.clone.1 = fadd double %multiply.11914.5.clone.1, 0x3FDCE6BB25AA1315
  %multiply.11915.3.clone.1 = fmul double %add.10057.3.clone.1, 5.000000e-01
  %35 = fsub double 0.000000e+00, %multiply.11915.3.clone.1
  %param_3.5771 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg349, i64 0, i64 %34
  %param_3.57717 = load double, ptr addrspace(1) %param_3.5771, align 8, !invariant.load !339
  %multiply.11896.1.clone.1 = fmul double %param_1.79286, %param_3.57717
  %add.9442.i42 = fadd double %multiply.11896.1.clone.1, 0.000000e+00
  %36 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg451, i64 0, i64 %34
  store double %add.10023.1, ptr addrspace(1) %36, align 8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i38, ptr addrspace(1) %arg553, align 128
  br label %thread_in_bounds-after

reduction_write_output-true24:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i40, ptr addrspace(1) %arg655, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_32(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !339
  %multiply.11868.1 = fmul double %4, %6
  %add.10021.1 = fadd double %3, %multiply.11868.1
  %7 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  store double %add.10021.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_54(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !343
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_55(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_61(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !343
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_59(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_60(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !343
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i8, ptr addrspace(1) %arg01, i64 %1
  store i8 0, ptr addrspace(1) %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_62(ptr noalias nocapture writeonly align 128 dereferenceable(3072) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !343
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_56(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !344
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_63(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !344
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i32, ptr addrspace(1) %arg01, i64 %1
  store i32 0, ptr addrspace(1) %2, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_51(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr i64, ptr addrspace(1) %arg01, i64 %1
  store i64 1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_58(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 1.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_64(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0x7FF8000000000000, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_compare_fusion_9(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %1 = icmp slt i64 %0, 192
  %2 = zext i1 %1 to i8
  store i8 %2, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_201(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #0 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.4261 = load i64, ptr addrspace(1) %arg415, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.73614 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.50125 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.61086 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %multiply.11820.9 = fmul double %param_3.50125, %param_2.61086
  %add.10002.7 = fadd double %param_1.73614, %multiply.11820.9
  %4 = tail call double @llvm.fma.f64(double %add.10002.7, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #11
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #11
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.10002.7)
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
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #11
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #11
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #11
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.7) #11
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #11
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.10002.7, 0.000000e+00
  %30 = fadd double %add.10002.7, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #11
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #11
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_4.4261, 0
  %43 = add i64 %param_4.4261, 192
  %44 = select i1 %42, i64 %43, i64 %param_4.4261
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %compare.2727.3 = fcmp ogt double %z.2.i, 1.000000e-128
  %47 = zext i1 %compare.2727.3 to i8
  %48 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg07, i64 0, i64 %46, i64 %thread_id_x
  store i8 %47, ptr addrspace(1) %48, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_171(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6054 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6054, 0
  %2 = add i64 %param_2.6054, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6054
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.73105 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = icmp ne i64 %param_1.73105, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_172(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6092 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6092, 0
  %2 = add i64 %param_2.6092, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6092
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.73474 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = icmp ne i64 %param_1.73474, 0
  %8 = zext i1 %7 to i8
  %9 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %8, ptr addrspace(1) %9, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_174(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6120 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6120, 0
  %2 = add i64 %param_2.6120, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6120
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.73674 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !339
  %.not = icmp eq i64 %param_1.73674, 0
  %7 = zext i1 %.not to i8
  %8 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i8 %7, ptr addrspace(1) %8, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_216(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.7368 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !339
  %0 = icmp slt i64 %param_1.7368, 0
  %1 = add i64 %param_1.7368, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.7368
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg04, i64 0, i64 %4
  store i32 1, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_208(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6109 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.73624 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = tail call double @llvm.fma.f64(double %param_1.73624, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #11
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #11
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_1.73624)
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
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #11
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #11
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #11
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.73624) #11
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #11
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_1.73624, 0.000000e+00
  %28 = fadd double %param_1.73624, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #11
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #11
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_2.6109, 0
  %41 = add i64 %param_2.6109, 192
  %42 = select i1 %40, i64 %41, i64 %param_2.6109
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %compare.2731.3 = fcmp ogt double %z.2.i, 1.000000e-128
  %45 = zext i1 %compare.2731.3 to i8
  %46 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg05, i64 0, i64 %44, i64 %thread_id_x
  store i8 %45, ptr addrspace(1) %46, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_215(ptr noalias nocapture writeonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_1.7370 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !339
  %0 = icmp slt i64 %param_1.7370, 0
  %1 = add i64 %param_1.7370, 192
  %2 = select i1 %0, i64 %1, i64 %param_1.7370
  %3 = tail call i64 @llvm.smax.i64(i64 %2, i64 0)
  %4 = tail call i64 @llvm.umin.i64(i64 %3, i64 191)
  %5 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg04, i64 0, i64 %4
  store double 1.000000e+00, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_175(ptr noalias nocapture writeonly align 128 dereferenceable(3072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6101 = load i64, ptr addrspace(1) %arg210, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6101, 0
  %2 = add i64 %param_2.6101, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6101
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.73564 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = icmp ne i64 %param_1.73564, 0
  %8 = zext i1 %7 to i32
  %9 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg06, i64 0, i64 %5, i64 %thread_id_x
  store i32 %8, ptr addrspace(1) %9, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_199(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5) local_unnamed_addr #0 {
entry:
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.7344 = load i64, ptr addrspace(1) %arg110, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg314, i64 %thread_id_x
  %param_3.50184 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg518, i64 %thread_id_x
  %param_5.33845 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg416, i64 %thread_id_x
  %param_4.42666 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %multiply.11820.17 = fmul double %param_5.33845, %param_4.42666
  %add.10002.15 = fadd double %param_3.50184, %multiply.11820.17
  %4 = tail call double @llvm.fma.f64(double %add.10002.15, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #11
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #11
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.10002.15)
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
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #11
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #11
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #11
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.15) #11
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #11
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.10002.15, 0.000000e+00
  %30 = fadd double %add.10002.15, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #11
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #11
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_1.7344, 0
  %43 = add i64 %param_1.7344, 192
  %44 = select i1 %42, i64 %43, i64 %param_1.7344
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %compare.2727.11 = fcmp ogt double %z.2.i, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.60897 = load double, ptr addrspace(1) %47, align 8, !invariant.load !339
  %48 = select i1 %compare.2727.11, double %z.2.i, double %param_2.60897
  %49 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg08, i64 0, i64 %46, i64 %thread_id_x
  store double %48, ptr addrspace(1) %49, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_198(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #0 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.7348 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg621, i64 %thread_id_x
  %param_6.28454 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.50175 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.33836 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %4 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.42657 = load double, ptr addrspace(1) %4, align 8, !invariant.load !339
  %multiply.11820.39 = fmul double %param_5.33836, %param_4.42657
  %add.10002.37 = fadd double %param_3.50175, %multiply.11820.39
  %5 = tail call double @llvm.fma.f64(double %add.10002.37, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #11
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #11
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.10002.37)
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
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #11
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #11
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #11
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.37) #11
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #11
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.10002.37, 0.000000e+00
  %31 = fadd double %add.10002.37, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #11
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #11
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %divide.2544.7 = fdiv double 1.000000e+00, %param_6.28454
  %43 = icmp slt i64 %param_1.7348, 0
  %44 = add i64 %param_1.7348, 192
  %45 = select i1 %43, i64 %44, i64 %param_1.7348
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.2727.33 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.60938 = load double, ptr addrspace(1) %48, align 8, !invariant.load !339
  %49 = select i1 %compare.2727.33, double %z.2.i, double %param_2.60938
  %add.10003.7 = fadd double %divide.2544.7, %49
  %multiply.11845.1 = fmul double %add.10003.7, %add.10003.7
  %divide.2557.1 = fdiv double 1.000000e+00, %multiply.11845.1
  %50 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg09, i64 0, i64 %47, i64 %thread_id_x
  store double %divide.2557.1, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_202(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #0 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.4248 = load i64, ptr addrspace(1) %arg415, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.73384 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.49965 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.60836 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %multiply.11820.7 = fmul double %param_3.49965, %param_2.60836
  %add.10002.5 = fadd double %param_1.73384, %multiply.11820.7
  %4 = tail call double @llvm.fma.f64(double %add.10002.5, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #11
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #11
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.10002.5)
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
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #11
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #11
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #11
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.5) #11
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #11
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.10002.5, 0.000000e+00
  %30 = fadd double %add.10002.5, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #11
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #11
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_4.4248, 0
  %43 = add i64 %param_4.4248, 192
  %44 = select i1 %42, i64 %43, i64 %param_4.4248
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %47 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %46, i64 %thread_id_x
  store double %z.2.i, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_167(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6119 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6119, 0
  %2 = add i64 %param_2.6119, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6119
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.73664 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %multiply.11837.5 = fmul double %param_1.73664, %param_1.73664
  %multiply.11838.3 = fmul double %multiply.11837.5, 5.000000e-01
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.11838.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_168(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6114 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6114, 0
  %2 = add i64 %param_2.6114, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6114
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.73354 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %multiply.11852.3 = fmul double %param_1.73354, 2.000000e+00
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.11852.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_213(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.7358 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_1.7358, 0
  %2 = add i64 %param_1.7358, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.7358
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg04, i64 0, i64 %5, i64 %thread_id_x
  store double 1.000000e+00, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_176(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6090 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6090, 0
  %2 = add i64 %param_2.6090, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6090
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr i64, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.73454 = load i64, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = sitofp i64 %param_1.73454 to double
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %7, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_182(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6091 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6091, 0
  %2 = add i64 %param_2.6091, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6091
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.73464 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.73464, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_192(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6088 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6088, 0
  %2 = add i64 %param_2.6088, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6088
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.73434 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %multiply.11821.2 = fmul double %param_1.73434, %param_1.73434
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.11821.2, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_214(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.7374 = load i64, ptr addrspace(1) %arg16, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_1.7374, 0
  %2 = add i64 %param_1.7374, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.7374
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg04, i64 0, i64 %5, i64 %thread_id_x
  store double 0.000000e+00, ptr addrspace(1) %6, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_204(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6077 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6077, 0
  %2 = add i64 %param_2.6077, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6077
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.73324 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %multiply.11844.1 = fmul double %param_1.73324, %param_1.73324
  %divide.2556.1 = fdiv double 1.000000e+00, %multiply.11844.1
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.2556.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_206(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #0 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.5009 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.61054 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = tail call double @llvm.fma.f64(double %param_2.61054, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #11
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #11
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_2.61054)
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
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #11
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #11
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #11
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.61054) #11
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #11
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_2.61054, 0.000000e+00
  %28 = fadd double %param_2.61054, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #11
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #11
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_3.5009, 0
  %41 = add i64 %param_3.5009, 192
  %42 = select i1 %40, i64 %41, i64 %param_3.5009
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %compare.2731.7 = fcmp ogt double %z.2.i, 1.000000e-128
  %45 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.73275 = load double, ptr addrspace(1) %45, align 8, !invariant.load !339
  %46 = select i1 %compare.2731.7, double %z.2.i, double %param_1.73275
  %47 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg06, i64 0, i64 %44, i64 %thread_id_x
  store double %46, ptr addrspace(1) %47, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_209(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6066 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.73214 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = tail call double @llvm.fma.f64(double %param_1.73214, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %3 = tail call i32 @llvm.nvvm.d2i.lo(double %2) #11
  %4 = tail call double @llvm.nvvm.add.rn.d(double %2, double 0xC338000000000000) #11
  %5 = tail call double @llvm.fma.f64(double %4, double 0xBFE62E42FEFA39EF, double %param_1.73214)
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
  %18 = tail call i32 @llvm.nvvm.d2i.lo(double %17) #11
  %19 = tail call i32 @llvm.nvvm.d2i.hi(double %17) #11
  %20 = shl i32 %3, 20
  %21 = add i32 %19, %20
  %22 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %21) #11
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %param_1.73214) #11
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.fabs.f(float %24) #11
  %26 = fcmp olt float %25, 0x4010C46560000000
  br i1 %26, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %27 = fcmp olt double %param_1.73214, 0.000000e+00
  %28 = fadd double %param_1.73214, 0x7FF0000000000000
  %z.0.i = select i1 %27, double 0.000000e+00, double %28
  %29 = fcmp olt float %25, 0x4010E90000000000
  br i1 %29, label %30, label %__nv_exp.exit

30:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %31 = sdiv i32 %3, 2
  %32 = shl i32 %31, 20
  %33 = add i32 %19, %32
  %34 = tail call double @llvm.nvvm.lohi.i2d(i32 %18, i32 %33) #11
  %35 = sub nsw i32 %3, %31
  %36 = shl i32 %35, 20
  %37 = add nsw i32 %36, 1072693248
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %37) #11
  %39 = fmul double %38, %34
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %30
  %z.2.i = phi double [ %22, %entry ], [ %39, %30 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %40 = icmp slt i64 %param_2.6066, 0
  %41 = add i64 %param_2.6066, 192
  %42 = select i1 %40, i64 %41, i64 %param_2.6066
  %43 = tail call i64 @llvm.smax.i64(i64 %42, i64 0)
  %44 = tail call i64 @llvm.umin.i64(i64 %43, i64 191)
  %45 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %44, i64 %thread_id_x
  store double %z.2.i, ptr addrspace(1) %45, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_210(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6064 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6064, 0
  %2 = add i64 %param_2.6064, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6064
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.73194 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %param_1.73194, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_divide_select_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture align 128 dereferenceable(32) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg22) local_unnamed_addr #0 {
entry:
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg216, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %4 = getelementptr double, ptr addrspace(1) %arg522, i64 %1
  %5 = load double, ptr addrspace(1) %4, align 8, !invariant.load !339
  %multiply.11817.27 = fmul double %3, %5
  %6 = getelementptr double, ptr addrspace(1) %arg114, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %add.10000.27 = fadd double %multiply.11817.27, %7
  %8 = getelementptr double, ptr addrspace(1) %arg828, i64 %1
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %10 = fneg double %add.10000.27
  %11 = tail call double @llvm.fma.f64(double %10, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #11
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #11
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
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #11
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %26) #11
  %29 = shl i32 %12, 20
  %30 = add i32 %28, %29
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %30) #11
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %10) #11
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #11
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %36 = fcmp ogt double %add.10000.27, 0.000000e+00
  %37 = fsub double 0x7FF0000000000000, %add.10000.27
  %z.0.i = select i1 %36, double 0.000000e+00, double %37
  %38 = fcmp olt float %34, 0x4010E90000000000
  br i1 %38, label %39, label %__nv_exp.exit

39:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %40 = sdiv i32 %12, 2
  %41 = shl i32 %40, 20
  %42 = add i32 %28, %41
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %42) #11
  %44 = sub nsw i32 %12, %40
  %45 = shl i32 %44, 20
  %46 = add nsw i32 %45, 1072693248
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %46) #11
  %48 = fmul double %47, %43
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %39
  %z.2.i = phi double [ %31, %entry ], [ %48, %39 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %49 = getelementptr double, ptr addrspace(1) %arg1134, i64 %1
  %50 = load double, ptr addrspace(1) %49, align 8
  %51 = getelementptr double, ptr addrspace(1) %arg726, i64 %1
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !339
  %53 = getelementptr double, ptr addrspace(1) %arg012, i64 %1
  %54 = load double, ptr addrspace(1) %53, align 8, !invariant.load !339
  %multiply.11820.37.clone.1 = fmul double %9, %54
  %add.10002.35.clone.1 = fadd double %52, %multiply.11820.37.clone.1
  %55 = tail call double @llvm.fma.f64(double %add.10002.35.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %56 = tail call i32 @llvm.nvvm.d2i.lo(double %55) #11
  %57 = tail call double @llvm.nvvm.add.rn.d(double %55, double 0xC338000000000000) #11
  %58 = tail call double @llvm.fma.f64(double %57, double 0xBFE62E42FEFA39EF, double %add.10002.35.clone.1)
  %59 = tail call double @llvm.fma.f64(double %57, double 0xBC7ABC9E3B39803F, double %58)
  %60 = tail call double @llvm.fma.f64(double %59, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %61 = tail call double @llvm.fma.f64(double %60, double %59, double 0x3EC71DEE62401315)
  %62 = tail call double @llvm.fma.f64(double %61, double %59, double 0x3EFA01997C89EB71)
  %63 = tail call double @llvm.fma.f64(double %62, double %59, double 0x3F2A01A014761F65)
  %64 = tail call double @llvm.fma.f64(double %63, double %59, double 0x3F56C16C1852B7AF)
  %65 = tail call double @llvm.fma.f64(double %64, double %59, double 0x3F81111111122322)
  %66 = tail call double @llvm.fma.f64(double %65, double %59, double 0x3FA55555555502A1)
  %67 = tail call double @llvm.fma.f64(double %66, double %59, double 0x3FC5555555555511)
  %68 = tail call double @llvm.fma.f64(double %67, double %59, double 0x3FE000000000000B)
  %69 = tail call double @llvm.fma.f64(double %68, double %59, double 1.000000e+00)
  %70 = tail call double @llvm.fma.f64(double %69, double %59, double 1.000000e+00)
  %71 = tail call i32 @llvm.nvvm.d2i.lo(double %70) #11
  %72 = tail call i32 @llvm.nvvm.d2i.hi(double %70) #11
  %73 = shl i32 %56, 20
  %74 = add i32 %72, %73
  %75 = tail call double @llvm.nvvm.lohi.i2d(i32 %71, i32 %74) #11
  %76 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.35.clone.1) #11
  %77 = bitcast i32 %76 to float
  %78 = tail call float @llvm.nvvm.fabs.f(float %77) #11
  %79 = fcmp olt float %78, 0x4010C46560000000
  br i1 %79, label %__nv_exp.exit7, label %__internal_fast_icmp_abs_lt.exit.i4

__internal_fast_icmp_abs_lt.exit.i4:              ; preds = %__nv_exp.exit
  %80 = fcmp olt double %add.10002.35.clone.1, 0.000000e+00
  %81 = fadd double %add.10002.35.clone.1, 0x7FF0000000000000
  %z.0.i5 = select i1 %80, double 0.000000e+00, double %81
  %82 = fcmp olt float %78, 0x4010E90000000000
  br i1 %82, label %83, label %__nv_exp.exit7

83:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i4
  %84 = sdiv i32 %56, 2
  %85 = shl i32 %84, 20
  %86 = add i32 %72, %85
  %87 = tail call double @llvm.nvvm.lohi.i2d(i32 %71, i32 %86) #11
  %88 = sub nsw i32 %56, %84
  %89 = shl i32 %88, 20
  %90 = add nsw i32 %89, 1072693248
  %91 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %90) #11
  %92 = fmul double %91, %87
  br label %__nv_exp.exit7

__nv_exp.exit7:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i4, %83
  %z.2.i6 = phi double [ %75, %__nv_exp.exit ], [ %92, %83 ], [ %z.0.i5, %__internal_fast_icmp_abs_lt.exit.i4 ]
  %93 = getelementptr double, ptr addrspace(1) %arg624, i64 %1
  %94 = load double, ptr addrspace(1) %93, align 8, !invariant.load !339
  %95 = load i64, ptr addrspace(1) %arg1338, align 128, !invariant.load !339
  %96 = icmp slt i64 %95, 0
  %97 = add i64 %95, 192
  %98 = select i1 %96, i64 %97, i64 %95
  %99 = trunc i64 %98 to i32
  %100 = tail call i32 @llvm.smax.i32(i32 %99, i32 0)
  %101 = tail call i32 @llvm.umin.i32(i32 %100, i32 191)
  %102 = zext nneg i32 %101 to i64
  %103 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg1236, i64 0, i64 %1, i64 %102, i64 0
  %104 = load double, ptr addrspace(1) %103, align 8, !invariant.load !339
  %105 = getelementptr double, ptr addrspace(1) %arg420, i64 %1
  %106 = load double, ptr addrspace(1) %105, align 8, !invariant.load !339
  %107 = getelementptr double, ptr addrspace(1) %arg930, i64 %1
  %108 = load double, ptr addrspace(1) %107, align 8
  %109 = getelementptr double, ptr addrspace(1) %arg1032, i64 %1
  %110 = load double, ptr addrspace(1) %109, align 8, !invariant.load !339
  %111 = tail call double @llvm.fma.f64(double %110, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %112 = tail call i32 @llvm.nvvm.d2i.lo(double %111) #11
  %113 = tail call double @llvm.nvvm.add.rn.d(double %111, double 0xC338000000000000) #11
  %114 = tail call double @llvm.fma.f64(double %113, double 0xBFE62E42FEFA39EF, double %110)
  %115 = tail call double @llvm.fma.f64(double %113, double 0xBC7ABC9E3B39803F, double %114)
  %116 = tail call double @llvm.fma.f64(double %115, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %117 = tail call double @llvm.fma.f64(double %116, double %115, double 0x3EC71DEE62401315)
  %118 = tail call double @llvm.fma.f64(double %117, double %115, double 0x3EFA01997C89EB71)
  %119 = tail call double @llvm.fma.f64(double %118, double %115, double 0x3F2A01A014761F65)
  %120 = tail call double @llvm.fma.f64(double %119, double %115, double 0x3F56C16C1852B7AF)
  %121 = tail call double @llvm.fma.f64(double %120, double %115, double 0x3F81111111122322)
  %122 = tail call double @llvm.fma.f64(double %121, double %115, double 0x3FA55555555502A1)
  %123 = tail call double @llvm.fma.f64(double %122, double %115, double 0x3FC5555555555511)
  %124 = tail call double @llvm.fma.f64(double %123, double %115, double 0x3FE000000000000B)
  %125 = tail call double @llvm.fma.f64(double %124, double %115, double 1.000000e+00)
  %126 = tail call double @llvm.fma.f64(double %125, double %115, double 1.000000e+00)
  %127 = tail call i32 @llvm.nvvm.d2i.lo(double %126) #11
  %128 = tail call i32 @llvm.nvvm.d2i.hi(double %126) #11
  %129 = shl i32 %112, 20
  %130 = add i32 %128, %129
  %131 = tail call double @llvm.nvvm.lohi.i2d(i32 %127, i32 %130) #11
  %132 = tail call i32 @llvm.nvvm.d2i.hi(double %110) #11
  %133 = bitcast i32 %132 to float
  %134 = tail call float @llvm.nvvm.fabs.f(float %133) #11
  %135 = fcmp olt float %134, 0x4010C46560000000
  br i1 %135, label %__nv_exp.exit11, label %__internal_fast_icmp_abs_lt.exit.i8

__internal_fast_icmp_abs_lt.exit.i8:              ; preds = %__nv_exp.exit7
  %136 = fcmp olt double %110, 0.000000e+00
  %137 = fadd double %110, 0x7FF0000000000000
  %z.0.i9 = select i1 %136, double 0.000000e+00, double %137
  %138 = fcmp olt float %134, 0x4010E90000000000
  br i1 %138, label %139, label %__nv_exp.exit11

139:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i8
  %140 = sdiv i32 %112, 2
  %141 = shl i32 %140, 20
  %142 = add i32 %128, %141
  %143 = tail call double @llvm.nvvm.lohi.i2d(i32 %127, i32 %142) #11
  %144 = sub nsw i32 %112, %140
  %145 = shl i32 %144, 20
  %146 = add nsw i32 %145, 1072693248
  %147 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %146) #11
  %148 = fmul double %147, %143
  br label %__nv_exp.exit11

__nv_exp.exit11:                                  ; preds = %__nv_exp.exit7, %__internal_fast_icmp_abs_lt.exit.i8, %139
  %z.2.i10 = phi double [ %131, %__nv_exp.exit7 ], [ %148, %139 ], [ %z.0.i9, %__internal_fast_icmp_abs_lt.exit.i8 ]
  %divide.2549.1.clone.1 = fdiv double 1.000000e+00, %108
  %compare.2727.31.clone.1 = fcmp ogt double %z.2.i6, 1.000000e-128
  %149 = select i1 %compare.2727.31.clone.1, double %z.2.i6, double %94
  %divide.2544.5.clone.1 = fdiv double 1.000000e+00, %50
  %add.10003.5.clone.1 = fadd double %divide.2544.5.clone.1, %149
  %divide.2545.1.clone.1 = fdiv double 1.000000e+00, %add.10003.5.clone.1
  %multiply.11825.8 = fmul double %149, %divide.2545.1.clone.1
  %multiply.11826.5 = fmul double %106, %multiply.11825.8
  %multiply.11821.10.clone.1 = fmul double %9, %9
  %add.10001.1.clone.1 = fadd double %z.2.i, 1.000000e+00
  %divide.2543.1.clone.1 = fdiv double 1.000000e+00, %add.10001.1.clone.1
  %subtract.869.9.clone.1 = fsub double 1.000000e+00, %divide.2543.1.clone.1
  %multiply.11818.5.clone.1 = fmul double %divide.2543.1.clone.1, %subtract.869.9.clone.1
  %multiply.11822.11.clone.1 = fmul double %multiply.11821.10.clone.1, %multiply.11818.5.clone.1
  %add.10004.9.clone.1 = fadd double %multiply.11822.11.clone.1, %divide.2545.1.clone.1
  %compare.2728.9.clone.1 = fcmp ogt double %add.10004.9.clone.1, 1.000000e-128
  %150 = select i1 %compare.2728.9.clone.1, double %add.10004.9.clone.1, double 0x7FF8000000000000
  %multiply.11827.3.clone.1 = fmul double %add.10003.5.clone.1, %150
  %divide.2548.3.clone.1 = fdiv double 1.000000e+00, %multiply.11827.3.clone.1
  %multiply.11819.5.clone.1 = fmul double %9, %multiply.11818.5.clone.1
  %divide.2546.1.clone.1 = fdiv double %multiply.11819.5.clone.1, %150
  %subtract.870.5.clone.1 = fsub double %104, %divide.2543.1.clone.1
  %divide.2547.1.clone.1 = fdiv double %subtract.870.5.clone.1, %multiply.11818.5.clone.1
  %multiply.11823.17 = fmul double %divide.2547.1.clone.1, %divide.2546.1.clone.1
  %add.10006.17 = fadd double %add.10000.27, %multiply.11823.17
  %subtract.871.2.clone.1 = fsub double %add.10006.17, %add.10000.27
  %multiply.11828.2.clone.1 = fmul double %subtract.871.2.clone.1, %subtract.871.2.clone.1
  %multiply.11829.1.clone.1 = fmul double %divide.2545.1.clone.1, %multiply.11828.2.clone.1
  %add.10008.1.clone.1 = fadd double %divide.2548.3.clone.1, %multiply.11829.1.clone.1
  %add.10009.1.clone.1 = fadd double %add.10008.1.clone.1, -1.000000e+00
  %multiply.11830.2 = fmul double %multiply.11826.5, %add.10009.1.clone.1
  %multiply.11824.3 = fmul double %3, %54
  %add.10007.3 = fadd double %7, %multiply.11824.3
  %151 = tail call double @llvm.fabs.f64(double %add.10006.17)
  %152 = call i1 @llvm.is.fpclass.f64(double %add.10006.17, i32 504)
  %compare.2730.7 = fcmp olt double %151, 1.400000e+01
  %153 = and i1 %152, %compare.2730.7
  %compare.2731.11.clone.1 = fcmp ogt double %z.2.i10, 1.000000e-128
  %154 = select i1 %compare.2731.11.clone.1, double %z.2.i10, double %94
  %add.10010.5.clone.1 = fadd double %divide.2549.1.clone.1, %154
  %divide.2550.1.clone.1 = fdiv double 1.000000e+00, %add.10010.5.clone.1
  %multiply.11831.9 = fmul double %divide.2550.1.clone.1, 2.000000e+00
  %divide.2551.5 = fdiv double 1.000000e+00, %multiply.11831.9
  %multiply.11832.3 = fmul double %multiply.11830.2, %divide.2551.5
  %155 = getelementptr i64, ptr addrspace(1) %arg318, i64 %1
  %156 = load i64, ptr addrspace(1) %155, align 8, !invariant.load !339
  %157 = sitofp i64 %156 to double
  %multiply.11833.3 = fmul double %multiply.11832.3, %157
  %add.10011.1 = fadd double %add.10007.3, %multiply.11833.3
  %158 = select i1 %153, double %add.10011.1, double %54
  %.not = icmp eq i64 %156, 0
  %add.10012.2.clone.1 = fadd double %divide.2549.1.clone.1, %z.2.i10
  %divide.2552.5.clone.1 = fdiv double 1.000000e+00, %add.10012.2.clone.1
  %multiply.11834.4.clone.1 = fmul double %multiply.11826.5, %multiply.11826.5
  %multiply.11835.7.clone.1 = fmul double %multiply.11834.4.clone.1, 5.000000e-01
  %multiply.11836.5.clone.1 = fmul double %multiply.11834.4.clone.1, %add.10009.1.clone.1
  %add.10013.5.clone.1 = fadd double %multiply.11835.7.clone.1, %multiply.11836.5.clone.1
  %multiply.11837.11.clone.1 = fmul double %106, %106
  %multiply.11838.9.clone.1 = fmul double %multiply.11837.11.clone.1, 5.000000e-01
  %multiply.11839.4.clone.1 = fmul double %multiply.11825.8, %multiply.11838.9.clone.1
  %multiply.11840.5.clone.1 = fmul double %multiply.11839.4.clone.1, %add.10009.1.clone.1
  %subtract.872.5.clone.1 = fsub double %add.10013.5.clone.1, %multiply.11840.5.clone.1
  %multiply.11841.3.clone.1 = fmul double %subtract.872.5.clone.1, %157
  %add.10014.3.clone.1 = fadd double %multiply.11841.3.clone.1, %divide.2550.1.clone.1
  %compare.2734.5.clone.1 = fcmp ogt double %add.10014.3.clone.1, 1.000000e-128
  %159 = select i1 %compare.2734.5.clone.1, double %add.10014.3.clone.1, double %94
  %160 = select i1 %.not, double %divide.2552.5.clone.1, double %159
  %161 = select i1 %153, double %160, double %108
  %162 = select i1 %153, double %add.10006.17, double %5
  %163 = select i1 %153, double %150, double %50
  %164 = getelementptr double, ptr addrspace(1) %arg1440, i64 %1
  store double %158, ptr addrspace(1) %164, align 8
  store double %161, ptr addrspace(1) %107, align 8
  %165 = getelementptr double, ptr addrspace(1) %arg1542, i64 %1
  store double %divide.2550.1.clone.1, ptr addrspace(1) %165, align 8
  %166 = getelementptr double, ptr addrspace(1) %arg1644, i64 %1
  store double %divide.2549.1.clone.1, ptr addrspace(1) %166, align 8
  %167 = getelementptr double, ptr addrspace(1) %arg1746, i64 %1
  store double %add.10009.1.clone.1, ptr addrspace(1) %167, align 8
  %168 = getelementptr double, ptr addrspace(1) %arg1848, i64 %1
  store double %162, ptr addrspace(1) %168, align 8
  store double %163, ptr addrspace(1) %49, align 8
  %169 = getelementptr double, ptr addrspace(1) %arg1950, i64 %1
  store double %divide.2547.1.clone.1, ptr addrspace(1) %169, align 8
  %170 = getelementptr double, ptr addrspace(1) %arg2052, i64 %1
  store double %divide.2546.1.clone.1, ptr addrspace(1) %170, align 8
  %171 = getelementptr double, ptr addrspace(1) %arg2154, i64 %1
  store double %divide.2545.1.clone.1, ptr addrspace(1) %171, align 8
  %172 = getelementptr double, ptr addrspace(1) %arg2256, i64 %1
  store double %divide.2543.1.clone.1, ptr addrspace(1) %172, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_165(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10) local_unnamed_addr #0 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_6.2853 = load i64, ptr addrspace(1) %arg627, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg117, i64 %thread_id_x
  %param_1.73594 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg525, i64 %thread_id_x
  %param_5.33905 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg831, i64 %thread_id_x
  %param_8.17786 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %4 = getelementptr double, ptr addrspace(1) %arg1035, i64 %thread_id_x
  %param_10.13937 = load double, ptr addrspace(1) %4, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg933, i64 %thread_id_x
  %param_9.15388 = load double, ptr addrspace(1) %5, align 8, !invariant.load !339
  %multiply.11820.19 = fmul double %param_10.13937, %param_9.15388
  %add.10002.17 = fadd double %param_8.17786, %multiply.11820.19
  %6 = tail call double @llvm.fma.f64(double %add.10002.17, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %7 = tail call i32 @llvm.nvvm.d2i.lo(double %6) #11
  %8 = tail call double @llvm.nvvm.add.rn.d(double %6, double 0xC338000000000000) #11
  %9 = tail call double @llvm.fma.f64(double %8, double 0xBFE62E42FEFA39EF, double %add.10002.17)
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
  %22 = tail call i32 @llvm.nvvm.d2i.lo(double %21) #11
  %23 = tail call i32 @llvm.nvvm.d2i.hi(double %21) #11
  %24 = shl i32 %7, 20
  %25 = add i32 %23, %24
  %26 = tail call double @llvm.nvvm.lohi.i2d(i32 %22, i32 %25) #11
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.17) #11
  %28 = bitcast i32 %27 to float
  %29 = tail call float @llvm.nvvm.fabs.f(float %28) #11
  %30 = fcmp olt float %29, 0x4010C46560000000
  br i1 %30, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %31 = fcmp olt double %add.10002.17, 0.000000e+00
  %32 = fadd double %add.10002.17, 0x7FF0000000000000
  %z.0.i = select i1 %31, double 0.000000e+00, double %32
  %33 = fcmp olt float %29, 0x4010E90000000000
  br i1 %33, label %34, label %__nv_exp.exit

34:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %35 = sdiv i32 %7, 2
  %36 = shl i32 %35, 20
  %37 = add i32 %23, %36
  %38 = tail call double @llvm.nvvm.lohi.i2d(i32 %22, i32 %37) #11
  %39 = sub nsw i32 %7, %35
  %40 = shl i32 %39, 20
  %41 = add nsw i32 %40, 1072693248
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %41) #11
  %43 = fmul double %42, %38
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %34
  %z.2.i = phi double [ %26, %entry ], [ %43, %34 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %44 = icmp slt i64 %param_6.2853, 0
  %45 = add i64 %param_6.2853, 192
  %46 = select i1 %44, i64 %45, i64 %param_6.2853
  %47 = tail call i64 @llvm.smax.i64(i64 %46, i64 0)
  %48 = tail call i64 @llvm.umin.i64(i64 %47, i64 191)
  %compare.2727.13 = fcmp ogt double %z.2.i, 1.000000e-128
  %49 = getelementptr double, ptr addrspace(1) %arg729, i64 %thread_id_x
  %param_7.21869 = load double, ptr addrspace(1) %49, align 8, !invariant.load !339
  %50 = select i1 %compare.2727.13, double %z.2.i, double %param_7.21869
  %51 = getelementptr double, ptr addrspace(1) %arg423, i64 %thread_id_x
  %param_4.425910 = load double, ptr addrspace(1) %51, align 8, !invariant.load !339
  %multiply.11825.24 = fmul double %50, %param_4.425910
  %multiply.11826.17 = fmul double %param_5.33905, %multiply.11825.24
  %multiply.11834.6 = fmul double %multiply.11826.17, %multiply.11826.17
  %multiply.11835.9 = fmul double %multiply.11834.6, 5.000000e-01
  %52 = getelementptr double, ptr addrspace(1) %arg321, i64 %thread_id_x
  %param_3.501011 = load double, ptr addrspace(1) %52, align 8, !invariant.load !339
  %multiply.11836.7 = fmul double %param_3.501011, %multiply.11834.6
  %add.10013.7 = fadd double %multiply.11835.9, %multiply.11836.7
  %multiply.11837.13 = fmul double %param_5.33905, %param_5.33905
  %multiply.11838.11 = fmul double %multiply.11837.13, 5.000000e-01
  %multiply.11839.6 = fmul double %multiply.11838.11, %multiply.11825.24
  %multiply.11840.7 = fmul double %param_3.501011, %multiply.11839.6
  %subtract.872.7 = fsub double %add.10013.7, %multiply.11840.7
  %53 = getelementptr i64, ptr addrspace(1) %arg219, i64 %thread_id_x
  %param_2.610614 = load i64, ptr addrspace(1) %53, align 8, !invariant.load !339
  %54 = sitofp i64 %param_2.610614 to double
  %multiply.11841.5 = fmul double %subtract.872.7, %54
  %add.10014.5 = fadd double %param_1.73594, %multiply.11841.5
  %compare.2734.3 = fcmp ogt double %add.10014.5, 1.000000e-128
  %55 = zext i1 %compare.2734.3 to i8
  %56 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg015, i64 0, i64 %48, i64 %thread_id_x
  store i8 %55, ptr addrspace(1) %56, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_163(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #0 {
entry:
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.7313 = load i64, ptr addrspace(1) %arg112, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_1.7313, 0
  %2 = add i64 %param_1.7313, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.7313
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.33915 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.28546 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %multiply.11817.33 = fmul double %param_5.33915, %param_6.28546
  %8 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.42727 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %add.10000.33 = fadd double %multiply.11817.33, %param_4.42727
  %9 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.61218 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  %10 = getelementptr double, ptr addrspace(1) %arg316, i64 %thread_id_x
  %param_3.50239 = load double, ptr addrspace(1) %10, align 8, !invariant.load !339
  %multiply.11823.23 = fmul double %param_2.61218, %param_3.50239
  %add.10006.23 = fadd double %add.10000.33, %multiply.11823.23
  %11 = tail call double @llvm.fabs.f64(double %add.10006.23)
  %12 = call i1 @llvm.is.fpclass.f64(double %add.10006.23, i32 504)
  %compare.2730.13 = fcmp olt double %11, 1.400000e+01
  %13 = and i1 %12, %compare.2730.13
  %14 = zext i1 %13 to i8
  %15 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg010, i64 0, i64 %5, i64 %thread_id_x, i64 0
  store i8 %14, ptr addrspace(1) %15, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_164(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #0 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.7316 = load i64, ptr addrspace(1) %arg111, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_1.7316, 0
  %2 = add i64 %param_1.7316, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.7316
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.33934 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = getelementptr double, ptr addrspace(1) %arg621, i64 %thread_id_x
  %param_6.28565 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %multiply.11817.31 = fmul double %param_5.33934, %param_6.28565
  %8 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.42736 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %add.10000.31 = fadd double %multiply.11817.31, %param_4.42736
  %9 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.61227 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  %10 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.50248 = load double, ptr addrspace(1) %10, align 8, !invariant.load !339
  %multiply.11823.21 = fmul double %param_2.61227, %param_3.50248
  %add.10006.21 = fadd double %add.10000.31, %multiply.11823.21
  %11 = tail call double @llvm.fabs.f64(double %add.10006.21)
  %12 = call i1 @llvm.is.fpclass.f64(double %add.10006.21, i32 504)
  %compare.2730.11 = fcmp olt double %11, 1.400000e+01
  %13 = and i1 %12, %compare.2730.11
  %14 = zext i1 %13 to i8
  %15 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg09, i64 0, i64 %5, i64 %thread_id_x
  store i8 %14, ptr addrspace(1) %15, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_191(ptr noalias nocapture writeonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #0 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.4260 = load i64, ptr addrspace(1) %arg419, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_4.4260, 0
  %2 = add i64 %param_4.4260, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.4260
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.73604 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.61075 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %multiply.11821.6 = fmul double %param_2.61075, %param_2.61075
  %8 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.50118 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %subtract.869.7 = fsub double 1.000000e+00, %param_3.50118
  %multiply.11818.3 = fmul double %param_3.50118, %subtract.869.7
  %multiply.11822.7 = fmul double %multiply.11821.6, %multiply.11818.3
  %add.10004.5 = fadd double %param_1.73604, %multiply.11822.7
  %compare.2728.3 = fcmp ogt double %add.10004.5, 1.000000e-128
  %9 = zext i1 %compare.2728.3 to i8
  %10 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store i8 %9, ptr addrspace(1) %10, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_205(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #0 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.4262 = load i64, ptr addrspace(1) %arg415, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.73304 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg313, i64 %thread_id_x
  %param_3.50135 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = tail call double @llvm.fma.f64(double %param_3.50135, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #11
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #11
  %6 = tail call double @llvm.fma.f64(double %5, double 0xBFE62E42FEFA39EF, double %param_3.50135)
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
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #11
  %20 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #11
  %21 = shl i32 %4, 20
  %22 = add i32 %20, %21
  %23 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %22) #11
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %param_3.50135) #11
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #11
  %27 = fcmp olt float %26, 0x4010C46560000000
  br i1 %27, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %28 = fcmp olt double %param_3.50135, 0.000000e+00
  %29 = fadd double %param_3.50135, 0x7FF0000000000000
  %z.0.i = select i1 %28, double 0.000000e+00, double %29
  %30 = fcmp olt float %26, 0x4010E90000000000
  br i1 %30, label %31, label %__nv_exp.exit

31:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %32 = sdiv i32 %4, 2
  %33 = shl i32 %32, 20
  %34 = add i32 %20, %33
  %35 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %34) #11
  %36 = sub nsw i32 %4, %32
  %37 = shl i32 %36, 20
  %38 = add nsw i32 %37, 1072693248
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %38) #11
  %40 = fmul double %39, %35
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %31
  %z.2.i = phi double [ %23, %entry ], [ %40, %31 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %41 = icmp slt i64 %param_4.4262, 0
  %42 = add i64 %param_4.4262, 192
  %43 = select i1 %41, i64 %42, i64 %param_4.4262
  %44 = tail call i64 @llvm.smax.i64(i64 %43, i64 0)
  %45 = tail call i64 @llvm.umin.i64(i64 %44, i64 191)
  %compare.2731.9 = fcmp ogt double %z.2.i, 1.000000e-128
  %46 = getelementptr double, ptr addrspace(1) %arg211, i64 %thread_id_x
  %param_2.60756 = load double, ptr addrspace(1) %46, align 8, !invariant.load !339
  %47 = select i1 %compare.2731.9, double %z.2.i, double %param_2.60756
  %add.10010.3 = fadd double %param_1.73304, %47
  %multiply.11843.1 = fmul double %add.10010.3, %add.10010.3
  %divide.2554.1 = fdiv double 1.000000e+00, %multiply.11843.1
  %48 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %45, i64 %thread_id_x
  store double %divide.2554.1, ptr addrspace(1) %48, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_173(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #0 {
entry:
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.5005 = load i64, ptr addrspace(1) %arg312, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg18, i64 %thread_id_x
  %param_1.73554 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg210, i64 %thread_id_x
  %param_2.61005 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = tail call double @llvm.fma.f64(double %param_2.61005, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %4 = tail call i32 @llvm.nvvm.d2i.lo(double %3) #11
  %5 = tail call double @llvm.nvvm.add.rn.d(double %3, double 0xC338000000000000) #11
  %6 = tail call double @llvm.fma.f64(double %5, double 0xBFE62E42FEFA39EF, double %param_2.61005)
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
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #11
  %20 = tail call i32 @llvm.nvvm.d2i.hi(double %18) #11
  %21 = shl i32 %4, 20
  %22 = add i32 %20, %21
  %23 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %22) #11
  %24 = tail call i32 @llvm.nvvm.d2i.hi(double %param_2.61005) #11
  %25 = bitcast i32 %24 to float
  %26 = tail call float @llvm.nvvm.fabs.f(float %25) #11
  %27 = fcmp olt float %26, 0x4010C46560000000
  br i1 %27, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %28 = fcmp olt double %param_2.61005, 0.000000e+00
  %29 = fadd double %param_2.61005, 0x7FF0000000000000
  %z.0.i = select i1 %28, double 0.000000e+00, double %29
  %30 = fcmp olt float %26, 0x4010E90000000000
  br i1 %30, label %31, label %__nv_exp.exit

31:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %32 = sdiv i32 %4, 2
  %33 = shl i32 %32, 20
  %34 = add i32 %20, %33
  %35 = tail call double @llvm.nvvm.lohi.i2d(i32 %19, i32 %34) #11
  %36 = sub nsw i32 %4, %32
  %37 = shl i32 %36, 20
  %38 = add nsw i32 %37, 1072693248
  %39 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %38) #11
  %40 = fmul double %39, %35
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %31
  %z.2.i = phi double [ %23, %entry ], [ %40, %31 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %41 = icmp slt i64 %param_3.5005, 0
  %42 = add i64 %param_3.5005, 192
  %43 = select i1 %41, i64 %42, i64 %param_3.5005
  %44 = tail call i64 @llvm.smax.i64(i64 %43, i64 0)
  %45 = tail call i64 @llvm.umin.i64(i64 %44, i64 191)
  %add.10012.1 = fadd double %param_1.73554, %z.2.i
  %multiply.11850.1 = fmul double %add.10012.1, %add.10012.1
  %divide.2562.1 = fdiv double 1.000000e+00, %multiply.11850.1
  %46 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg06, i64 0, i64 %45, i64 %thread_id_x
  store double %divide.2562.1, ptr addrspace(1) %46, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_178(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8) local_unnamed_addr #0 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.4239 = load i64, ptr addrspace(1) %arg419, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.49824 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg623, i64 %thread_id_x
  %param_6.28465 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg827, i64 %thread_id_x
  %param_8.17766 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %4 = getelementptr double, ptr addrspace(1) %arg725, i64 %thread_id_x
  %param_7.21817 = load double, ptr addrspace(1) %4, align 8, !invariant.load !339
  %multiply.11820.21 = fmul double %param_8.17766, %param_7.21817
  %add.10002.19 = fadd double %param_6.28465, %multiply.11820.21
  %5 = tail call double @llvm.fma.f64(double %add.10002.19, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #11
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #11
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.10002.19)
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
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #11
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #11
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #11
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.19) #11
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #11
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.10002.19, 0.000000e+00
  %31 = fadd double %add.10002.19, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #11
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #11
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = icmp slt i64 %param_4.4239, 0
  %44 = add i64 %param_4.4239, 192
  %45 = select i1 %43, i64 %44, i64 %param_4.4239
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.2727.15 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg521, i64 %thread_id_x
  %param_5.33618 = load double, ptr addrspace(1) %48, align 8, !invariant.load !339
  %49 = select i1 %compare.2727.15, double %z.2.i, double %param_5.33618
  %50 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.60599 = load double, ptr addrspace(1) %50, align 8, !invariant.load !339
  %multiply.11825.16 = fmul double %49, %param_2.60599
  %multiply.11826.13 = fmul double %param_3.49824, %multiply.11825.16
  %51 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.731410 = load double, ptr addrspace(1) %51, align 8, !invariant.load !339
  %multiply.11830.1 = fmul double %param_1.731410, %multiply.11826.13
  %52 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg011, i64 0, i64 %47, i64 %thread_id_x
  store double %multiply.11830.1, ptr addrspace(1) %52, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_177(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6117 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6117, 0
  %2 = add i64 %param_2.6117, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6117
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.73374 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %multiply.11831.3 = fmul double %param_1.73374, 2.000000e+00
  %multiply.11849.1 = fmul double %multiply.11831.3, %multiply.11831.3
  %divide.2560.1 = fdiv double 1.000000e+00, %multiply.11849.1
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.2560.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_179(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_1.7312 = load i64, ptr addrspace(1) %arg17, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_1.7312, 0
  %2 = add i64 %param_1.7312, 192
  %3 = select i1 %1, i64 %2, i64 %param_1.7312
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg29, i64 %thread_id_x
  %param_2.60574 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %multiply.11831.7 = fmul double %param_2.60574, 2.000000e+00
  %divide.2551.3 = fdiv double 1.000000e+00, %multiply.11831.7
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.2551.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_185(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #0 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_6.2839 = load i64, ptr addrspace(1) %arg621, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_6.2839, 0
  %2 = add i64 %param_6.2839, 192
  %3 = select i1 %1, i64 %2, i64 %param_6.2839
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.60984 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.50045 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %multiply.11817.17 = fmul double %param_2.60984, %param_3.50045
  %8 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.73536 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %add.10000.17 = fadd double %multiply.11817.17, %param_1.73536
  %9 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.42557 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  %10 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.33758 = load double, ptr addrspace(1) %10, align 8, !invariant.load !339
  %multiply.11823.7 = fmul double %param_4.42557, %param_5.33758
  %add.10006.7 = fadd double %add.10000.17, %multiply.11823.7
  %subtract.871.3 = fsub double %add.10006.7, %add.10000.17
  %multiply.11828.1 = fmul double %subtract.871.3, %subtract.871.3
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg09, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.11828.1, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_184(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #0 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_6.2850 = load i64, ptr addrspace(1) %arg621, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_6.2850, 0
  %2 = add i64 %param_6.2850, 192
  %3 = select i1 %1, i64 %2, i64 %param_6.2850
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg213, i64 %thread_id_x
  %param_2.61154 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.50205 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %multiply.11817.19 = fmul double %param_2.61154, %param_3.50205
  %8 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.73646 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %add.10000.19 = fadd double %multiply.11817.19, %param_1.73646
  %9 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.42697 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  %10 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.33878 = load double, ptr addrspace(1) %10, align 8, !invariant.load !339
  %multiply.11823.9 = fmul double %param_4.42697, %param_5.33878
  %add.10006.9 = fadd double %add.10000.19, %multiply.11823.9
  %subtract.871.1 = fsub double %add.10006.9, %add.10000.19
  %multiply.11848.3 = fmul double %subtract.871.1, 2.000000e+00
  %11 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg09, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.11848.3, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_197(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6095 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6095, 0
  %2 = add i64 %param_2.6095, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6095
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.73504 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %subtract.869.15 = fsub double 1.000000e+00, %param_1.73504
  %multiply.11818.11 = fmul double %param_1.73504, %subtract.869.15
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.11818.11, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_193(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6053 = load i64, ptr addrspace(1) %arg211, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6053, 0
  %2 = add i64 %param_2.6053, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6053
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg19, i64 %thread_id_x
  %param_1.73094 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %subtract.869.13 = fsub double 1.000000e+00, %param_1.73094
  %multiply.11818.9 = fmul double %param_1.73094, %subtract.869.13
  %multiply.11846.1 = fmul double %multiply.11818.9, %multiply.11818.9
  %divide.2558.1 = fdiv double 1.000000e+00, %multiply.11846.1
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg07, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.2558.1, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_188(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #0 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.4277 = load i64, ptr addrspace(1) %arg419, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_4.4277, 0
  %2 = add i64 %param_4.4277, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.4277
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.73734 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.50285 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %multiply.11821.14 = fmul double %param_3.50285, %param_3.50285
  %8 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.61278 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %subtract.869.27 = fsub double 1.000000e+00, %param_2.61278
  %multiply.11818.23 = fmul double %param_2.61278, %subtract.869.27
  %multiply.11822.15 = fmul double %multiply.11821.14, %multiply.11818.23
  %add.10004.13 = fadd double %param_1.73734, %multiply.11822.15
  %compare.2728.13 = fcmp ogt double %add.10004.13, 1.000000e-128
  %9 = select i1 %compare.2728.13, double %add.10004.13, double 0x7FF8000000000000
  %multiply.11847.1 = fmul double %9, %9
  %divide.2559.1 = fdiv double 1.000000e+00, %multiply.11847.1
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store double %divide.2559.1, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_194(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #0 {
entry:
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.4978 = load i64, ptr addrspace(1) %arg319, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_3.4978, 0
  %2 = add i64 %param_3.4978, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.4978
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %param_2.6051 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg217, i64 0, i64 %thread_id_x, i64 %5, i64 0
  %param_2.605111 = load double, ptr addrspace(1) %param_2.6051, align 8, !invariant.load !339
  %6 = getelementptr double, ptr addrspace(1) %arg115, i64 %thread_id_x
  %param_1.730712 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %subtract.870.3 = fsub double %param_2.605111, %param_1.730712
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg013, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.870.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_196(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6097 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_2.6097, 0
  %2 = add i64 %param_2.6097, 192
  %3 = select i1 %1, i64 %2, i64 %param_2.6097
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg17, i64 %thread_id_x
  %param_1.73524 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %subtract.869.3 = fsub double 1.000000e+00, %param_1.73524
  %7 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg05, i64 0, i64 %5, i64 %thread_id_x
  store double %subtract.869.3, ptr addrspace(1) %7, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_189(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #0 {
entry:
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.4990 = load i64, ptr addrspace(1) %arg314, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_3.4990, 0
  %2 = add i64 %param_3.4990, 192
  %3 = select i1 %1, i64 %2, i64 %param_3.4990
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg110, i64 %thread_id_x
  %param_1.73294 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = getelementptr double, ptr addrspace(1) %arg212, i64 %thread_id_x
  %param_2.60745 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %subtract.869.17 = fsub double 1.000000e+00, %param_2.60745
  %multiply.11818.13 = fmul double %param_2.60745, %subtract.869.17
  %multiply.11819.3 = fmul double %param_1.73294, %multiply.11818.13
  %8 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg08, i64 0, i64 %5, i64 %thread_id_x
  store double %multiply.11819.3, ptr addrspace(1) %8, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_190(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #0 {
entry:
  %arg419 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg317 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg215 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg113 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg011 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.4275 = load i64, ptr addrspace(1) %arg419, align 128, !invariant.load !339
  %1 = icmp slt i64 %param_4.4275, 0
  %2 = add i64 %param_4.4275, 192
  %3 = select i1 %1, i64 %2, i64 %param_4.4275
  %4 = tail call i64 @llvm.smax.i64(i64 %3, i64 0)
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 191)
  %6 = getelementptr double, ptr addrspace(1) %arg113, i64 %thread_id_x
  %param_1.73714 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %7 = getelementptr double, ptr addrspace(1) %arg317, i64 %thread_id_x
  %param_3.50265 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %multiply.11821.16 = fmul double %param_3.50265, %param_3.50265
  %8 = getelementptr double, ptr addrspace(1) %arg215, i64 %thread_id_x
  %param_2.61248 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %subtract.869.29 = fsub double 1.000000e+00, %param_2.61248
  %multiply.11818.25 = fmul double %param_2.61248, %subtract.869.29
  %multiply.11822.17 = fmul double %multiply.11821.16, %multiply.11818.25
  %add.10004.15 = fadd double %param_1.73714, %multiply.11822.17
  %compare.2728.15 = fcmp ogt double %add.10004.15, 1.000000e-128
  %9 = select i1 %compare.2728.15, double %add.10004.15, double 0x7FF8000000000000
  %10 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg011, i64 0, i64 %5, i64 %thread_id_x
  store double %9, ptr addrspace(1) %10, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_180(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7) local_unnamed_addr #0 {
entry:
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.5002 = load i64, ptr addrspace(1) %arg316, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.60944 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.33865 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg724, i64 %thread_id_x
  %param_7.21836 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %4 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.28497 = load double, ptr addrspace(1) %4, align 8, !invariant.load !339
  %multiply.11820.29 = fmul double %param_7.21836, %param_6.28497
  %add.10002.27 = fadd double %param_5.33865, %multiply.11820.29
  %5 = tail call double @llvm.fma.f64(double %add.10002.27, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #11
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #11
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.10002.27)
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
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #11
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #11
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #11
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.27) #11
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #11
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.10002.27, 0.000000e+00
  %31 = fadd double %add.10002.27, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #11
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #11
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = icmp slt i64 %param_3.5002, 0
  %44 = add i64 %param_3.5002, 192
  %45 = select i1 %43, i64 %44, i64 %param_3.5002
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.2727.23 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.42538 = load double, ptr addrspace(1) %48, align 8, !invariant.load !339
  %49 = select i1 %compare.2727.23, double %z.2.i, double %param_4.42538
  %50 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.73499 = load double, ptr addrspace(1) %50, align 8, !invariant.load !339
  %multiply.11825.12 = fmul double %49, %param_1.73499
  %multiply.11826.9 = fmul double %param_2.60944, %multiply.11825.12
  %51 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg010, i64 0, i64 %47, i64 %thread_id_x
  store double %multiply.11826.9, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_170(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7) local_unnamed_addr #0 {
entry:
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.5021 = load i64, ptr addrspace(1) %arg316, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.61164 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.33885 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg724, i64 %thread_id_x
  %param_7.21846 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %4 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.28517 = load double, ptr addrspace(1) %4, align 8, !invariant.load !339
  %multiply.11820.27 = fmul double %param_7.21846, %param_6.28517
  %add.10002.25 = fadd double %param_5.33885, %multiply.11820.27
  %5 = tail call double @llvm.fma.f64(double %add.10002.25, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #11
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #11
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.10002.25)
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
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #11
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #11
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #11
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.25) #11
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #11
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.10002.25, 0.000000e+00
  %31 = fadd double %add.10002.25, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #11
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #11
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = icmp slt i64 %param_3.5021, 0
  %44 = add i64 %param_3.5021, 192
  %45 = select i1 %43, i64 %44, i64 %param_3.5021
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.2727.21 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.42708 = load double, ptr addrspace(1) %48, align 8, !invariant.load !339
  %49 = select i1 %compare.2727.21, double %z.2.i, double %param_4.42708
  %50 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.73659 = load double, ptr addrspace(1) %50, align 8, !invariant.load !339
  %multiply.11825.10 = fmul double %49, %param_1.73659
  %multiply.11826.7 = fmul double %param_2.61164, %multiply.11825.10
  %multiply.11851.3 = fmul double %multiply.11826.7, 2.000000e+00
  %51 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg010, i64 0, i64 %47, i64 %thread_id_x
  store double %multiply.11851.3, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_169(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7) local_unnamed_addr #0 {
entry:
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.4997 = load i64, ptr addrspace(1) %arg316, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.60844 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.33785 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg724, i64 %thread_id_x
  %param_7.21776 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %4 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.28417 = load double, ptr addrspace(1) %4, align 8, !invariant.load !339
  %multiply.11820.31 = fmul double %param_7.21776, %param_6.28417
  %add.10002.29 = fadd double %param_5.33785, %multiply.11820.31
  %5 = tail call double @llvm.fma.f64(double %add.10002.29, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #11
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #11
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.10002.29)
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
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #11
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #11
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #11
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.29) #11
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #11
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.10002.29, 0.000000e+00
  %31 = fadd double %add.10002.29, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #11
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #11
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %43 = icmp slt i64 %param_3.4997, 0
  %44 = add i64 %param_3.4997, 192
  %45 = select i1 %43, i64 %44, i64 %param_3.4997
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.2727.25 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.42498 = load double, ptr addrspace(1) %48, align 8, !invariant.load !339
  %49 = select i1 %compare.2727.25, double %z.2.i, double %param_4.42498
  %50 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.73399 = load double, ptr addrspace(1) %50, align 8, !invariant.load !339
  %multiply.11825.14 = fmul double %49, %param_1.73399
  %multiply.11826.11 = fmul double %param_2.60844, %multiply.11825.14
  %multiply.11834.1 = fmul double %multiply.11826.11, %multiply.11826.11
  %51 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg010, i64 0, i64 %47, i64 %thread_id_x
  store double %multiply.11834.1, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_183(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #0 {
entry:
  %arg621 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg519 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg417 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_2.6069 = load i64, ptr addrspace(1) %arg213, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg417, i64 %thread_id_x
  %param_4.42674 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg621, i64 %thread_id_x
  %param_6.28475 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg519, i64 %thread_id_x
  %param_5.33856 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %multiply.11820.23 = fmul double %param_6.28475, %param_5.33856
  %add.10002.21 = fadd double %param_4.42674, %multiply.11820.23
  %4 = tail call double @llvm.fma.f64(double %add.10002.21, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %5 = tail call i32 @llvm.nvvm.d2i.lo(double %4) #11
  %6 = tail call double @llvm.nvvm.add.rn.d(double %4, double 0xC338000000000000) #11
  %7 = tail call double @llvm.fma.f64(double %6, double 0xBFE62E42FEFA39EF, double %add.10002.21)
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
  %20 = tail call i32 @llvm.nvvm.d2i.lo(double %19) #11
  %21 = tail call i32 @llvm.nvvm.d2i.hi(double %19) #11
  %22 = shl i32 %5, 20
  %23 = add i32 %21, %22
  %24 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %23) #11
  %25 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.21) #11
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.fabs.f(float %26) #11
  %28 = fcmp olt float %27, 0x4010C46560000000
  br i1 %28, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %29 = fcmp olt double %add.10002.21, 0.000000e+00
  %30 = fadd double %add.10002.21, 0x7FF0000000000000
  %z.0.i = select i1 %29, double 0.000000e+00, double %30
  %31 = fcmp olt float %27, 0x4010E90000000000
  br i1 %31, label %32, label %__nv_exp.exit

32:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %33 = sdiv i32 %5, 2
  %34 = shl i32 %33, 20
  %35 = add i32 %21, %34
  %36 = tail call double @llvm.nvvm.lohi.i2d(i32 %20, i32 %35) #11
  %37 = sub nsw i32 %5, %33
  %38 = shl i32 %37, 20
  %39 = add nsw i32 %38, 1072693248
  %40 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %39) #11
  %41 = fmul double %40, %36
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %32
  %z.2.i = phi double [ %24, %entry ], [ %41, %32 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %42 = icmp slt i64 %param_2.6069, 0
  %43 = add i64 %param_2.6069, 192
  %44 = select i1 %42, i64 %43, i64 %param_2.6069
  %45 = tail call i64 @llvm.smax.i64(i64 %44, i64 0)
  %46 = tail call i64 @llvm.umin.i64(i64 %45, i64 191)
  %compare.2727.17 = fcmp ogt double %z.2.i, 1.000000e-128
  %47 = getelementptr double, ptr addrspace(1) %arg315, i64 %thread_id_x
  %param_3.49877 = load double, ptr addrspace(1) %47, align 8, !invariant.load !339
  %48 = select i1 %compare.2727.17, double %z.2.i, double %param_3.49877
  %49 = getelementptr double, ptr addrspace(1) %arg111, i64 %thread_id_x
  %param_1.73248 = load double, ptr addrspace(1) %49, align 8, !invariant.load !339
  %multiply.11825.3 = fmul double %48, %param_1.73248
  %50 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg09, i64 0, i64 %46, i64 %thread_id_x
  store double %multiply.11825.3, ptr addrspace(1) %50, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_166(ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7) local_unnamed_addr #0 {
entry:
  %arg724 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg622 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg520 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_3.5022 = load i64, ptr addrspace(1) %arg316, align 128, !invariant.load !339
  %1 = getelementptr double, ptr addrspace(1) %arg214, i64 %thread_id_x
  %param_2.61184 = load double, ptr addrspace(1) %1, align 8, !invariant.load !339
  %2 = getelementptr double, ptr addrspace(1) %arg520, i64 %thread_id_x
  %param_5.33895 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %3 = getelementptr double, ptr addrspace(1) %arg724, i64 %thread_id_x
  %param_7.21856 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %4 = getelementptr double, ptr addrspace(1) %arg622, i64 %thread_id_x
  %param_6.28527 = load double, ptr addrspace(1) %4, align 8, !invariant.load !339
  %multiply.11820.13 = fmul double %param_7.21856, %param_6.28527
  %add.10002.11 = fadd double %param_5.33895, %multiply.11820.13
  %5 = tail call double @llvm.fma.f64(double %add.10002.11, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %6 = tail call i32 @llvm.nvvm.d2i.lo(double %5) #11
  %7 = tail call double @llvm.nvvm.add.rn.d(double %5, double 0xC338000000000000) #11
  %8 = tail call double @llvm.fma.f64(double %7, double 0xBFE62E42FEFA39EF, double %add.10002.11)
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
  %21 = tail call i32 @llvm.nvvm.d2i.lo(double %20) #11
  %22 = tail call i32 @llvm.nvvm.d2i.hi(double %20) #11
  %23 = shl i32 %6, 20
  %24 = add i32 %22, %23
  %25 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %24) #11
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10002.11) #11
  %27 = bitcast i32 %26 to float
  %28 = tail call float @llvm.nvvm.fabs.f(float %27) #11
  %29 = fcmp olt float %28, 0x4010C46560000000
  br i1 %29, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %30 = fcmp olt double %add.10002.11, 0.000000e+00
  %31 = fadd double %add.10002.11, 0x7FF0000000000000
  %z.0.i = select i1 %30, double 0.000000e+00, double %31
  %32 = fcmp olt float %28, 0x4010E90000000000
  br i1 %32, label %33, label %__nv_exp.exit

33:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %34 = sdiv i32 %6, 2
  %35 = shl i32 %34, 20
  %36 = add i32 %22, %35
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 %21, i32 %36) #11
  %38 = sub nsw i32 %6, %34
  %39 = shl i32 %38, 20
  %40 = add nsw i32 %39, 1072693248
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %40) #11
  %42 = fmul double %41, %37
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %33
  %z.2.i = phi double [ %25, %entry ], [ %42, %33 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.11837.9 = fmul double %param_2.61184, %param_2.61184
  %multiply.11838.7 = fmul double %multiply.11837.9, 5.000000e-01
  %43 = icmp slt i64 %param_3.5022, 0
  %44 = add i64 %param_3.5022, 192
  %45 = select i1 %43, i64 %44, i64 %param_3.5022
  %46 = tail call i64 @llvm.smax.i64(i64 %45, i64 0)
  %47 = tail call i64 @llvm.umin.i64(i64 %46, i64 191)
  %compare.2727.7 = fcmp ogt double %z.2.i, 1.000000e-128
  %48 = getelementptr double, ptr addrspace(1) %arg418, i64 %thread_id_x
  %param_4.42718 = load double, ptr addrspace(1) %48, align 8, !invariant.load !339
  %49 = select i1 %compare.2727.7, double %z.2.i, double %param_4.42718
  %50 = getelementptr double, ptr addrspace(1) %arg112, i64 %thread_id_x
  %param_1.73289 = load double, ptr addrspace(1) %50, align 8, !invariant.load !339
  %multiply.11825.4 = fmul double %49, %param_1.73289
  %multiply.11839.1 = fmul double %multiply.11838.7, %multiply.11825.4
  %51 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg010, i64 0, i64 %47, i64 %thread_id_x
  store double %multiply.11839.1, ptr addrspace(1) %51, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_29(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg8) local_unnamed_addr #0 {
entry:
  %arg821 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg719 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg617 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg515 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg413 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !345
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !342
  %3 = shl nuw nsw i32 %2, 2
  %4 = or disjoint i32 %1, %3
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %linear_index = or disjoint i32 %4, %5
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg617, i64 0, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %9 = load double, ptr addrspace(1) %arg515, align 128, !invariant.load !339
  %10 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg719, i64 0, i64 %6
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !339
  %multiply.11866.17 = fmul double %9, %11
  %add.10019.17 = fadd double %8, %multiply.11866.17
  %12 = tail call double @llvm.fma.f64(double %add.10019.17, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %12) #11
  %14 = tail call double @llvm.nvvm.add.rn.d(double %12, double 0xC338000000000000) #11
  %15 = tail call double @llvm.fma.f64(double %14, double 0xBFE62E42FEFA39EF, double %add.10019.17)
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
  %28 = tail call i32 @llvm.nvvm.d2i.lo(double %27) #11
  %29 = tail call i32 @llvm.nvvm.d2i.hi(double %27) #11
  %30 = shl i32 %13, 20
  %31 = add i32 %29, %30
  %32 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %31) #11
  %33 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10019.17) #11
  %34 = bitcast i32 %33 to float
  %35 = tail call float @llvm.nvvm.fabs.f(float %34) #11
  %36 = fcmp olt float %35, 0x4010C46560000000
  br i1 %36, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %37 = fcmp olt double %add.10019.17, 0.000000e+00
  %38 = fadd double %add.10019.17, 0x7FF0000000000000
  %z.0.i = select i1 %37, double 0.000000e+00, double %38
  %39 = fcmp olt float %35, 0x4010E90000000000
  br i1 %39, label %40, label %__nv_exp.exit

40:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %41 = sdiv i32 %13, 2
  %42 = shl i32 %41, 20
  %43 = add i32 %29, %42
  %44 = tail call double @llvm.nvvm.lohi.i2d(i32 %28, i32 %43) #11
  %45 = sub nsw i32 %13, %41
  %46 = shl i32 %45, 20
  %47 = add nsw i32 %46, 1072693248
  %48 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %47) #11
  %49 = fmul double %48, %44
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %40
  %z.2.i = phi double [ %32, %entry ], [ %49, %40 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %50 = zext nneg i32 %linear_index to i64
  %51 = getelementptr double, ptr addrspace(1) %arg29, i64 %50
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !339
  %53 = fcmp ole double %52, -3.000000e+01
  %54 = select i1 %53, double -3.000000e+01, double %52
  %55 = fcmp oge double %54, 3.000000e+01
  %.neg = fneg double %54
  %56 = select i1 %55, double -3.000000e+01, double %.neg
  %57 = tail call double @llvm.fma.f64(double %56, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %58 = tail call i32 @llvm.nvvm.d2i.lo(double %57) #11
  %59 = tail call double @llvm.nvvm.add.rn.d(double %57, double 0xC338000000000000) #11
  %60 = tail call double @llvm.fma.f64(double %59, double 0xBFE62E42FEFA39EF, double %56)
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
  %73 = tail call i32 @llvm.nvvm.d2i.lo(double %72) #11
  %74 = tail call i32 @llvm.nvvm.d2i.hi(double %72) #11
  %75 = shl i32 %58, 20
  %76 = add i32 %74, %75
  %77 = tail call double @llvm.nvvm.lohi.i2d(i32 %73, i32 %76) #11
  %78 = tail call i32 @llvm.nvvm.d2i.hi(double %56) #11
  %79 = bitcast i32 %78 to float
  %80 = tail call float @llvm.nvvm.fabs.f(float %79) #11
  %81 = fcmp olt float %80, 0x4010C46560000000
  br i1 %81, label %__nv_exp.exit4, label %__internal_fast_icmp_abs_lt.exit.i1

__internal_fast_icmp_abs_lt.exit.i1:              ; preds = %__nv_exp.exit
  %82 = fcmp olt double %56, 0.000000e+00
  %83 = fadd double %56, 0x7FF0000000000000
  %z.0.i2 = select i1 %82, double 0.000000e+00, double %83
  %84 = fcmp olt float %80, 0x4010E90000000000
  br i1 %84, label %85, label %__nv_exp.exit4

85:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i1
  %86 = sdiv i32 %58, 2
  %87 = shl i32 %86, 20
  %88 = add i32 %74, %87
  %89 = tail call double @llvm.nvvm.lohi.i2d(i32 %73, i32 %88) #11
  %90 = sub nsw i32 %58, %86
  %91 = shl i32 %90, 20
  %92 = add nsw i32 %91, 1072693248
  %93 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %92) #11
  %94 = fmul double %93, %89
  br label %__nv_exp.exit4

__nv_exp.exit4:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i1, %85
  %z.2.i3 = phi double [ %77, %__nv_exp.exit ], [ %94, %85 ], [ %z.0.i2, %__internal_fast_icmp_abs_lt.exit.i1 ]
  %add.10024.5 = fadd double %z.2.i3, 1.000000e+00
  %divide.2563.5 = fdiv double 1.000000e+00, %add.10024.5
  %subtract.873.3 = fsub double 1.000000e+00, %divide.2563.5
  %95 = getelementptr double, ptr addrspace(1) %arg17, i64 %50
  %96 = load double, ptr addrspace(1) %95, align 8, !invariant.load !339
  %multiply.11871.1 = fmul double %96, %subtract.873.3
  %97 = getelementptr double, ptr addrspace(1) %arg05, i64 %50
  %98 = load double, ptr addrspace(1) %97, align 8, !invariant.load !339
  %multiply.11872.1 = fmul double %divide.2563.5, %98
  %subtract.874.2 = fsub double %multiply.11871.1, %multiply.11872.1
  %multiply.11873.3 = fmul double %z.2.i, %subtract.874.2
  %99 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg311, i64 0, i64 %6
  %100 = load double, ptr addrspace(1) %99, align 8, !invariant.load !339
  %101 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg413, i64 0, i64 %6
  %102 = load double, ptr addrspace(1) %101, align 8, !invariant.load !339
  %multiply.11874.5 = fmul double %9, %102
  %add.10025.5 = fadd double %100, %multiply.11874.5
  %add.10026.1 = fadd double %multiply.11873.3, %add.10025.5
  %103 = getelementptr double, ptr addrspace(1) %arg821, i64 %50
  store double %add.10026.1, ptr addrspace(1) %103, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_exponential_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg1) local_unnamed_addr #0 {
entry:
  %arg131 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg029 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !346
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !347
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = and i32 %1, 3
  %4 = lshr i32 %linear_index, 2
  %.lhs.trunc = trunc nuw nsw i32 %4 to i16
  %5 = urem i16 %.lhs.trunc, 192
  %6 = icmp ugt i32 %0, 5
  %7 = zext nneg i16 %5 to i64
  %8 = zext nneg i32 %3 to i64
  %9 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg029, i64 0, i64 %7, i64 %8
  %.pre = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  br i1 %6, label %in_bounds-true, label %in_bounds-after

in_bounds-after:                                  ; preds = %entry, %in_bounds-true
  %pad_result_addr.0 = phi double [ %.pre, %in_bounds-true ], [ 0.000000e+00, %entry ]
  %10 = fcmp ole double %.pre, 0.000000e+00
  %maximum.59.i.1 = select i1 %10, double 0.000000e+00, double %.pre
  %subtract.875.5 = fsub double %pad_result_addr.0, %maximum.59.i.1
  %11 = tail call double @llvm.fma.f64(double %subtract.875.5, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %12 = tail call i32 @llvm.nvvm.d2i.lo(double %11) #11
  %13 = tail call double @llvm.nvvm.add.rn.d(double %11, double 0xC338000000000000) #11
  %14 = tail call double @llvm.fma.f64(double %13, double 0xBFE62E42FEFA39EF, double %subtract.875.5)
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
  %27 = tail call i32 @llvm.nvvm.d2i.lo(double %26) #11
  %28 = tail call i32 @llvm.nvvm.d2i.hi(double %26) #11
  %29 = shl i32 %12, 20
  %30 = add i32 %28, %29
  %31 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %30) #11
  %32 = tail call i32 @llvm.nvvm.d2i.hi(double %subtract.875.5) #11
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.fabs.f(float %33) #11
  %35 = fcmp olt float %34, 0x4010C46560000000
  br i1 %35, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %in_bounds-after
  %36 = fcmp olt double %subtract.875.5, 0.000000e+00
  %37 = fadd double %subtract.875.5, 0x7FF0000000000000
  %z.0.i = select i1 %36, double 0.000000e+00, double %37
  %38 = fcmp olt float %34, 0x4010E90000000000
  br i1 %38, label %39, label %__nv_exp.exit

39:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %40 = sdiv i32 %12, 2
  %41 = shl i32 %40, 20
  %42 = add i32 %28, %41
  %43 = tail call double @llvm.nvvm.lohi.i2d(i32 %27, i32 %42) #11
  %44 = sub nsw i32 %12, %40
  %45 = shl i32 %44, 20
  %46 = add nsw i32 %45, 1072693248
  %47 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %46) #11
  %48 = fmul double %47, %43
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %in_bounds-after, %__internal_fast_icmp_abs_lt.exit.i, %39
  %z.2.i = phi double [ %31, %in_bounds-after ], [ %48, %39 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %49 = zext nneg i32 %linear_index to i64
  %50 = getelementptr double, ptr addrspace(1) %arg131, i64 %49
  store double %z.2.i, ptr addrspace(1) %50, align 8
  ret void

in_bounds-true:                                   ; preds = %entry
  br label %in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(9216) %arg1) local_unnamed_addr #0 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !345
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !347
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %.zext = zext nneg i16 %.decomposed to i32
  %.zext12 = zext nneg i16 %3 to i32
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %7 = getelementptr inbounds [4 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg115, i64 0, i64 %5, i64 %6, i64 0, i64 0
  store i32 %.zext12, ptr addrspace(1) %7, align 4
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 4
  store i32 %.zext, ptr addrspace(1) %8, align 4
  %9 = zext nneg i32 %linear_index to i64
  %10 = getelementptr i32, ptr addrspace(1) %arg013, i64 %9
  %11 = load i32, ptr addrspace(1) %10, align 4, !invariant.load !339
  %12 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 8
  store i32 %11, ptr addrspace(1) %12, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_52(ptr noalias nocapture writeonly align 128 dereferenceable(12288) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !348
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !349
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or disjoint i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1536
  %4 = zext nneg i32 %linear_index to i64
  %5 = getelementptr double, ptr addrspace(1) %arg01, i64 %4
  br i1 %3, label %loop_broadcast_fusion.52.in_bounds-true, label %loop_broadcast_fusion.52.in_bounds-after

loop_broadcast_fusion.52.in_bounds-after:         ; preds = %loop_broadcast_fusion.52.in_bounds-true, %entry
  ret void

loop_broadcast_fusion.52.in_bounds-true:          ; preds = %entry
  store double 0.000000e+00, ptr addrspace(1) %5, align 8
  br label %loop_broadcast_fusion.52.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define void @input_scatter_fusion_3(ptr noalias nocapture align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(9216) %arg1) local_unnamed_addr #5 {
entry:
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !345
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !347
  %linear_index = or disjoint i32 %1, %2
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %param_1.7547 = getelementptr inbounds [4 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg110, i64 0, i64 %5, i64 %6, i64 0, i64 0
  %param_1.75471 = load i32, ptr addrspace(1) %param_1.7547, align 4, !invariant.load !339
  %7 = icmp ult i32 %param_1.75471, 4
  %param_1.7547212 = getelementptr inbounds i8, ptr addrspace(1) %param_1.7547, i64 4
  %param_1.75473 = load i32, ptr addrspace(1) %param_1.7547212, align 4, !invariant.load !339
  %8 = icmp ult i32 %param_1.75473, 192
  %9 = and i1 %7, %8
  %param_1.7547413 = getelementptr inbounds i8, ptr addrspace(1) %param_1.7547, i64 8
  %param_1.75475 = load i32, ptr addrspace(1) %param_1.7547413, align 4, !invariant.load !339
  %10 = icmp ult i32 %param_1.75475, 2
  %11 = and i1 %9, %10
  %12 = zext nneg i32 %param_1.75471 to i64
  %13 = zext nneg i32 %param_1.75473 to i64
  %14 = zext nneg i32 %param_1.75475 to i64
  %15 = getelementptr inbounds [4 x [192 x [2 x double]]], ptr addrspace(1) %arg08, i64 0, i64 %12, i64 %13, i64 %14
  br i1 %11, label %scatter.in_bounds-true, label %scatter.50.1.in_bounds-after

scatter.50.1.in_bounds-after:                     ; preds = %entry, %scatter.in_bounds-true
  ret void

scatter.in_bounds-true:                           ; preds = %entry
  %16 = atomicrmw fadd ptr addrspace(1) %15, double -1.000000e+00 seq_cst, align 8
  br label %scatter.50.1.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_slice_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(9216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(24) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg6) local_unnamed_addr #0 {
entry:
  %arg694 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg592 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg490 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg388 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg286 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg184 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg082 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !345
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !347
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %3 = udiv i16 %.lhs.trunc, 192
  %4 = mul i16 %3, 192
  %.decomposed = sub i16 %.lhs.trunc, %4
  %5 = zext nneg i16 %3 to i64
  %6 = zext nneg i16 %.decomposed to i64
  %7 = getelementptr inbounds [4 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg082, i64 0, i64 %5, i64 %6, i64 0, i64 0
  %8 = load i32, ptr addrspace(1) %7, align 4, !invariant.load !339
  %9 = sext i32 %8 to i64
  %10 = load <2 x i64>, ptr addrspace(1) %arg388, align 128, !invariant.load !339
  %11 = extractelement <2 x i64> %10, i32 0
  %12 = extractelement <2 x i64> %10, i32 1
  %13 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 4
  %14 = load i32, ptr addrspace(1) %13, align 4, !invariant.load !339
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 8
  %17 = load i32, ptr addrspace(1) %16, align 4, !invariant.load !339
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr addrspace(1) %arg388, i64 16
  %20 = load i64, ptr addrspace(1) %19, align 16, !invariant.load !339
  %narrow = tail call i32 @llvm.smax.i32(i32 %8, i32 0)
  %21 = tail call i32 @llvm.umin.i32(i32 %narrow, i32 3)
  %narrow58 = tail call i32 @llvm.smax.i32(i32 %14, i32 0)
  %22 = tail call i32 @llvm.umin.i32(i32 %narrow58, i32 191)
  %23 = icmp sgt i32 %17, 0
  %24 = zext nneg i32 %22 to i64
  %25 = zext nneg i32 %21 to i64
  %26 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg286, i64 0, i64 %24, i64 %25
  %.pre = load double, ptr addrspace(1) %26, align 8, !invariant.load !339
  br i1 %23, label %in_bounds-true, label %in_bounds-after

in_bounds-after:                                  ; preds = %entry, %in_bounds-true
  %pad_result_addr.0 = phi double [ %.pre, %in_bounds-true ], [ 0.000000e+00, %entry ]
  %27 = getelementptr inbounds [2 x [192 x [4 x double]]], ptr addrspace(1) %arg184, i64 0, i64 0, i64 %24, i64 %25
  %28 = load double, ptr addrspace(1) %27, align 8, !invariant.load !339
  %add.9442.i = fadd double %28, 0.000000e+00
  %29 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 6144
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !339
  %add.9442.i.1 = fadd double %add.9442.i, %30
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %add.9442.i.1) #11
  %32 = tail call i32 @llvm.nvvm.d2i.lo(double %add.9442.i.1) #11
  %33 = icmp slt i32 %31, 1048576
  %34 = fmul double %add.9442.i.1, 0x4350000000000000
  %35 = tail call i32 @llvm.nvvm.d2i.lo(double %34) #11
  %36 = tail call i32 @llvm.nvvm.d2i.hi(double %34) #11
  br i1 %33, label %37, label %38

37:                                               ; preds = %in_bounds-after
  br label %38

38:                                               ; preds = %37, %in_bounds-after
  %.0.i = phi double [ %34, %37 ], [ %add.9442.i.1, %in_bounds-after ]
  %ihi.0.i = phi i32 [ %36, %37 ], [ %31, %in_bounds-after ]
  %ilo.0.i = phi i32 [ %35, %37 ], [ %32, %in_bounds-after ]
  %e.0.i = phi i32 [ -1077, %37 ], [ -1023, %in_bounds-after ]
  %39 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %39, 2146435071
  br i1 %or.cond.i, label %40, label %87

40:                                               ; preds = %38
  %41 = lshr i32 %ihi.0.i, 20
  %42 = add nsw i32 %e.0.i, %41
  %43 = and i32 %ihi.0.i, 1048575
  %44 = or disjoint i32 %43, 1072693248
  %45 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %44) #11
  %46 = icmp ugt i32 %44, 1073127582
  %47 = tail call i32 @llvm.nvvm.d2i.lo(double %45) #11
  %48 = tail call i32 @llvm.nvvm.d2i.hi(double %45) #11
  %49 = add i32 %48, -1048576
  %50 = tail call double @llvm.nvvm.lohi.i2d(i32 %47, i32 %49) #11
  %spec.select = select i1 %46, double %50, double %45
  %51 = zext i1 %46 to i32
  %spec.select66 = add nsw i32 %42, %51
  %52 = fadd double %spec.select, -1.000000e+00
  %53 = fadd double %spec.select, 1.000000e+00
  %54 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %53) #11
  %55 = fneg double %53
  %56 = tail call double @llvm.fma.f64(double %55, double %54, double 1.000000e+00)
  %57 = tail call double @llvm.fma.f64(double %56, double %56, double %56)
  %58 = tail call double @llvm.fma.f64(double %57, double %54, double %54)
  %59 = fmul double %52, %58
  %60 = fadd double %59, %59
  %61 = fmul double %60, %60
  %62 = tail call double @llvm.fma.f64(double %61, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %63 = tail call double @llvm.fma.f64(double %62, double %61, double 0x3EF3B2669F02676F)
  %64 = tail call double @llvm.fma.f64(double %63, double %61, double 0x3F1745CBA9AB0956)
  %65 = tail call double @llvm.fma.f64(double %64, double %61, double 0x3F3C71C72D1B5154)
  %66 = tail call double @llvm.fma.f64(double %65, double %61, double 0x3F624924923BE72D)
  %67 = tail call double @llvm.fma.f64(double %66, double %61, double 0x3F8999999999A3C4)
  %68 = tail call double @llvm.fma.f64(double %67, double %61, double 0x3FB5555555555554)
  %69 = fsub double %52, %60
  %70 = fmul double %69, 2.000000e+00
  %71 = fneg double %60
  %72 = tail call double @llvm.fma.f64(double %71, double %52, double %70)
  %73 = fmul double %58, %72
  %74 = fmul double %61, %68
  %75 = tail call double @llvm.fma.f64(double %74, double %60, double %73)
  %76 = xor i32 %spec.select66, -2147483648
  %77 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 1127219200) #11
  %78 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #11
  %79 = fsub double %77, %78
  %80 = tail call double @llvm.fma.f64(double %79, double 0x3FE62E42FEFA39EF, double %60)
  %81 = fneg double %79
  %82 = tail call double @llvm.fma.f64(double %81, double 0x3FE62E42FEFA39EF, double %80)
  %83 = fsub double %82, %60
  %84 = fsub double %75, %83
  %85 = tail call double @llvm.fma.f64(double %79, double 0x3C7ABC9E3B39803F, double %84)
  %86 = fadd double %80, %85
  br label %__nv_log.exit

87:                                               ; preds = %38
  %88 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %89 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #11
  %90 = and i32 %89, 2147483647
  %91 = icmp eq i32 %90, 0
  %q.0.i = select i1 %91, double 0xFFF0000000000000, double %88
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %40, %87
  %q.1.i = phi double [ %86, %40 ], [ %q.0.i, %87 ]
  %92 = trunc i64 %15 to i32
  %93 = trunc i64 %9 to i32
  %94 = trunc i64 %18 to i32
  %95 = fcmp ole double %.pre, 0.000000e+00
  %maximum.59.i.1 = select i1 %95, double 0.000000e+00, double %.pre
  %96 = icmp sgt i32 %94, -1
  %97 = icmp sge i64 %20, %18
  %98 = and i1 %96, %97
  %99 = icmp sgt i32 %93, -1
  %100 = icmp sge i64 %11, %9
  %101 = and i1 %99, %100
  %102 = icmp sgt i32 %92, -1
  %103 = icmp sge i64 %12, %15
  %104 = and i1 %102, %103
  %105 = select i1 %98, i1 %104, i1 false
  %106 = select i1 %105, i1 %101, i1 false
  %107 = and i32 %1, 3
  %108 = lshr i32 %linear_index, 2
  %109 = zext nneg i32 %107 to i64
  %110 = zext nneg i32 %108 to i64
  %111 = getelementptr [4 x [192 x [2 x double]]], ptr addrspace(1) %arg490, i64 0, i64 %109, i64 %110, i64 0
  %112 = load <2 x double>, ptr addrspace(1) %111, align 16, !invariant.load !339
  %113 = extractelement <2 x double> %112, i32 0
  %114 = extractelement <2 x double> %112, i32 1
  %115 = getelementptr inbounds [2 x [192 x [4 x double]]], ptr addrspace(1) %arg184, i64 0, i64 0, i64 %110, i64 %109
  %116 = load double, ptr addrspace(1) %115, align 8, !invariant.load !339
  %add.9442.i63 = fadd double %116, 0.000000e+00
  %117 = getelementptr inbounds i8, ptr addrspace(1) %115, i64 6144
  %118 = load double, ptr addrspace(1) %117, align 8, !invariant.load !339
  %add.9442.i63.1 = fadd double %add.9442.i63, %118
  %add.9442.i62 = fadd double %113, 0.000000e+00
  %add.9442.i62.1 = fadd double %add.9442.i62, %114
  %119 = fneg double %add.9442.i62.1
  %subtract.875.9 = fsub double %pad_result_addr.0, %maximum.59.i.1
  %subtract.877.5 = fsub double %subtract.875.9, %q.1.i
  %120 = select i1 %106, double %subtract.877.5, double 0x7FF8000000000000
  %divide.2564.3.clone.1 = fdiv double %119, %add.9442.i63.1
  %multiply.11875.1.clone.1 = fmul double %divide.2564.3.clone.1, %118
  %add.10027.1.clone.1 = fadd double %114, %multiply.11875.1.clone.1
  %121 = zext nneg i32 %linear_index to i64
  %122 = getelementptr double, ptr addrspace(1) %arg592, i64 %121
  store double %120, ptr addrspace(1) %122, align 8
  %123 = getelementptr double, ptr addrspace(1) %arg694, i64 %121
  store double %add.10027.1.clone.1, ptr addrspace(1) %123, align 8
  ret void

in_bounds-true:                                   ; preds = %entry
  br label %in_bounds-after
}

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg10) local_unnamed_addr #6 {
entry:
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
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !349
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext i32 %thread.id.2 to i64
  %param_5.4078 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg561, i64 0, i64 %1
  %param_7.2706 = load double, ptr addrspace(1) %arg765, align 128
  %param_6.3421 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg663, i64 0, i64 %1
  %2 = add nuw nsw i32 %0, -32
  %3 = shl nuw nsw i64 %1, 3
  %4 = zext nneg i32 %thread.id.x to i64
  %5 = lshr i64 %4, 5
  %6 = shl nuw nsw i64 %5, 5
  %scevgep = getelementptr i8, ptr addrspace(1) %arg051, i64 %6
  %scevgep76 = getelementptr i8, ptr addrspace(1) %arg357, i64 %6
  %scevgep80 = getelementptr i8, ptr addrspace(1) %arg255, i64 %6
  %scevgep84 = getelementptr i8, ptr addrspace(1) %arg153, i64 %6
  %scevgep88 = getelementptr i8, ptr addrspace(1) %arg459, i64 %6
  %scevgep92 = getelementptr i8, ptr addrspace(1) %arg867, i64 %6
  %scevgep96 = getelementptr i8, ptr addrspace(1) %arg1071, i64 %6
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv97 = phi ptr addrspace(1) [ %scevgep96, %entry ], [ %scevgep98, %x_in_tile-after ]
  %lsr.iv93 = phi ptr addrspace(1) [ %scevgep92, %entry ], [ %scevgep94, %x_in_tile-after ]
  %lsr.iv89 = phi ptr addrspace(1) [ %scevgep88, %entry ], [ %scevgep90, %x_in_tile-after ]
  %lsr.iv85 = phi ptr addrspace(1) [ %scevgep84, %entry ], [ %scevgep86, %x_in_tile-after ]
  %lsr.iv81 = phi ptr addrspace(1) [ %scevgep80, %entry ], [ %scevgep82, %x_in_tile-after ]
  %lsr.iv77 = phi ptr addrspace(1) [ %scevgep76, %entry ], [ %scevgep78, %x_in_tile-after ]
  %lsr.iv73 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep74, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %2, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.049 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %7 = trunc i64 %1 to i32
  %8 = icmp ult i32 %7, 4
  br i1 %8, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %__nv_exp.exit39, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.9442.i48, %__nv_exp.exit39 ], [ %partial_reduction_result.049, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep74 = getelementptr i8, ptr addrspace(1) %lsr.iv73, i64 1024
  %scevgep78 = getelementptr i8, ptr addrspace(1) %lsr.iv77, i64 1024
  %scevgep82 = getelementptr i8, ptr addrspace(1) %lsr.iv81, i64 1024
  %scevgep86 = getelementptr i8, ptr addrspace(1) %lsr.iv85, i64 1024
  %scevgep90 = getelementptr i8, ptr addrspace(1) %lsr.iv89, i64 1024
  %scevgep94 = getelementptr i8, ptr addrspace(1) %lsr.iv93, i64 1024
  %scevgep98 = getelementptr i8, ptr addrspace(1) %lsr.iv97, i64 1024
  %9 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %9, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !350

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %1, i64 %10
  store double %partial_reduction_result.1, ptr addrspace(3) %11, align 8
  tail call void @llvm.nvvm.barrier0()
  %12 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache, i64 0, i64 %10, i64 %1
  %partial_reduction_result193435 = load <2 x i32>, ptr addrspace(3) %12, align 8
  %13 = extractelement <2 x i32> %partial_reduction_result193435, i64 0
  %14 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 16, i32 31)
  %15 = insertelement <2 x i32> poison, i32 %14, i64 0
  %16 = extractelement <2 x i32> %partial_reduction_result193435, i64 1
  %17 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %16, i32 16, i32 31)
  %18 = insertelement <2 x i32> %15, i32 %17, i64 1
  %19 = bitcast <2 x i32> %18 to double
  %20 = bitcast <2 x i32> %partial_reduction_result193435 to double
  %add.9442.i = fadd double %20, %19
  %21 = bitcast double %add.9442.i to <2 x i32>
  %22 = extractelement <2 x i32> %21, i64 0
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 8, i32 31)
  %24 = insertelement <2 x i32> poison, i32 %23, i64 0
  %25 = extractelement <2 x i32> %21, i64 1
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 8, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 1
  %28 = bitcast <2 x i32> %27 to double
  %add.9442.i44 = fadd double %add.9442.i, %28
  %29 = bitcast double %add.9442.i44 to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 4, i32 31)
  %32 = insertelement <2 x i32> poison, i32 %31, i64 0
  %33 = extractelement <2 x i32> %29, i64 1
  %34 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %33, i32 4, i32 31)
  %35 = insertelement <2 x i32> %32, i32 %34, i64 1
  %36 = bitcast <2 x i32> %35 to double
  %add.9442.i45 = fadd double %add.9442.i44, %36
  %37 = bitcast double %add.9442.i45 to <2 x i32>
  %38 = extractelement <2 x i32> %37, i64 0
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 2, i32 31)
  %40 = insertelement <2 x i32> poison, i32 %39, i64 0
  %41 = extractelement <2 x i32> %37, i64 1
  %42 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %41, i32 2, i32 31)
  %43 = insertelement <2 x i32> %40, i32 %42, i64 1
  %44 = bitcast <2 x i32> %43 to double
  %add.9442.i46 = fadd double %add.9442.i45, %44
  %45 = bitcast double %add.9442.i46 to <2 x i32>
  %46 = extractelement <2 x i32> %45, i64 0
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 1, i32 31)
  %48 = insertelement <2 x i32> poison, i32 %47, i64 0
  %49 = extractelement <2 x i32> %45, i64 1
  %50 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %49, i32 1, i32 31)
  %51 = insertelement <2 x i32> %48, i32 %50, i64 1
  %52 = bitcast <2 x i32> %51 to double
  %add.9442.i47 = fadd double %add.9442.i46, %52
  store double %add.9442.i47, ptr addrspace(3) %12, align 8
  %53 = and i32 %thread.id.x, 927
  %54 = icmp eq i32 %53, 0
  %output_element_address = getelementptr inbounds [4 x double], ptr addrspace(1) %arg969, i64 0, i64 %10
  br i1 %54, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %scevgep75 = getelementptr i8, ptr addrspace(1) %lsr.iv73, i64 %3
  %param_0.53582 = load double, ptr addrspace(1) %scevgep75, align 8, !invariant.load !339
  %add.9442.i48 = fadd double %partial_reduction_result.049, %param_0.53582
  %scevgep79 = getelementptr i8, ptr addrspace(1) %lsr.iv77, i64 %3
  %param_3.55133 = load double, ptr addrspace(1) %scevgep79, align 8, !invariant.load !339
  %55 = fcmp ole double %param_3.55133, -3.000000e+01
  %56 = select i1 %55, double -3.000000e+01, double %param_3.55133
  %57 = fcmp oge double %56, 3.000000e+01
  %58 = select i1 %57, double 3.000000e+01, double %56
  %59 = fneg double %58
  %60 = tail call double @llvm.fma.f64(double %59, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %61 = tail call i32 @llvm.nvvm.d2i.lo(double %60) #11
  %62 = tail call double @llvm.nvvm.add.rn.d(double %60, double 0xC338000000000000) #11
  %63 = tail call double @llvm.fma.f64(double %62, double 0xBFE62E42FEFA39EF, double %59)
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
  %76 = tail call i32 @llvm.nvvm.d2i.lo(double %75) #11
  %77 = tail call i32 @llvm.nvvm.d2i.hi(double %75) #11
  %78 = shl i32 %61, 20
  %79 = add i32 %77, %78
  %80 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 %79) #11
  %81 = tail call i32 @llvm.nvvm.d2i.hi(double %59) #11
  %82 = bitcast i32 %81 to float
  %83 = tail call float @llvm.nvvm.fabs.f(float %82) #11
  %84 = fcmp olt float %83, 0x4010C46560000000
  br i1 %84, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true
  %85 = fcmp ogt double %58, 0.000000e+00
  %86 = fsub double 0x7FF0000000000000, %58
  %z.0.i = select i1 %85, double 0.000000e+00, double %86
  %87 = fcmp olt float %83, 0x4010E90000000000
  br i1 %87, label %88, label %__nv_exp.exit

88:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %89 = sdiv i32 %61, 2
  %90 = shl i32 %89, 20
  %91 = add i32 %77, %90
  %92 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 %91) #11
  %93 = sub nsw i32 %61, %89
  %94 = shl i32 %93, 20
  %95 = add nsw i32 %94, 1072693248
  %96 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %95) #11
  %97 = fmul double %96, %92
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true, %__internal_fast_icmp_abs_lt.exit.i, %88
  %z.2.i = phi double [ %80, %x_in_tile-true ], [ %97, %88 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.10024.3 = fadd double %z.2.i, 1.000000e+00
  %divide.2563.3 = fdiv double 1.000000e+00, %add.10024.3
  %subtract.873.2 = fsub double 1.000000e+00, %divide.2563.3
  %scevgep83 = getelementptr i8, ptr addrspace(1) %lsr.iv81, i64 %3
  %param_2.62124 = load double, ptr addrspace(1) %scevgep83, align 8, !invariant.load !339
  %multiply.11871.2 = fmul double %param_2.62124, %subtract.873.2
  %scevgep87 = getelementptr i8, ptr addrspace(1) %lsr.iv85, i64 %3
  %param_1.75295 = load double, ptr addrspace(1) %scevgep87, align 8, !invariant.load !339
  %multiply.11872.2 = fmul double %divide.2563.3, %param_1.75295
  %subtract.874.1 = fsub double %multiply.11871.2, %multiply.11872.2
  %multiply.11886.1 = fmul double %param_0.53582, %subtract.874.1
  %param_5.40786 = load double, ptr addrspace(1) %param_5.4078, align 8, !invariant.load !339
  %param_6.34217 = load double, ptr addrspace(1) %param_6.3421, align 8, !invariant.load !339
  %multiply.11866.15.clone.1 = fmul double %param_7.2706, %param_6.34217
  %add.10019.15.clone.1 = fadd double %param_5.40786, %multiply.11866.15.clone.1
  %98 = tail call double @llvm.fma.f64(double %add.10019.15.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %99 = tail call i32 @llvm.nvvm.d2i.lo(double %98) #11
  %100 = tail call double @llvm.nvvm.add.rn.d(double %98, double 0xC338000000000000) #11
  %101 = tail call double @llvm.fma.f64(double %100, double 0xBFE62E42FEFA39EF, double %add.10019.15.clone.1)
  %102 = tail call double @llvm.fma.f64(double %100, double 0xBC7ABC9E3B39803F, double %101)
  %103 = tail call double @llvm.fma.f64(double %102, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %104 = tail call double @llvm.fma.f64(double %103, double %102, double 0x3EC71DEE62401315)
  %105 = tail call double @llvm.fma.f64(double %104, double %102, double 0x3EFA01997C89EB71)
  %106 = tail call double @llvm.fma.f64(double %105, double %102, double 0x3F2A01A014761F65)
  %107 = tail call double @llvm.fma.f64(double %106, double %102, double 0x3F56C16C1852B7AF)
  %108 = tail call double @llvm.fma.f64(double %107, double %102, double 0x3F81111111122322)
  %109 = tail call double @llvm.fma.f64(double %108, double %102, double 0x3FA55555555502A1)
  %110 = tail call double @llvm.fma.f64(double %109, double %102, double 0x3FC5555555555511)
  %111 = tail call double @llvm.fma.f64(double %110, double %102, double 0x3FE000000000000B)
  %112 = tail call double @llvm.fma.f64(double %111, double %102, double 1.000000e+00)
  %113 = tail call double @llvm.fma.f64(double %112, double %102, double 1.000000e+00)
  %114 = tail call i32 @llvm.nvvm.d2i.lo(double %113) #11
  %115 = tail call i32 @llvm.nvvm.d2i.hi(double %113) #11
  %116 = shl i32 %99, 20
  %117 = add i32 %115, %116
  %118 = tail call double @llvm.nvvm.lohi.i2d(i32 %114, i32 %117) #11
  %119 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10019.15.clone.1) #11
  %120 = bitcast i32 %119 to float
  %121 = tail call float @llvm.nvvm.fabs.f(float %120) #11
  %122 = fcmp olt float %121, 0x4010C46560000000
  br i1 %122, label %__nv_exp.exit39, label %__internal_fast_icmp_abs_lt.exit.i36

__internal_fast_icmp_abs_lt.exit.i36:             ; preds = %__nv_exp.exit
  %123 = fcmp olt double %add.10019.15.clone.1, 0.000000e+00
  %124 = fadd double %add.10019.15.clone.1, 0x7FF0000000000000
  %z.0.i37 = select i1 %123, double 0.000000e+00, double %124
  %125 = fcmp olt float %121, 0x4010E90000000000
  br i1 %125, label %126, label %__nv_exp.exit39

126:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i36
  %127 = sdiv i32 %99, 2
  %128 = shl i32 %127, 20
  %129 = add i32 %115, %128
  %130 = tail call double @llvm.nvvm.lohi.i2d(i32 %114, i32 %129) #11
  %131 = sub nsw i32 %99, %127
  %132 = shl i32 %131, 20
  %133 = add nsw i32 %132, 1072693248
  %134 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %133) #11
  %135 = fmul double %134, %130
  br label %__nv_exp.exit39

__nv_exp.exit39:                                  ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i36, %126
  %z.2.i38 = phi double [ %118, %__nv_exp.exit ], [ %135, %126 ], [ %z.0.i37, %__internal_fast_icmp_abs_lt.exit.i36 ]
  %multiply.11877.15.clone.1 = fmul double %param_0.53582, %z.2.i38
  %136 = fneg double %multiply.11877.15.clone.1
  %137 = fmul double %param_2.62124, %136
  %138 = fmul double %param_1.75295, %multiply.11877.15.clone.1
  %add.10029.7.clone.1 = fsub double %137, %138
  %multiply.11880.1.clone.1 = fmul double %divide.2563.3, %subtract.873.2
  %multiply.11881.5.clone.1 = fmul double %multiply.11880.1.clone.1, %add.10029.7.clone.1
  %compare.2743.1.clone.1 = fcmp oeq double %56, %58
  %scevgep91 = getelementptr i8, ptr addrspace(1) %lsr.iv89, i64 %3
  %param_4.502014 = load double, ptr addrspace(1) %scevgep91, align 8, !invariant.load !339
  %139 = select i1 %compare.2743.1.clone.1, double 1.000000e+00, double %param_4.502014
  %compare.2744.1.clone.1 = fcmp oeq double %58, 3.000000e+01
  %140 = select i1 %compare.2744.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.2565.5.clone.1 = fdiv double %139, %140
  %multiply.11882.3.clone.1 = fmul double %divide.2565.5.clone.1, %multiply.11881.5.clone.1
  %compare.2745.1.clone.1 = fcmp oeq double %param_3.55133, %56
  %141 = select i1 %compare.2745.1.clone.1, double 1.000000e+00, double %param_4.502014
  %compare.2746.1.clone.1 = fcmp oeq double %56, -3.000000e+01
  %142 = select i1 %compare.2746.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.2566.3.clone.1 = fdiv double %141, %142
  %multiply.11883.1.clone.1 = fmul double %divide.2566.3.clone.1, %multiply.11882.3.clone.1
  %scevgep95 = getelementptr i8, ptr addrspace(1) %lsr.iv93, i64 %3
  store double %multiply.11886.1, ptr addrspace(1) %scevgep95, align 8
  %scevgep99 = getelementptr i8, ptr addrspace(1) %lsr.iv97, i64 %3
  store double %multiply.11883.1.clone.1, ptr addrspace(1) %scevgep99, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i47, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #7

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @loop_broadcast_fusion_57(ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg0) local_unnamed_addr #2 {
entry:
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_17(ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  store double %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_15(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %1 = sub i64 191, %0
  %2 = icmp slt i64 %1, 0
  %3 = sub i64 383, %0
  %4 = select i1 %2, i64 %3, i64 %1
  %5 = trunc i64 %4 to i32
  %6 = tail call i32 @llvm.smax.i32(i32 %5, i32 0)
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 191)
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds [192 x i32], ptr addrspace(1) %arg01, i64 0, i64 %8
  %10 = load i32, ptr addrspace(1) %9, align 4, !invariant.load !339
  store i32 %10, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_19(ptr noalias nocapture readonly align 128 dereferenceable(768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !339
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
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !339
  %13 = getelementptr i8, ptr addrspace(1) %arg26, i64 %10
  store i8 %12, ptr addrspace(1) %13, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_slice_fusion_18(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg2) local_unnamed_addr #0 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i64, ptr addrspace(1) %arg14, align 128, !invariant.load !339
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
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !339
  %13 = getelementptr double, ptr addrspace(1) %arg26, i64 %10
  store double %12, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_7(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg22, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg23, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg26, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg27, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg28) local_unnamed_addr #0 {
entry:
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i64, ptr addrspace(1) %arg2158, align 128, !invariant.load !339
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg934, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !339
  %13 = getelementptr double, ptr addrspace(1) %arg322, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !339
  %15 = trunc i8 %12 to i1
  %16 = select i1 %15, double %14, double 0.000000e+00
  %17 = getelementptr double, ptr addrspace(1) %arg2056, i64 %10
  %18 = load double, ptr addrspace(1) %17, align 8, !invariant.load !339
  %19 = select i1 %15, double %18, double 0.000000e+00
  %20 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1954, i64 0, i64 %9, i64 %10
  %21 = load i8, ptr addrspace(1) %20, align 1, !invariant.load !339
  %22 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1852, i64 0, i64 %9, i64 %10
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !339
  %24 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1750, i64 0, i64 %9, i64 %10
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !339
  %26 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg1648, i64 0, i64 %9, i64 %10
  %27 = load i32, ptr addrspace(1) %26, align 4, !invariant.load !339
  %28 = icmp eq i32 %27, 1
  %29 = getelementptr double, ptr addrspace(1) %arg1546, i64 %10
  %30 = load double, ptr addrspace(1) %29, align 8, !invariant.load !339
  %31 = trunc i8 %25 to i1
  %32 = select i1 %31, i1 %28, i1 false
  %33 = select i1 %32, i1 %15, i1 false
  %34 = select i1 %33, double %30, double 0.000000e+00
  %35 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1138, i64 0, i64 %9, i64 %10
  %36 = load double, ptr addrspace(1) %35, align 8, !invariant.load !339
  %multiply.11756.11 = fmul double %36, %34
  %37 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1444, i64 0, i64 %9, i64 %10
  %38 = load double, ptr addrspace(1) %37, align 8, !invariant.load !339
  %multiply.11758.7 = fmul double %38, %multiply.11756.11
  %39 = fmul double %23, %multiply.11756.11
  %add.9923.9 = fsub double %multiply.11758.7, %39
  %40 = trunc i8 %21 to i1
  %41 = select i1 %40, double %add.9923.9, double 0.000000e+00
  %42 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1342, i64 0, i64 %9, i64 %10
  %43 = load double, ptr addrspace(1) %42, align 8, !invariant.load !339
  %44 = getelementptr double, ptr addrspace(1) %arg1240, i64 %10
  %45 = load double, ptr addrspace(1) %44, align 8, !invariant.load !339
  %46 = select i1 %15, double %45, double 0.000000e+00
  %multiply.11759.19 = fmul double %36, %46
  %47 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1036, i64 0, i64 %9, i64 %10
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !339
  %multiply.11760.11 = fmul double %48, %multiply.11759.19
  %multiply.11761.7 = fmul double %43, %multiply.11760.11
  %add.9924.7 = fadd double %41, %multiply.11761.7
  %add.9925.5 = fadd double %19, %add.9924.7
  %49 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg118, i64 0, i64 %9, i64 %10
  %50 = load double, ptr addrspace(1) %49, align 8, !invariant.load !339
  %51 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg220, i64 0, i64 %9, i64 %10
  %52 = load double, ptr addrspace(1) %51, align 8, !invariant.load !339
  %53 = fneg double %add.9925.5
  %54 = fmul double %50, %53
  %55 = fmul double %52, %54
  %add.9927.3 = fadd double %16, %55
  %56 = getelementptr double, ptr addrspace(1) %arg526, i64 %10
  %57 = load double, ptr addrspace(1) %56, align 8, !invariant.load !339
  %58 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg628, i64 0, i64 %9, i64 %10
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !339
  %add.9922.9 = fadd double %57, %59
  %60 = select i1 %15, double %add.9922.9, double 0.000000e+00
  %61 = getelementptr double, ptr addrspace(1) %arg832, i64 %10
  %62 = load double, ptr addrspace(1) %61, align 8, !invariant.load !339
  %63 = select i1 %15, double %62, double 0.000000e+00
  %multiply.11764.9 = fmul double %52, %add.9925.5
  %64 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg730, i64 0, i64 %9, i64 %10
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !339
  %multiply.11765.7 = fmul double %multiply.11764.9, %65
  %add.9928.5 = fadd double %63, %multiply.11765.7
  %add.9929.5 = fadd double %60, %add.9928.5
  %66 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg424, i64 0, i64 %9, i64 %10
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !339
  %68 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg016, i64 0, i64 %9, i64 %10
  %69 = load double, ptr addrspace(1) %68, align 8, !invariant.load !339
  %70 = fneg double %add.9929.5
  %71 = fmul double %67, %70
  %72 = fmul double %50, %71
  %73 = fmul double %69, %72
  %add.9930.1 = fadd double %add.9927.3, %73
  %74 = getelementptr double, ptr addrspace(1) %arg2260, i64 %10
  %75 = load double, ptr addrspace(1) %74, align 8, !invariant.load !339
  %76 = select i1 %15, double 0.000000e+00, double %75
  %77 = getelementptr double, ptr addrspace(1) %arg2362, i64 %10
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !339
  %79 = select i1 %15, double 0.000000e+00, double %78
  %80 = getelementptr double, ptr addrspace(1) %arg2464, i64 %10
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !339
  %82 = select i1 %15, double 0.000000e+00, double %81
  %83 = getelementptr double, ptr addrspace(1) %arg2566, i64 %10
  store double %add.9930.1, ptr addrspace(1) %83, align 8
  %84 = getelementptr double, ptr addrspace(1) %arg2668, i64 %10
  store double %76, ptr addrspace(1) %84, align 8
  %85 = getelementptr double, ptr addrspace(1) %arg2770, i64 %10
  store double %79, ptr addrspace(1) %85, align 8
  %86 = getelementptr double, ptr addrspace(1) %arg2872, i64 %10
  store double %82, ptr addrspace(1) %86, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_multiply_negate_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #0 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg25, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !339
  %7 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %9 = fneg double %6
  %10 = fmul double %8, %9
  %multiply.11751.1.clone.1 = fmul double %4, %10
  %multiply.11752.1.clone.1 = fmul double %8, %multiply.11751.1.clone.1
  %multiply.11753.1 = fmul double %3, %multiply.11752.1.clone.1
  %11 = fneg double %10
  %12 = fmul double %8, %11
  %13 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.11753.1, ptr addrspace(1) %13, align 8
  %14 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %multiply.11752.1.clone.1, ptr addrspace(1) %14, align 8
  %15 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double %12, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_broadcast_multiply_select_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #0 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8, !invariant.load !339
  %4 = getelementptr i8, ptr addrspace(1) %arg25, i64 %1
  %5 = load i8, ptr addrspace(1) %4, align 1, !invariant.load !339
  %6 = getelementptr double, ptr addrspace(1) %arg37, i64 %1
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %8 = trunc i8 %5 to i1
  %9 = select i1 %8, double %7, double 0.000000e+00
  %10 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %multiply.11754.1 = fmul double %9, %10
  %multiply.11755.1 = fmul double %3, %multiply.11754.1
  %11 = getelementptr double, ptr addrspace(1) %arg49, i64 %1
  store double %multiply.11755.1, ptr addrspace(1) %11, align 8
  %12 = getelementptr double, ptr addrspace(1) %arg511, i64 %1
  store double %9, ptr addrspace(1) %12, align 8
  %13 = getelementptr double, ptr addrspace(1) %arg613, i64 %1
  store double 0.000000e+00, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_select_fusion_6(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg8, ptr noalias nocapture align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg13, ptr noalias nocapture align 128 dereferenceable(32) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(3072) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg18, ptr noalias nocapture align 128 dereferenceable(32) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg20, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg21, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg22, ptr noalias nocapture align 128 dereferenceable(32) %arg23, ptr noalias nocapture align 128 dereferenceable(32) %arg24, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg25, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg26, ptr noalias nocapture align 128 dereferenceable(32) %arg27, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg28, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg29, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg30, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg31, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg32, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg33, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg34, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg35, ptr noalias nocapture align 128 dereferenceable(32) %arg36, ptr noalias nocapture align 128 dereferenceable(32) %arg37, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg38, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg39, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg40, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg41, ptr noalias nocapture align 128 dereferenceable(32) %arg42, ptr noalias nocapture readnone align 128 dereferenceable(768) %arg43, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg44, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg45, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg46, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg47, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg48, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg49, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg50, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg51, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg52, ptr noalias nocapture readonly align 128 dereferenceable(1536) %arg53, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg54, ptr noalias nocapture align 128 dereferenceable(32) %arg55, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg56, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg57, ptr noalias nocapture align 128 dereferenceable(32) %arg58, ptr noalias nocapture align 128 dereferenceable(32) %arg59, ptr noalias nocapture align 128 dereferenceable(32) %arg60, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg61, ptr noalias nocapture align 128 dereferenceable(32) %arg62, ptr noalias nocapture align 128 dereferenceable(32) %arg63, ptr noalias nocapture align 128 dereferenceable(32) %arg64, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg65, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg66, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg67, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg68, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg69, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg70, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg71, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg72, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg73, ptr noalias nocapture readonly align 128 dereferenceable(768) %arg74, ptr noalias nocapture align 128 dereferenceable(32) %arg75, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg76) local_unnamed_addr #0 {
entry:
  %arg76203 = addrspacecast ptr %arg76 to ptr addrspace(1)
  %arg75201 = addrspacecast ptr %arg75 to ptr addrspace(1)
  %arg74199 = addrspacecast ptr %arg74 to ptr addrspace(1)
  %arg73197 = addrspacecast ptr %arg73 to ptr addrspace(1)
  %arg72195 = addrspacecast ptr %arg72 to ptr addrspace(1)
  %arg71193 = addrspacecast ptr %arg71 to ptr addrspace(1)
  %arg70191 = addrspacecast ptr %arg70 to ptr addrspace(1)
  %arg69189 = addrspacecast ptr %arg69 to ptr addrspace(1)
  %arg68187 = addrspacecast ptr %arg68 to ptr addrspace(1)
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i64, ptr addrspace(1) %arg255, align 128, !invariant.load !339
  %2 = sub i64 191, %1
  %3 = icmp slt i64 %2, 0
  %4 = sub i64 383, %1
  %5 = select i1 %3, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.smax.i32(i32 %6, i32 0)
  %8 = tail call i32 @llvm.umin.i32(i32 %7, i32 191)
  %9 = zext nneg i32 %8 to i64
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg153, i64 0, i64 %9, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !339
  %13 = getelementptr double, ptr addrspace(1) %arg051, i64 %10
  %14 = load double, ptr addrspace(1) %13, align 8
  %15 = trunc i8 %12 to i1
  %16 = select i1 %15, double 0.000000e+00, double %14
  %17 = getelementptr double, ptr addrspace(1) %arg969, i64 %10
  %18 = load double, ptr addrspace(1) %17, align 8
  %19 = select i1 %15, double 0.000000e+00, double %18
  %20 = getelementptr double, ptr addrspace(1) %arg561, i64 %10
  %21 = load double, ptr addrspace(1) %20, align 8, !invariant.load !339
  %22 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg2193, i64 0, i64 %9, i64 %10
  %23 = load double, ptr addrspace(1) %22, align 8, !invariant.load !339
  %24 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg2091, i64 0, i64 %9, i64 %10
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !339
  %26 = getelementptr double, ptr addrspace(1) %arg37125, i64 %10
  %27 = load double, ptr addrspace(1) %26, align 8
  %28 = select i1 %15, double %27, double 0.000000e+00
  %29 = getelementptr double, ptr addrspace(1) %arg36123, i64 %10
  %30 = load double, ptr addrspace(1) %29, align 8
  %31 = select i1 %15, double %30, double 0.000000e+00
  %32 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1887, i64 0, i64 %9, i64 %10
  %33 = load i8, ptr addrspace(1) %32, align 1, !invariant.load !339
  %34 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg35121, i64 0, i64 %9, i64 %10
  %35 = load double, ptr addrspace(1) %34, align 8, !invariant.load !339
  %36 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg1683, i64 0, i64 %9, i64 %10
  %37 = load i8, ptr addrspace(1) %36, align 1, !invariant.load !339
  %38 = getelementptr inbounds [192 x [4 x i32]], ptr addrspace(1) %arg1581, i64 0, i64 %9, i64 %10
  %39 = load i32, ptr addrspace(1) %38, align 4, !invariant.load !339
  %40 = icmp eq i32 %39, 1
  %41 = getelementptr double, ptr addrspace(1) %arg1479, i64 %10
  %42 = load double, ptr addrspace(1) %41, align 8
  %43 = select i1 %15, double %42, double 0.000000e+00
  %44 = trunc i8 %37 to i1
  %45 = select i1 %44, i1 %40, i1 false
  %46 = select i1 %45, double %43, double 0.000000e+00
  %47 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1377, i64 0, i64 %9, i64 %10
  %48 = load double, ptr addrspace(1) %47, align 8, !invariant.load !339
  %multiply.11756.13.clone.1 = fmul double %48, %46
  %49 = fneg double %multiply.11756.13.clone.1
  %50 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg34119, i64 0, i64 %9, i64 %10
  %51 = load double, ptr addrspace(1) %50, align 8, !invariant.load !339
  %multiply.11758.9.clone.1 = fmul double %51, %multiply.11756.13.clone.1
  %52 = fmul double %35, %multiply.11756.13.clone.1
  %add.9923.11.clone.1 = fsub double %multiply.11758.9.clone.1, %52
  %53 = trunc i8 %33 to i1
  %54 = select i1 %53, double %add.9923.11.clone.1, double 0.000000e+00
  %55 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg33117, i64 0, i64 %9, i64 %10
  %56 = load double, ptr addrspace(1) %55, align 8, !invariant.load !339
  %57 = select i1 %15, double %18, double 0.000000e+00
  %multiply.11759.21.clone.1 = fmul double %57, %48
  %58 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg867, i64 0, i64 %9, i64 %10
  %59 = load double, ptr addrspace(1) %58, align 8, !invariant.load !339
  %multiply.11760.13.clone.1 = fmul double %multiply.11759.21.clone.1, %59
  %multiply.11761.9.clone.1 = fmul double %56, %multiply.11760.13.clone.1
  %add.9924.9.clone.1 = fadd double %54, %multiply.11761.9.clone.1
  %add.9925.7.clone.1 = fadd double %31, %add.9924.9.clone.1
  %60 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg32115, i64 0, i64 %9, i64 %10
  %61 = load double, ptr addrspace(1) %60, align 8, !invariant.load !339
  %multiply.11779.13.clone.1 = fmul double %61, %add.9925.7.clone.1
  %62 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg31113, i64 0, i64 %9, i64 %10
  %63 = load double, ptr addrspace(1) %62, align 8, !invariant.load !339
  %divide.2542.5.clone.1 = fdiv double %add.9925.7.clone.1, %63
  %add.9953.11.clone.1 = fadd double %multiply.11779.13.clone.1, %divide.2542.5.clone.1
  %add.9955.9.clone.1 = fadd double %28, %add.9953.11.clone.1
  %64 = getelementptr double, ptr addrspace(1) %arg30111, i64 %10
  %65 = load double, ptr addrspace(1) %64, align 8, !invariant.load !339
  %add.9956.7.clone.1 = fadd double %65, %add.9955.9.clone.1
  %66 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg29109, i64 0, i64 %9, i64 %10
  %67 = load double, ptr addrspace(1) %66, align 8, !invariant.load !339
  %68 = getelementptr double, ptr addrspace(1) %arg1989, i64 %10
  %69 = load double, ptr addrspace(1) %68, align 8
  %70 = select i1 %15, double %69, double 0.000000e+00
  %71 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1785, i64 0, i64 %9, i64 %10
  %72 = load double, ptr addrspace(1) %71, align 8, !invariant.load !339
  %73 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1275, i64 0, i64 %9, i64 %10
  %74 = load double, ptr addrspace(1) %73, align 8, !invariant.load !339
  %multiply.11780.9.clone.1 = fmul double %74, %49
  %multiply.11781.15.clone.1 = fmul double %72, %multiply.11780.9.clone.1
  %75 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1173, i64 0, i64 %9, i64 %10
  %76 = load double, ptr addrspace(1) %75, align 8, !invariant.load !339
  %multiply.11782.11.clone.1 = fmul double %multiply.11756.13.clone.1, %74
  %77 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg1071, i64 0, i64 %9, i64 %10
  %78 = load double, ptr addrspace(1) %77, align 8, !invariant.load !339
  %multiply.11783.9.clone.1 = fmul double %multiply.11782.11.clone.1, %78
  %multiply.11784.7.clone.1 = fmul double %76, %multiply.11783.9.clone.1
  %add.9957.13.clone.1 = fadd double %multiply.11781.15.clone.1, %multiply.11784.7.clone.1
  %multiply.11785.11.clone.1 = fmul double %multiply.11756.13.clone.1, 5.000000e-01
  %multiply.11786.9.clone.1 = fmul double %multiply.11785.11.clone.1, %78
  %multiply.11787.7.clone.1 = fmul double %76, %multiply.11786.9.clone.1
  %add.9958.11.clone.1 = fadd double %multiply.11787.7.clone.1, %add.9957.13.clone.1
  %79 = select i1 %53, double %add.9958.11.clone.1, double 0.000000e+00
  %multiply.11788.9.clone.1 = fmul double %multiply.11760.13.clone.1, %74
  %multiply.11789.7.clone.1 = fmul double %76, %multiply.11788.9.clone.1
  %add.9959.9.clone.1 = fadd double %multiply.11789.7.clone.1, %79
  %add.9960.7.clone.1 = fadd double %70, %add.9959.9.clone.1
  %80 = getelementptr double, ptr addrspace(1) %arg357, i64 %10
  %81 = load double, ptr addrspace(1) %80, align 8, !invariant.load !339
  %add.9961.5.clone.1 = fadd double %81, %add.9960.7.clone.1
  %multiply.11790.3.clone.1 = fmul double %67, %add.9961.5.clone.1
  %add.9962.5.clone.1 = fadd double %add.9956.7.clone.1, %multiply.11790.3.clone.1
  %82 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg28107, i64 0, i64 %9, i64 %10
  %83 = load double, ptr addrspace(1) %82, align 8, !invariant.load !339
  %84 = fneg double %add.9962.5.clone.1
  %85 = fmul double %83, %84
  %86 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg765, i64 0, i64 %9, i64 %10
  %87 = load double, ptr addrspace(1) %86, align 8, !invariant.load !339
  %multiply.11794.9.clone.1 = fmul double %87, %add.9961.5.clone.1
  %add.9970.7.clone.1 = fadd double %multiply.11794.9.clone.1, %85
  %88 = trunc i8 %25 to i1
  %89 = select i1 %88, double %add.9970.7.clone.1, double 0.000000e+00
  %90 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg663, i64 0, i64 %9, i64 %10
  %91 = load double, ptr addrspace(1) %90, align 8, !invariant.load !339
  %multiply.11795.3.clone.1 = fmul double %91, %89
  %multiply.11796.5.clone.1 = fmul double %23, %multiply.11795.3.clone.1
  %add.9973.3.clone.1 = fadd double %21, %multiply.11796.5.clone.1
  %92 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg459, i64 0, i64 %9, i64 %10
  %93 = load double, ptr addrspace(1) %92, align 8, !invariant.load !339
  %94 = select i1 %15, double %14, double 0.000000e+00
  %add.9974.3.clone.1 = fadd double %94, %57
  %add.9975.1.clone.1 = fadd double %add.9974.3.clone.1, %81
  %multiply.11797.5.clone.1 = fmul double %add.9975.1.clone.1, %93
  %add.9976.3.clone.1 = fadd double %multiply.11797.5.clone.1, %add.9973.3.clone.1
  %add.9977.1.clone.1 = fadd double %19, %add.9976.3.clone.1
  %95 = getelementptr double, ptr addrspace(1) %arg2397, i64 %10
  %96 = load double, ptr addrspace(1) %95, align 8
  %add.9969.3.clone.1 = fadd double %96, 0.000000e+00
  %97 = getelementptr double, ptr addrspace(1) %arg2295, i64 %10
  %98 = load double, ptr addrspace(1) %97, align 8, !invariant.load !339
  %add.9971.1.clone.1 = fadd double %98, %multiply.11795.3.clone.1
  %add.9972.1.clone.1 = fadd double %add.9969.3.clone.1, %add.9971.1.clone.1
  %99 = getelementptr double, ptr addrspace(1) %arg2499, i64 %10
  %100 = load double, ptr addrspace(1) %99, align 8
  %101 = select i1 %15, double 0.000000e+00, double %100
  %102 = getelementptr double, ptr addrspace(1) %arg27105, i64 %10
  %103 = load double, ptr addrspace(1) %102, align 8
  %104 = select i1 %15, double 0.000000e+00, double %103
  %105 = getelementptr double, ptr addrspace(1) %arg25101, i64 %10
  %106 = load double, ptr addrspace(1) %105, align 8, !invariant.load !339
  %107 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg26103, i64 0, i64 %9, i64 %10
  %108 = load double, ptr addrspace(1) %107, align 8, !invariant.load !339
  %109 = select i1 %15, double %100, double 0.000000e+00
  %add.9963.3.clone.1 = fadd double %81, %109
  %110 = fneg double %add.9963.3.clone.1
  %111 = fmul double %108, %110
  %112 = fmul double %85, %108
  %add.9964.5.clone.1 = fsub double %111, %112
  %add.9965.3.clone.1 = fadd double %106, %add.9964.5.clone.1
  %add.9966.1.clone.1 = fadd double %104, %add.9965.3.clone.1
  %113 = select i1 %15, double 0.000000e+00, double %69
  %114 = getelementptr double, ptr addrspace(1) %arg42135, i64 %10
  %115 = load double, ptr addrspace(1) %114, align 8
  %add.9993.3.clone.1 = fadd double %115, 0.000000e+00
  %116 = getelementptr inbounds [192 x [4 x [1 x i8]]], ptr addrspace(1) %arg41133, i64 0, i64 %9, i64 %10, i64 0
  %117 = load i8, ptr addrspace(1) %116, align 1, !invariant.load !339
  %118 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg40131, i64 0, i64 %9, i64 %10
  %119 = load double, ptr addrspace(1) %118, align 8, !invariant.load !339
  %multiply.11811.15.clone.1 = fmul double %multiply.11780.9.clone.1, %119
  %multiply.11812.13.clone.1 = fmul double %multiply.11811.15.clone.1, 5.000000e-01
  %120 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg39129, i64 0, i64 %9, i64 %10
  %121 = load double, ptr addrspace(1) %120, align 8, !invariant.load !339
  %multiply.11813.11.clone.1 = fmul double %121, %multiply.11812.13.clone.1
  %multiply.11814.11.clone.1 = fmul double %multiply.11783.9.clone.1, %119
  %add.9994.9.clone.1 = fadd double %multiply.11814.11.clone.1, %multiply.11813.11.clone.1
  %multiply.11815.9.clone.1 = fmul double %multiply.11786.9.clone.1, %119
  %add.9995.7.clone.1 = fadd double %multiply.11815.9.clone.1, %add.9994.9.clone.1
  %122 = trunc i8 %117 to i1
  %123 = select i1 %122, double %add.9995.7.clone.1, double 0.000000e+00
  %multiply.11816.7.clone.1 = fmul double %multiply.11788.9.clone.1, %119
  %add.9996.5.clone.1 = fadd double %multiply.11816.7.clone.1, %123
  %124 = getelementptr double, ptr addrspace(1) %arg38127, i64 %10
  %125 = load double, ptr addrspace(1) %124, align 8, !invariant.load !339
  %add.9997.3.clone.1 = fadd double %125, %add.9996.5.clone.1
  %add.9998.1.clone.1 = fadd double %add.9993.3.clone.1, %add.9997.3.clone.1
  %126 = getelementptr double, ptr addrspace(1) %arg60171, i64 %10
  %127 = load double, ptr addrspace(1) %126, align 8
  %128 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg61173, i64 0, i64 %9, i64 %10
  %129 = load double, ptr addrspace(1) %128, align 8, !invariant.load !339
  %add.9922.5.clone.1 = fadd double %127, %129
  %130 = select i1 %15, double 0.000000e+00, double %add.9922.5.clone.1
  %131 = getelementptr double, ptr addrspace(1) %arg59169, i64 %10
  %132 = load double, ptr addrspace(1) %131, align 8
  %133 = select i1 %15, double %132, double 0.000000e+00
  %134 = getelementptr double, ptr addrspace(1) %arg58167, i64 %10
  %135 = load double, ptr addrspace(1) %134, align 8
  %136 = select i1 %15, double %135, double 0.000000e+00
  %multiply.11764.7.clone.1 = fmul double %add.9925.7.clone.1, %87
  %137 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg57165, i64 0, i64 %9, i64 %10
  %138 = load double, ptr addrspace(1) %137, align 8, !invariant.load !339
  %multiply.11765.5.clone.1 = fmul double %multiply.11764.7.clone.1, %138
  %add.9928.3.clone.1 = fadd double %136, %multiply.11765.5.clone.1
  %add.9932.3.clone.1 = fsub double %133, %add.9928.3.clone.1
  %139 = select i1 %15, double %add.9922.5.clone.1, double 0.000000e+00
  %add.9929.3.clone.1 = fadd double %139, %add.9928.3.clone.1
  %add.9933.3.clone.1 = fadd double %81, %add.9929.3.clone.1
  %add.9934.3.clone.1 = fadd double %add.9932.3.clone.1, %add.9933.3.clone.1
  %140 = getelementptr double, ptr addrspace(1) %arg56163, i64 %10
  %141 = load double, ptr addrspace(1) %140, align 8, !invariant.load !339
  %142 = select i1 %15, double %141, double 0.000000e+00
  %add.9935.3.clone.1 = fadd double %81, %142
  %143 = getelementptr double, ptr addrspace(1) %arg55161, i64 %10
  %144 = load double, ptr addrspace(1) %143, align 8
  %145 = select i1 %15, double %144, double 0.000000e+00
  %146 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg54159, i64 0, i64 %9, i64 %10
  %147 = load double, ptr addrspace(1) %146, align 8, !invariant.load !339
  %multiply.11769.7.clone.1 = fmul double %147, %add.9929.3.clone.1
  %148 = getelementptr inbounds [192 x double], ptr addrspace(1) %arg53157, i64 0, i64 %9
  %149 = load double, ptr addrspace(1) %148, align 8, !invariant.load !339
  %multiply.11770.7.clone.1 = fmul double %multiply.11769.7.clone.1, %149
  %add.9937.5.clone.1 = fadd double %81, %multiply.11770.7.clone.1
  %add.9938.3.clone.1 = fadd double %145, %add.9937.5.clone.1
  %150 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg52155, i64 0, i64 %9, i64 %10
  %151 = load double, ptr addrspace(1) %150, align 8, !invariant.load !339
  %152 = fneg double %add.9938.3.clone.1
  %153 = fdiv double %152, %151
  %154 = fmul double %149, %153
  %add.9939.3.clone.1 = fadd double %add.9935.3.clone.1, %154
  %155 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg51153, i64 0, i64 %9, i64 %10
  %156 = load double, ptr addrspace(1) %155, align 8, !invariant.load !339
  %157 = getelementptr double, ptr addrspace(1) %arg50151, i64 %10
  %158 = load double, ptr addrspace(1) %157, align 8, !invariant.load !339
  %159 = getelementptr double, ptr addrspace(1) %arg49149, i64 %10
  %160 = load double, ptr addrspace(1) %159, align 8, !invariant.load !339
  %161 = fadd double %158, %160
  %add.9940.5.clone.1 = select i1 %15, double %161, double 0.000000e+00
  %162 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg48147, i64 0, i64 %9, i64 %10
  %163 = load double, ptr addrspace(1) %162, align 8, !invariant.load !339
  %multiply.11766.3.clone.1 = fmul double %add.9929.3.clone.1, %163
  %divide.2541.5.clone.1 = fdiv double %multiply.11766.3.clone.1, %63
  %multiply.11772.11.clone.1 = fmul double %23, %divide.2541.5.clone.1
  %164 = getelementptr double, ptr addrspace(1) %arg47145, i64 %10
  %165 = load double, ptr addrspace(1) %164, align 8, !invariant.load !339
  %add.9942.9.clone.1 = fadd double %165, %multiply.11772.11.clone.1
  %add.9943.7.clone.1 = fadd double %add.9940.5.clone.1, %add.9942.9.clone.1
  %add.9944.5.clone.1 = fadd double %81, %add.9943.7.clone.1
  %166 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg46143, i64 0, i64 %9, i64 %10
  %167 = load double, ptr addrspace(1) %166, align 8, !invariant.load !339
  %168 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg45141, i64 0, i64 %9, i64 %10
  %169 = load double, ptr addrspace(1) %168, align 8, !invariant.load !339
  %170 = fmul double %167, %152
  %171 = fmul double %170, %169
  %add.9945.3.clone.1 = fadd double %171, %add.9944.5.clone.1
  %172 = fmul double %156, %add.9945.3.clone.1
  %add.9947.1.clone.1 = fsub double %add.9939.3.clone.1, %172
  %173 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg44139, i64 0, i64 %9, i64 %10
  %174 = load double, ptr addrspace(1) %173, align 8, !invariant.load !339
  %multiply.11776.5.clone.1 = fmul double %174, %add.9945.3.clone.1
  %add.9948.3.clone.1 = fadd double %multiply.11776.5.clone.1, %add.9947.1.clone.1
  %multiply.11777.7.clone.1 = fmul double %151, %add.9948.3.clone.1
  %add.9949.5.clone.1 = fadd double %add.9934.3.clone.1, %multiply.11777.7.clone.1
  %multiply.11778.5.clone.1 = fmul double %93, %add.9949.5.clone.1
  %add.9950.3.clone.1 = fadd double %81, %multiply.11778.5.clone.1
  %add.9952.1.clone.1 = fadd double %130, %add.9950.3.clone.1
  %175 = getelementptr double, ptr addrspace(1) %arg62175, i64 %10
  %176 = load double, ptr addrspace(1) %175, align 8
  %177 = select i1 %15, double 0.000000e+00, double %176
  %178 = getelementptr double, ptr addrspace(1) %arg63177, i64 %10
  %179 = load double, ptr addrspace(1) %178, align 8
  %180 = select i1 %15, double 0.000000e+00, double %179
  %181 = getelementptr double, ptr addrspace(1) %arg64179, i64 %10
  %182 = load double, ptr addrspace(1) %181, align 8
  %183 = select i1 %15, double 0.000000e+00, double %182
  %184 = getelementptr double, ptr addrspace(1) %arg75201, i64 %10
  %185 = load double, ptr addrspace(1) %184, align 8
  %add.9988.3.clone.1.clone.1 = fadd double %185, 0.000000e+00
  %186 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg74199, i64 0, i64 %9, i64 %10
  %187 = load i8, ptr addrspace(1) %186, align 1, !invariant.load !339
  %188 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg73197, i64 0, i64 %9, i64 %10
  %189 = load double, ptr addrspace(1) %188, align 8, !invariant.load !339
  %190 = icmp eq i32 %39, 0
  %191 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg72195, i64 0, i64 %9, i64 %10
  %192 = load double, ptr addrspace(1) %191, align 8, !invariant.load !339
  %.neg = fneg double %43
  %193 = select i1 %190, double %.neg, double -0.000000e+00
  %194 = fmul double %193, %192
  %multiply.11807.7.clone.1.clone.1 = fmul double %189, %194
  %195 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg71193, i64 0, i64 %9, i64 %10
  %196 = load double, ptr addrspace(1) %195, align 8, !invariant.load !339
  %multiply.11808.5.clone.1.clone.1 = fmul double %196, %multiply.11807.7.clone.1.clone.1
  %197 = trunc i8 %187 to i1
  %198 = select i1 %197, double %multiply.11808.5.clone.1.clone.1, double 0.000000e+00
  %add.9989.3.clone.1.clone.1 = fadd double %81, %198
  %199 = getelementptr inbounds [192 x [4 x i8]], ptr addrspace(1) %arg70191, i64 0, i64 %9, i64 %10
  %200 = load i8, ptr addrspace(1) %199, align 1, !invariant.load !339
  %201 = select i1 %15, double %176, double 0.000000e+00
  %202 = select i1 %53, double %46, double 0.000000e+00
  %203 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg69189, i64 0, i64 %9, i64 %10
  %204 = load double, ptr addrspace(1) %203, align 8, !invariant.load !339
  %205 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg68187, i64 0, i64 %9, i64 %10
  %206 = load double, ptr addrspace(1) %205, align 8, !invariant.load !339
  %207 = fneg double %204
  %208 = fmul double %multiply.11759.21.clone.1, %207
  %209 = fmul double %208, %206
  %multiply.11802.13.clone.1.clone.1 = fmul double %209, 2.000000e+00
  %add.9979.11.clone.1.clone.1 = fadd double %202, %multiply.11802.13.clone.1.clone.1
  %add.9980.9.clone.1.clone.1 = fadd double %201, %add.9979.11.clone.1.clone.1
  %add.9981.7.clone.1.clone.1 = fadd double %81, %add.9980.9.clone.1.clone.1
  %210 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg67185, i64 0, i64 %9, i64 %10
  %211 = load double, ptr addrspace(1) %210, align 8, !invariant.load !339
  %212 = select i1 %15, double %182, double 0.000000e+00
  %add.9982.7.clone.1.clone.1 = fadd double %81, %212
  %multiply.11803.9.clone.1.clone.1 = fmul double %add.9982.7.clone.1.clone.1, %211
  %add.9983.7.clone.1.clone.1 = fadd double %multiply.11803.9.clone.1.clone.1, %add.9981.7.clone.1.clone.1
  %213 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg66183, i64 0, i64 %9, i64 %10
  %214 = load double, ptr addrspace(1) %213, align 8, !invariant.load !339
  %215 = fneg double %add.9983.7.clone.1.clone.1
  %216 = fmul double %214, %215
  %217 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg65181, i64 0, i64 %9, i64 %10
  %218 = load double, ptr addrspace(1) %217, align 8, !invariant.load !339
  %multiply.11809.5.clone.1.clone.1 = fmul double %add.9982.7.clone.1.clone.1, %218
  %add.9990.3.clone.1.clone.1 = fadd double %multiply.11809.5.clone.1.clone.1, %216
  %219 = trunc i8 %200 to i1
  %220 = select i1 %219, double %add.9990.3.clone.1.clone.1, double 0.000000e+00
  %multiply.11810.5.clone.1.clone.1 = fmul double %196, %220
  %add.9991.3.clone.1.clone.1 = fadd double %add.9989.3.clone.1.clone.1, %multiply.11810.5.clone.1.clone.1
  %add.9992.1.clone.1.clone.1 = fadd double %add.9988.3.clone.1.clone.1, %add.9991.3.clone.1.clone.1
  %221 = select i1 %15, double 0.000000e+00, double %42
  %222 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg76203, i64 0, i64 %9, i64 %10
  %223 = load double, ptr addrspace(1) %222, align 8, !invariant.load !339
  %224 = fneg double %194
  %225 = fmul double %223, %224
  %226 = select i1 %197, double %225, double 0.000000e+00
  %add.9978.3.clone.1 = fadd double %81, %226
  %227 = select i1 %15, double %179, double 0.000000e+00
  %add.9984.3.clone.1 = fadd double %81, %227
  %228 = fneg double %add.9984.3.clone.1
  %229 = fmul double %223, %228
  %230 = fmul double %223, %216
  %add.9985.5.clone.1 = fsub double %229, %230
  %add.9986.3.clone.1 = fadd double %add.9978.3.clone.1, %add.9985.5.clone.1
  %add.9987.1.clone.1 = fadd double %221, %add.9986.3.clone.1
  %231 = select i1 %15, double 0.000000e+00, double %30
  %add.9968.1.clone.1 = fadd double %231, %81
  %232 = select i1 %15, double 0.000000e+00, double %135
  %add.9967.1.clone.1 = fadd double %81, %232
  %233 = select i1 %15, double 0.000000e+00, double %27
  %234 = select i1 %15, double 0.000000e+00, double %132
  %235 = select i1 %15, double 0.000000e+00, double %144
  store double %16, ptr addrspace(1) %13, align 8
  store double %add.9977.1.clone.1, ptr addrspace(1) %17, align 8
  store double %add.9972.1.clone.1, ptr addrspace(1) %95, align 8
  store double %101, ptr addrspace(1) %99, align 8
  store double %add.9966.1.clone.1, ptr addrspace(1) %102, align 8
  store double %113, ptr addrspace(1) %68, align 8
  store double %add.9998.1.clone.1, ptr addrspace(1) %114, align 8
  store double %add.9952.1.clone.1, ptr addrspace(1) %126, align 8
  store double %177, ptr addrspace(1) %175, align 8
  store double %180, ptr addrspace(1) %178, align 8
  store double %183, ptr addrspace(1) %181, align 8
  store double %add.9992.1.clone.1.clone.1, ptr addrspace(1) %184, align 8
  store double %add.9987.1.clone.1, ptr addrspace(1) %41, align 8
  store double %add.9968.1.clone.1, ptr addrspace(1) %29, align 8
  store double %add.9967.1.clone.1, ptr addrspace(1) %134, align 8
  store double %233, ptr addrspace(1) %26, align 8
  store double %234, ptr addrspace(1) %131, align 8
  store double %235, ptr addrspace(1) %143, align 8
  ret void
}

; Function Attrs: norecurse nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_29(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg18) local_unnamed_addr #8 {
entry:
  %arg18273 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17271 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16269 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15267 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14265 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13263 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12261 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11259 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10257 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9255 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8253 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7251 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6249 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5247 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4245 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3243 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2241 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1239 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0237 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %block.id.y = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !352
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  switch i32 %block.id.y, label %default.unreachable233 [
    i32 0, label %reduce-group-0-true
    i32 1, label %reduce-group-1-true
    i32 2, label %reduce-group-2-true
  ]

default.unreachable233:                           ; preds = %entry
  call void asm sideeffect "exit;", ""()
  unreachable

reduce-group-2-after.sink.split:                  ; preds = %thread_in_bounds-after151, %thread_in_bounds-after72, %loop1.loop_exit
  %.sink236 = phi i32 [ %14, %loop1.loop_exit ], [ %63, %thread_in_bounds-after72 ], [ %113, %thread_in_bounds-after151 ]
  %.sink235 = phi i32 [ %16, %loop1.loop_exit ], [ %65, %thread_in_bounds-after72 ], [ %115, %thread_in_bounds-after151 ]
  %add.9442.i219.sink = phi double [ %add.9442.i, %loop1.loop_exit ], [ %add.9442.i219, %thread_in_bounds-after72 ], [ %add.9442.i228, %thread_in_bounds-after151 ]
  %arg15.sink = phi ptr addrspace(1) [ %arg12261, %loop1.loop_exit ], [ %arg15267, %thread_in_bounds-after72 ], [ %arg18273, %thread_in_bounds-after151 ]
  %0 = insertelement <2 x i32> poison, i32 %.sink236, i64 0
  %1 = insertelement <2 x i32> %0, i32 %.sink235, i64 1
  %2 = bitcast <2 x i32> %1 to double
  %add.9442.i220 = fadd double %add.9442.i219.sink, %2
  store double %add.9442.i220, ptr addrspace(1) %arg15.sink, align 128
  br label %reduce-group-2-after

reduce-group-2-after:                             ; preds = %reduce-group-2-after.sink.split, %thread_in_bounds-after72, %loop1.loop_exit, %thread_in_bounds-after151
  ret void

reduce-group-0-true:                              ; preds = %entry
  %3 = icmp ult i32 %thread.id.x, 4
  br i1 %3, label %x_in_tile-true, label %loop1.loop_exit

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %reduce-group-0-true
  %partial_reduction_result.0 = phi double [ %add.9442.i214, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %4 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %5 = extractelement <2 x i32> %4, i64 0
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> poison, i32 %6, i64 0
  %8 = extractelement <2 x i32> %4, i64 1
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 2, i32 31)
  %10 = insertelement <2 x i32> %7, i32 %9, i64 1
  %11 = bitcast <2 x i32> %10 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %11
  %12 = bitcast double %add.9442.i to <2 x i32>
  %13 = extractelement <2 x i32> %12, i64 0
  %14 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 1, i32 31)
  %15 = extractelement <2 x i32> %12, i64 1
  %16 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  br i1 %or.cond, label %reduce-group-2-after.sink.split, label %reduce-group-2-after

x_in_tile-true:                                   ; preds = %reduce-group-0-true
  %17 = zext nneg i32 %thread.id.x to i64
  %param_1.8182 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg1239, i64 0, i64 %17, i64 0
  %param_1.81822 = load double, ptr addrspace(1) %param_1.8182, align 8, !invariant.load !339
  %param_2.6812 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2241, i64 0, i64 %17
  %param_2.68123 = load double, ptr addrspace(1) %param_2.6812, align 8, !invariant.load !339
  %param_3.5562 = load double, ptr addrspace(1) %arg3243, align 128, !invariant.load !339
  %param_0.5803 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg0237, i64 0, i64 %17
  %param_0.58034 = load double, ptr addrspace(1) %param_0.5803, align 8, !invariant.load !339
  %multiply.11870.3 = fmul double %param_3.5562, %param_0.58034
  %add.10023.3 = fadd double %param_2.68123, %multiply.11870.3
  %add.10030.9 = fadd double %add.10023.3, -1.000000e+00
  %multiply.11884.7 = fmul double %add.10030.9, 4.000000e+00
  %add.10031.5 = fadd double %param_1.81822, %multiply.11884.7
  %multiply.11885.1 = fmul double %param_0.58034, %add.10031.5
  %add.9442.i214 = fadd double %multiply.11885.1, 0.000000e+00
  br label %loop1.loop_exit

reduce-group-1-true:                              ; preds = %entry
  %18 = icmp ult i32 %thread.id.x, 4
  br i1 %18, label %x_in_tile-true42, label %loop1.loop_exit30

loop1.loop_exit30:                                ; preds = %x_in_tile-true42, %reduce-group-1-true
  %partial_reduction_result13.0 = phi double [ %add.9442.i221, %x_in_tile-true42 ], [ 0.000000e+00, %reduce-group-1-true ]
  %partial_reduction_result16.0 = phi double [ %67, %x_in_tile-true42 ], [ 0.000000e+00, %reduce-group-1-true ]
  %partial_reduction_result19.0 = phi double [ %add.9442.i223, %x_in_tile-true42 ], [ 0.000000e+00, %reduce-group-1-true ]
  %19 = bitcast double %partial_reduction_result13.0 to <2 x i32>
  %20 = extractelement <2 x i32> %19, i64 0
  %21 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 2, i32 31)
  %22 = insertelement <2 x i32> poison, i32 %21, i64 0
  %23 = extractelement <2 x i32> %19, i64 1
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 2, i32 31)
  %25 = insertelement <2 x i32> %22, i32 %24, i64 1
  %26 = bitcast <2 x i32> %25 to double
  %add.9442.i215 = fadd double %partial_reduction_result13.0, %26
  %27 = bitcast double %add.9442.i215 to <2 x i32>
  %28 = extractelement <2 x i32> %27, i64 0
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 1, i32 31)
  %30 = extractelement <2 x i32> %27, i64 1
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 1, i32 31)
  %or.cond168 = icmp eq i32 %thread.id.x, 0
  %32 = insertelement <2 x i32> poison, i32 %29, i64 0
  %33 = insertelement <2 x i32> %32, i32 %31, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %add.9442.i216 = fadd double %add.9442.i215, %34
  br i1 %or.cond168, label %reduction_write_output-true62, label %thread_in_bounds-after61

thread_in_bounds-after61:                         ; preds = %reduction_write_output-true62, %loop1.loop_exit30
  %35 = icmp eq i32 %thread.id.x, 0
  %36 = bitcast double %partial_reduction_result16.0 to <2 x i32>
  %37 = extractelement <2 x i32> %36, i64 0
  %38 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 2, i32 31)
  %39 = insertelement <2 x i32> poison, i32 %38, i64 0
  %40 = extractelement <2 x i32> %36, i64 1
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 2, i32 31)
  %42 = insertelement <2 x i32> %39, i32 %41, i64 1
  %43 = bitcast <2 x i32> %42 to double
  %add.9442.i217 = fadd double %partial_reduction_result16.0, %43
  %44 = bitcast double %add.9442.i217 to <2 x i32>
  %45 = extractelement <2 x i32> %44, i64 0
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 1, i32 31)
  %47 = extractelement <2 x i32> %44, i64 1
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 1, i32 31)
  %49 = insertelement <2 x i32> poison, i32 %46, i64 0
  %50 = insertelement <2 x i32> %49, i32 %48, i64 1
  %51 = bitcast <2 x i32> %50 to double
  %add.9442.i218 = fadd double %add.9442.i217, %51
  br i1 %35, label %reduction_write_output-true73, label %thread_in_bounds-after72

thread_in_bounds-after72:                         ; preds = %reduction_write_output-true73, %thread_in_bounds-after61
  %52 = icmp eq i32 %thread.id.x, 0
  %53 = bitcast double %partial_reduction_result19.0 to <2 x i32>
  %54 = extractelement <2 x i32> %53, i64 0
  %55 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %54, i32 2, i32 31)
  %56 = insertelement <2 x i32> poison, i32 %55, i64 0
  %57 = extractelement <2 x i32> %53, i64 1
  %58 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %57, i32 2, i32 31)
  %59 = insertelement <2 x i32> %56, i32 %58, i64 1
  %60 = bitcast <2 x i32> %59 to double
  %add.9442.i219 = fadd double %partial_reduction_result19.0, %60
  %61 = bitcast double %add.9442.i219 to <2 x i32>
  %62 = extractelement <2 x i32> %61, i64 0
  %63 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %62, i32 1, i32 31)
  %64 = extractelement <2 x i32> %61, i64 1
  %65 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %64, i32 1, i32 31)
  br i1 %52, label %reduce-group-2-after.sink.split, label %reduce-group-2-after

x_in_tile-true42:                                 ; preds = %reduce-group-1-true
  %66 = zext nneg i32 %thread.id.x to i64
  %param_4.5102 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4245, i64 0, i64 %66
  %param_4.510244 = load double, ptr addrspace(1) %param_4.5102, align 8, !invariant.load !339
  %param_5.4142 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg5247, i64 0, i64 %66
  %param_5.414245 = load double, ptr addrspace(1) %param_5.4142, align 8, !invariant.load !339
  %multiply.11898.1.clone.1.clone.1 = fmul double %param_4.510244, %param_5.414245
  %add.9442.i221 = fadd double %multiply.11898.1.clone.1.clone.1, 0.000000e+00
  %param_7.2745 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg7251, i64 0, i64 %66
  %param_7.274547 = load double, ptr addrspace(1) %param_7.2745, align 8, !invariant.load !339
  %add.10036.9.clone.1 = fadd double %param_7.274547, -1.000000e+00
  %multiply.11916.1.clone.1.clone.1 = fmul double %add.10036.9.clone.1, %add.10036.9.clone.1
  %add.10059.5.clone.1.clone.1 = fadd double %multiply.11916.1.clone.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.11917.3.clone.1.clone.1 = fmul double %add.10059.5.clone.1.clone.1, 5.000000e-01
  %67 = fsub double 0.000000e+00, %multiply.11917.3.clone.1.clone.1
  %param_6.3472 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg6249, i64 0, i64 %66
  %param_6.347250 = load double, ptr addrspace(1) %param_6.3472, align 8, !invariant.load !339
  %add.10037.5.clone.1 = fadd double %param_6.347250, %add.10036.9.clone.1
  %multiply.11890.1.clone.1 = fmul double %param_5.414245, %add.10037.5.clone.1
  %add.9442.i223 = fadd double %multiply.11890.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit30

reduction_write_output-true62:                    ; preds = %loop1.loop_exit30
  store double %add.9442.i216, ptr addrspace(1) %arg13263, align 128
  br label %thread_in_bounds-after61

reduction_write_output-true73:                    ; preds = %thread_in_bounds-after61
  store double %add.9442.i218, ptr addrspace(1) %arg14265, align 128
  br label %thread_in_bounds-after72

reduce-group-2-true:                              ; preds = %entry
  %68 = icmp ult i32 %thread.id.x, 4
  br i1 %68, label %x_in_tile-true117, label %loop1.loop_exit105

loop1.loop_exit105:                               ; preds = %x_in_tile-true117, %reduce-group-2-true
  %partial_reduction_result88.0 = phi double [ %117, %x_in_tile-true117 ], [ 0.000000e+00, %reduce-group-2-true ]
  %partial_reduction_result91.0 = phi double [ %add.9442.i231, %x_in_tile-true117 ], [ 0.000000e+00, %reduce-group-2-true ]
  %partial_reduction_result94.0 = phi double [ %add.9442.i232, %x_in_tile-true117 ], [ 0.000000e+00, %reduce-group-2-true ]
  %69 = bitcast double %partial_reduction_result88.0 to <2 x i32>
  %70 = extractelement <2 x i32> %69, i64 0
  %71 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %70, i32 2, i32 31)
  %72 = insertelement <2 x i32> poison, i32 %71, i64 0
  %73 = extractelement <2 x i32> %69, i64 1
  %74 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %73, i32 2, i32 31)
  %75 = insertelement <2 x i32> %72, i32 %74, i64 1
  %76 = bitcast <2 x i32> %75 to double
  %add.9442.i224 = fadd double %partial_reduction_result88.0, %76
  %77 = bitcast double %add.9442.i224 to <2 x i32>
  %78 = extractelement <2 x i32> %77, i64 0
  %79 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %78, i32 1, i32 31)
  %80 = extractelement <2 x i32> %77, i64 1
  %81 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %80, i32 1, i32 31)
  %or.cond174 = icmp eq i32 %thread.id.x, 0
  %82 = insertelement <2 x i32> poison, i32 %79, i64 0
  %83 = insertelement <2 x i32> %82, i32 %81, i64 1
  %84 = bitcast <2 x i32> %83 to double
  %add.9442.i225 = fadd double %add.9442.i224, %84
  br i1 %or.cond174, label %reduction_write_output-true141, label %thread_in_bounds-after140

thread_in_bounds-after140:                        ; preds = %reduction_write_output-true141, %loop1.loop_exit105
  %85 = icmp eq i32 %thread.id.x, 0
  %86 = bitcast double %partial_reduction_result91.0 to <2 x i32>
  %87 = extractelement <2 x i32> %86, i64 0
  %88 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %87, i32 2, i32 31)
  %89 = insertelement <2 x i32> poison, i32 %88, i64 0
  %90 = extractelement <2 x i32> %86, i64 1
  %91 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %90, i32 2, i32 31)
  %92 = insertelement <2 x i32> %89, i32 %91, i64 1
  %93 = bitcast <2 x i32> %92 to double
  %add.9442.i226 = fadd double %partial_reduction_result91.0, %93
  %94 = bitcast double %add.9442.i226 to <2 x i32>
  %95 = extractelement <2 x i32> %94, i64 0
  %96 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %95, i32 1, i32 31)
  %97 = extractelement <2 x i32> %94, i64 1
  %98 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %97, i32 1, i32 31)
  %99 = insertelement <2 x i32> poison, i32 %96, i64 0
  %100 = insertelement <2 x i32> %99, i32 %98, i64 1
  %101 = bitcast <2 x i32> %100 to double
  %add.9442.i227 = fadd double %add.9442.i226, %101
  br i1 %85, label %reduction_write_output-true152, label %thread_in_bounds-after151

thread_in_bounds-after151:                        ; preds = %reduction_write_output-true152, %thread_in_bounds-after140
  %102 = icmp eq i32 %thread.id.x, 0
  %103 = bitcast double %partial_reduction_result94.0 to <2 x i32>
  %104 = extractelement <2 x i32> %103, i64 0
  %105 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %104, i32 2, i32 31)
  %106 = insertelement <2 x i32> poison, i32 %105, i64 0
  %107 = extractelement <2 x i32> %103, i64 1
  %108 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %107, i32 2, i32 31)
  %109 = insertelement <2 x i32> %106, i32 %108, i64 1
  %110 = bitcast <2 x i32> %109 to double
  %add.9442.i228 = fadd double %partial_reduction_result94.0, %110
  %111 = bitcast double %add.9442.i228 to <2 x i32>
  %112 = extractelement <2 x i32> %111, i64 0
  %113 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %112, i32 1, i32 31)
  %114 = extractelement <2 x i32> %111, i64 1
  %115 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %114, i32 1, i32 31)
  br i1 %102, label %reduce-group-2-after.sink.split, label %reduce-group-2-after

x_in_tile-true117:                                ; preds = %reduce-group-2-true
  %116 = zext nneg i32 %thread.id.x to i64
  %param_11.1400 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg11259, i64 0, i64 %116
  %param_11.1400119 = load double, ptr addrspace(1) %param_11.1400, align 8, !invariant.load !339
  %param_3.5562120 = load double, ptr addrspace(1) %arg3243, align 128, !invariant.load !339
  %param_9.1874 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg9255, i64 0, i64 %116
  %param_9.1874121 = load double, ptr addrspace(1) %param_9.1874, align 8, !invariant.load !339
  %multiply.11874.7.clone.1 = fmul double %param_3.5562120, %param_9.1874121
  %add.10025.7.clone.1 = fadd double %param_11.1400119, %multiply.11874.7.clone.1
  %multiply.11908.1.clone.1.clone.1 = fmul double %add.10025.7.clone.1, %add.10025.7.clone.1
  %add.10053.5.clone.1.clone.1 = fadd double %multiply.11908.1.clone.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.11909.3.clone.1.clone.1 = fmul double %add.10053.5.clone.1.clone.1, 5.000000e-01
  %117 = fsub double 0.000000e+00, %multiply.11909.3.clone.1.clone.1
  %param_8.2214 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg8253, i64 0, i64 %116
  %param_8.2214125 = load double, ptr addrspace(1) %param_8.2214, align 8, !invariant.load !339
  %multiply.11895.1.clone.1.clone.1 = fmul double %param_9.1874121, %param_8.2214125
  %add.9442.i231 = fadd double %multiply.11895.1.clone.1.clone.1, 0.000000e+00
  %param_10.1632 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg10257, i64 0, i64 %116
  %param_10.1632129 = load double, ptr addrspace(1) %param_10.1632, align 8, !invariant.load !339
  %add.10028.2.clone.1 = fadd double %param_10.1632129, %add.10025.7.clone.1
  %multiply.11876.1.clone.1 = fmul double %param_9.1874121, %add.10028.2.clone.1
  %add.9442.i232 = fadd double %multiply.11876.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit105

reduction_write_output-true141:                   ; preds = %loop1.loop_exit105
  store double %add.9442.i225, ptr addrspace(1) %arg16269, align 128
  br label %thread_in_bounds-after140

reduction_write_output-true152:                   ; preds = %thread_in_bounds-after140
  store double %add.9442.i227, ptr addrspace(1) %arg17271, align 128
  br label %thread_in_bounds-after151
}

; Function Attrs: norecurse nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_27(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg13) local_unnamed_addr #8 {
entry:
  %arg13204 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12202 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11200 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10198 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9196 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8194 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7192 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6190 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5188 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4186 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3184 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2182 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1180 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0178 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %block.id.y = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !348
  %trunc = trunc nuw i32 %block.id.y to i1
  %thread.id.x52 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  br i1 %trunc, label %reduce-group-1-true, label %reduce-group-0-true

reduce-group-1-after.sink.split:                  ; preds = %thread_in_bounds-after105, %thread_in_bounds-after28
  %.sink177 = phi i32 [ %48, %thread_in_bounds-after28 ], [ %98, %thread_in_bounds-after105 ]
  %.sink176 = phi i32 [ %50, %thread_in_bounds-after28 ], [ %100, %thread_in_bounds-after105 ]
  %add.9442.i161.sink = phi double [ %add.9442.i161, %thread_in_bounds-after28 ], [ %add.9442.i170, %thread_in_bounds-after105 ]
  %arg10.sink = phi ptr addrspace(1) [ %arg10198, %thread_in_bounds-after28 ], [ %arg13204, %thread_in_bounds-after105 ]
  %0 = insertelement <2 x i32> poison, i32 %.sink177, i64 0
  %1 = insertelement <2 x i32> %0, i32 %.sink176, i64 1
  %2 = bitcast <2 x i32> %1 to double
  %add.9442.i162 = fadd double %add.9442.i161.sink, %2
  store double %add.9442.i162, ptr addrspace(1) %arg10.sink, align 128
  br label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduce-group-1-after.sink.split, %thread_in_bounds-after28, %thread_in_bounds-after105
  ret void

reduce-group-0-true:                              ; preds = %entry
  %3 = icmp ult i32 %thread.id.x52, 4
  br i1 %3, label %x_in_tile-true, label %loop1.loop_exit

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %reduce-group-0-true
  %partial_reduction_result5.0 = phi double [ %add.9442.i165, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %partial_reduction_result2.0 = phi double [ %52, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %partial_reduction_result.0 = phi double [ %add.9442.i163, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %4 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %5 = extractelement <2 x i32> %4, i64 0
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> poison, i32 %6, i64 0
  %8 = extractelement <2 x i32> %4, i64 1
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 2, i32 31)
  %10 = insertelement <2 x i32> %7, i32 %9, i64 1
  %11 = bitcast <2 x i32> %10 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %11
  %12 = bitcast double %add.9442.i to <2 x i32>
  %13 = extractelement <2 x i32> %12, i64 0
  %14 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 1, i32 31)
  %15 = extractelement <2 x i32> %12, i64 1
  %16 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x52, 0
  %17 = insertelement <2 x i32> poison, i32 %14, i64 0
  %18 = insertelement <2 x i32> %17, i32 %16, i64 1
  %19 = bitcast <2 x i32> %18 to double
  %add.9442.i158 = fadd double %add.9442.i, %19
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %20 = icmp eq i32 %thread.id.x52, 0
  %21 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %22 = extractelement <2 x i32> %21, i64 0
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> poison, i32 %23, i64 0
  %25 = extractelement <2 x i32> %21, i64 1
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 2, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 1
  %28 = bitcast <2 x i32> %27 to double
  %add.9442.i159 = fadd double %partial_reduction_result2.0, %28
  %29 = bitcast double %add.9442.i159 to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 1, i32 31)
  %32 = extractelement <2 x i32> %29, i64 1
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 1, i32 31)
  %34 = insertelement <2 x i32> poison, i32 %31, i64 0
  %35 = insertelement <2 x i32> %34, i32 %33, i64 1
  %36 = bitcast <2 x i32> %35 to double
  %add.9442.i160 = fadd double %add.9442.i159, %36
  br i1 %20, label %reduction_write_output-true29, label %thread_in_bounds-after28

thread_in_bounds-after28:                         ; preds = %reduction_write_output-true29, %thread_in_bounds-after
  %37 = icmp eq i32 %thread.id.x52, 0
  %38 = bitcast double %partial_reduction_result5.0 to <2 x i32>
  %39 = extractelement <2 x i32> %38, i64 0
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 2, i32 31)
  %41 = insertelement <2 x i32> poison, i32 %40, i64 0
  %42 = extractelement <2 x i32> %38, i64 1
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 2, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 1
  %45 = bitcast <2 x i32> %44 to double
  %add.9442.i161 = fadd double %partial_reduction_result5.0, %45
  %46 = bitcast double %add.9442.i161 to <2 x i32>
  %47 = extractelement <2 x i32> %46, i64 0
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 1, i32 31)
  %49 = extractelement <2 x i32> %46, i64 1
  %50 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %49, i32 1, i32 31)
  br i1 %37, label %reduce-group-1-after.sink.split, label %reduce-group-1-after

x_in_tile-true:                                   ; preds = %reduce-group-0-true
  %51 = zext nneg i32 %thread.id.x52 to i64
  %param_1.8122 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1180, i64 0, i64 %51
  %param_1.81228 = load double, ptr addrspace(1) %param_1.8122, align 8, !invariant.load !339
  %param_2.6803 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2182, i64 0, i64 %51
  %param_2.68039 = load double, ptr addrspace(1) %param_2.6803, align 8, !invariant.load !339
  %add.10042.9 = fadd double %param_2.68039, 6.000000e+00
  %multiply.11893.7 = fmul double %add.10042.9, 2.500000e-01
  %add.10043.5 = fadd double %param_1.81228, %multiply.11893.7
  %param_0.5815 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg0178, i64 0, i64 %51
  %param_0.581510 = load double, ptr addrspace(1) %param_0.5815, align 8, !invariant.load !339
  %multiply.11894.1 = fmul double %param_0.581510, %add.10043.5
  %add.9442.i163 = fadd double %multiply.11894.1, 0.000000e+00
  %multiply.11910.1.clone.1 = fmul double %add.10042.9, %add.10042.9
  %multiply.11911.3.clone.1 = fmul double %multiply.11910.1.clone.1, 2.500000e-01
  %add.10055.3.clone.1 = fadd double %multiply.11911.3.clone.1, 0x4009CB1A63AF7C52
  %multiply.11912.3.clone.1 = fmul double %add.10055.3.clone.1, 5.000000e-01
  %52 = fsub double 0.000000e+00, %multiply.11912.3.clone.1
  %param_3.5777 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3184, i64 0, i64 %51
  %param_3.577712 = load double, ptr addrspace(1) %param_3.5777, align 8, !invariant.load !339
  %multiply.11900.1.clone.1 = fmul double %param_0.581510, %param_3.577712
  %add.9442.i165 = fadd double %multiply.11900.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i158, ptr addrspace(1) %arg8194, align 128
  br label %thread_in_bounds-after

reduction_write_output-true29:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i160, ptr addrspace(1) %arg9196, align 128
  br label %thread_in_bounds-after28

reduce-group-1-true:                              ; preds = %entry
  %53 = icmp ult i32 %thread.id.x52, 4
  br i1 %53, label %x_in_tile-true73, label %loop1.loop_exit61

loop1.loop_exit61:                                ; preds = %x_in_tile-true73, %reduce-group-1-true
  %partial_reduction_result44.0 = phi double [ %add.9442.i172, %x_in_tile-true73 ], [ 0.000000e+00, %reduce-group-1-true ]
  %partial_reduction_result47.0 = phi double [ %102, %x_in_tile-true73 ], [ 0.000000e+00, %reduce-group-1-true ]
  %partial_reduction_result50.0 = phi double [ %add.9442.i174, %x_in_tile-true73 ], [ 0.000000e+00, %reduce-group-1-true ]
  %54 = bitcast double %partial_reduction_result44.0 to <2 x i32>
  %55 = extractelement <2 x i32> %54, i64 0
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 2, i32 31)
  %57 = insertelement <2 x i32> poison, i32 %56, i64 0
  %58 = extractelement <2 x i32> %54, i64 1
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 2, i32 31)
  %60 = insertelement <2 x i32> %57, i32 %59, i64 1
  %61 = bitcast <2 x i32> %60 to double
  %add.9442.i166 = fadd double %partial_reduction_result44.0, %61
  %62 = bitcast double %add.9442.i166 to <2 x i32>
  %63 = extractelement <2 x i32> %62, i64 0
  %64 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %63, i32 1, i32 31)
  %65 = extractelement <2 x i32> %62, i64 1
  %66 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %65, i32 1, i32 31)
  %or.cond126 = icmp eq i32 %thread.id.x52, 0
  %67 = insertelement <2 x i32> poison, i32 %64, i64 0
  %68 = insertelement <2 x i32> %67, i32 %66, i64 1
  %69 = bitcast <2 x i32> %68 to double
  %add.9442.i167 = fadd double %add.9442.i166, %69
  br i1 %or.cond126, label %reduction_write_output-true95, label %thread_in_bounds-after94

thread_in_bounds-after94:                         ; preds = %reduction_write_output-true95, %loop1.loop_exit61
  %70 = icmp eq i32 %thread.id.x52, 0
  %71 = bitcast double %partial_reduction_result47.0 to <2 x i32>
  %72 = extractelement <2 x i32> %71, i64 0
  %73 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %72, i32 2, i32 31)
  %74 = insertelement <2 x i32> poison, i32 %73, i64 0
  %75 = extractelement <2 x i32> %71, i64 1
  %76 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %75, i32 2, i32 31)
  %77 = insertelement <2 x i32> %74, i32 %76, i64 1
  %78 = bitcast <2 x i32> %77 to double
  %add.9442.i168 = fadd double %partial_reduction_result47.0, %78
  %79 = bitcast double %add.9442.i168 to <2 x i32>
  %80 = extractelement <2 x i32> %79, i64 0
  %81 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %80, i32 1, i32 31)
  %82 = extractelement <2 x i32> %79, i64 1
  %83 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %82, i32 1, i32 31)
  %84 = insertelement <2 x i32> poison, i32 %81, i64 0
  %85 = insertelement <2 x i32> %84, i32 %83, i64 1
  %86 = bitcast <2 x i32> %85 to double
  %add.9442.i169 = fadd double %add.9442.i168, %86
  br i1 %70, label %reduction_write_output-true106, label %thread_in_bounds-after105

thread_in_bounds-after105:                        ; preds = %reduction_write_output-true106, %thread_in_bounds-after94
  %87 = icmp eq i32 %thread.id.x52, 0
  %88 = bitcast double %partial_reduction_result50.0 to <2 x i32>
  %89 = extractelement <2 x i32> %88, i64 0
  %90 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %89, i32 2, i32 31)
  %91 = insertelement <2 x i32> poison, i32 %90, i64 0
  %92 = extractelement <2 x i32> %88, i64 1
  %93 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %92, i32 2, i32 31)
  %94 = insertelement <2 x i32> %91, i32 %93, i64 1
  %95 = bitcast <2 x i32> %94 to double
  %add.9442.i170 = fadd double %partial_reduction_result50.0, %95
  %96 = bitcast double %add.9442.i170 to <2 x i32>
  %97 = extractelement <2 x i32> %96, i64 0
  %98 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %97, i32 1, i32 31)
  %99 = extractelement <2 x i32> %96, i64 1
  %100 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %99, i32 1, i32 31)
  br i1 %87, label %reduce-group-1-after.sink.split, label %reduce-group-1-after

x_in_tile-true73:                                 ; preds = %reduce-group-1-true
  %101 = zext nneg i32 %thread.id.x52 to i64
  %param_4.5105 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4186, i64 0, i64 %101
  %param_4.510575 = load double, ptr addrspace(1) %param_4.5105, align 8, !invariant.load !339
  %param_5.4145 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg5188, i64 0, i64 %101
  %param_5.414576 = load double, ptr addrspace(1) %param_5.4145, align 8, !invariant.load !339
  %multiply.11899.1.clone.1.clone.1 = fmul double %param_4.510575, %param_5.414576
  %add.9442.i172 = fadd double %multiply.11899.1.clone.1.clone.1, 0.000000e+00
  %param_7.2753 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg7192, i64 0, i64 %101
  %param_7.275378 = load double, ptr addrspace(1) %param_7.2753, align 8, !invariant.load !339
  %add.10039.9.clone.1 = fadd double %param_7.275378, 4.000000e+00
  %multiply.11902.1.clone.1.clone.1 = fmul double %add.10039.9.clone.1, %add.10039.9.clone.1
  %multiply.11903.3.clone.1.clone.1 = fmul double %multiply.11902.1.clone.1.clone.1, 2.500000e-01
  %add.10050.3.clone.1.clone.1 = fadd double %multiply.11903.3.clone.1.clone.1, 0x4009CB1A63AF7C52
  %multiply.11904.3.clone.1.clone.1 = fmul double %add.10050.3.clone.1.clone.1, 5.000000e-01
  %102 = fsub double 0.000000e+00, %multiply.11904.3.clone.1.clone.1
  %param_6.3476 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg6190, i64 0, i64 %101
  %param_6.347683 = load double, ptr addrspace(1) %param_6.3476, align 8, !invariant.load !339
  %multiply.11891.7.clone.1 = fmul double %add.10039.9.clone.1, 2.500000e-01
  %add.10040.5.clone.1 = fadd double %param_6.347683, %multiply.11891.7.clone.1
  %multiply.11892.1.clone.1 = fmul double %param_5.414576, %add.10040.5.clone.1
  %add.9442.i174 = fadd double %multiply.11892.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit61

reduction_write_output-true95:                    ; preds = %loop1.loop_exit61
  store double %add.9442.i167, ptr addrspace(1) %arg11200, align 128
  br label %thread_in_bounds-after94

reduction_write_output-true106:                   ; preds = %thread_in_bounds-after94
  store double %add.9442.i169, ptr addrspace(1) %arg12202, align 128
  br label %thread_in_bounds-after105
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_30(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg1) local_unnamed_addr #6 {
entry:
  %arg133 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg031 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !349
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext i32 %thread.id.2 to i64
  %2 = add nuw nsw i32 %0, -32
  %3 = zext nneg i32 %thread.id.x to i64
  %4 = lshr i64 %3, 5
  %5 = shl nuw nsw i64 %4, 5
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
  %9 = icmp ult i32 %8, 4
  br i1 %9, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.9442.i28, %x_in_tile-true ], [ %partial_reduction_result.029, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep36 = getelementptr i8, ptr addrspace(1) %lsr.iv35, i64 1024
  %10 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %10, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !353

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %11 = zext nneg i32 %0 to i64
  %12 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache1, i64 0, i64 %1, i64 %11
  store double %partial_reduction_result.1, ptr addrspace(3) %12, align 8
  tail call void @llvm.nvvm.barrier0()
  %13 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache1, i64 0, i64 %11, i64 %1
  %partial_reduction_result31819 = load <2 x i32>, ptr addrspace(3) %13, align 8
  %14 = extractelement <2 x i32> %partial_reduction_result31819, i64 0
  %15 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %14, i32 16, i32 31)
  %16 = insertelement <2 x i32> poison, i32 %15, i64 0
  %17 = extractelement <2 x i32> %partial_reduction_result31819, i64 1
  %18 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %17, i32 16, i32 31)
  %19 = insertelement <2 x i32> %16, i32 %18, i64 1
  %20 = bitcast <2 x i32> %19 to double
  %21 = bitcast <2 x i32> %partial_reduction_result31819 to double
  %add.9442.i = fadd double %21, %20
  %22 = bitcast double %add.9442.i to <2 x i32>
  %23 = extractelement <2 x i32> %22, i64 0
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 8, i32 31)
  %25 = insertelement <2 x i32> poison, i32 %24, i64 0
  %26 = extractelement <2 x i32> %22, i64 1
  %27 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %26, i32 8, i32 31)
  %28 = insertelement <2 x i32> %25, i32 %27, i64 1
  %29 = bitcast <2 x i32> %28 to double
  %add.9442.i24 = fadd double %add.9442.i, %29
  %30 = bitcast double %add.9442.i24 to <2 x i32>
  %31 = extractelement <2 x i32> %30, i64 0
  %32 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %31, i32 4, i32 31)
  %33 = insertelement <2 x i32> poison, i32 %32, i64 0
  %34 = extractelement <2 x i32> %30, i64 1
  %35 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 4, i32 31)
  %36 = insertelement <2 x i32> %33, i32 %35, i64 1
  %37 = bitcast <2 x i32> %36 to double
  %add.9442.i25 = fadd double %add.9442.i24, %37
  %38 = bitcast double %add.9442.i25 to <2 x i32>
  %39 = extractelement <2 x i32> %38, i64 0
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 2, i32 31)
  %41 = insertelement <2 x i32> poison, i32 %40, i64 0
  %42 = extractelement <2 x i32> %38, i64 1
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 2, i32 31)
  %44 = insertelement <2 x i32> %41, i32 %43, i64 1
  %45 = bitcast <2 x i32> %44 to double
  %add.9442.i26 = fadd double %add.9442.i25, %45
  %46 = bitcast double %add.9442.i26 to <2 x i32>
  %47 = extractelement <2 x i32> %46, i64 0
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 1, i32 31)
  %49 = insertelement <2 x i32> poison, i32 %48, i64 0
  %50 = extractelement <2 x i32> %46, i64 1
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 1, i32 31)
  %52 = insertelement <2 x i32> %49, i32 %51, i64 1
  %53 = bitcast <2 x i32> %52 to double
  %add.9442.i27 = fadd double %add.9442.i26, %53
  store double %add.9442.i27, ptr addrspace(3) %13, align 8
  %54 = and i32 %thread.id.x, 927
  %55 = icmp eq i32 %54, 0
  %output_element_address = getelementptr inbounds [4 x double], ptr addrspace(1) %arg133, i64 0, i64 %11
  br i1 %55, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %param_0.58262 = load double, ptr addrspace(1) %lsr.iv35, align 8, !invariant.load !339
  %add.9442.i28 = fadd double %partial_reduction_result.029, %param_0.58262
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i27, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_28(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7) local_unnamed_addr #3 {
entry:
  %arg784 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg682 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg580 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg478 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg376 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg274 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg172 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg070 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true42, %thread_in_bounds-after30
  ret void

loop1.loop_exit:                                  ; preds = %__nv_exp.exit, %entry
  %partial_reduction_result2.0 = phi double [ %90, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %partial_reduction_result.0 = phi double [ %add.9442.i67, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %partial_reduction_result5.0 = phi double [ %add.9442.i69, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i62 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i63 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i63 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i64 = fadd double %add.9442.i63, %33
  br i1 %17, label %reduction_write_output-true31, label %thread_in_bounds-after30

thread_in_bounds-after30:                         ; preds = %reduction_write_output-true31, %thread_in_bounds-after
  %34 = icmp eq i32 %thread.id.x, 0
  %35 = bitcast double %partial_reduction_result5.0 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 2, i32 31)
  %38 = insertelement <2 x i32> poison, i32 %37, i64 0
  %39 = extractelement <2 x i32> %35, i64 1
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 2, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to double
  %add.9442.i65 = fadd double %partial_reduction_result5.0, %42
  %43 = bitcast double %add.9442.i65 to <2 x i32>
  %44 = extractelement <2 x i32> %43, i64 0
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 1, i32 31)
  %46 = extractelement <2 x i32> %43, i64 1
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 1, i32 31)
  %48 = insertelement <2 x i32> poison, i32 %45, i64 0
  %49 = insertelement <2 x i32> %48, i32 %47, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.9442.i66 = fadd double %add.9442.i65, %50
  br i1 %34, label %reduction_write_output-true42, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %51 = zext nneg i32 %thread.id.x to i64
  %param_1.8185 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg172, i64 0, i64 %51
  %param_1.81858 = load double, ptr addrspace(1) %param_1.8185, align 8, !invariant.load !339
  %param_2.6817 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg274, i64 0, i64 %51
  %param_2.68179 = load double, ptr addrspace(1) %param_2.6817, align 8, !invariant.load !339
  %param_3.5566 = load double, ptr addrspace(1) %arg376, align 128, !invariant.load !339
  %param_0.5801 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg070, i64 0, i64 %51
  %param_0.580110 = load double, ptr addrspace(1) %param_0.5801, align 8, !invariant.load !339
  %multiply.11866.13 = fmul double %param_3.5566, %param_0.580110
  %add.10019.13 = fadd double %param_2.68179, %multiply.11866.13
  %52 = tail call double @llvm.fma.f64(double %add.10019.13, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %53 = tail call i32 @llvm.nvvm.d2i.lo(double %52) #11
  %54 = tail call double @llvm.nvvm.add.rn.d(double %52, double 0xC338000000000000) #11
  %55 = tail call double @llvm.fma.f64(double %54, double 0xBFE62E42FEFA39EF, double %add.10019.13)
  %56 = tail call double @llvm.fma.f64(double %54, double 0xBC7ABC9E3B39803F, double %55)
  %57 = tail call double @llvm.fma.f64(double %56, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %58 = tail call double @llvm.fma.f64(double %57, double %56, double 0x3EC71DEE62401315)
  %59 = tail call double @llvm.fma.f64(double %58, double %56, double 0x3EFA01997C89EB71)
  %60 = tail call double @llvm.fma.f64(double %59, double %56, double 0x3F2A01A014761F65)
  %61 = tail call double @llvm.fma.f64(double %60, double %56, double 0x3F56C16C1852B7AF)
  %62 = tail call double @llvm.fma.f64(double %61, double %56, double 0x3F81111111122322)
  %63 = tail call double @llvm.fma.f64(double %62, double %56, double 0x3FA55555555502A1)
  %64 = tail call double @llvm.fma.f64(double %63, double %56, double 0x3FC5555555555511)
  %65 = tail call double @llvm.fma.f64(double %64, double %56, double 0x3FE000000000000B)
  %66 = tail call double @llvm.fma.f64(double %65, double %56, double 1.000000e+00)
  %67 = tail call double @llvm.fma.f64(double %66, double %56, double 1.000000e+00)
  %68 = tail call i32 @llvm.nvvm.d2i.lo(double %67) #11
  %69 = tail call i32 @llvm.nvvm.d2i.hi(double %67) #11
  %70 = shl i32 %53, 20
  %71 = add i32 %69, %70
  %72 = tail call double @llvm.nvvm.lohi.i2d(i32 %68, i32 %71) #11
  %73 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10019.13) #11
  %74 = bitcast i32 %73 to float
  %75 = tail call float @llvm.nvvm.fabs.f(float %74) #11
  %76 = fcmp olt float %75, 0x4010C46560000000
  br i1 %76, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true
  %77 = fcmp olt double %add.10019.13, 0.000000e+00
  %78 = fadd double %add.10019.13, 0x7FF0000000000000
  %z.0.i = select i1 %77, double 0.000000e+00, double %78
  %79 = fcmp olt float %75, 0x4010E90000000000
  br i1 %79, label %80, label %__nv_exp.exit

80:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %81 = sdiv i32 %53, 2
  %82 = shl i32 %81, 20
  %83 = add i32 %69, %82
  %84 = tail call double @llvm.nvvm.lohi.i2d(i32 %68, i32 %83) #11
  %85 = sub nsw i32 %53, %81
  %86 = shl i32 %85, 20
  %87 = add nsw i32 %86, 1072693248
  %88 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %87) #11
  %89 = fmul double %88, %84
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true, %__internal_fast_icmp_abs_lt.exit.i, %80
  %z.2.i = phi double [ %72, %x_in_tile-true ], [ %89, %80 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.11887.5 = fmul double %param_1.81858, %z.2.i
  %add.10033.9 = fadd double %add.10019.13, 0xBFF62E42FEFA39EF
  %multiply.11888.7 = fmul double %add.10033.9, 0x3FFC71C71C71C71C
  %add.10034.5 = fadd double %multiply.11888.7, %multiply.11887.5
  %multiply.11889.1 = fmul double %param_0.580110, %add.10034.5
  %add.9442.i67 = fadd double %multiply.11889.1, 0.000000e+00
  %multiply.11905.1.clone.1 = fmul double %add.10033.9, %add.10033.9
  %multiply.11906.5.clone.1 = fmul double %multiply.11905.1.clone.1, 0x3FFC71C71C71C71C
  %add.10051.3.clone.1 = fadd double %multiply.11906.5.clone.1, 0x3FF43340BFCA50EB
  %multiply.11907.3.clone.1 = fmul double %add.10051.3.clone.1, 5.000000e-01
  %90 = fsub double 0.000000e+00, %multiply.11907.3.clone.1
  %param_4.5076 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg478, i64 0, i64 %51
  %param_4.507614 = load double, ptr addrspace(1) %param_4.5076, align 8, !invariant.load !339
  %multiply.11897.1.clone.1 = fmul double %param_0.580110, %param_4.507614
  %add.9442.i69 = fadd double %multiply.11897.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i62, ptr addrspace(1) %arg580, align 128
  br label %thread_in_bounds-after

reduction_write_output-true31:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i64, ptr addrspace(1) %arg682, align 128
  br label %thread_in_bounds-after30

reduction_write_output-true42:                    ; preds = %thread_in_bounds-after30
  store double %add.9442.i66, ptr addrspace(1) %arg784, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind
define void @input_reduce_fusion_17(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #6 {
entry:
  %arg1104 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0102 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !354
  %0 = shl nuw nsw i32 %thread.id.x, 1
  %1 = zext nneg i32 %0 to i64
  %param_0.583615 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg0102, i64 0, i64 0, i64 %1, i64 0
  %2 = load <2 x double>, ptr addrspace(1) %param_0.583615, align 16, !invariant.load !339
  %param_0.583616113 = extractelement <2 x double> %2, i32 0
  %param_0.583616.1114 = extractelement <2 x double> %2, i32 1
  %add.9442.i64 = fadd double %param_0.583616113, 0.000000e+00
  %add.9442.i64.1 = fadd double %add.9442.i64, %param_0.583616.1114
  %3 = or disjoint i32 %thread.id.x, 64
  %4 = shl nuw nsw i32 %3, 1
  %.cmp = icmp ugt i32 %3, 95
  %5 = zext i1 %.cmp to i64
  %.urem = add nsw i32 %4, -192
  %.cmp87 = icmp ult i32 %3, 96
  %6 = select i1 %.cmp87, i32 %4, i32 %.urem
  %7 = zext nneg i32 %6 to i64
  %param_0.583615.184 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg0102, i64 0, i64 %5, i64 %7, i64 0
  %param_0.583616.185 = load double, ptr addrspace(1) %param_0.583615.184, align 16, !invariant.load !339
  %add.9442.i64.186 = fadd double %add.9442.i64.1, %param_0.583616.185
  %8 = or disjoint i32 %4, 1
  %.urem88 = add nsw i32 %4, -191
  %9 = select i1 %.cmp87, i32 %8, i32 %.urem88
  %10 = zext nneg i32 %9 to i64
  %param_0.583615.1.1 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg0102, i64 0, i64 %5, i64 %10, i64 0
  %param_0.583616.1.1 = load double, ptr addrspace(1) %param_0.583615.1.1, align 8, !invariant.load !339
  %add.9442.i64.1.1 = fadd double %add.9442.i64.186, %param_0.583616.1.1
  %param_0.583615.2107 = getelementptr inbounds i8, ptr addrspace(1) %param_0.583615, i64 2048
  %11 = load <2 x double>, ptr addrspace(1) %param_0.583615.2107, align 16, !invariant.load !339
  %param_0.583616.2115 = extractelement <2 x double> %11, i32 0
  %param_0.583616.1.2116 = extractelement <2 x double> %11, i32 1
  %add.9442.i64.2 = fadd double %add.9442.i64.1.1, %param_0.583616.2115
  %add.9442.i64.1.2 = fadd double %add.9442.i64.2, %param_0.583616.1.2116
  %12 = trunc nuw nsw i32 %0 to i16
  %.lhs.trunc = or disjoint i16 %12, 384
  %13 = urem i16 %.lhs.trunc, 192
  %14 = zext nneg i16 %13 to i64
  %15 = getelementptr [4 x [192 x [1 x double]]], ptr addrspace(1) %arg0102, i64 0, i64 0, i64 %14, i64 0
  %param_0.583615.3109 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 3072
  %param_0.583616.3 = load double, ptr addrspace(1) %param_0.583615.3109, align 16, !invariant.load !339
  %add.9442.i64.3 = fadd double %add.9442.i64.1.2, %param_0.583616.3
  %.lhs.trunc90 = or disjoint i16 %12, 385
  %16 = urem i16 %.lhs.trunc90, 192
  %17 = zext nneg i16 %16 to i64
  %18 = getelementptr [4 x [192 x [1 x double]]], ptr addrspace(1) %arg0102, i64 0, i64 0, i64 %17, i64 0
  %param_0.583615.1.3110 = getelementptr inbounds i8, ptr addrspace(1) %18, i64 3072
  %param_0.583616.1.3 = load double, ptr addrspace(1) %param_0.583615.1.3110, align 8, !invariant.load !339
  %add.9442.i64.1.3 = fadd double %add.9442.i64.3, %param_0.583616.1.3
  %19 = or disjoint i32 %thread.id.x, 256
  %20 = shl nuw nsw i32 %19, 1
  %.lhs.trunc92 = trunc nuw nsw i32 %19 to i16
  %21 = udiv i16 %.lhs.trunc92, 96
  %22 = zext nneg i16 %21 to i64
  %.lhs.trunc94 = trunc nuw nsw i32 %20 to i16
  %23 = urem i16 %.lhs.trunc94, 192
  %24 = zext nneg i16 %23 to i64
  %param_0.583615.4 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg0102, i64 0, i64 %22, i64 %24, i64 0
  %param_0.583616.4 = load double, ptr addrspace(1) %param_0.583615.4, align 16, !invariant.load !339
  %add.9442.i64.4 = fadd double %add.9442.i64.1.3, %param_0.583616.4
  %.lhs.trunc96 = or disjoint i16 %.lhs.trunc94, 1
  %25 = urem i16 %.lhs.trunc96, 192
  %26 = zext nneg i16 %25 to i64
  %param_0.583615.1.4 = getelementptr inbounds [4 x [192 x [1 x double]]], ptr addrspace(1) %arg0102, i64 0, i64 %22, i64 %26, i64 0
  %param_0.583616.1.4 = load double, ptr addrspace(1) %param_0.583615.1.4, align 8, !invariant.load !339
  %add.9442.i64.1.4 = fadd double %add.9442.i64.4, %param_0.583616.1.4
  %.lhs.trunc98 = or disjoint i16 %12, 640
  %27 = urem i16 %.lhs.trunc98, 192
  %28 = zext nneg i16 %27 to i64
  %29 = getelementptr [4 x [192 x [1 x double]]], ptr addrspace(1) %arg0102, i64 0, i64 0, i64 %28, i64 0
  %param_0.583615.5111 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 4608
  %param_0.583616.5 = load double, ptr addrspace(1) %param_0.583615.5111, align 16, !invariant.load !339
  %add.9442.i64.5 = fadd double %add.9442.i64.1.4, %param_0.583616.5
  %.lhs.trunc100 = or disjoint i16 %12, 641
  %30 = urem i16 %.lhs.trunc100, 192
  %31 = zext nneg i16 %30 to i64
  %32 = getelementptr [4 x [192 x [1 x double]]], ptr addrspace(1) %arg0102, i64 0, i64 0, i64 %31, i64 0
  %param_0.583615.1.5112 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 4608
  %param_0.583616.1.5 = load double, ptr addrspace(1) %param_0.583615.1.5112, align 8, !invariant.load !339
  %add.9442.i64.1.5 = fadd double %add.9442.i64.5, %param_0.583616.1.5
  %lane_id = and i32 %thread.id.x, 31
  %33 = bitcast double %add.9442.i64.1.5 to <2 x i32>
  %34 = extractelement <2 x i32> %33, i64 0
  %35 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %34, i32 16, i32 31)
  %36 = insertelement <2 x i32> poison, i32 %35, i64 0
  %37 = extractelement <2 x i32> %33, i64 1
  %38 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 16, i32 31)
  %39 = insertelement <2 x i32> %36, i32 %38, i64 1
  %40 = bitcast <2 x i32> %39 to double
  %add.9442.i = fadd double %add.9442.i64.1.5, %40
  %41 = bitcast double %add.9442.i to <2 x i32>
  %42 = extractelement <2 x i32> %41, i64 0
  %43 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %42, i32 8, i32 31)
  %44 = insertelement <2 x i32> poison, i32 %43, i64 0
  %45 = extractelement <2 x i32> %41, i64 1
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 8, i32 31)
  %47 = insertelement <2 x i32> %44, i32 %46, i64 1
  %48 = bitcast <2 x i32> %47 to double
  %add.9442.i60 = fadd double %add.9442.i, %48
  %49 = bitcast double %add.9442.i60 to <2 x i32>
  %50 = extractelement <2 x i32> %49, i64 0
  %51 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %50, i32 4, i32 31)
  %52 = insertelement <2 x i32> poison, i32 %51, i64 0
  %53 = extractelement <2 x i32> %49, i64 1
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 4, i32 31)
  %55 = insertelement <2 x i32> %52, i32 %54, i64 1
  %56 = bitcast <2 x i32> %55 to double
  %add.9442.i61 = fadd double %add.9442.i60, %56
  %57 = bitcast double %add.9442.i61 to <2 x i32>
  %58 = extractelement <2 x i32> %57, i64 0
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 2, i32 31)
  %60 = insertelement <2 x i32> poison, i32 %59, i64 0
  %61 = extractelement <2 x i32> %57, i64 1
  %62 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 2, i32 31)
  %63 = insertelement <2 x i32> %60, i32 %62, i64 1
  %64 = bitcast <2 x i32> %63 to double
  %add.9442.i62 = fadd double %add.9442.i61, %64
  %65 = bitcast double %add.9442.i62 to <2 x i32>
  %66 = extractelement <2 x i32> %65, i64 0
  %67 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %66, i32 1, i32 31)
  %68 = extractelement <2 x i32> %65, i64 1
  %69 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %68, i32 1, i32 31)
  %70 = icmp eq i32 %lane_id, 0
  br i1 %70, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont, %reduction_write_output-true, %intra_warp_reduce_write-after
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %entry
  tail call void @llvm.nvvm.barrier0()
  %71 = icmp ult i32 %thread.id.x, 32
  br i1 %71, label %inter_warp_reduce-true, label %reduce-group-0-after

intra_warp_reduce_write-true:                     ; preds = %entry
  %72 = lshr exact i32 %thread.id.x, 5
  %73 = zext nneg i32 %72 to i64
  %74 = getelementptr inbounds [1 x [2 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 %73
  %75 = insertelement <2 x i32> poison, i32 %67, i64 0
  %76 = insertelement <2 x i32> %75, i32 %69, i64 1
  %77 = bitcast <2 x i32> %76 to double
  %add.9442.i63 = fadd double %add.9442.i62, %77
  store double %add.9442.i63, ptr addrspace(3) %74, align 8
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %78 = zext nneg i32 %lane_id to i64
  %79 = getelementptr inbounds [1 x [2 x double]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 %78
  %80 = icmp ult i32 %thread.id.x, 2
  br i1 %80, label %inter_warp_reduce-true.then71, label %inter_warp_reduce-true.cont70

inter_warp_reduce-true.then71:                    ; preds = %inter_warp_reduce-true
  %partial_reduction_result334950.then.val = load <2 x i32>, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont70

inter_warp_reduce-true.cont70:                    ; preds = %inter_warp_reduce-true, %inter_warp_reduce-true.then71
  %partial_reduction_result334950 = phi <2 x i32> [ %partial_reduction_result334950.then.val, %inter_warp_reduce-true.then71 ], [ zeroinitializer, %inter_warp_reduce-true ]
  %81 = icmp ult i32 %thread.id.x, 2
  %82 = extractelement <2 x i32> %partial_reduction_result334950, i64 0
  %83 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %82, i32 16, i32 31)
  %84 = insertelement <2 x i32> poison, i32 %83, i64 0
  %85 = extractelement <2 x i32> %partial_reduction_result334950, i64 1
  %86 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %85, i32 16, i32 31)
  %87 = insertelement <2 x i32> %84, i32 %86, i64 1
  %88 = bitcast <2 x i32> %87 to double
  br i1 %81, label %inter_warp_reduce-true.then, label %inter_warp_reduce-true.cont

inter_warp_reduce-true.then:                      ; preds = %inter_warp_reduce-true.cont70
  %.val54.then.val = load double, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont

inter_warp_reduce-true.cont:                      ; preds = %inter_warp_reduce-true.cont70, %inter_warp_reduce-true.then
  %.val54 = phi double [ %.val54.then.val, %inter_warp_reduce-true.then ], [ 0.000000e+00, %inter_warp_reduce-true.cont70 ]
  %89 = icmp ult i32 %thread.id.x, 2
  %add.9442.i65 = fadd double %.val54, %88
  br i1 %89, label %inter_warp_reduce-true.cont.then79, label %inter_warp_reduce-true.cont.cont78

inter_warp_reduce-true.cont.then79:               ; preds = %inter_warp_reduce-true.cont
  store double %add.9442.i65, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont.cont78

inter_warp_reduce-true.cont.cont78:               ; preds = %inter_warp_reduce-true.cont, %inter_warp_reduce-true.cont.then79
  %initial_value_addr.0 = phi double [ 0.000000e+00, %inter_warp_reduce-true.cont.then79 ], [ %add.9442.i65, %inter_warp_reduce-true.cont ]
  %90 = icmp ult i32 %thread.id.x, 2
  %91 = bitcast double %add.9442.i65 to <2 x i32>
  %92 = extractelement <2 x i32> %91, i64 0
  %93 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %92, i32 8, i32 31)
  %94 = insertelement <2 x i32> poison, i32 %93, i64 0
  %95 = extractelement <2 x i32> %91, i64 1
  %96 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %95, i32 8, i32 31)
  %97 = insertelement <2 x i32> %94, i32 %96, i64 1
  %98 = bitcast <2 x i32> %97 to double
  br i1 %90, label %inter_warp_reduce-true.cont.then, label %inter_warp_reduce-true.cont.cont

inter_warp_reduce-true.cont.then:                 ; preds = %inter_warp_reduce-true.cont.cont78
  %.val53.then.val = load double, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont.cont

inter_warp_reduce-true.cont.cont:                 ; preds = %inter_warp_reduce-true.cont.cont78, %inter_warp_reduce-true.cont.then
  %.val53 = phi double [ %.val53.then.val, %inter_warp_reduce-true.cont.then ], [ %initial_value_addr.0, %inter_warp_reduce-true.cont.cont78 ]
  %99 = icmp ult i32 %thread.id.x, 2
  %add.9442.i66 = fadd double %.val53, %98
  br i1 %99, label %inter_warp_reduce-true.cont.cont.then77, label %inter_warp_reduce-true.cont.cont.cont76

inter_warp_reduce-true.cont.cont.then77:          ; preds = %inter_warp_reduce-true.cont.cont
  store double %add.9442.i66, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont.cont.cont76

inter_warp_reduce-true.cont.cont.cont76:          ; preds = %inter_warp_reduce-true.cont.cont, %inter_warp_reduce-true.cont.cont.then77
  %initial_value_addr.1 = phi double [ %initial_value_addr.0, %inter_warp_reduce-true.cont.cont.then77 ], [ %add.9442.i66, %inter_warp_reduce-true.cont.cont ]
  %100 = icmp ult i32 %thread.id.x, 2
  %101 = bitcast double %add.9442.i66 to <2 x i32>
  %102 = extractelement <2 x i32> %101, i64 0
  %103 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %102, i32 4, i32 31)
  %104 = insertelement <2 x i32> poison, i32 %103, i64 0
  %105 = extractelement <2 x i32> %101, i64 1
  %106 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %105, i32 4, i32 31)
  %107 = insertelement <2 x i32> %104, i32 %106, i64 1
  %108 = bitcast <2 x i32> %107 to double
  br i1 %100, label %inter_warp_reduce-true.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont

inter_warp_reduce-true.cont.cont.then:            ; preds = %inter_warp_reduce-true.cont.cont.cont76
  %.val52.then.val = load double, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont:            ; preds = %inter_warp_reduce-true.cont.cont.cont76, %inter_warp_reduce-true.cont.cont.then
  %.val52 = phi double [ %.val52.then.val, %inter_warp_reduce-true.cont.cont.then ], [ %initial_value_addr.1, %inter_warp_reduce-true.cont.cont.cont76 ]
  %109 = icmp ult i32 %thread.id.x, 2
  %add.9442.i67 = fadd double %.val52, %108
  br i1 %109, label %inter_warp_reduce-true.cont.cont.cont.then75, label %inter_warp_reduce-true.cont.cont.cont.cont74

inter_warp_reduce-true.cont.cont.cont.then75:     ; preds = %inter_warp_reduce-true.cont.cont.cont
  store double %add.9442.i67, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont74

inter_warp_reduce-true.cont.cont.cont.cont74:     ; preds = %inter_warp_reduce-true.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.then75
  %initial_value_addr.2 = phi double [ %initial_value_addr.1, %inter_warp_reduce-true.cont.cont.cont.then75 ], [ %add.9442.i67, %inter_warp_reduce-true.cont.cont.cont ]
  %110 = icmp ult i32 %thread.id.x, 2
  %111 = bitcast double %add.9442.i67 to <2 x i32>
  %112 = extractelement <2 x i32> %111, i64 0
  %113 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %112, i32 2, i32 31)
  %114 = insertelement <2 x i32> poison, i32 %113, i64 0
  %115 = extractelement <2 x i32> %111, i64 1
  %116 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %115, i32 2, i32 31)
  %117 = insertelement <2 x i32> %114, i32 %116, i64 1
  %118 = bitcast <2 x i32> %117 to double
  br i1 %110, label %inter_warp_reduce-true.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.then:       ; preds = %inter_warp_reduce-true.cont.cont.cont.cont74
  %.val51.then.val = load double, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont:       ; preds = %inter_warp_reduce-true.cont.cont.cont.cont74, %inter_warp_reduce-true.cont.cont.cont.then
  %.val51 = phi double [ %.val51.then.val, %inter_warp_reduce-true.cont.cont.cont.then ], [ %initial_value_addr.2, %inter_warp_reduce-true.cont.cont.cont.cont74 ]
  %119 = icmp ult i32 %thread.id.x, 2
  %add.9442.i68 = fadd double %.val51, %118
  br i1 %119, label %inter_warp_reduce-true.cont.cont.cont.cont.then73, label %inter_warp_reduce-true.cont.cont.cont.cont.cont72

inter_warp_reduce-true.cont.cont.cont.cont.then73: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont
  store double %add.9442.i68, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont72

inter_warp_reduce-true.cont.cont.cont.cont.cont72: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.cont.then73
  %initial_value_addr.3 = phi double [ %initial_value_addr.2, %inter_warp_reduce-true.cont.cont.cont.cont.then73 ], [ %add.9442.i68, %inter_warp_reduce-true.cont.cont.cont.cont ]
  %120 = icmp ult i32 %thread.id.x, 2
  %121 = bitcast double %add.9442.i68 to <2 x i32>
  %122 = extractelement <2 x i32> %121, i64 0
  %123 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %122, i32 1, i32 31)
  %124 = insertelement <2 x i32> poison, i32 %123, i64 0
  %125 = extractelement <2 x i32> %121, i64 1
  %126 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %125, i32 1, i32 31)
  %127 = insertelement <2 x i32> %124, i32 %126, i64 1
  %128 = bitcast <2 x i32> %127 to double
  br i1 %120, label %inter_warp_reduce-true.cont.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.then:  ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont72
  %.val.then.val = load double, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont:  ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont72, %inter_warp_reduce-true.cont.cont.cont.cont.then
  %.val = phi double [ %.val.then.val, %inter_warp_reduce-true.cont.cont.cont.cont.then ], [ %initial_value_addr.3, %inter_warp_reduce-true.cont.cont.cont.cont.cont72 ]
  %129 = icmp ult i32 %thread.id.x, 2
  %add.9442.i69 = fadd double %.val, %128
  br i1 %129, label %inter_warp_reduce-true.cont.cont.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont
  store double %add.9442.i69, ptr addrspace(3) %79, align 8
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.cont.cont.then
  %130 = icmp eq i32 %thread.id.x, 0
  br i1 %130, label %reduction_write_output-true, label %reduce-group-0-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont
  store double %add.9442.i69, ptr addrspace(1) %arg1104, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_negate_or_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg19, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg24, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg25, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg26) local_unnamed_addr #0 {
entry:
  %arg2660 = addrspacecast ptr %arg26 to ptr addrspace(1)
  %arg2558 = addrspacecast ptr %arg25 to ptr addrspace(1)
  %arg2456 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2354 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2252 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2150 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2048 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1946 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1844 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1742 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1640 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1538 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1436 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1334 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1232 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1130 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1028 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg926 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg824 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg722 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg1334, align 128, !invariant.load !339
  %1 = load double, ptr addrspace(1) %arg1436, align 128, !invariant.load !339
  %add.10032.1.clone.1 = fadd double %0, %1
  %2 = load double, ptr addrspace(1) %arg1232, align 128, !invariant.load !339
  %add.10035.1.clone.1 = fadd double %add.10032.1.clone.1, %2
  %3 = load double, ptr addrspace(1) %arg1130, align 128, !invariant.load !339
  %add.10038.1.clone.1 = fadd double %add.10035.1.clone.1, %3
  %4 = load double, ptr addrspace(1) %arg1028, align 128, !invariant.load !339
  %add.10041.1.clone.1 = fadd double %add.10038.1.clone.1, %4
  %5 = load double, ptr addrspace(1) %arg926, align 128, !invariant.load !339
  %add.10044.1.clone.1 = fadd double %add.10041.1.clone.1, %5
  %6 = load double, ptr addrspace(1) %arg1946, align 128, !invariant.load !339
  %7 = load double, ptr addrspace(1) %arg2048, align 128, !invariant.load !339
  %add.10045.1.clone.1 = fadd double %6, %7
  %8 = load double, ptr addrspace(1) %arg1844, align 128, !invariant.load !339
  %add.10046.1.clone.1 = fadd double %add.10045.1.clone.1, %8
  %9 = load double, ptr addrspace(1) %arg1742, align 128, !invariant.load !339
  %add.10047.1.clone.1 = fadd double %add.10046.1.clone.1, %9
  %10 = load double, ptr addrspace(1) %arg1640, align 128, !invariant.load !339
  %add.10048.1.clone.1 = fadd double %add.10047.1.clone.1, %10
  %11 = load double, ptr addrspace(1) %arg1538, align 128, !invariant.load !339
  %add.10049.1.clone.1 = fadd double %add.10048.1.clone.1, %11
  %multiply.11901.5.clone.1 = fmul double %add.10049.1.clone.1, 9.998000e-01
  %12 = fadd double %add.10044.1.clone.1, %multiply.11901.5.clone.1
  %13 = load double, ptr addrspace(1) %arg722, align 128, !invariant.load !339
  %14 = load double, ptr addrspace(1) %arg824, align 128, !invariant.load !339
  %add.10052.1.clone.1 = fadd double %13, %14
  %15 = load double, ptr addrspace(1) %arg620, align 128, !invariant.load !339
  %add.10054.1.clone.1 = fadd double %add.10052.1.clone.1, %15
  %16 = load double, ptr addrspace(1) %arg518, align 128, !invariant.load !339
  %add.10056.1.clone.1 = fadd double %add.10054.1.clone.1, %16
  %17 = load double, ptr addrspace(1) %arg416, align 128, !invariant.load !339
  %add.10058.1.clone.1 = fadd double %add.10056.1.clone.1, %17
  %18 = load double, ptr addrspace(1) %arg314, align 128, !invariant.load !339
  %add.10060.1.clone.1 = fadd double %add.10058.1.clone.1, %18
  %19 = load double, ptr addrspace(1) %arg212, align 128, !invariant.load !339
  %add.10061.1.clone.1 = fadd double %add.10060.1.clone.1, %19
  %20 = fneg double %add.10061.1.clone.1
  %21 = load double, ptr addrspace(1) %arg07, align 128, !invariant.load !339
  %subtract.878.5.clone.1 = fsub double %20, %21
  %22 = tail call double @llvm.fabs.f64(double %21)
  %multiply.11918.5.clone.1 = fmul double %22, 0x3EB0C6F7A0B5ED8D
  %subtract.879.5.clone.1 = fsub double %subtract.878.5.clone.1, %multiply.11918.5.clone.1
  %23 = fcmp uno double %12, 0.000000e+00
  %24 = fcmp oge double %12, %subtract.879.5.clone.1
  %25 = or i1 %23, %24
  %maximum.74.5.clone.1 = select i1 %25, double %12, double %subtract.879.5.clone.1
  %26 = load double, ptr addrspace(1) %arg110, align 128, !invariant.load !339
  %multiply.11919.5.clone.1 = fmul double %26, 1.000000e-04
  %multiply.11920.5.clone.1 = fmul double %add.10049.1.clone.1, %multiply.11919.5.clone.1
  %subtract.880.5.clone.1 = fsub double %subtract.878.5.clone.1, %multiply.11920.5.clone.1
  %27 = fcmp uno double %maximum.74.5.clone.1, 0.000000e+00
  %28 = fcmp ole double %maximum.74.5.clone.1, %subtract.880.5.clone.1
  %29 = or i1 %27, %28
  %minimum.28.5.clone.1 = select i1 %29, double %maximum.74.5.clone.1, double %subtract.880.5.clone.1
  %.inv = fcmp olt double %minimum.28.5.clone.1, 0.000000e+00
  %maximum.75.5.clone.1 = select i1 %.inv, double 0.000000e+00, double %minimum.28.5.clone.1
  %compare.2749.5.clone.1 = fcmp uno double %maximum.75.5.clone.1, 0.000000e+00
  %30 = select i1 %compare.2749.5.clone.1, double 0x7FF0000000000000, double %maximum.75.5.clone.1
  %31 = tail call double @llvm.fabs.f64(double %add.10044.1.clone.1)
  %32 = tail call double @llvm.fabs.f64(double %add.10049.1.clone.1)
  %multiply.11921.5.clone.1 = fmul double %32, 9.000000e-01
  %subtract.881.5.clone.1 = fsub double %31, %multiply.11921.5.clone.1
  %.inv6 = fcmp olt double %subtract.881.5.clone.1, 0.000000e+00
  %maximum.76.5.clone.1 = select i1 %.inv6, double 0.000000e+00, double %subtract.881.5.clone.1
  %compare.2750.5.clone.1 = fcmp uno double %maximum.76.5.clone.1, 0.000000e+00
  %33 = select i1 %compare.2750.5.clone.1, double 0x7FF0000000000000, double %maximum.76.5.clone.1
  %34 = fcmp oge double %30, %33
  %maximum.77.5.clone.1 = select i1 %34, double %30, double %33
  %compare.2751.5.clone.1 = fcmp ole double %maximum.77.5.clone.1, 0.000000e+00
  %compare.2752.1.clone.1 = fcmp oge double %26, 1.000000e+00
  %compare.2753.2.clone.1 = fcmp ogt double %30, 0.000000e+00
  %compare.2754.5.clone.1 = fcmp oge double %add.10044.1.clone.1, 0.000000e+00
  %35 = or i1 %compare.2754.5.clone.1, %compare.2753.2.clone.1
  %36 = or i1 %35, %compare.2751.5.clone.1
  %37 = zext i1 %36 to i8
  %38 = xor i1 %35, true
  %39 = and i1 %compare.2752.1.clone.1, %38
  %40 = or i1 %compare.2751.5.clone.1, %39
  %41 = zext i1 %40 to i8
  %42 = select i1 %40, double %20, double %21
  store double %42, ptr addrspace(1) %arg2150, align 128
  store i8 %41, ptr addrspace(1) %arg2252, align 128
  store i8 %37, ptr addrspace(1) %arg2354, align 128
  store double %20, ptr addrspace(1) %arg2456, align 128
  store double %add.10044.1.clone.1, ptr addrspace(1) %arg2558, align 128
  store double %add.10049.1.clone.1, ptr addrspace(1) %arg2660, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_37(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg7) local_unnamed_addr #0 {
entry:
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg25, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !339
  %7 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !339
  %8 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %multiply.11874.11 = fmul double %7, %9
  %add.10025.11 = fadd double %6, %multiply.11874.11
  %add.10028.1 = fadd double %4, %add.10025.11
  %10 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !339
  %12 = trunc i8 %1 to i1
  %13 = select i1 %12, double %add.10028.1, double %11
  %14 = select i1 %12, double %add.10025.11, double %6
  %15 = getelementptr double, ptr addrspace(1) %arg613, i64 %2
  store double %13, ptr addrspace(1) %15, align 8
  %16 = getelementptr double, ptr addrspace(1) %arg715, i64 %2
  store double %14, ptr addrspace(1) %16, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_33(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg7) local_unnamed_addr #0 {
entry:
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !339
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %2
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %multiply.11870.5 = fmul double %5, %7
  %add.10023.5 = fadd double %4, %multiply.11870.5
  %8 = trunc i8 %1 to i1
  %9 = select i1 %8, double %add.10023.5, double %4
  %10 = getelementptr double, ptr addrspace(1) %arg511, i64 %2
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !339
  %add.10030.7.clone.1 = fadd double %add.10023.5, -1.000000e+00
  %multiply.11884.5.clone.1 = fmul double %add.10030.7.clone.1, 4.000000e+00
  %add.10031.3.clone.1 = fadd double %11, %multiply.11884.5.clone.1
  %12 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %13 = load double, ptr addrspace(1) %12, align 8, !invariant.load !339
  %14 = select i1 %8, double %add.10031.3.clone.1, double %13
  %15 = getelementptr double, ptr addrspace(1) %arg613, i64 %2
  store double %9, ptr addrspace(1) %15, align 8
  %16 = getelementptr double, ptr addrspace(1) %arg715, i64 %2
  store double %14, ptr addrspace(1) %16, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_38(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg7) local_unnamed_addr #0 {
entry:
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg25, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !339
  %7 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !339
  %8 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %multiply.11866.19 = fmul double %7, %9
  %add.10019.19 = fadd double %6, %multiply.11866.19
  %10 = tail call double @llvm.fma.f64(double %add.10019.19, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #11
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #11
  %13 = tail call double @llvm.fma.f64(double %12, double 0xBFE62E42FEFA39EF, double %add.10019.19)
  %14 = tail call double @llvm.fma.f64(double %12, double 0xBC7ABC9E3B39803F, double %13)
  %15 = tail call double @llvm.fma.f64(double %14, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %16 = tail call double @llvm.fma.f64(double %15, double %14, double 0x3EC71DEE62401315)
  %17 = tail call double @llvm.fma.f64(double %16, double %14, double 0x3EFA01997C89EB71)
  %18 = tail call double @llvm.fma.f64(double %17, double %14, double 0x3F2A01A014761F65)
  %19 = tail call double @llvm.fma.f64(double %18, double %14, double 0x3F56C16C1852B7AF)
  %20 = tail call double @llvm.fma.f64(double %19, double %14, double 0x3F81111111122322)
  %21 = tail call double @llvm.fma.f64(double %20, double %14, double 0x3FA55555555502A1)
  %22 = tail call double @llvm.fma.f64(double %21, double %14, double 0x3FC5555555555511)
  %23 = tail call double @llvm.fma.f64(double %22, double %14, double 0x3FE000000000000B)
  %24 = tail call double @llvm.fma.f64(double %23, double %14, double 1.000000e+00)
  %25 = tail call double @llvm.fma.f64(double %24, double %14, double 1.000000e+00)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #11
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #11
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #11
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %add.10019.19) #11
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #11
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp olt double %add.10019.19, 0.000000e+00
  %36 = fadd double %add.10019.19, 0x7FF0000000000000
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #11
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #11
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.11887.3 = fmul double %4, %z.2.i
  %add.10033.7 = fadd double %add.10019.19, 0xBFF62E42FEFA39EF
  %multiply.11888.5 = fmul double %add.10033.7, 0x3FFC71C71C71C71C
  %add.10034.3 = fadd double %multiply.11888.5, %multiply.11887.3
  %48 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !339
  %50 = trunc i8 %1 to i1
  %51 = select i1 %50, double %add.10034.3, double %49
  %52 = select i1 %50, double %add.10019.19, double %6
  %53 = getelementptr double, ptr addrspace(1) %arg613, i64 %2
  store double %51, ptr addrspace(1) %53, align 8
  %54 = getelementptr double, ptr addrspace(1) %arg715, i64 %2
  store double %52, ptr addrspace(1) %54, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_34(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #0 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !339
  %7 = trunc i8 %1 to i1
  %8 = select i1 %7, double %4, double %6
  %9 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  %add.10036.7.clone.1 = fadd double %4, -1.000000e+00
  %add.10037.3.clone.1 = fadd double %add.10036.7.clone.1, %10
  %11 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !339
  %13 = select i1 %7, double %add.10037.3.clone.1, double %12
  %14 = getelementptr double, ptr addrspace(1) %arg511, i64 %2
  store double %8, ptr addrspace(1) %14, align 8
  %15 = getelementptr double, ptr addrspace(1) %arg613, i64 %2
  store double %13, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_35(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #0 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !339
  %7 = trunc i8 %1 to i1
  %8 = select i1 %7, double %4, double %6
  %9 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  %add.10039.7.clone.1 = fadd double %4, 4.000000e+00
  %multiply.11891.5.clone.1 = fmul double %add.10039.7.clone.1, 2.500000e-01
  %add.10040.3.clone.1 = fadd double %10, %multiply.11891.5.clone.1
  %11 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !339
  %13 = select i1 %7, double %add.10040.3.clone.1, double %12
  %14 = getelementptr double, ptr addrspace(1) %arg511, i64 %2
  store double %8, ptr addrspace(1) %14, align 8
  %15 = getelementptr double, ptr addrspace(1) %arg613, i64 %2
  store double %13, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_36(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg6) local_unnamed_addr #0 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !339
  %7 = trunc i8 %1 to i1
  %8 = select i1 %7, double %4, double %6
  %9 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  %add.10042.7.clone.1 = fadd double %4, 6.000000e+00
  %multiply.11893.5.clone.1 = fmul double %add.10042.7.clone.1, 2.500000e-01
  %add.10043.3.clone.1 = fadd double %10, %multiply.11893.5.clone.1
  %11 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !339
  %13 = select i1 %7, double %add.10043.3.clone.1, double %12
  %14 = getelementptr double, ptr addrspace(1) %arg511, i64 %2
  store double %8, ptr addrspace(1) %14, align 8
  %15 = getelementptr double, ptr addrspace(1) %arg613, i64 %2
  store double %13, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_42(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg514 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg412 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg310 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg16, align 128, !invariant.load !339
  %compare.2754.11 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg28, align 128, !invariant.load !339
  %multiply.11901.17 = fmul double %1, 9.998000e-01
  %2 = fadd double %0, %multiply.11901.17
  %3 = load double, ptr addrspace(1) %arg412, align 128, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg310, align 128, !invariant.load !339
  %subtract.878.17 = fsub double %3, %4
  %5 = tail call double @llvm.fabs.f64(double %4)
  %multiply.11918.17 = fmul double %5, 0x3EB0C6F7A0B5ED8D
  %subtract.879.17 = fsub double %subtract.878.17, %multiply.11918.17
  %6 = fcmp uno double %2, 0.000000e+00
  %7 = fcmp oge double %2, %subtract.879.17
  %8 = or i1 %6, %7
  %maximum.74.17 = select i1 %8, double %2, double %subtract.879.17
  %9 = load double, ptr addrspace(1) %arg04, align 128, !invariant.load !339
  %multiply.11919.17 = fmul double %9, 1.000000e-04
  %multiply.11920.17 = fmul double %1, %multiply.11919.17
  %subtract.880.17 = fsub double %subtract.878.17, %multiply.11920.17
  %10 = fcmp uno double %maximum.74.17, 0.000000e+00
  %11 = fcmp ole double %maximum.74.17, %subtract.880.17
  %12 = or i1 %10, %11
  %minimum.28.17 = select i1 %12, double %maximum.74.17, double %subtract.880.17
  %.inv = fcmp olt double %minimum.28.17, 0.000000e+00
  %maximum.75.17 = select i1 %.inv, double 0.000000e+00, double %minimum.28.17
  %compare.2753.12 = fcmp ole double %maximum.75.17, 0.000000e+00
  %13 = and i1 %compare.2754.11, %compare.2753.12
  %14 = select i1 %13, double 0.000000e+00, double %9
  store double %14, ptr addrspace(1) %arg514, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_40(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg27, align 128, !invariant.load !339
  %compare.2754.7 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg39, align 128, !invariant.load !339
  %multiply.11901.13 = fmul double %1, 9.998000e-01
  %2 = fadd double %0, %multiply.11901.13
  %3 = load double, ptr addrspace(1) %arg03, align 128, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !339
  %subtract.878.13 = fsub double %3, %4
  %5 = tail call double @llvm.fabs.f64(double %4)
  %multiply.11918.13 = fmul double %5, 0x3EB0C6F7A0B5ED8D
  %subtract.879.13 = fsub double %subtract.878.13, %multiply.11918.13
  %6 = fcmp uno double %2, 0.000000e+00
  %7 = fcmp oge double %2, %subtract.879.13
  %8 = or i1 %6, %7
  %maximum.74.13 = select i1 %8, double %2, double %subtract.879.13
  %9 = load double, ptr addrspace(1) %arg411, align 128, !invariant.load !339
  %multiply.11919.13 = fmul double %9, 1.000000e-04
  %multiply.11920.13 = fmul double %1, %multiply.11919.13
  %subtract.880.13 = fsub double %subtract.878.13, %multiply.11920.13
  %10 = fcmp uno double %maximum.74.13, 0.000000e+00
  %11 = fcmp ole double %maximum.74.13, %subtract.880.13
  %12 = or i1 %10, %11
  %minimum.28.13 = select i1 %12, double %maximum.74.13, double %subtract.880.13
  %.inv = fcmp olt double %minimum.28.13, 0.000000e+00
  %maximum.75.13 = select i1 %.inv, double 0.000000e+00, double %minimum.28.13
  %compare.2753.8 = fcmp ole double %maximum.75.13, 0.000000e+00
  %13 = and i1 %compare.2754.7, %compare.2753.8
  %14 = select i1 %13, double %3, double %4
  store double %14, ptr addrspace(1) %arg513, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_43(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg27, align 128, !invariant.load !339
  %compare.2754.13 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg39, align 128, !invariant.load !339
  %multiply.11901.19 = fmul double %1, 9.998000e-01
  %2 = fadd double %0, %multiply.11901.19
  %3 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg03, align 128, !invariant.load !339
  %subtract.878.19 = fsub double %3, %4
  %5 = tail call double @llvm.fabs.f64(double %4)
  %multiply.11918.19 = fmul double %5, 0x3EB0C6F7A0B5ED8D
  %subtract.879.19 = fsub double %subtract.878.19, %multiply.11918.19
  %6 = fcmp uno double %2, 0.000000e+00
  %7 = fcmp oge double %2, %subtract.879.19
  %8 = or i1 %6, %7
  %maximum.74.19 = select i1 %8, double %2, double %subtract.879.19
  %9 = load double, ptr addrspace(1) %arg411, align 128, !invariant.load !339
  %multiply.11919.19 = fmul double %9, 1.000000e-04
  %multiply.11920.19 = fmul double %1, %multiply.11919.19
  %subtract.880.19 = fsub double %subtract.878.19, %multiply.11920.19
  %10 = fcmp uno double %maximum.74.19, 0.000000e+00
  %11 = fcmp ole double %maximum.74.19, %subtract.880.19
  %12 = or i1 %10, %11
  %minimum.28.19 = select i1 %12, double %maximum.74.19, double %subtract.880.19
  %.inv = fcmp olt double %minimum.28.19, 0.000000e+00
  %maximum.75.19 = select i1 %.inv, double 0.000000e+00, double %minimum.28.19
  %compare.2753.14 = fcmp ole double %maximum.75.19, 0.000000e+00
  %13 = and i1 %compare.2754.13, %compare.2753.14
  %14 = select i1 %13, double %4, double %3
  store double %14, ptr addrspace(1) %arg513, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_39(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg514 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg412 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg310 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg16, align 128, !invariant.load !339
  %compare.2754.3 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg28, align 128, !invariant.load !339
  %multiply.11901.11 = fmul double %1, 9.998000e-01
  %2 = fadd double %0, %multiply.11901.11
  %3 = load double, ptr addrspace(1) %arg412, align 128, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg310, align 128, !invariant.load !339
  %subtract.878.11 = fsub double %3, %4
  %5 = tail call double @llvm.fabs.f64(double %4)
  %multiply.11918.11 = fmul double %5, 0x3EB0C6F7A0B5ED8D
  %subtract.879.11 = fsub double %subtract.878.11, %multiply.11918.11
  %6 = fcmp uno double %2, 0.000000e+00
  %7 = fcmp oge double %2, %subtract.879.11
  %8 = or i1 %6, %7
  %maximum.74.11 = select i1 %8, double %2, double %subtract.879.11
  %9 = load double, ptr addrspace(1) %arg04, align 128, !invariant.load !339
  %multiply.11919.11 = fmul double %9, 1.000000e-04
  %multiply.11920.11 = fmul double %1, %multiply.11919.11
  %subtract.880.11 = fsub double %subtract.878.11, %multiply.11920.11
  %10 = fcmp uno double %maximum.74.11, 0.000000e+00
  %11 = fcmp ole double %maximum.74.11, %subtract.880.11
  %12 = or i1 %10, %11
  %minimum.28.11 = select i1 %12, double %maximum.74.11, double %subtract.880.11
  %.inv = fcmp olt double %minimum.28.11, 0.000000e+00
  %maximum.75.11 = select i1 %.inv, double 0.000000e+00, double %minimum.28.11
  %compare.2753.4 = fcmp ole double %maximum.75.11, 0.000000e+00
  %13 = and i1 %compare.2754.3, %compare.2753.4
  %14 = select i1 %13, double %9, double 0.000000e+00
  store double %14, ptr addrspace(1) %arg514, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_41(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg03, align 128, !invariant.load !339
  %compare.2754.9 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !339
  %multiply.11901.15 = fmul double %1, 9.998000e-01
  %2 = fadd double %0, %multiply.11901.15
  %3 = load double, ptr addrspace(1) %arg411, align 128, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg39, align 128, !invariant.load !339
  %subtract.878.15 = fsub double %3, %4
  %5 = tail call double @llvm.fabs.f64(double %4)
  %multiply.11918.15 = fmul double %5, 0x3EB0C6F7A0B5ED8D
  %subtract.879.15 = fsub double %subtract.878.15, %multiply.11918.15
  %6 = fcmp uno double %2, 0.000000e+00
  %7 = fcmp oge double %2, %subtract.879.15
  %8 = or i1 %6, %7
  %maximum.74.15 = select i1 %8, double %2, double %subtract.879.15
  %9 = load double, ptr addrspace(1) %arg27, align 128, !invariant.load !339
  %multiply.11919.15 = fmul double %9, 1.000000e-04
  %multiply.11920.15 = fmul double %1, %multiply.11919.15
  %subtract.880.15 = fsub double %subtract.878.15, %multiply.11920.15
  %10 = fcmp uno double %maximum.74.15, 0.000000e+00
  %11 = fcmp ole double %maximum.74.15, %subtract.880.15
  %12 = or i1 %10, %11
  %minimum.28.15 = select i1 %12, double %maximum.74.15, double %subtract.880.15
  %.inv = fcmp olt double %minimum.28.15, 0.000000e+00
  %maximum.75.15 = select i1 %.inv, double 0.000000e+00, double %minimum.28.15
  %compare.2753.10 = fcmp ole double %maximum.75.15, 0.000000e+00
  %13 = and i1 %compare.2754.9, %compare.2753.10
  %14 = select i1 %13, double %0, double %1
  store double %14, ptr addrspace(1) %arg513, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_32(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg411, align 128, !invariant.load !339
  %1 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !339
  %multiply.11901.7 = fmul double %1, 9.998000e-01
  %2 = fadd double %0, %multiply.11901.7
  %3 = load double, ptr addrspace(1) %arg39, align 128, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg27, align 128, !invariant.load !339
  %subtract.878.7 = fsub double %3, %4
  %5 = tail call double @llvm.fabs.f64(double %4)
  %multiply.11918.7 = fmul double %5, 0x3EB0C6F7A0B5ED8D
  %subtract.879.7 = fsub double %subtract.878.7, %multiply.11918.7
  %6 = fcmp uno double %2, 0.000000e+00
  %7 = fcmp oge double %2, %subtract.879.7
  %8 = or i1 %6, %7
  %maximum.74.7 = select i1 %8, double %2, double %subtract.879.7
  %9 = load double, ptr addrspace(1) %arg03, align 128, !invariant.load !339
  %multiply.11919.7 = fmul double %9, 1.000000e-04
  %multiply.11920.7 = fmul double %1, %multiply.11919.7
  %subtract.880.7 = fsub double %subtract.878.7, %multiply.11920.7
  %10 = fcmp uno double %maximum.74.7, 0.000000e+00
  %11 = fcmp ole double %maximum.74.7, %subtract.880.7
  %12 = or i1 %10, %11
  %minimum.28.7 = select i1 %12, double %maximum.74.7, double %subtract.880.7
  %.inv = fcmp olt double %minimum.28.7, 0.000000e+00
  %maximum.75.7 = select i1 %.inv, double 0.000000e+00, double %minimum.28.7
  %13 = fcmp ole double %maximum.75.7, 0.000000e+00
  %14 = select i1 %13, double %9, double 0.000000e+00
  store double %14, ptr addrspace(1) %arg513, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_44(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg15, align 128, !invariant.load !339
  %compare.2754.15 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg03, align 128, !invariant.load !339
  %multiply.11901.9 = fmul double %1, 9.998000e-01
  %2 = fadd double %0, %multiply.11901.9
  %3 = load double, ptr addrspace(1) %arg411, align 128, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg39, align 128, !invariant.load !339
  %subtract.878.9 = fsub double %3, %4
  %5 = tail call double @llvm.fabs.f64(double %4)
  %multiply.11918.9 = fmul double %5, 0x3EB0C6F7A0B5ED8D
  %subtract.879.9 = fsub double %subtract.878.9, %multiply.11918.9
  %6 = fcmp uno double %2, 0.000000e+00
  %7 = fcmp oge double %2, %subtract.879.9
  %8 = or i1 %6, %7
  %maximum.74.9 = select i1 %8, double %2, double %subtract.879.9
  %9 = load double, ptr addrspace(1) %arg27, align 128, !invariant.load !339
  %multiply.11919.9 = fmul double %9, 1.000000e-04
  %multiply.11920.9 = fmul double %1, %multiply.11919.9
  %subtract.880.9 = fsub double %subtract.878.9, %multiply.11920.9
  %10 = fcmp uno double %maximum.74.9, 0.000000e+00
  %11 = fcmp ole double %maximum.74.9, %subtract.880.9
  %12 = or i1 %10, %11
  %minimum.28.9 = select i1 %12, double %maximum.74.9, double %subtract.880.9
  %.inv = fcmp olt double %minimum.28.9, 0.000000e+00
  %maximum.75.9 = select i1 %.inv, double 0.000000e+00, double %minimum.28.9
  %compare.2753.16 = fcmp ole double %maximum.75.9, 0.000000e+00
  %13 = and i1 %compare.2754.15, %compare.2753.16
  %14 = select i1 %13, double %1, double %0
  store double %14, ptr addrspace(1) %arg513, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_and_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %1 = load i8, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %2 = or i8 %1, %0
  %3 = trunc i8 %2 to i1
  %4 = xor i1 %3, true
  %5 = load i64, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %6 = icmp slt i64 %5, 29
  %7 = and i1 %6, %4
  %8 = zext i1 %7 to i8
  store i8 %8, ptr addrspace(1) %arg37, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_convert(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %1 = zext i8 %0 to i32
  store i32 %1, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_minimum_fusion(ptr noalias nocapture align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %1 = icmp eq i64 %0, 0
  %2 = load double, ptr addrspace(1) %arg01, align 128
  %3 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %multiply.11383.1 = fmul double %3, 2.000000e+00
  %4 = select i1 %1, double %2, double %multiply.11383.1
  %5 = fcmp uno double %4, 0.000000e+00
  %6 = fcmp ole double %4, 1.000000e+00
  %7 = or i1 %5, %6
  %minimum.23.1 = select i1 %7, double %4, double 1.000000e+00
  store double %minimum.23.1, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_add_reduce_fusion(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #3 {
entry:
  %arg424 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg322 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %18, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i14 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %17 = zext nneg i32 %thread.id.x to i64
  %param_0.1426 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg016, i64 0, i64 %17
  %param_0.14262 = load double, ptr addrspace(1) %param_0.1426, align 8, !invariant.load !339
  %param_2.1648 = load double, ptr addrspace(1) %arg220, align 128, !invariant.load !339
  %param_1.2018 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg118, i64 0, i64 %17
  %param_1.20183 = load double, ptr addrspace(1) %param_1.2018, align 8, !invariant.load !339
  %multiply.11388.1 = fmul double %param_2.1648, %param_1.20183
  %add.9565.1 = fadd double %param_0.14262, %multiply.11388.1
  %add.9572.3.clone.1 = fadd double %add.9565.1, -1.000000e+00
  %multiply.11425.1.clone.1 = fmul double %add.9572.3.clone.1, %add.9572.3.clone.1
  %multiply.11426.5.clone.1 = fmul double %multiply.11425.1.clone.1, 4.000000e+00
  %add.9594.3.clone.1 = fadd double %multiply.11426.5.clone.1, 0x3FDCE6BB25AA1315
  %multiply.11427.3.clone.1 = fmul double %add.9594.3.clone.1, 5.000000e-01
  %18 = fsub double 0.000000e+00, %multiply.11427.3.clone.1
  %19 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg322, i64 0, i64 %17
  store double %add.9565.1, ptr addrspace(1) %19, align 8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i14, ptr addrspace(1) %arg424, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg10) local_unnamed_addr #8 {
entry:
  %arg10144 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9142 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8140 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7138 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6136 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5134 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4132 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3130 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2128 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1126 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0124 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %block.id.y = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !348
  %trunc = trunc nuw i32 %block.id.y to i1
  %thread.id.x31 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  br i1 %trunc, label %reduce-group-1-true, label %reduce-group-0-true

reduce-group-1-after.sink.split:                  ; preds = %thread_in_bounds-after69, %thread_in_bounds-after
  %.sink123 = phi i32 [ %31, %thread_in_bounds-after ], [ %64, %thread_in_bounds-after69 ]
  %.sink122 = phi i32 [ %33, %thread_in_bounds-after ], [ %66, %thread_in_bounds-after69 ]
  %add.9442.i111.sink = phi double [ %add.9442.i111, %thread_in_bounds-after ], [ %add.9442.i117, %thread_in_bounds-after69 ]
  %arg8.sink = phi ptr addrspace(1) [ %arg8140, %thread_in_bounds-after ], [ %arg10144, %thread_in_bounds-after69 ]
  %0 = insertelement <2 x i32> poison, i32 %.sink123, i64 0
  %1 = insertelement <2 x i32> %0, i32 %.sink122, i64 1
  %2 = bitcast <2 x i32> %1 to double
  %add.9442.i112 = fadd double %add.9442.i111.sink, %2
  store double %add.9442.i112, ptr addrspace(1) %arg8.sink, align 128
  br label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduce-group-1-after.sink.split, %thread_in_bounds-after, %thread_in_bounds-after69
  ret void

reduce-group-0-true:                              ; preds = %entry
  %3 = icmp ult i32 %thread.id.x31, 4
  br i1 %3, label %x_in_tile-true, label %loop1.loop_exit

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %reduce-group-0-true
  %partial_reduction_result2.0 = phi double [ %35, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %partial_reduction_result.0 = phi double [ %add.9442.i113, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %4 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %5 = extractelement <2 x i32> %4, i64 0
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> poison, i32 %6, i64 0
  %8 = extractelement <2 x i32> %4, i64 1
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 2, i32 31)
  %10 = insertelement <2 x i32> %7, i32 %9, i64 1
  %11 = bitcast <2 x i32> %10 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %11
  %12 = bitcast double %add.9442.i to <2 x i32>
  %13 = extractelement <2 x i32> %12, i64 0
  %14 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 1, i32 31)
  %15 = extractelement <2 x i32> %12, i64 1
  %16 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x31, 0
  %17 = insertelement <2 x i32> poison, i32 %14, i64 0
  %18 = insertelement <2 x i32> %17, i32 %16, i64 1
  %19 = bitcast <2 x i32> %18 to double
  %add.9442.i110 = fadd double %add.9442.i, %19
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %20 = icmp eq i32 %thread.id.x31, 0
  %21 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %22 = extractelement <2 x i32> %21, i64 0
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> poison, i32 %23, i64 0
  %25 = extractelement <2 x i32> %21, i64 1
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 2, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 1
  %28 = bitcast <2 x i32> %27 to double
  %add.9442.i111 = fadd double %partial_reduction_result2.0, %28
  %29 = bitcast double %add.9442.i111 to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 1, i32 31)
  %32 = extractelement <2 x i32> %29, i64 1
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 1, i32 31)
  br i1 %20, label %reduce-group-1-after.sink.split, label %reduce-group-1-after

x_in_tile-true:                                   ; preds = %reduce-group-0-true
  %34 = zext nneg i32 %thread.id.x31 to i64
  %param_1.2118 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1126, i64 0, i64 %34
  %param_1.21185 = load double, ptr addrspace(1) %param_1.2118, align 8, !invariant.load !339
  %param_2.1780 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2128, i64 0, i64 %34
  %param_2.17806 = load double, ptr addrspace(1) %param_2.1780, align 8, !invariant.load !339
  %add.9581.9 = fadd double %param_2.17806, 4.000000e+00
  %multiply.11409.7 = fmul double %add.9581.9, 2.500000e-01
  %add.9582.5 = fadd double %param_1.21185, %multiply.11409.7
  %param_0.1521 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg0124, i64 0, i64 %34
  %param_0.15217 = load double, ptr addrspace(1) %param_0.1521, align 8, !invariant.load !339
  %multiply.11410.1 = fmul double %param_0.15217, %add.9582.5
  %add.9442.i113 = fadd double %multiply.11410.1, 0.000000e+00
  %multiply.11414.1.clone.1 = fmul double %add.9581.9, %add.9581.9
  %multiply.11415.3.clone.1 = fmul double %multiply.11414.1.clone.1, 2.500000e-01
  %add.9587.3.clone.1 = fadd double %multiply.11415.3.clone.1, 0x4009CB1A63AF7C52
  %multiply.11416.3.clone.1 = fmul double %add.9587.3.clone.1, 5.000000e-01
  %35 = fsub double 0.000000e+00, %multiply.11416.3.clone.1
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i110, ptr addrspace(1) %arg7138, align 128
  br label %thread_in_bounds-after

reduce-group-1-true:                              ; preds = %entry
  %36 = icmp ult i32 %thread.id.x31, 4
  br i1 %36, label %x_in_tile-true52, label %loop1.loop_exit40

loop1.loop_exit40:                                ; preds = %__nv_exp.exit, %reduce-group-1-true
  %partial_reduction_result26.0 = phi double [ %68, %__nv_exp.exit ], [ 0.000000e+00, %reduce-group-1-true ]
  %partial_reduction_result29.0 = phi double [ %add.9442.i120, %__nv_exp.exit ], [ 0.000000e+00, %reduce-group-1-true ]
  %37 = bitcast double %partial_reduction_result26.0 to <2 x i32>
  %38 = extractelement <2 x i32> %37, i64 0
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 2, i32 31)
  %40 = insertelement <2 x i32> poison, i32 %39, i64 0
  %41 = extractelement <2 x i32> %37, i64 1
  %42 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %41, i32 2, i32 31)
  %43 = insertelement <2 x i32> %40, i32 %42, i64 1
  %44 = bitcast <2 x i32> %43 to double
  %add.9442.i115 = fadd double %partial_reduction_result26.0, %44
  %45 = bitcast double %add.9442.i115 to <2 x i32>
  %46 = extractelement <2 x i32> %45, i64 0
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 1, i32 31)
  %48 = extractelement <2 x i32> %45, i64 1
  %49 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 1, i32 31)
  %or.cond88 = icmp eq i32 %thread.id.x31, 0
  %50 = insertelement <2 x i32> poison, i32 %47, i64 0
  %51 = insertelement <2 x i32> %50, i32 %49, i64 1
  %52 = bitcast <2 x i32> %51 to double
  %add.9442.i116 = fadd double %add.9442.i115, %52
  br i1 %or.cond88, label %reduction_write_output-true70, label %thread_in_bounds-after69

thread_in_bounds-after69:                         ; preds = %reduction_write_output-true70, %loop1.loop_exit40
  %53 = icmp eq i32 %thread.id.x31, 0
  %54 = bitcast double %partial_reduction_result29.0 to <2 x i32>
  %55 = extractelement <2 x i32> %54, i64 0
  %56 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %55, i32 2, i32 31)
  %57 = insertelement <2 x i32> poison, i32 %56, i64 0
  %58 = extractelement <2 x i32> %54, i64 1
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 2, i32 31)
  %60 = insertelement <2 x i32> %57, i32 %59, i64 1
  %61 = bitcast <2 x i32> %60 to double
  %add.9442.i117 = fadd double %partial_reduction_result29.0, %61
  %62 = bitcast double %add.9442.i117 to <2 x i32>
  %63 = extractelement <2 x i32> %62, i64 0
  %64 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %63, i32 1, i32 31)
  %65 = extractelement <2 x i32> %62, i64 1
  %66 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %65, i32 1, i32 31)
  br i1 %53, label %reduce-group-1-after.sink.split, label %reduce-group-1-after

x_in_tile-true52:                                 ; preds = %reduce-group-1-true
  %67 = zext nneg i32 %thread.id.x31 to i64
  %param_5.4131 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg5134, i64 0, i64 %67
  %param_5.413154 = load double, ptr addrspace(1) %param_5.4131, align 8, !invariant.load !339
  %param_6.3464 = load double, ptr addrspace(1) %arg6136, align 128, !invariant.load !339
  %param_3.5782 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3130, i64 0, i64 %67
  %param_3.578255 = load double, ptr addrspace(1) %param_3.5782, align 8, !invariant.load !339
  %multiply.11384.13.clone.1 = fmul double %param_6.3464, %param_3.578255
  %add.9561.13.clone.1 = fadd double %param_5.413154, %multiply.11384.13.clone.1
  %add.9575.9.clone.1 = fadd double %add.9561.13.clone.1, 0xBFF62E42FEFA39EF
  %multiply.11417.1.clone.1.clone.1 = fmul double %add.9575.9.clone.1, %add.9575.9.clone.1
  %multiply.11418.5.clone.1.clone.1 = fmul double %multiply.11417.1.clone.1.clone.1, 0x3FFC71C71C71C71C
  %add.9588.3.clone.1.clone.1 = fadd double %multiply.11418.5.clone.1.clone.1, 0x3FF43340BFCA50EB
  %multiply.11419.3.clone.1.clone.1 = fmul double %add.9588.3.clone.1.clone.1, 5.000000e-01
  %68 = fsub double 0.000000e+00, %multiply.11419.3.clone.1.clone.1
  %param_4.5093 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4132, i64 0, i64 %67
  %param_4.509358 = load double, ptr addrspace(1) %param_4.5093, align 8, !invariant.load !339
  %69 = tail call double @llvm.fma.f64(double %add.9561.13.clone.1, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %70 = tail call i32 @llvm.nvvm.d2i.lo(double %69) #11
  %71 = tail call double @llvm.nvvm.add.rn.d(double %69, double 0xC338000000000000) #11
  %72 = tail call double @llvm.fma.f64(double %71, double 0xBFE62E42FEFA39EF, double %add.9561.13.clone.1)
  %73 = tail call double @llvm.fma.f64(double %71, double 0xBC7ABC9E3B39803F, double %72)
  %74 = tail call double @llvm.fma.f64(double %73, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %75 = tail call double @llvm.fma.f64(double %74, double %73, double 0x3EC71DEE62401315)
  %76 = tail call double @llvm.fma.f64(double %75, double %73, double 0x3EFA01997C89EB71)
  %77 = tail call double @llvm.fma.f64(double %76, double %73, double 0x3F2A01A014761F65)
  %78 = tail call double @llvm.fma.f64(double %77, double %73, double 0x3F56C16C1852B7AF)
  %79 = tail call double @llvm.fma.f64(double %78, double %73, double 0x3F81111111122322)
  %80 = tail call double @llvm.fma.f64(double %79, double %73, double 0x3FA55555555502A1)
  %81 = tail call double @llvm.fma.f64(double %80, double %73, double 0x3FC5555555555511)
  %82 = tail call double @llvm.fma.f64(double %81, double %73, double 0x3FE000000000000B)
  %83 = tail call double @llvm.fma.f64(double %82, double %73, double 1.000000e+00)
  %84 = tail call double @llvm.fma.f64(double %83, double %73, double 1.000000e+00)
  %85 = tail call i32 @llvm.nvvm.d2i.lo(double %84) #11
  %86 = tail call i32 @llvm.nvvm.d2i.hi(double %84) #11
  %87 = shl i32 %70, 20
  %88 = add i32 %86, %87
  %89 = tail call double @llvm.nvvm.lohi.i2d(i32 %85, i32 %88) #11
  %90 = tail call i32 @llvm.nvvm.d2i.hi(double %add.9561.13.clone.1) #11
  %91 = bitcast i32 %90 to float
  %92 = tail call float @llvm.nvvm.fabs.f(float %91) #11
  %93 = fcmp olt float %92, 0x4010C46560000000
  br i1 %93, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true52
  %94 = fcmp olt double %add.9561.13.clone.1, 0.000000e+00
  %95 = fadd double %add.9561.13.clone.1, 0x7FF0000000000000
  %z.0.i = select i1 %94, double 0.000000e+00, double %95
  %96 = fcmp olt float %92, 0x4010E90000000000
  br i1 %96, label %97, label %__nv_exp.exit

97:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %98 = sdiv i32 %70, 2
  %99 = shl i32 %98, 20
  %100 = add i32 %86, %99
  %101 = tail call double @llvm.nvvm.lohi.i2d(i32 %85, i32 %100) #11
  %102 = sub nsw i32 %70, %98
  %103 = shl i32 %102, 20
  %104 = add nsw i32 %103, 1072693248
  %105 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %104) #11
  %106 = fmul double %105, %101
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true52, %__internal_fast_icmp_abs_lt.exit.i, %97
  %z.2.i = phi double [ %89, %x_in_tile-true52 ], [ %106, %97 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.11405.5.clone.1 = fmul double %param_4.509358, %z.2.i
  %multiply.11406.7.clone.1 = fmul double %add.9575.9.clone.1, 0x3FFC71C71C71C71C
  %add.9576.5.clone.1 = fadd double %multiply.11406.7.clone.1, %multiply.11405.5.clone.1
  %multiply.11407.1.clone.1 = fmul double %param_3.578255, %add.9576.5.clone.1
  %add.9442.i120 = fadd double %multiply.11407.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit40

reduction_write_output-true70:                    ; preds = %loop1.loop_exit40
  store double %add.9442.i116, ptr addrspace(1) %arg9142, align 128
  br label %thread_in_bounds-after69
}

; Function Attrs: norecurse nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg19) local_unnamed_addr #8 {
entry:
  %arg19299 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18297 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17295 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16293 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15291 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14289 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13287 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12285 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11283 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10281 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9279 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8277 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7275 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6273 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5271 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4269 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3267 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2265 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1263 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0261 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %block.id.y = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !341
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  switch i32 %block.id.y, label %default.unreachable257 [
    i32 0, label %reduce-group-0-true
    i32 1, label %reduce-group-1-true
    i32 2, label %reduce-group-2-true
    i32 3, label %reduce-group-3-true
  ]

default.unreachable257:                           ; preds = %entry
  call void asm sideeffect "exit;", ""()
  unreachable

reduce-group-3-after.sink.split:                  ; preds = %thread_in_bounds-after172, %thread_in_bounds-after115, %thread_in_bounds-after54, %loop1.loop_exit
  %.sink260 = phi i32 [ %14, %loop1.loop_exit ], [ %46, %thread_in_bounds-after54 ], [ %79, %thread_in_bounds-after115 ], [ %112, %thread_in_bounds-after172 ]
  %.sink259 = phi i32 [ %16, %loop1.loop_exit ], [ %48, %thread_in_bounds-after54 ], [ %81, %thread_in_bounds-after115 ], [ %114, %thread_in_bounds-after172 ]
  %add.9442.i247.sink = phi double [ %add.9442.i, %loop1.loop_exit ], [ %add.9442.i241, %thread_in_bounds-after54 ], [ %add.9442.i247, %thread_in_bounds-after115 ], [ %add.9442.i253, %thread_in_bounds-after172 ]
  %arg17.sink = phi ptr addrspace(1) [ %arg13287, %loop1.loop_exit ], [ %arg15291, %thread_in_bounds-after54 ], [ %arg17295, %thread_in_bounds-after115 ], [ %arg19299, %thread_in_bounds-after172 ]
  %0 = insertelement <2 x i32> poison, i32 %.sink260, i64 0
  %1 = insertelement <2 x i32> %0, i32 %.sink259, i64 1
  %2 = bitcast <2 x i32> %1 to double
  %add.9442.i248 = fadd double %add.9442.i247.sink, %2
  store double %add.9442.i248, ptr addrspace(1) %arg17.sink, align 128
  br label %reduce-group-3-after

reduce-group-3-after:                             ; preds = %reduce-group-3-after.sink.split, %thread_in_bounds-after115, %thread_in_bounds-after54, %loop1.loop_exit, %thread_in_bounds-after172
  ret void

reduce-group-0-true:                              ; preds = %entry
  %3 = icmp ult i32 %thread.id.x, 4
  br i1 %3, label %x_in_tile-true, label %loop1.loop_exit

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %reduce-group-0-true
  %partial_reduction_result.0 = phi double [ %add.9442.i238, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %4 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %5 = extractelement <2 x i32> %4, i64 0
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> poison, i32 %6, i64 0
  %8 = extractelement <2 x i32> %4, i64 1
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 2, i32 31)
  %10 = insertelement <2 x i32> %7, i32 %9, i64 1
  %11 = bitcast <2 x i32> %10 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %11
  %12 = bitcast double %add.9442.i to <2 x i32>
  %13 = extractelement <2 x i32> %12, i64 0
  %14 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 1, i32 31)
  %15 = extractelement <2 x i32> %12, i64 1
  %16 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  br i1 %or.cond, label %reduce-group-3-after.sink.split, label %reduce-group-3-after

x_in_tile-true:                                   ; preds = %reduce-group-0-true
  %17 = zext nneg i32 %thread.id.x to i64
  %param_1.2149 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg1263, i64 0, i64 %17, i64 0
  %param_1.21492 = load double, ptr addrspace(1) %param_1.2149, align 8, !invariant.load !339
  %param_2.1790 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2265, i64 0, i64 %17
  %param_2.17903 = load double, ptr addrspace(1) %param_2.1790, align 8, !invariant.load !339
  %param_3.1510 = load double, ptr addrspace(1) %arg3267, align 128, !invariant.load !339
  %param_0.1533 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg0261, i64 0, i64 %17
  %param_0.15334 = load double, ptr addrspace(1) %param_0.1533, align 8, !invariant.load !339
  %multiply.11388.3 = fmul double %param_3.1510, %param_0.15334
  %add.9565.3 = fadd double %param_2.17903, %multiply.11388.3
  %add.9572.9 = fadd double %add.9565.3, -1.000000e+00
  %multiply.11402.7 = fmul double %add.9572.9, 4.000000e+00
  %add.9573.5 = fadd double %param_1.21492, %multiply.11402.7
  %multiply.11403.1 = fmul double %param_0.15334, %add.9573.5
  %add.9442.i238 = fadd double %multiply.11403.1, 0.000000e+00
  br label %loop1.loop_exit

reduce-group-1-true:                              ; preds = %entry
  %18 = icmp ult i32 %thread.id.x, 4
  br i1 %18, label %x_in_tile-true39, label %loop1.loop_exit27

loop1.loop_exit27:                                ; preds = %x_in_tile-true39, %reduce-group-1-true
  %partial_reduction_result13.0 = phi double [ %50, %x_in_tile-true39 ], [ 0.000000e+00, %reduce-group-1-true ]
  %partial_reduction_result16.0 = phi double [ %add.9442.i244, %x_in_tile-true39 ], [ 0.000000e+00, %reduce-group-1-true ]
  %19 = bitcast double %partial_reduction_result13.0 to <2 x i32>
  %20 = extractelement <2 x i32> %19, i64 0
  %21 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %20, i32 2, i32 31)
  %22 = insertelement <2 x i32> poison, i32 %21, i64 0
  %23 = extractelement <2 x i32> %19, i64 1
  %24 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %23, i32 2, i32 31)
  %25 = insertelement <2 x i32> %22, i32 %24, i64 1
  %26 = bitcast <2 x i32> %25 to double
  %add.9442.i239 = fadd double %partial_reduction_result13.0, %26
  %27 = bitcast double %add.9442.i239 to <2 x i32>
  %28 = extractelement <2 x i32> %27, i64 0
  %29 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %28, i32 1, i32 31)
  %30 = extractelement <2 x i32> %27, i64 1
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 1, i32 31)
  %or.cond189 = icmp eq i32 %thread.id.x, 0
  %32 = insertelement <2 x i32> poison, i32 %29, i64 0
  %33 = insertelement <2 x i32> %32, i32 %31, i64 1
  %34 = bitcast <2 x i32> %33 to double
  %add.9442.i240 = fadd double %add.9442.i239, %34
  br i1 %or.cond189, label %reduction_write_output-true55, label %thread_in_bounds-after54

thread_in_bounds-after54:                         ; preds = %reduction_write_output-true55, %loop1.loop_exit27
  %35 = icmp eq i32 %thread.id.x, 0
  %36 = bitcast double %partial_reduction_result16.0 to <2 x i32>
  %37 = extractelement <2 x i32> %36, i64 0
  %38 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %37, i32 2, i32 31)
  %39 = insertelement <2 x i32> poison, i32 %38, i64 0
  %40 = extractelement <2 x i32> %36, i64 1
  %41 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %40, i32 2, i32 31)
  %42 = insertelement <2 x i32> %39, i32 %41, i64 1
  %43 = bitcast <2 x i32> %42 to double
  %add.9442.i241 = fadd double %partial_reduction_result16.0, %43
  %44 = bitcast double %add.9442.i241 to <2 x i32>
  %45 = extractelement <2 x i32> %44, i64 0
  %46 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %45, i32 1, i32 31)
  %47 = extractelement <2 x i32> %44, i64 1
  %48 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %47, i32 1, i32 31)
  br i1 %35, label %reduce-group-3-after.sink.split, label %reduce-group-3-after

x_in_tile-true39:                                 ; preds = %reduce-group-1-true
  %49 = zext nneg i32 %thread.id.x to i64
  %param_6.3454 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg6273, i64 0, i64 %49
  %param_6.345441 = load double, ptr addrspace(1) %param_6.3454, align 8, !invariant.load !339
  %add.9578.9.clone.1 = fadd double %param_6.345441, -1.000000e+00
  %multiply.11428.1.clone.1.clone.1 = fmul double %add.9578.9.clone.1, %add.9578.9.clone.1
  %add.9597.5.clone.1.clone.1 = fadd double %multiply.11428.1.clone.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.11429.3.clone.1.clone.1 = fmul double %add.9597.5.clone.1.clone.1, 5.000000e-01
  %50 = fsub double 0.000000e+00, %multiply.11429.3.clone.1.clone.1
  %param_5.4118 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg5271, i64 0, i64 %49
  %param_5.411844 = load double, ptr addrspace(1) %param_5.4118, align 8, !invariant.load !339
  %add.9579.5.clone.1 = fadd double %param_5.411844, %add.9578.9.clone.1
  %param_4.5083 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4269, i64 0, i64 %49
  %param_4.508345 = load double, ptr addrspace(1) %param_4.5083, align 8, !invariant.load !339
  %multiply.11408.1.clone.1 = fmul double %add.9579.5.clone.1, %param_4.508345
  %add.9442.i244 = fadd double %multiply.11408.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit27

reduction_write_output-true55:                    ; preds = %loop1.loop_exit27
  store double %add.9442.i240, ptr addrspace(1) %arg14289, align 128
  br label %thread_in_bounds-after54

reduce-group-2-true:                              ; preds = %entry
  %51 = icmp ult i32 %thread.id.x, 4
  br i1 %51, label %x_in_tile-true96, label %loop1.loop_exit84

loop1.loop_exit84:                                ; preds = %x_in_tile-true96, %reduce-group-2-true
  %partial_reduction_result70.0 = phi double [ %83, %x_in_tile-true96 ], [ 0.000000e+00, %reduce-group-2-true ]
  %partial_reduction_result73.0 = phi double [ %add.9442.i250, %x_in_tile-true96 ], [ 0.000000e+00, %reduce-group-2-true ]
  %52 = bitcast double %partial_reduction_result70.0 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 2, i32 31)
  %55 = insertelement <2 x i32> poison, i32 %54, i64 0
  %56 = extractelement <2 x i32> %52, i64 1
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 2, i32 31)
  %58 = insertelement <2 x i32> %55, i32 %57, i64 1
  %59 = bitcast <2 x i32> %58 to double
  %add.9442.i245 = fadd double %partial_reduction_result70.0, %59
  %60 = bitcast double %add.9442.i245 to <2 x i32>
  %61 = extractelement <2 x i32> %60, i64 0
  %62 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 1, i32 31)
  %63 = extractelement <2 x i32> %60, i64 1
  %64 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %63, i32 1, i32 31)
  %or.cond193 = icmp eq i32 %thread.id.x, 0
  %65 = insertelement <2 x i32> poison, i32 %62, i64 0
  %66 = insertelement <2 x i32> %65, i32 %64, i64 1
  %67 = bitcast <2 x i32> %66 to double
  %add.9442.i246 = fadd double %add.9442.i245, %67
  br i1 %or.cond193, label %reduction_write_output-true116, label %thread_in_bounds-after115

thread_in_bounds-after115:                        ; preds = %reduction_write_output-true116, %loop1.loop_exit84
  %68 = icmp eq i32 %thread.id.x, 0
  %69 = bitcast double %partial_reduction_result73.0 to <2 x i32>
  %70 = extractelement <2 x i32> %69, i64 0
  %71 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %70, i32 2, i32 31)
  %72 = insertelement <2 x i32> poison, i32 %71, i64 0
  %73 = extractelement <2 x i32> %69, i64 1
  %74 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %73, i32 2, i32 31)
  %75 = insertelement <2 x i32> %72, i32 %74, i64 1
  %76 = bitcast <2 x i32> %75 to double
  %add.9442.i247 = fadd double %partial_reduction_result73.0, %76
  %77 = bitcast double %add.9442.i247 to <2 x i32>
  %78 = extractelement <2 x i32> %77, i64 0
  %79 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %78, i32 1, i32 31)
  %80 = extractelement <2 x i32> %77, i64 1
  %81 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %80, i32 1, i32 31)
  br i1 %68, label %reduce-group-3-after.sink.split, label %reduce-group-3-after

x_in_tile-true96:                                 ; preds = %reduce-group-2-true
  %82 = zext nneg i32 %thread.id.x to i64
  %param_9.1858 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg9279, i64 0, i64 %82
  %param_9.185898 = load double, ptr addrspace(1) %param_9.1858, align 8, !invariant.load !339
  %param_3.151099 = load double, ptr addrspace(1) %arg3267, align 128, !invariant.load !339
  %param_7.2728 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg7275, i64 0, i64 %82
  %param_7.2728100 = load double, ptr addrspace(1) %param_7.2728, align 8, !invariant.load !339
  %multiply.11392.7.clone.1 = fmul double %param_3.151099, %param_7.2728100
  %add.9567.7.clone.1 = fadd double %param_9.185898, %multiply.11392.7.clone.1
  %multiply.11420.1.clone.1.clone.1 = fmul double %add.9567.7.clone.1, %add.9567.7.clone.1
  %add.9590.5.clone.1.clone.1 = fadd double %multiply.11420.1.clone.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.11421.3.clone.1.clone.1 = fmul double %add.9590.5.clone.1.clone.1, 5.000000e-01
  %83 = fsub double 0.000000e+00, %multiply.11421.3.clone.1.clone.1
  %param_8.2191 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg8277, i64 0, i64 %82
  %param_8.2191104 = load double, ptr addrspace(1) %param_8.2191, align 8, !invariant.load !339
  %add.9570.2.clone.1 = fadd double %param_8.2191104, %add.9567.7.clone.1
  %multiply.11394.1.clone.1 = fmul double %param_7.2728100, %add.9570.2.clone.1
  %add.9442.i250 = fadd double %multiply.11394.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit84

reduction_write_output-true116:                   ; preds = %loop1.loop_exit84
  store double %add.9442.i246, ptr addrspace(1) %arg16293, align 128
  br label %thread_in_bounds-after115

reduce-group-3-true:                              ; preds = %entry
  %84 = icmp ult i32 %thread.id.x, 4
  br i1 %84, label %x_in_tile-true157, label %loop1.loop_exit145

loop1.loop_exit145:                               ; preds = %x_in_tile-true157, %reduce-group-3-true
  %partial_reduction_result131.0 = phi double [ %116, %x_in_tile-true157 ], [ 0.000000e+00, %reduce-group-3-true ]
  %partial_reduction_result134.0 = phi double [ %add.9442.i256, %x_in_tile-true157 ], [ 0.000000e+00, %reduce-group-3-true ]
  %85 = bitcast double %partial_reduction_result131.0 to <2 x i32>
  %86 = extractelement <2 x i32> %85, i64 0
  %87 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %86, i32 2, i32 31)
  %88 = insertelement <2 x i32> poison, i32 %87, i64 0
  %89 = extractelement <2 x i32> %85, i64 1
  %90 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %89, i32 2, i32 31)
  %91 = insertelement <2 x i32> %88, i32 %90, i64 1
  %92 = bitcast <2 x i32> %91 to double
  %add.9442.i251 = fadd double %partial_reduction_result131.0, %92
  %93 = bitcast double %add.9442.i251 to <2 x i32>
  %94 = extractelement <2 x i32> %93, i64 0
  %95 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %94, i32 1, i32 31)
  %96 = extractelement <2 x i32> %93, i64 1
  %97 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %96, i32 1, i32 31)
  %or.cond197 = icmp eq i32 %thread.id.x, 0
  %98 = insertelement <2 x i32> poison, i32 %95, i64 0
  %99 = insertelement <2 x i32> %98, i32 %97, i64 1
  %100 = bitcast <2 x i32> %99 to double
  %add.9442.i252 = fadd double %add.9442.i251, %100
  br i1 %or.cond197, label %reduction_write_output-true173, label %thread_in_bounds-after172

thread_in_bounds-after172:                        ; preds = %reduction_write_output-true173, %loop1.loop_exit145
  %101 = icmp eq i32 %thread.id.x, 0
  %102 = bitcast double %partial_reduction_result134.0 to <2 x i32>
  %103 = extractelement <2 x i32> %102, i64 0
  %104 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %103, i32 2, i32 31)
  %105 = insertelement <2 x i32> poison, i32 %104, i64 0
  %106 = extractelement <2 x i32> %102, i64 1
  %107 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %106, i32 2, i32 31)
  %108 = insertelement <2 x i32> %105, i32 %107, i64 1
  %109 = bitcast <2 x i32> %108 to double
  %add.9442.i253 = fadd double %partial_reduction_result134.0, %109
  %110 = bitcast double %add.9442.i253 to <2 x i32>
  %111 = extractelement <2 x i32> %110, i64 0
  %112 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %111, i32 1, i32 31)
  %113 = extractelement <2 x i32> %110, i64 1
  %114 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %113, i32 1, i32 31)
  br i1 %101, label %reduce-group-3-after.sink.split, label %reduce-group-3-after

x_in_tile-true157:                                ; preds = %reduce-group-3-true
  %115 = zext nneg i32 %thread.id.x to i64
  %param_12.1087 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg12285, i64 0, i64 %115
  %param_12.1087159 = load double, ptr addrspace(1) %param_12.1087, align 8, !invariant.load !339
  %add.9584.9.clone.1 = fadd double %param_12.1087159, 6.000000e+00
  %multiply.11422.1.clone.1.clone.1 = fmul double %add.9584.9.clone.1, %add.9584.9.clone.1
  %multiply.11423.3.clone.1.clone.1 = fmul double %multiply.11422.1.clone.1.clone.1, 2.500000e-01
  %add.9592.3.clone.1.clone.1 = fadd double %multiply.11423.3.clone.1.clone.1, 0x4009CB1A63AF7C52
  %multiply.11424.3.clone.1.clone.1 = fmul double %add.9592.3.clone.1.clone.1, 5.000000e-01
  %116 = fsub double 0.000000e+00, %multiply.11424.3.clone.1.clone.1
  %param_11.1385 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg11283, i64 0, i64 %115
  %param_11.1385162 = load double, ptr addrspace(1) %param_11.1385, align 8, !invariant.load !339
  %multiply.11411.7.clone.1 = fmul double %add.9584.9.clone.1, 2.500000e-01
  %add.9585.5.clone.1 = fadd double %param_11.1385162, %multiply.11411.7.clone.1
  %param_10.1611 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg10281, i64 0, i64 %115
  %param_10.1611163 = load double, ptr addrspace(1) %param_10.1611, align 8, !invariant.load !339
  %multiply.11412.1.clone.1 = fmul double %param_10.1611163, %add.9585.5.clone.1
  %add.9442.i256 = fadd double %multiply.11412.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit145

reduction_write_output-true173:                   ; preds = %loop1.loop_exit145
  store double %add.9442.i252, ptr addrspace(1) %arg18297, align 128
  br label %thread_in_bounds-after172
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_and_negate_or_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg24) local_unnamed_addr #0 {
entry:
  %arg2456 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg2354 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2252 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2150 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2048 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1946 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1844 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1742 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1640 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1538 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1436 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1334 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1232 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1130 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1028 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg926 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg824 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg722 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg212, align 128, !invariant.load !339
  %1 = add i64 %0, 1
  %2 = icmp sgt i64 %1, 29
  %3 = load double, ptr addrspace(1) %arg926, align 128, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg1028, align 128, !invariant.load !339
  %add.9574.1.clone.1 = fadd double %3, %4
  %5 = load double, ptr addrspace(1) %arg824, align 128, !invariant.load !339
  %add.9577.1.clone.1 = fadd double %add.9574.1.clone.1, %5
  %6 = load double, ptr addrspace(1) %arg722, align 128, !invariant.load !339
  %add.9580.1.clone.1 = fadd double %add.9577.1.clone.1, %6
  %7 = load double, ptr addrspace(1) %arg620, align 128, !invariant.load !339
  %add.9583.1.clone.1 = fadd double %add.9580.1.clone.1, %7
  %8 = load double, ptr addrspace(1) %arg518, align 128, !invariant.load !339
  %add.9586.1.clone.1 = fadd double %add.9583.1.clone.1, %8
  %9 = load double, ptr addrspace(1) %arg110, align 128, !invariant.load !339
  %multiply.11413.1.clone.1 = fmul double %9, 9.998000e-01
  %10 = fadd double %add.9586.1.clone.1, %multiply.11413.1.clone.1
  %11 = load double, ptr addrspace(1) %arg1640, align 128, !invariant.load !339
  %12 = load double, ptr addrspace(1) %arg1742, align 128, !invariant.load !339
  %add.9589.1.clone.1 = fadd double %11, %12
  %13 = load double, ptr addrspace(1) %arg1538, align 128, !invariant.load !339
  %add.9591.1.clone.1 = fadd double %add.9589.1.clone.1, %13
  %14 = load double, ptr addrspace(1) %arg1436, align 128, !invariant.load !339
  %add.9593.1.clone.1 = fadd double %add.9591.1.clone.1, %14
  %15 = load double, ptr addrspace(1) %arg1334, align 128, !invariant.load !339
  %add.9595.1.clone.1 = fadd double %add.9593.1.clone.1, %15
  %16 = load double, ptr addrspace(1) %arg1232, align 128, !invariant.load !339
  %add.9598.1.clone.1 = fadd double %add.9595.1.clone.1, %16
  %17 = load double, ptr addrspace(1) %arg1130, align 128, !invariant.load !339
  %add.9599.1.clone.1 = fadd double %add.9598.1.clone.1, %17
  %18 = fneg double %add.9599.1.clone.1
  %19 = load double, ptr addrspace(1) %arg416, align 128, !invariant.load !339
  %subtract.827.1.clone.1 = fsub double %18, %19
  %20 = tail call double @llvm.fabs.f64(double %19)
  %multiply.11430.1.clone.1 = fmul double %20, 0x3EB0C6F7A0B5ED8D
  %subtract.828.1.clone.1 = fsub double %subtract.827.1.clone.1, %multiply.11430.1.clone.1
  %21 = fcmp uno double %10, 0.000000e+00
  %22 = fcmp oge double %10, %subtract.828.1.clone.1
  %23 = or i1 %21, %22
  %maximum.61.1.clone.1 = select i1 %23, double %10, double %subtract.828.1.clone.1
  %24 = load double, ptr addrspace(1) %arg07, align 128, !invariant.load !339
  %multiply.11431.1.clone.1 = fmul double %24, 1.000000e-04
  %multiply.11432.1.clone.1 = fmul double %9, %multiply.11431.1.clone.1
  %subtract.829.1.clone.1 = fsub double %subtract.827.1.clone.1, %multiply.11432.1.clone.1
  %25 = fcmp uno double %maximum.61.1.clone.1, 0.000000e+00
  %26 = fcmp ole double %maximum.61.1.clone.1, %subtract.829.1.clone.1
  %27 = or i1 %25, %26
  %minimum.24.1.clone.1 = select i1 %27, double %maximum.61.1.clone.1, double %subtract.829.1.clone.1
  %.inv = fcmp olt double %minimum.24.1.clone.1, 0.000000e+00
  %maximum.62.1.clone.1 = select i1 %.inv, double 0.000000e+00, double %minimum.24.1.clone.1
  %compare.2654.1.clone.1 = fcmp uno double %maximum.62.1.clone.1, 0.000000e+00
  %28 = select i1 %compare.2654.1.clone.1, double 0x7FF0000000000000, double %maximum.62.1.clone.1
  %29 = tail call double @llvm.fabs.f64(double %add.9586.1.clone.1)
  %30 = tail call double @llvm.fabs.f64(double %9)
  %multiply.11433.5.clone.1 = fmul double %30, 9.000000e-01
  %subtract.830.5.clone.1 = fsub double %29, %multiply.11433.5.clone.1
  %.inv6 = fcmp olt double %subtract.830.5.clone.1, 0.000000e+00
  %maximum.63.5.clone.1 = select i1 %.inv6, double 0.000000e+00, double %subtract.830.5.clone.1
  %compare.2655.5.clone.1 = fcmp uno double %maximum.63.5.clone.1, 0.000000e+00
  %31 = select i1 %compare.2655.5.clone.1, double 0x7FF0000000000000, double %maximum.63.5.clone.1
  %32 = fcmp oge double %28, %31
  %maximum.64.5.clone.1 = select i1 %32, double %28, double %31
  %compare.2656.5.clone.1 = fcmp ole double %maximum.64.5.clone.1, 0.000000e+00
  %compare.2657.1.clone.1 = fcmp oge double %24, 1.000000e+00
  %compare.2658.5.clone.1 = fcmp ogt double %28, 0.000000e+00
  %33 = load double, ptr addrspace(1) %arg314, align 128, !invariant.load !339
  %compare.2659.5.clone.1 = fcmp ole double %33, %18
  %34 = icmp sgt i64 %0, 0
  %35 = and i1 %34, %compare.2659.5.clone.1
  %36 = or i1 %35, %compare.2658.5.clone.1
  %compare.2661.5.clone.1 = fcmp oge double %add.9586.1.clone.1, 0.000000e+00
  %37 = or i1 %compare.2661.5.clone.1, %36
  %38 = or i1 %37, %compare.2656.5.clone.1
  %39 = zext i1 %38 to i8
  %40 = xor i1 %37, true
  %41 = and i1 %compare.2657.1.clone.1, %40
  %42 = or i1 %compare.2656.5.clone.1, %41
  %43 = zext i1 %42 to i8
  %44 = xor i1 %42, true
  %45 = and i1 %2, %44
  %46 = zext i1 %45 to i8
  store i8 %46, ptr addrspace(1) %arg1844, align 128
  store i8 %43, ptr addrspace(1) %arg1946, align 128
  store i8 %39, ptr addrspace(1) %arg2048, align 128
  store double %28, ptr addrspace(1) %arg2150, align 128
  store double %add.9586.1.clone.1, ptr addrspace(1) %arg2252, align 128
  store double %18, ptr addrspace(1) %arg2354, align 128
  store i64 %1, ptr addrspace(1) %arg2456, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_12(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #0 {
entry:
  %arg617 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg515 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg413 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg17, align 128, !invariant.load !339
  %compare.2661.15 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg515, align 128, !invariant.load !339
  %compare.2658.19 = fcmp ule double %1, 0.000000e+00
  %2 = load double, ptr addrspace(1) %arg311, align 128, !invariant.load !339
  %3 = load double, ptr addrspace(1) %arg413, align 128, !invariant.load !339
  %compare.2659.19 = fcmp ult double %2, %3
  %4 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %5 = icmp slt i64 %4, 1
  %.not4 = or i1 %compare.2659.19, %5
  %.not2 = and i1 %compare.2658.19, %.not4
  %6 = and i1 %compare.2661.15, %.not2
  %7 = load double, ptr addrspace(1) %arg05, align 128, !invariant.load !339
  %8 = select i1 %6, double %7, double %0
  store double %8, ptr addrspace(1) %arg617, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_11(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg515 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg413 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg413, align 128, !invariant.load !339
  %compare.2661.13 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg311, align 128, !invariant.load !339
  %compare.2658.17 = fcmp ule double %1, 0.000000e+00
  %2 = load double, ptr addrspace(1) %arg17, align 128, !invariant.load !339
  %3 = load double, ptr addrspace(1) %arg05, align 128, !invariant.load !339
  %compare.2659.17 = fcmp ult double %2, %3
  %4 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %5 = icmp slt i64 %4, 1
  %.not4 = or i1 %compare.2659.17, %5
  %.not2 = and i1 %compare.2658.17, %.not4
  %6 = and i1 %compare.2661.13, %.not2
  %7 = select i1 %6, double %3, double %2
  store double %7, ptr addrspace(1) %arg515, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7) local_unnamed_addr #0 {
entry:
  %arg719 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg617 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg515 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg413 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg617, align 128, !invariant.load !339
  %compare.2661.11 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg515, align 128, !invariant.load !339
  %compare.2658.15 = fcmp ule double %1, 0.000000e+00
  %2 = load double, ptr addrspace(1) %arg311, align 128, !invariant.load !339
  %3 = load double, ptr addrspace(1) %arg413, align 128, !invariant.load !339
  %compare.2659.15 = fcmp ult double %2, %3
  %4 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %5 = icmp slt i64 %4, 1
  %.not4 = or i1 %compare.2659.15, %5
  %.not2 = and i1 %compare.2658.15, %.not4
  %6 = and i1 %compare.2661.11, %.not2
  %7 = load double, ptr addrspace(1) %arg05, align 128, !invariant.load !339
  %8 = load double, ptr addrspace(1) %arg17, align 128, !invariant.load !339
  %9 = select i1 %6, double %7, double %8
  store double %9, ptr addrspace(1) %arg719, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_9(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6) local_unnamed_addr #0 {
entry:
  %arg617 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg515 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg413 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg05, align 128, !invariant.load !339
  %compare.2661.9 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg515, align 128, !invariant.load !339
  %compare.2658.13 = fcmp ule double %1, 0.000000e+00
  %2 = load double, ptr addrspace(1) %arg311, align 128, !invariant.load !339
  %3 = load double, ptr addrspace(1) %arg413, align 128, !invariant.load !339
  %compare.2659.13 = fcmp ult double %2, %3
  %4 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %5 = icmp slt i64 %4, 1
  %.not4 = or i1 %compare.2659.13, %5
  %.not2 = and i1 %compare.2658.13, %.not4
  %6 = and i1 %compare.2661.9, %.not2
  %7 = load double, ptr addrspace(1) %arg17, align 128, !invariant.load !339
  %8 = select i1 %6, double %0, double %7
  store double %8, ptr addrspace(1) %arg617, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_8(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg515 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg413 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg413, align 128, !invariant.load !339
  %compare.2661.7 = fcmp oge double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg311, align 128, !invariant.load !339
  %compare.2658.11 = fcmp ule double %1, 0.000000e+00
  %2 = load double, ptr addrspace(1) %arg05, align 128, !invariant.load !339
  %3 = load double, ptr addrspace(1) %arg17, align 128, !invariant.load !339
  %compare.2659.11 = fcmp ult double %2, %3
  %4 = load i64, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %5 = icmp slt i64 %4, 1
  %.not4 = or i1 %compare.2659.11, %5
  %.not2 = and i1 %compare.2658.11, %.not4
  %6 = and i1 %compare.2661.7, %.not2
  %7 = select i1 %6, double %2, double %3
  store double %7, ptr addrspace(1) %arg515, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_select(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %1 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %2 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %3 = trunc i8 %0 to i1
  %4 = select i1 %3, double %1, double %2
  store double %4, ptr addrspace(1) %arg37, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg2, ptr noalias nocapture align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8
  %7 = trunc i8 %1 to i1
  %8 = select i1 %7, double %4, double %6
  %9 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  %add.9584.7.clone.1 = fadd double %4, 6.000000e+00
  %multiply.11411.5.clone.1 = fmul double %add.9584.7.clone.1, 2.500000e-01
  %add.9585.3.clone.1 = fadd double %10, %multiply.11411.5.clone.1
  %11 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %12 = load double, ptr addrspace(1) %11, align 8
  %13 = select i1 %7, double %add.9585.3.clone.1, double %12
  store double %8, ptr addrspace(1) %5, align 8
  store double %13, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg2, ptr noalias nocapture align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8
  %7 = trunc i8 %1 to i1
  %8 = select i1 %7, double %4, double %6
  %9 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  %add.9581.7.clone.1 = fadd double %4, 4.000000e+00
  %multiply.11409.5.clone.1 = fmul double %add.9581.7.clone.1, 2.500000e-01
  %add.9582.3.clone.1 = fadd double %10, %multiply.11409.5.clone.1
  %11 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %12 = load double, ptr addrspace(1) %11, align 8
  %13 = select i1 %7, double %add.9582.3.clone.1, double %12
  store double %8, ptr addrspace(1) %5, align 8
  store double %13, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg2, ptr noalias nocapture align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8
  %7 = trunc i8 %1 to i1
  %8 = select i1 %7, double %4, double %6
  %9 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %10 = load double, ptr addrspace(1) %9, align 8, !invariant.load !339
  %add.9578.7.clone.1 = fadd double %4, -1.000000e+00
  %add.9579.3.clone.1 = fadd double %add.9578.7.clone.1, %10
  %11 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %12 = load double, ptr addrspace(1) %11, align 8
  %13 = select i1 %7, double %add.9579.3.clone.1, double %12
  store double %8, ptr addrspace(1) %5, align 8
  store double %13, ptr addrspace(1) %11, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_6(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg25, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8
  %7 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !339
  %8 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %multiply.11384.19 = fmul double %7, %9
  %add.9561.19 = fadd double %6, %multiply.11384.19
  %10 = tail call double @llvm.fma.f64(double %add.9561.19, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %11 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #11
  %12 = tail call double @llvm.nvvm.add.rn.d(double %10, double 0xC338000000000000) #11
  %13 = tail call double @llvm.fma.f64(double %12, double 0xBFE62E42FEFA39EF, double %add.9561.19)
  %14 = tail call double @llvm.fma.f64(double %12, double 0xBC7ABC9E3B39803F, double %13)
  %15 = tail call double @llvm.fma.f64(double %14, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %16 = tail call double @llvm.fma.f64(double %15, double %14, double 0x3EC71DEE62401315)
  %17 = tail call double @llvm.fma.f64(double %16, double %14, double 0x3EFA01997C89EB71)
  %18 = tail call double @llvm.fma.f64(double %17, double %14, double 0x3F2A01A014761F65)
  %19 = tail call double @llvm.fma.f64(double %18, double %14, double 0x3F56C16C1852B7AF)
  %20 = tail call double @llvm.fma.f64(double %19, double %14, double 0x3F81111111122322)
  %21 = tail call double @llvm.fma.f64(double %20, double %14, double 0x3FA55555555502A1)
  %22 = tail call double @llvm.fma.f64(double %21, double %14, double 0x3FC5555555555511)
  %23 = tail call double @llvm.fma.f64(double %22, double %14, double 0x3FE000000000000B)
  %24 = tail call double @llvm.fma.f64(double %23, double %14, double 1.000000e+00)
  %25 = tail call double @llvm.fma.f64(double %24, double %14, double 1.000000e+00)
  %26 = tail call i32 @llvm.nvvm.d2i.lo(double %25) #11
  %27 = tail call i32 @llvm.nvvm.d2i.hi(double %25) #11
  %28 = shl i32 %11, 20
  %29 = add i32 %27, %28
  %30 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %29) #11
  %31 = tail call i32 @llvm.nvvm.d2i.hi(double %add.9561.19) #11
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.fabs.f(float %32) #11
  %34 = fcmp olt float %33, 0x4010C46560000000
  br i1 %34, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %35 = fcmp olt double %add.9561.19, 0.000000e+00
  %36 = fadd double %add.9561.19, 0x7FF0000000000000
  %z.0.i = select i1 %35, double 0.000000e+00, double %36
  %37 = fcmp olt float %33, 0x4010E90000000000
  br i1 %37, label %38, label %__nv_exp.exit

38:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %39 = sdiv i32 %11, 2
  %40 = shl i32 %39, 20
  %41 = add i32 %27, %40
  %42 = tail call double @llvm.nvvm.lohi.i2d(i32 %26, i32 %41) #11
  %43 = sub nsw i32 %11, %39
  %44 = shl i32 %43, 20
  %45 = add nsw i32 %44, 1072693248
  %46 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %45) #11
  %47 = fmul double %46, %42
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %38
  %z.2.i = phi double [ %30, %entry ], [ %47, %38 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.11405.3 = fmul double %4, %z.2.i
  %add.9575.7 = fadd double %add.9561.19, 0xBFF62E42FEFA39EF
  %multiply.11406.5 = fmul double %add.9575.7, 0x3FFC71C71C71C71C
  %add.9576.3 = fadd double %multiply.11406.5, %multiply.11405.3
  %48 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %49 = load double, ptr addrspace(1) %48, align 8
  %50 = trunc i8 %1 to i1
  %51 = select i1 %50, double %add.9576.3, double %49
  %52 = select i1 %50, double %add.9561.19, double %6
  store double %51, ptr addrspace(1) %48, align 8
  store double %52, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_1(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5) local_unnamed_addr #0 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8
  %5 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !339
  %6 = getelementptr double, ptr addrspace(1) %arg25, i64 %2
  %7 = load double, ptr addrspace(1) %6, align 8, !invariant.load !339
  %multiply.11388.5 = fmul double %5, %7
  %add.9565.5 = fadd double %4, %multiply.11388.5
  %8 = trunc i8 %1 to i1
  %9 = select i1 %8, double %add.9565.5, double %4
  %10 = getelementptr double, ptr addrspace(1) %arg511, i64 %2
  %11 = load double, ptr addrspace(1) %10, align 8, !invariant.load !339
  %add.9572.7.clone.1 = fadd double %add.9565.5, -1.000000e+00
  %multiply.11402.5.clone.1 = fmul double %add.9572.7.clone.1, 4.000000e+00
  %add.9573.3.clone.1 = fadd double %11, %multiply.11402.5.clone.1
  %12 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %13 = load double, ptr addrspace(1) %12, align 8
  %14 = select i1 %8, double %add.9573.3.clone.1, double %13
  store double %9, ptr addrspace(1) %3, align 8
  store double %14, ptr addrspace(1) %12, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_5(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %2 = zext nneg i32 %0 to i64
  %3 = getelementptr double, ptr addrspace(1) %arg25, i64 %2
  %4 = load double, ptr addrspace(1) %3, align 8, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg37, i64 %2
  %6 = load double, ptr addrspace(1) %5, align 8
  %7 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !339
  %8 = getelementptr double, ptr addrspace(1) %arg49, i64 %2
  %9 = load double, ptr addrspace(1) %8, align 8, !invariant.load !339
  %multiply.11392.11 = fmul double %7, %9
  %add.9567.11 = fadd double %6, %multiply.11392.11
  %add.9570.1 = fadd double %4, %add.9567.11
  %10 = getelementptr double, ptr addrspace(1) %arg01, i64 %2
  %11 = load double, ptr addrspace(1) %10, align 8
  %12 = trunc i8 %1 to i1
  %13 = select i1 %12, double %add.9570.1, double %11
  %14 = select i1 %12, double %add.9567.11, double %6
  store double %13, ptr addrspace(1) %10, align 8
  store double %14, ptr addrspace(1) %5, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %compare.2663.1 = fcmp ole double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %2 = load double, ptr addrspace(1) %arg13, align 128
  %3 = select i1 %compare.2663.1, double %1, double %2
  store double %3, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_7(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg7) local_unnamed_addr #3 {
entry:
  %arg763 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg661 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg559 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg457 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg355 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg253 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg151 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg049 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = lshr i32 %thread.id.x, 1
  %1 = icmp ugt i32 %thread.id.x, 3
  br i1 %1, label %loop1.loop_exit, label %loop1.loop_body.lr.ph

loop1.loop_body.lr.ph:                            ; preds = %entry
  %thread.id.2 = and i32 %thread.id.x, 1
  %.not39.not = icmp eq i32 %thread.id.2, 0
  %param_6.168312 = load double, ptr addrspace(1) %arg661, align 128
  %param_5.193813 = load double, ptr addrspace(1) %arg559, align 128
  %subtract.838.114 = fsub double %param_6.168312, %param_5.193813
  %multiply.11539.115 = fmul double %subtract.838.114, %subtract.838.114
  %multiply.11541.1 = fmul double %subtract.838.114, %multiply.11539.115
  %param_4.24287 = load double, ptr addrspace(1) %arg457, align 128
  %subtract.837.29 = fsub double %param_4.24287, %param_5.193813
  %2 = fneg double %subtract.837.29
  %3 = fmul double %subtract.837.29, %2
  %4 = fmul double %subtract.837.29, %3
  %5 = fneg double %subtract.838.114
  %6 = fmul double %subtract.838.114, %5
  %multiply.11538.1 = fmul double %subtract.837.29, %subtract.837.29
  %param_1.4134 = load double, ptr addrspace(1) %arg151, align 128
  %param_2.343627 = load double, ptr addrspace(1) %arg253, align 128
  %subtract.841.1 = fsub double %param_1.4134, %param_2.343627
  %param_0.296928 = load double, ptr addrspace(1) %arg049, align 128
  %multiply.11543.1 = fmul double %param_0.296928, %subtract.837.29
  %subtract.842.1 = fsub double %subtract.841.1, %multiply.11543.1
  %param_3.2836 = load double, ptr addrspace(1) %arg355, align 128
  %subtract.839.5 = fsub double %param_3.2836, %param_2.343627
  %multiply.11542.5 = fmul double %param_0.296928, %subtract.838.114
  %subtract.840.5 = fsub double %subtract.839.5, %multiply.11542.5
  %7 = icmp ult i32 %thread.id.x, 2
  %spec.select = select i1 %.not39.not, double %multiply.11538.1, double %6
  %spec.select48 = select i1 %.not39.not, double %4, double %multiply.11541.1
  %8 = select i1 %7, double %spec.select, double %spec.select48
  %subtract.840.5.subtract.842.1 = select i1 %.not39.not, double %subtract.840.5, double %subtract.842.1
  %multiply.11544.3 = fmul double %8, %subtract.840.5.subtract.842.1
  %add.9442.i45 = fadd double %multiply.11544.3, 0.000000e+00
  br label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %loop1.loop_body.lr.ph, %entry
  %partial_reduction_result.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add.9442.i45, %loop1.loop_body.lr.ph ]
  %9 = bitcast double %partial_reduction_result.0.lcssa to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %14 = and i32 %thread.id.x, 29
  %or.cond = icmp eq i32 %14, 0
  %15 = zext nneg i32 %0 to i64
  %output_element_address = getelementptr inbounds [2 x double], ptr addrspace(1) %arg763, i64 0, i64 %15
  %16 = insertelement <2 x i32> poison, i32 %11, i64 0
  %17 = insertelement <2 x i32> %16, i32 %13, i64 1
  %18 = bitcast <2 x i32> %17 to double
  %add.9442.i = fadd double %partial_reduction_result.0.lcssa, %18
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_divide_fusion(ptr noalias nocapture align 128 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !348
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !339
  %5 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %subtract.838.5 = fsub double %4, %5
  %6 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %subtract.837.1 = fsub double %6, %5
  %multiply.11545.1 = fmul double %subtract.838.5, %subtract.837.1
  %multiply.11546.1 = fmul double %multiply.11545.1, %multiply.11545.1
  %subtract.843.1 = fsub double %subtract.838.5, %subtract.837.1
  %multiply.11547.1 = fmul double %subtract.843.1, %multiply.11546.1
  %divide.2507.1 = fdiv double %3, %multiply.11547.1
  store double %divide.2507.1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_22(ptr noalias nocapture readnone align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7) local_unnamed_addr #0 {
entry:
  %arg718 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg616 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg514 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg412 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg310 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg16, align 128, !invariant.load !339
  %1 = load <2 x double>, ptr addrspace(1) %arg616, align 128, !invariant.load !339
  %2 = extractelement <2 x double> %1, i32 0
  %3 = extractelement <2 x double> %1, i32 1
  %multiply.11548.3 = fmul double %3, %3
  %multiply.11549.3 = fmul double %2, 3.000000e+00
  %4 = load double, ptr addrspace(1) %arg310, align 128, !invariant.load !339
  %multiply.11550.7 = fmul double %multiply.11549.3, %4
  %subtract.844.9 = fsub double %multiply.11548.3, %multiply.11550.7
  %5 = tail call double @llvm.sqrt.f64(double %subtract.844.9)
  %add.9709.7 = fsub double %5, %3
  %divide.2508.5 = fdiv double %add.9709.7, %multiply.11549.3
  %add.9710.3 = fadd double %0, %divide.2508.5
  %6 = load double, ptr addrspace(1) %arg28, align 128, !invariant.load !339
  %7 = fcmp uno double %6, 0.000000e+00
  %8 = fcmp ole double %6, %0
  %9 = or i1 %7, %8
  %minimum.25.1 = select i1 %9, double %6, double %0
  %subtract.838.2 = fsub double %6, %0
  %10 = tail call double @llvm.fabs.f64(double %subtract.838.2)
  %multiply.11551.1 = fmul double %10, 2.000000e-01
  %add.9712.3 = fadd double %minimum.25.1, %multiply.11551.1
  %compare.2679.3 = fcmp ule double %add.9710.3, %add.9712.3
  %11 = fcmp oge double %6, %0
  %12 = or i1 %7, %11
  %maximum.65.1 = select i1 %12, double %6, double %0
  %subtract.845.3 = fsub double %maximum.65.1, %multiply.11551.1
  %compare.2680.3 = fcmp uge double %add.9710.3, %subtract.845.3
  %.not = or i1 %compare.2679.3, %compare.2680.3
  %13 = load double, ptr addrspace(1) %arg412, align 128, !invariant.load !339
  %14 = load double, ptr addrspace(1) %arg514, align 128, !invariant.load !339
  %subtract.839.7 = fsub double %13, %14
  %multiply.11542.7 = fmul double %4, %subtract.838.2
  %subtract.840.7 = fsub double %subtract.839.7, %multiply.11542.7
  %multiply.11539.4 = fmul double %subtract.838.2, %subtract.838.2
  %divide.2509.3 = fdiv double %subtract.840.7, %multiply.11539.4
  %multiply.11552.3 = fmul double %divide.2509.3, 2.000000e+00
  %divide.2510.3 = fdiv double %4, %multiply.11552.3
  %subtract.846.1 = fsub double %0, %divide.2510.3
  %multiply.11553.1 = fmul double %10, 1.000000e-01
  %add.9713.1 = fadd double %minimum.25.1, %multiply.11553.1
  %compare.2681.1 = fcmp ule double %subtract.846.1, %add.9713.1
  %subtract.847.1 = fsub double %maximum.65.1, %multiply.11553.1
  %compare.2682.1 = fcmp uge double %subtract.846.1, %subtract.847.1
  %.not3 = or i1 %compare.2681.1, %compare.2682.1
  %add.9714.1 = fadd double %0, %6
  %multiply.11554.1 = fmul double %add.9714.1, 5.000000e-01
  %15 = select i1 %.not3, double %multiply.11554.1, double %subtract.846.1
  %16 = select i1 %.not, double %15, double %add.9710.3
  store double %16, ptr addrspace(1) %arg718, align 128
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #3 {
entry:
  %arg449 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg347 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg245 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg143 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg041 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true22, %thread_in_bounds-after
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %add.9442.i39, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result2.0 = phi double [ %35, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i36 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i37 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i37 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i38 = fadd double %add.9442.i37, %33
  br i1 %17, label %reduction_write_output-true22, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %34 = zext nneg i32 %thread.id.x to i64
  %param_1.4137 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg143, i64 0, i64 %34
  %param_1.41375 = load double, ptr addrspace(1) %param_1.4137, align 8, !invariant.load !339
  %param_2.3439 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg245, i64 0, i64 %34
  %param_2.34396 = load double, ptr addrspace(1) %param_2.3439, align 8, !invariant.load !339
  %add.9738.9 = fadd double %param_2.34396, -1.000000e+00
  %add.9739.5 = fadd double %param_1.41375, %add.9738.9
  %param_0.2974 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg041, i64 0, i64 %34
  %param_0.29747 = load double, ptr addrspace(1) %param_0.2974, align 8, !invariant.load !339
  %multiply.11579.1 = fmul double %param_0.29747, %add.9739.5
  %add.9442.i39 = fadd double %multiply.11579.1, 0.000000e+00
  %multiply.11599.1.clone.1 = fmul double %add.9738.9, %add.9738.9
  %add.9760.5.clone.1 = fadd double %multiply.11599.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.11600.3.clone.1 = fmul double %add.9760.5.clone.1, 5.000000e-01
  %35 = fsub double 0.000000e+00, %multiply.11600.3.clone.1
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i36, ptr addrspace(1) %arg347, align 128
  br label %thread_in_bounds-after

reduction_write_output-true22:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i38, ptr addrspace(1) %arg449, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_9(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #3 {
entry:
  %arg449 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg347 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg245 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg143 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg041 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true22, %thread_in_bounds-after
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %add.9442.i39, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result2.0 = phi double [ %35, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i36 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i37 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i37 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i38 = fadd double %add.9442.i37, %33
  br i1 %17, label %reduction_write_output-true22, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %34 = zext nneg i32 %thread.id.x to i64
  %param_1.4144 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg143, i64 0, i64 %34
  %param_1.41445 = load double, ptr addrspace(1) %param_1.4144, align 8, !invariant.load !339
  %param_2.3465 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg245, i64 0, i64 %34
  %param_2.34656 = load double, ptr addrspace(1) %param_2.3465, align 8, !invariant.load !339
  %add.9742.9 = fadd double %param_2.34656, 4.000000e+00
  %multiply.11580.7 = fmul double %add.9742.9, 2.500000e-01
  %add.9743.5 = fadd double %param_1.41445, %multiply.11580.7
  %param_0.2981 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg041, i64 0, i64 %34
  %param_0.29817 = load double, ptr addrspace(1) %param_0.2981, align 8, !invariant.load !339
  %multiply.11581.1 = fmul double %param_0.29817, %add.9743.5
  %add.9442.i39 = fadd double %multiply.11581.1, 0.000000e+00
  %multiply.11585.1.clone.1 = fmul double %add.9742.9, %add.9742.9
  %multiply.11586.3.clone.1 = fmul double %multiply.11585.1.clone.1, 2.500000e-01
  %add.9749.3.clone.1 = fadd double %multiply.11586.3.clone.1, 0x4009CB1A63AF7C52
  %multiply.11587.3.clone.1 = fmul double %add.9749.3.clone.1, 5.000000e-01
  %35 = fsub double 0.000000e+00, %multiply.11587.3.clone.1
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i36, ptr addrspace(1) %arg347, align 128
  br label %thread_in_bounds-after

reduction_write_output-true22:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i38, ptr addrspace(1) %arg449, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_12(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #3 {
entry:
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %add.9442.i18, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i17 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %17 = zext nneg i32 %thread.id.x to i64
  %param_1.4165 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg121, i64 0, i64 %17, i64 0
  %param_1.41652 = load double, ptr addrspace(1) %param_1.4165, align 8, !invariant.load !339
  %param_2.3475 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg223, i64 0, i64 %17
  %param_2.34753 = load double, ptr addrspace(1) %param_2.3475, align 8, !invariant.load !339
  %param_3.2881 = load double, ptr addrspace(1) %arg325, align 128, !invariant.load !339
  %param_0.2971 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg019, i64 0, i64 %17
  %param_0.29714 = load double, ptr addrspace(1) %param_0.2971, align 8, !invariant.load !339
  %multiply.11559.3 = fmul double %param_3.2881, %param_0.29714
  %add.9722.3 = fadd double %param_2.34753, %multiply.11559.3
  %add.9730.9 = fadd double %add.9722.3, -1.000000e+00
  %multiply.11573.7 = fmul double %add.9730.9, 4.000000e+00
  %add.9732.5 = fadd double %param_1.41652, %multiply.11573.7
  %multiply.11574.1 = fmul double %param_0.29714, %add.9732.5
  %add.9442.i18 = fadd double %multiply.11574.1, 0.000000e+00
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i17, ptr addrspace(1) %arg427, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_8(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4) local_unnamed_addr #3 {
entry:
  %arg449 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg347 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg245 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg143 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg041 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true22, %thread_in_bounds-after
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %add.9442.i39, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result2.0 = phi double [ %35, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i36 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i37 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i37 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i38 = fadd double %add.9442.i37, %33
  br i1 %17, label %reduction_write_output-true22, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %34 = zext nneg i32 %thread.id.x to i64
  %param_1.4148 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg143, i64 0, i64 %34
  %param_1.41485 = load double, ptr addrspace(1) %param_1.4148, align 8, !invariant.load !339
  %param_2.3466 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg245, i64 0, i64 %34
  %param_2.34666 = load double, ptr addrspace(1) %param_2.3466, align 8, !invariant.load !339
  %add.9745.9 = fadd double %param_2.34666, 6.000000e+00
  %multiply.11582.7 = fmul double %add.9745.9, 2.500000e-01
  %add.9747.5 = fadd double %param_1.41485, %multiply.11582.7
  %param_0.2985 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg041, i64 0, i64 %34
  %param_0.29857 = load double, ptr addrspace(1) %param_0.2985, align 8, !invariant.load !339
  %multiply.11583.1 = fmul double %param_0.29857, %add.9747.5
  %add.9442.i39 = fadd double %multiply.11583.1, 0.000000e+00
  %multiply.11593.1.clone.1 = fmul double %add.9745.9, %add.9745.9
  %multiply.11594.3.clone.1 = fmul double %multiply.11593.1.clone.1, 2.500000e-01
  %add.9755.3.clone.1 = fadd double %multiply.11594.3.clone.1, 0x4009CB1A63AF7C52
  %multiply.11595.3.clone.1 = fmul double %add.9755.3.clone.1, 5.000000e-01
  %35 = fsub double 0.000000e+00, %multiply.11595.3.clone.1
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i36, ptr addrspace(1) %arg347, align 128
  br label %thread_in_bounds-after

reduction_write_output-true22:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i38, ptr addrspace(1) %arg449, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_11(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #3 {
entry:
  %arg553 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg451 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg349 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg247 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg145 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg043 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true24, %thread_in_bounds-after
  ret void

loop1.loop_exit:                                  ; preds = %__nv_exp.exit, %entry
  %partial_reduction_result.0 = phi double [ %add.9442.i41, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %partial_reduction_result2.0 = phi double [ %73, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i38 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i39 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i39 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i40 = fadd double %add.9442.i39, %33
  br i1 %17, label %reduction_write_output-true24, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %34 = zext nneg i32 %thread.id.x to i64
  %param_1.4166 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg145, i64 0, i64 %34
  %param_1.41665 = load double, ptr addrspace(1) %param_1.4166, align 8, !invariant.load !339
  %param_2.3477 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg247, i64 0, i64 %34
  %param_2.34776 = load double, ptr addrspace(1) %param_2.3477, align 8, !invariant.load !339
  %param_3.2883 = load double, ptr addrspace(1) %arg349, align 128, !invariant.load !339
  %param_0.2970 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg043, i64 0, i64 %34
  %param_0.29707 = load double, ptr addrspace(1) %param_0.2970, align 8, !invariant.load !339
  %multiply.11555.13 = fmul double %param_3.2883, %param_0.29707
  %add.9717.13 = fadd double %param_2.34776, %multiply.11555.13
  %35 = tail call double @llvm.fma.f64(double %add.9717.13, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %36 = tail call i32 @llvm.nvvm.d2i.lo(double %35) #11
  %37 = tail call double @llvm.nvvm.add.rn.d(double %35, double 0xC338000000000000) #11
  %38 = tail call double @llvm.fma.f64(double %37, double 0xBFE62E42FEFA39EF, double %add.9717.13)
  %39 = tail call double @llvm.fma.f64(double %37, double 0xBC7ABC9E3B39803F, double %38)
  %40 = tail call double @llvm.fma.f64(double %39, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %41 = tail call double @llvm.fma.f64(double %40, double %39, double 0x3EC71DEE62401315)
  %42 = tail call double @llvm.fma.f64(double %41, double %39, double 0x3EFA01997C89EB71)
  %43 = tail call double @llvm.fma.f64(double %42, double %39, double 0x3F2A01A014761F65)
  %44 = tail call double @llvm.fma.f64(double %43, double %39, double 0x3F56C16C1852B7AF)
  %45 = tail call double @llvm.fma.f64(double %44, double %39, double 0x3F81111111122322)
  %46 = tail call double @llvm.fma.f64(double %45, double %39, double 0x3FA55555555502A1)
  %47 = tail call double @llvm.fma.f64(double %46, double %39, double 0x3FC5555555555511)
  %48 = tail call double @llvm.fma.f64(double %47, double %39, double 0x3FE000000000000B)
  %49 = tail call double @llvm.fma.f64(double %48, double %39, double 1.000000e+00)
  %50 = tail call double @llvm.fma.f64(double %49, double %39, double 1.000000e+00)
  %51 = tail call i32 @llvm.nvvm.d2i.lo(double %50) #11
  %52 = tail call i32 @llvm.nvvm.d2i.hi(double %50) #11
  %53 = shl i32 %36, 20
  %54 = add i32 %52, %53
  %55 = tail call double @llvm.nvvm.lohi.i2d(i32 %51, i32 %54) #11
  %56 = tail call i32 @llvm.nvvm.d2i.hi(double %add.9717.13) #11
  %57 = bitcast i32 %56 to float
  %58 = tail call float @llvm.nvvm.fabs.f(float %57) #11
  %59 = fcmp olt float %58, 0x4010C46560000000
  br i1 %59, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true
  %60 = fcmp olt double %add.9717.13, 0.000000e+00
  %61 = fadd double %add.9717.13, 0x7FF0000000000000
  %z.0.i = select i1 %60, double 0.000000e+00, double %61
  %62 = fcmp olt float %58, 0x4010E90000000000
  br i1 %62, label %63, label %__nv_exp.exit

63:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %64 = sdiv i32 %36, 2
  %65 = shl i32 %64, 20
  %66 = add i32 %52, %65
  %67 = tail call double @llvm.nvvm.lohi.i2d(i32 %51, i32 %66) #11
  %68 = sub nsw i32 %36, %64
  %69 = shl i32 %68, 20
  %70 = add nsw i32 %69, 1072693248
  %71 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %70) #11
  %72 = fmul double %71, %67
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true, %__internal_fast_icmp_abs_lt.exit.i, %63
  %z.2.i = phi double [ %55, %x_in_tile-true ], [ %72, %63 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.11576.5 = fmul double %param_1.41665, %z.2.i
  %add.9734.9 = fadd double %add.9717.13, 0xBFF62E42FEFA39EF
  %multiply.11577.7 = fmul double %add.9734.9, 0x3FFC71C71C71C71C
  %add.9735.5 = fadd double %multiply.11577.7, %multiply.11576.5
  %multiply.11578.1 = fmul double %param_0.29707, %add.9735.5
  %add.9442.i41 = fadd double %multiply.11578.1, 0.000000e+00
  %multiply.11588.1.clone.1 = fmul double %add.9734.9, %add.9734.9
  %multiply.11589.5.clone.1 = fmul double %multiply.11588.1.clone.1, 0x3FFC71C71C71C71C
  %add.9750.3.clone.1 = fadd double %multiply.11589.5.clone.1, 0x3FF43340BFCA50EB
  %multiply.11590.3.clone.1 = fmul double %add.9750.3.clone.1, 5.000000e-01
  %73 = fsub double 0.000000e+00, %multiply.11590.3.clone.1
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i38, ptr addrspace(1) %arg451, align 128
  br label %thread_in_bounds-after

reduction_write_output-true24:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i40, ptr addrspace(1) %arg553, align 128
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_13(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #3 {
entry:
  %arg553 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg451 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg349 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg247 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg145 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg043 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true24, %thread_in_bounds-after
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %add.9442.i41, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result2.0 = phi double [ %35, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i38 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i39 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i39 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i40 = fadd double %add.9442.i39, %33
  br i1 %17, label %reduction_write_output-true24, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %34 = zext nneg i32 %thread.id.x to i64
  %param_1.4146 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg145, i64 0, i64 %34
  %param_1.41465 = load double, ptr addrspace(1) %param_1.4146, align 8, !invariant.load !339
  %param_2.3447 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg247, i64 0, i64 %34
  %param_2.34476 = load double, ptr addrspace(1) %param_2.3447, align 8, !invariant.load !339
  %param_3.2847 = load double, ptr addrspace(1) %arg349, align 128, !invariant.load !339
  %param_0.2983 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg043, i64 0, i64 %34
  %param_0.29837 = load double, ptr addrspace(1) %param_0.2983, align 8, !invariant.load !339
  %multiply.11563.7 = fmul double %param_3.2847, %param_0.29837
  %add.9724.7 = fadd double %param_2.34476, %multiply.11563.7
  %add.9728.2 = fadd double %param_1.41465, %add.9724.7
  %multiply.11565.1 = fmul double %param_0.29837, %add.9728.2
  %add.9442.i41 = fadd double %multiply.11565.1, 0.000000e+00
  %multiply.11591.1.clone.1 = fmul double %add.9724.7, %add.9724.7
  %add.9753.5.clone.1 = fadd double %multiply.11591.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.11592.3.clone.1 = fmul double %add.9753.5.clone.1, 5.000000e-01
  %35 = fsub double 0.000000e+00, %multiply.11592.3.clone.1
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i38, ptr addrspace(1) %arg451, align 128
  br label %thread_in_bounds-after

reduction_write_output-true24:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i40, ptr addrspace(1) %arg553, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_and_compare_maximum_select_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg18, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg23) local_unnamed_addr #0 {
entry:
  %arg2354 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg2252 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg2150 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg2048 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg1946 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg1844 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1742 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1640 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1538 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1436 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1334 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1232 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1130 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1028 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg926 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg824 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg722 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg620 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg518 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg416 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg314 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg1946, align 128, !invariant.load !339
  %1 = add i64 %0, 1
  %2 = icmp sgt i64 %1, 29
  %3 = load double, ptr addrspace(1) %arg08, align 128, !invariant.load !339
  %4 = load double, ptr addrspace(1) %arg110, align 128, !invariant.load !339
  %subtract.838.3 = fsub double %3, %4
  %5 = tail call double @llvm.fabs.f64(double %subtract.838.3)
  %compare.2693.1 = fcmp ole double %5, 0x3EB0C6F7A0B5ED8D
  %6 = load double, ptr addrspace(1) %arg926, align 128, !invariant.load !339
  %7 = load double, ptr addrspace(1) %arg1028, align 128, !invariant.load !339
  %add.9733.5.clone.1 = fadd double %6, %7
  %8 = load double, ptr addrspace(1) %arg824, align 128, !invariant.load !339
  %add.9737.5.clone.1 = fadd double %add.9733.5.clone.1, %8
  %9 = load double, ptr addrspace(1) %arg722, align 128, !invariant.load !339
  %add.9740.5.clone.1 = fadd double %add.9737.5.clone.1, %9
  %10 = load double, ptr addrspace(1) %arg620, align 128, !invariant.load !339
  %add.9744.5.clone.1 = fadd double %add.9740.5.clone.1, %10
  %11 = load double, ptr addrspace(1) %arg518, align 128, !invariant.load !339
  %add.9748.5.clone.1 = fadd double %add.9744.5.clone.1, %11
  %12 = load double, ptr addrspace(1) %arg416, align 128, !invariant.load !339
  %multiply.11584.1.clone.1 = fmul double %12, 9.998000e-01
  %13 = fadd double %add.9748.5.clone.1, %multiply.11584.1.clone.1
  %14 = load double, ptr addrspace(1) %arg1742, align 128, !invariant.load !339
  %15 = load double, ptr addrspace(1) %arg1844, align 128, !invariant.load !339
  %add.9752.5.clone.1 = fadd double %14, %15
  %16 = load double, ptr addrspace(1) %arg1640, align 128, !invariant.load !339
  %add.9754.5.clone.1 = fadd double %add.9752.5.clone.1, %16
  %17 = load double, ptr addrspace(1) %arg1538, align 128, !invariant.load !339
  %add.9757.5.clone.1 = fadd double %add.9754.5.clone.1, %17
  %18 = load double, ptr addrspace(1) %arg1436, align 128, !invariant.load !339
  %add.9759.5.clone.1 = fadd double %add.9757.5.clone.1, %18
  %19 = load double, ptr addrspace(1) %arg1334, align 128, !invariant.load !339
  %add.9762.5.clone.1 = fadd double %add.9759.5.clone.1, %19
  %20 = load double, ptr addrspace(1) %arg1232, align 128, !invariant.load !339
  %add.9763.5.clone.1 = fadd double %add.9762.5.clone.1, %20
  %21 = fneg double %add.9763.5.clone.1
  %22 = load double, ptr addrspace(1) %arg1130, align 128, !invariant.load !339
  %subtract.853.1.clone.1 = fsub double %21, %22
  %23 = tail call double @llvm.fabs.f64(double %22)
  %multiply.11601.1.clone.1 = fmul double %23, 0x3EB0C6F7A0B5ED8D
  %subtract.854.1.clone.1 = fsub double %subtract.853.1.clone.1, %multiply.11601.1.clone.1
  %24 = fcmp uno double %13, 0.000000e+00
  %25 = fcmp oge double %13, %subtract.854.1.clone.1
  %26 = or i1 %24, %25
  %maximum.67.1.clone.1 = select i1 %26, double %13, double %subtract.854.1.clone.1
  %27 = load double, ptr addrspace(1) %arg314, align 128, !invariant.load !339
  %multiply.11602.1.clone.1 = fmul double %27, 1.000000e-04
  %multiply.11603.1.clone.1 = fmul double %12, %multiply.11602.1.clone.1
  %subtract.855.1.clone.1 = fsub double %subtract.853.1.clone.1, %multiply.11603.1.clone.1
  %28 = fcmp uno double %maximum.67.1.clone.1, 0.000000e+00
  %29 = fcmp ole double %maximum.67.1.clone.1, %subtract.855.1.clone.1
  %30 = or i1 %28, %29
  %minimum.26.1.clone.1 = select i1 %30, double %maximum.67.1.clone.1, double %subtract.855.1.clone.1
  %.inv = fcmp olt double %minimum.26.1.clone.1, 0.000000e+00
  %maximum.68.1.clone.1 = select i1 %.inv, double 0.000000e+00, double %minimum.26.1.clone.1
  %compare.2689.1.clone.1 = fcmp uno double %maximum.68.1.clone.1, 0.000000e+00
  %31 = select i1 %compare.2689.1.clone.1, double 0x7FF0000000000000, double %maximum.68.1.clone.1
  %compare.2694.1.clone.1 = fcmp ole double %31, 0.000000e+00
  %32 = load double, ptr addrspace(1) %arg212, align 128
  %33 = select i1 %compare.2694.1.clone.1, double %27, double %32
  %34 = fcmp uno double %33, 0.000000e+00
  %35 = fcmp oge double %33, %32
  %36 = or i1 %34, %35
  %maximum.71.1.clone.1 = select i1 %36, double %33, double %32
  %compare.2695.1 = fcmp ogt double %maximum.71.1.clone.1, 0.000000e+00
  %37 = and i1 %compare.2693.1, %compare.2695.1
  %38 = or i1 %2, %37
  %39 = tail call double @llvm.fabs.f64(double %add.9748.5.clone.1)
  %40 = tail call double @llvm.fabs.f64(double %12)
  %multiply.11604.1.clone.1 = fmul double %40, 9.000000e-01
  %subtract.856.1.clone.1 = fsub double %39, %multiply.11604.1.clone.1
  %.inv7 = fcmp olt double %subtract.856.1.clone.1, 0.000000e+00
  %maximum.69.1.clone.1 = select i1 %.inv7, double 0.000000e+00, double %subtract.856.1.clone.1
  %compare.2690.1.clone.1 = fcmp uno double %maximum.69.1.clone.1, 0.000000e+00
  %41 = select i1 %compare.2690.1.clone.1, double 0x7FF0000000000000, double %maximum.69.1.clone.1
  %42 = fcmp oge double %31, %41
  %maximum.70.1.clone.1 = select i1 %42, double %31, double %41
  %compare.2691.1.clone.1 = fcmp ole double %maximum.70.1.clone.1, 0.000000e+00
  %43 = zext i1 %compare.2691.1.clone.1 to i8
  %44 = xor i1 %compare.2691.1.clone.1, true
  %45 = and i1 %38, %44
  %46 = zext i1 %45 to i8
  store i8 %46, ptr addrspace(1) %arg2048, align 128
  store double %maximum.71.1.clone.1, ptr addrspace(1) %arg212, align 128
  store i8 %43, ptr addrspace(1) %arg2150, align 128
  store double %31, ptr addrspace(1) %arg2252, align 128
  store i64 %1, ptr addrspace(1) %arg2354, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_23(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg18) local_unnamed_addr #0 {
entry:
  %arg1843 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1741 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1639 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1537 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1435 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1333 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1231 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1129 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1027 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg925 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg823 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg721 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg619 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg517 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg415, align 128, !invariant.load !339
  %compare.2696.9 = fcmp ogt double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg1639, align 128, !invariant.load !339
  %2 = load double, ptr addrspace(1) %arg1741, align 128, !invariant.load !339
  %add.9752.17 = fadd double %1, %2
  %3 = load double, ptr addrspace(1) %arg1537, align 128, !invariant.load !339
  %add.9754.17 = fadd double %add.9752.17, %3
  %4 = load double, ptr addrspace(1) %arg1435, align 128, !invariant.load !339
  %add.9757.17 = fadd double %add.9754.17, %4
  %5 = load double, ptr addrspace(1) %arg1333, align 128, !invariant.load !339
  %add.9759.17 = fadd double %add.9757.17, %5
  %6 = load double, ptr addrspace(1) %arg1231, align 128, !invariant.load !339
  %add.9762.17 = fadd double %add.9759.17, %6
  %7 = load double, ptr addrspace(1) %arg1129, align 128, !invariant.load !339
  %add.9763.17 = fadd double %add.9762.17, %7
  %8 = fneg double %add.9763.17
  %9 = load double, ptr addrspace(1) %arg19, align 128, !invariant.load !339
  %compare.2697.9 = fcmp ole double %9, %8
  %10 = or i1 %compare.2696.9, %compare.2697.9
  %11 = load double, ptr addrspace(1) %arg925, align 128, !invariant.load !339
  %12 = load double, ptr addrspace(1) %arg1027, align 128, !invariant.load !339
  %add.9733.9 = fadd double %11, %12
  %13 = load double, ptr addrspace(1) %arg823, align 128, !invariant.load !339
  %add.9737.9 = fadd double %add.9733.9, %13
  %14 = load double, ptr addrspace(1) %arg721, align 128, !invariant.load !339
  %add.9740.9 = fadd double %add.9737.9, %14
  %15 = load double, ptr addrspace(1) %arg619, align 128, !invariant.load !339
  %add.9744.9 = fadd double %add.9740.9, %15
  %16 = load double, ptr addrspace(1) %arg517, align 128, !invariant.load !339
  %add.9748.9 = fadd double %add.9744.9, %16
  %17 = load double, ptr addrspace(1) %arg211, align 128, !invariant.load !339
  %18 = load double, ptr addrspace(1) %arg313, align 128, !invariant.load !339
  %subtract.838.15 = fsub double %17, %18
  %multiply.11605.11 = fmul double %add.9748.9, %subtract.838.15
  %compare.2698.11 = fcmp oge double %multiply.11605.11, 0.000000e+00
  %19 = or i1 %10, %compare.2698.11
  %20 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !339
  %21 = select i1 %19, double %20, double %9
  store double %21, ptr addrspace(1) %arg1843, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_24(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg17) local_unnamed_addr #0 {
entry:
  %arg1740 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1638 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1536 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1434 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1332 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1230 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1128 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1026 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg924 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg822 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg720 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg618 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg516 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg414 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg312, align 128, !invariant.load !339
  %compare.2696.17 = fcmp ogt double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg1536, align 128, !invariant.load !339
  %2 = load double, ptr addrspace(1) %arg1638, align 128, !invariant.load !339
  %add.9752.7 = fadd double %1, %2
  %3 = load double, ptr addrspace(1) %arg1434, align 128, !invariant.load !339
  %add.9754.7 = fadd double %add.9752.7, %3
  %4 = load double, ptr addrspace(1) %arg1332, align 128, !invariant.load !339
  %add.9757.7 = fadd double %add.9754.7, %4
  %5 = load double, ptr addrspace(1) %arg1230, align 128, !invariant.load !339
  %add.9759.7 = fadd double %add.9757.7, %5
  %6 = load double, ptr addrspace(1) %arg1128, align 128, !invariant.load !339
  %add.9762.7 = fadd double %add.9759.7, %6
  %7 = load double, ptr addrspace(1) %arg1026, align 128, !invariant.load !339
  %add.9763.7 = fadd double %add.9762.7, %7
  %8 = fneg double %add.9763.7
  %9 = load double, ptr addrspace(1) %arg210, align 128, !invariant.load !339
  %compare.2697.17 = fcmp ole double %9, %8
  %10 = or i1 %compare.2696.17, %compare.2697.17
  %11 = load double, ptr addrspace(1) %arg822, align 128, !invariant.load !339
  %12 = load double, ptr addrspace(1) %arg924, align 128, !invariant.load !339
  %add.9733.17 = fadd double %11, %12
  %13 = load double, ptr addrspace(1) %arg720, align 128, !invariant.load !339
  %add.9737.17 = fadd double %add.9733.17, %13
  %14 = load double, ptr addrspace(1) %arg618, align 128, !invariant.load !339
  %add.9740.17 = fadd double %add.9737.17, %14
  %15 = load double, ptr addrspace(1) %arg516, align 128, !invariant.load !339
  %add.9744.17 = fadd double %add.9740.17, %15
  %16 = load double, ptr addrspace(1) %arg414, align 128, !invariant.load !339
  %add.9748.17 = fadd double %add.9744.17, %16
  %17 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !339
  %18 = load double, ptr addrspace(1) %arg18, align 128, !invariant.load !339
  %subtract.838.13 = fsub double %17, %18
  %multiply.11605.9 = fmul double %add.9748.17, %subtract.838.13
  %compare.2698.9 = fcmp oge double %multiply.11605.9, 0.000000e+00
  %19 = or i1 %10, %compare.2698.9
  %20 = select i1 %19, double %17, double %18
  store double %20, ptr addrspace(1) %arg1740, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_13(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg18) local_unnamed_addr #0 {
entry:
  %arg1843 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1741 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1639 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1537 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1435 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1333 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1231 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1129 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1027 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg925 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg823 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg721 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg619 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg517 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg1027, align 128, !invariant.load !339
  %1 = load double, ptr addrspace(1) %arg1129, align 128, !invariant.load !339
  %add.9733.11 = fadd double %0, %1
  %2 = load double, ptr addrspace(1) %arg925, align 128, !invariant.load !339
  %add.9737.11 = fadd double %add.9733.11, %2
  %3 = load double, ptr addrspace(1) %arg823, align 128, !invariant.load !339
  %add.9740.11 = fadd double %add.9737.11, %3
  %4 = load double, ptr addrspace(1) %arg721, align 128, !invariant.load !339
  %add.9744.11 = fadd double %add.9740.11, %4
  %5 = load double, ptr addrspace(1) %arg619, align 128, !invariant.load !339
  %add.9748.11 = fadd double %add.9744.11, %5
  %6 = load double, ptr addrspace(1) %arg211, align 128, !invariant.load !339
  %7 = load double, ptr addrspace(1) %arg313, align 128, !invariant.load !339
  %subtract.838.11 = fsub double %6, %7
  %multiply.11605.7 = fmul double %add.9748.11, %subtract.838.11
  %compare.2698.7 = fcmp oge double %multiply.11605.7, 0.000000e+00
  %8 = load double, ptr addrspace(1) %arg517, align 128, !invariant.load !339
  %compare.2696.15 = fcmp ule double %8, 0.000000e+00
  %9 = load double, ptr addrspace(1) %arg1741, align 128, !invariant.load !339
  %10 = load double, ptr addrspace(1) %arg1843, align 128, !invariant.load !339
  %add.9752.21 = fadd double %9, %10
  %11 = load double, ptr addrspace(1) %arg1639, align 128, !invariant.load !339
  %add.9754.21 = fadd double %add.9752.21, %11
  %12 = load double, ptr addrspace(1) %arg1537, align 128, !invariant.load !339
  %add.9757.21 = fadd double %add.9754.21, %12
  %13 = load double, ptr addrspace(1) %arg1435, align 128, !invariant.load !339
  %add.9759.21 = fadd double %add.9757.21, %13
  %14 = load double, ptr addrspace(1) %arg1333, align 128, !invariant.load !339
  %add.9762.21 = fadd double %add.9759.21, %14
  %15 = load double, ptr addrspace(1) %arg1231, align 128, !invariant.load !339
  %add.9763.21 = fadd double %add.9762.21, %15
  %16 = fneg double %add.9763.21
  %17 = load double, ptr addrspace(1) %arg415, align 128, !invariant.load !339
  %compare.2697.15 = fcmp ugt double %17, %16
  %.not = and i1 %compare.2696.15, %compare.2697.15
  %18 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !339
  %19 = load double, ptr addrspace(1) %arg19, align 128
  %20 = select i1 %compare.2698.7, double %18, double %19
  %21 = select i1 %.not, double %20, double %add.9748.11
  store double %21, ptr addrspace(1) %arg19, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_14(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg18) local_unnamed_addr #0 {
entry:
  %arg1843 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1741 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1639 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1537 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1435 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1333 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1231 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1129 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1027 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg925 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg823 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg721 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg619 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg517 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg925, align 128, !invariant.load !339
  %1 = load double, ptr addrspace(1) %arg1027, align 128, !invariant.load !339
  %add.9733.13 = fadd double %0, %1
  %2 = load double, ptr addrspace(1) %arg823, align 128, !invariant.load !339
  %add.9737.13 = fadd double %add.9733.13, %2
  %3 = load double, ptr addrspace(1) %arg721, align 128, !invariant.load !339
  %add.9740.13 = fadd double %add.9737.13, %3
  %4 = load double, ptr addrspace(1) %arg619, align 128, !invariant.load !339
  %add.9744.13 = fadd double %add.9740.13, %4
  %5 = load double, ptr addrspace(1) %arg517, align 128, !invariant.load !339
  %add.9748.13 = fadd double %add.9744.13, %5
  %6 = load double, ptr addrspace(1) %arg211, align 128, !invariant.load !339
  %7 = load double, ptr addrspace(1) %arg313, align 128, !invariant.load !339
  %subtract.838.7 = fsub double %6, %7
  %multiply.11605.3 = fmul double %add.9748.13, %subtract.838.7
  %compare.2698.3 = fcmp oge double %multiply.11605.3, 0.000000e+00
  %8 = load double, ptr addrspace(1) %arg415, align 128, !invariant.load !339
  %compare.2696.13 = fcmp ule double %8, 0.000000e+00
  %9 = load double, ptr addrspace(1) %arg1639, align 128, !invariant.load !339
  %10 = load double, ptr addrspace(1) %arg1741, align 128, !invariant.load !339
  %add.9752.11 = fadd double %9, %10
  %11 = load double, ptr addrspace(1) %arg1537, align 128, !invariant.load !339
  %add.9754.11 = fadd double %add.9752.11, %11
  %12 = load double, ptr addrspace(1) %arg1435, align 128, !invariant.load !339
  %add.9757.11 = fadd double %add.9754.11, %12
  %13 = load double, ptr addrspace(1) %arg1333, align 128, !invariant.load !339
  %add.9759.11 = fadd double %add.9757.11, %13
  %14 = load double, ptr addrspace(1) %arg1231, align 128, !invariant.load !339
  %add.9762.11 = fadd double %add.9759.11, %14
  %15 = load double, ptr addrspace(1) %arg1129, align 128, !invariant.load !339
  %add.9763.11 = fadd double %add.9762.11, %15
  %16 = fneg double %add.9763.11
  %17 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !339
  %compare.2697.13 = fcmp ugt double %17, %16
  %.not = and i1 %compare.2696.13, %compare.2697.13
  %18 = load double, ptr addrspace(1) %arg19, align 128, !invariant.load !339
  %19 = select i1 %compare.2698.3, double %17, double %18
  %20 = select i1 %.not, double %19, double %16
  store double %20, ptr addrspace(1) %arg1843, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_15(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg18) local_unnamed_addr #0 {
entry:
  %arg1843 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg1741 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1639 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1537 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1435 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1333 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1231 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1129 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1027 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg925 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg823 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg721 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg619 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg517 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg925, align 128, !invariant.load !339
  %1 = load double, ptr addrspace(1) %arg1027, align 128, !invariant.load !339
  %add.9733.15 = fadd double %0, %1
  %2 = load double, ptr addrspace(1) %arg823, align 128, !invariant.load !339
  %add.9737.15 = fadd double %add.9733.15, %2
  %3 = load double, ptr addrspace(1) %arg721, align 128, !invariant.load !339
  %add.9740.15 = fadd double %add.9737.15, %3
  %4 = load double, ptr addrspace(1) %arg619, align 128, !invariant.load !339
  %add.9744.15 = fadd double %add.9740.15, %4
  %5 = load double, ptr addrspace(1) %arg517, align 128, !invariant.load !339
  %add.9748.15 = fadd double %add.9744.15, %5
  %6 = load double, ptr addrspace(1) %arg211, align 128, !invariant.load !339
  %7 = load double, ptr addrspace(1) %arg02, align 128, !invariant.load !339
  %subtract.838.9 = fsub double %6, %7
  %multiply.11605.5 = fmul double %add.9748.15, %subtract.838.9
  %compare.2698.5 = fcmp oge double %multiply.11605.5, 0.000000e+00
  %8 = load double, ptr addrspace(1) %arg415, align 128, !invariant.load !339
  %compare.2696.11 = fcmp ule double %8, 0.000000e+00
  %9 = load double, ptr addrspace(1) %arg1639, align 128, !invariant.load !339
  %10 = load double, ptr addrspace(1) %arg1741, align 128, !invariant.load !339
  %add.9752.19 = fadd double %9, %10
  %11 = load double, ptr addrspace(1) %arg1537, align 128, !invariant.load !339
  %add.9754.19 = fadd double %add.9752.19, %11
  %12 = load double, ptr addrspace(1) %arg1435, align 128, !invariant.load !339
  %add.9757.19 = fadd double %add.9754.19, %12
  %13 = load double, ptr addrspace(1) %arg1333, align 128, !invariant.load !339
  %add.9759.19 = fadd double %add.9757.19, %13
  %14 = load double, ptr addrspace(1) %arg1231, align 128, !invariant.load !339
  %add.9762.19 = fadd double %add.9759.19, %14
  %15 = load double, ptr addrspace(1) %arg1129, align 128, !invariant.load !339
  %add.9763.19 = fadd double %add.9762.19, %15
  %16 = fneg double %add.9763.19
  %17 = load double, ptr addrspace(1) %arg313, align 128, !invariant.load !339
  %compare.2697.11 = fcmp ugt double %17, %16
  %.not = and i1 %compare.2696.11, %compare.2697.11
  %18 = load double, ptr addrspace(1) %arg19, align 128, !invariant.load !339
  %19 = select i1 %compare.2698.5, double %7, double %6
  %20 = select i1 %.not, double %19, double %18
  store double %20, ptr addrspace(1) %arg1843, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_27(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg16) local_unnamed_addr #0 {
entry:
  %arg1637 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1535 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1433 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1331 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1229 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1127 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1025 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg923 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg821 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg719 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg617 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg515 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg413 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg29, align 128, !invariant.load !339
  %compare.2696.7 = fcmp ogt double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg1433, align 128, !invariant.load !339
  %2 = load double, ptr addrspace(1) %arg1535, align 128, !invariant.load !339
  %add.9752.15 = fadd double %1, %2
  %3 = load double, ptr addrspace(1) %arg1331, align 128, !invariant.load !339
  %add.9754.15 = fadd double %add.9752.15, %3
  %4 = load double, ptr addrspace(1) %arg1229, align 128, !invariant.load !339
  %add.9757.15 = fadd double %add.9754.15, %4
  %5 = load double, ptr addrspace(1) %arg1127, align 128, !invariant.load !339
  %add.9759.15 = fadd double %add.9757.15, %5
  %6 = load double, ptr addrspace(1) %arg1025, align 128, !invariant.load !339
  %add.9762.15 = fadd double %add.9759.15, %6
  %7 = load double, ptr addrspace(1) %arg923, align 128, !invariant.load !339
  %add.9763.15 = fadd double %add.9762.15, %7
  %8 = fneg double %add.9763.15
  %9 = load double, ptr addrspace(1) %arg17, align 128, !invariant.load !339
  %compare.2697.7 = fcmp ole double %9, %8
  %10 = or i1 %compare.2696.7, %compare.2697.7
  %11 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %12 = load double, ptr addrspace(1) %arg719, align 128, !invariant.load !339
  %13 = load double, ptr addrspace(1) %arg821, align 128, !invariant.load !339
  %add.9733.7 = fadd double %12, %13
  %14 = load double, ptr addrspace(1) %arg617, align 128, !invariant.load !339
  %add.9737.7 = fadd double %add.9733.7, %14
  %15 = load double, ptr addrspace(1) %arg515, align 128, !invariant.load !339
  %add.9740.7 = fadd double %add.9737.7, %15
  %16 = load double, ptr addrspace(1) %arg413, align 128, !invariant.load !339
  %add.9744.7 = fadd double %add.9740.7, %16
  %17 = load double, ptr addrspace(1) %arg311, align 128, !invariant.load !339
  %add.9748.7 = fadd double %add.9744.7, %17
  %18 = select i1 %10, double %11, double %add.9748.7
  store double %18, ptr addrspace(1) %arg1637, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_25(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg9) local_unnamed_addr #0 {
entry:
  %arg919 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %compare.2696.3 = fcmp ogt double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg715, align 128, !invariant.load !339
  %2 = load double, ptr addrspace(1) %arg817, align 128, !invariant.load !339
  %add.9752.9 = fadd double %1, %2
  %3 = load double, ptr addrspace(1) %arg613, align 128, !invariant.load !339
  %add.9754.9 = fadd double %add.9752.9, %3
  %4 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !339
  %add.9757.9 = fadd double %add.9754.9, %4
  %5 = load double, ptr addrspace(1) %arg49, align 128, !invariant.load !339
  %add.9759.9 = fadd double %add.9757.9, %5
  %6 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !339
  %add.9762.9 = fadd double %add.9759.9, %6
  %7 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %add.9763.9 = fadd double %add.9762.9, %7
  %8 = fneg double %add.9763.9
  %9 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %compare.2697.3 = fcmp ole double %9, %8
  %10 = or i1 %compare.2696.3, %compare.2697.3
  %11 = select i1 %10, double %9, double %8
  store double %11, ptr addrspace(1) %arg919, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_26(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg11) local_unnamed_addr #0 {
entry:
  %arg1123 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1021 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg919 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !339
  %compare.2696.5 = fcmp ogt double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg919, align 128, !invariant.load !339
  %2 = load double, ptr addrspace(1) %arg1021, align 128, !invariant.load !339
  %add.9752.13 = fadd double %1, %2
  %3 = load double, ptr addrspace(1) %arg817, align 128, !invariant.load !339
  %add.9754.13 = fadd double %add.9752.13, %3
  %4 = load double, ptr addrspace(1) %arg715, align 128, !invariant.load !339
  %add.9757.13 = fadd double %add.9754.13, %4
  %5 = load double, ptr addrspace(1) %arg613, align 128, !invariant.load !339
  %add.9759.13 = fadd double %add.9757.13, %5
  %6 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !339
  %add.9762.13 = fadd double %add.9759.13, %6
  %7 = load double, ptr addrspace(1) %arg49, align 128, !invariant.load !339
  %add.9763.13 = fadd double %add.9762.13, %7
  %8 = fneg double %add.9763.13
  %9 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %compare.2697.5 = fcmp ole double %9, %8
  %10 = or i1 %compare.2696.5, %compare.2697.5
  %11 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %12 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %13 = select i1 %10, double %11, double %12
  store double %13, ptr addrspace(1) %arg1123, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_28(ptr noalias nocapture readonly align 128 dereferenceable(1) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg9) local_unnamed_addr #0 {
entry:
  %arg919 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i8, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %1 = load double, ptr addrspace(1) %arg715, align 128, !invariant.load !339
  %2 = load double, ptr addrspace(1) %arg817, align 128, !invariant.load !339
  %add.9752.3 = fadd double %1, %2
  %3 = load double, ptr addrspace(1) %arg613, align 128, !invariant.load !339
  %add.9754.3 = fadd double %add.9752.3, %3
  %4 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !339
  %add.9757.3 = fadd double %add.9754.3, %4
  %5 = load double, ptr addrspace(1) %arg49, align 128, !invariant.load !339
  %add.9759.3 = fadd double %add.9757.3, %5
  %6 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !339
  %add.9762.3 = fadd double %add.9759.3, %6
  %7 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %add.9763.3 = fadd double %add.9762.3, %7
  %8 = fneg double %add.9763.3
  %9 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %10 = trunc i8 %0 to i1
  %11 = select i1 %10, double %8, double %9
  store double %11, ptr addrspace(1) %arg919, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_convert_fusion(ptr noalias nocapture align 128 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg01, align 128
  %1 = add i32 %0, 1
  %2 = load i8, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %3 = zext i8 %2 to i32
  %4 = add i32 %1, %3
  store i32 %4, ptr addrspace(1) %arg01, align 128
  store i32 %3, ptr addrspace(1) %arg25, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_25(ptr noalias nocapture readonly align 128 dereferenceable(4) %arg0, ptr noalias nocapture align 128 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg13, align 128
  %1 = add i32 %0, 1
  %2 = load i32, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %3 = add i32 %1, %2
  store i32 %3, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_29(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %compare.2714.1 = fcmp ogt double %0, 0.000000e+00
  %1 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %2 = call i1 @llvm.is.fpclass.f64(double %1, i32 516)
  %3 = or i1 %compare.2714.1, %2
  %4 = load double, ptr addrspace(1) %arg13, align 128
  %5 = select i1 %3, double %0, double %4
  store double %5, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_21(ptr noalias nocapture align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %1 = zext nneg i32 %0 to i64
  %2 = getelementptr double, ptr addrspace(1) %arg01, i64 %1
  %3 = load double, ptr addrspace(1) %2, align 8
  %4 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %5 = getelementptr double, ptr addrspace(1) %arg13, i64 %1
  %6 = load double, ptr addrspace(1) %5, align 8, !invariant.load !339
  %multiply.11713.1 = fmul double %4, %6
  %add.9877.1 = fadd double %3, %multiply.11713.1
  store double %add.9877.1, ptr addrspace(1) %2, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_18(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg5) local_unnamed_addr #0 {
entry:
  %arg515 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg413 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !345
  %1 = shl nuw nsw i32 %0, 7
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !342
  %3 = shl nuw nsw i32 %2, 2
  %4 = or disjoint i32 %1, %3
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %linear_index = or disjoint i32 %4, %5
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg413, i64 0, i64 %6
  %8 = load double, ptr addrspace(1) %7, align 8, !invariant.load !339
  %9 = tail call double @llvm.fma.f64(double %8, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %10 = tail call i32 @llvm.nvvm.d2i.lo(double %9) #11
  %11 = tail call double @llvm.nvvm.add.rn.d(double %9, double 0xC338000000000000) #11
  %12 = tail call double @llvm.fma.f64(double %11, double 0xBFE62E42FEFA39EF, double %8)
  %13 = tail call double @llvm.fma.f64(double %11, double 0xBC7ABC9E3B39803F, double %12)
  %14 = tail call double @llvm.fma.f64(double %13, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %15 = tail call double @llvm.fma.f64(double %14, double %13, double 0x3EC71DEE62401315)
  %16 = tail call double @llvm.fma.f64(double %15, double %13, double 0x3EFA01997C89EB71)
  %17 = tail call double @llvm.fma.f64(double %16, double %13, double 0x3F2A01A014761F65)
  %18 = tail call double @llvm.fma.f64(double %17, double %13, double 0x3F56C16C1852B7AF)
  %19 = tail call double @llvm.fma.f64(double %18, double %13, double 0x3F81111111122322)
  %20 = tail call double @llvm.fma.f64(double %19, double %13, double 0x3FA55555555502A1)
  %21 = tail call double @llvm.fma.f64(double %20, double %13, double 0x3FC5555555555511)
  %22 = tail call double @llvm.fma.f64(double %21, double %13, double 0x3FE000000000000B)
  %23 = tail call double @llvm.fma.f64(double %22, double %13, double 1.000000e+00)
  %24 = tail call double @llvm.fma.f64(double %23, double %13, double 1.000000e+00)
  %25 = tail call i32 @llvm.nvvm.d2i.lo(double %24) #11
  %26 = tail call i32 @llvm.nvvm.d2i.hi(double %24) #11
  %27 = shl i32 %10, 20
  %28 = add i32 %26, %27
  %29 = tail call double @llvm.nvvm.lohi.i2d(i32 %25, i32 %28) #11
  %30 = tail call i32 @llvm.nvvm.d2i.hi(double %8) #11
  %31 = bitcast i32 %30 to float
  %32 = tail call float @llvm.nvvm.fabs.f(float %31) #11
  %33 = fcmp olt float %32, 0x4010C46560000000
  br i1 %33, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %entry
  %34 = fcmp olt double %8, 0.000000e+00
  %35 = fadd double %8, 0x7FF0000000000000
  %z.0.i = select i1 %34, double 0.000000e+00, double %35
  %36 = fcmp olt float %32, 0x4010E90000000000
  br i1 %36, label %37, label %__nv_exp.exit

37:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %38 = sdiv i32 %10, 2
  %39 = shl i32 %38, 20
  %40 = add i32 %26, %39
  %41 = tail call double @llvm.nvvm.lohi.i2d(i32 %25, i32 %40) #11
  %42 = sub nsw i32 %10, %38
  %43 = shl i32 %42, 20
  %44 = add nsw i32 %43, 1072693248
  %45 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %44) #11
  %46 = fmul double %45, %41
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %entry, %__internal_fast_icmp_abs_lt.exit.i, %37
  %z.2.i = phi double [ %29, %entry ], [ %46, %37 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %47 = zext nneg i32 %linear_index to i64
  %48 = getelementptr double, ptr addrspace(1) %arg29, i64 %47
  %49 = load double, ptr addrspace(1) %48, align 8, !invariant.load !339
  %50 = fcmp ole double %49, -3.000000e+01
  %51 = select i1 %50, double -3.000000e+01, double %49
  %52 = fcmp oge double %51, 3.000000e+01
  %.neg = fneg double %51
  %53 = select i1 %52, double -3.000000e+01, double %.neg
  %54 = tail call double @llvm.fma.f64(double %53, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %55 = tail call i32 @llvm.nvvm.d2i.lo(double %54) #11
  %56 = tail call double @llvm.nvvm.add.rn.d(double %54, double 0xC338000000000000) #11
  %57 = tail call double @llvm.fma.f64(double %56, double 0xBFE62E42FEFA39EF, double %53)
  %58 = tail call double @llvm.fma.f64(double %56, double 0xBC7ABC9E3B39803F, double %57)
  %59 = tail call double @llvm.fma.f64(double %58, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %60 = tail call double @llvm.fma.f64(double %59, double %58, double 0x3EC71DEE62401315)
  %61 = tail call double @llvm.fma.f64(double %60, double %58, double 0x3EFA01997C89EB71)
  %62 = tail call double @llvm.fma.f64(double %61, double %58, double 0x3F2A01A014761F65)
  %63 = tail call double @llvm.fma.f64(double %62, double %58, double 0x3F56C16C1852B7AF)
  %64 = tail call double @llvm.fma.f64(double %63, double %58, double 0x3F81111111122322)
  %65 = tail call double @llvm.fma.f64(double %64, double %58, double 0x3FA55555555502A1)
  %66 = tail call double @llvm.fma.f64(double %65, double %58, double 0x3FC5555555555511)
  %67 = tail call double @llvm.fma.f64(double %66, double %58, double 0x3FE000000000000B)
  %68 = tail call double @llvm.fma.f64(double %67, double %58, double 1.000000e+00)
  %69 = tail call double @llvm.fma.f64(double %68, double %58, double 1.000000e+00)
  %70 = tail call i32 @llvm.nvvm.d2i.lo(double %69) #11
  %71 = tail call i32 @llvm.nvvm.d2i.hi(double %69) #11
  %72 = shl i32 %55, 20
  %73 = add i32 %71, %72
  %74 = tail call double @llvm.nvvm.lohi.i2d(i32 %70, i32 %73) #11
  %75 = tail call i32 @llvm.nvvm.d2i.hi(double %53) #11
  %76 = bitcast i32 %75 to float
  %77 = tail call float @llvm.nvvm.fabs.f(float %76) #11
  %78 = fcmp olt float %77, 0x4010C46560000000
  br i1 %78, label %__nv_exp.exit4, label %__internal_fast_icmp_abs_lt.exit.i1

__internal_fast_icmp_abs_lt.exit.i1:              ; preds = %__nv_exp.exit
  %79 = fcmp olt double %53, 0.000000e+00
  %80 = fadd double %53, 0x7FF0000000000000
  %z.0.i2 = select i1 %79, double 0.000000e+00, double %80
  %81 = fcmp olt float %77, 0x4010E90000000000
  br i1 %81, label %82, label %__nv_exp.exit4

82:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i1
  %83 = sdiv i32 %55, 2
  %84 = shl i32 %83, 20
  %85 = add i32 %71, %84
  %86 = tail call double @llvm.nvvm.lohi.i2d(i32 %70, i32 %85) #11
  %87 = sub nsw i32 %55, %83
  %88 = shl i32 %87, 20
  %89 = add nsw i32 %88, 1072693248
  %90 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %89) #11
  %91 = fmul double %90, %86
  br label %__nv_exp.exit4

__nv_exp.exit4:                                   ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i1, %82
  %z.2.i3 = phi double [ %74, %__nv_exp.exit ], [ %91, %82 ], [ %z.0.i2, %__internal_fast_icmp_abs_lt.exit.i1 ]
  %add.9900.5 = fadd double %z.2.i3, 1.000000e+00
  %divide.2536.5 = fdiv double 1.000000e+00, %add.9900.5
  %subtract.863.3 = fsub double 1.000000e+00, %divide.2536.5
  %92 = getelementptr double, ptr addrspace(1) %arg17, i64 %47
  %93 = load double, ptr addrspace(1) %92, align 8, !invariant.load !339
  %multiply.11732.1 = fmul double %93, %subtract.863.3
  %94 = getelementptr double, ptr addrspace(1) %arg05, i64 %47
  %95 = load double, ptr addrspace(1) %94, align 8, !invariant.load !339
  %multiply.11733.1 = fmul double %divide.2536.5, %95
  %subtract.864.2 = fsub double %multiply.11732.1, %multiply.11733.1
  %multiply.11734.3 = fmul double %z.2.i, %subtract.864.2
  %96 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg311, i64 0, i64 %6
  %97 = load double, ptr addrspace(1) %96, align 8, !invariant.load !339
  %add.9902.1 = fadd double %97, %multiply.11734.3
  %98 = getelementptr double, ptr addrspace(1) %arg515, i64 %47
  store double %add.9902.1, ptr addrspace(1) %98, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_slice_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(12288) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(24) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(9216) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg6) local_unnamed_addr #0 {
entry:
  %arg694 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg592 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg490 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg388 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg286 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg184 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg082 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !345
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !347
  %2 = shl nuw nsw i32 %0, 7
  %linear_index = or disjoint i32 %2, %1
  %3 = and i32 %1, 3
  %4 = lshr i32 %linear_index, 2
  %5 = zext nneg i32 %3 to i64
  %6 = zext nneg i32 %4 to i64
  %7 = getelementptr [4 x [192 x [2 x double]]], ptr addrspace(1) %arg184, i64 0, i64 %5, i64 %6, i64 0
  %8 = load <2 x double>, ptr addrspace(1) %7, align 16, !invariant.load !339
  %9 = extractelement <2 x double> %8, i32 0
  %10 = extractelement <2 x double> %8, i32 1
  %11 = getelementptr inbounds [2 x [192 x [4 x double]]], ptr addrspace(1) %arg082, i64 0, i64 0, i64 %6, i64 %5
  %12 = load double, ptr addrspace(1) %11, align 8, !invariant.load !339
  %13 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 6144
  %14 = load double, ptr addrspace(1) %13, align 8, !invariant.load !339
  %.lhs.trunc = trunc nuw nsw i32 %linear_index to i16
  %15 = urem i16 %.lhs.trunc, 192
  %16 = udiv i16 %.lhs.trunc, 192
  %17 = zext nneg i16 %16 to i64
  %18 = zext nneg i16 %15 to i64
  %19 = getelementptr inbounds [4 x [192 x [1 x [3 x i32]]]], ptr addrspace(1) %arg490, i64 0, i64 %17, i64 %18, i64 0, i64 0
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !339
  %21 = sext i32 %20 to i64
  %22 = load <2 x i64>, ptr addrspace(1) %arg388, align 128, !invariant.load !339
  %23 = extractelement <2 x i64> %22, i32 0
  %24 = extractelement <2 x i64> %22, i32 1
  %25 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 4
  %26 = load i32, ptr addrspace(1) %25, align 4, !invariant.load !339
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 8
  %29 = load i32, ptr addrspace(1) %28, align 4, !invariant.load !339
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, ptr addrspace(1) %arg388, i64 16
  %32 = load i64, ptr addrspace(1) %31, align 16, !invariant.load !339
  %narrow = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %33 = tail call i32 @llvm.umin.i32(i32 %narrow, i32 3)
  %narrow58 = tail call i32 @llvm.smax.i32(i32 %26, i32 0)
  %34 = tail call i32 @llvm.umin.i32(i32 %narrow58, i32 191)
  %35 = icmp sgt i32 %29, 0
  %36 = zext nneg i32 %34 to i64
  %37 = zext nneg i32 %33 to i64
  %38 = getelementptr inbounds [192 x [4 x double]], ptr addrspace(1) %arg286, i64 0, i64 %36, i64 %37
  %.pre = load double, ptr addrspace(1) %38, align 8, !invariant.load !339
  br i1 %35, label %in_bounds-true, label %in_bounds-after

in_bounds-after:                                  ; preds = %entry, %in_bounds-true
  %pad_result_addr.0 = phi double [ %.pre, %in_bounds-true ], [ 0.000000e+00, %entry ]
  %39 = getelementptr inbounds [2 x [192 x [4 x double]]], ptr addrspace(1) %arg082, i64 0, i64 0, i64 %36, i64 %37
  %40 = load double, ptr addrspace(1) %39, align 8, !invariant.load !339
  %add.9442.i63 = fadd double %40, 0.000000e+00
  %41 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 6144
  %42 = load double, ptr addrspace(1) %41, align 8, !invariant.load !339
  %add.9442.i63.1 = fadd double %add.9442.i63, %42
  %43 = tail call i32 @llvm.nvvm.d2i.hi(double %add.9442.i63.1) #11
  %44 = tail call i32 @llvm.nvvm.d2i.lo(double %add.9442.i63.1) #11
  %45 = icmp slt i32 %43, 1048576
  %46 = fmul double %add.9442.i63.1, 0x4350000000000000
  %47 = tail call i32 @llvm.nvvm.d2i.lo(double %46) #11
  %48 = tail call i32 @llvm.nvvm.d2i.hi(double %46) #11
  br i1 %45, label %49, label %50

49:                                               ; preds = %in_bounds-after
  br label %50

50:                                               ; preds = %49, %in_bounds-after
  %.0.i = phi double [ %46, %49 ], [ %add.9442.i63.1, %in_bounds-after ]
  %ihi.0.i = phi i32 [ %48, %49 ], [ %43, %in_bounds-after ]
  %ilo.0.i = phi i32 [ %47, %49 ], [ %44, %in_bounds-after ]
  %e.0.i = phi i32 [ -1077, %49 ], [ -1023, %in_bounds-after ]
  %51 = add i32 %ihi.0.i, -1
  %or.cond.i = icmp ult i32 %51, 2146435071
  br i1 %or.cond.i, label %52, label %99

52:                                               ; preds = %50
  %53 = lshr i32 %ihi.0.i, 20
  %54 = add nsw i32 %e.0.i, %53
  %55 = and i32 %ihi.0.i, 1048575
  %56 = or disjoint i32 %55, 1072693248
  %57 = tail call double @llvm.nvvm.lohi.i2d(i32 %ilo.0.i, i32 %56) #11
  %58 = icmp ugt i32 %56, 1073127582
  %59 = tail call i32 @llvm.nvvm.d2i.lo(double %57) #11
  %60 = tail call i32 @llvm.nvvm.d2i.hi(double %57) #11
  %61 = add i32 %60, -1048576
  %62 = tail call double @llvm.nvvm.lohi.i2d(i32 %59, i32 %61) #11
  %spec.select = select i1 %58, double %62, double %57
  %63 = zext i1 %58 to i32
  %spec.select64 = add nsw i32 %54, %63
  %64 = fadd double %spec.select, -1.000000e+00
  %65 = fadd double %spec.select, 1.000000e+00
  %66 = tail call double @llvm.nvvm.rcp.approx.ftz.d(double %65) #11
  %67 = fneg double %65
  %68 = tail call double @llvm.fma.f64(double %67, double %66, double 1.000000e+00)
  %69 = tail call double @llvm.fma.f64(double %68, double %68, double %68)
  %70 = tail call double @llvm.fma.f64(double %69, double %66, double %66)
  %71 = fmul double %64, %70
  %72 = fadd double %71, %71
  %73 = fmul double %72, %72
  %74 = tail call double @llvm.fma.f64(double %73, double 0x3EB1380B3AE80F1E, double 0x3ED0EE258B7A8B04)
  %75 = tail call double @llvm.fma.f64(double %74, double %73, double 0x3EF3B2669F02676F)
  %76 = tail call double @llvm.fma.f64(double %75, double %73, double 0x3F1745CBA9AB0956)
  %77 = tail call double @llvm.fma.f64(double %76, double %73, double 0x3F3C71C72D1B5154)
  %78 = tail call double @llvm.fma.f64(double %77, double %73, double 0x3F624924923BE72D)
  %79 = tail call double @llvm.fma.f64(double %78, double %73, double 0x3F8999999999A3C4)
  %80 = tail call double @llvm.fma.f64(double %79, double %73, double 0x3FB5555555555554)
  %81 = fsub double %64, %72
  %82 = fmul double %81, 2.000000e+00
  %83 = fneg double %72
  %84 = tail call double @llvm.fma.f64(double %83, double %64, double %82)
  %85 = fmul double %70, %84
  %86 = fmul double %73, %80
  %87 = tail call double @llvm.fma.f64(double %86, double %72, double %85)
  %88 = xor i32 %spec.select64, -2147483648
  %89 = tail call double @llvm.nvvm.lohi.i2d(i32 %88, i32 1127219200) #11
  %90 = tail call double @llvm.nvvm.lohi.i2d(i32 -2147483648, i32 1127219200) #11
  %91 = fsub double %89, %90
  %92 = tail call double @llvm.fma.f64(double %91, double 0x3FE62E42FEFA39EF, double %72)
  %93 = fneg double %91
  %94 = tail call double @llvm.fma.f64(double %93, double 0x3FE62E42FEFA39EF, double %92)
  %95 = fsub double %94, %72
  %96 = fsub double %87, %95
  %97 = tail call double @llvm.fma.f64(double %91, double 0x3C7ABC9E3B39803F, double %96)
  %98 = fadd double %92, %97
  br label %__nv_log.exit

99:                                               ; preds = %50
  %100 = tail call double @llvm.fma.f64(double %.0.i, double 0x7FF0000000000000, double 0x7FF0000000000000)
  %101 = tail call i32 @llvm.nvvm.d2i.hi(double %.0.i) #11
  %102 = and i32 %101, 2147483647
  %103 = icmp eq i32 %102, 0
  %q.0.i = select i1 %103, double 0xFFF0000000000000, double %100
  br label %__nv_log.exit

__nv_log.exit:                                    ; preds = %52, %99
  %q.1.i = phi double [ %98, %52 ], [ %q.0.i, %99 ]
  %104 = trunc i64 %27 to i32
  %105 = trunc i64 %21 to i32
  %106 = trunc i64 %30 to i32
  %107 = fcmp ole double %.pre, 0.000000e+00
  %maximum.59.i.1 = select i1 %107, double 0.000000e+00, double %.pre
  %add.9442.i = fadd double %9, 0.000000e+00
  %add.9442.i.1 = fadd double %add.9442.i, %10
  %add.9442.i62 = fadd double %12, 0.000000e+00
  %add.9442.i62.1 = fadd double %add.9442.i62, %14
  %108 = icmp sgt i32 %106, -1
  %109 = icmp sge i64 %32, %30
  %110 = and i1 %108, %109
  %111 = icmp sgt i32 %105, -1
  %112 = icmp sge i64 %23, %21
  %113 = and i1 %111, %112
  %114 = icmp sgt i32 %104, -1
  %115 = icmp sge i64 %24, %27
  %116 = and i1 %114, %115
  %117 = select i1 %110, i1 %116, i1 false
  %118 = select i1 %117, i1 %113, i1 false
  %subtract.865.9.clone.1 = fsub double %pad_result_addr.0, %maximum.59.i.1
  %119 = fneg double %add.9442.i.1
  %divide.2537.3 = fdiv double %119, %add.9442.i62.1
  %multiply.11735.1 = fmul double %divide.2537.3, %14
  %add.9904.1 = fadd double %10, %multiply.11735.1
  %subtract.866.5.clone.1 = fsub double %subtract.865.9.clone.1, %q.1.i
  %120 = select i1 %118, double %subtract.866.5.clone.1, double 0x7FF8000000000000
  %121 = zext nneg i32 %linear_index to i64
  %122 = getelementptr double, ptr addrspace(1) %arg592, i64 %121
  store double %add.9904.1, ptr addrspace(1) %122, align 8
  %123 = getelementptr double, ptr addrspace(1) %arg694, i64 %121
  store double %120, ptr addrspace(1) %123, align 8
  ret void

in_bounds-true:                                   ; preds = %entry
  br label %in_bounds-after
}

; Function Attrs: norecurse nounwind
define void @input_multiply_reduce_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(6144) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(6144) %arg8) local_unnamed_addr #6 {
entry:
  %arg866 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg764 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg662 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg560 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg458 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg356 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg254 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg152 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg050 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !349
  %0 = lshr i32 %thread.id.x, 5
  %thread.id.2 = and i32 %thread.id.x, 31
  %1 = zext i32 %thread.id.2 to i64
  %param_5.3977 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg560, i64 0, i64 %1
  %2 = add nuw nsw i32 %0, -32
  %3 = shl nuw nsw i64 %1, 3
  %4 = zext nneg i32 %thread.id.x to i64
  %5 = lshr i64 %4, 5
  %6 = shl nuw nsw i64 %5, 5
  %scevgep = getelementptr i8, ptr addrspace(1) %arg050, i64 %6
  %scevgep71 = getelementptr i8, ptr addrspace(1) %arg356, i64 %6
  %scevgep75 = getelementptr i8, ptr addrspace(1) %arg254, i64 %6
  %scevgep79 = getelementptr i8, ptr addrspace(1) %arg152, i64 %6
  %scevgep83 = getelementptr i8, ptr addrspace(1) %arg458, i64 %6
  %scevgep87 = getelementptr i8, ptr addrspace(1) %arg662, i64 %6
  %scevgep91 = getelementptr i8, ptr addrspace(1) %arg866, i64 %6
  br label %loop1.loop_body

reduce-group-0-after:                             ; preds = %loop1.loop_exit, %reduction_write_output-true
  ret void

loop1.loop_body:                                  ; preds = %entry, %x_in_tile-after
  %lsr.iv92 = phi ptr addrspace(1) [ %scevgep91, %entry ], [ %scevgep93, %x_in_tile-after ]
  %lsr.iv88 = phi ptr addrspace(1) [ %scevgep87, %entry ], [ %scevgep89, %x_in_tile-after ]
  %lsr.iv84 = phi ptr addrspace(1) [ %scevgep83, %entry ], [ %scevgep85, %x_in_tile-after ]
  %lsr.iv80 = phi ptr addrspace(1) [ %scevgep79, %entry ], [ %scevgep81, %x_in_tile-after ]
  %lsr.iv76 = phi ptr addrspace(1) [ %scevgep75, %entry ], [ %scevgep77, %x_in_tile-after ]
  %lsr.iv72 = phi ptr addrspace(1) [ %scevgep71, %entry ], [ %scevgep73, %x_in_tile-after ]
  %lsr.iv68 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep69, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %2, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.048 = phi double [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %7 = trunc i64 %1 to i32
  %8 = icmp ult i32 %7, 4
  br i1 %8, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %__nv_exp.exit38, %loop1.loop_body
  %partial_reduction_result.1 = phi double [ %add.9442.i47, %__nv_exp.exit38 ], [ %partial_reduction_result.048, %loop1.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep69 = getelementptr i8, ptr addrspace(1) %lsr.iv68, i64 1024
  %scevgep73 = getelementptr i8, ptr addrspace(1) %lsr.iv72, i64 1024
  %scevgep77 = getelementptr i8, ptr addrspace(1) %lsr.iv76, i64 1024
  %scevgep81 = getelementptr i8, ptr addrspace(1) %lsr.iv80, i64 1024
  %scevgep85 = getelementptr i8, ptr addrspace(1) %lsr.iv84, i64 1024
  %scevgep89 = getelementptr i8, ptr addrspace(1) %lsr.iv88, i64 1024
  %scevgep93 = getelementptr i8, ptr addrspace(1) %lsr.iv92, i64 1024
  %9 = icmp ugt i32 %lsr.iv.next, 159
  br i1 %9, label %loop1.loop_exit, label %loop1.loop_body, !llvm.loop !355

loop1.loop_exit:                                  ; preds = %x_in_tile-after
  %10 = zext nneg i32 %0 to i64
  %11 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache3, i64 0, i64 %1, i64 %10
  store double %partial_reduction_result.1, ptr addrspace(3) %11, align 8
  tail call void @llvm.nvvm.barrier0()
  %12 = getelementptr inbounds [32 x [33 x double]], ptr addrspace(3) @shared_cache3, i64 0, i64 %10, i64 %1
  %partial_reduction_result183334 = load <2 x i32>, ptr addrspace(3) %12, align 8
  %13 = extractelement <2 x i32> %partial_reduction_result183334, i64 0
  %14 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 16, i32 31)
  %15 = insertelement <2 x i32> poison, i32 %14, i64 0
  %16 = extractelement <2 x i32> %partial_reduction_result183334, i64 1
  %17 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %16, i32 16, i32 31)
  %18 = insertelement <2 x i32> %15, i32 %17, i64 1
  %19 = bitcast <2 x i32> %18 to double
  %20 = bitcast <2 x i32> %partial_reduction_result183334 to double
  %add.9442.i = fadd double %20, %19
  %21 = bitcast double %add.9442.i to <2 x i32>
  %22 = extractelement <2 x i32> %21, i64 0
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 8, i32 31)
  %24 = insertelement <2 x i32> poison, i32 %23, i64 0
  %25 = extractelement <2 x i32> %21, i64 1
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 8, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 1
  %28 = bitcast <2 x i32> %27 to double
  %add.9442.i43 = fadd double %add.9442.i, %28
  %29 = bitcast double %add.9442.i43 to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 4, i32 31)
  %32 = insertelement <2 x i32> poison, i32 %31, i64 0
  %33 = extractelement <2 x i32> %29, i64 1
  %34 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %33, i32 4, i32 31)
  %35 = insertelement <2 x i32> %32, i32 %34, i64 1
  %36 = bitcast <2 x i32> %35 to double
  %add.9442.i44 = fadd double %add.9442.i43, %36
  %37 = bitcast double %add.9442.i44 to <2 x i32>
  %38 = extractelement <2 x i32> %37, i64 0
  %39 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %38, i32 2, i32 31)
  %40 = insertelement <2 x i32> poison, i32 %39, i64 0
  %41 = extractelement <2 x i32> %37, i64 1
  %42 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %41, i32 2, i32 31)
  %43 = insertelement <2 x i32> %40, i32 %42, i64 1
  %44 = bitcast <2 x i32> %43 to double
  %add.9442.i45 = fadd double %add.9442.i44, %44
  %45 = bitcast double %add.9442.i45 to <2 x i32>
  %46 = extractelement <2 x i32> %45, i64 0
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 1, i32 31)
  %48 = insertelement <2 x i32> poison, i32 %47, i64 0
  %49 = extractelement <2 x i32> %45, i64 1
  %50 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %49, i32 1, i32 31)
  %51 = insertelement <2 x i32> %48, i32 %50, i64 1
  %52 = bitcast <2 x i32> %51 to double
  %add.9442.i46 = fadd double %add.9442.i45, %52
  store double %add.9442.i46, ptr addrspace(3) %12, align 8
  %53 = and i32 %thread.id.x, 927
  %54 = icmp eq i32 %53, 0
  %output_element_address = getelementptr inbounds [4 x double], ptr addrspace(1) %arg764, i64 0, i64 %10
  br i1 %54, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %loop1.loop_body
  %scevgep70 = getelementptr i8, ptr addrspace(1) %lsr.iv68, i64 %3
  %param_0.40682 = load double, ptr addrspace(1) %scevgep70, align 8, !invariant.load !339
  %add.9442.i47 = fadd double %partial_reduction_result.048, %param_0.40682
  %scevgep74 = getelementptr i8, ptr addrspace(1) %lsr.iv72, i64 %3
  %param_3.40113 = load double, ptr addrspace(1) %scevgep74, align 8, !invariant.load !339
  %55 = fcmp ole double %param_3.40113, -3.000000e+01
  %56 = select i1 %55, double -3.000000e+01, double %param_3.40113
  %57 = fcmp oge double %56, 3.000000e+01
  %58 = select i1 %57, double 3.000000e+01, double %56
  %59 = fneg double %58
  %60 = tail call double @llvm.fma.f64(double %59, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %61 = tail call i32 @llvm.nvvm.d2i.lo(double %60) #11
  %62 = tail call double @llvm.nvvm.add.rn.d(double %60, double 0xC338000000000000) #11
  %63 = tail call double @llvm.fma.f64(double %62, double 0xBFE62E42FEFA39EF, double %59)
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
  %76 = tail call i32 @llvm.nvvm.d2i.lo(double %75) #11
  %77 = tail call i32 @llvm.nvvm.d2i.hi(double %75) #11
  %78 = shl i32 %61, 20
  %79 = add i32 %77, %78
  %80 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 %79) #11
  %81 = tail call i32 @llvm.nvvm.d2i.hi(double %59) #11
  %82 = bitcast i32 %81 to float
  %83 = tail call float @llvm.nvvm.fabs.f(float %82) #11
  %84 = fcmp olt float %83, 0x4010C46560000000
  br i1 %84, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true
  %85 = fcmp ogt double %58, 0.000000e+00
  %86 = fsub double 0x7FF0000000000000, %58
  %z.0.i = select i1 %85, double 0.000000e+00, double %86
  %87 = fcmp olt float %83, 0x4010E90000000000
  br i1 %87, label %88, label %__nv_exp.exit

88:                                               ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %89 = sdiv i32 %61, 2
  %90 = shl i32 %89, 20
  %91 = add i32 %77, %90
  %92 = tail call double @llvm.nvvm.lohi.i2d(i32 %76, i32 %91) #11
  %93 = sub nsw i32 %61, %89
  %94 = shl i32 %93, 20
  %95 = add nsw i32 %94, 1072693248
  %96 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %95) #11
  %97 = fmul double %96, %92
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true, %__internal_fast_icmp_abs_lt.exit.i, %88
  %z.2.i = phi double [ %80, %x_in_tile-true ], [ %97, %88 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %add.9900.3 = fadd double %z.2.i, 1.000000e+00
  %divide.2536.3 = fdiv double 1.000000e+00, %add.9900.3
  %subtract.863.2 = fsub double 1.000000e+00, %divide.2536.3
  %scevgep78 = getelementptr i8, ptr addrspace(1) %lsr.iv76, i64 %3
  %param_2.47574 = load double, ptr addrspace(1) %scevgep78, align 8, !invariant.load !339
  %multiply.11732.2 = fmul double %param_2.47574, %subtract.863.2
  %scevgep82 = getelementptr i8, ptr addrspace(1) %lsr.iv80, i64 %3
  %param_1.57065 = load double, ptr addrspace(1) %scevgep82, align 8, !invariant.load !339
  %multiply.11733.2 = fmul double %divide.2536.3, %param_1.57065
  %subtract.864.1 = fsub double %multiply.11732.2, %multiply.11733.2
  %multiply.11744.1 = fmul double %param_0.40682, %subtract.864.1
  %param_5.39776 = load double, ptr addrspace(1) %param_5.3977, align 8, !invariant.load !339
  %98 = tail call double @llvm.fma.f64(double %param_5.39776, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %99 = tail call i32 @llvm.nvvm.d2i.lo(double %98) #11
  %100 = tail call double @llvm.nvvm.add.rn.d(double %98, double 0xC338000000000000) #11
  %101 = tail call double @llvm.fma.f64(double %100, double 0xBFE62E42FEFA39EF, double %param_5.39776)
  %102 = tail call double @llvm.fma.f64(double %100, double 0xBC7ABC9E3B39803F, double %101)
  %103 = tail call double @llvm.fma.f64(double %102, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %104 = tail call double @llvm.fma.f64(double %103, double %102, double 0x3EC71DEE62401315)
  %105 = tail call double @llvm.fma.f64(double %104, double %102, double 0x3EFA01997C89EB71)
  %106 = tail call double @llvm.fma.f64(double %105, double %102, double 0x3F2A01A014761F65)
  %107 = tail call double @llvm.fma.f64(double %106, double %102, double 0x3F56C16C1852B7AF)
  %108 = tail call double @llvm.fma.f64(double %107, double %102, double 0x3F81111111122322)
  %109 = tail call double @llvm.fma.f64(double %108, double %102, double 0x3FA55555555502A1)
  %110 = tail call double @llvm.fma.f64(double %109, double %102, double 0x3FC5555555555511)
  %111 = tail call double @llvm.fma.f64(double %110, double %102, double 0x3FE000000000000B)
  %112 = tail call double @llvm.fma.f64(double %111, double %102, double 1.000000e+00)
  %113 = tail call double @llvm.fma.f64(double %112, double %102, double 1.000000e+00)
  %114 = tail call i32 @llvm.nvvm.d2i.lo(double %113) #11
  %115 = tail call i32 @llvm.nvvm.d2i.hi(double %113) #11
  %116 = shl i32 %99, 20
  %117 = add i32 %115, %116
  %118 = tail call double @llvm.nvvm.lohi.i2d(i32 %114, i32 %117) #11
  %119 = tail call i32 @llvm.nvvm.d2i.hi(double %param_5.39776) #11
  %120 = bitcast i32 %119 to float
  %121 = tail call float @llvm.nvvm.fabs.f(float %120) #11
  %122 = fcmp olt float %121, 0x4010C46560000000
  br i1 %122, label %__nv_exp.exit38, label %__internal_fast_icmp_abs_lt.exit.i35

__internal_fast_icmp_abs_lt.exit.i35:             ; preds = %__nv_exp.exit
  %123 = fcmp olt double %param_5.39776, 0.000000e+00
  %124 = fadd double %param_5.39776, 0x7FF0000000000000
  %z.0.i36 = select i1 %123, double 0.000000e+00, double %124
  %125 = fcmp olt float %121, 0x4010E90000000000
  br i1 %125, label %126, label %__nv_exp.exit38

126:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i35
  %127 = sdiv i32 %99, 2
  %128 = shl i32 %127, 20
  %129 = add i32 %115, %128
  %130 = tail call double @llvm.nvvm.lohi.i2d(i32 %114, i32 %129) #11
  %131 = sub nsw i32 %99, %127
  %132 = shl i32 %131, 20
  %133 = add nsw i32 %132, 1072693248
  %134 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %133) #11
  %135 = fmul double %134, %130
  br label %__nv_exp.exit38

__nv_exp.exit38:                                  ; preds = %__nv_exp.exit, %__internal_fast_icmp_abs_lt.exit.i35, %126
  %z.2.i37 = phi double [ %118, %__nv_exp.exit ], [ %135, %126 ], [ %z.0.i36, %__internal_fast_icmp_abs_lt.exit.i35 ]
  %multiply.11736.15.clone.1 = fmul double %param_0.40682, %z.2.i37
  %136 = fneg double %multiply.11736.15.clone.1
  %137 = fmul double %param_2.47574, %136
  %138 = fmul double %param_1.57065, %multiply.11736.15.clone.1
  %add.9907.7.clone.1 = fsub double %137, %138
  %multiply.11739.1.clone.1 = fmul double %divide.2536.3, %subtract.863.2
  %multiply.11740.5.clone.1 = fmul double %multiply.11739.1.clone.1, %add.9907.7.clone.1
  %compare.2718.1.clone.1 = fcmp oeq double %56, %58
  %scevgep86 = getelementptr i8, ptr addrspace(1) %lsr.iv84, i64 %3
  %param_4.493613 = load double, ptr addrspace(1) %scevgep86, align 8, !invariant.load !339
  %139 = select i1 %compare.2718.1.clone.1, double 1.000000e+00, double %param_4.493613
  %compare.2719.1.clone.1 = fcmp oeq double %58, 3.000000e+01
  %140 = select i1 %compare.2719.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.2538.5.clone.1 = fdiv double %139, %140
  %multiply.11741.3.clone.1 = fmul double %divide.2538.5.clone.1, %multiply.11740.5.clone.1
  %compare.2720.1.clone.1 = fcmp oeq double %param_3.40113, %56
  %141 = select i1 %compare.2720.1.clone.1, double 1.000000e+00, double %param_4.493613
  %compare.2721.1.clone.1 = fcmp oeq double %56, -3.000000e+01
  %142 = select i1 %compare.2721.1.clone.1, double 2.000000e+00, double 1.000000e+00
  %divide.2539.3.clone.1 = fdiv double %141, %142
  %multiply.11742.1.clone.1 = fmul double %divide.2539.3.clone.1, %multiply.11741.3.clone.1
  %scevgep90 = getelementptr i8, ptr addrspace(1) %lsr.iv88, i64 %3
  store double %multiply.11744.1, ptr addrspace(1) %scevgep90, align 8
  %scevgep94 = getelementptr i8, ptr addrspace(1) %lsr.iv92, i64 %3
  store double %multiply.11742.1.clone.1, ptr addrspace(1) %scevgep94, align 8
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i46, ptr addrspace(1) %output_element_address, align 8
  br label %reduce-group-0-after
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_add_reduce_fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(32) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg23) local_unnamed_addr #3 {
entry:
  %arg23198 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22196 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21194 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20192 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19190 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18188 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17186 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16184 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15182 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14180 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13178 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12176 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11174 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10172 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9170 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8168 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7166 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6164 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5162 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4160 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3158 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2156 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1154 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0152 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true97, %thread_in_bounds-after85
  ret void

loop1.loop_exit:                                  ; preds = %__nv_exp.exit, %entry
  %partial_reduction_result5.0 = phi double [ %105, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %partial_reduction_result8.0 = phi double [ %106, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %partial_reduction_result2.0 = phi double [ %104, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %partial_reduction_result11.0 = phi double [ %107, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %partial_reduction_result.0 = phi double [ %103, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %partial_reduction_result14.0 = phi double [ %108, %__nv_exp.exit ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i135 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i136 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i136 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i137 = fadd double %add.9442.i136, %33
  br i1 %17, label %reduction_write_output-true53, label %thread_in_bounds-after52

thread_in_bounds-after52:                         ; preds = %reduction_write_output-true53, %thread_in_bounds-after
  %34 = icmp eq i32 %thread.id.x, 0
  %35 = bitcast double %partial_reduction_result5.0 to <2 x i32>
  %36 = extractelement <2 x i32> %35, i64 0
  %37 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %36, i32 2, i32 31)
  %38 = insertelement <2 x i32> poison, i32 %37, i64 0
  %39 = extractelement <2 x i32> %35, i64 1
  %40 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %39, i32 2, i32 31)
  %41 = insertelement <2 x i32> %38, i32 %40, i64 1
  %42 = bitcast <2 x i32> %41 to double
  %add.9442.i138 = fadd double %partial_reduction_result5.0, %42
  %43 = bitcast double %add.9442.i138 to <2 x i32>
  %44 = extractelement <2 x i32> %43, i64 0
  %45 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %44, i32 1, i32 31)
  %46 = extractelement <2 x i32> %43, i64 1
  %47 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %46, i32 1, i32 31)
  %48 = insertelement <2 x i32> poison, i32 %45, i64 0
  %49 = insertelement <2 x i32> %48, i32 %47, i64 1
  %50 = bitcast <2 x i32> %49 to double
  %add.9442.i139 = fadd double %add.9442.i138, %50
  br i1 %34, label %reduction_write_output-true64, label %thread_in_bounds-after63

thread_in_bounds-after63:                         ; preds = %reduction_write_output-true64, %thread_in_bounds-after52
  %51 = icmp eq i32 %thread.id.x, 0
  %52 = bitcast double %partial_reduction_result8.0 to <2 x i32>
  %53 = extractelement <2 x i32> %52, i64 0
  %54 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %53, i32 2, i32 31)
  %55 = insertelement <2 x i32> poison, i32 %54, i64 0
  %56 = extractelement <2 x i32> %52, i64 1
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 2, i32 31)
  %58 = insertelement <2 x i32> %55, i32 %57, i64 1
  %59 = bitcast <2 x i32> %58 to double
  %add.9442.i140 = fadd double %partial_reduction_result8.0, %59
  %60 = bitcast double %add.9442.i140 to <2 x i32>
  %61 = extractelement <2 x i32> %60, i64 0
  %62 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %61, i32 1, i32 31)
  %63 = extractelement <2 x i32> %60, i64 1
  %64 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %63, i32 1, i32 31)
  %65 = insertelement <2 x i32> poison, i32 %62, i64 0
  %66 = insertelement <2 x i32> %65, i32 %64, i64 1
  %67 = bitcast <2 x i32> %66 to double
  %add.9442.i141 = fadd double %add.9442.i140, %67
  br i1 %51, label %reduction_write_output-true75, label %thread_in_bounds-after74

thread_in_bounds-after74:                         ; preds = %reduction_write_output-true75, %thread_in_bounds-after63
  %68 = icmp eq i32 %thread.id.x, 0
  %69 = bitcast double %partial_reduction_result11.0 to <2 x i32>
  %70 = extractelement <2 x i32> %69, i64 0
  %71 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %70, i32 2, i32 31)
  %72 = insertelement <2 x i32> poison, i32 %71, i64 0
  %73 = extractelement <2 x i32> %69, i64 1
  %74 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %73, i32 2, i32 31)
  %75 = insertelement <2 x i32> %72, i32 %74, i64 1
  %76 = bitcast <2 x i32> %75 to double
  %add.9442.i142 = fadd double %partial_reduction_result11.0, %76
  %77 = bitcast double %add.9442.i142 to <2 x i32>
  %78 = extractelement <2 x i32> %77, i64 0
  %79 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %78, i32 1, i32 31)
  %80 = extractelement <2 x i32> %77, i64 1
  %81 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %80, i32 1, i32 31)
  %82 = insertelement <2 x i32> poison, i32 %79, i64 0
  %83 = insertelement <2 x i32> %82, i32 %81, i64 1
  %84 = bitcast <2 x i32> %83 to double
  %add.9442.i143 = fadd double %add.9442.i142, %84
  br i1 %68, label %reduction_write_output-true86, label %thread_in_bounds-after85

thread_in_bounds-after85:                         ; preds = %reduction_write_output-true86, %thread_in_bounds-after74
  %85 = icmp eq i32 %thread.id.x, 0
  %86 = bitcast double %partial_reduction_result14.0 to <2 x i32>
  %87 = extractelement <2 x i32> %86, i64 0
  %88 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %87, i32 2, i32 31)
  %89 = insertelement <2 x i32> poison, i32 %88, i64 0
  %90 = extractelement <2 x i32> %86, i64 1
  %91 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %90, i32 2, i32 31)
  %92 = insertelement <2 x i32> %89, i32 %91, i64 1
  %93 = bitcast <2 x i32> %92 to double
  %add.9442.i144 = fadd double %partial_reduction_result14.0, %93
  %94 = bitcast double %add.9442.i144 to <2 x i32>
  %95 = extractelement <2 x i32> %94, i64 0
  %96 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %95, i32 1, i32 31)
  %97 = extractelement <2 x i32> %94, i64 1
  %98 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %97, i32 1, i32 31)
  %99 = insertelement <2 x i32> poison, i32 %96, i64 0
  %100 = insertelement <2 x i32> %99, i32 %98, i64 1
  %101 = bitcast <2 x i32> %100 to double
  %add.9442.i145 = fadd double %add.9442.i144, %101
  br i1 %85, label %reduction_write_output-true97, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %102 = zext nneg i32 %thread.id.x to i64
  %param_0.4236 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg0152, i64 0, i64 %102
  %param_0.423617 = load double, ptr addrspace(1) %param_0.4236, align 8, !invariant.load !339
  %multiply.11722.1 = fmul double %param_0.423617, %param_0.423617
  %add.9887.5 = fadd double %multiply.11722.1, 0x3FFD67F1C864BEB4
  %multiply.11723.3 = fmul double %add.9887.5, 5.000000e-01
  %103 = fsub double 0.000000e+00, %multiply.11723.3
  %param_3.5784 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg3158, i64 0, i64 %102
  %param_3.578420 = load double, ptr addrspace(1) %param_3.5784, align 8, !invariant.load !339
  %add.9897.5.clone.1 = fadd double %param_3.578420, -1.000000e+00
  %multiply.11730.1.clone.1 = fmul double %add.9897.5.clone.1, %add.9897.5.clone.1
  %add.9898.5.clone.1 = fadd double %multiply.11730.1.clone.1, 0x3FFD67F1C864BEB4
  %multiply.11731.3.clone.1 = fmul double %add.9898.5.clone.1, 5.000000e-01
  %104 = fsub double 0.000000e+00, %multiply.11731.3.clone.1
  %param_5.4139 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg5162, i64 0, i64 %102
  %param_5.413922 = load double, ptr addrspace(1) %param_5.4139, align 8, !invariant.load !339
  %add.9889.5.clone.1 = fadd double %param_5.413922, 6.000000e+00
  %multiply.11724.1.clone.1 = fmul double %add.9889.5.clone.1, %add.9889.5.clone.1
  %multiply.11725.3.clone.1 = fmul double %multiply.11724.1.clone.1, 2.500000e-01
  %add.9890.3.clone.1 = fadd double %multiply.11725.3.clone.1, 0x4009CB1A63AF7C52
  %multiply.11726.3.clone.1 = fmul double %add.9890.3.clone.1, 5.000000e-01
  %105 = fsub double 0.000000e+00, %multiply.11726.3.clone.1
  %param_7.2737 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg7166, i64 0, i64 %102
  %param_7.273724 = load double, ptr addrspace(1) %param_7.2737, align 8, !invariant.load !339
  %add.9880.5.clone.1 = fadd double %param_7.273724, 4.000000e+00
  %multiply.11716.1.clone.1 = fmul double %add.9880.5.clone.1, %add.9880.5.clone.1
  %multiply.11717.3.clone.1 = fmul double %multiply.11716.1.clone.1, 2.500000e-01
  %add.9882.3.clone.1 = fadd double %multiply.11717.3.clone.1, 0x4009CB1A63AF7C52
  %multiply.11718.3.clone.1 = fmul double %add.9882.3.clone.1, 5.000000e-01
  %106 = fsub double 0.000000e+00, %multiply.11718.3.clone.1
  %param_9.1868 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg9170, i64 0, i64 %102
  %param_9.186826 = load double, ptr addrspace(1) %param_9.1868, align 8, !invariant.load !339
  %add.9893.5.clone.1 = fadd double %param_9.186826, -1.000000e+00
  %multiply.11727.1.clone.1 = fmul double %add.9893.5.clone.1, %add.9893.5.clone.1
  %multiply.11728.5.clone.1 = fmul double %multiply.11727.1.clone.1, 4.000000e+00
  %add.9894.3.clone.1 = fadd double %multiply.11728.5.clone.1, 0x3FDCE6BB25AA1315
  %multiply.11729.3.clone.1 = fmul double %add.9894.3.clone.1, 5.000000e-01
  %107 = fsub double 0.000000e+00, %multiply.11729.3.clone.1
  %param_11.1395 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg11174, i64 0, i64 %102
  %param_11.139528 = load double, ptr addrspace(1) %param_11.1395, align 8, !invariant.load !339
  %add.9883.5.clone.1 = fadd double %param_11.139528, 0xBFF62E42FEFA39EF
  %multiply.11719.1.clone.1 = fmul double %add.9883.5.clone.1, %add.9883.5.clone.1
  %multiply.11720.5.clone.1 = fmul double %multiply.11719.1.clone.1, 0x3FFC71C71C71C71C
  %add.9884.3.clone.1 = fadd double %multiply.11720.5.clone.1, 0x3FF43340BFCA50EB
  %multiply.11721.3.clone.1 = fmul double %add.9884.3.clone.1, 5.000000e-01
  %108 = fsub double 0.000000e+00, %multiply.11721.3.clone.1
  %param_1.8218 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg1154, i64 0, i64 %102
  %param_1.821830 = load double, ptr addrspace(1) %param_1.8218, align 8, !invariant.load !339
  %add.9905.1 = fadd double %param_0.423617, %param_1.821830
  %param_2.6903 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg2156, i64 0, i64 %102
  %param_2.690333 = load double, ptr addrspace(1) %param_2.6903, align 8, !invariant.load !339
  %add.9910.1.clone.1.clone.1 = fadd double %add.9897.5.clone.1, %param_2.690333
  %param_4.5099 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg4160, i64 0, i64 %102
  %param_4.509934 = load double, ptr addrspace(1) %param_4.5099, align 8, !invariant.load !339
  %multiply.11748.3.clone.1.clone.1 = fmul double %add.9889.5.clone.1, 2.500000e-01
  %add.9913.1.clone.1.clone.1 = fadd double %multiply.11748.3.clone.1.clone.1, %param_4.509934
  %param_6.3469 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg6164, i64 0, i64 %102
  %param_6.346935 = load double, ptr addrspace(1) %param_6.3469, align 8, !invariant.load !339
  %multiply.11747.3.clone.1.clone.1 = fmul double %add.9880.5.clone.1, 2.500000e-01
  %add.9912.1.clone.1.clone.1 = fadd double %multiply.11747.3.clone.1.clone.1, %param_6.346935
  %param_8.2203 = getelementptr inbounds [4 x [1 x double]], ptr addrspace(1) %arg8168, i64 0, i64 %102, i64 0
  %param_8.220336 = load double, ptr addrspace(1) %param_8.2203, align 8, !invariant.load !339
  %multiply.11743.3.clone.1.clone.1 = fmul double %add.9893.5.clone.1, 4.000000e+00
  %add.9908.1.clone.1.clone.1 = fadd double %multiply.11743.3.clone.1.clone.1, %param_8.220336
  %param_10.1624 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg10172, i64 0, i64 %102
  %param_10.162437 = load double, ptr addrspace(1) %param_10.1624, align 8, !invariant.load !339
  %109 = tail call double @llvm.fma.f64(double %param_11.139528, double 0x3FF71547652B82FE, double 0x4338000000000000)
  %110 = tail call i32 @llvm.nvvm.d2i.lo(double %109) #11
  %111 = tail call double @llvm.nvvm.add.rn.d(double %109, double 0xC338000000000000) #11
  %112 = tail call double @llvm.fma.f64(double %111, double 0xBFE62E42FEFA39EF, double %param_11.139528)
  %113 = tail call double @llvm.fma.f64(double %111, double 0xBC7ABC9E3B39803F, double %112)
  %114 = tail call double @llvm.fma.f64(double %113, double 0x3E5ADE1569CE2BDF, double 0x3E928AF3FCA213EA)
  %115 = tail call double @llvm.fma.f64(double %114, double %113, double 0x3EC71DEE62401315)
  %116 = tail call double @llvm.fma.f64(double %115, double %113, double 0x3EFA01997C89EB71)
  %117 = tail call double @llvm.fma.f64(double %116, double %113, double 0x3F2A01A014761F65)
  %118 = tail call double @llvm.fma.f64(double %117, double %113, double 0x3F56C16C1852B7AF)
  %119 = tail call double @llvm.fma.f64(double %118, double %113, double 0x3F81111111122322)
  %120 = tail call double @llvm.fma.f64(double %119, double %113, double 0x3FA55555555502A1)
  %121 = tail call double @llvm.fma.f64(double %120, double %113, double 0x3FC5555555555511)
  %122 = tail call double @llvm.fma.f64(double %121, double %113, double 0x3FE000000000000B)
  %123 = tail call double @llvm.fma.f64(double %122, double %113, double 1.000000e+00)
  %124 = tail call double @llvm.fma.f64(double %123, double %113, double 1.000000e+00)
  %125 = tail call i32 @llvm.nvvm.d2i.lo(double %124) #11
  %126 = tail call i32 @llvm.nvvm.d2i.hi(double %124) #11
  %127 = shl i32 %110, 20
  %128 = add i32 %126, %127
  %129 = tail call double @llvm.nvvm.lohi.i2d(i32 %125, i32 %128) #11
  %130 = tail call i32 @llvm.nvvm.d2i.hi(double %param_11.139528) #11
  %131 = bitcast i32 %130 to float
  %132 = tail call float @llvm.nvvm.fabs.f(float %131) #11
  %133 = fcmp olt float %132, 0x4010C46560000000
  br i1 %133, label %__nv_exp.exit, label %__internal_fast_icmp_abs_lt.exit.i

__internal_fast_icmp_abs_lt.exit.i:               ; preds = %x_in_tile-true
  %134 = fcmp olt double %param_11.139528, 0.000000e+00
  %135 = fadd double %param_11.139528, 0x7FF0000000000000
  %z.0.i = select i1 %134, double 0.000000e+00, double %135
  %136 = fcmp olt float %132, 0x4010E90000000000
  br i1 %136, label %137, label %__nv_exp.exit

137:                                              ; preds = %__internal_fast_icmp_abs_lt.exit.i
  %138 = sdiv i32 %110, 2
  %139 = shl i32 %138, 20
  %140 = add i32 %126, %139
  %141 = tail call double @llvm.nvvm.lohi.i2d(i32 %125, i32 %140) #11
  %142 = sub nsw i32 %110, %138
  %143 = shl i32 %142, 20
  %144 = add nsw i32 %143, 1072693248
  %145 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %144) #11
  %146 = fmul double %145, %141
  br label %__nv_exp.exit

__nv_exp.exit:                                    ; preds = %x_in_tile-true, %__internal_fast_icmp_abs_lt.exit.i, %137
  %z.2.i = phi double [ %129, %x_in_tile-true ], [ %146, %137 ], [ %z.0.i, %__internal_fast_icmp_abs_lt.exit.i ]
  %multiply.11745.1.clone.1.clone.1 = fmul double %param_10.162437, %z.2.i
  %multiply.11746.3.clone.1.clone.1 = fmul double %add.9883.5.clone.1, 0x3FFC71C71C71C71C
  %add.9909.1.clone.1.clone.1 = fadd double %multiply.11746.3.clone.1.clone.1, %multiply.11745.1.clone.1.clone.1
  %147 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg13178, i64 0, i64 %102
  store double %add.9905.1, ptr addrspace(1) %147, align 8
  %148 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg14180, i64 0, i64 %102
  store double %add.9910.1.clone.1.clone.1, ptr addrspace(1) %148, align 8
  %149 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg16184, i64 0, i64 %102
  store double %add.9913.1.clone.1.clone.1, ptr addrspace(1) %149, align 8
  %150 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg18188, i64 0, i64 %102
  store double %add.9912.1.clone.1.clone.1, ptr addrspace(1) %150, align 8
  %151 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg20192, i64 0, i64 %102
  store double %add.9908.1.clone.1.clone.1, ptr addrspace(1) %151, align 8
  %152 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg22196, i64 0, i64 %102
  store double %add.9909.1.clone.1.clone.1, ptr addrspace(1) %152, align 8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i135, ptr addrspace(1) %arg12176, align 128
  br label %thread_in_bounds-after

reduction_write_output-true53:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i137, ptr addrspace(1) %arg15182, align 128
  br label %thread_in_bounds-after52

reduction_write_output-true64:                    ; preds = %thread_in_bounds-after52
  store double %add.9442.i139, ptr addrspace(1) %arg17186, align 128
  br label %thread_in_bounds-after63

reduction_write_output-true75:                    ; preds = %thread_in_bounds-after63
  store double %add.9442.i141, ptr addrspace(1) %arg19190, align 128
  br label %thread_in_bounds-after74

reduction_write_output-true86:                    ; preds = %thread_in_bounds-after74
  store double %add.9442.i143, ptr addrspace(1) %arg21194, align 128
  br label %thread_in_bounds-after85

reduction_write_output-true97:                    ; preds = %thread_in_bounds-after85
  store double %add.9442.i145, ptr addrspace(1) %arg23198, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_negate_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7) local_unnamed_addr #0 {
entry:
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !339
  %1 = load double, ptr addrspace(1) %arg613, align 128, !invariant.load !339
  %add.9885.1 = fadd double %0, %1
  %2 = load double, ptr addrspace(1) %arg49, align 128, !invariant.load !339
  %add.9888.1 = fadd double %add.9885.1, %2
  %3 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !339
  %add.9892.1 = fadd double %add.9888.1, %3
  %4 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %add.9895.1 = fadd double %add.9892.1, %4
  %5 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %add.9899.1 = fadd double %add.9895.1, %5
  %6 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %add.9903.1 = fadd double %add.9899.1, %6
  %7 = fneg double %add.9903.1
  store double %7, ptr addrspace(1) %arg715, align 128
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_20(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1) %arg3) local_unnamed_addr #3 {
entry:
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %thread.id.2 = and i32 %thread.id.x, 1
  %0 = icmp ult i32 %thread.id.x, 2
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true, %loop1.loop_exit
  ret void

loop1.loop_exit:                                  ; preds = %concatenate.83.3.merge, %entry
  %partial_reduction_result.0 = phi i8 [ %18, %concatenate.83.3.merge ], [ 1, %entry ]
  %1 = zext nneg i8 %partial_reduction_result.0 to i32
  %2 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %1, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %3 = trunc i32 %2 to i8
  %4 = and i8 %partial_reduction_result.0, %3
  br i1 %or.cond, label %reduction_write_output-true, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %.not11.not = icmp eq i32 %thread.id.2, 0
  br i1 %.not11.not, label %concatenate.pivot.0., label %concatenate.83.3.merge

concatenate.pivot.0.:                             ; preds = %x_in_tile-true
  %param_1.8183 = load i64, ptr addrspace(1) %arg120, align 16, !invariant.load !339
  %param_2.6815 = load i64, ptr addrspace(1) %arg222, align 128, !invariant.load !339
  %5 = add i64 %param_2.6815, %param_1.8183
  %6 = srem i64 %5, 10
  %7 = add nsw i64 %6, 10
  %.not1314 = icmp slt i64 %6, 0
  %8 = select i1 %.not1314, i64 %7, i64 %6
  %9 = icmp slt i64 %8, 0
  %10 = add nsw i64 %8, 10
  %11 = select i1 %9, i64 %10, i64 %8
  %12 = trunc nsw i64 %11 to i32
  br label %concatenate.83.3.merge

concatenate.83.3.merge:                           ; preds = %x_in_tile-true, %concatenate.pivot.0.
  %13 = phi i32 [ %12, %concatenate.pivot.0. ], [ 0, %x_in_tile-true ]
  %14 = icmp sgt i32 %13, -1
  %15 = zext nneg i32 %thread.id.2 to i64
  %param_0.5854 = getelementptr inbounds [2 x i32], ptr addrspace(1) %arg018, i64 0, i64 %15
  %param_0.58547 = load i32, ptr addrspace(1) %param_0.5854, align 4, !invariant.load !339
  %16 = icmp sge i32 %param_0.58547, %13
  %17 = and i1 %14, %16
  %18 = zext i1 %17 to i8
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store i8 %4, ptr addrspace(1) %arg324, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_217(ptr noalias nocapture align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg530 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg428 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg326 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg224 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg122 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg020 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !341
  %thread_id_x = zext nneg i32 %0 to i64
  %param_4.4712 = load i64, ptr addrspace(1) %arg428, align 16, !invariant.load !339
  %param_5.3776 = load i64, ptr addrspace(1) %arg530, align 128, !invariant.load !339
  %1 = add i64 %param_5.3776, %param_4.4712
  %2 = srem i64 %1, 10
  %.not17 = icmp slt i64 %2, 0
  %3 = add nsw i64 %2, 10
  %4 = select i1 %.not17, i64 %3, i64 %2
  %5 = icmp slt i64 %4, 0
  %6 = add nsw i64 %4, 10
  %7 = select i1 %5, i64 %6, i64 %4
  %8 = trunc nsw i64 %7 to i32
  %9 = tail call i32 @llvm.smin.i32(i32 %8, i32 9)
  %10 = sext i32 %9 to i64
  %.inv = icmp sgt i64 %7, 0
  %11 = select i1 %.inv, i64 %10, i64 0
  %param_1.8153 = load i8, ptr addrspace(1) %arg122, align 128, !invariant.load !339
  %12 = getelementptr double, ptr addrspace(1) %arg224, i64 %thread_id_x
  %param_2.67755 = load double, ptr addrspace(1) %12, align 8, !invariant.load !339
  %13 = getelementptr double, ptr addrspace(1) %arg326, i64 %thread_id_x
  %param_3.55216 = load double, ptr addrspace(1) %13, align 8, !invariant.load !339
  %subtract.882.2 = fsub double %param_2.67755, %param_3.55216
  %14 = tail call i64 @llvm.smax.i64(i64 %7, i64 0)
  %15 = tail call i64 @llvm.umin.i64(i64 %14, i64 9)
  %param_0.5445 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg020, i64 0, i64 %15, i64 %thread_id_x
  %param_0.544516 = load double, ptr addrspace(1) %param_0.5445, align 8
  %16 = trunc i8 %param_1.8153 to i1
  %17 = select i1 %16, double %subtract.882.2, double %param_0.544516
  %18 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg020, i64 0, i64 %11, i64 %thread_id_x
  store double %17, ptr addrspace(1) %18, align 8
  ret void
}

; Function Attrs: norecurse nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_19(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg9) local_unnamed_addr #8 {
entry:
  %arg9160 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8158 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7156 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6154 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5152 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4150 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3148 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2146 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1144 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0142 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %block.id.y = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !348
  %trunc = trunc nuw i32 %block.id.y to i1
  %thread.id.x36 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  br i1 %trunc, label %reduce-group-1-true, label %reduce-group-0-true

reduce-group-1-after.sink.split:                  ; preds = %thread_in_bounds-after80, %thread_in_bounds-after
  %.sink141 = phi i32 [ %31, %thread_in_bounds-after ], [ %74, %thread_in_bounds-after80 ]
  %.sink140 = phi i32 [ %33, %thread_in_bounds-after ], [ %76, %thread_in_bounds-after80 ]
  %add.9442.i128.sink = phi double [ %add.9442.i128, %thread_in_bounds-after ], [ %add.9442.i134, %thread_in_bounds-after80 ]
  %arg7.sink = phi ptr addrspace(1) [ %arg7156, %thread_in_bounds-after ], [ %arg9160, %thread_in_bounds-after80 ]
  %0 = insertelement <2 x i32> poison, i32 %.sink141, i64 0
  %1 = insertelement <2 x i32> %0, i32 %.sink140, i64 1
  %2 = bitcast <2 x i32> %1 to double
  %add.9442.i129 = fadd double %add.9442.i128.sink, %2
  store double %add.9442.i129, ptr addrspace(1) %arg7.sink, align 128
  br label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduce-group-1-after.sink.split, %thread_in_bounds-after, %thread_in_bounds-after80
  ret void

reduce-group-0-true:                              ; preds = %entry
  %3 = icmp ult i32 %thread.id.x36, 4
  br i1 %3, label %x_in_tile-true, label %loop1.loop_exit

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %reduce-group-0-true
  %partial_reduction_result2.0 = phi double [ %add.9442.i131, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %partial_reduction_result.0 = phi double [ %multiply.11934.1, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %4 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %5 = extractelement <2 x i32> %4, i64 0
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> poison, i32 %6, i64 0
  %8 = extractelement <2 x i32> %4, i64 1
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 2, i32 31)
  %10 = insertelement <2 x i32> %7, i32 %9, i64 1
  %11 = bitcast <2 x i32> %10 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %11
  %12 = bitcast double %add.9442.i to <2 x i32>
  %13 = extractelement <2 x i32> %12, i64 0
  %14 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 1, i32 31)
  %15 = extractelement <2 x i32> %12, i64 1
  %16 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x36, 0
  %17 = insertelement <2 x i32> poison, i32 %14, i64 0
  %18 = insertelement <2 x i32> %17, i32 %16, i64 1
  %19 = bitcast <2 x i32> %18 to double
  %add.9442.i127 = fadd double %add.9442.i, %19
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %20 = icmp eq i32 %thread.id.x36, 0
  %21 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %22 = extractelement <2 x i32> %21, i64 0
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> poison, i32 %23, i64 0
  %25 = extractelement <2 x i32> %21, i64 1
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 2, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 1
  %28 = bitcast <2 x i32> %27 to double
  %add.9442.i128 = fadd double %partial_reduction_result2.0, %28
  %29 = bitcast double %add.9442.i128 to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 1, i32 31)
  %32 = extractelement <2 x i32> %29, i64 1
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 1, i32 31)
  br i1 %20, label %reduce-group-1-after.sink.split, label %reduce-group-1-after

x_in_tile-true:                                   ; preds = %reduce-group-0-true
  %param_1.8143 = load i64, ptr addrspace(1) %arg1144, align 16, !invariant.load !339
  %param_2.6763 = load i64, ptr addrspace(1) %arg2146, align 128, !invariant.load !339
  %34 = add i64 %param_2.6763, %param_1.8143
  %35 = srem i64 %34, 10
  %36 = add nsw i64 %35, 10
  %.not113114 = icmp slt i64 %35, 0
  %37 = select i1 %.not113114, i64 %36, i64 %35
  %38 = icmp slt i64 %37, 0
  %39 = add nsw i64 %37, 10
  %40 = select i1 %38, i64 %39, i64 %37
  %41 = trunc nsw i64 %40 to i32
  %42 = tail call i32 @llvm.smin.i32(i32 %41, i32 9)
  %43 = sext i32 %42 to i64
  %.inv138 = icmp sgt i64 %40, 0
  %44 = select i1 %.inv138, i64 %43, i64 0
  %45 = zext nneg i32 %thread.id.x36 to i64
  %param_0.5813 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg0142, i64 0, i64 %44, i64 %45
  %param_0.581310 = load double, ptr addrspace(1) %param_0.5813, align 8, !invariant.load !339
  %multiply.11934.1 = fmul double %param_0.581310, %param_0.581310
  %param_3.5721 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg3148, i64 0, i64 %44, i64 %45
  %param_3.572112 = load double, ptr addrspace(1) %param_3.5721, align 8, !invariant.load !339
  %multiply.11940.1.clone.1 = fmul double %param_0.581310, %param_3.572112
  %add.9442.i131 = fadd double %multiply.11940.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i127, ptr addrspace(1) %arg6154, align 128
  br label %thread_in_bounds-after

reduce-group-1-true:                              ; preds = %entry
  %46 = icmp ult i32 %thread.id.x36, 4
  br i1 %46, label %x_in_tile-true57, label %loop1.loop_exit45

loop1.loop_exit45:                                ; preds = %x_in_tile-true57, %reduce-group-1-true
  %partial_reduction_result31.0 = phi double [ %add.9442.i136, %x_in_tile-true57 ], [ 0.000000e+00, %reduce-group-1-true ]
  %partial_reduction_result34.0 = phi double [ %multiply.11935.1.clone.1, %x_in_tile-true57 ], [ 0.000000e+00, %reduce-group-1-true ]
  %47 = bitcast double %partial_reduction_result31.0 to <2 x i32>
  %48 = extractelement <2 x i32> %47, i64 0
  %49 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 2, i32 31)
  %50 = insertelement <2 x i32> poison, i32 %49, i64 0
  %51 = extractelement <2 x i32> %47, i64 1
  %52 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %51, i32 2, i32 31)
  %53 = insertelement <2 x i32> %50, i32 %52, i64 1
  %54 = bitcast <2 x i32> %53 to double
  %add.9442.i132 = fadd double %partial_reduction_result31.0, %54
  %55 = bitcast double %add.9442.i132 to <2 x i32>
  %56 = extractelement <2 x i32> %55, i64 0
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 1, i32 31)
  %58 = extractelement <2 x i32> %55, i64 1
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 1, i32 31)
  %or.cond99 = icmp eq i32 %thread.id.x36, 0
  %60 = insertelement <2 x i32> poison, i32 %57, i64 0
  %61 = insertelement <2 x i32> %60, i32 %59, i64 1
  %62 = bitcast <2 x i32> %61 to double
  %add.9442.i133 = fadd double %add.9442.i132, %62
  br i1 %or.cond99, label %reduction_write_output-true81, label %thread_in_bounds-after80

thread_in_bounds-after80:                         ; preds = %reduction_write_output-true81, %loop1.loop_exit45
  %63 = icmp eq i32 %thread.id.x36, 0
  %64 = bitcast double %partial_reduction_result34.0 to <2 x i32>
  %65 = extractelement <2 x i32> %64, i64 0
  %66 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %65, i32 2, i32 31)
  %67 = insertelement <2 x i32> poison, i32 %66, i64 0
  %68 = extractelement <2 x i32> %64, i64 1
  %69 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %68, i32 2, i32 31)
  %70 = insertelement <2 x i32> %67, i32 %69, i64 1
  %71 = bitcast <2 x i32> %70 to double
  %add.9442.i134 = fadd double %partial_reduction_result34.0, %71
  %72 = bitcast double %add.9442.i134 to <2 x i32>
  %73 = extractelement <2 x i32> %72, i64 0
  %74 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %73, i32 1, i32 31)
  %75 = extractelement <2 x i32> %72, i64 1
  %76 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %75, i32 1, i32 31)
  br i1 %63, label %reduce-group-1-after.sink.split, label %reduce-group-1-after

x_in_tile-true57:                                 ; preds = %reduce-group-1-true
  %param_1.814359 = load i64, ptr addrspace(1) %arg1144, align 16, !invariant.load !339
  %param_2.676360 = load i64, ptr addrspace(1) %arg2146, align 128, !invariant.load !339
  %77 = add i64 %param_2.676360, %param_1.814359
  %78 = srem i64 %77, 10
  %79 = add nsw i64 %78, 10
  %.not104105 = icmp slt i64 %78, 0
  %80 = select i1 %.not104105, i64 %79, i64 %78
  %81 = icmp slt i64 %80, 0
  %82 = add nsw i64 %80, 10
  %83 = select i1 %81, i64 %82, i64 %80
  %84 = trunc nsw i64 %83 to i32
  %85 = tail call i32 @llvm.smin.i32(i32 %84, i32 9)
  %86 = sext i32 %85 to i64
  %.inv = icmp sgt i64 %83, 0
  %87 = select i1 %.inv, i64 %86, i64 0
  %88 = zext nneg i32 %thread.id.x36 to i64
  %param_5.4159 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg5152, i64 0, i64 %87, i64 %88
  %param_5.415968 = load double, ptr addrspace(1) %param_5.4159, align 8, !invariant.load !339
  %param_4.5113 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg4150, i64 0, i64 %87, i64 %88
  %param_4.511370 = load double, ptr addrspace(1) %param_4.5113, align 8, !invariant.load !339
  %multiply.11941.1.clone.1.clone.1 = fmul double %param_5.415968, %param_4.511370
  %add.9442.i136 = fadd double %multiply.11941.1.clone.1.clone.1, 0.000000e+00
  %multiply.11935.1.clone.1 = fmul double %param_5.415968, %param_5.415968
  br label %loop1.loop_exit45

reduction_write_output-true81:                    ; preds = %loop1.loop_exit45
  store double %add.9442.i133, ptr addrspace(1) %arg8158, align 128
  br label %thread_in_bounds-after80
}

; Function Attrs: norecurse nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_18(ptr noalias nocapture readonly align 128 dereferenceable(320) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(320) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg17) local_unnamed_addr #8 {
entry:
  %arg17357 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16355 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15353 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14351 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13349 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12347 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11345 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10343 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9341 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8339 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7337 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6335 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5333 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4331 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3329 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2327 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1325 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0323 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %block.id.y = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !341
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  switch i32 %block.id.y, label %default.unreachable319 [
    i32 0, label %reduce-group-0-true
    i32 1, label %reduce-group-1-true
    i32 2, label %reduce-group-2-true
    i32 3, label %reduce-group-3-true
  ]

default.unreachable319:                           ; preds = %entry
  call void asm sideeffect "exit;", ""()
  unreachable

reduce-group-3-after.sink.split:                  ; preds = %thread_in_bounds-after210, %thread_in_bounds-after145, %thread_in_bounds-after80, %thread_in_bounds-after
  %.sink322 = phi i32 [ %31, %thread_in_bounds-after ], [ %74, %thread_in_bounds-after80 ], [ %117, %thread_in_bounds-after145 ], [ %160, %thread_in_bounds-after210 ]
  %.sink321 = phi i32 [ %33, %thread_in_bounds-after ], [ %76, %thread_in_bounds-after80 ], [ %119, %thread_in_bounds-after145 ], [ %162, %thread_in_bounds-after210 ]
  %add.9442.i306.sink = phi double [ %add.9442.i294, %thread_in_bounds-after ], [ %add.9442.i300, %thread_in_bounds-after80 ], [ %add.9442.i306, %thread_in_bounds-after145 ], [ %add.9442.i312, %thread_in_bounds-after210 ]
  %arg15.sink = phi ptr addrspace(1) [ %arg11345, %thread_in_bounds-after ], [ %arg13349, %thread_in_bounds-after80 ], [ %arg15353, %thread_in_bounds-after145 ], [ %arg17357, %thread_in_bounds-after210 ]
  %0 = insertelement <2 x i32> poison, i32 %.sink322, i64 0
  %1 = insertelement <2 x i32> %0, i32 %.sink321, i64 1
  %2 = bitcast <2 x i32> %1 to double
  %add.9442.i307 = fadd double %add.9442.i306.sink, %2
  store double %add.9442.i307, ptr addrspace(1) %arg15.sink, align 128
  br label %reduce-group-3-after

reduce-group-3-after:                             ; preds = %reduce-group-3-after.sink.split, %thread_in_bounds-after145, %thread_in_bounds-after80, %thread_in_bounds-after, %thread_in_bounds-after210
  ret void

reduce-group-0-true:                              ; preds = %entry
  %3 = icmp ult i32 %thread.id.x, 4
  br i1 %3, label %x_in_tile-true, label %loop1.loop_exit

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %reduce-group-0-true
  %partial_reduction_result2.0 = phi double [ %add.9442.i297, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %partial_reduction_result.0 = phi double [ %multiply.11939.1, %x_in_tile-true ], [ 0.000000e+00, %reduce-group-0-true ]
  %4 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %5 = extractelement <2 x i32> %4, i64 0
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> poison, i32 %6, i64 0
  %8 = extractelement <2 x i32> %4, i64 1
  %9 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %8, i32 2, i32 31)
  %10 = insertelement <2 x i32> %7, i32 %9, i64 1
  %11 = bitcast <2 x i32> %10 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %11
  %12 = bitcast double %add.9442.i to <2 x i32>
  %13 = extractelement <2 x i32> %12, i64 0
  %14 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %13, i32 1, i32 31)
  %15 = extractelement <2 x i32> %12, i64 1
  %16 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %15, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %17 = insertelement <2 x i32> poison, i32 %14, i64 0
  %18 = insertelement <2 x i32> %17, i32 %16, i64 1
  %19 = bitcast <2 x i32> %18 to double
  %add.9442.i293 = fadd double %add.9442.i, %19
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %20 = icmp eq i32 %thread.id.x, 0
  %21 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %22 = extractelement <2 x i32> %21, i64 0
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> poison, i32 %23, i64 0
  %25 = extractelement <2 x i32> %21, i64 1
  %26 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %25, i32 2, i32 31)
  %27 = insertelement <2 x i32> %24, i32 %26, i64 1
  %28 = bitcast <2 x i32> %27 to double
  %add.9442.i294 = fadd double %partial_reduction_result2.0, %28
  %29 = bitcast double %add.9442.i294 to <2 x i32>
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %30, i32 1, i32 31)
  %32 = extractelement <2 x i32> %29, i64 1
  %33 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %32, i32 1, i32 31)
  br i1 %20, label %reduce-group-3-after.sink.split, label %reduce-group-3-after

x_in_tile-true:                                   ; preds = %reduce-group-0-true
  %param_1.8148 = load i64, ptr addrspace(1) %arg1325, align 16, !invariant.load !339
  %param_2.6768 = load i64, ptr addrspace(1) %arg2327, align 128, !invariant.load !339
  %34 = add i64 %param_2.6768, %param_1.8148
  %35 = srem i64 %34, 10
  %36 = add nsw i64 %35, 10
  %.not271272 = icmp slt i64 %35, 0
  %37 = select i1 %.not271272, i64 %36, i64 %35
  %38 = icmp slt i64 %37, 0
  %39 = add nsw i64 %37, 10
  %40 = select i1 %38, i64 %39, i64 %37
  %41 = trunc nsw i64 %40 to i32
  %42 = tail call i32 @llvm.smin.i32(i32 %41, i32 9)
  %43 = sext i32 %42 to i64
  %.inv318 = icmp sgt i64 %40, 0
  %44 = select i1 %.inv318, i64 %43, i64 0
  %45 = zext nneg i32 %thread.id.x to i64
  %param_0.5805 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg0323, i64 0, i64 %44, i64 %45
  %param_0.580510 = load double, ptr addrspace(1) %param_0.5805, align 8, !invariant.load !339
  %multiply.11939.1 = fmul double %param_0.580510, %param_0.580510
  %param_3.5701 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg3329, i64 0, i64 %44, i64 %45
  %param_3.570112 = load double, ptr addrspace(1) %param_3.5701, align 8, !invariant.load !339
  %multiply.11945.1.clone.1 = fmul double %param_0.580510, %param_3.570112
  %add.9442.i297 = fadd double %multiply.11945.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i293, ptr addrspace(1) %arg10343, align 128
  br label %thread_in_bounds-after

reduce-group-1-true:                              ; preds = %entry
  %46 = icmp ult i32 %thread.id.x, 4
  br i1 %46, label %x_in_tile-true57, label %loop1.loop_exit45

loop1.loop_exit45:                                ; preds = %x_in_tile-true57, %reduce-group-1-true
  %partial_reduction_result31.0 = phi double [ %add.9442.i302, %x_in_tile-true57 ], [ 0.000000e+00, %reduce-group-1-true ]
  %partial_reduction_result34.0 = phi double [ %multiply.11938.1.clone.1, %x_in_tile-true57 ], [ 0.000000e+00, %reduce-group-1-true ]
  %47 = bitcast double %partial_reduction_result31.0 to <2 x i32>
  %48 = extractelement <2 x i32> %47, i64 0
  %49 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %48, i32 2, i32 31)
  %50 = insertelement <2 x i32> poison, i32 %49, i64 0
  %51 = extractelement <2 x i32> %47, i64 1
  %52 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %51, i32 2, i32 31)
  %53 = insertelement <2 x i32> %50, i32 %52, i64 1
  %54 = bitcast <2 x i32> %53 to double
  %add.9442.i298 = fadd double %partial_reduction_result31.0, %54
  %55 = bitcast double %add.9442.i298 to <2 x i32>
  %56 = extractelement <2 x i32> %55, i64 0
  %57 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %56, i32 1, i32 31)
  %58 = extractelement <2 x i32> %55, i64 1
  %59 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %58, i32 1, i32 31)
  %or.cond229 = icmp eq i32 %thread.id.x, 0
  %60 = insertelement <2 x i32> poison, i32 %57, i64 0
  %61 = insertelement <2 x i32> %60, i32 %59, i64 1
  %62 = bitcast <2 x i32> %61 to double
  %add.9442.i299 = fadd double %add.9442.i298, %62
  br i1 %or.cond229, label %reduction_write_output-true81, label %thread_in_bounds-after80

thread_in_bounds-after80:                         ; preds = %reduction_write_output-true81, %loop1.loop_exit45
  %63 = icmp eq i32 %thread.id.x, 0
  %64 = bitcast double %partial_reduction_result34.0 to <2 x i32>
  %65 = extractelement <2 x i32> %64, i64 0
  %66 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %65, i32 2, i32 31)
  %67 = insertelement <2 x i32> poison, i32 %66, i64 0
  %68 = extractelement <2 x i32> %64, i64 1
  %69 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %68, i32 2, i32 31)
  %70 = insertelement <2 x i32> %67, i32 %69, i64 1
  %71 = bitcast <2 x i32> %70 to double
  %add.9442.i300 = fadd double %partial_reduction_result34.0, %71
  %72 = bitcast double %add.9442.i300 to <2 x i32>
  %73 = extractelement <2 x i32> %72, i64 0
  %74 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %73, i32 1, i32 31)
  %75 = extractelement <2 x i32> %72, i64 1
  %76 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %75, i32 1, i32 31)
  br i1 %63, label %reduce-group-3-after.sink.split, label %reduce-group-3-after

x_in_tile-true57:                                 ; preds = %reduce-group-1-true
  %param_1.814859 = load i64, ptr addrspace(1) %arg1325, align 16, !invariant.load !339
  %param_2.676860 = load i64, ptr addrspace(1) %arg2327, align 128, !invariant.load !339
  %77 = add i64 %param_2.676860, %param_1.814859
  %78 = srem i64 %77, 10
  %79 = add nsw i64 %78, 10
  %.not244245 = icmp slt i64 %78, 0
  %80 = select i1 %.not244245, i64 %79, i64 %78
  %81 = icmp slt i64 %80, 0
  %82 = add nsw i64 %80, 10
  %83 = select i1 %81, i64 %82, i64 %80
  %84 = trunc nsw i64 %83 to i32
  %85 = tail call i32 @llvm.smin.i32(i32 %84, i32 9)
  %86 = sext i32 %85 to i64
  %.inv317 = icmp sgt i64 %83, 0
  %87 = select i1 %.inv317, i64 %86, i64 0
  %88 = zext nneg i32 %thread.id.x to i64
  %param_5.4152 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg5333, i64 0, i64 %87, i64 %88
  %param_5.415268 = load double, ptr addrspace(1) %param_5.4152, align 8, !invariant.load !339
  %param_4.5109 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg4331, i64 0, i64 %87, i64 %88
  %param_4.510970 = load double, ptr addrspace(1) %param_4.5109, align 8, !invariant.load !339
  %multiply.11944.1.clone.1.clone.1 = fmul double %param_5.415268, %param_4.510970
  %add.9442.i302 = fadd double %multiply.11944.1.clone.1.clone.1, 0.000000e+00
  %multiply.11938.1.clone.1 = fmul double %param_5.415268, %param_5.415268
  br label %loop1.loop_exit45

reduction_write_output-true81:                    ; preds = %loop1.loop_exit45
  store double %add.9442.i299, ptr addrspace(1) %arg12347, align 128
  br label %thread_in_bounds-after80

reduce-group-2-true:                              ; preds = %entry
  %89 = icmp ult i32 %thread.id.x, 4
  br i1 %89, label %x_in_tile-true122, label %loop1.loop_exit110

loop1.loop_exit110:                               ; preds = %x_in_tile-true122, %reduce-group-2-true
  %partial_reduction_result96.0 = phi double [ %add.9442.i308, %x_in_tile-true122 ], [ 0.000000e+00, %reduce-group-2-true ]
  %partial_reduction_result99.0 = phi double [ %multiply.11937.1.clone.1, %x_in_tile-true122 ], [ 0.000000e+00, %reduce-group-2-true ]
  %90 = bitcast double %partial_reduction_result96.0 to <2 x i32>
  %91 = extractelement <2 x i32> %90, i64 0
  %92 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %91, i32 2, i32 31)
  %93 = insertelement <2 x i32> poison, i32 %92, i64 0
  %94 = extractelement <2 x i32> %90, i64 1
  %95 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %94, i32 2, i32 31)
  %96 = insertelement <2 x i32> %93, i32 %95, i64 1
  %97 = bitcast <2 x i32> %96 to double
  %add.9442.i304 = fadd double %partial_reduction_result96.0, %97
  %98 = bitcast double %add.9442.i304 to <2 x i32>
  %99 = extractelement <2 x i32> %98, i64 0
  %100 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %99, i32 1, i32 31)
  %101 = extractelement <2 x i32> %98, i64 1
  %102 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %101, i32 1, i32 31)
  %or.cond233 = icmp eq i32 %thread.id.x, 0
  %103 = insertelement <2 x i32> poison, i32 %100, i64 0
  %104 = insertelement <2 x i32> %103, i32 %102, i64 1
  %105 = bitcast <2 x i32> %104 to double
  %add.9442.i305 = fadd double %add.9442.i304, %105
  br i1 %or.cond233, label %reduction_write_output-true146, label %thread_in_bounds-after145

thread_in_bounds-after145:                        ; preds = %reduction_write_output-true146, %loop1.loop_exit110
  %106 = icmp eq i32 %thread.id.x, 0
  %107 = bitcast double %partial_reduction_result99.0 to <2 x i32>
  %108 = extractelement <2 x i32> %107, i64 0
  %109 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %108, i32 2, i32 31)
  %110 = insertelement <2 x i32> poison, i32 %109, i64 0
  %111 = extractelement <2 x i32> %107, i64 1
  %112 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %111, i32 2, i32 31)
  %113 = insertelement <2 x i32> %110, i32 %112, i64 1
  %114 = bitcast <2 x i32> %113 to double
  %add.9442.i306 = fadd double %partial_reduction_result99.0, %114
  %115 = bitcast double %add.9442.i306 to <2 x i32>
  %116 = extractelement <2 x i32> %115, i64 0
  %117 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %116, i32 1, i32 31)
  %118 = extractelement <2 x i32> %115, i64 1
  %119 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %118, i32 1, i32 31)
  br i1 %106, label %reduce-group-3-after.sink.split, label %reduce-group-3-after

x_in_tile-true122:                                ; preds = %reduce-group-2-true
  %param_1.8148124 = load i64, ptr addrspace(1) %arg1325, align 16, !invariant.load !339
  %param_2.6768125 = load i64, ptr addrspace(1) %arg2327, align 128, !invariant.load !339
  %120 = add i64 %param_2.6768125, %param_1.8148124
  %121 = srem i64 %120, 10
  %122 = add nsw i64 %121, 10
  %.not253254 = icmp slt i64 %121, 0
  %123 = select i1 %.not253254, i64 %122, i64 %121
  %124 = icmp slt i64 %123, 0
  %125 = add nsw i64 %123, 10
  %126 = select i1 %124, i64 %125, i64 %123
  %127 = trunc nsw i64 %126 to i32
  %128 = tail call i32 @llvm.smin.i32(i32 %127, i32 9)
  %129 = sext i32 %128 to i64
  %.inv316 = icmp sgt i64 %126, 0
  %130 = select i1 %.inv316, i64 %129, i64 0
  %131 = zext nneg i32 %thread.id.x to i64
  %param_7.2768 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg7337, i64 0, i64 %130, i64 %131
  %param_7.2768133 = load double, ptr addrspace(1) %param_7.2768, align 8, !invariant.load !339
  %param_6.3487 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg6335, i64 0, i64 %130, i64 %131
  %param_6.3487135 = load double, ptr addrspace(1) %param_6.3487, align 8, !invariant.load !339
  %multiply.11943.1.clone.1.clone.1 = fmul double %param_7.2768133, %param_6.3487135
  %add.9442.i308 = fadd double %multiply.11943.1.clone.1.clone.1, 0.000000e+00
  %multiply.11937.1.clone.1 = fmul double %param_7.2768133, %param_7.2768133
  br label %loop1.loop_exit110

reduction_write_output-true146:                   ; preds = %loop1.loop_exit110
  store double %add.9442.i305, ptr addrspace(1) %arg14351, align 128
  br label %thread_in_bounds-after145

reduce-group-3-true:                              ; preds = %entry
  %132 = icmp ult i32 %thread.id.x, 4
  br i1 %132, label %x_in_tile-true187, label %loop1.loop_exit175

loop1.loop_exit175:                               ; preds = %x_in_tile-true187, %reduce-group-3-true
  %partial_reduction_result161.0 = phi double [ %add.9442.i314, %x_in_tile-true187 ], [ 0.000000e+00, %reduce-group-3-true ]
  %partial_reduction_result164.0 = phi double [ %multiply.11936.1.clone.1, %x_in_tile-true187 ], [ 0.000000e+00, %reduce-group-3-true ]
  %133 = bitcast double %partial_reduction_result161.0 to <2 x i32>
  %134 = extractelement <2 x i32> %133, i64 0
  %135 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %134, i32 2, i32 31)
  %136 = insertelement <2 x i32> poison, i32 %135, i64 0
  %137 = extractelement <2 x i32> %133, i64 1
  %138 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %137, i32 2, i32 31)
  %139 = insertelement <2 x i32> %136, i32 %138, i64 1
  %140 = bitcast <2 x i32> %139 to double
  %add.9442.i310 = fadd double %partial_reduction_result161.0, %140
  %141 = bitcast double %add.9442.i310 to <2 x i32>
  %142 = extractelement <2 x i32> %141, i64 0
  %143 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %142, i32 1, i32 31)
  %144 = extractelement <2 x i32> %141, i64 1
  %145 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %144, i32 1, i32 31)
  %or.cond237 = icmp eq i32 %thread.id.x, 0
  %146 = insertelement <2 x i32> poison, i32 %143, i64 0
  %147 = insertelement <2 x i32> %146, i32 %145, i64 1
  %148 = bitcast <2 x i32> %147 to double
  %add.9442.i311 = fadd double %add.9442.i310, %148
  br i1 %or.cond237, label %reduction_write_output-true211, label %thread_in_bounds-after210

thread_in_bounds-after210:                        ; preds = %reduction_write_output-true211, %loop1.loop_exit175
  %149 = icmp eq i32 %thread.id.x, 0
  %150 = bitcast double %partial_reduction_result164.0 to <2 x i32>
  %151 = extractelement <2 x i32> %150, i64 0
  %152 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %151, i32 2, i32 31)
  %153 = insertelement <2 x i32> poison, i32 %152, i64 0
  %154 = extractelement <2 x i32> %150, i64 1
  %155 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %154, i32 2, i32 31)
  %156 = insertelement <2 x i32> %153, i32 %155, i64 1
  %157 = bitcast <2 x i32> %156 to double
  %add.9442.i312 = fadd double %partial_reduction_result164.0, %157
  %158 = bitcast double %add.9442.i312 to <2 x i32>
  %159 = extractelement <2 x i32> %158, i64 0
  %160 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %159, i32 1, i32 31)
  %161 = extractelement <2 x i32> %158, i64 1
  %162 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %161, i32 1, i32 31)
  br i1 %149, label %reduce-group-3-after.sink.split, label %reduce-group-3-after

x_in_tile-true187:                                ; preds = %reduce-group-3-true
  %param_1.8148189 = load i64, ptr addrspace(1) %arg1325, align 16, !invariant.load !339
  %param_2.6768190 = load i64, ptr addrspace(1) %arg2327, align 128, !invariant.load !339
  %163 = add i64 %param_2.6768190, %param_1.8148189
  %164 = srem i64 %163, 10
  %165 = add nsw i64 %164, 10
  %.not262263 = icmp slt i64 %164, 0
  %166 = select i1 %.not262263, i64 %165, i64 %164
  %167 = icmp slt i64 %166, 0
  %168 = add nsw i64 %166, 10
  %169 = select i1 %167, i64 %168, i64 %166
  %170 = trunc nsw i64 %169 to i32
  %171 = tail call i32 @llvm.smin.i32(i32 %170, i32 9)
  %172 = sext i32 %171 to i64
  %.inv = icmp sgt i64 %169, 0
  %173 = select i1 %.inv, i64 %172, i64 0
  %174 = zext nneg i32 %thread.id.x to i64
  %param_9.1897 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg9341, i64 0, i64 %173, i64 %174
  %param_9.1897198 = load double, ptr addrspace(1) %param_9.1897, align 8, !invariant.load !339
  %param_8.2245 = getelementptr inbounds [10 x [4 x double]], ptr addrspace(1) %arg8339, i64 0, i64 %173, i64 %174
  %param_8.2245200 = load double, ptr addrspace(1) %param_8.2245, align 8, !invariant.load !339
  %multiply.11942.1.clone.1.clone.1 = fmul double %param_9.1897198, %param_8.2245200
  %add.9442.i314 = fadd double %multiply.11942.1.clone.1.clone.1, 0.000000e+00
  %multiply.11936.1.clone.1 = fmul double %param_9.1897198, %param_9.1897198
  br label %loop1.loop_exit175

reduction_write_output-true211:                   ; preds = %loop1.loop_exit175
  store double %add.9442.i311, ptr addrspace(1) %arg16355, align 128
  br label %thread_in_bounds-after210
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_select_fusion_31(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture align 128 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg10, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg11) local_unnamed_addr #0 {
entry:
  %arg1123 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1021 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg919 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg1021, align 128, !invariant.load !339
  %1 = load double, ptr addrspace(1) %arg1123, align 128, !invariant.load !339
  %add.10073.3 = fadd double %0, %1
  %2 = load double, ptr addrspace(1) %arg919, align 128, !invariant.load !339
  %add.10074.3 = fadd double %add.10073.3, %2
  %3 = load double, ptr addrspace(1) %arg817, align 128, !invariant.load !339
  %add.10075.3 = fadd double %add.10074.3, %3
  %4 = load double, ptr addrspace(1) %arg715, align 128
  %add.10076.3 = fadd double %add.10075.3, %4
  %5 = load double, ptr addrspace(1) %arg613, align 128, !invariant.load !339
  %add.10077.1 = fadd double %add.10076.3, %5
  %compare.2762.1 = fcmp ogt double %add.10077.1, 0.000000e+00
  %6 = load double, ptr addrspace(1) %arg49, align 128, !invariant.load !339
  %7 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !339
  %add.10078.1 = fadd double %6, %7
  %8 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !339
  %add.10079.1 = fadd double %add.10078.1, %8
  %9 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %add.10080.1 = fadd double %add.10079.1, %9
  %10 = load double, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %add.10081.1 = fadd double %add.10080.1, %10
  %11 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %add.10082.1 = fadd double %add.10081.1, %11
  %divide.2568.1 = fdiv double %add.10082.1, %add.10077.1
  %12 = select i1 %compare.2762.1, double %divide.2568.1, double 1.000000e+00
  store double %12, ptr addrspace(1) %arg715, align 128
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @input_reduce_fusion_25(ptr noalias nocapture readonly align 128 dereferenceable(32) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(32) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #3 {
entry:
  %arg556 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg454 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg352 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg250 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %thread.id.x = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !342
  %0 = icmp ult i32 %thread.id.x, 4
  br i1 %0, label %x_in_tile-true, label %loop1.loop_exit

reduce-group-0-after:                             ; preds = %reduction_write_output-true27, %thread_in_bounds-after
  ret void

loop1.loop_exit:                                  ; preds = %x_in_tile-true, %entry
  %partial_reduction_result.0 = phi double [ %multiply.11923.1, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %partial_reduction_result2.0 = phi double [ %add.9442.i45, %x_in_tile-true ], [ 0.000000e+00, %entry ]
  %1 = bitcast double %partial_reduction_result.0 to <2 x i32>
  %2 = extractelement <2 x i32> %1, i64 0
  %3 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %2, i32 2, i32 31)
  %4 = insertelement <2 x i32> poison, i32 %3, i64 0
  %5 = extractelement <2 x i32> %1, i64 1
  %6 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %5, i32 2, i32 31)
  %7 = insertelement <2 x i32> %4, i32 %6, i64 1
  %8 = bitcast <2 x i32> %7 to double
  %add.9442.i = fadd double %partial_reduction_result.0, %8
  %9 = bitcast double %add.9442.i to <2 x i32>
  %10 = extractelement <2 x i32> %9, i64 0
  %11 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %10, i32 1, i32 31)
  %12 = extractelement <2 x i32> %9, i64 1
  %13 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %12, i32 1, i32 31)
  %or.cond = icmp eq i32 %thread.id.x, 0
  %14 = insertelement <2 x i32> poison, i32 %11, i64 0
  %15 = insertelement <2 x i32> %14, i32 %13, i64 1
  %16 = bitcast <2 x i32> %15 to double
  %add.9442.i41 = fadd double %add.9442.i, %16
  br i1 %or.cond, label %reduction_write_output-true, label %thread_in_bounds-after

thread_in_bounds-after:                           ; preds = %reduction_write_output-true, %loop1.loop_exit
  %17 = icmp eq i32 %thread.id.x, 0
  %18 = bitcast double %partial_reduction_result2.0 to <2 x i32>
  %19 = extractelement <2 x i32> %18, i64 0
  %20 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %19, i32 2, i32 31)
  %21 = insertelement <2 x i32> poison, i32 %20, i64 0
  %22 = extractelement <2 x i32> %18, i64 1
  %23 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %22, i32 2, i32 31)
  %24 = insertelement <2 x i32> %21, i32 %23, i64 1
  %25 = bitcast <2 x i32> %24 to double
  %add.9442.i42 = fadd double %partial_reduction_result2.0, %25
  %26 = bitcast double %add.9442.i42 to <2 x i32>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %27, i32 1, i32 31)
  %29 = extractelement <2 x i32> %26, i64 1
  %30 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %29, i32 1, i32 31)
  %31 = insertelement <2 x i32> poison, i32 %28, i64 0
  %32 = insertelement <2 x i32> %31, i32 %30, i64 1
  %33 = bitcast <2 x i32> %32 to double
  %add.9442.i43 = fadd double %add.9442.i42, %33
  br i1 %17, label %reduction_write_output-true27, label %reduce-group-0-after

x_in_tile-true:                                   ; preds = %entry
  %34 = zext nneg i32 %thread.id.x to i64
  %param_0.5821 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg046, i64 0, i64 %34
  %param_0.58215 = load double, ptr addrspace(1) %param_0.5821, align 8, !invariant.load !339
  %multiply.11923.1 = fmul double %param_0.58215, %param_0.58215
  %param_2.6892 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg250, i64 0, i64 %34
  %param_2.68928 = load double, ptr addrspace(1) %param_2.6892, align 8, !invariant.load !339
  %param_3.5726 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg352, i64 0, i64 %34
  %param_3.57269 = load double, ptr addrspace(1) %param_3.5726, align 8, !invariant.load !339
  %subtract.883.1.clone.1 = fsub double %param_2.68928, %param_3.57269
  %param_1.8238 = getelementptr inbounds [4 x double], ptr addrspace(1) %arg148, i64 0, i64 %34
  %param_1.823812 = load double, ptr addrspace(1) %param_1.8238, align 8, !invariant.load !339
  %subtract.889.1.clone.1 = fsub double %param_0.58215, %param_1.823812
  %multiply.11929.1.clone.1 = fmul double %subtract.883.1.clone.1, %subtract.889.1.clone.1
  %add.9442.i45 = fadd double %multiply.11929.1.clone.1, 0.000000e+00
  br label %loop1.loop_exit

reduction_write_output-true:                      ; preds = %loop1.loop_exit
  store double %add.9442.i41, ptr addrspace(1) %arg454, align 128
  br label %thread_in_bounds-after

reduction_write_output-true27:                    ; preds = %thread_in_bounds-after
  store double %add.9442.i43, ptr addrspace(1) %arg556, align 128
  br label %reduce-group-0-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_dynamic_update_slice_fusion_229(ptr noalias nocapture align 128 dereferenceable(80) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg8) local_unnamed_addr #0 {
entry:
  %arg836 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg734 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg632 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg530 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg428 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg326 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg224 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg122 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg020 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %param_7.2454 = load i64, ptr addrspace(1) %arg734, align 16, !invariant.load !339
  %param_8.1962 = load i64, ptr addrspace(1) %arg836, align 128, !invariant.load !339
  %0 = add i64 %param_8.1962, %param_7.2454
  %1 = srem i64 %0, 10
  %.not17 = icmp slt i64 %1, 0
  %2 = add nsw i64 %1, 10
  %3 = select i1 %.not17, i64 %2, i64 %1
  %4 = icmp slt i64 %3, 0
  %5 = add nsw i64 %3, 10
  %6 = select i1 %4, i64 %5, i64 %3
  %7 = trunc nsw i64 %6 to i32
  %8 = tail call i32 @llvm.smin.i32(i32 %7, i32 9)
  %9 = sext i32 %8 to i64
  %.inv = icmp sgt i64 %6, 0
  %10 = select i1 %.inv, i64 %9, i64 0
  %11 = icmp ult i64 %6, 10
  %param_5.3805 = load double, ptr addrspace(1) %arg530, align 128, !invariant.load !339
  %param_6.3154 = load double, ptr addrspace(1) %arg632, align 128, !invariant.load !339
  %add.10068.1 = fadd double %param_5.3805, %param_6.3154
  %param_4.4753 = load double, ptr addrspace(1) %arg428, align 128, !invariant.load !339
  %add.10069.1 = fadd double %add.10068.1, %param_4.4753
  %param_3.5565 = load double, ptr addrspace(1) %arg326, align 128, !invariant.load !339
  %add.10070.1 = fadd double %add.10069.1, %param_3.5565
  %param_2.6816 = load double, ptr addrspace(1) %arg224, align 128, !invariant.load !339
  %add.10071.1 = fadd double %add.10070.1, %param_2.6816
  %param_1.8184 = load double, ptr addrspace(1) %arg122, align 128, !invariant.load !339
  %add.10072.1 = fadd double %add.10071.1, %param_1.8184
  %compare.2761.1 = fcmp oeq double %add.10072.1, 0.000000e+00
  %divide.2567.1 = fdiv double 1.000000e+00, %add.10072.1
  %12 = select i1 %compare.2761.1, double 0.000000e+00, double %divide.2567.1
  %13 = tail call i64 @llvm.smax.i64(i64 %6, i64 0)
  %14 = tail call i64 @llvm.umin.i64(i64 %13, i64 9)
  %param_0.5469 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg020, i64 0, i64 %14
  %param_0.546916 = load double, ptr addrspace(1) %param_0.5469, align 8
  %15 = select i1 %11, double %12, double %param_0.546916
  %16 = getelementptr inbounds [10 x double], ptr addrspace(1) %arg020, i64 0, i64 %10
  store double %15, ptr addrspace(1) %16, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_sqrt_fusion(ptr noalias nocapture readonly align 128 dereferenceable(8) %arg0, ptr noalias nocapture align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg5) local_unnamed_addr #0 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load double, ptr addrspace(1) %arg49, align 128, !invariant.load !339
  %1 = load double, ptr addrspace(1) %arg511, align 128, !invariant.load !339
  %add.10062.1 = fadd double %0, %1
  %2 = load double, ptr addrspace(1) %arg37, align 128, !invariant.load !339
  %add.10063.1 = fadd double %add.10062.1, %2
  %3 = load double, ptr addrspace(1) %arg25, align 128, !invariant.load !339
  %add.10064.1 = fadd double %add.10063.1, %3
  %4 = load double, ptr addrspace(1) %arg13, align 128
  %add.10065.1 = fadd double %add.10064.1, %4
  %5 = load double, ptr addrspace(1) %arg01, align 128, !invariant.load !339
  %add.10066.1 = fadd double %add.10065.1, %5
  %6 = tail call double @llvm.sqrt.f64(double %add.10066.1)
  store double %6, ptr addrspace(1) %arg13, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_30(ptr noalias nocapture align 128 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg01, align 128
  %1 = load i64, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %2 = trunc i64 %1 to i32
  %3 = add i32 %0, %2
  store i32 %3, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @wrapped_add(ptr noalias nocapture align 128 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i32, ptr addrspace(1) %arg01, align 128
  %1 = load i32, ptr addrspace(1) %arg13, align 128, !invariant.load !339
  %2 = add i32 %1, %0
  store i32 %2, ptr addrspace(1) %arg01, align 128
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @loop_add_fusion_35(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture align 128 dereferenceable(8) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load i64, ptr addrspace(1) %arg01, align 16, !invariant.load !339
  %1 = load i64, ptr addrspace(1) %arg13, align 128
  %2 = add i64 %1, %0
  %3 = load i64, ptr addrspace(1) %arg25, align 16, !invariant.load !339
  %4 = add i64 %3, %1
  store i64 %2, ptr addrspace(1) %arg37, align 128
  store i64 %4, ptr addrspace(1) %arg13, align 128
  ret void
}

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

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sqrt.f64(double) #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fma.f64(double, double, double) #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.is.fpclass.f64(double, i32 immarg) #10

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #3 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #5 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { norecurse nounwind }
attributes #7 = { convergent nocallback nounwind }
attributes #8 = { norecurse nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite) }
attributes #9 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #10 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !313, !314, !315, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !327, !328, !329, !330, !331, !332, !333, !334, !335}
!llvm.ident = !{!336}
!nvvmir.version = !{!337}
!llvm.module.flags = !{!338}

!0 = !{ptr @loop_and_fusion_1, !"kernel", i32 1}
!1 = !{ptr @loop_and_fusion_1, !"reqntidx", i32 1}
!2 = !{ptr @loop_select_fusion_30, !"kernel", i32 1}
!3 = !{ptr @loop_select_fusion_30, !"reqntidx", i32 10}
!4 = !{ptr @loop_multiply_fusion, !"kernel", i32 1}
!5 = !{ptr @loop_multiply_fusion, !"reqntidx", i32 4}
!6 = !{ptr @loop_broadcast_fusion_53, !"kernel", i32 1}
!7 = !{ptr @loop_broadcast_fusion_53, !"reqntidx", i32 10}
!8 = !{ptr @loop_compare_fusion, !"kernel", i32 1}
!9 = !{ptr @loop_compare_fusion, !"reqntidx", i32 1}
!10 = !{ptr @input_reduce_fusion, !"kernel", i32 1}
!11 = !{ptr @input_reduce_fusion, !"reqntidx", i32 32}
!12 = !{ptr @loop_dynamic_update_slice_fusion, !"kernel", i32 1}
!13 = !{ptr @loop_dynamic_update_slice_fusion, !"reqntidx", i32 1}
!14 = !{ptr @loop_add_fusion, !"kernel", i32 1}
!15 = !{ptr @loop_add_fusion, !"reqntidx", i32 4}
!16 = !{ptr @loop_add_fusion_1, !"kernel", i32 1}
!17 = !{ptr @loop_add_fusion_1, !"reqntidx", i32 1}
!18 = !{ptr @loop_multiply_fusion_10, !"kernel", i32 1}
!19 = !{ptr @loop_multiply_fusion_10, !"reqntidx", i32 4}
!20 = !{ptr @input_reduce_fusion_1, !"kernel", i32 1}
!21 = !{ptr @input_reduce_fusion_1, !"reqntidx", i32 32}
!22 = !{ptr @loop_add_fusion_2, !"kernel", i32 1}
!23 = !{ptr @loop_add_fusion_2, !"reqntidx", i32 4}
!24 = !{ptr @loop_minimum_fusion_1, !"kernel", i32 1}
!25 = !{ptr @loop_minimum_fusion_1, !"reqntidx", i32 1}
!26 = !{ptr @input_add_reduce_fusion_3, !"kernel", i32 1}
!27 = !{ptr @input_add_reduce_fusion_3, !"reqntidx", i32 32}
!28 = !{ptr @loop_add_fusion_32, !"kernel", i32 1}
!29 = !{ptr @loop_add_fusion_32, !"reqntidx", i32 4}
!30 = !{ptr @loop_broadcast_fusion_54, !"kernel", i32 1}
!31 = !{ptr @loop_broadcast_fusion_54, !"reqntidx", i32 768}
!32 = !{ptr @loop_broadcast_fusion_55, !"kernel", i32 1}
!33 = !{ptr @loop_broadcast_fusion_55, !"reqntidx", i32 4}
!34 = !{ptr @loop_broadcast_fusion_61, !"kernel", i32 1}
!35 = !{ptr @loop_broadcast_fusion_61, !"reqntidx", i32 768}
!36 = !{ptr @loop_broadcast_fusion_59, !"kernel", i32 1}
!37 = !{ptr @loop_broadcast_fusion_59, !"reqntidx", i32 4}
!38 = !{ptr @loop_broadcast_fusion_60, !"kernel", i32 1}
!39 = !{ptr @loop_broadcast_fusion_60, !"reqntidx", i32 768}
!40 = !{ptr @loop_broadcast_fusion_62, !"kernel", i32 1}
!41 = !{ptr @loop_broadcast_fusion_62, !"reqntidx", i32 768}
!42 = !{ptr @loop_broadcast_fusion_56, !"kernel", i32 1}
!43 = !{ptr @loop_broadcast_fusion_56, !"reqntidx", i32 192}
!44 = !{ptr @loop_broadcast_fusion_63, !"kernel", i32 1}
!45 = !{ptr @loop_broadcast_fusion_63, !"reqntidx", i32 192}
!46 = !{ptr @loop_broadcast_fusion_51, !"kernel", i32 1}
!47 = !{ptr @loop_broadcast_fusion_51, !"reqntidx", i32 4}
!48 = !{ptr @loop_broadcast_fusion_58, !"kernel", i32 1}
!49 = !{ptr @loop_broadcast_fusion_58, !"reqntidx", i32 4}
!50 = !{ptr @loop_broadcast_fusion_64, !"kernel", i32 1}
!51 = !{ptr @loop_broadcast_fusion_64, !"reqntidx", i32 4}
!52 = !{ptr @loop_compare_fusion_9, !"kernel", i32 1}
!53 = !{ptr @loop_compare_fusion_9, !"reqntidx", i32 1}
!54 = !{ptr @loop_dynamic_update_slice_fusion_201, !"kernel", i32 1}
!55 = !{ptr @loop_dynamic_update_slice_fusion_201, !"reqntidx", i32 4}
!56 = !{ptr @loop_dynamic_update_slice_fusion_171, !"kernel", i32 1}
!57 = !{ptr @loop_dynamic_update_slice_fusion_171, !"reqntidx", i32 4}
!58 = !{ptr @loop_dynamic_update_slice_fusion_172, !"kernel", i32 1}
!59 = !{ptr @loop_dynamic_update_slice_fusion_172, !"reqntidx", i32 4}
!60 = !{ptr @loop_dynamic_update_slice_fusion_174, !"kernel", i32 1}
!61 = !{ptr @loop_dynamic_update_slice_fusion_174, !"reqntidx", i32 4}
!62 = !{ptr @loop_dynamic_update_slice_fusion_216, !"kernel", i32 1}
!63 = !{ptr @loop_dynamic_update_slice_fusion_216, !"reqntidx", i32 1}
!64 = !{ptr @loop_dynamic_update_slice_fusion_208, !"kernel", i32 1}
!65 = !{ptr @loop_dynamic_update_slice_fusion_208, !"reqntidx", i32 4}
!66 = !{ptr @loop_dynamic_update_slice_fusion_215, !"kernel", i32 1}
!67 = !{ptr @loop_dynamic_update_slice_fusion_215, !"reqntidx", i32 1}
!68 = !{ptr @loop_dynamic_update_slice_fusion_175, !"kernel", i32 1}
!69 = !{ptr @loop_dynamic_update_slice_fusion_175, !"reqntidx", i32 4}
!70 = !{ptr @loop_dynamic_update_slice_fusion_199, !"kernel", i32 1}
!71 = !{ptr @loop_dynamic_update_slice_fusion_199, !"reqntidx", i32 4}
!72 = !{ptr @loop_dynamic_update_slice_fusion_198, !"kernel", i32 1}
!73 = !{ptr @loop_dynamic_update_slice_fusion_198, !"reqntidx", i32 4}
!74 = !{ptr @loop_dynamic_update_slice_fusion_202, !"kernel", i32 1}
!75 = !{ptr @loop_dynamic_update_slice_fusion_202, !"reqntidx", i32 4}
!76 = !{ptr @loop_dynamic_update_slice_fusion_167, !"kernel", i32 1}
!77 = !{ptr @loop_dynamic_update_slice_fusion_167, !"reqntidx", i32 4}
!78 = !{ptr @loop_dynamic_update_slice_fusion_168, !"kernel", i32 1}
!79 = !{ptr @loop_dynamic_update_slice_fusion_168, !"reqntidx", i32 4}
!80 = !{ptr @loop_dynamic_update_slice_fusion_213, !"kernel", i32 1}
!81 = !{ptr @loop_dynamic_update_slice_fusion_213, !"reqntidx", i32 4}
!82 = !{ptr @loop_dynamic_update_slice_fusion_176, !"kernel", i32 1}
!83 = !{ptr @loop_dynamic_update_slice_fusion_176, !"reqntidx", i32 4}
!84 = !{ptr @loop_dynamic_update_slice_fusion_182, !"kernel", i32 1}
!85 = !{ptr @loop_dynamic_update_slice_fusion_182, !"reqntidx", i32 4}
!86 = !{ptr @loop_dynamic_update_slice_fusion_192, !"kernel", i32 1}
!87 = !{ptr @loop_dynamic_update_slice_fusion_192, !"reqntidx", i32 4}
!88 = !{ptr @loop_dynamic_update_slice_fusion_214, !"kernel", i32 1}
!89 = !{ptr @loop_dynamic_update_slice_fusion_214, !"reqntidx", i32 4}
!90 = !{ptr @loop_dynamic_update_slice_fusion_204, !"kernel", i32 1}
!91 = !{ptr @loop_dynamic_update_slice_fusion_204, !"reqntidx", i32 4}
!92 = !{ptr @loop_dynamic_update_slice_fusion_206, !"kernel", i32 1}
!93 = !{ptr @loop_dynamic_update_slice_fusion_206, !"reqntidx", i32 4}
!94 = !{ptr @loop_dynamic_update_slice_fusion_209, !"kernel", i32 1}
!95 = !{ptr @loop_dynamic_update_slice_fusion_209, !"reqntidx", i32 4}
!96 = !{ptr @loop_dynamic_update_slice_fusion_210, !"kernel", i32 1}
!97 = !{ptr @loop_dynamic_update_slice_fusion_210, !"reqntidx", i32 4}
!98 = !{ptr @loop_add_divide_select_fusion_3, !"kernel", i32 1}
!99 = !{ptr @loop_add_divide_select_fusion_3, !"reqntidx", i32 4}
!100 = !{ptr @loop_dynamic_update_slice_fusion_165, !"kernel", i32 1}
!101 = !{ptr @loop_dynamic_update_slice_fusion_165, !"reqntidx", i32 4}
!102 = !{ptr @loop_dynamic_update_slice_fusion_163, !"kernel", i32 1}
!103 = !{ptr @loop_dynamic_update_slice_fusion_163, !"reqntidx", i32 4}
!104 = !{ptr @loop_dynamic_update_slice_fusion_164, !"kernel", i32 1}
!105 = !{ptr @loop_dynamic_update_slice_fusion_164, !"reqntidx", i32 4}
!106 = !{ptr @loop_dynamic_update_slice_fusion_191, !"kernel", i32 1}
!107 = !{ptr @loop_dynamic_update_slice_fusion_191, !"reqntidx", i32 4}
!108 = !{ptr @loop_dynamic_update_slice_fusion_205, !"kernel", i32 1}
!109 = !{ptr @loop_dynamic_update_slice_fusion_205, !"reqntidx", i32 4}
!110 = !{ptr @loop_dynamic_update_slice_fusion_173, !"kernel", i32 1}
!111 = !{ptr @loop_dynamic_update_slice_fusion_173, !"reqntidx", i32 4}
!112 = !{ptr @loop_dynamic_update_slice_fusion_178, !"kernel", i32 1}
!113 = !{ptr @loop_dynamic_update_slice_fusion_178, !"reqntidx", i32 4}
!114 = !{ptr @loop_dynamic_update_slice_fusion_177, !"kernel", i32 1}
!115 = !{ptr @loop_dynamic_update_slice_fusion_177, !"reqntidx", i32 4}
!116 = !{ptr @loop_dynamic_update_slice_fusion_179, !"kernel", i32 1}
!117 = !{ptr @loop_dynamic_update_slice_fusion_179, !"reqntidx", i32 4}
!118 = !{ptr @loop_dynamic_update_slice_fusion_185, !"kernel", i32 1}
!119 = !{ptr @loop_dynamic_update_slice_fusion_185, !"reqntidx", i32 4}
!120 = !{ptr @loop_dynamic_update_slice_fusion_184, !"kernel", i32 1}
!121 = !{ptr @loop_dynamic_update_slice_fusion_184, !"reqntidx", i32 4}
!122 = !{ptr @loop_dynamic_update_slice_fusion_197, !"kernel", i32 1}
!123 = !{ptr @loop_dynamic_update_slice_fusion_197, !"reqntidx", i32 4}
!124 = !{ptr @loop_dynamic_update_slice_fusion_193, !"kernel", i32 1}
!125 = !{ptr @loop_dynamic_update_slice_fusion_193, !"reqntidx", i32 4}
!126 = !{ptr @loop_dynamic_update_slice_fusion_188, !"kernel", i32 1}
!127 = !{ptr @loop_dynamic_update_slice_fusion_188, !"reqntidx", i32 4}
!128 = !{ptr @loop_dynamic_update_slice_fusion_194, !"kernel", i32 1}
!129 = !{ptr @loop_dynamic_update_slice_fusion_194, !"reqntidx", i32 4}
!130 = !{ptr @loop_dynamic_update_slice_fusion_196, !"kernel", i32 1}
!131 = !{ptr @loop_dynamic_update_slice_fusion_196, !"reqntidx", i32 4}
!132 = !{ptr @loop_dynamic_update_slice_fusion_189, !"kernel", i32 1}
!133 = !{ptr @loop_dynamic_update_slice_fusion_189, !"reqntidx", i32 4}
!134 = !{ptr @loop_dynamic_update_slice_fusion_190, !"kernel", i32 1}
!135 = !{ptr @loop_dynamic_update_slice_fusion_190, !"reqntidx", i32 4}
!136 = !{ptr @loop_dynamic_update_slice_fusion_180, !"kernel", i32 1}
!137 = !{ptr @loop_dynamic_update_slice_fusion_180, !"reqntidx", i32 4}
!138 = !{ptr @loop_dynamic_update_slice_fusion_170, !"kernel", i32 1}
!139 = !{ptr @loop_dynamic_update_slice_fusion_170, !"reqntidx", i32 4}
!140 = !{ptr @loop_dynamic_update_slice_fusion_169, !"kernel", i32 1}
!141 = !{ptr @loop_dynamic_update_slice_fusion_169, !"reqntidx", i32 4}
!142 = !{ptr @loop_dynamic_update_slice_fusion_183, !"kernel", i32 1}
!143 = !{ptr @loop_dynamic_update_slice_fusion_183, !"reqntidx", i32 4}
!144 = !{ptr @loop_dynamic_update_slice_fusion_166, !"kernel", i32 1}
!145 = !{ptr @loop_dynamic_update_slice_fusion_166, !"reqntidx", i32 4}
!146 = !{ptr @loop_add_fusion_29, !"kernel", i32 1}
!147 = !{ptr @loop_add_fusion_29, !"reqntidx", i32 4}
!148 = !{ptr @loop_add_fusion_29, !"reqntidy", i32 32}
!149 = !{ptr @loop_exponential_fusion_3, !"kernel", i32 1}
!150 = !{ptr @loop_exponential_fusion_3, !"reqntidx", i32 128}
!151 = !{ptr @input_concatenate_fusion_3, !"kernel", i32 1}
!152 = !{ptr @input_concatenate_fusion_3, !"reqntidx", i32 128}
!153 = !{ptr @loop_broadcast_fusion_52, !"kernel", i32 1}
!154 = !{ptr @loop_broadcast_fusion_52, !"reqntidx", i32 1024}
!155 = !{ptr @input_scatter_fusion_3, !"kernel", i32 1}
!156 = !{ptr @input_scatter_fusion_3, !"reqntidx", i32 128}
!157 = !{ptr @loop_select_slice_fusion_3, !"kernel", i32 1}
!158 = !{ptr @loop_select_slice_fusion_3, !"reqntidx", i32 128}
!159 = !{ptr @input_multiply_reduce_fusion_3, !"kernel", i32 1}
!160 = !{ptr @input_multiply_reduce_fusion_3, !"reqntidx", i32 1024}
!161 = !{ptr @loop_broadcast_fusion_57, !"kernel", i32 1}
!162 = !{ptr @loop_broadcast_fusion_57, !"reqntidx", i32 4}
!163 = !{ptr @loop_dynamic_slice_fusion_17, !"kernel", i32 1}
!164 = !{ptr @loop_dynamic_slice_fusion_17, !"reqntidx", i32 1}
!165 = !{ptr @loop_dynamic_slice_fusion_15, !"kernel", i32 1}
!166 = !{ptr @loop_dynamic_slice_fusion_15, !"reqntidx", i32 1}
!167 = !{ptr @loop_dynamic_slice_fusion_19, !"kernel", i32 1}
!168 = !{ptr @loop_dynamic_slice_fusion_19, !"reqntidx", i32 4}
!169 = !{ptr @loop_dynamic_slice_fusion_18, !"kernel", i32 1}
!170 = !{ptr @loop_dynamic_slice_fusion_18, !"reqntidx", i32 4}
!171 = !{ptr @loop_add_select_fusion_7, !"kernel", i32 1}
!172 = !{ptr @loop_add_select_fusion_7, !"reqntidx", i32 4}
!173 = !{ptr @loop_multiply_negate_fusion_3, !"kernel", i32 1}
!174 = !{ptr @loop_multiply_negate_fusion_3, !"reqntidx", i32 4}
!175 = !{ptr @loop_broadcast_multiply_select_fusion_3, !"kernel", i32 1}
!176 = !{ptr @loop_broadcast_multiply_select_fusion_3, !"reqntidx", i32 4}
!177 = !{ptr @loop_add_select_fusion_6, !"kernel", i32 1}
!178 = !{ptr @loop_add_select_fusion_6, !"reqntidx", i32 4}
!179 = !{ptr @input_reduce_fusion_29, !"kernel", i32 1}
!180 = !{ptr @input_reduce_fusion_29, !"reqntidx", i32 32}
!181 = !{ptr @input_reduce_fusion_27, !"kernel", i32 1}
!182 = !{ptr @input_reduce_fusion_27, !"reqntidx", i32 32}
!183 = !{ptr @input_reduce_fusion_30, !"kernel", i32 1}
!184 = !{ptr @input_reduce_fusion_30, !"reqntidx", i32 1024}
!185 = !{ptr @input_reduce_fusion_28, !"kernel", i32 1}
!186 = !{ptr @input_reduce_fusion_28, !"reqntidx", i32 32}
!187 = !{ptr @input_reduce_fusion_17, !"kernel", i32 1}
!188 = !{ptr @input_reduce_fusion_17, !"reqntidx", i32 64}
!189 = !{ptr @loop_add_negate_or_select_fusion, !"kernel", i32 1}
!190 = !{ptr @loop_add_negate_or_select_fusion, !"reqntidx", i32 1}
!191 = !{ptr @loop_select_fusion_37, !"kernel", i32 1}
!192 = !{ptr @loop_select_fusion_37, !"reqntidx", i32 4}
!193 = !{ptr @loop_select_fusion_33, !"kernel", i32 1}
!194 = !{ptr @loop_select_fusion_33, !"reqntidx", i32 4}
!195 = !{ptr @loop_select_fusion_38, !"kernel", i32 1}
!196 = !{ptr @loop_select_fusion_38, !"reqntidx", i32 4}
!197 = !{ptr @loop_select_fusion_34, !"kernel", i32 1}
!198 = !{ptr @loop_select_fusion_34, !"reqntidx", i32 4}
!199 = !{ptr @loop_select_fusion_35, !"kernel", i32 1}
!200 = !{ptr @loop_select_fusion_35, !"reqntidx", i32 4}
!201 = !{ptr @loop_select_fusion_36, !"kernel", i32 1}
!202 = !{ptr @loop_select_fusion_36, !"reqntidx", i32 4}
!203 = !{ptr @loop_select_fusion_42, !"kernel", i32 1}
!204 = !{ptr @loop_select_fusion_42, !"reqntidx", i32 1}
!205 = !{ptr @loop_select_fusion_40, !"kernel", i32 1}
!206 = !{ptr @loop_select_fusion_40, !"reqntidx", i32 1}
!207 = !{ptr @loop_select_fusion_43, !"kernel", i32 1}
!208 = !{ptr @loop_select_fusion_43, !"reqntidx", i32 1}
!209 = !{ptr @loop_select_fusion_39, !"kernel", i32 1}
!210 = !{ptr @loop_select_fusion_39, !"reqntidx", i32 1}
!211 = !{ptr @loop_select_fusion_41, !"kernel", i32 1}
!212 = !{ptr @loop_select_fusion_41, !"reqntidx", i32 1}
!213 = !{ptr @loop_select_fusion_32, !"kernel", i32 1}
!214 = !{ptr @loop_select_fusion_32, !"reqntidx", i32 1}
!215 = !{ptr @loop_select_fusion_44, !"kernel", i32 1}
!216 = !{ptr @loop_select_fusion_44, !"reqntidx", i32 1}
!217 = !{ptr @loop_and_fusion, !"kernel", i32 1}
!218 = !{ptr @loop_and_fusion, !"reqntidx", i32 1}
!219 = !{ptr @wrapped_convert, !"kernel", i32 1}
!220 = !{ptr @wrapped_convert, !"reqntidx", i32 1}
!221 = !{ptr @loop_minimum_fusion, !"kernel", i32 1}
!222 = !{ptr @loop_minimum_fusion, !"reqntidx", i32 1}
!223 = !{ptr @input_add_reduce_fusion, !"kernel", i32 1}
!224 = !{ptr @input_add_reduce_fusion, !"reqntidx", i32 32}
!225 = !{ptr @input_reduce_fusion_3, !"kernel", i32 1}
!226 = !{ptr @input_reduce_fusion_3, !"reqntidx", i32 32}
!227 = !{ptr @input_reduce_fusion_4, !"kernel", i32 1}
!228 = !{ptr @input_reduce_fusion_4, !"reqntidx", i32 32}
!229 = !{ptr @loop_add_and_negate_or_select_fusion, !"kernel", i32 1}
!230 = !{ptr @loop_add_and_negate_or_select_fusion, !"reqntidx", i32 1}
!231 = !{ptr @loop_select_fusion_12, !"kernel", i32 1}
!232 = !{ptr @loop_select_fusion_12, !"reqntidx", i32 1}
!233 = !{ptr @loop_select_fusion_11, !"kernel", i32 1}
!234 = !{ptr @loop_select_fusion_11, !"reqntidx", i32 1}
!235 = !{ptr @loop_select_fusion_10, !"kernel", i32 1}
!236 = !{ptr @loop_select_fusion_10, !"reqntidx", i32 1}
!237 = !{ptr @loop_select_fusion_9, !"kernel", i32 1}
!238 = !{ptr @loop_select_fusion_9, !"reqntidx", i32 1}
!239 = !{ptr @loop_select_fusion_8, !"kernel", i32 1}
!240 = !{ptr @loop_select_fusion_8, !"reqntidx", i32 1}
!241 = !{ptr @wrapped_select, !"kernel", i32 1}
!242 = !{ptr @wrapped_select, !"reqntidx", i32 1}
!243 = !{ptr @loop_select_fusion_4, !"kernel", i32 1}
!244 = !{ptr @loop_select_fusion_4, !"reqntidx", i32 4}
!245 = !{ptr @loop_select_fusion_3, !"kernel", i32 1}
!246 = !{ptr @loop_select_fusion_3, !"reqntidx", i32 4}
!247 = !{ptr @loop_select_fusion_2, !"kernel", i32 1}
!248 = !{ptr @loop_select_fusion_2, !"reqntidx", i32 4}
!249 = !{ptr @loop_select_fusion_6, !"kernel", i32 1}
!250 = !{ptr @loop_select_fusion_6, !"reqntidx", i32 4}
!251 = !{ptr @loop_select_fusion_1, !"kernel", i32 1}
!252 = !{ptr @loop_select_fusion_1, !"reqntidx", i32 4}
!253 = !{ptr @loop_select_fusion_5, !"kernel", i32 1}
!254 = !{ptr @loop_select_fusion_5, !"reqntidx", i32 4}
!255 = !{ptr @loop_select_fusion, !"kernel", i32 1}
!256 = !{ptr @loop_select_fusion, !"reqntidx", i32 1}
!257 = !{ptr @input_reduce_fusion_7, !"kernel", i32 1}
!258 = !{ptr @input_reduce_fusion_7, !"reqntidx", i32 32}
!259 = !{ptr @loop_divide_fusion, !"kernel", i32 1}
!260 = !{ptr @loop_divide_fusion, !"reqntidx", i32 2}
!261 = !{ptr @loop_select_fusion_22, !"kernel", i32 1}
!262 = !{ptr @loop_select_fusion_22, !"reqntidx", i32 1}
!263 = !{ptr @input_reduce_fusion_10, !"kernel", i32 1}
!264 = !{ptr @input_reduce_fusion_10, !"reqntidx", i32 32}
!265 = !{ptr @input_reduce_fusion_9, !"kernel", i32 1}
!266 = !{ptr @input_reduce_fusion_9, !"reqntidx", i32 32}
!267 = !{ptr @input_reduce_fusion_12, !"kernel", i32 1}
!268 = !{ptr @input_reduce_fusion_12, !"reqntidx", i32 32}
!269 = !{ptr @input_reduce_fusion_8, !"kernel", i32 1}
!270 = !{ptr @input_reduce_fusion_8, !"reqntidx", i32 32}
!271 = !{ptr @input_reduce_fusion_11, !"kernel", i32 1}
!272 = !{ptr @input_reduce_fusion_11, !"reqntidx", i32 32}
!273 = !{ptr @input_reduce_fusion_13, !"kernel", i32 1}
!274 = !{ptr @input_reduce_fusion_13, !"reqntidx", i32 32}
!275 = !{ptr @loop_add_and_compare_maximum_select_fusion, !"kernel", i32 1}
!276 = !{ptr @loop_add_and_compare_maximum_select_fusion, !"reqntidx", i32 1}
!277 = !{ptr @loop_select_fusion_23, !"kernel", i32 1}
!278 = !{ptr @loop_select_fusion_23, !"reqntidx", i32 1}
!279 = !{ptr @loop_select_fusion_24, !"kernel", i32 1}
!280 = !{ptr @loop_select_fusion_24, !"reqntidx", i32 1}
!281 = !{ptr @loop_select_fusion_13, !"kernel", i32 1}
!282 = !{ptr @loop_select_fusion_13, !"reqntidx", i32 1}
!283 = !{ptr @loop_select_fusion_14, !"kernel", i32 1}
!284 = !{ptr @loop_select_fusion_14, !"reqntidx", i32 1}
!285 = !{ptr @loop_select_fusion_15, !"kernel", i32 1}
!286 = !{ptr @loop_select_fusion_15, !"reqntidx", i32 1}
!287 = !{ptr @loop_select_fusion_27, !"kernel", i32 1}
!288 = !{ptr @loop_select_fusion_27, !"reqntidx", i32 1}
!289 = !{ptr @loop_select_fusion_25, !"kernel", i32 1}
!290 = !{ptr @loop_select_fusion_25, !"reqntidx", i32 1}
!291 = !{ptr @loop_select_fusion_26, !"kernel", i32 1}
!292 = !{ptr @loop_select_fusion_26, !"reqntidx", i32 1}
!293 = !{ptr @loop_select_fusion_28, !"kernel", i32 1}
!294 = !{ptr @loop_select_fusion_28, !"reqntidx", i32 1}
!295 = !{ptr @loop_add_convert_fusion, !"kernel", i32 1}
!296 = !{ptr @loop_add_convert_fusion, !"reqntidx", i32 1}
!297 = !{ptr @loop_add_fusion_25, !"kernel", i32 1}
!298 = !{ptr @loop_add_fusion_25, !"reqntidx", i32 1}
!299 = !{ptr @loop_select_fusion_29, !"kernel", i32 1}
!300 = !{ptr @loop_select_fusion_29, !"reqntidx", i32 1}
!301 = !{ptr @loop_add_fusion_21, !"kernel", i32 1}
!302 = !{ptr @loop_add_fusion_21, !"reqntidx", i32 4}
!303 = !{ptr @loop_add_fusion_18, !"kernel", i32 1}
!304 = !{ptr @loop_add_fusion_18, !"reqntidx", i32 4}
!305 = !{ptr @loop_add_fusion_18, !"reqntidy", i32 32}
!306 = !{ptr @loop_select_slice_fusion_2, !"kernel", i32 1}
!307 = !{ptr @loop_select_slice_fusion_2, !"reqntidx", i32 128}
!308 = !{ptr @input_multiply_reduce_fusion_2, !"kernel", i32 1}
!309 = !{ptr @input_multiply_reduce_fusion_2, !"reqntidx", i32 1024}
!310 = !{ptr @input_add_reduce_fusion_2, !"kernel", i32 1}
!311 = !{ptr @input_add_reduce_fusion_2, !"reqntidx", i32 32}
!312 = !{ptr @loop_negate_fusion, !"kernel", i32 1}
!313 = !{ptr @loop_negate_fusion, !"reqntidx", i32 1}
!314 = !{ptr @input_reduce_fusion_20, !"kernel", i32 1}
!315 = !{ptr @input_reduce_fusion_20, !"reqntidx", i32 32}
!316 = !{ptr @loop_dynamic_update_slice_fusion_217, !"kernel", i32 1}
!317 = !{ptr @loop_dynamic_update_slice_fusion_217, !"reqntidx", i32 4}
!318 = !{ptr @input_reduce_fusion_19, !"kernel", i32 1}
!319 = !{ptr @input_reduce_fusion_19, !"reqntidx", i32 32}
!320 = !{ptr @input_reduce_fusion_18, !"kernel", i32 1}
!321 = !{ptr @input_reduce_fusion_18, !"reqntidx", i32 32}
!322 = !{ptr @loop_select_fusion_31, !"kernel", i32 1}
!323 = !{ptr @loop_select_fusion_31, !"reqntidx", i32 1}
!324 = !{ptr @input_reduce_fusion_25, !"kernel", i32 1}
!325 = !{ptr @input_reduce_fusion_25, !"reqntidx", i32 32}
!326 = !{ptr @loop_dynamic_update_slice_fusion_229, !"kernel", i32 1}
!327 = !{ptr @loop_dynamic_update_slice_fusion_229, !"reqntidx", i32 1}
!328 = !{ptr @loop_sqrt_fusion, !"kernel", i32 1}
!329 = !{ptr @loop_sqrt_fusion, !"reqntidx", i32 1}
!330 = !{ptr @loop_add_fusion_30, !"kernel", i32 1}
!331 = !{ptr @loop_add_fusion_30, !"reqntidx", i32 1}
!332 = !{ptr @wrapped_add, !"kernel", i32 1}
!333 = !{ptr @wrapped_add, !"reqntidx", i32 1}
!334 = !{ptr @loop_add_fusion_35, !"kernel", i32 1}
!335 = !{ptr @loop_add_fusion_35, !"reqntidx", i32 1}
!336 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!337 = !{i32 2, i32 0}
!338 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!339 = !{}
!340 = !{i32 0, i32 10}
!341 = !{i32 0, i32 4}
!342 = !{i32 0, i32 32}
!343 = !{i32 0, i32 768}
!344 = !{i32 0, i32 192}
!345 = !{i32 0, i32 6}
!346 = !{i32 0, i32 12}
!347 = !{i32 0, i32 128}
!348 = !{i32 0, i32 2}
!349 = !{i32 0, i32 1024}
!350 = distinct !{!350, !351}
!351 = !{!"llvm.loop.vectorize.enable", i1 false}
!352 = !{i32 0, i32 3}
!353 = distinct !{!353, !351}
!354 = !{i32 0, i32 64}
!355 = distinct !{!355, !351}
