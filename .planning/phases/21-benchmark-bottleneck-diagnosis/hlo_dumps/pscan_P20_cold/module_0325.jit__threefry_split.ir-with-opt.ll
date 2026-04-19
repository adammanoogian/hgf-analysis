; ModuleID = 'jit__threefry_split'
source_filename = "jit__threefry_split"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @input_concatenate_fusion(ptr noalias nocapture readonly align 16 dereferenceable(8) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg1) local_unnamed_addr #0 {
entry:
  %arg1100 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg098 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %1 = load <2 x i32>, ptr addrspace(1) %arg098, align 16, !invariant.load !4
  %2 = extractelement <2 x i32> %1, i32 0
  %3 = extractelement <2 x i32> %1, i32 1
  %4 = add i32 %2, %0
  %5 = or disjoint i32 %0, 2
  %6 = add i32 %3, %5
  %7 = add i32 %4, %6
  %8 = tail call i32 @llvm.fshl.i32(i32 %6, i32 %6, i32 13)
  %9 = xor i32 %7, %8
  %10 = add i32 %9, %7
  %11 = tail call i32 @llvm.fshl.i32(i32 %9, i32 %9, i32 15)
  %12 = xor i32 %10, %11
  %13 = add i32 %12, %10
  %14 = tail call i32 @llvm.fshl.i32(i32 %12, i32 %12, i32 26)
  %15 = xor i32 %13, %14
  %16 = add i32 %15, %13
  %17 = add i32 %16, %3
  %18 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 6)
  %19 = xor i32 %16, %18
  %20 = xor i32 %2, %3
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
  %52 = add i32 %3, 3
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
  %64 = add i32 %63, %3
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
  %79 = add i32 %78, %21
  %80 = zext nneg i32 %0 to i64
  %81 = getelementptr inbounds [4 x i32], ptr addrspace(1) %arg1100, i64 0, i64 %80
  store i32 %79, ptr addrspace(1) %81, align 4
  %82 = tail call i32 @llvm.fshl.i32(i32 %77, i32 %77, i32 6)
  %83 = xor i32 %78, %82
  %84 = add i32 %2, 5
  %85 = add i32 %84, %83
  %86 = getelementptr inbounds i8, ptr addrspace(1) %81, i64 8
  store i32 %85, ptr addrspace(1) %86, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{ptr @input_concatenate_fusion, !"kernel", i32 1}
!1 = !{ptr @input_concatenate_fusion, !"reqntidx", i32 2}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 0, i32 2}
!4 = !{}
