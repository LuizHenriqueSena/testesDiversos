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
@.str = private unnamed_addr constant [8 x i8] c"a[i]==2\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define void @_Z3fooPi(i32* %p) uwtable noinline {
  %1 = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !719
  %3 = zext i32 %2 to i64, !dbg !719
  %4 = load i32** %1, align 8, !dbg !719
  %5 = getelementptr inbounds i32* %4, i64 %3, !dbg !719
  store i32 2, i32* %5, align 4, !dbg !719
  call void @__syncthreads(), !dbg !721
  ret void, !dbg !722
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @__syncthreads() section "__device__"

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %a = alloca i32*, align 8
  %dev_a = alloca i32*, align 8
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 8, i32* %size, align 4, !dbg !723
  %6 = bitcast i32** %dev_a to i8**, !dbg !725
  %7 = load i32* %size, align 4, !dbg !725
  %8 = sext i32 %7 to i64, !dbg !725
  %9 = call i32 @cudaMalloc(i8** %6, i64 %8), !dbg !725
  %10 = load i32* %size, align 4, !dbg !726
  %11 = mul nsw i32 2, %10, !dbg !726
  %12 = sext i32 %11 to i64, !dbg !726
  %13 = call noalias i8* @malloc(i64 %12) nounwind, !dbg !726
  %14 = bitcast i8* %13 to i32*, !dbg !726
  store i32* %14, i32** %a, align 8, !dbg !726
  store i32 0, i32* %i, align 4, !dbg !727
  br label %15, !dbg !727

; <label>:15                                      ; preds = %18, %0
  %16 = load i32* %i, align 4, !dbg !727
  %17 = icmp slt i32 %16, 2, !dbg !727
  br i1 %17, label %18, label %25, !dbg !727

; <label>:18                                      ; preds = %15
  %19 = load i32* %i, align 4, !dbg !729
  %20 = sext i32 %19 to i64, !dbg !729
  %21 = load i32** %a, align 8, !dbg !729
  %22 = getelementptr inbounds i32* %21, i64 %20, !dbg !729
  store i32 1, i32* %22, align 4, !dbg !729
  %23 = load i32* %i, align 4, !dbg !727
  %24 = add nsw i32 %23, 1, !dbg !727
  store i32 %24, i32* %i, align 4, !dbg !727
  br label %15, !dbg !727

; <label>:25                                      ; preds = %15
  %26 = load i32** %dev_a, align 8, !dbg !730
  %27 = bitcast i32* %26 to i8*, !dbg !730
  %28 = load i32** %a, align 8, !dbg !730
  %29 = bitcast i32* %28 to i8*, !dbg !730
  %30 = load i32* %size, align 4, !dbg !730
  %31 = sext i32 %30 to i64, !dbg !730
  %32 = call i32 @cudaMemcpy(i8* %27, i8* %29, i64 %31, i32 1), !dbg !730
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !731
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 2, i32 1, i32 1), !dbg !731
  %33 = bitcast { i64, i32 }* %4 to i8*, !dbg !731
  %34 = bitcast %struct.dim3* %2 to i8*, !dbg !731
  %35 = call i8* @memcpy(i8* %33, i8* %34, i64 12)
  %36 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !731
  %37 = load i64* %36, align 1, !dbg !731
  %38 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !731
  %39 = load i32* %38, align 1, !dbg !731
  %40 = bitcast { i64, i32 }* %5 to i8*, !dbg !731
  %41 = bitcast %struct.dim3* %3 to i8*, !dbg !731
  %42 = call i8* @memcpy(i8* %40, i8* %41, i64 12)
  %43 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !731
  %44 = load i64* %43, align 1, !dbg !731
  %45 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !731
  %46 = load i32* %45, align 1, !dbg !731
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %37, i32 %39, i64 %44, i32 %46), !dbg !731
  %47 = load i32** %dev_a, align 8, !dbg !733
  call void @_Z3fooPi(i32* %47), !dbg !733
  %48 = load i32** %a, align 8, !dbg !734
  %49 = bitcast i32* %48 to i8*, !dbg !734
  %50 = load i32** %dev_a, align 8, !dbg !734
  %51 = bitcast i32* %50 to i8*, !dbg !734
  %52 = load i32* %size, align 4, !dbg !734
  %53 = sext i32 %52 to i64, !dbg !734
  %54 = call i32 @cudaMemcpy(i8* %49, i8* %51, i64 %53, i32 2), !dbg !734
  store i32 0, i32* %i1, align 4, !dbg !735
  br label %55, !dbg !735

; <label>:55                                      ; preds = %66, %25
  %56 = load i32* %i1, align 4, !dbg !735
  %57 = icmp slt i32 %56, 2, !dbg !735
  br i1 %57, label %58, label %69, !dbg !735

; <label>:58                                      ; preds = %55
  %59 = load i32* %i1, align 4, !dbg !737
  %60 = sext i32 %59 to i64, !dbg !737
  %61 = load i32** %a, align 8, !dbg !737
  %62 = getelementptr inbounds i32* %61, i64 %60, !dbg !737
  %63 = load i32* %62, align 4, !dbg !737
  %64 = icmp eq i32 %63, 2, !dbg !737
  br i1 %64, label %66, label %65, !dbg !737

; <label>:65                                      ; preds = %58
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 35, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwind
  unreachable, !dbg !737

; <label>:66                                      ; preds = %58
  %67 = load i32* %i1, align 4, !dbg !735
  %68 = add nsw i32 %67, 1, !dbg !735
  store i32 %68, i32* %i1, align 4, !dbg !735
  br label %55, !dbg !735

; <label>:69                                      ; preds = %55
  %70 = load i32** %a, align 8, !dbg !739
  %71 = bitcast i32* %70 to i8*, !dbg !739
  call void @free(i8* %71) nounwind, !dbg !739
  %72 = load i32** %dev_a, align 8, !dbg !740
  %73 = bitcast i32* %72 to i8*, !dbg !740
  %74 = call i32 @cudaFree(i8* %73), !dbg !740
  ret i32 0, !dbg !741
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
  %6 = load i32* %2, align 4, !dbg !742
  %7 = load i32* %3, align 4, !dbg !742
  %8 = load i32* %4, align 4, !dbg !742
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !742
  ret void, !dbg !742
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !743
  %7 = load i32* %2, align 4, !dbg !743
  store i32 %7, i32* %6, align 4, !dbg !743
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !743
  %9 = load i32* %3, align 4, !dbg !743
  store i32 %9, i32* %8, align 4, !dbg !743
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !743
  %11 = load i32* %4, align 4, !dbg !743
  store i32 %11, i32* %10, align 4, !dbg !743
  ret void, !dbg !744
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !746
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !746

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !746
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !747
  %4 = load i8* %src.06, align 1, !dbg !747, !tbaa !748
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !747
  store i8 %4, i8* %dest.05, align 1, !dbg !747, !tbaa !748
  %6 = icmp eq i64 %2, 0, !dbg !746
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !746

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !750
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !751
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !751

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !752
  br label %3, !dbg !751

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !751
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !752
  store volatile i8 %2, i8* %a.05, align 1, !dbg !752, !tbaa !748
  %6 = icmp eq i64 %4, 0, !dbg !751
  br i1 %6, label %._crit_edge, label %3, !dbg !751

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !753
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !754
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !756
  ret i32 0, !dbg !758
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !759
  tail call void @free(i8* %1) nounwind, !dbg !759
  ret i32 0, !dbg !761
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !762
  ret i32 0, !dbg !764
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !765
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !767
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !769
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !771
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !773
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !775
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !777
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !779
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !781
  store i8* %1, i8** %devPtr, align 8, !dbg !781, !tbaa !782
  tail call void @__clear_device(), !dbg !783
  ret i32 0, !dbg !784
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !785
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !787
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !789
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !791
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !793
  store i8* %1, i8** %ptr, align 8, !dbg !793, !tbaa !782
  tail call void @__clear_host(), !dbg !794
  ret i32 0, !dbg !795
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !796
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !798
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !800
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !802
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !804
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !806
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !808
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !810
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !812
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !814
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !816
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !818
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !820
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !822
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !824
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !826
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !828
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !830
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !832
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !834
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !836
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !838
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !840
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !842
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !844
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !845
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !847
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !849
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !851
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !852
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !854
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !856
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !858
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !860
}

