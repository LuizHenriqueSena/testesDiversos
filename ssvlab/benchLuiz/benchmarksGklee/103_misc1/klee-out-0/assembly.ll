; ModuleID = 'main'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

@_ZZ9helloCUDAiE1S = internal global [8192 x float] zeroinitializer, section "__shared__", align 16
@_ZZ9helloCUDAiE1F = internal global [256 x float] zeroinitializer, section "__shared__", align 16
@threadIdx = external global %struct.dim3
@blockDim = external global %struct.dim3

define void @_Z9helloCUDAi(i32 %x) nounwind uwtable noinline {
  %1 = alloca i32, align 4
  %idx = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 0, i32* %i, align 4, !dbg !253
  br label %2, !dbg !253

; <label>:2                                       ; preds = %32, %0
  %3 = load i32* %i, align 4, !dbg !253
  %4 = load i32* %1, align 4, !dbg !253
  %5 = icmp slt i32 %3, %4, !dbg !253
  br i1 %5, label %6, label %37, !dbg !253

; <label>:6                                       ; preds = %2
  %7 = load i32* %i, align 4, !dbg !256
  %8 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !256
  %9 = udiv i32 %8, 32, !dbg !256
  %10 = add i32 %7, %9, !dbg !256
  %11 = load i32* %1, align 4, !dbg !256
  %12 = icmp ult i32 %10, %11, !dbg !256
  br i1 %12, label %13, label %32, !dbg !256

; <label>:13                                      ; preds = %6
  %14 = load i32* %i, align 4, !dbg !258
  %15 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !258
  %16 = udiv i32 %15, 32, !dbg !258
  %17 = add i32 %14, %16, !dbg !258
  %18 = mul i32 %17, 32, !dbg !258
  %19 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !258
  %20 = urem i32 %19, 32, !dbg !258
  %21 = add i32 %18, %20, !dbg !258
  store i32 %21, i32* %idx, align 4, !dbg !258
  %22 = load i32* %i, align 4, !dbg !260
  %23 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !260
  %24 = udiv i32 %23, 32, !dbg !260
  %25 = add i32 %22, %24, !dbg !260
  %26 = zext i32 %25 to i64, !dbg !260
  %27 = getelementptr inbounds [256 x float]* @_ZZ9helloCUDAiE1F, i32 0, i64 %26, !dbg !260
  %28 = load float* %27, align 4, !dbg !260
  %29 = load i32* %idx, align 4, !dbg !260
  %30 = zext i32 %29 to i64, !dbg !260
  %31 = getelementptr inbounds [8192 x float]* @_ZZ9helloCUDAiE1S, i32 0, i64 %30, !dbg !260
  store float %28, float* %31, align 4, !dbg !260
  br label %32, !dbg !261

; <label>:32                                      ; preds = %6, %13
  %33 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 0), align 4, !dbg !262
  %34 = udiv i32 %33, 32, !dbg !262
  %35 = load i32* %i, align 4, !dbg !262
  %36 = add i32 %35, %34, !dbg !262
  store i32 %36, i32* %i, align 4, !dbg !262
  br label %2, !dbg !262

; <label>:37                                      ; preds = %2
  ret void, !dbg !263
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  store i32 0, i32* %1
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !264
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 512, i32 1, i32 1), !dbg !264
  %6 = bitcast { i64, i32 }* %4 to i8*, !dbg !264
  %7 = bitcast %struct.dim3* %2 to i8*, !dbg !264
  %8 = call i8* @memcpy(i8* %6, i8* %7, i64 12)
  %9 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !264
  %10 = load i64* %9, align 1, !dbg !264
  %11 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !264
  %12 = load i32* %11, align 1, !dbg !264
  %13 = bitcast { i64, i32 }* %5 to i8*, !dbg !264
  %14 = bitcast %struct.dim3* %3 to i8*, !dbg !264
  %15 = call i8* @memcpy(i8* %13, i8* %14, i64 12)
  %16 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !264
  %17 = load i64* %16, align 1, !dbg !264
  %18 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !264
  %19 = load i32* %18, align 1, !dbg !264
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %10, i32 %12, i64 %17, i32 %19), !dbg !264
  call void @_Z9helloCUDAi(i32 143), !dbg !267
  %20 = call i32 @cudaThreadSynchronize(), !dbg !268
  ret i32 0, !dbg !269
}

