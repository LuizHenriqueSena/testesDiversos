; ModuleID = 'main'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.cudaChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.cudaExtent = type { i64, i64, i64 }
%struct.cudaArray = type opaque
%struct.cudaPitchedPtr = type { i8*, i64, i64, i64 }
%struct.CUstream_st = type opaque
%struct.cudaMemcpy3DParms = type { %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, %struct.cudaExtent, i32 }
%struct.cudaPos = type { i64, i64, i64 }
%struct.cudaMemcpy3DPeerParms = type { %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, i32, %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, i32, %struct.cudaExtent }

@threadIdx = external global %struct.dim3
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c" %d; \00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"c[i]!=2\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define i32* @_Z3barPi(i32* %p) nounwind uwtable section "__device__" {
  %1 = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  %2 = load i32** %1, align 8, !dbg !722
  ret i32* %2, !dbg !722
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @_Z3fooPi(i32* %p) nounwind uwtable noinline {
  %1 = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  %2 = load i32** %1, align 8, !dbg !724
  %3 = call i32* @_Z3barPi(i32* %2), !dbg !724
  %4 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !724
  %5 = zext i32 %4 to i64, !dbg !724
  %6 = getelementptr inbounds i32* %3, i64 %5, !dbg !724
  store i32 2, i32* %6, align 4, !dbg !724
  ret void, !dbg !726
}

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %c = alloca i32*, align 8
  %dev_c = alloca i32*, align 8
  %i = alloca i32, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  %6 = call noalias i8* @malloc(i64 8) nounwind, !dbg !727
  %7 = bitcast i8* %6 to i32*, !dbg !727
  store i32* %7, i32** %c, align 8, !dbg !727
  store i32 0, i32* %i, align 4, !dbg !729
  br label %8, !dbg !729

; <label>:8                                       ; preds = %11, %0
  %9 = load i32* %i, align 4, !dbg !729
  %10 = icmp slt i32 %9, 2, !dbg !729
  br i1 %10, label %11, label %18, !dbg !729

; <label>:11                                      ; preds = %8
  %12 = load i32* %i, align 4, !dbg !731
  %13 = sext i32 %12 to i64, !dbg !731
  %14 = load i32** %c, align 8, !dbg !731
  %15 = getelementptr inbounds i32* %14, i64 %13, !dbg !731
  store i32 1, i32* %15, align 4, !dbg !731
  %16 = load i32* %i, align 4, !dbg !729
  %17 = add nsw i32 %16, 1, !dbg !729
  store i32 %17, i32* %i, align 4, !dbg !729
  br label %8, !dbg !729

; <label>:18                                      ; preds = %8
  %19 = bitcast i32** %dev_c to i8**, !dbg !732
  %20 = call i32 @cudaMalloc(i8** %19, i64 8), !dbg !732
  %21 = load i32** %dev_c, align 8, !dbg !733
  %22 = bitcast i32* %21 to i8*, !dbg !733
  %23 = load i32** %c, align 8, !dbg !733
  %24 = bitcast i32* %23 to i8*, !dbg !733
  %25 = call i32 @cudaMemcpy(i8* %22, i8* %24, i64 8, i32 1), !dbg !733
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !734
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 2, i32 1, i32 1), !dbg !734
  %26 = bitcast { i64, i32 }* %4 to i8*, !dbg !734
  %27 = bitcast %struct.dim3* %2 to i8*, !dbg !734
  %28 = call i8* @memcpy(i8* %26, i8* %27, i64 12)
  %29 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !734
  %30 = load i64* %29, align 1, !dbg !734
  %31 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !734
  %32 = load i32* %31, align 1, !dbg !734
  %33 = bitcast { i64, i32 }* %5 to i8*, !dbg !734
  %34 = bitcast %struct.dim3* %3 to i8*, !dbg !734
  %35 = call i8* @memcpy(i8* %33, i8* %34, i64 12)
  %36 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !734
  %37 = load i64* %36, align 1, !dbg !734
  %38 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !734
  %39 = load i32* %38, align 1, !dbg !734
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %30, i32 %32, i64 %37, i32 %39), !dbg !734
  %40 = load i32** %dev_c, align 8, !dbg !736
  call void @_Z3fooPi(i32* %40), !dbg !736
  %41 = load i32** %c, align 8, !dbg !737
  %42 = bitcast i32* %41 to i8*, !dbg !737
  %43 = load i32** %dev_c, align 8, !dbg !737
  %44 = bitcast i32* %43 to i8*, !dbg !737
  %45 = call i32 @cudaMemcpy(i8* %42, i8* %44, i64 8, i32 2), !dbg !737
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !738
  store i32 0, i32* %i1, align 4, !dbg !739
  br label %47, !dbg !739

; <label>:47                                      ; preds = %64, %18
  %48 = load i32* %i1, align 4, !dbg !739
  %49 = icmp slt i32 %48, 2, !dbg !739
  br i1 %49, label %50, label %67, !dbg !739

; <label>:50                                      ; preds = %47
  %51 = load i32* %i1, align 4, !dbg !741
  %52 = sext i32 %51 to i64, !dbg !741
  %53 = load i32** %c, align 8, !dbg !741
  %54 = getelementptr inbounds i32* %53, i64 %52, !dbg !741
  %55 = load i32* %54, align 4, !dbg !741
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 %55), !dbg !741
  %57 = load i32* %i1, align 4, !dbg !743
  %58 = sext i32 %57 to i64, !dbg !743
  %59 = load i32** %c, align 8, !dbg !743
  %60 = getelementptr inbounds i32* %59, i64 %58, !dbg !743
  %61 = load i32* %60, align 4, !dbg !743
  %62 = icmp ne i32 %61, 2, !dbg !743
  br i1 %62, label %64, label %63, !dbg !743

; <label>:63                                      ; preds = %50
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0), i32 44, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwin
  unreachable, !dbg !743

; <label>:64                                      ; preds = %50
  %65 = load i32* %i1, align 4, !dbg !739
  %66 = add nsw i32 %65, 1, !dbg !739
  store i32 %66, i32* %i1, align 4, !dbg !739
  br label %47, !dbg !739

; <label>:67                                      ; preds = %47
  %68 = load i32** %c, align 8, !dbg !744
  %69 = bitcast i32* %68 to i8*, !dbg !744
  call void @free(i8* %69) nounwind, !dbg !744
  %70 = load i32** %dev_c, align 8, !dbg !745
  %71 = bitcast i32* %70 to i8*, !dbg !745
  %72 = call i32 @cudaFree(i8* %71), !dbg !745
  ret i32 0, !dbg !746
}

declare noalias i8* @malloc(i64) nounwind

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
  %6 = load i32* %2, align 4, !dbg !747
  %7 = load i32* %3, align 4, !dbg !747
  %8 = load i32* %4, align 4, !dbg !747
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !747
  ret void, !dbg !747
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

declare void @free(i8*) nounwind

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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !748
  %7 = load i32* %2, align 4, !dbg !748
  store i32 %7, i32* %6, align 4, !dbg !748
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !748
  %9 = load i32* %3, align 4, !dbg !748
  store i32 %9, i32* %8, align 4, !dbg !748
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !748
  %11 = load i32* %4, align 4, !dbg !748
  store i32 %11, i32* %10, align 4, !dbg !748
  ret void, !dbg !749
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !751
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !751

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !751
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !752
  %4 = load i8* %src.06, align 1, !dbg !752, !tbaa !753
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !752
  store i8 %4, i8* %dest.05, align 1, !dbg !752, !tbaa !753
  %6 = icmp eq i64 %2, 0, !dbg !751
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !751

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !755
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !756
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !756

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !757
  br label %3, !dbg !756

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !756
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !757
  store volatile i8 %2, i8* %a.05, align 1, !dbg !757, !tbaa !753
  %6 = icmp eq i64 %4, 0, !dbg !756
  br i1 %6, label %._crit_edge, label %3, !dbg !756

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !758
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !759
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !761
  ret i32 0, !dbg !763
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !764
  tail call void @free(i8* %1) nounwind, !dbg !764
  ret i32 0, !dbg !766
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !767
  ret i32 0, !dbg !769
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !770
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !772
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !774
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !776
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !778
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !780
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !782
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !784
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !786
  store i8* %1, i8** %devPtr, align 8, !dbg !786, !tbaa !787
  tail call void @__clear_device(), !dbg !788
  ret i32 0, !dbg !789
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !790
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !792
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !794
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !796
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !798
  store i8* %1, i8** %ptr, align 8, !dbg !798, !tbaa !787
  tail call void @__clear_host(), !dbg !799
  ret i32 0, !dbg !800
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !801
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !803
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !805
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !807
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !809
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !811
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !813
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !815
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !817
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !819
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !821
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !823
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !825
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !827
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !829
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !831
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !833
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !835
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !837
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !839
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !841
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !843
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !845
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !847
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !849
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !850
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !852
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !854
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !856
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !857
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !859
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !861
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !863
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !865
}

