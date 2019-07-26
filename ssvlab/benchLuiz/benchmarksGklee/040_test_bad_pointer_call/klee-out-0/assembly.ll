; ModuleID = 'main'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

@_ZZ3fooPiE1A = internal global [10 x i32] zeroinitializer, section "__shared__", align 16

define void @_Z3barPi(i32* %q) nounwind uwtable section "__device__" {
  %1 = alloca i32*, align 8
  store i32* %q, i32** %1, align 8
  ret void, !dbg !250
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @_Z3fooPi(i32* %p) nounwind uwtable noinline {
  %1 = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  %2 = load i32** %1, align 8, !dbg !252
  call void @_Z3barPi(i32* %2), !dbg !252
  call void @_Z3barPi(i32* getelementptr inbounds ([10 x i32]* @_ZZ3fooPiE1A, i32 0, i32 0)), !dbg !254
  ret void, !dbg !255
}

define i32 @main() uwtable {
  %a = alloca i32*, align 8
  %1 = alloca %struct.dim3, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca { i64, i32 }
  %4 = alloca { i64, i32 }
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %1, i32 2, i32 1, i32 1), !dbg !256
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 2, i32 1, i32 1), !dbg !256
  %5 = bitcast { i64, i32 }* %3 to i8*, !dbg !256
  %6 = bitcast %struct.dim3* %1 to i8*, !dbg !256
  %7 = call i8* @memcpy(i8* %5, i8* %6, i64 12)
  %8 = getelementptr { i64, i32 }* %3, i32 0, i32 0, !dbg !256
  %9 = load i64* %8, align 1, !dbg !256
  %10 = getelementptr { i64, i32 }* %3, i32 0, i32 1, !dbg !256
  %11 = load i32* %10, align 1, !dbg !256
  %12 = bitcast { i64, i32 }* %4 to i8*, !dbg !256
  %13 = bitcast %struct.dim3* %2 to i8*, !dbg !256
  %14 = call i8* @memcpy(i8* %12, i8* %13, i64 12)
  %15 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !256
  %16 = load i64* %15, align 1, !dbg !256
  %17 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !256
  %18 = load i32* %17, align 1, !dbg !256
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %9, i32 %11, i64 %16, i32 %18), !dbg !256
  %19 = load i32** %a, align 8, !dbg !259
  call void @_Z3fooPi(i32* %19), !dbg !259
  %20 = call i32 @cudaThreadSynchronize(), !dbg !260
  ret i32 0, !dbg !261
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
  %6 = load i32* %2, align 4, !dbg !262
  %7 = load i32* %3, align 4, !dbg !262
  %8 = load i32* %4, align 4, !dbg !262
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !262
  ret void, !dbg !262
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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !263
  %7 = load i32* %2, align 4, !dbg !263
  store i32 %7, i32* %6, align 4, !dbg !263
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !263
  %9 = load i32* %3, align 4, !dbg !263
  store i32 %9, i32* %8, align 4, !dbg !263
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !263
  %11 = load i32* %4, align 4, !dbg !263
  store i32 %11, i32* %10, align 4, !dbg !263
  ret void, !dbg !264
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !266
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !266

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !266
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !267
  %4 = load i8* %src.06, align 1, !dbg !267, !tbaa !268
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !267
  store i8 %4, i8* %dest.05, align 1, !dbg !267, !tbaa !268
  %6 = icmp eq i64 %2, 0, !dbg !266
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !266

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !270
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @cudaThreadExit() nounwind uwtable readnone {
  ret i32 0, !dbg !271
}

define i32 @cudaThreadGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !273
}

define i32 @cudaThreadGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
  ret i32 0, !dbg !275
}

define i32 @cudaThreadSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !277
}

define i32 @cudaThreadSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
  ret i32 0, !dbg !279
}

define i32 @cudaThreadSynchronize() nounwind uwtable readnone {
  ret i32 0, !dbg !281
}