declare void @__set_CUDAConfig(i64, i32, i64, i32, ...)

define linkonce_odr void @_ZN4dim3C1Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr uwtable section "__device__" align 2 {
  %1 = alloca %struct.dim3*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %1, align 8
  store i32 %vx, i32* %2, align 4
  store i32 %vy, i32* %3, align 4
  store i32 %vz, i32* %4, align 4
  %5 = load %struct.dim3** %1
  %6 = load i32* %2, align 4, !dbg !270
  %7 = load i32* %3, align 4, !dbg !270
  %8 = load i32* %4, align 4, !dbg !270
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !270
  ret void, !dbg !270
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr nounwind uwtable section "__device__" align 2 {
  %1 = alloca %struct.dim3*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %1, align 8
  store i32 %vx, i32* %2, align 4
  store i32 %vy, i32* %3, align 4
  store i32 %vz, i32* %4, align 4
  %5 = load %struct.dim3** %1
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !271
  %7 = load i32* %2, align 4, !dbg !271
  store i32 %7, i32* %6, align 4, !dbg !271
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !271
  %9 = load i32* %3, align 4, !dbg !271
  store i32 %9, i32* %8, align 4, !dbg !271
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !271
  %11 = load i32* %4, align 4, !dbg !271
  store i32 %11, i32* %10, align 4, !dbg !271
  ret void, !dbg !272
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !274
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !274

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !274
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !275
  %4 = load i8* %src.06, align 1, !dbg !275, !tbaa !276
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !275
  store i8 %4, i8* %dest.05, align 1, !dbg !275, !tbaa !276
  %6 = icmp eq i64 %2, 0, !dbg !274
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !274

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !278
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @cudaThreadExit() nounwind uwtable readnone {
  ret i32 0, !dbg !279
}

define i32 @cudaThreadGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !281
}

define i32 @cudaThreadGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
  ret i32 0, !dbg !283
}

define i32 @cudaThreadSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !285
}

define i32 @cudaThreadSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
  ret i32 0, !dbg !287
}

define i32 @cudaThreadSynchronize() nounwind uwtable readnone {
  ret i32 0, !dbg !289
}

