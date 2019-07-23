; ModuleID = 'main'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

@_ZZ3foovE1a = internal global i32 0, section "__shared__", align 4
@threadIdx = external global %struct.dim3

define void @_Z3foov() nounwind uwtable noinline {
  %1 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !245
  store i32 %1, i32* @_ZZ3foovE1a, align 4, !dbg !245
  ret void, !dbg !247
}

define i32 @main() uwtable {
  %1 = alloca %struct.dim3, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca { i64, i32 }
  %4 = alloca { i64, i32 }
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %1, i32 4, i32 1, i32 1), !dbg !248
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 4, i32 1, i32 1), !dbg !248
  %5 = bitcast { i64, i32 }* %3 to i8*, !dbg !248
  %6 = bitcast %struct.dim3* %1 to i8*, !dbg !248
  %7 = call i8* @memcpy(i8* %5, i8* %6, i64 12)
  %8 = getelementptr { i64, i32 }* %3, i32 0, i32 0, !dbg !248
  %9 = load i64* %8, align 1, !dbg !248
  %10 = getelementptr { i64, i32 }* %3, i32 0, i32 1, !dbg !248
  %11 = load i32* %10, align 1, !dbg !248
  %12 = bitcast { i64, i32 }* %4 to i8*, !dbg !248
  %13 = bitcast %struct.dim3* %2 to i8*, !dbg !248
  %14 = call i8* @memcpy(i8* %12, i8* %13, i64 12)
  %15 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !248
  %16 = load i64* %15, align 1, !dbg !248
  %17 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !248
  %18 = load i32* %17, align 1, !dbg !248
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %9, i32 %11, i64 %16, i32 %18), !dbg !248
  call void @_Z3foov(), !dbg !251
  %19 = call i32 @cudaThreadSynchronize(), !dbg !252
  ret i32 0, !dbg !253
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
  %6 = load i32* %2, align 4, !dbg !254
  %7 = load i32* %3, align 4, !dbg !254
  %8 = load i32* %4, align 4, !dbg !254
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !254
  ret void, !dbg !254
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !255
  %7 = load i32* %2, align 4, !dbg !255
  store i32 %7, i32* %6, align 4, !dbg !255
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !255
  %9 = load i32* %3, align 4, !dbg !255
  store i32 %9, i32* %8, align 4, !dbg !255
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !255
  %11 = load i32* %4, align 4, !dbg !255
  store i32 %11, i32* %10, align 4, !dbg !255
  ret void, !dbg !256
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !258
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !258

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !258
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !259
  %4 = load i8* %src.06, align 1, !dbg !259, !tbaa !260
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !259
  store i8 %4, i8* %dest.05, align 1, !dbg !259, !tbaa !260
  %6 = icmp eq i64 %2, 0, !dbg !258
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !258

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !262
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @cudaThreadExit() nounwind uwtable readnone {
  ret i32 0, !dbg !263
}

define i32 @cudaThreadGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !265
}

define i32 @cudaThreadGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
  ret i32 0, !dbg !267
}

define i32 @cudaThreadSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !269
}

define i32 @cudaThreadSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
  ret i32 0, !dbg !271
}

define i32 @cudaThreadSynchronize() nounwind uwtable readnone {
  ret i32 0, !dbg !273
}

