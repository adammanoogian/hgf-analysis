; ModuleID = 'jit_iota'
source_filename = "jit_iota"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_1_0 = constant [64 x i8] zeroinitializer, align 128