!llvm.dbg.cu = !{!0, !68, !92, !108, !125}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/103_misc1", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, 
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !10, metadata !13, metadata !56}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"helloCUDA", metadata !"helloCUDA", metadata !"_Z9helloCUDAi", metadata !6, i32 10, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @_Z9helloCUDAi, null, null, m
!6 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/103_misc1", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 32, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !1, i32 32} ; [ DW_TAG_sub
!11 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !9}
!13 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !14, i32 419, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!14 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/103_misc1", null} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{null, metadata !17, metadata !21, metadata !21, metadata !21}
!17 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!18 = metadata !{i32 786451, null, metadata !"dim3", metadata !14, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !19, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!19 = metadata !{metadata !20, metadata !22, metadata !23, metadata !24, metadata !27, metadata !45, metadata !48, metadata !53}
!20 = metadata !{i32 786445, metadata !18, metadata !"x", metadata !14, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!21 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!22 = metadata !{i32 786445, metadata !18, metadata !"y", metadata !14, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !21} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!23 = metadata !{i32 786445, metadata !18, metadata !"z", metadata !14, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!24 = metadata !{i32 786478, i32 0, metadata !18, metadata !"dim3", metadata !"dim3", metadata !"", metadata !14, i32 419, metadata !15, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !25, i32 419} ; [ DW_TAG_subpr
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!27 = metadata !{i32 786478, i32 0, metadata !18, metadata !"dim3", metadata !"dim3", metadata !"", metadata !14, i32 420, metadata !28, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !25, i32 420} ; [ DW_TAG_subpr
!28 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{null, metadata !17, metadata !30}
!30 = metadata !{i32 786454, null, metadata !"uint3", metadata !14, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!31 = metadata !{i32 786451, null, metadata !"uint3", metadata !14, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !32, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!32 = metadata !{metadata !33, metadata !34, metadata !35, metadata !36, metadata !40}
!33 = metadata !{i32 786445, metadata !31, metadata !"x", metadata !14, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!34 = metadata !{i32 786445, metadata !31, metadata !"y", metadata !14, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !21} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!35 = metadata !{i32 786445, metadata !31, metadata !"z", metadata !14, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!36 = metadata !{i32 786478, i32 0, metadata !31, metadata !"uint3", metadata !"uint3", metadata !"", metadata !14, i32 188, metadata !37, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !25, i32 188} ; [ DW_TAG_sub
!37 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{null, metadata !39}
!39 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!40 = metadata !{i32 786478, i32 0, metadata !31, metadata !"uint3", metadata !"uint3", metadata !"", metadata !14, i32 188, metadata !41, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !25, i32 188} ; [ DW_TAG_sub
!41 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{null, metadata !39, metadata !43}
!43 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!45 = metadata !{i32 786478, i32 0, metadata !18, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !14, i32 421, metadata !46, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!46 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{metadata !30, metadata !17}
!48 = metadata !{i32 786478, i32 0, metadata !18, metadata !"dim3", metadata !"dim3", metadata !"", metadata !14, i32 415, metadata !49, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !25, i32 415} ; [ DW_TAG_subpr
!49 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = metadata !{null, metadata !17, metadata !51}
!51 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!53 = metadata !{i32 786478, i32 0, metadata !18, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !14, i32 415, metadata !54, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !25, i32 415} ; [ DW_TAG_sub
!54 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !55, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = metadata !{null, metadata !17}
!56 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !14, i32 419, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!57 = metadata !{metadata !58}
!58 = metadata !{metadata !59, metadata !64}
!59 = metadata !{i32 786484, i32 0, metadata !5, metadata !"S", metadata !"S", metadata !"", metadata !6, i32 13, metadata !60, i32 1, i32 1, [8192 x float]* @_ZZ9helloCUDAiE1S} ; [ DW_TAG_variable ] [S] [line 13] [local] [def]
!60 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 262144, i64 32, i32 0, i32 0, metadata !61, metadata !62, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 262144, align 32, offset 0] [from float]
!61 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!62 = metadata !{metadata !63}
!63 = metadata !{i32 786465, i64 0, i64 8191}     ; [ DW_TAG_subrange_type ] [0, 8191]
!64 = metadata !{i32 786484, i32 0, metadata !5, metadata !"F", metadata !"F", metadata !"", metadata !6, i32 14, metadata !65, i32 1, i32 1, [256 x float]* @_ZZ9helloCUDAiE1F} ; [ DW_TAG_variable ] [F] [line 14] [local] [def]
!65 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !61, metadata !66, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 8192, align 32, offset 0] [from float]
!66 = metadata !{metadata !67}
!67 = metadata !{i32 786465, i64 0, i64 255}      ; [ DW_TAG_subrange_type ] [0, 255]
!68 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!69 = metadata !{metadata !70}
!70 = metadata !{metadata !71}
!71 = metadata !{i32 786478, i32 0, metadata !72, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !72, i32 12, metadata !73, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !80, i
!72 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!73 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{metadata !75, metadata !75, metadata !76, metadata !78}
!75 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!76 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !77} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!77 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = metadata !{i32 786454, null, metadata !"size_t", metadata !72, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!79 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!80 = metadata !{metadata !81}
!81 = metadata !{metadata !82, metadata !83, metadata !84, metadata !85, metadata !89}
!82 = metadata !{i32 786689, metadata !71, metadata !"destaddr", metadata !72, i32 16777228, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!83 = metadata !{i32 786689, metadata !71, metadata !"srcaddr", metadata !72, i32 33554444, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!84 = metadata !{i32 786689, metadata !71, metadata !"len", metadata !72, i32 50331660, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!85 = metadata !{i32 786688, metadata !86, metadata !"dest", metadata !72, i32 13, metadata !87, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!86 = metadata !{i32 786443, metadata !71, i32 12, i32 0, metadata !72, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!87 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !88} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!88 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!89 = metadata !{i32 786688, metadata !86, metadata !"src", metadata !72, i32 14, metadata !90, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!90 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !91} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!91 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!92 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!93 = metadata !{metadata !94}
!94 = metadata !{metadata !95}
!95 = metadata !{i32 786478, i32 0, metadata !96, metadata !"memmove", metadata !"memmove", metadata !"", metadata !96, i32 12, metadata !97, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !100, i32 12} ; [ DW_TAG_sub
!96 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!97 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !98, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!98 = metadata !{metadata !75, metadata !75, metadata !76, metadata !99}
!99 = metadata !{i32 786454, null, metadata !"size_t", metadata !96, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!100 = metadata !{metadata !101}
!101 = metadata !{metadata !102, metadata !103, metadata !104, metadata !105, metadata !107}
!102 = metadata !{i32 786689, metadata !95, metadata !"dst", metadata !96, i32 16777228, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!103 = metadata !{i32 786689, metadata !95, metadata !"src", metadata !96, i32 33554444, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!104 = metadata !{i32 786689, metadata !95, metadata !"count", metadata !96, i32 50331660, metadata !99, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!105 = metadata !{i32 786688, metadata !106, metadata !"a", metadata !96, i32 14, metadata !87, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!106 = metadata !{i32 786443, metadata !95, i32 12, i32 0, metadata !96, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/
!107 = metadata !{i32 786688, metadata !106, metadata !"b", metadata !96, i32 15, metadata !90, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!108 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!109 = metadata !{metadata !110}
!110 = metadata !{metadata !111}
!111 = metadata !{i32 786478, i32 0, metadata !112, metadata !"memset", metadata !"memset", metadata !"", metadata !112, i32 12, metadata !113, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !116, i32 12} ; [ DW_TAG_s
!112 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!113 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !114, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!114 = metadata !{metadata !75, metadata !75, metadata !9, metadata !115}
!115 = metadata !{i32 786454, null, metadata !"size_t", metadata !112, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!116 = metadata !{metadata !117}
!117 = metadata !{metadata !118, metadata !119, metadata !120, metadata !121}
!118 = metadata !{i32 786689, metadata !111, metadata !"dst", metadata !112, i32 16777228, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!119 = metadata !{i32 786689, metadata !111, metadata !"s", metadata !112, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!120 = metadata !{i32 786689, metadata !111, metadata !"count", metadata !112, i32 50331660, metadata !115, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!121 = metadata !{i32 786688, metadata !122, metadata !"a", metadata !112, i32 13, metadata !123, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!122 = metadata !{i32 786443, metadata !111, i32 12, i32 0, metadata !112, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!123 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !124} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!124 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!125 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaThreadManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clan
!126 = metadata !{metadata !127}
!127 = metadata !{metadata !128, metadata !203, metadata !209}
!128 = metadata !{i32 786436, null, metadata !"cudaError", metadata !129, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !130, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!129 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!130 = metadata !{metadata !131, metadata !132, metadata !133, metadata !134, metadata !135, metadata !136, metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !1
!131 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!132 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!133 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!134 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!135 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!136 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!137 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!138 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!139 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!140 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!141 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!142 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!143 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!144 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!145 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!146 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!147 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!148 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!149 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!150 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!151 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!152 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!153 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!154 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!155 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!156 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!157 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!158 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!159 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!160 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!161 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!162 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!163 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!164 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!165 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!166 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!167 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!168 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!169 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!170 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!171 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!172 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!173 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!174 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!175 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!176 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!177 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!178 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!179 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!180 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!181 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!182 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!183 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!184 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!185 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!186 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!187 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!188 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!189 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!190 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!191 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!192 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!193 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!194 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!195 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!196 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!197 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!198 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!199 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!200 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!201 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!202 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!203 = metadata !{i32 786436, null, metadata !"cudaFuncCache", metadata !129, i32 1007, i64 32, i64 32, i32 0, i32 0, null, metadata !204, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaFuncCache] [line 1007, size 32, align 32, offset 0] [from ]
!204 = metadata !{metadata !205, metadata !206, metadata !207, metadata !208}
!205 = metadata !{i32 786472, metadata !"cudaFuncCachePreferNone", i64 0} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferNone :: 0]
!206 = metadata !{i32 786472, metadata !"cudaFuncCachePreferShared", i64 1} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferShared :: 1]
!207 = metadata !{i32 786472, metadata !"cudaFuncCachePreferL1", i64 2} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferL1 :: 2]
!208 = metadata !{i32 786472, metadata !"cudaFuncCachePreferEqual", i64 3} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferEqual :: 3]
!209 = metadata !{i32 786436, null, metadata !"cudaLimit", metadata !129, i32 1040, i64 32, i64 32, i32 0, i32 0, null, metadata !210, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaLimit] [line 1040, size 32, align 32, offset 0] [from ]
!210 = metadata !{metadata !211, metadata !212, metadata !213, metadata !214, metadata !215}
!211 = metadata !{i32 786472, metadata !"cudaLimitStackSize", i64 0} ; [ DW_TAG_enumerator ] [cudaLimitStackSize :: 0]
!212 = metadata !{i32 786472, metadata !"cudaLimitPrintfFifoSize", i64 1} ; [ DW_TAG_enumerator ] [cudaLimitPrintfFifoSize :: 1]
!213 = metadata !{i32 786472, metadata !"cudaLimitMallocHeapSize", i64 2} ; [ DW_TAG_enumerator ] [cudaLimitMallocHeapSize :: 2]
!214 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimeSyncDepth", i64 3} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimeSyncDepth :: 3]
!215 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimePendingLaunchCount", i64 4} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimePendingLaunchCount :: 4]
!216 = metadata !{metadata !217}
!217 = metadata !{metadata !218, metadata !223, metadata !230, metadata !239, metadata !245, metadata !252}
!218 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaThreadExit", metadata !"cudaThreadExit", metadata !"", metadata !219, i32 13, metadata !220, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaThreadExit, null, null, 
!219 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaThreadManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!220 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !221, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!221 = metadata !{metadata !222}
!222 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !219, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !128} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!223 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaThreadGetCacheConfig", metadata !"cudaThreadGetCacheConfig", metadata !"", metadata !219, i32 17, metadata !224, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cuda
!224 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !225, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!225 = metadata !{metadata !222, metadata !226}
!226 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !203} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaFuncCache]
!227 = metadata !{metadata !228}
!228 = metadata !{metadata !229}
!229 = metadata !{i32 786689, metadata !223, metadata !"pCacheConfig", metadata !219, i32 16777233, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 17]
!230 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaThreadGetLimit", metadata !"cudaThreadGetLimit", metadata !"", metadata !219, i32 21, metadata !231, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaThreadG
!231 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !232, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!232 = metadata !{metadata !222, metadata !233, metadata !209}
!233 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !234} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!234 = metadata !{i32 786454, null, metadata !"size_t", metadata !219, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!235 = metadata !{metadata !236}
!236 = metadata !{metadata !237, metadata !238}
!237 = metadata !{i32 786689, metadata !230, metadata !"pValue", metadata !219, i32 16777237, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 21]
!238 = metadata !{i32 786689, metadata !230, metadata !"limit", metadata !219, i32 33554453, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 21]
!239 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaThreadSetCacheConfig", metadata !"cudaThreadSetCacheConfig", metadata !"", metadata !219, i32 25, metadata !240, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaT
!240 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !241, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!241 = metadata !{metadata !222, metadata !203}
!242 = metadata !{metadata !243}
!243 = metadata !{metadata !244}
!244 = metadata !{i32 786689, metadata !239, metadata !"cacheConfig", metadata !219, i32 16777241, metadata !203, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 25]
!245 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaThreadSetLimit", metadata !"cudaThreadSetLimit", metadata !"", metadata !219, i32 29, metadata !246, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaThreadSe
!246 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !247, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!247 = metadata !{metadata !222, metadata !209, metadata !234}
!248 = metadata !{metadata !249}
!249 = metadata !{metadata !250, metadata !251}
!250 = metadata !{i32 786689, metadata !245, metadata !"limit", metadata !219, i32 16777245, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 29]
!251 = metadata !{i32 786689, metadata !245, metadata !"value", metadata !219, i32 33554461, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 29]
!252 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaThreadSynchronize", metadata !"cudaThreadSynchronize", metadata !"", metadata !219, i32 33, metadata !220, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaThreadSync
!253 = metadata !{i32 19, i32 0, metadata !254, null}
!254 = metadata !{i32 786443, metadata !255, i32 19, i32 0, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/103_misc1/main.cpp]
!255 = metadata !{i32 786443, metadata !5, i32 11, i32 0, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/103_misc1/main.cpp]
!256 = metadata !{i32 25, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !254, i32 24, i32 0, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/103_misc1/main.cpp]
!258 = metadata !{i32 26, i32 0, metadata !259, null}
!259 = metadata !{i32 786443, metadata !257, i32 25, i32 0, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/103_misc1/main.cpp]
!260 = metadata !{i32 27, i32 0, metadata !259, null}
!261 = metadata !{i32 28, i32 0, metadata !259, null}
!262 = metadata !{i32 22, i32 0, metadata !254, null}
!263 = metadata !{i32 31, i32 0, metadata !255, null}
!264 = metadata !{i32 33, i32 0, metadata !265, null}
!265 = metadata !{i32 786443, metadata !266, i32 33, i32 0, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/103_misc1/main.cpp]
!266 = metadata !{i32 786443, metadata !10, i32 32, i32 0, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/103_misc1/main.cpp]
!267 = metadata !{i32 35, i32 0, metadata !265, null}
!268 = metadata !{i32 39, i32 0, metadata !266, null}
!269 = metadata !{i32 41, i32 0, metadata !266, null}
!270 = metadata !{i32 419, i32 0, metadata !13, null}
!271 = metadata !{i32 419, i32 0, metadata !56, null}
!272 = metadata !{i32 419, i32 0, metadata !273, null}
!273 = metadata !{i32 786443, metadata !56, i32 419, i32 0, metadata !14, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/103_misc1//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!274 = metadata !{i32 16, i32 0, metadata !86, null}
!275 = metadata !{i32 17, i32 0, metadata !86, null}
!276 = metadata !{metadata !"omnipotent char", metadata !277}
!277 = metadata !{metadata !"Simple C/C++ TBAA"}
!278 = metadata !{i32 18, i32 0, metadata !86, null}
!279 = metadata !{i32 14, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !218, i32 13, i32 0, metadata !219, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!281 = metadata !{i32 18, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !223, i32 17, i32 0, metadata !219, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!283 = metadata !{i32 22, i32 0, metadata !284, null}
!284 = metadata !{i32 786443, metadata !230, i32 21, i32 0, metadata !219, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!285 = metadata !{i32 26, i32 0, metadata !286, null}
!286 = metadata !{i32 786443, metadata !239, i32 25, i32 0, metadata !219, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!287 = metadata !{i32 30, i32 0, metadata !288, null}
!288 = metadata !{i32 786443, metadata !245, i32 29, i32 0, metadata !219, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!289 = metadata !{i32 34, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !252, i32 33, i32 0, metadata !219, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