!llvm.dbg.cu = !{!0, !60, !84, !100, !117}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/085_shared_int", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !9, metadata !13, metadata !56}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"foo", metadata !"foo", metadata !"_Z3foov", metadata !6, i32 8, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_Z3foov, null, null, metadata !1, i32 8} ; [ DW_TA
!6 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/085_shared_int", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null}
!9 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !1, i32 15} ; [ DW_TAG_subp
!10 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !14, i32 419, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!14 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/085_shared_int", null} ; [ DW_TAG_file_type ]
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
!58 = metadata !{metadata !59}
!59 = metadata !{i32 786484, i32 0, metadata !5, metadata !"a", metadata !"a", metadata !"", metadata !6, i32 10, metadata !12, i32 1, i32 1, i32* @_ZZ3foovE1a} ; [ DW_TAG_variable ] [a] [line 10] [local] [def]
!60 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!61 = metadata !{metadata !62}
!62 = metadata !{metadata !63}
!63 = metadata !{i32 786478, i32 0, metadata !64, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !64, i32 12, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !72, i
!64 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!65 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !67, metadata !67, metadata !68, metadata !70}
!67 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!68 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!69 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{i32 786454, null, metadata !"size_t", metadata !64, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!71 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!72 = metadata !{metadata !73}
!73 = metadata !{metadata !74, metadata !75, metadata !76, metadata !77, metadata !81}
!74 = metadata !{i32 786689, metadata !63, metadata !"destaddr", metadata !64, i32 16777228, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!75 = metadata !{i32 786689, metadata !63, metadata !"srcaddr", metadata !64, i32 33554444, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!76 = metadata !{i32 786689, metadata !63, metadata !"len", metadata !64, i32 50331660, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!77 = metadata !{i32 786688, metadata !78, metadata !"dest", metadata !64, i32 13, metadata !79, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!78 = metadata !{i32 786443, metadata !63, i32 12, i32 0, metadata !64, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!79 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!80 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!81 = metadata !{i32 786688, metadata !78, metadata !"src", metadata !64, i32 14, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!82 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !83} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!83 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !80} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!84 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!85 = metadata !{metadata !86}
!86 = metadata !{metadata !87}
!87 = metadata !{i32 786478, i32 0, metadata !88, metadata !"memmove", metadata !"memmove", metadata !"", metadata !88, i32 12, metadata !89, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !92, i32 12} ; [ DW_TAG_subp
!88 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!89 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !90, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!90 = metadata !{metadata !67, metadata !67, metadata !68, metadata !91}
!91 = metadata !{i32 786454, null, metadata !"size_t", metadata !88, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!92 = metadata !{metadata !93}
!93 = metadata !{metadata !94, metadata !95, metadata !96, metadata !97, metadata !99}
!94 = metadata !{i32 786689, metadata !87, metadata !"dst", metadata !88, i32 16777228, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!95 = metadata !{i32 786689, metadata !87, metadata !"src", metadata !88, i32 33554444, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!96 = metadata !{i32 786689, metadata !87, metadata !"count", metadata !88, i32 50331660, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!97 = metadata !{i32 786688, metadata !98, metadata !"a", metadata !88, i32 14, metadata !79, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!98 = metadata !{i32 786443, metadata !87, i32 12, i32 0, metadata !88, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!99 = metadata !{i32 786688, metadata !98, metadata !"b", metadata !88, i32 15, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!100 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!101 = metadata !{metadata !102}
!102 = metadata !{metadata !103}
!103 = metadata !{i32 786478, i32 0, metadata !104, metadata !"memset", metadata !"memset", metadata !"", metadata !104, i32 12, metadata !105, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !108, i32 12} ; [ DW_TAG_s
!104 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!105 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !106, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!106 = metadata !{metadata !67, metadata !67, metadata !12, metadata !107}
!107 = metadata !{i32 786454, null, metadata !"size_t", metadata !104, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!108 = metadata !{metadata !109}
!109 = metadata !{metadata !110, metadata !111, metadata !112, metadata !113}
!110 = metadata !{i32 786689, metadata !103, metadata !"dst", metadata !104, i32 16777228, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!111 = metadata !{i32 786689, metadata !103, metadata !"s", metadata !104, i32 33554444, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!112 = metadata !{i32 786689, metadata !103, metadata !"count", metadata !104, i32 50331660, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!113 = metadata !{i32 786688, metadata !114, metadata !"a", metadata !104, i32 13, metadata !115, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!114 = metadata !{i32 786443, metadata !103, i32 12, i32 0, metadata !104, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!115 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !116} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!116 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !80} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!117 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaThreadManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clan
!118 = metadata !{metadata !119}
!119 = metadata !{metadata !120, metadata !195, metadata !201}
!120 = metadata !{i32 786436, null, metadata !"cudaError", metadata !121, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !122, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!121 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!122 = metadata !{metadata !123, metadata !124, metadata !125, metadata !126, metadata !127, metadata !128, metadata !129, metadata !130, metadata !131, metadata !132, metadata !133, metadata !134, metadata !135, metadata !136, metadata !137, metadata !1
!123 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!124 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!125 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!126 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!127 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!128 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!129 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!130 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!131 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!132 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!133 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!134 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!135 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!136 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!137 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!138 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!139 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!140 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!141 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!142 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!143 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!144 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!145 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!146 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!147 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!148 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!149 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!150 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!151 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!152 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!153 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!154 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!155 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!156 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!157 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!158 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!159 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!160 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!161 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!162 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!163 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!164 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!165 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!166 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!167 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!168 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!169 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!170 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!171 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!172 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!173 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!174 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!175 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!176 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!177 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!178 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!179 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!180 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!181 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!182 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!183 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!184 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!185 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!186 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!187 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!188 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!189 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!190 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!191 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!192 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!193 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!194 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!195 = metadata !{i32 786436, null, metadata !"cudaFuncCache", metadata !121, i32 1007, i64 32, i64 32, i32 0, i32 0, null, metadata !196, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaFuncCache] [line 1007, size 32, align 32, offset 0] [from ]
!196 = metadata !{metadata !197, metadata !198, metadata !199, metadata !200}
!197 = metadata !{i32 786472, metadata !"cudaFuncCachePreferNone", i64 0} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferNone :: 0]
!198 = metadata !{i32 786472, metadata !"cudaFuncCachePreferShared", i64 1} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferShared :: 1]
!199 = metadata !{i32 786472, metadata !"cudaFuncCachePreferL1", i64 2} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferL1 :: 2]
!200 = metadata !{i32 786472, metadata !"cudaFuncCachePreferEqual", i64 3} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferEqual :: 3]
!201 = metadata !{i32 786436, null, metadata !"cudaLimit", metadata !121, i32 1040, i64 32, i64 32, i32 0, i32 0, null, metadata !202, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaLimit] [line 1040, size 32, align 32, offset 0] [from ]
!202 = metadata !{metadata !203, metadata !204, metadata !205, metadata !206, metadata !207}
!203 = metadata !{i32 786472, metadata !"cudaLimitStackSize", i64 0} ; [ DW_TAG_enumerator ] [cudaLimitStackSize :: 0]
!204 = metadata !{i32 786472, metadata !"cudaLimitPrintfFifoSize", i64 1} ; [ DW_TAG_enumerator ] [cudaLimitPrintfFifoSize :: 1]
!205 = metadata !{i32 786472, metadata !"cudaLimitMallocHeapSize", i64 2} ; [ DW_TAG_enumerator ] [cudaLimitMallocHeapSize :: 2]
!206 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimeSyncDepth", i64 3} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimeSyncDepth :: 3]
!207 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimePendingLaunchCount", i64 4} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimePendingLaunchCount :: 4]
!208 = metadata !{metadata !209}
!209 = metadata !{metadata !210, metadata !215, metadata !222, metadata !231, metadata !237, metadata !244}
!210 = metadata !{i32 786478, i32 0, metadata !211, metadata !"cudaThreadExit", metadata !"cudaThreadExit", metadata !"", metadata !211, i32 13, metadata !212, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaThreadExit, null, null, 
!211 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaThreadManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!212 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !213, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!213 = metadata !{metadata !214}
!214 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !211, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !120} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!215 = metadata !{i32 786478, i32 0, metadata !211, metadata !"cudaThreadGetCacheConfig", metadata !"cudaThreadGetCacheConfig", metadata !"", metadata !211, i32 17, metadata !216, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cuda
!216 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !217, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!217 = metadata !{metadata !214, metadata !218}
!218 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !195} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaFuncCache]
!219 = metadata !{metadata !220}
!220 = metadata !{metadata !221}
!221 = metadata !{i32 786689, metadata !215, metadata !"pCacheConfig", metadata !211, i32 16777233, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 17]
!222 = metadata !{i32 786478, i32 0, metadata !211, metadata !"cudaThreadGetLimit", metadata !"cudaThreadGetLimit", metadata !"", metadata !211, i32 21, metadata !223, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaThreadG
!223 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !224, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!224 = metadata !{metadata !214, metadata !225, metadata !201}
!225 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !226} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!226 = metadata !{i32 786454, null, metadata !"size_t", metadata !211, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!227 = metadata !{metadata !228}
!228 = metadata !{metadata !229, metadata !230}
!229 = metadata !{i32 786689, metadata !222, metadata !"pValue", metadata !211, i32 16777237, metadata !225, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 21]
!230 = metadata !{i32 786689, metadata !222, metadata !"limit", metadata !211, i32 33554453, metadata !201, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 21]
!231 = metadata !{i32 786478, i32 0, metadata !211, metadata !"cudaThreadSetCacheConfig", metadata !"cudaThreadSetCacheConfig", metadata !"", metadata !211, i32 25, metadata !232, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaT
!232 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !233, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!233 = metadata !{metadata !214, metadata !195}
!234 = metadata !{metadata !235}
!235 = metadata !{metadata !236}
!236 = metadata !{i32 786689, metadata !231, metadata !"cacheConfig", metadata !211, i32 16777241, metadata !195, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 25]
!237 = metadata !{i32 786478, i32 0, metadata !211, metadata !"cudaThreadSetLimit", metadata !"cudaThreadSetLimit", metadata !"", metadata !211, i32 29, metadata !238, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaThreadSe
!238 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !239, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!239 = metadata !{metadata !214, metadata !201, metadata !226}
!240 = metadata !{metadata !241}
!241 = metadata !{metadata !242, metadata !243}
!242 = metadata !{i32 786689, metadata !237, metadata !"limit", metadata !211, i32 16777245, metadata !201, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 29]
!243 = metadata !{i32 786689, metadata !237, metadata !"value", metadata !211, i32 33554461, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 29]
!244 = metadata !{i32 786478, i32 0, metadata !211, metadata !"cudaThreadSynchronize", metadata !"cudaThreadSynchronize", metadata !"", metadata !211, i32 33, metadata !212, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaThreadSync
!245 = metadata !{i32 12, i32 0, metadata !246, null}
!246 = metadata !{i32 786443, metadata !5, i32 8, i32 0, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/085_shared_int/main.cpp]
!247 = metadata !{i32 13, i32 0, metadata !246, null}
!248 = metadata !{i32 16, i32 0, metadata !249, null}
!249 = metadata !{i32 786443, metadata !250, i32 16, i32 0, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/085_shared_int/main.cpp]
!250 = metadata !{i32 786443, metadata !9, i32 15, i32 0, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/085_shared_int/main.cpp]
!251 = metadata !{i32 18, i32 0, metadata !249, null}
!252 = metadata !{i32 22, i32 0, metadata !250, null}
!253 = metadata !{i32 24, i32 0, metadata !250, null}
!254 = metadata !{i32 419, i32 0, metadata !13, null}
!255 = metadata !{i32 419, i32 0, metadata !56, null}
!256 = metadata !{i32 419, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !56, i32 419, i32 0, metadata !14, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/085_shared_int//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!258 = metadata !{i32 16, i32 0, metadata !78, null}
!259 = metadata !{i32 17, i32 0, metadata !78, null}
!260 = metadata !{metadata !"omnipotent char", metadata !261}
!261 = metadata !{metadata !"Simple C/C++ TBAA"}
!262 = metadata !{i32 18, i32 0, metadata !78, null}
!263 = metadata !{i32 14, i32 0, metadata !264, null}
!264 = metadata !{i32 786443, metadata !210, i32 13, i32 0, metadata !211, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!265 = metadata !{i32 18, i32 0, metadata !266, null}
!266 = metadata !{i32 786443, metadata !215, i32 17, i32 0, metadata !211, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!267 = metadata !{i32 22, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !222, i32 21, i32 0, metadata !211, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!269 = metadata !{i32 26, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !231, i32 25, i32 0, metadata !211, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!271 = metadata !{i32 30, i32 0, metadata !272, null}
!272 = metadata !{i32 786443, metadata !237, i32 29, i32 0, metadata !211, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!273 = metadata !{i32 34, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !244, i32 33, i32 0, metadata !211, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