!llvm.dbg.cu = !{!0, !65, !89, !105, !122}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/040_test_bad_pointer_call", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !11, metadata !12, metadata !15, metadata !58}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"bar", metadata !"bar", metadata !"_Z3barPi", metadata !6, i32 8, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @_Z3barPi, null, null, metadata !1, i32 8} ; [
!6 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/040_test_bad_pointer_call", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!10 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = metadata !{i32 786478, i32 0, metadata !6, metadata !"foo", metadata !"foo", metadata !"_Z3fooPi", metadata !6, i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @_Z3fooPi, null, null, metadata !1, i32 12} 
!12 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 22, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !1, i32 22} ; [ DW_TAG_sub
!13 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !10}
!15 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !16, i32 419, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!16 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/040_test_bad_pointer_call", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19, metadata !23, metadata !23, metadata !23}
!19 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!20 = metadata !{i32 786451, null, metadata !"dim3", metadata !16, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !21, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!21 = metadata !{metadata !22, metadata !24, metadata !25, metadata !26, metadata !29, metadata !47, metadata !50, metadata !55}
!22 = metadata !{i32 786445, metadata !20, metadata !"x", metadata !16, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !23} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!23 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!24 = metadata !{i32 786445, metadata !20, metadata !"y", metadata !16, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !23} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!25 = metadata !{i32 786445, metadata !20, metadata !"z", metadata !16, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !23} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!26 = metadata !{i32 786478, i32 0, metadata !20, metadata !"dim3", metadata !"dim3", metadata !"", metadata !16, i32 419, metadata !17, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !27, i32 419} ; [ DW_TAG_subpr
!27 = metadata !{metadata !28}
!28 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!29 = metadata !{i32 786478, i32 0, metadata !20, metadata !"dim3", metadata !"dim3", metadata !"", metadata !16, i32 420, metadata !30, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !27, i32 420} ; [ DW_TAG_subpr
!30 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{null, metadata !19, metadata !32}
!32 = metadata !{i32 786454, null, metadata !"uint3", metadata !16, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!33 = metadata !{i32 786451, null, metadata !"uint3", metadata !16, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !34, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!34 = metadata !{metadata !35, metadata !36, metadata !37, metadata !38, metadata !42}
!35 = metadata !{i32 786445, metadata !33, metadata !"x", metadata !16, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !23} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!36 = metadata !{i32 786445, metadata !33, metadata !"y", metadata !16, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !23} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!37 = metadata !{i32 786445, metadata !33, metadata !"z", metadata !16, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !23} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!38 = metadata !{i32 786478, i32 0, metadata !33, metadata !"uint3", metadata !"uint3", metadata !"", metadata !16, i32 188, metadata !39, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !27, i32 188} ; [ DW_TAG_sub
!39 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{null, metadata !41}
!41 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!42 = metadata !{i32 786478, i32 0, metadata !33, metadata !"uint3", metadata !"uint3", metadata !"", metadata !16, i32 188, metadata !43, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !27, i32 188} ; [ DW_TAG_sub
!43 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = metadata !{null, metadata !41, metadata !45}
!45 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!47 = metadata !{i32 786478, i32 0, metadata !20, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !16, i32 421, metadata !48, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!48 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{metadata !32, metadata !19}
!50 = metadata !{i32 786478, i32 0, metadata !20, metadata !"dim3", metadata !"dim3", metadata !"", metadata !16, i32 415, metadata !51, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !27, i32 415} ; [ DW_TAG_subpr
!51 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{null, metadata !19, metadata !53}
!53 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !54} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!55 = metadata !{i32 786478, i32 0, metadata !20, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !16, i32 415, metadata !56, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !27, i32 415} ; [ DW_TAG_sub
!56 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !57, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!57 = metadata !{null, metadata !19}
!58 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !16, i32 419, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!59 = metadata !{metadata !60}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786484, i32 0, metadata !11, metadata !"A", metadata !"A", metadata !"", metadata !6, i32 14, metadata !62, i32 1, i32 1, [10 x i32]* @_ZZ3fooPiE1A} ; [ DW_TAG_variable ] [A] [line 14] [local] [def]
!62 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 320, i64 32, i32 0, i32 0, metadata !10, metadata !63, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 320, align 32, offset 0] [from int]
!63 = metadata !{metadata !64}
!64 = metadata !{i32 786465, i64 0, i64 9}        ; [ DW_TAG_subrange_type ] [0, 9]
!65 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!66 = metadata !{metadata !67}
!67 = metadata !{metadata !68}
!68 = metadata !{i32 786478, i32 0, metadata !69, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !69, i32 12, metadata !70, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !77, i
!69 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!70 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = metadata !{metadata !72, metadata !72, metadata !73, metadata !75}
!72 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!73 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !74} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!74 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = metadata !{i32 786454, null, metadata !"size_t", metadata !69, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!76 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!77 = metadata !{metadata !78}
!78 = metadata !{metadata !79, metadata !80, metadata !81, metadata !82, metadata !86}
!79 = metadata !{i32 786689, metadata !68, metadata !"destaddr", metadata !69, i32 16777228, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!80 = metadata !{i32 786689, metadata !68, metadata !"srcaddr", metadata !69, i32 33554444, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!81 = metadata !{i32 786689, metadata !68, metadata !"len", metadata !69, i32 50331660, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!82 = metadata !{i32 786688, metadata !83, metadata !"dest", metadata !69, i32 13, metadata !84, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!83 = metadata !{i32 786443, metadata !68, i32 12, i32 0, metadata !69, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!84 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !85} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!85 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!86 = metadata !{i32 786688, metadata !83, metadata !"src", metadata !69, i32 14, metadata !87, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!87 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !88} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!88 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!89 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!90 = metadata !{metadata !91}
!91 = metadata !{metadata !92}
!92 = metadata !{i32 786478, i32 0, metadata !93, metadata !"memmove", metadata !"memmove", metadata !"", metadata !93, i32 12, metadata !94, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !97, i32 12} ; [ DW_TAG_subp
!93 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!94 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = metadata !{metadata !72, metadata !72, metadata !73, metadata !96}
!96 = metadata !{i32 786454, null, metadata !"size_t", metadata !93, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!97 = metadata !{metadata !98}
!98 = metadata !{metadata !99, metadata !100, metadata !101, metadata !102, metadata !104}
!99 = metadata !{i32 786689, metadata !92, metadata !"dst", metadata !93, i32 16777228, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!100 = metadata !{i32 786689, metadata !92, metadata !"src", metadata !93, i32 33554444, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!101 = metadata !{i32 786689, metadata !92, metadata !"count", metadata !93, i32 50331660, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!102 = metadata !{i32 786688, metadata !103, metadata !"a", metadata !93, i32 14, metadata !84, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!103 = metadata !{i32 786443, metadata !92, i32 12, i32 0, metadata !93, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/
!104 = metadata !{i32 786688, metadata !103, metadata !"b", metadata !93, i32 15, metadata !87, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!105 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!106 = metadata !{metadata !107}
!107 = metadata !{metadata !108}
!108 = metadata !{i32 786478, i32 0, metadata !109, metadata !"memset", metadata !"memset", metadata !"", metadata !109, i32 12, metadata !110, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !113, i32 12} ; [ DW_TAG_s
!109 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!110 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !111, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!111 = metadata !{metadata !72, metadata !72, metadata !10, metadata !112}
!112 = metadata !{i32 786454, null, metadata !"size_t", metadata !109, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!113 = metadata !{metadata !114}
!114 = metadata !{metadata !115, metadata !116, metadata !117, metadata !118}
!115 = metadata !{i32 786689, metadata !108, metadata !"dst", metadata !109, i32 16777228, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!116 = metadata !{i32 786689, metadata !108, metadata !"s", metadata !109, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!117 = metadata !{i32 786689, metadata !108, metadata !"count", metadata !109, i32 50331660, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!118 = metadata !{i32 786688, metadata !119, metadata !"a", metadata !109, i32 13, metadata !120, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!119 = metadata !{i32 786443, metadata !108, i32 12, i32 0, metadata !109, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!120 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !121} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!121 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!122 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaThreadManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clan
!123 = metadata !{metadata !124}
!124 = metadata !{metadata !125, metadata !200, metadata !206}
!125 = metadata !{i32 786436, null, metadata !"cudaError", metadata !126, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !127, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!126 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!127 = metadata !{metadata !128, metadata !129, metadata !130, metadata !131, metadata !132, metadata !133, metadata !134, metadata !135, metadata !136, metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !1
!128 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!129 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!130 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!131 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!132 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!133 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!134 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!135 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!136 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!137 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!138 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!139 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!140 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!141 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!142 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!143 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!144 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!145 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!146 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!147 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!148 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!149 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!150 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!151 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!152 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!153 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!154 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!155 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!156 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!157 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!158 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!159 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!160 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!161 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!162 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!163 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!164 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!165 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!166 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!167 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!168 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!169 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!170 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!171 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!172 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!173 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!174 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!175 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!176 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!177 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!178 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!179 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!180 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!181 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!182 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!183 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!184 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!185 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!186 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!187 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!188 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!189 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!190 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!191 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!192 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!193 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!194 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!195 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!196 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!197 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!198 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!199 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!200 = metadata !{i32 786436, null, metadata !"cudaFuncCache", metadata !126, i32 1007, i64 32, i64 32, i32 0, i32 0, null, metadata !201, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaFuncCache] [line 1007, size 32, align 32, offset 0] [from ]
!201 = metadata !{metadata !202, metadata !203, metadata !204, metadata !205}
!202 = metadata !{i32 786472, metadata !"cudaFuncCachePreferNone", i64 0} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferNone :: 0]
!203 = metadata !{i32 786472, metadata !"cudaFuncCachePreferShared", i64 1} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferShared :: 1]
!204 = metadata !{i32 786472, metadata !"cudaFuncCachePreferL1", i64 2} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferL1 :: 2]
!205 = metadata !{i32 786472, metadata !"cudaFuncCachePreferEqual", i64 3} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferEqual :: 3]
!206 = metadata !{i32 786436, null, metadata !"cudaLimit", metadata !126, i32 1040, i64 32, i64 32, i32 0, i32 0, null, metadata !207, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaLimit] [line 1040, size 32, align 32, offset 0] [from ]
!207 = metadata !{metadata !208, metadata !209, metadata !210, metadata !211, metadata !212}
!208 = metadata !{i32 786472, metadata !"cudaLimitStackSize", i64 0} ; [ DW_TAG_enumerator ] [cudaLimitStackSize :: 0]
!209 = metadata !{i32 786472, metadata !"cudaLimitPrintfFifoSize", i64 1} ; [ DW_TAG_enumerator ] [cudaLimitPrintfFifoSize :: 1]
!210 = metadata !{i32 786472, metadata !"cudaLimitMallocHeapSize", i64 2} ; [ DW_TAG_enumerator ] [cudaLimitMallocHeapSize :: 2]
!211 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimeSyncDepth", i64 3} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimeSyncDepth :: 3]
!212 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimePendingLaunchCount", i64 4} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimePendingLaunchCount :: 4]
!213 = metadata !{metadata !214}
!214 = metadata !{metadata !215, metadata !220, metadata !227, metadata !236, metadata !242, metadata !249}
!215 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaThreadExit", metadata !"cudaThreadExit", metadata !"", metadata !216, i32 13, metadata !217, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaThreadExit, null, null, 
!216 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaThreadManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!217 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !218, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!218 = metadata !{metadata !219}
!219 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !216, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !125} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!220 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaThreadGetCacheConfig", metadata !"cudaThreadGetCacheConfig", metadata !"", metadata !216, i32 17, metadata !221, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cuda
!221 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !222, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!222 = metadata !{metadata !219, metadata !223}
!223 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !200} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaFuncCache]
!224 = metadata !{metadata !225}
!225 = metadata !{metadata !226}
!226 = metadata !{i32 786689, metadata !220, metadata !"pCacheConfig", metadata !216, i32 16777233, metadata !223, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 17]
!227 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaThreadGetLimit", metadata !"cudaThreadGetLimit", metadata !"", metadata !216, i32 21, metadata !228, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaThreadG
!228 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !229, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!229 = metadata !{metadata !219, metadata !230, metadata !206}
!230 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !231} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!231 = metadata !{i32 786454, null, metadata !"size_t", metadata !216, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!232 = metadata !{metadata !233}
!233 = metadata !{metadata !234, metadata !235}
!234 = metadata !{i32 786689, metadata !227, metadata !"pValue", metadata !216, i32 16777237, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 21]
!235 = metadata !{i32 786689, metadata !227, metadata !"limit", metadata !216, i32 33554453, metadata !206, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 21]
!236 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaThreadSetCacheConfig", metadata !"cudaThreadSetCacheConfig", metadata !"", metadata !216, i32 25, metadata !237, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaT
!237 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !238, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!238 = metadata !{metadata !219, metadata !200}
!239 = metadata !{metadata !240}
!240 = metadata !{metadata !241}
!241 = metadata !{i32 786689, metadata !236, metadata !"cacheConfig", metadata !216, i32 16777241, metadata !200, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 25]
!242 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaThreadSetLimit", metadata !"cudaThreadSetLimit", metadata !"", metadata !216, i32 29, metadata !243, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaThreadSe
!243 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !244, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!244 = metadata !{metadata !219, metadata !206, metadata !231}
!245 = metadata !{metadata !246}
!246 = metadata !{metadata !247, metadata !248}
!247 = metadata !{i32 786689, metadata !242, metadata !"limit", metadata !216, i32 16777245, metadata !206, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 29]
!248 = metadata !{i32 786689, metadata !242, metadata !"value", metadata !216, i32 33554461, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 29]
!249 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaThreadSynchronize", metadata !"cudaThreadSynchronize", metadata !"", metadata !216, i32 33, metadata !217, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaThreadSync
!250 = metadata !{i32 10, i32 0, metadata !251, null}
!251 = metadata !{i32 786443, metadata !5, i32 8, i32 0, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/040_test_bad_pointer_call/main.cpp]
!252 = metadata !{i32 16, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !11, i32 12, i32 0, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/040_test_bad_pointer_call/main.cpp]
!254 = metadata !{i32 18, i32 0, metadata !253, null}
!255 = metadata !{i32 20, i32 0, metadata !253, null}
!256 = metadata !{i32 25, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !258, i32 25, i32 0, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/040_test_bad_pointer_call/main.cpp]
!258 = metadata !{i32 786443, metadata !12, i32 22, i32 0, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/040_test_bad_pointer_call/main.cpp]
!259 = metadata !{i32 27, i32 0, metadata !257, null}
!260 = metadata !{i32 31, i32 0, metadata !258, null}
!261 = metadata !{i32 32, i32 0, metadata !258, null}
!262 = metadata !{i32 419, i32 0, metadata !15, null}
!263 = metadata !{i32 419, i32 0, metadata !58, null}
!264 = metadata !{i32 419, i32 0, metadata !265, null}
!265 = metadata !{i32 786443, metadata !58, i32 419, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/040_test_bad_pointer_call//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_t
!266 = metadata !{i32 16, i32 0, metadata !83, null}
!267 = metadata !{i32 17, i32 0, metadata !83, null}
!268 = metadata !{metadata !"omnipotent char", metadata !269}
!269 = metadata !{metadata !"Simple C/C++ TBAA"}
!270 = metadata !{i32 18, i32 0, metadata !83, null}
!271 = metadata !{i32 14, i32 0, metadata !272, null}
!272 = metadata !{i32 786443, metadata !215, i32 13, i32 0, metadata !216, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!273 = metadata !{i32 18, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !220, i32 17, i32 0, metadata !216, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!275 = metadata !{i32 22, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !227, i32 21, i32 0, metadata !216, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!277 = metadata !{i32 26, i32 0, metadata !278, null}
!278 = metadata !{i32 786443, metadata !236, i32 25, i32 0, metadata !216, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!279 = metadata !{i32 30, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !242, i32 29, i32 0, metadata !216, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!281 = metadata !{i32 34, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !249, i32 33, i32 0, metadata !216, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