!llvm.dbg.cu = !{!0, !71, !95, !111, !128}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !21, metadata !24, metadata !27, metadata !70}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"bar", metadata !"bar", metadata !"_Z3barPi", metadata !16, i32 7, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32* (i32*)* @_Z3barPi, null, null, metadata !11, i32 7
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!20 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = metadata !{i32 786478, i32 0, metadata !16, metadata !"foo", metadata !"foo", metadata !"_Z3fooPi", metadata !16, i32 13, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @_Z3fooPi, null, null, metadata !11, i32 
!22 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{null, metadata !19}
!24 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 21, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 21} ; [ DW_TAG_
!25 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !20}
!27 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !28, i32 419, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!28 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail", null} ; [ DW_TAG_file_type ]
!29 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{null, metadata !31, metadata !35, metadata !35, metadata !35}
!31 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!32 = metadata !{i32 786451, null, metadata !"dim3", metadata !28, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !33, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!33 = metadata !{metadata !34, metadata !36, metadata !37, metadata !38, metadata !41, metadata !59, metadata !62, metadata !67}
!34 = metadata !{i32 786445, metadata !32, metadata !"x", metadata !28, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !35} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!35 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!36 = metadata !{i32 786445, metadata !32, metadata !"y", metadata !28, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !35} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!37 = metadata !{i32 786445, metadata !32, metadata !"z", metadata !28, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !35} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!38 = metadata !{i32 786478, i32 0, metadata !32, metadata !"dim3", metadata !"dim3", metadata !"", metadata !28, i32 419, metadata !29, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !39, i32 419} ; [ DW_TAG_subpr
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!41 = metadata !{i32 786478, i32 0, metadata !32, metadata !"dim3", metadata !"dim3", metadata !"", metadata !28, i32 420, metadata !42, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !39, i32 420} ; [ DW_TAG_subpr
!42 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{null, metadata !31, metadata !44}
!44 = metadata !{i32 786454, null, metadata !"uint3", metadata !28, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!45 = metadata !{i32 786451, null, metadata !"uint3", metadata !28, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !46, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!46 = metadata !{metadata !47, metadata !48, metadata !49, metadata !50, metadata !54}
!47 = metadata !{i32 786445, metadata !45, metadata !"x", metadata !28, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !35} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!48 = metadata !{i32 786445, metadata !45, metadata !"y", metadata !28, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !35} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!49 = metadata !{i32 786445, metadata !45, metadata !"z", metadata !28, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !35} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!50 = metadata !{i32 786478, i32 0, metadata !45, metadata !"uint3", metadata !"uint3", metadata !"", metadata !28, i32 188, metadata !51, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !39, i32 188} ; [ DW_TAG_sub
!51 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{null, metadata !53}
!53 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!54 = metadata !{i32 786478, i32 0, metadata !45, metadata !"uint3", metadata !"uint3", metadata !"", metadata !28, i32 188, metadata !55, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !39, i32 188} ; [ DW_TAG_sub
!55 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{null, metadata !53, metadata !57}
!57 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !58} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!59 = metadata !{i32 786478, i32 0, metadata !32, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !28, i32 421, metadata !60, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!60 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{metadata !44, metadata !31}
!62 = metadata !{i32 786478, i32 0, metadata !32, metadata !"dim3", metadata !"dim3", metadata !"", metadata !28, i32 415, metadata !63, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !39, i32 415} ; [ DW_TAG_subpr
!63 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{null, metadata !31, metadata !65}
!65 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!67 = metadata !{i32 786478, i32 0, metadata !32, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !28, i32 415, metadata !68, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !39, i32 415} ; [ DW_TAG_sub
!68 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !69, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!69 = metadata !{null, metadata !31}
!70 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !28, i32 419, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!71 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!72 = metadata !{metadata !73}
!73 = metadata !{metadata !74}
!74 = metadata !{i32 786478, i32 0, metadata !75, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !75, i32 12, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !83, i
!75 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!76 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !77, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!77 = metadata !{metadata !78, metadata !78, metadata !79, metadata !81}
!78 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!79 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!80 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!81 = metadata !{i32 786454, null, metadata !"size_t", metadata !75, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !82} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!82 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!83 = metadata !{metadata !84}
!84 = metadata !{metadata !85, metadata !86, metadata !87, metadata !88, metadata !92}
!85 = metadata !{i32 786689, metadata !74, metadata !"destaddr", metadata !75, i32 16777228, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!86 = metadata !{i32 786689, metadata !74, metadata !"srcaddr", metadata !75, i32 33554444, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!87 = metadata !{i32 786689, metadata !74, metadata !"len", metadata !75, i32 50331660, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!88 = metadata !{i32 786688, metadata !89, metadata !"dest", metadata !75, i32 13, metadata !90, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!89 = metadata !{i32 786443, metadata !74, i32 12, i32 0, metadata !75, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!90 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !91} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!91 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!92 = metadata !{i32 786688, metadata !89, metadata !"src", metadata !75, i32 14, metadata !93, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!93 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !94} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!94 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !91} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!95 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!96 = metadata !{metadata !97}
!97 = metadata !{metadata !98}
!98 = metadata !{i32 786478, i32 0, metadata !99, metadata !"memmove", metadata !"memmove", metadata !"", metadata !99, i32 12, metadata !100, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !103, i32 12} ; [ DW_TAG_su
!99 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!100 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{metadata !78, metadata !78, metadata !79, metadata !102}
!102 = metadata !{i32 786454, null, metadata !"size_t", metadata !99, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !82} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!103 = metadata !{metadata !104}
!104 = metadata !{metadata !105, metadata !106, metadata !107, metadata !108, metadata !110}
!105 = metadata !{i32 786689, metadata !98, metadata !"dst", metadata !99, i32 16777228, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!106 = metadata !{i32 786689, metadata !98, metadata !"src", metadata !99, i32 33554444, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!107 = metadata !{i32 786689, metadata !98, metadata !"count", metadata !99, i32 50331660, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!108 = metadata !{i32 786688, metadata !109, metadata !"a", metadata !99, i32 14, metadata !90, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!109 = metadata !{i32 786443, metadata !98, i32 12, i32 0, metadata !99, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/
!110 = metadata !{i32 786688, metadata !109, metadata !"b", metadata !99, i32 15, metadata !93, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!111 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!112 = metadata !{metadata !113}
!113 = metadata !{metadata !114}
!114 = metadata !{i32 786478, i32 0, metadata !115, metadata !"memset", metadata !"memset", metadata !"", metadata !115, i32 12, metadata !116, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!115 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!116 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !117, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!117 = metadata !{metadata !78, metadata !78, metadata !20, metadata !118}
!118 = metadata !{i32 786454, null, metadata !"size_t", metadata !115, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !82} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!119 = metadata !{metadata !120}
!120 = metadata !{metadata !121, metadata !122, metadata !123, metadata !124}
!121 = metadata !{i32 786689, metadata !114, metadata !"dst", metadata !115, i32 16777228, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!122 = metadata !{i32 786689, metadata !114, metadata !"s", metadata !115, i32 33554444, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!123 = metadata !{i32 786689, metadata !114, metadata !"count", metadata !115, i32 50331660, metadata !118, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!124 = metadata !{i32 786688, metadata !125, metadata !"a", metadata !115, i32 13, metadata !126, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!125 = metadata !{i32 786443, metadata !114, i32 12, i32 0, metadata !115, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!126 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !127} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!127 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !91} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!128 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!129 = metadata !{metadata !130}
!130 = metadata !{metadata !131, metadata !206, metadata !212}
!131 = metadata !{i32 786436, null, metadata !"cudaError", metadata !132, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !133, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!132 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!133 = metadata !{metadata !134, metadata !135, metadata !136, metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !1
!134 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!135 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!136 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!137 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!138 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!139 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!140 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!141 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!142 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!143 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!144 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!145 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!146 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!147 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!148 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!149 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!150 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!151 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!152 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!153 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!154 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!155 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!156 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!157 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!158 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!159 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!160 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!161 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!162 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!163 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!164 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!165 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!166 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!167 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!168 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!169 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!170 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!171 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!172 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!173 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!174 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!175 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!176 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!177 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!178 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!179 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!180 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!181 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!182 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!183 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!184 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!185 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!186 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!187 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!188 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!189 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!190 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!191 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!192 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!193 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!194 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!195 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!196 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!197 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!198 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!199 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!200 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!201 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!202 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!203 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!204 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!205 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!206 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !132, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !207, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!207 = metadata !{metadata !208, metadata !209, metadata !210, metadata !211}
!208 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!209 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!210 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!211 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!212 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !132, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!213 = metadata !{metadata !214}
!214 = metadata !{metadata !215, metadata !244, metadata !250, metadata !256, metadata !260, metadata !268, metadata !276, metadata !284, metadata !292, metadata !299, metadata !307, metadata !311, metadata !318, metadata !332, metadata !342, metadata !3
!215 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !216, i32 24, metadata !217, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!216 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!217 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !218, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!218 = metadata !{metadata !219, metadata !220, metadata !228, metadata !235, metadata !236}
!219 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !216, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !131} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!220 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !221} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!221 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !132, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !222, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!222 = metadata !{metadata !223, metadata !224, metadata !225, metadata !226, metadata !227}
!223 = metadata !{i32 786445, metadata !221, metadata !"x", metadata !132, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!224 = metadata !{i32 786445, metadata !221, metadata !"y", metadata !132, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !20} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!225 = metadata !{i32 786445, metadata !221, metadata !"z", metadata !132, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!226 = metadata !{i32 786445, metadata !221, metadata !"w", metadata !132, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !20} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!227 = metadata !{i32 786445, metadata !221, metadata !"f", metadata !132, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !206} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!228 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !229} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!229 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !132, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !230, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!230 = metadata !{metadata !231, metadata !233, metadata !234}
!231 = metadata !{i32 786445, metadata !229, metadata !"width", metadata !132, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !232} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!232 = metadata !{i32 786454, null, metadata !"size_t", metadata !132, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !82} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!233 = metadata !{i32 786445, metadata !229, metadata !"height", metadata !132, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !232} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!234 = metadata !{i32 786445, metadata !229, metadata !"depth", metadata !132, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !232} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!235 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!236 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !237} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!237 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !132, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!238 = metadata !{metadata !239}
!239 = metadata !{metadata !240, metadata !241, metadata !242, metadata !243}
!240 = metadata !{i32 786689, metadata !215, metadata !"desc", metadata !216, i32 16777240, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!241 = metadata !{i32 786689, metadata !215, metadata !"extent", metadata !216, i32 33554456, metadata !228, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!242 = metadata !{i32 786689, metadata !215, metadata !"flags", metadata !216, i32 50331673, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!243 = metadata !{i32 786689, metadata !215, metadata !"array", metadata !216, i32 67108889, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!244 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !216, i32 29, metadata !245, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !247, 
!245 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !246, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!246 = metadata !{metadata !219, metadata !78}
!247 = metadata !{metadata !248}
!248 = metadata !{metadata !249}
!249 = metadata !{i32 786689, metadata !244, metadata !"devPtr", metadata !216, i32 16777245, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!250 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !216, i32 34, metadata !251, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!251 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !252, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!252 = metadata !{metadata !219, metadata !236}
!253 = metadata !{metadata !254}
!254 = metadata !{metadata !255}
!255 = metadata !{i32 786689, metadata !250, metadata !"array", metadata !216, i32 16777250, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!256 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !216, i32 39, metadata !245, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!257 = metadata !{metadata !258}
!258 = metadata !{metadata !259}
!259 = metadata !{i32 786689, metadata !256, metadata !"ptr", metadata !216, i32 16777255, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!260 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !216, i32 44, metadata !261, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!261 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !262, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!262 = metadata !{metadata !219, metadata !263, metadata !93}
!263 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!264 = metadata !{metadata !265}
!265 = metadata !{metadata !266, metadata !267}
!266 = metadata !{i32 786689, metadata !260, metadata !"devPtr", metadata !216, i32 16777260, metadata !263, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!267 = metadata !{i32 786689, metadata !260, metadata !"symbol", metadata !216, i32 33554476, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!268 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !216, i32 48, metadata !269, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!269 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !270, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!270 = metadata !{metadata !219, metadata !271, metadata !93}
!271 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !232} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!272 = metadata !{metadata !273}
!273 = metadata !{metadata !274, metadata !275}
!274 = metadata !{i32 786689, metadata !268, metadata !"size", metadata !216, i32 16777264, metadata !271, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!275 = metadata !{i32 786689, metadata !268, metadata !"symbol", metadata !216, i32 33554480, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!276 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !216, i32 52, metadata !277, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!277 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !278, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!278 = metadata !{metadata !219, metadata !263, metadata !232, metadata !35}
!279 = metadata !{metadata !280}
!280 = metadata !{metadata !281, metadata !282, metadata !283}
!281 = metadata !{i32 786689, metadata !276, metadata !"pHost", metadata !216, i32 16777268, metadata !263, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!282 = metadata !{i32 786689, metadata !276, metadata !"size", metadata !216, i32 33554484, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!283 = metadata !{i32 786689, metadata !276, metadata !"flags", metadata !216, i32 50331700, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!284 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !216, i32 56, metadata !285, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!285 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !286, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!286 = metadata !{metadata !219, metadata !263, metadata !78, metadata !35}
!287 = metadata !{metadata !288}
!288 = metadata !{metadata !289, metadata !290, metadata !291}
!289 = metadata !{i32 786689, metadata !284, metadata !"pDevice", metadata !216, i32 16777272, metadata !263, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!290 = metadata !{i32 786689, metadata !284, metadata !"pHost", metadata !216, i32 33554488, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!291 = metadata !{i32 786689, metadata !284, metadata !"flags", metadata !216, i32 50331704, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!292 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !216, i32 60, metadata !293, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!293 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !294, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!294 = metadata !{metadata !219, metadata !235, metadata !78}
!295 = metadata !{metadata !296}
!296 = metadata !{metadata !297, metadata !298}
!297 = metadata !{i32 786689, metadata !292, metadata !"pFlags", metadata !216, i32 16777276, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!298 = metadata !{i32 786689, metadata !292, metadata !"pHost", metadata !216, i32 33554492, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!299 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !216, i32 64, metadata !300, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!300 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !301, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!301 = metadata !{metadata !219, metadata !78, metadata !232, metadata !35}
!302 = metadata !{metadata !303}
!303 = metadata !{metadata !304, metadata !305, metadata !306}
!304 = metadata !{i32 786689, metadata !299, metadata !"ptr", metadata !216, i32 16777280, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!305 = metadata !{i32 786689, metadata !299, metadata !"size", metadata !216, i32 33554496, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!306 = metadata !{i32 786689, metadata !299, metadata !"flags", metadata !216, i32 50331712, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!307 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !216, i32 68, metadata !245, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!308 = metadata !{metadata !309}
!309 = metadata !{metadata !310}
!310 = metadata !{i32 786689, metadata !307, metadata !"ptr", metadata !216, i32 16777284, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!311 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !216, i32 72, metadata !312, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!312 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !313, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!313 = metadata !{metadata !219, metadata !263, metadata !232}
!314 = metadata !{metadata !315}
!315 = metadata !{metadata !316, metadata !317}
!316 = metadata !{i32 786689, metadata !311, metadata !"devPtr", metadata !216, i32 16777288, metadata !263, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!317 = metadata !{i32 786689, metadata !311, metadata !"size", metadata !216, i32 33554504, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!318 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !216, i32 80, metadata !319, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!319 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !320, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!320 = metadata !{metadata !219, metadata !321, metadata !229}
!321 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !322} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!322 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !132, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !323, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!323 = metadata !{metadata !324, metadata !325, metadata !326, metadata !327}
!324 = metadata !{i32 786445, metadata !322, metadata !"ptr", metadata !132, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!325 = metadata !{i32 786445, metadata !322, metadata !"pitch", metadata !132, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !232} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!326 = metadata !{i32 786445, metadata !322, metadata !"xsize", metadata !132, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !232} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!327 = metadata !{i32 786445, metadata !322, metadata !"ysize", metadata !132, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !232} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!328 = metadata !{metadata !329}
!329 = metadata !{metadata !330, metadata !331}
!330 = metadata !{i32 786689, metadata !318, metadata !"pitchedDevPtr", metadata !216, i32 16777296, metadata !321, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!331 = metadata !{i32 786689, metadata !318, metadata !"extent", metadata !216, i32 33554512, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!332 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !216, i32 84, metadata !333, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!333 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !334, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!334 = metadata !{metadata !219, metadata !335, metadata !220, metadata !229, metadata !35}
!335 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !236} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!336 = metadata !{metadata !337}
!337 = metadata !{metadata !338, metadata !339, metadata !340, metadata !341}
!338 = metadata !{i32 786689, metadata !332, metadata !"array", metadata !216, i32 16777300, metadata !335, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!339 = metadata !{i32 786689, metadata !332, metadata !"desc", metadata !216, i32 33554516, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!340 = metadata !{i32 786689, metadata !332, metadata !"extent", metadata !216, i32 50331733, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!341 = metadata !{i32 786689, metadata !332, metadata !"flags", metadata !216, i32 67108949, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!342 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !216, i32 89, metadata !343, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!343 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !344, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!344 = metadata !{metadata !219, metadata !335, metadata !220, metadata !232, metadata !232, metadata !35}
!345 = metadata !{metadata !346}
!346 = metadata !{metadata !347, metadata !348, metadata !349, metadata !350, metadata !351}
!347 = metadata !{i32 786689, metadata !342, metadata !"array", metadata !216, i32 16777305, metadata !335, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!348 = metadata !{i32 786689, metadata !342, metadata !"desc", metadata !216, i32 33554521, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!349 = metadata !{i32 786689, metadata !342, metadata !"width", metadata !216, i32 50331738, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!350 = metadata !{i32 786689, metadata !342, metadata !"height", metadata !216, i32 67108954, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!351 = metadata !{i32 786689, metadata !342, metadata !"flags", metadata !216, i32 83886170, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!352 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !216, i32 94, metadata !312, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!353 = metadata !{metadata !354}
!354 = metadata !{metadata !355, metadata !356}
!355 = metadata !{i32 786689, metadata !352, metadata !"ptr", metadata !216, i32 16777310, metadata !263, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!356 = metadata !{i32 786689, metadata !352, metadata !"size", metadata !216, i32 33554526, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!357 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !216, i32 102, metadata !358, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!358 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !359, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!359 = metadata !{metadata !219, metadata !263, metadata !271, metadata !232, metadata !232}
!360 = metadata !{metadata !361}
!361 = metadata !{metadata !362, metadata !363, metadata !364, metadata !365}
!362 = metadata !{i32 786689, metadata !357, metadata !"devPtr", metadata !216, i32 16777318, metadata !263, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!363 = metadata !{i32 786689, metadata !357, metadata !"pitch", metadata !216, i32 33554534, metadata !271, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!364 = metadata !{i32 786689, metadata !357, metadata !"width", metadata !216, i32 50331750, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!365 = metadata !{i32 786689, metadata !357, metadata !"height", metadata !216, i32 67108966, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!366 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !216, i32 106, metadata !367, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!367 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !368, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!368 = metadata !{metadata !219, metadata !78, metadata !79, metadata !232, metadata !212}
!369 = metadata !{metadata !370}
!370 = metadata !{metadata !371, metadata !372, metadata !373, metadata !374}
!371 = metadata !{i32 786689, metadata !366, metadata !"dst", metadata !216, i32 16777322, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!372 = metadata !{i32 786689, metadata !366, metadata !"src", metadata !216, i32 33554538, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!373 = metadata !{i32 786689, metadata !366, metadata !"count", metadata !216, i32 50331754, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!374 = metadata !{i32 786689, metadata !366, metadata !"kind", metadata !216, i32 67108970, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!375 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !216, i32 111, metadata !376, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!376 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !377, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!377 = metadata !{metadata !219, metadata !78, metadata !232, metadata !79, metadata !232, metadata !232, metadata !232, metadata !212}
!378 = metadata !{metadata !379}
!379 = metadata !{metadata !380, metadata !381, metadata !382, metadata !383, metadata !384, metadata !385, metadata !386}
!380 = metadata !{i32 786689, metadata !375, metadata !"dst", metadata !216, i32 16777327, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!381 = metadata !{i32 786689, metadata !375, metadata !"dpitch", metadata !216, i32 33554543, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!382 = metadata !{i32 786689, metadata !375, metadata !"src", metadata !216, i32 50331759, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!383 = metadata !{i32 786689, metadata !375, metadata !"spitch", metadata !216, i32 67108975, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!384 = metadata !{i32 786689, metadata !375, metadata !"width", metadata !216, i32 83886192, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!385 = metadata !{i32 786689, metadata !375, metadata !"height", metadata !216, i32 100663408, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!386 = metadata !{i32 786689, metadata !375, metadata !"kind", metadata !216, i32 117440624, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!387 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !216, i32 116, metadata !388, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!388 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !389, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!389 = metadata !{metadata !219, metadata !236, metadata !232, metadata !232, metadata !236, metadata !232, metadata !232, metadata !232, metadata !232, metadata !212}
!390 = metadata !{metadata !391}
!391 = metadata !{metadata !392, metadata !393, metadata !394, metadata !395, metadata !396, metadata !397, metadata !398, metadata !399, metadata !400}
!392 = metadata !{i32 786689, metadata !387, metadata !"dst", metadata !216, i32 16777332, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!393 = metadata !{i32 786689, metadata !387, metadata !"wOffsetDst", metadata !216, i32 33554548, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!394 = metadata !{i32 786689, metadata !387, metadata !"hOffsetDst", metadata !216, i32 50331764, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!395 = metadata !{i32 786689, metadata !387, metadata !"src", metadata !216, i32 67108981, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!396 = metadata !{i32 786689, metadata !387, metadata !"wOffsetSrc", metadata !216, i32 83886197, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!397 = metadata !{i32 786689, metadata !387, metadata !"hOffsetSrc", metadata !216, i32 100663413, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!398 = metadata !{i32 786689, metadata !387, metadata !"width", metadata !216, i32 117440630, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!399 = metadata !{i32 786689, metadata !387, metadata !"height", metadata !216, i32 134217846, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!400 = metadata !{i32 786689, metadata !387, metadata !"kind", metadata !216, i32 150995062, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!401 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !216, i32 122, metadata !402, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!402 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !403, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!403 = metadata !{metadata !219, metadata !78, metadata !232, metadata !79, metadata !232, metadata !232, metadata !232, metadata !212, metadata !404}
!404 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !216, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !405} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!405 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !406} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!406 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !132, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!407 = metadata !{metadata !408}
!408 = metadata !{metadata !409, metadata !410, metadata !411, metadata !412, metadata !413, metadata !414, metadata !415, metadata !416}
!409 = metadata !{i32 786689, metadata !401, metadata !"dst", metadata !216, i32 16777338, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!410 = metadata !{i32 786689, metadata !401, metadata !"dpitch", metadata !216, i32 33554554, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!411 = metadata !{i32 786689, metadata !401, metadata !"src", metadata !216, i32 50331770, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!412 = metadata !{i32 786689, metadata !401, metadata !"spitch", metadata !216, i32 67108986, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!413 = metadata !{i32 786689, metadata !401, metadata !"width", metadata !216, i32 83886203, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!414 = metadata !{i32 786689, metadata !401, metadata !"height", metadata !216, i32 100663419, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!415 = metadata !{i32 786689, metadata !401, metadata !"kind", metadata !216, i32 117440635, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!416 = metadata !{i32 786689, metadata !401, metadata !"stream", metadata !216, i32 134217852, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!417 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !216, i32 128, metadata !418, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!418 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !419, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!419 = metadata !{metadata !219, metadata !78, metadata !232, metadata !236, metadata !232, metadata !232, metadata !232, metadata !232, metadata !212}
!420 = metadata !{metadata !421}
!421 = metadata !{metadata !422, metadata !423, metadata !424, metadata !425, metadata !426, metadata !427, metadata !428, metadata !429}
!422 = metadata !{i32 786689, metadata !417, metadata !"dst", metadata !216, i32 16777344, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!423 = metadata !{i32 786689, metadata !417, metadata !"dpitch", metadata !216, i32 33554560, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!424 = metadata !{i32 786689, metadata !417, metadata !"src", metadata !216, i32 50331776, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!425 = metadata !{i32 786689, metadata !417, metadata !"wOffset", metadata !216, i32 67108993, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!426 = metadata !{i32 786689, metadata !417, metadata !"hOffset", metadata !216, i32 83886209, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!427 = metadata !{i32 786689, metadata !417, metadata !"width", metadata !216, i32 100663425, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!428 = metadata !{i32 786689, metadata !417, metadata !"height", metadata !216, i32 117440641, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!429 = metadata !{i32 786689, metadata !417, metadata !"kind", metadata !216, i32 134217858, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!430 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !216, i32 134, metadata !431, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!431 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !432, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!432 = metadata !{metadata !219, metadata !78, metadata !232, metadata !236, metadata !232, metadata !232, metadata !232, metadata !232, metadata !212, metadata !404}
!433 = metadata !{metadata !434}
!434 = metadata !{metadata !435, metadata !436, metadata !437, metadata !438, metadata !439, metadata !440, metadata !441, metadata !442, metadata !443}
!435 = metadata !{i32 786689, metadata !430, metadata !"dst", metadata !216, i32 16777350, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!436 = metadata !{i32 786689, metadata !430, metadata !"dpitch", metadata !216, i32 33554566, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!437 = metadata !{i32 786689, metadata !430, metadata !"src", metadata !216, i32 50331782, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!438 = metadata !{i32 786689, metadata !430, metadata !"wOffset", metadata !216, i32 67108999, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!439 = metadata !{i32 786689, metadata !430, metadata !"hOffset", metadata !216, i32 83886215, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!440 = metadata !{i32 786689, metadata !430, metadata !"width", metadata !216, i32 100663431, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!441 = metadata !{i32 786689, metadata !430, metadata !"height", metadata !216, i32 117440647, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!442 = metadata !{i32 786689, metadata !430, metadata !"kind", metadata !216, i32 134217864, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!443 = metadata !{i32 786689, metadata !430, metadata !"stream", metadata !216, i32 150995080, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!444 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !216, i32 140, metadata !445, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!445 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !446, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!446 = metadata !{metadata !219, metadata !236, metadata !232, metadata !232, metadata !79, metadata !232, metadata !232, metadata !232, metadata !212}
!447 = metadata !{metadata !448}
!448 = metadata !{metadata !449, metadata !450, metadata !451, metadata !452, metadata !453, metadata !454, metadata !455, metadata !456}
!449 = metadata !{i32 786689, metadata !444, metadata !"dst", metadata !216, i32 16777356, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!450 = metadata !{i32 786689, metadata !444, metadata !"wOffset", metadata !216, i32 33554572, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!451 = metadata !{i32 786689, metadata !444, metadata !"hOffset", metadata !216, i32 50331788, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!452 = metadata !{i32 786689, metadata !444, metadata !"src", metadata !216, i32 67109005, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!453 = metadata !{i32 786689, metadata !444, metadata !"spitch", metadata !216, i32 83886221, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!454 = metadata !{i32 786689, metadata !444, metadata !"width", metadata !216, i32 100663437, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!455 = metadata !{i32 786689, metadata !444, metadata !"height", metadata !216, i32 117440653, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!456 = metadata !{i32 786689, metadata !444, metadata !"kind", metadata !216, i32 134217870, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!457 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !216, i32 146, metadata !458, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!458 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !459, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!459 = metadata !{metadata !219, metadata !236, metadata !232, metadata !232, metadata !79, metadata !232, metadata !232, metadata !232, metadata !212, metadata !404}
!460 = metadata !{metadata !461}
!461 = metadata !{metadata !462, metadata !463, metadata !464, metadata !465, metadata !466, metadata !467, metadata !468, metadata !469, metadata !470}
!462 = metadata !{i32 786689, metadata !457, metadata !"dst", metadata !216, i32 16777362, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!463 = metadata !{i32 786689, metadata !457, metadata !"wOffset", metadata !216, i32 33554578, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!464 = metadata !{i32 786689, metadata !457, metadata !"hOffset", metadata !216, i32 50331794, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!465 = metadata !{i32 786689, metadata !457, metadata !"src", metadata !216, i32 67109011, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!466 = metadata !{i32 786689, metadata !457, metadata !"spitch", metadata !216, i32 83886227, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!467 = metadata !{i32 786689, metadata !457, metadata !"width", metadata !216, i32 100663443, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!468 = metadata !{i32 786689, metadata !457, metadata !"height", metadata !216, i32 117440659, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!469 = metadata !{i32 786689, metadata !457, metadata !"kind", metadata !216, i32 134217876, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!470 = metadata !{i32 786689, metadata !457, metadata !"stream", metadata !216, i32 150995092, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!471 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !216, i32 152, metadata !472, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!472 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !473, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!473 = metadata !{metadata !219, metadata !474}
!474 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !475} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!475 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !476} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!476 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !132, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !477, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!477 = metadata !{metadata !478, metadata !480, metadata !486, metadata !487, metadata !488, metadata !489, metadata !490, metadata !491}
!478 = metadata !{i32 786445, metadata !476, metadata !"srcArray", metadata !132, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !479} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!479 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !132, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !236} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!480 = metadata !{i32 786445, metadata !476, metadata !"srcPos", metadata !132, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !481} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!481 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !132, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !482, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!482 = metadata !{metadata !483, metadata !484, metadata !485}
!483 = metadata !{i32 786445, metadata !481, metadata !"x", metadata !132, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !232} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!484 = metadata !{i32 786445, metadata !481, metadata !"y", metadata !132, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !232} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!485 = metadata !{i32 786445, metadata !481, metadata !"z", metadata !132, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !232} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!486 = metadata !{i32 786445, metadata !476, metadata !"srcPtr", metadata !132, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !322} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!487 = metadata !{i32 786445, metadata !476, metadata !"dstArray", metadata !132, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !479} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!488 = metadata !{i32 786445, metadata !476, metadata !"dstPos", metadata !132, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !481} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!489 = metadata !{i32 786445, metadata !476, metadata !"dstPtr", metadata !132, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !322} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!490 = metadata !{i32 786445, metadata !476, metadata !"extent", metadata !132, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !229} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!491 = metadata !{i32 786445, metadata !476, metadata !"kind", metadata !132, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !212} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!492 = metadata !{metadata !493}
!493 = metadata !{metadata !494}
!494 = metadata !{i32 786689, metadata !471, metadata !"p", metadata !216, i32 16777368, metadata !474, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!495 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !216, i32 156, metadata !496, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!496 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !497, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!497 = metadata !{metadata !219, metadata !474, metadata !404}
!498 = metadata !{metadata !499}
!499 = metadata !{metadata !500, metadata !501}
!500 = metadata !{i32 786689, metadata !495, metadata !"p", metadata !216, i32 16777372, metadata !474, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!501 = metadata !{i32 786689, metadata !495, metadata !"stream", metadata !216, i32 33554588, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!502 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !216, i32 160, metadata !503, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!503 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !504, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!504 = metadata !{metadata !219, metadata !505}
!505 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !506} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!506 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !507} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!507 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !132, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !508, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!508 = metadata !{metadata !509, metadata !510, metadata !511, metadata !512, metadata !513, metadata !514, metadata !515, metadata !516, metadata !517}
!509 = metadata !{i32 786445, metadata !507, metadata !"srcArray", metadata !132, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !479} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!510 = metadata !{i32 786445, metadata !507, metadata !"srcPos", metadata !132, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !481} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!511 = metadata !{i32 786445, metadata !507, metadata !"srcPtr", metadata !132, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !322} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!512 = metadata !{i32 786445, metadata !507, metadata !"srcDevice", metadata !132, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !20} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!513 = metadata !{i32 786445, metadata !507, metadata !"dstArray", metadata !132, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !479} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!514 = metadata !{i32 786445, metadata !507, metadata !"dstPos", metadata !132, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !481} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!515 = metadata !{i32 786445, metadata !507, metadata !"dstPtr", metadata !132, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !322} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!516 = metadata !{i32 786445, metadata !507, metadata !"dstDevice", metadata !132, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !20} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!517 = metadata !{i32 786445, metadata !507, metadata !"extent", metadata !132, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !229} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!518 = metadata !{metadata !519}
!519 = metadata !{metadata !520}
!520 = metadata !{i32 786689, metadata !502, metadata !"p", metadata !216, i32 16777376, metadata !505, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!521 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !216, i32 164, metadata !522, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!522 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !523, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!523 = metadata !{metadata !219, metadata !505, metadata !404}
!524 = metadata !{metadata !525}
!525 = metadata !{metadata !526, metadata !527}
!526 = metadata !{i32 786689, metadata !521, metadata !"p", metadata !216, i32 16777380, metadata !505, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!527 = metadata !{i32 786689, metadata !521, metadata !"stream", metadata !216, i32 33554596, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!528 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !216, i32 168, metadata !529, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!529 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !530, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!530 = metadata !{metadata !219, metadata !236, metadata !232, metadata !232, metadata !236, metadata !232, metadata !232, metadata !232, metadata !212}
!531 = metadata !{metadata !532}
!532 = metadata !{metadata !533, metadata !534, metadata !535, metadata !536, metadata !537, metadata !538, metadata !539, metadata !540}
!533 = metadata !{i32 786689, metadata !528, metadata !"dst", metadata !216, i32 16777384, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!534 = metadata !{i32 786689, metadata !528, metadata !"wOffsetDst", metadata !216, i32 33554600, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!535 = metadata !{i32 786689, metadata !528, metadata !"hOffsetDst", metadata !216, i32 50331816, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!536 = metadata !{i32 786689, metadata !528, metadata !"src", metadata !216, i32 67109033, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!537 = metadata !{i32 786689, metadata !528, metadata !"wOffsetSrc", metadata !216, i32 83886249, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!538 = metadata !{i32 786689, metadata !528, metadata !"hOffsetSrc", metadata !216, i32 100663465, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!539 = metadata !{i32 786689, metadata !528, metadata !"count", metadata !216, i32 117440682, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!540 = metadata !{i32 786689, metadata !528, metadata !"kind", metadata !216, i32 134217898, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!541 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !216, i32 174, metadata !542, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!542 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !543, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!543 = metadata !{metadata !219, metadata !78, metadata !79, metadata !232, metadata !212, metadata !404}
!544 = metadata !{metadata !545}
!545 = metadata !{metadata !546, metadata !547, metadata !548, metadata !549, metadata !550}
!546 = metadata !{i32 786689, metadata !541, metadata !"dst", metadata !216, i32 16777390, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!547 = metadata !{i32 786689, metadata !541, metadata !"src", metadata !216, i32 33554606, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!548 = metadata !{i32 786689, metadata !541, metadata !"count", metadata !216, i32 50331822, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!549 = metadata !{i32 786689, metadata !541, metadata !"kind", metadata !216, i32 67109039, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!550 = metadata !{i32 786689, metadata !541, metadata !"stream", metadata !216, i32 83886255, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!551 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !216, i32 179, metadata !552, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!552 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !553, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!553 = metadata !{metadata !219, metadata !78, metadata !236, metadata !232, metadata !232, metadata !232, metadata !212}
!554 = metadata !{metadata !555}
!555 = metadata !{metadata !556, metadata !557, metadata !558, metadata !559, metadata !560, metadata !561}
!556 = metadata !{i32 786689, metadata !551, metadata !"dst", metadata !216, i32 16777395, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!557 = metadata !{i32 786689, metadata !551, metadata !"src", metadata !216, i32 33554611, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!558 = metadata !{i32 786689, metadata !551, metadata !"wOffset", metadata !216, i32 50331827, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!559 = metadata !{i32 786689, metadata !551, metadata !"hOffset", metadata !216, i32 67109044, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!560 = metadata !{i32 786689, metadata !551, metadata !"count", metadata !216, i32 83886260, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!561 = metadata !{i32 786689, metadata !551, metadata !"kind", metadata !216, i32 100663476, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!562 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !216, i32 184, metadata !563, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!563 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !564, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!564 = metadata !{metadata !219, metadata !78, metadata !236, metadata !232, metadata !232, metadata !232, metadata !212, metadata !404}
!565 = metadata !{metadata !566}
!566 = metadata !{metadata !567, metadata !568, metadata !569, metadata !570, metadata !571, metadata !572, metadata !573}
!567 = metadata !{i32 786689, metadata !562, metadata !"dst", metadata !216, i32 16777400, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!568 = metadata !{i32 786689, metadata !562, metadata !"src", metadata !216, i32 33554616, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!569 = metadata !{i32 786689, metadata !562, metadata !"wOffset", metadata !216, i32 50331832, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!570 = metadata !{i32 786689, metadata !562, metadata !"hOffset", metadata !216, i32 67109049, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!571 = metadata !{i32 786689, metadata !562, metadata !"count", metadata !216, i32 83886265, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!572 = metadata !{i32 786689, metadata !562, metadata !"kind", metadata !216, i32 100663481, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!573 = metadata !{i32 786689, metadata !562, metadata !"stream", metadata !216, i32 117440698, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!574 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !216, i32 190, metadata !575, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!575 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !576, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!576 = metadata !{metadata !219, metadata !78, metadata !93, metadata !232, metadata !232, metadata !212}
!577 = metadata !{metadata !578}
!578 = metadata !{metadata !579, metadata !580, metadata !581, metadata !582, metadata !583}
!579 = metadata !{i32 786689, metadata !574, metadata !"dst", metadata !216, i32 16777406, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!580 = metadata !{i32 786689, metadata !574, metadata !"symbol", metadata !216, i32 33554622, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!581 = metadata !{i32 786689, metadata !574, metadata !"count", metadata !216, i32 50331838, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!582 = metadata !{i32 786689, metadata !574, metadata !"offset", metadata !216, i32 67109055, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!583 = metadata !{i32 786689, metadata !574, metadata !"kind", metadata !216, i32 83886271, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!584 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !216, i32 195, metadata !585, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!585 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !586, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!586 = metadata !{metadata !219, metadata !78, metadata !93, metadata !232, metadata !232, metadata !212, metadata !404}
!587 = metadata !{metadata !588}
!588 = metadata !{metadata !589, metadata !590, metadata !591, metadata !592, metadata !593, metadata !594}
!589 = metadata !{i32 786689, metadata !584, metadata !"dst", metadata !216, i32 16777411, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!590 = metadata !{i32 786689, metadata !584, metadata !"symbol", metadata !216, i32 33554627, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!591 = metadata !{i32 786689, metadata !584, metadata !"count", metadata !216, i32 50331843, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!592 = metadata !{i32 786689, metadata !584, metadata !"offset", metadata !216, i32 67109060, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!593 = metadata !{i32 786689, metadata !584, metadata !"kind", metadata !216, i32 83886276, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!594 = metadata !{i32 786689, metadata !584, metadata !"stream", metadata !216, i32 100663493, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!595 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !216, i32 201, metadata !596, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!596 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !597, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!597 = metadata !{metadata !219, metadata !78, metadata !20, metadata !79, metadata !20, metadata !232}
!598 = metadata !{metadata !599}
!599 = metadata !{metadata !600, metadata !601, metadata !602, metadata !603, metadata !604}
!600 = metadata !{i32 786689, metadata !595, metadata !"dst", metadata !216, i32 16777417, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!601 = metadata !{i32 786689, metadata !595, metadata !"dstDevice", metadata !216, i32 33554633, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!602 = metadata !{i32 786689, metadata !595, metadata !"src", metadata !216, i32 50331849, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!603 = metadata !{i32 786689, metadata !595, metadata !"srcDevice", metadata !216, i32 67109065, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!604 = metadata !{i32 786689, metadata !595, metadata !"count", metadata !216, i32 83886281, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!605 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !216, i32 206, metadata !606, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!606 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !607, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!607 = metadata !{metadata !219, metadata !78, metadata !20, metadata !79, metadata !20, metadata !232, metadata !404}
!608 = metadata !{metadata !609}
!609 = metadata !{metadata !610, metadata !611, metadata !612, metadata !613, metadata !614, metadata !615}
!610 = metadata !{i32 786689, metadata !605, metadata !"dst", metadata !216, i32 16777422, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!611 = metadata !{i32 786689, metadata !605, metadata !"dstDevice", metadata !216, i32 33554638, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!612 = metadata !{i32 786689, metadata !605, metadata !"src", metadata !216, i32 50331854, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!613 = metadata !{i32 786689, metadata !605, metadata !"srcDevice", metadata !216, i32 67109070, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!614 = metadata !{i32 786689, metadata !605, metadata !"count", metadata !216, i32 83886287, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!615 = metadata !{i32 786689, metadata !605, metadata !"stream", metadata !216, i32 100663503, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!616 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !216, i32 212, metadata !617, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!617 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !618, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!618 = metadata !{metadata !219, metadata !236, metadata !232, metadata !232, metadata !79, metadata !232, metadata !212}
!619 = metadata !{metadata !620}
!620 = metadata !{metadata !621, metadata !622, metadata !623, metadata !624, metadata !625, metadata !626}
!621 = metadata !{i32 786689, metadata !616, metadata !"dst", metadata !216, i32 16777428, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!622 = metadata !{i32 786689, metadata !616, metadata !"wOffset", metadata !216, i32 33554644, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!623 = metadata !{i32 786689, metadata !616, metadata !"hOffset", metadata !216, i32 50331860, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!624 = metadata !{i32 786689, metadata !616, metadata !"src", metadata !216, i32 67109077, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!625 = metadata !{i32 786689, metadata !616, metadata !"count", metadata !216, i32 83886293, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!626 = metadata !{i32 786689, metadata !616, metadata !"kind", metadata !216, i32 100663509, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!627 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !216, i32 217, metadata !628, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!628 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !629, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!629 = metadata !{metadata !219, metadata !236, metadata !232, metadata !232, metadata !79, metadata !232, metadata !212, metadata !404}
!630 = metadata !{metadata !631}
!631 = metadata !{metadata !632, metadata !633, metadata !634, metadata !635, metadata !636, metadata !637, metadata !638}
!632 = metadata !{i32 786689, metadata !627, metadata !"dst", metadata !216, i32 16777433, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!633 = metadata !{i32 786689, metadata !627, metadata !"wOffset", metadata !216, i32 33554649, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!634 = metadata !{i32 786689, metadata !627, metadata !"hOffset", metadata !216, i32 50331865, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!635 = metadata !{i32 786689, metadata !627, metadata !"src", metadata !216, i32 67109082, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!636 = metadata !{i32 786689, metadata !627, metadata !"count", metadata !216, i32 83886298, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!637 = metadata !{i32 786689, metadata !627, metadata !"kind", metadata !216, i32 100663514, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!638 = metadata !{i32 786689, metadata !627, metadata !"stream", metadata !216, i32 117440731, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!639 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !216, i32 223, metadata !640, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!640 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !641, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!641 = metadata !{metadata !219, metadata !90, metadata !79, metadata !232, metadata !232, metadata !212}
!642 = metadata !{metadata !643}
!643 = metadata !{metadata !644, metadata !645, metadata !646, metadata !647, metadata !648}
!644 = metadata !{i32 786689, metadata !639, metadata !"symbol", metadata !216, i32 16777439, metadata !90, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!645 = metadata !{i32 786689, metadata !639, metadata !"src", metadata !216, i32 33554655, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!646 = metadata !{i32 786689, metadata !639, metadata !"count", metadata !216, i32 50331871, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!647 = metadata !{i32 786689, metadata !639, metadata !"offset", metadata !216, i32 67109088, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!648 = metadata !{i32 786689, metadata !639, metadata !"kind", metadata !216, i32 83886304, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!649 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !216, i32 229, metadata !650, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!650 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !651, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!651 = metadata !{metadata !219, metadata !93, metadata !79, metadata !232, metadata !232, metadata !212, metadata !404}
!652 = metadata !{metadata !653}
!653 = metadata !{metadata !654, metadata !655, metadata !656, metadata !657, metadata !658, metadata !659}
!654 = metadata !{i32 786689, metadata !649, metadata !"symbol", metadata !216, i32 16777445, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!655 = metadata !{i32 786689, metadata !649, metadata !"src", metadata !216, i32 33554661, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!656 = metadata !{i32 786689, metadata !649, metadata !"count", metadata !216, i32 50331877, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!657 = metadata !{i32 786689, metadata !649, metadata !"offset", metadata !216, i32 67109093, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!658 = metadata !{i32 786689, metadata !649, metadata !"kind", metadata !216, i32 83886310, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!659 = metadata !{i32 786689, metadata !649, metadata !"stream", metadata !216, i32 100663526, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!660 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !216, i32 234, metadata !661, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!661 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !662, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!662 = metadata !{metadata !219, metadata !271, metadata !271}
!663 = metadata !{metadata !664}
!664 = metadata !{metadata !665, metadata !666}
!665 = metadata !{i32 786689, metadata !660, metadata !"free", metadata !216, i32 16777450, metadata !271, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!666 = metadata !{i32 786689, metadata !660, metadata !"total", metadata !216, i32 33554666, metadata !271, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!667 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !216, i32 238, metadata !668, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!668 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !669, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!669 = metadata !{metadata !219, metadata !78, metadata !20, metadata !232}
!670 = metadata !{metadata !671}
!671 = metadata !{metadata !672, metadata !673, metadata !674}
!672 = metadata !{i32 786689, metadata !667, metadata !"devPtr", metadata !216, i32 16777454, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!673 = metadata !{i32 786689, metadata !667, metadata !"value", metadata !216, i32 33554670, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!674 = metadata !{i32 786689, metadata !667, metadata !"count", metadata !216, i32 50331886, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!675 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !216, i32 243, metadata !676, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!676 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !677, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!677 = metadata !{metadata !219, metadata !78, metadata !232, metadata !20, metadata !232, metadata !232}
!678 = metadata !{metadata !679}
!679 = metadata !{metadata !680, metadata !681, metadata !682, metadata !683, metadata !684}
!680 = metadata !{i32 786689, metadata !675, metadata !"devPtr", metadata !216, i32 16777459, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!681 = metadata !{i32 786689, metadata !675, metadata !"pitch", metadata !216, i32 33554675, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!682 = metadata !{i32 786689, metadata !675, metadata !"value", metadata !216, i32 50331891, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!683 = metadata !{i32 786689, metadata !675, metadata !"width", metadata !216, i32 67109108, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!684 = metadata !{i32 786689, metadata !675, metadata !"height", metadata !216, i32 83886324, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!685 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !216, i32 248, metadata !686, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!686 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !687, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!687 = metadata !{metadata !219, metadata !78, metadata !232, metadata !20, metadata !232, metadata !232, metadata !404}
!688 = metadata !{metadata !689}
!689 = metadata !{metadata !690, metadata !691, metadata !692, metadata !693, metadata !694, metadata !695}
!690 = metadata !{i32 786689, metadata !685, metadata !"devPtr", metadata !216, i32 16777464, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!691 = metadata !{i32 786689, metadata !685, metadata !"pitch", metadata !216, i32 33554680, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!692 = metadata !{i32 786689, metadata !685, metadata !"value", metadata !216, i32 50331896, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!693 = metadata !{i32 786689, metadata !685, metadata !"width", metadata !216, i32 67109113, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!694 = metadata !{i32 786689, metadata !685, metadata !"height", metadata !216, i32 83886329, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!695 = metadata !{i32 786689, metadata !685, metadata !"stream", metadata !216, i32 100663545, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!696 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !216, i32 253, metadata !697, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!697 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !698, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!698 = metadata !{metadata !219, metadata !322, metadata !20, metadata !229}
!699 = metadata !{metadata !700}
!700 = metadata !{metadata !701, metadata !702, metadata !703}
!701 = metadata !{i32 786689, metadata !696, metadata !"pitchedDevPtr", metadata !216, i32 16777469, metadata !322, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!702 = metadata !{i32 786689, metadata !696, metadata !"value", metadata !216, i32 33554685, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!703 = metadata !{i32 786689, metadata !696, metadata !"extent", metadata !216, i32 50331902, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!704 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !216, i32 258, metadata !705, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!705 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !706, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!706 = metadata !{metadata !219, metadata !322, metadata !20, metadata !229, metadata !404}
!707 = metadata !{metadata !708}
!708 = metadata !{metadata !709, metadata !710, metadata !711, metadata !712}
!709 = metadata !{i32 786689, metadata !704, metadata !"pitchedDevPtr", metadata !216, i32 16777474, metadata !322, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!710 = metadata !{i32 786689, metadata !704, metadata !"value", metadata !216, i32 33554690, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!711 = metadata !{i32 786689, metadata !704, metadata !"extent", metadata !216, i32 50331907, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!712 = metadata !{i32 786689, metadata !704, metadata !"stream", metadata !216, i32 67109123, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!713 = metadata !{i32 786478, i32 0, metadata !216, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !216, i32 263, metadata !714, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!714 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !715, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!715 = metadata !{metadata !219, metadata !78, metadata !20, metadata !232, metadata !404}
!716 = metadata !{metadata !717}
!717 = metadata !{metadata !718, metadata !719, metadata !720, metadata !721}
!718 = metadata !{i32 786689, metadata !713, metadata !"devPtr", metadata !216, i32 16777479, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!719 = metadata !{i32 786689, metadata !713, metadata !"value", metadata !216, i32 33554695, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!720 = metadata !{i32 786689, metadata !713, metadata !"count", metadata !216, i32 50331911, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!721 = metadata !{i32 786689, metadata !713, metadata !"stream", metadata !216, i32 67109127, metadata !404, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!722 = metadata !{i32 10, i32 0, metadata !723, null}
!723 = metadata !{i32 786443, metadata !15, i32 7, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail/main.cpp]
!724 = metadata !{i32 16, i32 0, metadata !725, null}
!725 = metadata !{i32 786443, metadata !21, i32 13, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail/main.cpp]
!726 = metadata !{i32 19, i32 0, metadata !725, null}
!727 = metadata !{i32 24, i32 0, metadata !728, null}
!728 = metadata !{i32 786443, metadata !24, i32 21, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail/main.cpp]
!729 = metadata !{i32 26, i32 0, metadata !730, null}
!730 = metadata !{i32 786443, metadata !728, i32 26, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail/main.cpp]
!731 = metadata !{i32 27, i32 0, metadata !730, null}
!732 = metadata !{i32 29, i32 0, metadata !728, null}
!733 = metadata !{i32 31, i32 0, metadata !728, null}
!734 = metadata !{i32 32, i32 0, metadata !735, null}
!735 = metadata !{i32 786443, metadata !728, i32 32, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail/main.cpp]
!736 = metadata !{i32 34, i32 0, metadata !735, null}
!737 = metadata !{i32 38, i32 0, metadata !728, null}
!738 = metadata !{i32 40, i32 0, metadata !728, null}
!739 = metadata !{i32 42, i32 0, metadata !740, null}
!740 = metadata !{i32 786443, metadata !728, i32 42, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail/main.cpp]
!741 = metadata !{i32 43, i32 0, metadata !742, null}
!742 = metadata !{i32 786443, metadata !740, i32 42, i32 0, metadata !16, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail/main.cpp]
!743 = metadata !{i32 44, i32 0, metadata !742, null}
!744 = metadata !{i32 47, i32 0, metadata !728, null}
!745 = metadata !{i32 48, i32 0, metadata !728, null}
!746 = metadata !{i32 50, i32 0, metadata !728, null}
!747 = metadata !{i32 419, i32 0, metadata !27, null}
!748 = metadata !{i32 419, i32 0, metadata !70, null}
!749 = metadata !{i32 419, i32 0, metadata !750, null}
!750 = metadata !{i32 786443, metadata !70, i32 419, i32 0, metadata !28, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/038_test6_fail//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!751 = metadata !{i32 16, i32 0, metadata !89, null}
!752 = metadata !{i32 17, i32 0, metadata !89, null}
!753 = metadata !{metadata !"omnipotent char", metadata !754}
!754 = metadata !{metadata !"Simple C/C++ TBAA"}
!755 = metadata !{i32 18, i32 0, metadata !89, null}
!756 = metadata !{i32 14, i32 0, metadata !125, null}
!757 = metadata !{i32 15, i32 0, metadata !125, null}
!758 = metadata !{i32 16, i32 0, metadata !125, null}
!759 = metadata !{i32 26, i32 0, metadata !760, null}
!760 = metadata !{i32 786443, metadata !215, i32 25, i32 0, metadata !216, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!761 = metadata !{i32 30, i32 0, metadata !762, null}
!762 = metadata !{i32 786443, metadata !244, i32 29, i32 0, metadata !216, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!763 = metadata !{i32 31, i32 0, metadata !762, null}
!764 = metadata !{i32 35, i32 0, metadata !765, null}
!765 = metadata !{i32 786443, metadata !250, i32 34, i32 0, metadata !216, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!766 = metadata !{i32 36, i32 0, metadata !765, null}
!767 = metadata !{i32 40, i32 0, metadata !768, null}
!768 = metadata !{i32 786443, metadata !256, i32 39, i32 0, metadata !216, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!769 = metadata !{i32 41, i32 0, metadata !768, null}
!770 = metadata !{i32 45, i32 0, metadata !771, null}
!771 = metadata !{i32 786443, metadata !260, i32 44, i32 0, metadata !216, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!772 = metadata !{i32 49, i32 0, metadata !773, null}
!773 = metadata !{i32 786443, metadata !268, i32 48, i32 0, metadata !216, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!774 = metadata !{i32 53, i32 0, metadata !775, null}
!775 = metadata !{i32 786443, metadata !276, i32 52, i32 0, metadata !216, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!776 = metadata !{i32 57, i32 0, metadata !777, null}
!777 = metadata !{i32 786443, metadata !284, i32 56, i32 0, metadata !216, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!778 = metadata !{i32 61, i32 0, metadata !779, null}
!779 = metadata !{i32 786443, metadata !292, i32 60, i32 0, metadata !216, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!780 = metadata !{i32 65, i32 0, metadata !781, null}
!781 = metadata !{i32 786443, metadata !299, i32 64, i32 0, metadata !216, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!782 = metadata !{i32 69, i32 0, metadata !783, null}
!783 = metadata !{i32 786443, metadata !307, i32 68, i32 0, metadata !216, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!784 = metadata !{i32 73, i32 0, metadata !785, null}
!785 = metadata !{i32 786443, metadata !311, i32 72, i32 0, metadata !216, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!786 = metadata !{i32 74, i32 0, metadata !785, null}
!787 = metadata !{metadata !"any pointer", metadata !753}
!788 = metadata !{i32 75, i32 0, metadata !785, null}
!789 = metadata !{i32 77, i32 0, metadata !785, null}
!790 = metadata !{i32 81, i32 0, metadata !791, null}
!791 = metadata !{i32 786443, metadata !318, i32 80, i32 0, metadata !216, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!792 = metadata !{i32 86, i32 0, metadata !793, null}
!793 = metadata !{i32 786443, metadata !332, i32 85, i32 0, metadata !216, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!794 = metadata !{i32 91, i32 0, metadata !795, null}
!795 = metadata !{i32 786443, metadata !342, i32 90, i32 0, metadata !216, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!796 = metadata !{i32 95, i32 0, metadata !797, null}
!797 = metadata !{i32 786443, metadata !352, i32 94, i32 0, metadata !216, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!798 = metadata !{i32 96, i32 0, metadata !797, null}
!799 = metadata !{i32 97, i32 0, metadata !797, null}
!800 = metadata !{i32 99, i32 0, metadata !797, null}
!801 = metadata !{i32 103, i32 0, metadata !802, null}
!802 = metadata !{i32 786443, metadata !357, i32 102, i32 0, metadata !216, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!803 = metadata !{i32 108, i32 0, metadata !804, null}
!804 = metadata !{i32 786443, metadata !366, i32 106, i32 0, metadata !216, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!805 = metadata !{i32 113, i32 0, metadata !806, null}
!806 = metadata !{i32 786443, metadata !375, i32 112, i32 0, metadata !216, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!807 = metadata !{i32 119, i32 0, metadata !808, null}
!808 = metadata !{i32 786443, metadata !387, i32 118, i32 0, metadata !216, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!809 = metadata !{i32 125, i32 0, metadata !810, null}
!810 = metadata !{i32 786443, metadata !401, i32 124, i32 0, metadata !216, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!811 = metadata !{i32 131, i32 0, metadata !812, null}
!812 = metadata !{i32 786443, metadata !417, i32 130, i32 0, metadata !216, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!813 = metadata !{i32 137, i32 0, metadata !814, null}
!814 = metadata !{i32 786443, metadata !430, i32 136, i32 0, metadata !216, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!815 = metadata !{i32 143, i32 0, metadata !816, null}
!816 = metadata !{i32 786443, metadata !444, i32 142, i32 0, metadata !216, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!817 = metadata !{i32 149, i32 0, metadata !818, null}
!818 = metadata !{i32 786443, metadata !457, i32 148, i32 0, metadata !216, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!819 = metadata !{i32 153, i32 0, metadata !820, null}
!820 = metadata !{i32 786443, metadata !471, i32 152, i32 0, metadata !216, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!821 = metadata !{i32 157, i32 0, metadata !822, null}
!822 = metadata !{i32 786443, metadata !495, i32 156, i32 0, metadata !216, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!823 = metadata !{i32 161, i32 0, metadata !824, null}
!824 = metadata !{i32 786443, metadata !502, i32 160, i32 0, metadata !216, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!825 = metadata !{i32 165, i32 0, metadata !826, null}
!826 = metadata !{i32 786443, metadata !521, i32 164, i32 0, metadata !216, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!827 = metadata !{i32 171, i32 0, metadata !828, null}
!828 = metadata !{i32 786443, metadata !528, i32 170, i32 0, metadata !216, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!829 = metadata !{i32 176, i32 0, metadata !830, null}
!830 = metadata !{i32 786443, metadata !541, i32 175, i32 0, metadata !216, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!831 = metadata !{i32 181, i32 0, metadata !832, null}
!832 = metadata !{i32 786443, metadata !551, i32 180, i32 0, metadata !216, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!833 = metadata !{i32 187, i32 0, metadata !834, null}
!834 = metadata !{i32 786443, metadata !562, i32 186, i32 0, metadata !216, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!835 = metadata !{i32 192, i32 0, metadata !836, null}
!836 = metadata !{i32 786443, metadata !574, i32 191, i32 0, metadata !216, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!837 = metadata !{i32 198, i32 0, metadata !838, null}
!838 = metadata !{i32 786443, metadata !584, i32 197, i32 0, metadata !216, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!839 = metadata !{i32 203, i32 0, metadata !840, null}
!840 = metadata !{i32 786443, metadata !595, i32 201, i32 0, metadata !216, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!841 = metadata !{i32 209, i32 0, metadata !842, null}
!842 = metadata !{i32 786443, metadata !605, i32 207, i32 0, metadata !216, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!843 = metadata !{i32 214, i32 0, metadata !844, null}
!844 = metadata !{i32 786443, metadata !616, i32 213, i32 0, metadata !216, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!845 = metadata !{i32 220, i32 0, metadata !846, null}
!846 = metadata !{i32 786443, metadata !627, i32 219, i32 0, metadata !216, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!847 = metadata !{i32 225, i32 0, metadata !848, null}
!848 = metadata !{i32 786443, metadata !639, i32 224, i32 0, metadata !216, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!849 = metadata !{i32 226, i32 0, metadata !848, null}
!850 = metadata !{i32 231, i32 0, metadata !851, null}
!851 = metadata !{i32 786443, metadata !649, i32 230, i32 0, metadata !216, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!852 = metadata !{i32 235, i32 0, metadata !853, null}
!853 = metadata !{i32 786443, metadata !660, i32 234, i32 0, metadata !216, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!854 = metadata !{i32 239, i32 0, metadata !855, null}
!855 = metadata !{i32 786443, metadata !667, i32 238, i32 0, metadata !216, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!856 = metadata !{i32 240, i32 0, metadata !855, null}
!857 = metadata !{i32 245, i32 0, metadata !858, null}
!858 = metadata !{i32 786443, metadata !675, i32 244, i32 0, metadata !216, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!859 = metadata !{i32 250, i32 0, metadata !860, null}
!860 = metadata !{i32 786443, metadata !685, i32 249, i32 0, metadata !216, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!861 = metadata !{i32 255, i32 0, metadata !862, null}
!862 = metadata !{i32 786443, metadata !696, i32 254, i32 0, metadata !216, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!863 = metadata !{i32 260, i32 0, metadata !864, null}
!864 = metadata !{i32 786443, metadata !704, i32 259, i32 0, metadata !216, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!865 = metadata !{i32 264, i32 0, metadata !866, null}
!866 = metadata !{i32 786443, metadata !713, i32 263, i32 0, metadata !216, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