!llvm.dbg.cu = !{!0, !68, !92, !108, !125}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !11, 
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !21, metadata !24, metadata !67}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"foo", metadata !"foo", metadata !"_Z3fooPi", metadata !16, i32 7, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @_Z3fooPi, null, null, metadata !11, i32 7
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!20 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 12, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 12} ; [ DW_TAG_
!22 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !20}
!24 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !25, i32 419, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!25 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass", null} ; [ DW_TAG_file_type ]
!26 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{null, metadata !28, metadata !32, metadata !32, metadata !32}
!28 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!29 = metadata !{i32 786451, null, metadata !"dim3", metadata !25, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !30, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!30 = metadata !{metadata !31, metadata !33, metadata !34, metadata !35, metadata !38, metadata !56, metadata !59, metadata !64}
!31 = metadata !{i32 786445, metadata !29, metadata !"x", metadata !25, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !32} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!32 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!33 = metadata !{i32 786445, metadata !29, metadata !"y", metadata !25, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !32} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!34 = metadata !{i32 786445, metadata !29, metadata !"z", metadata !25, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !32} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!35 = metadata !{i32 786478, i32 0, metadata !29, metadata !"dim3", metadata !"dim3", metadata !"", metadata !25, i32 419, metadata !26, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !36, i32 419} ; [ DW_TAG_subpr
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!38 = metadata !{i32 786478, i32 0, metadata !29, metadata !"dim3", metadata !"dim3", metadata !"", metadata !25, i32 420, metadata !39, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !36, i32 420} ; [ DW_TAG_subpr
!39 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{null, metadata !28, metadata !41}
!41 = metadata !{i32 786454, null, metadata !"uint3", metadata !25, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!42 = metadata !{i32 786451, null, metadata !"uint3", metadata !25, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !43, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!43 = metadata !{metadata !44, metadata !45, metadata !46, metadata !47, metadata !51}
!44 = metadata !{i32 786445, metadata !42, metadata !"x", metadata !25, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !32} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!45 = metadata !{i32 786445, metadata !42, metadata !"y", metadata !25, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !32} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!46 = metadata !{i32 786445, metadata !42, metadata !"z", metadata !25, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !32} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!47 = metadata !{i32 786478, i32 0, metadata !42, metadata !"uint3", metadata !"uint3", metadata !"", metadata !25, i32 188, metadata !48, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !36, i32 188} ; [ DW_TAG_sub
!48 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{null, metadata !50}
!50 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!51 = metadata !{i32 786478, i32 0, metadata !42, metadata !"uint3", metadata !"uint3", metadata !"", metadata !25, i32 188, metadata !52, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !36, i32 188} ; [ DW_TAG_sub
!52 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{null, metadata !50, metadata !54}
!54 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !55} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!56 = metadata !{i32 786478, i32 0, metadata !29, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !25, i32 421, metadata !57, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!57 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !41, metadata !28}
!59 = metadata !{i32 786478, i32 0, metadata !29, metadata !"dim3", metadata !"dim3", metadata !"", metadata !25, i32 415, metadata !60, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !36, i32 415} ; [ DW_TAG_subpr
!60 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{null, metadata !28, metadata !62}
!62 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !63} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!64 = metadata !{i32 786478, i32 0, metadata !29, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !25, i32 415, metadata !65, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !36, i32 415} ; [ DW_TAG_sub
!65 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{null, metadata !28}
!67 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !25, i32 419, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
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
!111 = metadata !{i32 786478, i32 0, metadata !112, metadata !"memset", metadata !"memset", metadata !"", metadata !112, i32 12, metadata !113, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!112 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!113 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !114, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!114 = metadata !{metadata !75, metadata !75, metadata !20, metadata !115}
!115 = metadata !{i32 786454, null, metadata !"size_t", metadata !112, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!116 = metadata !{metadata !117}
!117 = metadata !{metadata !118, metadata !119, metadata !120, metadata !121}
!118 = metadata !{i32 786689, metadata !111, metadata !"dst", metadata !112, i32 16777228, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!119 = metadata !{i32 786689, metadata !111, metadata !"s", metadata !112, i32 33554444, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!120 = metadata !{i32 786689, metadata !111, metadata !"count", metadata !112, i32 50331660, metadata !115, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!121 = metadata !{i32 786688, metadata !122, metadata !"a", metadata !112, i32 13, metadata !123, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!122 = metadata !{i32 786443, metadata !111, i32 12, i32 0, metadata !112, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!123 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !124} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!124 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!125 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
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
!203 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !129, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !204, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!204 = metadata !{metadata !205, metadata !206, metadata !207, metadata !208}
!205 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!206 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!207 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!208 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!209 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !129, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!210 = metadata !{metadata !211}
!211 = metadata !{metadata !212, metadata !241, metadata !247, metadata !253, metadata !257, metadata !265, metadata !273, metadata !281, metadata !289, metadata !296, metadata !304, metadata !308, metadata !315, metadata !329, metadata !339, metadata !3
!212 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !213, i32 24, metadata !214, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!213 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!214 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !215, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!215 = metadata !{metadata !216, metadata !217, metadata !225, metadata !232, metadata !233}
!216 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !213, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !128} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!217 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !218} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!218 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !129, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !219, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!219 = metadata !{metadata !220, metadata !221, metadata !222, metadata !223, metadata !224}
!220 = metadata !{i32 786445, metadata !218, metadata !"x", metadata !129, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!221 = metadata !{i32 786445, metadata !218, metadata !"y", metadata !129, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !20} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!222 = metadata !{i32 786445, metadata !218, metadata !"z", metadata !129, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!223 = metadata !{i32 786445, metadata !218, metadata !"w", metadata !129, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !20} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!224 = metadata !{i32 786445, metadata !218, metadata !"f", metadata !129, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !203} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!225 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !226} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!226 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !129, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !227, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!227 = metadata !{metadata !228, metadata !230, metadata !231}
!228 = metadata !{i32 786445, metadata !226, metadata !"width", metadata !129, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !229} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!229 = metadata !{i32 786454, null, metadata !"size_t", metadata !129, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!230 = metadata !{i32 786445, metadata !226, metadata !"height", metadata !129, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !229} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!231 = metadata !{i32 786445, metadata !226, metadata !"depth", metadata !129, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !229} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!232 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!233 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !234} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!234 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !129, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!235 = metadata !{metadata !236}
!236 = metadata !{metadata !237, metadata !238, metadata !239, metadata !240}
!237 = metadata !{i32 786689, metadata !212, metadata !"desc", metadata !213, i32 16777240, metadata !217, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!238 = metadata !{i32 786689, metadata !212, metadata !"extent", metadata !213, i32 33554456, metadata !225, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!239 = metadata !{i32 786689, metadata !212, metadata !"flags", metadata !213, i32 50331673, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!240 = metadata !{i32 786689, metadata !212, metadata !"array", metadata !213, i32 67108889, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!241 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !213, i32 29, metadata !242, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !244, 
!242 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !243, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!243 = metadata !{metadata !216, metadata !75}
!244 = metadata !{metadata !245}
!245 = metadata !{metadata !246}
!246 = metadata !{i32 786689, metadata !241, metadata !"devPtr", metadata !213, i32 16777245, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!247 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !213, i32 34, metadata !248, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!248 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !249, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!249 = metadata !{metadata !216, metadata !233}
!250 = metadata !{metadata !251}
!251 = metadata !{metadata !252}
!252 = metadata !{i32 786689, metadata !247, metadata !"array", metadata !213, i32 16777250, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!253 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !213, i32 39, metadata !242, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!254 = metadata !{metadata !255}
!255 = metadata !{metadata !256}
!256 = metadata !{i32 786689, metadata !253, metadata !"ptr", metadata !213, i32 16777255, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!257 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !213, i32 44, metadata !258, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!258 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !259, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!259 = metadata !{metadata !216, metadata !260, metadata !90}
!260 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !75} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!261 = metadata !{metadata !262}
!262 = metadata !{metadata !263, metadata !264}
!263 = metadata !{i32 786689, metadata !257, metadata !"devPtr", metadata !213, i32 16777260, metadata !260, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!264 = metadata !{i32 786689, metadata !257, metadata !"symbol", metadata !213, i32 33554476, metadata !90, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!265 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !213, i32 48, metadata !266, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!266 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !267, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!267 = metadata !{metadata !216, metadata !268, metadata !90}
!268 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !229} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!269 = metadata !{metadata !270}
!270 = metadata !{metadata !271, metadata !272}
!271 = metadata !{i32 786689, metadata !265, metadata !"size", metadata !213, i32 16777264, metadata !268, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!272 = metadata !{i32 786689, metadata !265, metadata !"symbol", metadata !213, i32 33554480, metadata !90, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!273 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !213, i32 52, metadata !274, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!274 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !275, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!275 = metadata !{metadata !216, metadata !260, metadata !229, metadata !32}
!276 = metadata !{metadata !277}
!277 = metadata !{metadata !278, metadata !279, metadata !280}
!278 = metadata !{i32 786689, metadata !273, metadata !"pHost", metadata !213, i32 16777268, metadata !260, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!279 = metadata !{i32 786689, metadata !273, metadata !"size", metadata !213, i32 33554484, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!280 = metadata !{i32 786689, metadata !273, metadata !"flags", metadata !213, i32 50331700, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!281 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !213, i32 56, metadata !282, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!282 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !283, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!283 = metadata !{metadata !216, metadata !260, metadata !75, metadata !32}
!284 = metadata !{metadata !285}
!285 = metadata !{metadata !286, metadata !287, metadata !288}
!286 = metadata !{i32 786689, metadata !281, metadata !"pDevice", metadata !213, i32 16777272, metadata !260, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!287 = metadata !{i32 786689, metadata !281, metadata !"pHost", metadata !213, i32 33554488, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!288 = metadata !{i32 786689, metadata !281, metadata !"flags", metadata !213, i32 50331704, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!289 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !213, i32 60, metadata !290, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!290 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !291, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!291 = metadata !{metadata !216, metadata !232, metadata !75}
!292 = metadata !{metadata !293}
!293 = metadata !{metadata !294, metadata !295}
!294 = metadata !{i32 786689, metadata !289, metadata !"pFlags", metadata !213, i32 16777276, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!295 = metadata !{i32 786689, metadata !289, metadata !"pHost", metadata !213, i32 33554492, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!296 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !213, i32 64, metadata !297, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!297 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !298, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!298 = metadata !{metadata !216, metadata !75, metadata !229, metadata !32}
!299 = metadata !{metadata !300}
!300 = metadata !{metadata !301, metadata !302, metadata !303}
!301 = metadata !{i32 786689, metadata !296, metadata !"ptr", metadata !213, i32 16777280, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!302 = metadata !{i32 786689, metadata !296, metadata !"size", metadata !213, i32 33554496, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!303 = metadata !{i32 786689, metadata !296, metadata !"flags", metadata !213, i32 50331712, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!304 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !213, i32 68, metadata !242, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!305 = metadata !{metadata !306}
!306 = metadata !{metadata !307}
!307 = metadata !{i32 786689, metadata !304, metadata !"ptr", metadata !213, i32 16777284, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!308 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !213, i32 72, metadata !309, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!309 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !310, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!310 = metadata !{metadata !216, metadata !260, metadata !229}
!311 = metadata !{metadata !312}
!312 = metadata !{metadata !313, metadata !314}
!313 = metadata !{i32 786689, metadata !308, metadata !"devPtr", metadata !213, i32 16777288, metadata !260, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!314 = metadata !{i32 786689, metadata !308, metadata !"size", metadata !213, i32 33554504, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!315 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !213, i32 80, metadata !316, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!316 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !317, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!317 = metadata !{metadata !216, metadata !318, metadata !226}
!318 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !319} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!319 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !129, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !320, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!320 = metadata !{metadata !321, metadata !322, metadata !323, metadata !324}
!321 = metadata !{i32 786445, metadata !319, metadata !"ptr", metadata !129, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !75} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!322 = metadata !{i32 786445, metadata !319, metadata !"pitch", metadata !129, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !229} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!323 = metadata !{i32 786445, metadata !319, metadata !"xsize", metadata !129, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !229} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!324 = metadata !{i32 786445, metadata !319, metadata !"ysize", metadata !129, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !229} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!325 = metadata !{metadata !326}
!326 = metadata !{metadata !327, metadata !328}
!327 = metadata !{i32 786689, metadata !315, metadata !"pitchedDevPtr", metadata !213, i32 16777296, metadata !318, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!328 = metadata !{i32 786689, metadata !315, metadata !"extent", metadata !213, i32 33554512, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!329 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !213, i32 84, metadata !330, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!330 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !331, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!331 = metadata !{metadata !216, metadata !332, metadata !217, metadata !226, metadata !32}
!332 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !233} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!333 = metadata !{metadata !334}
!334 = metadata !{metadata !335, metadata !336, metadata !337, metadata !338}
!335 = metadata !{i32 786689, metadata !329, metadata !"array", metadata !213, i32 16777300, metadata !332, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!336 = metadata !{i32 786689, metadata !329, metadata !"desc", metadata !213, i32 33554516, metadata !217, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!337 = metadata !{i32 786689, metadata !329, metadata !"extent", metadata !213, i32 50331733, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!338 = metadata !{i32 786689, metadata !329, metadata !"flags", metadata !213, i32 67108949, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!339 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !213, i32 89, metadata !340, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!340 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !341, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!341 = metadata !{metadata !216, metadata !332, metadata !217, metadata !229, metadata !229, metadata !32}
!342 = metadata !{metadata !343}
!343 = metadata !{metadata !344, metadata !345, metadata !346, metadata !347, metadata !348}
!344 = metadata !{i32 786689, metadata !339, metadata !"array", metadata !213, i32 16777305, metadata !332, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!345 = metadata !{i32 786689, metadata !339, metadata !"desc", metadata !213, i32 33554521, metadata !217, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!346 = metadata !{i32 786689, metadata !339, metadata !"width", metadata !213, i32 50331738, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!347 = metadata !{i32 786689, metadata !339, metadata !"height", metadata !213, i32 67108954, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!348 = metadata !{i32 786689, metadata !339, metadata !"flags", metadata !213, i32 83886170, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!349 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !213, i32 94, metadata !309, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!350 = metadata !{metadata !351}
!351 = metadata !{metadata !352, metadata !353}
!352 = metadata !{i32 786689, metadata !349, metadata !"ptr", metadata !213, i32 16777310, metadata !260, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!353 = metadata !{i32 786689, metadata !349, metadata !"size", metadata !213, i32 33554526, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!354 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !213, i32 102, metadata !355, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!355 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !356, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!356 = metadata !{metadata !216, metadata !260, metadata !268, metadata !229, metadata !229}
!357 = metadata !{metadata !358}
!358 = metadata !{metadata !359, metadata !360, metadata !361, metadata !362}
!359 = metadata !{i32 786689, metadata !354, metadata !"devPtr", metadata !213, i32 16777318, metadata !260, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!360 = metadata !{i32 786689, metadata !354, metadata !"pitch", metadata !213, i32 33554534, metadata !268, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!361 = metadata !{i32 786689, metadata !354, metadata !"width", metadata !213, i32 50331750, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!362 = metadata !{i32 786689, metadata !354, metadata !"height", metadata !213, i32 67108966, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!363 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !213, i32 106, metadata !364, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!364 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !365, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!365 = metadata !{metadata !216, metadata !75, metadata !76, metadata !229, metadata !209}
!366 = metadata !{metadata !367}
!367 = metadata !{metadata !368, metadata !369, metadata !370, metadata !371}
!368 = metadata !{i32 786689, metadata !363, metadata !"dst", metadata !213, i32 16777322, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!369 = metadata !{i32 786689, metadata !363, metadata !"src", metadata !213, i32 33554538, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!370 = metadata !{i32 786689, metadata !363, metadata !"count", metadata !213, i32 50331754, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!371 = metadata !{i32 786689, metadata !363, metadata !"kind", metadata !213, i32 67108970, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!372 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !213, i32 111, metadata !373, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!373 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !374, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!374 = metadata !{metadata !216, metadata !75, metadata !229, metadata !76, metadata !229, metadata !229, metadata !229, metadata !209}
!375 = metadata !{metadata !376}
!376 = metadata !{metadata !377, metadata !378, metadata !379, metadata !380, metadata !381, metadata !382, metadata !383}
!377 = metadata !{i32 786689, metadata !372, metadata !"dst", metadata !213, i32 16777327, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!378 = metadata !{i32 786689, metadata !372, metadata !"dpitch", metadata !213, i32 33554543, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!379 = metadata !{i32 786689, metadata !372, metadata !"src", metadata !213, i32 50331759, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!380 = metadata !{i32 786689, metadata !372, metadata !"spitch", metadata !213, i32 67108975, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!381 = metadata !{i32 786689, metadata !372, metadata !"width", metadata !213, i32 83886192, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!382 = metadata !{i32 786689, metadata !372, metadata !"height", metadata !213, i32 100663408, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!383 = metadata !{i32 786689, metadata !372, metadata !"kind", metadata !213, i32 117440624, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!384 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !213, i32 116, metadata !385, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!385 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !386, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!386 = metadata !{metadata !216, metadata !233, metadata !229, metadata !229, metadata !233, metadata !229, metadata !229, metadata !229, metadata !229, metadata !209}
!387 = metadata !{metadata !388}
!388 = metadata !{metadata !389, metadata !390, metadata !391, metadata !392, metadata !393, metadata !394, metadata !395, metadata !396, metadata !397}
!389 = metadata !{i32 786689, metadata !384, metadata !"dst", metadata !213, i32 16777332, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!390 = metadata !{i32 786689, metadata !384, metadata !"wOffsetDst", metadata !213, i32 33554548, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!391 = metadata !{i32 786689, metadata !384, metadata !"hOffsetDst", metadata !213, i32 50331764, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!392 = metadata !{i32 786689, metadata !384, metadata !"src", metadata !213, i32 67108981, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!393 = metadata !{i32 786689, metadata !384, metadata !"wOffsetSrc", metadata !213, i32 83886197, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!394 = metadata !{i32 786689, metadata !384, metadata !"hOffsetSrc", metadata !213, i32 100663413, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!395 = metadata !{i32 786689, metadata !384, metadata !"width", metadata !213, i32 117440630, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!396 = metadata !{i32 786689, metadata !384, metadata !"height", metadata !213, i32 134217846, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!397 = metadata !{i32 786689, metadata !384, metadata !"kind", metadata !213, i32 150995062, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!398 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !213, i32 122, metadata !399, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!399 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !400, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!400 = metadata !{metadata !216, metadata !75, metadata !229, metadata !76, metadata !229, metadata !229, metadata !229, metadata !209, metadata !401}
!401 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !213, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !402} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!402 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !403} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!403 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !129, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!404 = metadata !{metadata !405}
!405 = metadata !{metadata !406, metadata !407, metadata !408, metadata !409, metadata !410, metadata !411, metadata !412, metadata !413}
!406 = metadata !{i32 786689, metadata !398, metadata !"dst", metadata !213, i32 16777338, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!407 = metadata !{i32 786689, metadata !398, metadata !"dpitch", metadata !213, i32 33554554, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!408 = metadata !{i32 786689, metadata !398, metadata !"src", metadata !213, i32 50331770, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!409 = metadata !{i32 786689, metadata !398, metadata !"spitch", metadata !213, i32 67108986, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!410 = metadata !{i32 786689, metadata !398, metadata !"width", metadata !213, i32 83886203, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!411 = metadata !{i32 786689, metadata !398, metadata !"height", metadata !213, i32 100663419, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!412 = metadata !{i32 786689, metadata !398, metadata !"kind", metadata !213, i32 117440635, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!413 = metadata !{i32 786689, metadata !398, metadata !"stream", metadata !213, i32 134217852, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!414 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !213, i32 128, metadata !415, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!415 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !416, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!416 = metadata !{metadata !216, metadata !75, metadata !229, metadata !233, metadata !229, metadata !229, metadata !229, metadata !229, metadata !209}
!417 = metadata !{metadata !418}
!418 = metadata !{metadata !419, metadata !420, metadata !421, metadata !422, metadata !423, metadata !424, metadata !425, metadata !426}
!419 = metadata !{i32 786689, metadata !414, metadata !"dst", metadata !213, i32 16777344, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!420 = metadata !{i32 786689, metadata !414, metadata !"dpitch", metadata !213, i32 33554560, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!421 = metadata !{i32 786689, metadata !414, metadata !"src", metadata !213, i32 50331776, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!422 = metadata !{i32 786689, metadata !414, metadata !"wOffset", metadata !213, i32 67108993, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!423 = metadata !{i32 786689, metadata !414, metadata !"hOffset", metadata !213, i32 83886209, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!424 = metadata !{i32 786689, metadata !414, metadata !"width", metadata !213, i32 100663425, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!425 = metadata !{i32 786689, metadata !414, metadata !"height", metadata !213, i32 117440641, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!426 = metadata !{i32 786689, metadata !414, metadata !"kind", metadata !213, i32 134217858, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!427 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !213, i32 134, metadata !428, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!428 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !429, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!429 = metadata !{metadata !216, metadata !75, metadata !229, metadata !233, metadata !229, metadata !229, metadata !229, metadata !229, metadata !209, metadata !401}
!430 = metadata !{metadata !431}
!431 = metadata !{metadata !432, metadata !433, metadata !434, metadata !435, metadata !436, metadata !437, metadata !438, metadata !439, metadata !440}
!432 = metadata !{i32 786689, metadata !427, metadata !"dst", metadata !213, i32 16777350, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!433 = metadata !{i32 786689, metadata !427, metadata !"dpitch", metadata !213, i32 33554566, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!434 = metadata !{i32 786689, metadata !427, metadata !"src", metadata !213, i32 50331782, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!435 = metadata !{i32 786689, metadata !427, metadata !"wOffset", metadata !213, i32 67108999, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!436 = metadata !{i32 786689, metadata !427, metadata !"hOffset", metadata !213, i32 83886215, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!437 = metadata !{i32 786689, metadata !427, metadata !"width", metadata !213, i32 100663431, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!438 = metadata !{i32 786689, metadata !427, metadata !"height", metadata !213, i32 117440647, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!439 = metadata !{i32 786689, metadata !427, metadata !"kind", metadata !213, i32 134217864, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!440 = metadata !{i32 786689, metadata !427, metadata !"stream", metadata !213, i32 150995080, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!441 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !213, i32 140, metadata !442, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!442 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !443, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!443 = metadata !{metadata !216, metadata !233, metadata !229, metadata !229, metadata !76, metadata !229, metadata !229, metadata !229, metadata !209}
!444 = metadata !{metadata !445}
!445 = metadata !{metadata !446, metadata !447, metadata !448, metadata !449, metadata !450, metadata !451, metadata !452, metadata !453}
!446 = metadata !{i32 786689, metadata !441, metadata !"dst", metadata !213, i32 16777356, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!447 = metadata !{i32 786689, metadata !441, metadata !"wOffset", metadata !213, i32 33554572, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!448 = metadata !{i32 786689, metadata !441, metadata !"hOffset", metadata !213, i32 50331788, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!449 = metadata !{i32 786689, metadata !441, metadata !"src", metadata !213, i32 67109005, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!450 = metadata !{i32 786689, metadata !441, metadata !"spitch", metadata !213, i32 83886221, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!451 = metadata !{i32 786689, metadata !441, metadata !"width", metadata !213, i32 100663437, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!452 = metadata !{i32 786689, metadata !441, metadata !"height", metadata !213, i32 117440653, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!453 = metadata !{i32 786689, metadata !441, metadata !"kind", metadata !213, i32 134217870, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!454 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !213, i32 146, metadata !455, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!455 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !456, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!456 = metadata !{metadata !216, metadata !233, metadata !229, metadata !229, metadata !76, metadata !229, metadata !229, metadata !229, metadata !209, metadata !401}
!457 = metadata !{metadata !458}
!458 = metadata !{metadata !459, metadata !460, metadata !461, metadata !462, metadata !463, metadata !464, metadata !465, metadata !466, metadata !467}
!459 = metadata !{i32 786689, metadata !454, metadata !"dst", metadata !213, i32 16777362, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!460 = metadata !{i32 786689, metadata !454, metadata !"wOffset", metadata !213, i32 33554578, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!461 = metadata !{i32 786689, metadata !454, metadata !"hOffset", metadata !213, i32 50331794, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!462 = metadata !{i32 786689, metadata !454, metadata !"src", metadata !213, i32 67109011, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!463 = metadata !{i32 786689, metadata !454, metadata !"spitch", metadata !213, i32 83886227, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!464 = metadata !{i32 786689, metadata !454, metadata !"width", metadata !213, i32 100663443, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!465 = metadata !{i32 786689, metadata !454, metadata !"height", metadata !213, i32 117440659, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!466 = metadata !{i32 786689, metadata !454, metadata !"kind", metadata !213, i32 134217876, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!467 = metadata !{i32 786689, metadata !454, metadata !"stream", metadata !213, i32 150995092, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!468 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !213, i32 152, metadata !469, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!469 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !470, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!470 = metadata !{metadata !216, metadata !471}
!471 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !472} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!472 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !473} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!473 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !129, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !474, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!474 = metadata !{metadata !475, metadata !477, metadata !483, metadata !484, metadata !485, metadata !486, metadata !487, metadata !488}
!475 = metadata !{i32 786445, metadata !473, metadata !"srcArray", metadata !129, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !476} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!476 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !129, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !233} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!477 = metadata !{i32 786445, metadata !473, metadata !"srcPos", metadata !129, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !478} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!478 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !129, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !479, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!479 = metadata !{metadata !480, metadata !481, metadata !482}
!480 = metadata !{i32 786445, metadata !478, metadata !"x", metadata !129, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !229} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!481 = metadata !{i32 786445, metadata !478, metadata !"y", metadata !129, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !229} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!482 = metadata !{i32 786445, metadata !478, metadata !"z", metadata !129, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !229} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!483 = metadata !{i32 786445, metadata !473, metadata !"srcPtr", metadata !129, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !319} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!484 = metadata !{i32 786445, metadata !473, metadata !"dstArray", metadata !129, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !476} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!485 = metadata !{i32 786445, metadata !473, metadata !"dstPos", metadata !129, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !478} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!486 = metadata !{i32 786445, metadata !473, metadata !"dstPtr", metadata !129, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !319} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!487 = metadata !{i32 786445, metadata !473, metadata !"extent", metadata !129, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !226} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!488 = metadata !{i32 786445, metadata !473, metadata !"kind", metadata !129, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !209} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!489 = metadata !{metadata !490}
!490 = metadata !{metadata !491}
!491 = metadata !{i32 786689, metadata !468, metadata !"p", metadata !213, i32 16777368, metadata !471, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!492 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !213, i32 156, metadata !493, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!493 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !494, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!494 = metadata !{metadata !216, metadata !471, metadata !401}
!495 = metadata !{metadata !496}
!496 = metadata !{metadata !497, metadata !498}
!497 = metadata !{i32 786689, metadata !492, metadata !"p", metadata !213, i32 16777372, metadata !471, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!498 = metadata !{i32 786689, metadata !492, metadata !"stream", metadata !213, i32 33554588, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!499 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !213, i32 160, metadata !500, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!500 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !501, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!501 = metadata !{metadata !216, metadata !502}
!502 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !503} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!503 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !504} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!504 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !129, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !505, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!505 = metadata !{metadata !506, metadata !507, metadata !508, metadata !509, metadata !510, metadata !511, metadata !512, metadata !513, metadata !514}
!506 = metadata !{i32 786445, metadata !504, metadata !"srcArray", metadata !129, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !476} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!507 = metadata !{i32 786445, metadata !504, metadata !"srcPos", metadata !129, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !478} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!508 = metadata !{i32 786445, metadata !504, metadata !"srcPtr", metadata !129, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !319} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!509 = metadata !{i32 786445, metadata !504, metadata !"srcDevice", metadata !129, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !20} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!510 = metadata !{i32 786445, metadata !504, metadata !"dstArray", metadata !129, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !476} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!511 = metadata !{i32 786445, metadata !504, metadata !"dstPos", metadata !129, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !478} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!512 = metadata !{i32 786445, metadata !504, metadata !"dstPtr", metadata !129, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !319} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!513 = metadata !{i32 786445, metadata !504, metadata !"dstDevice", metadata !129, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !20} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!514 = metadata !{i32 786445, metadata !504, metadata !"extent", metadata !129, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !226} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!515 = metadata !{metadata !516}
!516 = metadata !{metadata !517}
!517 = metadata !{i32 786689, metadata !499, metadata !"p", metadata !213, i32 16777376, metadata !502, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!518 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !213, i32 164, metadata !519, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!519 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !520, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!520 = metadata !{metadata !216, metadata !502, metadata !401}
!521 = metadata !{metadata !522}
!522 = metadata !{metadata !523, metadata !524}
!523 = metadata !{i32 786689, metadata !518, metadata !"p", metadata !213, i32 16777380, metadata !502, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!524 = metadata !{i32 786689, metadata !518, metadata !"stream", metadata !213, i32 33554596, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!525 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !213, i32 168, metadata !526, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!526 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !527, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!527 = metadata !{metadata !216, metadata !233, metadata !229, metadata !229, metadata !233, metadata !229, metadata !229, metadata !229, metadata !209}
!528 = metadata !{metadata !529}
!529 = metadata !{metadata !530, metadata !531, metadata !532, metadata !533, metadata !534, metadata !535, metadata !536, metadata !537}
!530 = metadata !{i32 786689, metadata !525, metadata !"dst", metadata !213, i32 16777384, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!531 = metadata !{i32 786689, metadata !525, metadata !"wOffsetDst", metadata !213, i32 33554600, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!532 = metadata !{i32 786689, metadata !525, metadata !"hOffsetDst", metadata !213, i32 50331816, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!533 = metadata !{i32 786689, metadata !525, metadata !"src", metadata !213, i32 67109033, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!534 = metadata !{i32 786689, metadata !525, metadata !"wOffsetSrc", metadata !213, i32 83886249, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!535 = metadata !{i32 786689, metadata !525, metadata !"hOffsetSrc", metadata !213, i32 100663465, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!536 = metadata !{i32 786689, metadata !525, metadata !"count", metadata !213, i32 117440682, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!537 = metadata !{i32 786689, metadata !525, metadata !"kind", metadata !213, i32 134217898, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!538 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !213, i32 174, metadata !539, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!539 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !540, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!540 = metadata !{metadata !216, metadata !75, metadata !76, metadata !229, metadata !209, metadata !401}
!541 = metadata !{metadata !542}
!542 = metadata !{metadata !543, metadata !544, metadata !545, metadata !546, metadata !547}
!543 = metadata !{i32 786689, metadata !538, metadata !"dst", metadata !213, i32 16777390, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!544 = metadata !{i32 786689, metadata !538, metadata !"src", metadata !213, i32 33554606, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!545 = metadata !{i32 786689, metadata !538, metadata !"count", metadata !213, i32 50331822, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!546 = metadata !{i32 786689, metadata !538, metadata !"kind", metadata !213, i32 67109039, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!547 = metadata !{i32 786689, metadata !538, metadata !"stream", metadata !213, i32 83886255, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!548 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !213, i32 179, metadata !549, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!549 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !550, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!550 = metadata !{metadata !216, metadata !75, metadata !233, metadata !229, metadata !229, metadata !229, metadata !209}
!551 = metadata !{metadata !552}
!552 = metadata !{metadata !553, metadata !554, metadata !555, metadata !556, metadata !557, metadata !558}
!553 = metadata !{i32 786689, metadata !548, metadata !"dst", metadata !213, i32 16777395, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!554 = metadata !{i32 786689, metadata !548, metadata !"src", metadata !213, i32 33554611, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!555 = metadata !{i32 786689, metadata !548, metadata !"wOffset", metadata !213, i32 50331827, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!556 = metadata !{i32 786689, metadata !548, metadata !"hOffset", metadata !213, i32 67109044, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!557 = metadata !{i32 786689, metadata !548, metadata !"count", metadata !213, i32 83886260, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!558 = metadata !{i32 786689, metadata !548, metadata !"kind", metadata !213, i32 100663476, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!559 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !213, i32 184, metadata !560, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!560 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !561, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!561 = metadata !{metadata !216, metadata !75, metadata !233, metadata !229, metadata !229, metadata !229, metadata !209, metadata !401}
!562 = metadata !{metadata !563}
!563 = metadata !{metadata !564, metadata !565, metadata !566, metadata !567, metadata !568, metadata !569, metadata !570}
!564 = metadata !{i32 786689, metadata !559, metadata !"dst", metadata !213, i32 16777400, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!565 = metadata !{i32 786689, metadata !559, metadata !"src", metadata !213, i32 33554616, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!566 = metadata !{i32 786689, metadata !559, metadata !"wOffset", metadata !213, i32 50331832, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!567 = metadata !{i32 786689, metadata !559, metadata !"hOffset", metadata !213, i32 67109049, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!568 = metadata !{i32 786689, metadata !559, metadata !"count", metadata !213, i32 83886265, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!569 = metadata !{i32 786689, metadata !559, metadata !"kind", metadata !213, i32 100663481, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!570 = metadata !{i32 786689, metadata !559, metadata !"stream", metadata !213, i32 117440698, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!571 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !213, i32 190, metadata !572, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!572 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !573, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!573 = metadata !{metadata !216, metadata !75, metadata !90, metadata !229, metadata !229, metadata !209}
!574 = metadata !{metadata !575}
!575 = metadata !{metadata !576, metadata !577, metadata !578, metadata !579, metadata !580}
!576 = metadata !{i32 786689, metadata !571, metadata !"dst", metadata !213, i32 16777406, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!577 = metadata !{i32 786689, metadata !571, metadata !"symbol", metadata !213, i32 33554622, metadata !90, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!578 = metadata !{i32 786689, metadata !571, metadata !"count", metadata !213, i32 50331838, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!579 = metadata !{i32 786689, metadata !571, metadata !"offset", metadata !213, i32 67109055, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!580 = metadata !{i32 786689, metadata !571, metadata !"kind", metadata !213, i32 83886271, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!581 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !213, i32 195, metadata !582, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!582 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !583, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!583 = metadata !{metadata !216, metadata !75, metadata !90, metadata !229, metadata !229, metadata !209, metadata !401}
!584 = metadata !{metadata !585}
!585 = metadata !{metadata !586, metadata !587, metadata !588, metadata !589, metadata !590, metadata !591}
!586 = metadata !{i32 786689, metadata !581, metadata !"dst", metadata !213, i32 16777411, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!587 = metadata !{i32 786689, metadata !581, metadata !"symbol", metadata !213, i32 33554627, metadata !90, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!588 = metadata !{i32 786689, metadata !581, metadata !"count", metadata !213, i32 50331843, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!589 = metadata !{i32 786689, metadata !581, metadata !"offset", metadata !213, i32 67109060, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!590 = metadata !{i32 786689, metadata !581, metadata !"kind", metadata !213, i32 83886276, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!591 = metadata !{i32 786689, metadata !581, metadata !"stream", metadata !213, i32 100663493, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!592 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !213, i32 201, metadata !593, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!593 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !594, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!594 = metadata !{metadata !216, metadata !75, metadata !20, metadata !76, metadata !20, metadata !229}
!595 = metadata !{metadata !596}
!596 = metadata !{metadata !597, metadata !598, metadata !599, metadata !600, metadata !601}
!597 = metadata !{i32 786689, metadata !592, metadata !"dst", metadata !213, i32 16777417, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!598 = metadata !{i32 786689, metadata !592, metadata !"dstDevice", metadata !213, i32 33554633, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!599 = metadata !{i32 786689, metadata !592, metadata !"src", metadata !213, i32 50331849, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!600 = metadata !{i32 786689, metadata !592, metadata !"srcDevice", metadata !213, i32 67109065, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!601 = metadata !{i32 786689, metadata !592, metadata !"count", metadata !213, i32 83886281, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!602 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !213, i32 206, metadata !603, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!603 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !604, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!604 = metadata !{metadata !216, metadata !75, metadata !20, metadata !76, metadata !20, metadata !229, metadata !401}
!605 = metadata !{metadata !606}
!606 = metadata !{metadata !607, metadata !608, metadata !609, metadata !610, metadata !611, metadata !612}
!607 = metadata !{i32 786689, metadata !602, metadata !"dst", metadata !213, i32 16777422, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!608 = metadata !{i32 786689, metadata !602, metadata !"dstDevice", metadata !213, i32 33554638, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!609 = metadata !{i32 786689, metadata !602, metadata !"src", metadata !213, i32 50331854, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!610 = metadata !{i32 786689, metadata !602, metadata !"srcDevice", metadata !213, i32 67109070, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!611 = metadata !{i32 786689, metadata !602, metadata !"count", metadata !213, i32 83886287, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!612 = metadata !{i32 786689, metadata !602, metadata !"stream", metadata !213, i32 100663503, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!613 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !213, i32 212, metadata !614, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!614 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !615, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!615 = metadata !{metadata !216, metadata !233, metadata !229, metadata !229, metadata !76, metadata !229, metadata !209}
!616 = metadata !{metadata !617}
!617 = metadata !{metadata !618, metadata !619, metadata !620, metadata !621, metadata !622, metadata !623}
!618 = metadata !{i32 786689, metadata !613, metadata !"dst", metadata !213, i32 16777428, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!619 = metadata !{i32 786689, metadata !613, metadata !"wOffset", metadata !213, i32 33554644, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!620 = metadata !{i32 786689, metadata !613, metadata !"hOffset", metadata !213, i32 50331860, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!621 = metadata !{i32 786689, metadata !613, metadata !"src", metadata !213, i32 67109077, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!622 = metadata !{i32 786689, metadata !613, metadata !"count", metadata !213, i32 83886293, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!623 = metadata !{i32 786689, metadata !613, metadata !"kind", metadata !213, i32 100663509, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!624 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !213, i32 217, metadata !625, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!625 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !626, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!626 = metadata !{metadata !216, metadata !233, metadata !229, metadata !229, metadata !76, metadata !229, metadata !209, metadata !401}
!627 = metadata !{metadata !628}
!628 = metadata !{metadata !629, metadata !630, metadata !631, metadata !632, metadata !633, metadata !634, metadata !635}
!629 = metadata !{i32 786689, metadata !624, metadata !"dst", metadata !213, i32 16777433, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!630 = metadata !{i32 786689, metadata !624, metadata !"wOffset", metadata !213, i32 33554649, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!631 = metadata !{i32 786689, metadata !624, metadata !"hOffset", metadata !213, i32 50331865, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!632 = metadata !{i32 786689, metadata !624, metadata !"src", metadata !213, i32 67109082, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!633 = metadata !{i32 786689, metadata !624, metadata !"count", metadata !213, i32 83886298, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!634 = metadata !{i32 786689, metadata !624, metadata !"kind", metadata !213, i32 100663514, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!635 = metadata !{i32 786689, metadata !624, metadata !"stream", metadata !213, i32 117440731, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!636 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !213, i32 223, metadata !637, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!637 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !638, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!638 = metadata !{metadata !216, metadata !87, metadata !76, metadata !229, metadata !229, metadata !209}
!639 = metadata !{metadata !640}
!640 = metadata !{metadata !641, metadata !642, metadata !643, metadata !644, metadata !645}
!641 = metadata !{i32 786689, metadata !636, metadata !"symbol", metadata !213, i32 16777439, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!642 = metadata !{i32 786689, metadata !636, metadata !"src", metadata !213, i32 33554655, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!643 = metadata !{i32 786689, metadata !636, metadata !"count", metadata !213, i32 50331871, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!644 = metadata !{i32 786689, metadata !636, metadata !"offset", metadata !213, i32 67109088, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!645 = metadata !{i32 786689, metadata !636, metadata !"kind", metadata !213, i32 83886304, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!646 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !213, i32 229, metadata !647, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!647 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !648, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!648 = metadata !{metadata !216, metadata !90, metadata !76, metadata !229, metadata !229, metadata !209, metadata !401}
!649 = metadata !{metadata !650}
!650 = metadata !{metadata !651, metadata !652, metadata !653, metadata !654, metadata !655, metadata !656}
!651 = metadata !{i32 786689, metadata !646, metadata !"symbol", metadata !213, i32 16777445, metadata !90, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!652 = metadata !{i32 786689, metadata !646, metadata !"src", metadata !213, i32 33554661, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!653 = metadata !{i32 786689, metadata !646, metadata !"count", metadata !213, i32 50331877, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!654 = metadata !{i32 786689, metadata !646, metadata !"offset", metadata !213, i32 67109093, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!655 = metadata !{i32 786689, metadata !646, metadata !"kind", metadata !213, i32 83886310, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!656 = metadata !{i32 786689, metadata !646, metadata !"stream", metadata !213, i32 100663526, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!657 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !213, i32 234, metadata !658, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!658 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !659, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!659 = metadata !{metadata !216, metadata !268, metadata !268}
!660 = metadata !{metadata !661}
!661 = metadata !{metadata !662, metadata !663}
!662 = metadata !{i32 786689, metadata !657, metadata !"free", metadata !213, i32 16777450, metadata !268, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!663 = metadata !{i32 786689, metadata !657, metadata !"total", metadata !213, i32 33554666, metadata !268, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!664 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !213, i32 238, metadata !665, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!665 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !666, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!666 = metadata !{metadata !216, metadata !75, metadata !20, metadata !229}
!667 = metadata !{metadata !668}
!668 = metadata !{metadata !669, metadata !670, metadata !671}
!669 = metadata !{i32 786689, metadata !664, metadata !"devPtr", metadata !213, i32 16777454, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!670 = metadata !{i32 786689, metadata !664, metadata !"value", metadata !213, i32 33554670, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!671 = metadata !{i32 786689, metadata !664, metadata !"count", metadata !213, i32 50331886, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!672 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !213, i32 243, metadata !673, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!673 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !674, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!674 = metadata !{metadata !216, metadata !75, metadata !229, metadata !20, metadata !229, metadata !229}
!675 = metadata !{metadata !676}
!676 = metadata !{metadata !677, metadata !678, metadata !679, metadata !680, metadata !681}
!677 = metadata !{i32 786689, metadata !672, metadata !"devPtr", metadata !213, i32 16777459, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!678 = metadata !{i32 786689, metadata !672, metadata !"pitch", metadata !213, i32 33554675, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!679 = metadata !{i32 786689, metadata !672, metadata !"value", metadata !213, i32 50331891, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!680 = metadata !{i32 786689, metadata !672, metadata !"width", metadata !213, i32 67109108, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!681 = metadata !{i32 786689, metadata !672, metadata !"height", metadata !213, i32 83886324, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!682 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !213, i32 248, metadata !683, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!683 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !684, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!684 = metadata !{metadata !216, metadata !75, metadata !229, metadata !20, metadata !229, metadata !229, metadata !401}
!685 = metadata !{metadata !686}
!686 = metadata !{metadata !687, metadata !688, metadata !689, metadata !690, metadata !691, metadata !692}
!687 = metadata !{i32 786689, metadata !682, metadata !"devPtr", metadata !213, i32 16777464, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!688 = metadata !{i32 786689, metadata !682, metadata !"pitch", metadata !213, i32 33554680, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!689 = metadata !{i32 786689, metadata !682, metadata !"value", metadata !213, i32 50331896, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!690 = metadata !{i32 786689, metadata !682, metadata !"width", metadata !213, i32 67109113, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!691 = metadata !{i32 786689, metadata !682, metadata !"height", metadata !213, i32 83886329, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!692 = metadata !{i32 786689, metadata !682, metadata !"stream", metadata !213, i32 100663545, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!693 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !213, i32 253, metadata !694, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!694 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !695, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!695 = metadata !{metadata !216, metadata !319, metadata !20, metadata !226}
!696 = metadata !{metadata !697}
!697 = metadata !{metadata !698, metadata !699, metadata !700}
!698 = metadata !{i32 786689, metadata !693, metadata !"pitchedDevPtr", metadata !213, i32 16777469, metadata !319, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!699 = metadata !{i32 786689, metadata !693, metadata !"value", metadata !213, i32 33554685, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!700 = metadata !{i32 786689, metadata !693, metadata !"extent", metadata !213, i32 50331902, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!701 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !213, i32 258, metadata !702, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!702 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !703, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!703 = metadata !{metadata !216, metadata !319, metadata !20, metadata !226, metadata !401}
!704 = metadata !{metadata !705}
!705 = metadata !{metadata !706, metadata !707, metadata !708, metadata !709}
!706 = metadata !{i32 786689, metadata !701, metadata !"pitchedDevPtr", metadata !213, i32 16777474, metadata !319, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!707 = metadata !{i32 786689, metadata !701, metadata !"value", metadata !213, i32 33554690, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!708 = metadata !{i32 786689, metadata !701, metadata !"extent", metadata !213, i32 50331907, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!709 = metadata !{i32 786689, metadata !701, metadata !"stream", metadata !213, i32 67109123, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!710 = metadata !{i32 786478, i32 0, metadata !213, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !213, i32 263, metadata !711, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!711 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !712, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!712 = metadata !{metadata !216, metadata !75, metadata !20, metadata !229, metadata !401}
!713 = metadata !{metadata !714}
!714 = metadata !{metadata !715, metadata !716, metadata !717, metadata !718}
!715 = metadata !{i32 786689, metadata !710, metadata !"devPtr", metadata !213, i32 16777479, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!716 = metadata !{i32 786689, metadata !710, metadata !"value", metadata !213, i32 33554695, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!717 = metadata !{i32 786689, metadata !710, metadata !"count", metadata !213, i32 50331911, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!718 = metadata !{i32 786689, metadata !710, metadata !"stream", metadata !213, i32 67109127, metadata !401, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!719 = metadata !{i32 8, i32 0, metadata !720, null}
!720 = metadata !{i32 786443, metadata !15, i32 7, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass/main.cpp]
!721 = metadata !{i32 9, i32 0, metadata !720, null}
!722 = metadata !{i32 10, i32 0, metadata !720, null}
!723 = metadata !{i32 16, i32 0, metadata !724, null}
!724 = metadata !{i32 786443, metadata !21, i32 12, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass/main.cpp]
!725 = metadata !{i32 18, i32 0, metadata !724, null}
!726 = metadata !{i32 20, i32 0, metadata !724, null}
!727 = metadata !{i32 22, i32 0, metadata !728, null}
!728 = metadata !{i32 786443, metadata !724, i32 22, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass/main.cpp]
!729 = metadata !{i32 23, i32 0, metadata !728, null}
!730 = metadata !{i32 25, i32 0, metadata !724, null}
!731 = metadata !{i32 26, i32 0, metadata !732, null}
!732 = metadata !{i32 786443, metadata !724, i32 26, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass/main.cpp]
!733 = metadata !{i32 28, i32 0, metadata !732, null}
!734 = metadata !{i32 32, i32 0, metadata !724, null}
!735 = metadata !{i32 34, i32 0, metadata !736, null}
!736 = metadata !{i32 786443, metadata !724, i32 34, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass/main.cpp]
!737 = metadata !{i32 35, i32 0, metadata !738, null}
!738 = metadata !{i32 786443, metadata !736, i32 34, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass/main.cpp]
!739 = metadata !{i32 38, i32 0, metadata !724, null}
!740 = metadata !{i32 40, i32 0, metadata !724, null}
!741 = metadata !{i32 42, i32 0, metadata !724, null}
!742 = metadata !{i32 419, i32 0, metadata !24, null}
!743 = metadata !{i32 419, i32 0, metadata !67, null}
!744 = metadata !{i32 419, i32 0, metadata !745, null}
!745 = metadata !{i32 786443, metadata !67, i32 419, i32 0, metadata !25, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/049_pass//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!746 = metadata !{i32 16, i32 0, metadata !86, null}
!747 = metadata !{i32 17, i32 0, metadata !86, null}
!748 = metadata !{metadata !"omnipotent char", metadata !749}
!749 = metadata !{metadata !"Simple C/C++ TBAA"}
!750 = metadata !{i32 18, i32 0, metadata !86, null}
!751 = metadata !{i32 14, i32 0, metadata !122, null}
!752 = metadata !{i32 15, i32 0, metadata !122, null}
!753 = metadata !{i32 16, i32 0, metadata !122, null}
!754 = metadata !{i32 26, i32 0, metadata !755, null}
!755 = metadata !{i32 786443, metadata !212, i32 25, i32 0, metadata !213, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!756 = metadata !{i32 30, i32 0, metadata !757, null}
!757 = metadata !{i32 786443, metadata !241, i32 29, i32 0, metadata !213, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!758 = metadata !{i32 31, i32 0, metadata !757, null}
!759 = metadata !{i32 35, i32 0, metadata !760, null}
!760 = metadata !{i32 786443, metadata !247, i32 34, i32 0, metadata !213, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!761 = metadata !{i32 36, i32 0, metadata !760, null}
!762 = metadata !{i32 40, i32 0, metadata !763, null}
!763 = metadata !{i32 786443, metadata !253, i32 39, i32 0, metadata !213, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!764 = metadata !{i32 41, i32 0, metadata !763, null}
!765 = metadata !{i32 45, i32 0, metadata !766, null}
!766 = metadata !{i32 786443, metadata !257, i32 44, i32 0, metadata !213, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!767 = metadata !{i32 49, i32 0, metadata !768, null}
!768 = metadata !{i32 786443, metadata !265, i32 48, i32 0, metadata !213, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!769 = metadata !{i32 53, i32 0, metadata !770, null}
!770 = metadata !{i32 786443, metadata !273, i32 52, i32 0, metadata !213, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!771 = metadata !{i32 57, i32 0, metadata !772, null}
!772 = metadata !{i32 786443, metadata !281, i32 56, i32 0, metadata !213, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!773 = metadata !{i32 61, i32 0, metadata !774, null}
!774 = metadata !{i32 786443, metadata !289, i32 60, i32 0, metadata !213, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!775 = metadata !{i32 65, i32 0, metadata !776, null}
!776 = metadata !{i32 786443, metadata !296, i32 64, i32 0, metadata !213, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!777 = metadata !{i32 69, i32 0, metadata !778, null}
!778 = metadata !{i32 786443, metadata !304, i32 68, i32 0, metadata !213, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!779 = metadata !{i32 73, i32 0, metadata !780, null}
!780 = metadata !{i32 786443, metadata !308, i32 72, i32 0, metadata !213, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!781 = metadata !{i32 74, i32 0, metadata !780, null}
!782 = metadata !{metadata !"any pointer", metadata !748}
!783 = metadata !{i32 75, i32 0, metadata !780, null}
!784 = metadata !{i32 77, i32 0, metadata !780, null}
!785 = metadata !{i32 81, i32 0, metadata !786, null}
!786 = metadata !{i32 786443, metadata !315, i32 80, i32 0, metadata !213, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!787 = metadata !{i32 86, i32 0, metadata !788, null}
!788 = metadata !{i32 786443, metadata !329, i32 85, i32 0, metadata !213, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!789 = metadata !{i32 91, i32 0, metadata !790, null}
!790 = metadata !{i32 786443, metadata !339, i32 90, i32 0, metadata !213, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!791 = metadata !{i32 95, i32 0, metadata !792, null}
!792 = metadata !{i32 786443, metadata !349, i32 94, i32 0, metadata !213, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!793 = metadata !{i32 96, i32 0, metadata !792, null}
!794 = metadata !{i32 97, i32 0, metadata !792, null}
!795 = metadata !{i32 99, i32 0, metadata !792, null}
!796 = metadata !{i32 103, i32 0, metadata !797, null}
!797 = metadata !{i32 786443, metadata !354, i32 102, i32 0, metadata !213, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!798 = metadata !{i32 108, i32 0, metadata !799, null}
!799 = metadata !{i32 786443, metadata !363, i32 106, i32 0, metadata !213, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!800 = metadata !{i32 113, i32 0, metadata !801, null}
!801 = metadata !{i32 786443, metadata !372, i32 112, i32 0, metadata !213, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!802 = metadata !{i32 119, i32 0, metadata !803, null}
!803 = metadata !{i32 786443, metadata !384, i32 118, i32 0, metadata !213, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!804 = metadata !{i32 125, i32 0, metadata !805, null}
!805 = metadata !{i32 786443, metadata !398, i32 124, i32 0, metadata !213, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!806 = metadata !{i32 131, i32 0, metadata !807, null}
!807 = metadata !{i32 786443, metadata !414, i32 130, i32 0, metadata !213, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!808 = metadata !{i32 137, i32 0, metadata !809, null}
!809 = metadata !{i32 786443, metadata !427, i32 136, i32 0, metadata !213, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!810 = metadata !{i32 143, i32 0, metadata !811, null}
!811 = metadata !{i32 786443, metadata !441, i32 142, i32 0, metadata !213, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!812 = metadata !{i32 149, i32 0, metadata !813, null}
!813 = metadata !{i32 786443, metadata !454, i32 148, i32 0, metadata !213, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!814 = metadata !{i32 153, i32 0, metadata !815, null}
!815 = metadata !{i32 786443, metadata !468, i32 152, i32 0, metadata !213, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!816 = metadata !{i32 157, i32 0, metadata !817, null}
!817 = metadata !{i32 786443, metadata !492, i32 156, i32 0, metadata !213, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!818 = metadata !{i32 161, i32 0, metadata !819, null}
!819 = metadata !{i32 786443, metadata !499, i32 160, i32 0, metadata !213, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!820 = metadata !{i32 165, i32 0, metadata !821, null}
!821 = metadata !{i32 786443, metadata !518, i32 164, i32 0, metadata !213, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!822 = metadata !{i32 171, i32 0, metadata !823, null}
!823 = metadata !{i32 786443, metadata !525, i32 170, i32 0, metadata !213, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!824 = metadata !{i32 176, i32 0, metadata !825, null}
!825 = metadata !{i32 786443, metadata !538, i32 175, i32 0, metadata !213, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!826 = metadata !{i32 181, i32 0, metadata !827, null}
!827 = metadata !{i32 786443, metadata !548, i32 180, i32 0, metadata !213, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!828 = metadata !{i32 187, i32 0, metadata !829, null}
!829 = metadata !{i32 786443, metadata !559, i32 186, i32 0, metadata !213, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!830 = metadata !{i32 192, i32 0, metadata !831, null}
!831 = metadata !{i32 786443, metadata !571, i32 191, i32 0, metadata !213, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!832 = metadata !{i32 198, i32 0, metadata !833, null}
!833 = metadata !{i32 786443, metadata !581, i32 197, i32 0, metadata !213, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!834 = metadata !{i32 203, i32 0, metadata !835, null}
!835 = metadata !{i32 786443, metadata !592, i32 201, i32 0, metadata !213, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!836 = metadata !{i32 209, i32 0, metadata !837, null}
!837 = metadata !{i32 786443, metadata !602, i32 207, i32 0, metadata !213, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!838 = metadata !{i32 214, i32 0, metadata !839, null}
!839 = metadata !{i32 786443, metadata !613, i32 213, i32 0, metadata !213, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!840 = metadata !{i32 220, i32 0, metadata !841, null}
!841 = metadata !{i32 786443, metadata !624, i32 219, i32 0, metadata !213, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!842 = metadata !{i32 225, i32 0, metadata !843, null}
!843 = metadata !{i32 786443, metadata !636, i32 224, i32 0, metadata !213, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!844 = metadata !{i32 226, i32 0, metadata !843, null}
!845 = metadata !{i32 231, i32 0, metadata !846, null}
!846 = metadata !{i32 786443, metadata !646, i32 230, i32 0, metadata !213, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!847 = metadata !{i32 235, i32 0, metadata !848, null}
!848 = metadata !{i32 786443, metadata !657, i32 234, i32 0, metadata !213, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!849 = metadata !{i32 239, i32 0, metadata !850, null}
!850 = metadata !{i32 786443, metadata !664, i32 238, i32 0, metadata !213, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!851 = metadata !{i32 240, i32 0, metadata !850, null}
!852 = metadata !{i32 245, i32 0, metadata !853, null}
!853 = metadata !{i32 786443, metadata !672, i32 244, i32 0, metadata !213, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!854 = metadata !{i32 250, i32 0, metadata !855, null}
!855 = metadata !{i32 786443, metadata !682, i32 249, i32 0, metadata !213, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!856 = metadata !{i32 255, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !693, i32 254, i32 0, metadata !213, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!858 = metadata !{i32 260, i32 0, metadata !859, null}
!859 = metadata !{i32 786443, metadata !701, i32 259, i32 0, metadata !213, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!860 = metadata !{i32 264, i32 0, metadata !861, null}
!861 = metadata !{i32 786443, metadata !710, i32 263, i32 0, metadata !213, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
