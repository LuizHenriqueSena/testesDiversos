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
@.str = private unnamed_addr constant [10 x i8] c"a[i] == i\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define void @_Z9helloCUDAPVi(i32* %p) nounwind uwtable noinline {
  %1 = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !720
  %3 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !720
  %4 = zext i32 %3 to i64, !dbg !720
  %5 = load i32** %1, align 8, !dbg !720
  %6 = getelementptr inbounds i32* %5, i64 %4, !dbg !720
  store volatile i32 %2, i32* %6, align 4, !dbg !720
  ret void, !dbg !722
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %a = alloca i32*, align 8
  %dev_a = alloca i32*, align 8
  %size = alloca i32, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 8, i32* %size, align 4, !dbg !723
  %6 = load i32* %size, align 4, !dbg !725
  %7 = sext i32 %6 to i64, !dbg !725
  %8 = call noalias i8* @malloc(i64 %7) nounwind, !dbg !725
  %9 = bitcast i8* %8 to i32*, !dbg !725
  store i32* %9, i32** %a, align 8, !dbg !725
  %10 = bitcast i32** %dev_a to i8**, !dbg !726
  %11 = load i32* %size, align 4, !dbg !726
  %12 = sext i32 %11 to i64, !dbg !726
  %13 = call i32 @cudaMalloc(i8** %10, i64 %12), !dbg !726
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !727
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 2, i32 1, i32 1), !dbg !727
  %14 = bitcast { i64, i32 }* %4 to i8*, !dbg !727
  %15 = bitcast %struct.dim3* %2 to i8*, !dbg !727
  %16 = call i8* @memcpy(i8* %14, i8* %15, i64 12)
  %17 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !727
  %18 = load i64* %17, align 1, !dbg !727
  %19 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !727
  %20 = load i32* %19, align 1, !dbg !727
  %21 = bitcast { i64, i32 }* %5 to i8*, !dbg !727
  %22 = bitcast %struct.dim3* %3 to i8*, !dbg !727
  %23 = call i8* @memcpy(i8* %21, i8* %22, i64 12)
  %24 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !727
  %25 = load i64* %24, align 1, !dbg !727
  %26 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !727
  %27 = load i32* %26, align 1, !dbg !727
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %18, i32 %20, i64 %25, i32 %27), !dbg !727
  %28 = load i32** %dev_a, align 8, !dbg !729
  call void @_Z9helloCUDAPVi(i32* %28), !dbg !729
  %29 = load i32** %a, align 8, !dbg !730
  %30 = bitcast i32* %29 to i8*, !dbg !730
  %31 = load i32** %dev_a, align 8, !dbg !730
  %32 = bitcast i32* %31 to i8*, !dbg !730
  %33 = load i32* %size, align 4, !dbg !730
  %34 = sext i32 %33 to i64, !dbg !730
  %35 = call i32 @cudaMemcpy(i8* %30, i8* %32, i64 %34, i32 2), !dbg !730
  store i32 0, i32* %i, align 4, !dbg !731
  br label %36, !dbg !731

; <label>:36                                      ; preds = %48, %0
  %37 = load i32* %i, align 4, !dbg !731
  %38 = icmp slt i32 %37, 2, !dbg !731
  br i1 %38, label %39, label %51, !dbg !731

; <label>:39                                      ; preds = %36
  %40 = load i32* %i, align 4, !dbg !733
  %41 = sext i32 %40 to i64, !dbg !733
  %42 = load i32** %a, align 8, !dbg !733
  %43 = getelementptr inbounds i32* %42, i64 %41, !dbg !733
  %44 = load i32* %43, align 4, !dbg !733
  %45 = load i32* %i, align 4, !dbg !733
  %46 = icmp eq i32 %44, %45, !dbg !733
  br i1 %46, label %48, label %47, !dbg !733

; <label>:47                                      ; preds = %39
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 33, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwin
  unreachable, !dbg !733

; <label>:48                                      ; preds = %39
  %49 = load i32* %i, align 4, !dbg !731
  %50 = add nsw i32 %49, 1, !dbg !731
  store i32 %50, i32* %i, align 4, !dbg !731
  br label %36, !dbg !731

; <label>:51                                      ; preds = %36
  %52 = load i32** %a, align 8, !dbg !735
  %53 = bitcast i32* %52 to i8*, !dbg !735
  call void @free(i8* %53) nounwind, !dbg !735
  %54 = load i32** %dev_a, align 8, !dbg !736
  %55 = bitcast i32* %54 to i8*, !dbg !736
  %56 = call i32 @cudaFree(i8* %55), !dbg !736
  ret i32 0, !dbg !737
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
  %6 = load i32* %2, align 4, !dbg !738
  %7 = load i32* %3, align 4, !dbg !738
  %8 = load i32* %4, align 4, !dbg !738
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !738
  ret void, !dbg !738
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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !739
  %7 = load i32* %2, align 4, !dbg !739
  store i32 %7, i32* %6, align 4, !dbg !739
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !739
  %9 = load i32* %3, align 4, !dbg !739
  store i32 %9, i32* %8, align 4, !dbg !739
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !739
  %11 = load i32* %4, align 4, !dbg !739
  store i32 %11, i32* %10, align 4, !dbg !739
  ret void, !dbg !740
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !742
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !742

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !742
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !743
  %4 = load i8* %src.06, align 1, !dbg !743, !tbaa !744
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !743
  store i8 %4, i8* %dest.05, align 1, !dbg !743, !tbaa !744
  %6 = icmp eq i64 %2, 0, !dbg !742
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !742

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !746
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !747
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !747

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !748
  br label %3, !dbg !747

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !747
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !748
  store volatile i8 %2, i8* %a.05, align 1, !dbg !748, !tbaa !744
  %6 = icmp eq i64 %4, 0, !dbg !747
  br i1 %6, label %._crit_edge, label %3, !dbg !747

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !749
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !750
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !752
  ret i32 0, !dbg !754
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !755
  tail call void @free(i8* %1) nounwind, !dbg !755
  ret i32 0, !dbg !757
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !758
  ret i32 0, !dbg !760
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !761
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !763
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !765
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !767
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !769
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !771
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !773
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !775
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !777
  store i8* %1, i8** %devPtr, align 8, !dbg !777, !tbaa !778
  tail call void @__clear_device(), !dbg !779
  ret i32 0, !dbg !780
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !781
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !783
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !785
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !787
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !789
  store i8* %1, i8** %ptr, align 8, !dbg !789, !tbaa !778
  tail call void @__clear_host(), !dbg !790
  ret i32 0, !dbg !791
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !792
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !794
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !796
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !798
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !800
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !802
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !804
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !806
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !808
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !810
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !812
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !814
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !816
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !818
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !820
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !822
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !824
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !826
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !828
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !830
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !832
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !834
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !836
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !838
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !840
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !841
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !843
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !845
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !847
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !848
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !850
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !852
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !854
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !856
}

!llvm.dbg.cu = !{!0, !69, !93, !109, !126}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/053_misc2", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !11,
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/053_misc2", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !22, metadata !25, metadata !68}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"helloCUDA", metadata !"helloCUDA", metadata !"_Z9helloCUDAPVi", metadata !16, i32 10, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @_Z9helloCUDAPVi, null
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/053_misc2", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from int]
!21 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!22 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 16, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 16} ; [ DW_TAG_
!23 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !21}
!25 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !26, i32 419, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!26 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/053_misc2", null} ; [ DW_TAG_file_type ]
!27 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{null, metadata !29, metadata !33, metadata !33, metadata !33}
!29 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!30 = metadata !{i32 786451, null, metadata !"dim3", metadata !26, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !31, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!31 = metadata !{metadata !32, metadata !34, metadata !35, metadata !36, metadata !39, metadata !57, metadata !60, metadata !65}
!32 = metadata !{i32 786445, metadata !30, metadata !"x", metadata !26, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !33} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!33 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!34 = metadata !{i32 786445, metadata !30, metadata !"y", metadata !26, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !33} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!35 = metadata !{i32 786445, metadata !30, metadata !"z", metadata !26, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !33} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!36 = metadata !{i32 786478, i32 0, metadata !30, metadata !"dim3", metadata !"dim3", metadata !"", metadata !26, i32 419, metadata !27, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !37, i32 419} ; [ DW_TAG_subpr
!37 = metadata !{metadata !38}
!38 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!39 = metadata !{i32 786478, i32 0, metadata !30, metadata !"dim3", metadata !"dim3", metadata !"", metadata !26, i32 420, metadata !40, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !37, i32 420} ; [ DW_TAG_subpr
!40 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{null, metadata !29, metadata !42}
!42 = metadata !{i32 786454, null, metadata !"uint3", metadata !26, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!43 = metadata !{i32 786451, null, metadata !"uint3", metadata !26, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !44, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!44 = metadata !{metadata !45, metadata !46, metadata !47, metadata !48, metadata !52}
!45 = metadata !{i32 786445, metadata !43, metadata !"x", metadata !26, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !33} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!46 = metadata !{i32 786445, metadata !43, metadata !"y", metadata !26, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !33} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!47 = metadata !{i32 786445, metadata !43, metadata !"z", metadata !26, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !33} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!48 = metadata !{i32 786478, i32 0, metadata !43, metadata !"uint3", metadata !"uint3", metadata !"", metadata !26, i32 188, metadata !49, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !37, i32 188} ; [ DW_TAG_sub
!49 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = metadata !{null, metadata !51}
!51 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !43} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!52 = metadata !{i32 786478, i32 0, metadata !43, metadata !"uint3", metadata !"uint3", metadata !"", metadata !26, i32 188, metadata !53, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !37, i32 188} ; [ DW_TAG_sub
!53 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = metadata !{null, metadata !51, metadata !55}
!55 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !56} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!57 = metadata !{i32 786478, i32 0, metadata !30, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !26, i32 421, metadata !58, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!58 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = metadata !{metadata !42, metadata !29}
!60 = metadata !{i32 786478, i32 0, metadata !30, metadata !"dim3", metadata !"dim3", metadata !"", metadata !26, i32 415, metadata !61, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !37, i32 415} ; [ DW_TAG_subpr
!61 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !62, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = metadata !{null, metadata !29, metadata !63}
!63 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!65 = metadata !{i32 786478, i32 0, metadata !30, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !26, i32 415, metadata !66, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !37, i32 415} ; [ DW_TAG_sub
!66 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !67, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = metadata !{null, metadata !29}
!68 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !26, i32 419, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!69 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!70 = metadata !{metadata !71}
!71 = metadata !{metadata !72}
!72 = metadata !{i32 786478, i32 0, metadata !73, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !73, i32 12, metadata !74, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !81, i
!73 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!74 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !75, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = metadata !{metadata !76, metadata !76, metadata !77, metadata !79}
!76 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!77 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!78 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = metadata !{i32 786454, null, metadata !"size_t", metadata !73, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !80} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!80 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!81 = metadata !{metadata !82}
!82 = metadata !{metadata !83, metadata !84, metadata !85, metadata !86, metadata !90}
!83 = metadata !{i32 786689, metadata !72, metadata !"destaddr", metadata !73, i32 16777228, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!84 = metadata !{i32 786689, metadata !72, metadata !"srcaddr", metadata !73, i32 33554444, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!85 = metadata !{i32 786689, metadata !72, metadata !"len", metadata !73, i32 50331660, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!86 = metadata !{i32 786688, metadata !87, metadata !"dest", metadata !73, i32 13, metadata !88, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!87 = metadata !{i32 786443, metadata !72, i32 12, i32 0, metadata !73, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!88 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !89} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!89 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!90 = metadata !{i32 786688, metadata !87, metadata !"src", metadata !73, i32 14, metadata !91, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!91 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !92} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!92 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !89} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!93 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!94 = metadata !{metadata !95}
!95 = metadata !{metadata !96}
!96 = metadata !{i32 786478, i32 0, metadata !97, metadata !"memmove", metadata !"memmove", metadata !"", metadata !97, i32 12, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !101, i32 12} ; [ DW_TAG_sub
!97 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!98 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!99 = metadata !{metadata !76, metadata !76, metadata !77, metadata !100}
!100 = metadata !{i32 786454, null, metadata !"size_t", metadata !97, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !80} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!101 = metadata !{metadata !102}
!102 = metadata !{metadata !103, metadata !104, metadata !105, metadata !106, metadata !108}
!103 = metadata !{i32 786689, metadata !96, metadata !"dst", metadata !97, i32 16777228, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!104 = metadata !{i32 786689, metadata !96, metadata !"src", metadata !97, i32 33554444, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!105 = metadata !{i32 786689, metadata !96, metadata !"count", metadata !97, i32 50331660, metadata !100, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!106 = metadata !{i32 786688, metadata !107, metadata !"a", metadata !97, i32 14, metadata !88, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!107 = metadata !{i32 786443, metadata !96, i32 12, i32 0, metadata !97, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/
!108 = metadata !{i32 786688, metadata !107, metadata !"b", metadata !97, i32 15, metadata !91, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!109 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!110 = metadata !{metadata !111}
!111 = metadata !{metadata !112}
!112 = metadata !{i32 786478, i32 0, metadata !113, metadata !"memset", metadata !"memset", metadata !"", metadata !113, i32 12, metadata !114, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!113 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!114 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !115, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!115 = metadata !{metadata !76, metadata !76, metadata !21, metadata !116}
!116 = metadata !{i32 786454, null, metadata !"size_t", metadata !113, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !80} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!117 = metadata !{metadata !118}
!118 = metadata !{metadata !119, metadata !120, metadata !121, metadata !122}
!119 = metadata !{i32 786689, metadata !112, metadata !"dst", metadata !113, i32 16777228, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!120 = metadata !{i32 786689, metadata !112, metadata !"s", metadata !113, i32 33554444, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!121 = metadata !{i32 786689, metadata !112, metadata !"count", metadata !113, i32 50331660, metadata !116, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!122 = metadata !{i32 786688, metadata !123, metadata !"a", metadata !113, i32 13, metadata !124, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!123 = metadata !{i32 786443, metadata !112, i32 12, i32 0, metadata !113, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!124 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !125} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!125 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !89} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!126 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!127 = metadata !{metadata !128}
!128 = metadata !{metadata !129, metadata !204, metadata !210}
!129 = metadata !{i32 786436, null, metadata !"cudaError", metadata !130, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !131, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!130 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!131 = metadata !{metadata !132, metadata !133, metadata !134, metadata !135, metadata !136, metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146, metadata !1
!132 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!133 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!134 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!135 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!136 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!137 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!138 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!139 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!140 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!141 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!142 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!143 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!144 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!145 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!146 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!147 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!148 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!149 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!150 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!151 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!152 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!153 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!154 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!155 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!156 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!157 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!158 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!159 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!160 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!161 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!162 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!163 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!164 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!165 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!166 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!167 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!168 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!169 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!170 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!171 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!172 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!173 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!174 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!175 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!176 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!177 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!178 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!179 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!180 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!181 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!182 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!183 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!184 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!185 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!186 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!187 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!188 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!189 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!190 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!191 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!192 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!193 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!194 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!195 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!196 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!197 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!198 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!199 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!200 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!201 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!202 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!203 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!204 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !130, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !205, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!205 = metadata !{metadata !206, metadata !207, metadata !208, metadata !209}
!206 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!207 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!208 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!209 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!210 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !130, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!211 = metadata !{metadata !212}
!212 = metadata !{metadata !213, metadata !242, metadata !248, metadata !254, metadata !258, metadata !266, metadata !274, metadata !282, metadata !290, metadata !297, metadata !305, metadata !309, metadata !316, metadata !330, metadata !340, metadata !3
!213 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !214, i32 24, metadata !215, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!214 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!215 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !216, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!216 = metadata !{metadata !217, metadata !218, metadata !226, metadata !233, metadata !234}
!217 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !214, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !129} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!218 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !219} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!219 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !130, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !220, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!220 = metadata !{metadata !221, metadata !222, metadata !223, metadata !224, metadata !225}
!221 = metadata !{i32 786445, metadata !219, metadata !"x", metadata !130, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!222 = metadata !{i32 786445, metadata !219, metadata !"y", metadata !130, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !21} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!223 = metadata !{i32 786445, metadata !219, metadata !"z", metadata !130, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!224 = metadata !{i32 786445, metadata !219, metadata !"w", metadata !130, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !21} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!225 = metadata !{i32 786445, metadata !219, metadata !"f", metadata !130, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !204} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!226 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !227} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!227 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !130, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !228, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!228 = metadata !{metadata !229, metadata !231, metadata !232}
!229 = metadata !{i32 786445, metadata !227, metadata !"width", metadata !130, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !230} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!230 = metadata !{i32 786454, null, metadata !"size_t", metadata !130, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !80} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!231 = metadata !{i32 786445, metadata !227, metadata !"height", metadata !130, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !230} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!232 = metadata !{i32 786445, metadata !227, metadata !"depth", metadata !130, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !230} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!233 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!234 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !235} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!235 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !130, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!236 = metadata !{metadata !237}
!237 = metadata !{metadata !238, metadata !239, metadata !240, metadata !241}
!238 = metadata !{i32 786689, metadata !213, metadata !"desc", metadata !214, i32 16777240, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!239 = metadata !{i32 786689, metadata !213, metadata !"extent", metadata !214, i32 33554456, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!240 = metadata !{i32 786689, metadata !213, metadata !"flags", metadata !214, i32 50331673, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!241 = metadata !{i32 786689, metadata !213, metadata !"array", metadata !214, i32 67108889, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!242 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !214, i32 29, metadata !243, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !245, 
!243 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !244, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!244 = metadata !{metadata !217, metadata !76}
!245 = metadata !{metadata !246}
!246 = metadata !{metadata !247}
!247 = metadata !{i32 786689, metadata !242, metadata !"devPtr", metadata !214, i32 16777245, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!248 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !214, i32 34, metadata !249, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!249 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !250, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!250 = metadata !{metadata !217, metadata !234}
!251 = metadata !{metadata !252}
!252 = metadata !{metadata !253}
!253 = metadata !{i32 786689, metadata !248, metadata !"array", metadata !214, i32 16777250, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!254 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !214, i32 39, metadata !243, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!255 = metadata !{metadata !256}
!256 = metadata !{metadata !257}
!257 = metadata !{i32 786689, metadata !254, metadata !"ptr", metadata !214, i32 16777255, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!258 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !214, i32 44, metadata !259, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!259 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !260, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!260 = metadata !{metadata !217, metadata !261, metadata !91}
!261 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !76} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!262 = metadata !{metadata !263}
!263 = metadata !{metadata !264, metadata !265}
!264 = metadata !{i32 786689, metadata !258, metadata !"devPtr", metadata !214, i32 16777260, metadata !261, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!265 = metadata !{i32 786689, metadata !258, metadata !"symbol", metadata !214, i32 33554476, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!266 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !214, i32 48, metadata !267, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!267 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !268, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!268 = metadata !{metadata !217, metadata !269, metadata !91}
!269 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !230} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!270 = metadata !{metadata !271}
!271 = metadata !{metadata !272, metadata !273}
!272 = metadata !{i32 786689, metadata !266, metadata !"size", metadata !214, i32 16777264, metadata !269, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!273 = metadata !{i32 786689, metadata !266, metadata !"symbol", metadata !214, i32 33554480, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!274 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !214, i32 52, metadata !275, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!275 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !276, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!276 = metadata !{metadata !217, metadata !261, metadata !230, metadata !33}
!277 = metadata !{metadata !278}
!278 = metadata !{metadata !279, metadata !280, metadata !281}
!279 = metadata !{i32 786689, metadata !274, metadata !"pHost", metadata !214, i32 16777268, metadata !261, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!280 = metadata !{i32 786689, metadata !274, metadata !"size", metadata !214, i32 33554484, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!281 = metadata !{i32 786689, metadata !274, metadata !"flags", metadata !214, i32 50331700, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!282 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !214, i32 56, metadata !283, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!283 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !284, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!284 = metadata !{metadata !217, metadata !261, metadata !76, metadata !33}
!285 = metadata !{metadata !286}
!286 = metadata !{metadata !287, metadata !288, metadata !289}
!287 = metadata !{i32 786689, metadata !282, metadata !"pDevice", metadata !214, i32 16777272, metadata !261, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!288 = metadata !{i32 786689, metadata !282, metadata !"pHost", metadata !214, i32 33554488, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!289 = metadata !{i32 786689, metadata !282, metadata !"flags", metadata !214, i32 50331704, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!290 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !214, i32 60, metadata !291, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!291 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !292, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!292 = metadata !{metadata !217, metadata !233, metadata !76}
!293 = metadata !{metadata !294}
!294 = metadata !{metadata !295, metadata !296}
!295 = metadata !{i32 786689, metadata !290, metadata !"pFlags", metadata !214, i32 16777276, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!296 = metadata !{i32 786689, metadata !290, metadata !"pHost", metadata !214, i32 33554492, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!297 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !214, i32 64, metadata !298, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!298 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !299, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!299 = metadata !{metadata !217, metadata !76, metadata !230, metadata !33}
!300 = metadata !{metadata !301}
!301 = metadata !{metadata !302, metadata !303, metadata !304}
!302 = metadata !{i32 786689, metadata !297, metadata !"ptr", metadata !214, i32 16777280, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!303 = metadata !{i32 786689, metadata !297, metadata !"size", metadata !214, i32 33554496, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!304 = metadata !{i32 786689, metadata !297, metadata !"flags", metadata !214, i32 50331712, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!305 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !214, i32 68, metadata !243, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!306 = metadata !{metadata !307}
!307 = metadata !{metadata !308}
!308 = metadata !{i32 786689, metadata !305, metadata !"ptr", metadata !214, i32 16777284, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!309 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !214, i32 72, metadata !310, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!310 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !311, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!311 = metadata !{metadata !217, metadata !261, metadata !230}
!312 = metadata !{metadata !313}
!313 = metadata !{metadata !314, metadata !315}
!314 = metadata !{i32 786689, metadata !309, metadata !"devPtr", metadata !214, i32 16777288, metadata !261, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!315 = metadata !{i32 786689, metadata !309, metadata !"size", metadata !214, i32 33554504, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!316 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !214, i32 80, metadata !317, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!317 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !318, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!318 = metadata !{metadata !217, metadata !319, metadata !227}
!319 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !320} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!320 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !130, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !321, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!321 = metadata !{metadata !322, metadata !323, metadata !324, metadata !325}
!322 = metadata !{i32 786445, metadata !320, metadata !"ptr", metadata !130, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !76} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!323 = metadata !{i32 786445, metadata !320, metadata !"pitch", metadata !130, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !230} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!324 = metadata !{i32 786445, metadata !320, metadata !"xsize", metadata !130, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !230} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!325 = metadata !{i32 786445, metadata !320, metadata !"ysize", metadata !130, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !230} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!326 = metadata !{metadata !327}
!327 = metadata !{metadata !328, metadata !329}
!328 = metadata !{i32 786689, metadata !316, metadata !"pitchedDevPtr", metadata !214, i32 16777296, metadata !319, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!329 = metadata !{i32 786689, metadata !316, metadata !"extent", metadata !214, i32 33554512, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!330 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !214, i32 84, metadata !331, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!331 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !332, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!332 = metadata !{metadata !217, metadata !333, metadata !218, metadata !227, metadata !33}
!333 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !234} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!334 = metadata !{metadata !335}
!335 = metadata !{metadata !336, metadata !337, metadata !338, metadata !339}
!336 = metadata !{i32 786689, metadata !330, metadata !"array", metadata !214, i32 16777300, metadata !333, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!337 = metadata !{i32 786689, metadata !330, metadata !"desc", metadata !214, i32 33554516, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!338 = metadata !{i32 786689, metadata !330, metadata !"extent", metadata !214, i32 50331733, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!339 = metadata !{i32 786689, metadata !330, metadata !"flags", metadata !214, i32 67108949, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!340 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !214, i32 89, metadata !341, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!341 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !342, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!342 = metadata !{metadata !217, metadata !333, metadata !218, metadata !230, metadata !230, metadata !33}
!343 = metadata !{metadata !344}
!344 = metadata !{metadata !345, metadata !346, metadata !347, metadata !348, metadata !349}
!345 = metadata !{i32 786689, metadata !340, metadata !"array", metadata !214, i32 16777305, metadata !333, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!346 = metadata !{i32 786689, metadata !340, metadata !"desc", metadata !214, i32 33554521, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!347 = metadata !{i32 786689, metadata !340, metadata !"width", metadata !214, i32 50331738, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!348 = metadata !{i32 786689, metadata !340, metadata !"height", metadata !214, i32 67108954, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!349 = metadata !{i32 786689, metadata !340, metadata !"flags", metadata !214, i32 83886170, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!350 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !214, i32 94, metadata !310, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!351 = metadata !{metadata !352}
!352 = metadata !{metadata !353, metadata !354}
!353 = metadata !{i32 786689, metadata !350, metadata !"ptr", metadata !214, i32 16777310, metadata !261, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!354 = metadata !{i32 786689, metadata !350, metadata !"size", metadata !214, i32 33554526, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!355 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !214, i32 102, metadata !356, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!356 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !357, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!357 = metadata !{metadata !217, metadata !261, metadata !269, metadata !230, metadata !230}
!358 = metadata !{metadata !359}
!359 = metadata !{metadata !360, metadata !361, metadata !362, metadata !363}
!360 = metadata !{i32 786689, metadata !355, metadata !"devPtr", metadata !214, i32 16777318, metadata !261, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!361 = metadata !{i32 786689, metadata !355, metadata !"pitch", metadata !214, i32 33554534, metadata !269, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!362 = metadata !{i32 786689, metadata !355, metadata !"width", metadata !214, i32 50331750, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!363 = metadata !{i32 786689, metadata !355, metadata !"height", metadata !214, i32 67108966, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!364 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !214, i32 106, metadata !365, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!365 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !366, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!366 = metadata !{metadata !217, metadata !76, metadata !77, metadata !230, metadata !210}
!367 = metadata !{metadata !368}
!368 = metadata !{metadata !369, metadata !370, metadata !371, metadata !372}
!369 = metadata !{i32 786689, metadata !364, metadata !"dst", metadata !214, i32 16777322, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!370 = metadata !{i32 786689, metadata !364, metadata !"src", metadata !214, i32 33554538, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!371 = metadata !{i32 786689, metadata !364, metadata !"count", metadata !214, i32 50331754, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!372 = metadata !{i32 786689, metadata !364, metadata !"kind", metadata !214, i32 67108970, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!373 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !214, i32 111, metadata !374, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!374 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !375, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!375 = metadata !{metadata !217, metadata !76, metadata !230, metadata !77, metadata !230, metadata !230, metadata !230, metadata !210}
!376 = metadata !{metadata !377}
!377 = metadata !{metadata !378, metadata !379, metadata !380, metadata !381, metadata !382, metadata !383, metadata !384}
!378 = metadata !{i32 786689, metadata !373, metadata !"dst", metadata !214, i32 16777327, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!379 = metadata !{i32 786689, metadata !373, metadata !"dpitch", metadata !214, i32 33554543, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!380 = metadata !{i32 786689, metadata !373, metadata !"src", metadata !214, i32 50331759, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!381 = metadata !{i32 786689, metadata !373, metadata !"spitch", metadata !214, i32 67108975, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!382 = metadata !{i32 786689, metadata !373, metadata !"width", metadata !214, i32 83886192, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!383 = metadata !{i32 786689, metadata !373, metadata !"height", metadata !214, i32 100663408, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!384 = metadata !{i32 786689, metadata !373, metadata !"kind", metadata !214, i32 117440624, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!385 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !214, i32 116, metadata !386, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!386 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !387, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!387 = metadata !{metadata !217, metadata !234, metadata !230, metadata !230, metadata !234, metadata !230, metadata !230, metadata !230, metadata !230, metadata !210}
!388 = metadata !{metadata !389}
!389 = metadata !{metadata !390, metadata !391, metadata !392, metadata !393, metadata !394, metadata !395, metadata !396, metadata !397, metadata !398}
!390 = metadata !{i32 786689, metadata !385, metadata !"dst", metadata !214, i32 16777332, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!391 = metadata !{i32 786689, metadata !385, metadata !"wOffsetDst", metadata !214, i32 33554548, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!392 = metadata !{i32 786689, metadata !385, metadata !"hOffsetDst", metadata !214, i32 50331764, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!393 = metadata !{i32 786689, metadata !385, metadata !"src", metadata !214, i32 67108981, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!394 = metadata !{i32 786689, metadata !385, metadata !"wOffsetSrc", metadata !214, i32 83886197, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!395 = metadata !{i32 786689, metadata !385, metadata !"hOffsetSrc", metadata !214, i32 100663413, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!396 = metadata !{i32 786689, metadata !385, metadata !"width", metadata !214, i32 117440630, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!397 = metadata !{i32 786689, metadata !385, metadata !"height", metadata !214, i32 134217846, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!398 = metadata !{i32 786689, metadata !385, metadata !"kind", metadata !214, i32 150995062, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!399 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !214, i32 122, metadata !400, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!400 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !401, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!401 = metadata !{metadata !217, metadata !76, metadata !230, metadata !77, metadata !230, metadata !230, metadata !230, metadata !210, metadata !402}
!402 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !214, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !403} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!403 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !404} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!404 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !130, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!405 = metadata !{metadata !406}
!406 = metadata !{metadata !407, metadata !408, metadata !409, metadata !410, metadata !411, metadata !412, metadata !413, metadata !414}
!407 = metadata !{i32 786689, metadata !399, metadata !"dst", metadata !214, i32 16777338, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!408 = metadata !{i32 786689, metadata !399, metadata !"dpitch", metadata !214, i32 33554554, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!409 = metadata !{i32 786689, metadata !399, metadata !"src", metadata !214, i32 50331770, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!410 = metadata !{i32 786689, metadata !399, metadata !"spitch", metadata !214, i32 67108986, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!411 = metadata !{i32 786689, metadata !399, metadata !"width", metadata !214, i32 83886203, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!412 = metadata !{i32 786689, metadata !399, metadata !"height", metadata !214, i32 100663419, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!413 = metadata !{i32 786689, metadata !399, metadata !"kind", metadata !214, i32 117440635, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!414 = metadata !{i32 786689, metadata !399, metadata !"stream", metadata !214, i32 134217852, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!415 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !214, i32 128, metadata !416, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!416 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !417, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!417 = metadata !{metadata !217, metadata !76, metadata !230, metadata !234, metadata !230, metadata !230, metadata !230, metadata !230, metadata !210}
!418 = metadata !{metadata !419}
!419 = metadata !{metadata !420, metadata !421, metadata !422, metadata !423, metadata !424, metadata !425, metadata !426, metadata !427}
!420 = metadata !{i32 786689, metadata !415, metadata !"dst", metadata !214, i32 16777344, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!421 = metadata !{i32 786689, metadata !415, metadata !"dpitch", metadata !214, i32 33554560, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!422 = metadata !{i32 786689, metadata !415, metadata !"src", metadata !214, i32 50331776, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!423 = metadata !{i32 786689, metadata !415, metadata !"wOffset", metadata !214, i32 67108993, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!424 = metadata !{i32 786689, metadata !415, metadata !"hOffset", metadata !214, i32 83886209, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!425 = metadata !{i32 786689, metadata !415, metadata !"width", metadata !214, i32 100663425, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!426 = metadata !{i32 786689, metadata !415, metadata !"height", metadata !214, i32 117440641, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!427 = metadata !{i32 786689, metadata !415, metadata !"kind", metadata !214, i32 134217858, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!428 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !214, i32 134, metadata !429, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!429 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !430, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!430 = metadata !{metadata !217, metadata !76, metadata !230, metadata !234, metadata !230, metadata !230, metadata !230, metadata !230, metadata !210, metadata !402}
!431 = metadata !{metadata !432}
!432 = metadata !{metadata !433, metadata !434, metadata !435, metadata !436, metadata !437, metadata !438, metadata !439, metadata !440, metadata !441}
!433 = metadata !{i32 786689, metadata !428, metadata !"dst", metadata !214, i32 16777350, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!434 = metadata !{i32 786689, metadata !428, metadata !"dpitch", metadata !214, i32 33554566, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!435 = metadata !{i32 786689, metadata !428, metadata !"src", metadata !214, i32 50331782, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!436 = metadata !{i32 786689, metadata !428, metadata !"wOffset", metadata !214, i32 67108999, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!437 = metadata !{i32 786689, metadata !428, metadata !"hOffset", metadata !214, i32 83886215, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!438 = metadata !{i32 786689, metadata !428, metadata !"width", metadata !214, i32 100663431, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!439 = metadata !{i32 786689, metadata !428, metadata !"height", metadata !214, i32 117440647, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!440 = metadata !{i32 786689, metadata !428, metadata !"kind", metadata !214, i32 134217864, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!441 = metadata !{i32 786689, metadata !428, metadata !"stream", metadata !214, i32 150995080, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!442 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !214, i32 140, metadata !443, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!443 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !444, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!444 = metadata !{metadata !217, metadata !234, metadata !230, metadata !230, metadata !77, metadata !230, metadata !230, metadata !230, metadata !210}
!445 = metadata !{metadata !446}
!446 = metadata !{metadata !447, metadata !448, metadata !449, metadata !450, metadata !451, metadata !452, metadata !453, metadata !454}
!447 = metadata !{i32 786689, metadata !442, metadata !"dst", metadata !214, i32 16777356, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!448 = metadata !{i32 786689, metadata !442, metadata !"wOffset", metadata !214, i32 33554572, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!449 = metadata !{i32 786689, metadata !442, metadata !"hOffset", metadata !214, i32 50331788, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!450 = metadata !{i32 786689, metadata !442, metadata !"src", metadata !214, i32 67109005, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!451 = metadata !{i32 786689, metadata !442, metadata !"spitch", metadata !214, i32 83886221, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!452 = metadata !{i32 786689, metadata !442, metadata !"width", metadata !214, i32 100663437, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!453 = metadata !{i32 786689, metadata !442, metadata !"height", metadata !214, i32 117440653, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!454 = metadata !{i32 786689, metadata !442, metadata !"kind", metadata !214, i32 134217870, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!455 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !214, i32 146, metadata !456, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!456 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !457, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!457 = metadata !{metadata !217, metadata !234, metadata !230, metadata !230, metadata !77, metadata !230, metadata !230, metadata !230, metadata !210, metadata !402}
!458 = metadata !{metadata !459}
!459 = metadata !{metadata !460, metadata !461, metadata !462, metadata !463, metadata !464, metadata !465, metadata !466, metadata !467, metadata !468}
!460 = metadata !{i32 786689, metadata !455, metadata !"dst", metadata !214, i32 16777362, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!461 = metadata !{i32 786689, metadata !455, metadata !"wOffset", metadata !214, i32 33554578, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!462 = metadata !{i32 786689, metadata !455, metadata !"hOffset", metadata !214, i32 50331794, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!463 = metadata !{i32 786689, metadata !455, metadata !"src", metadata !214, i32 67109011, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!464 = metadata !{i32 786689, metadata !455, metadata !"spitch", metadata !214, i32 83886227, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!465 = metadata !{i32 786689, metadata !455, metadata !"width", metadata !214, i32 100663443, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!466 = metadata !{i32 786689, metadata !455, metadata !"height", metadata !214, i32 117440659, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!467 = metadata !{i32 786689, metadata !455, metadata !"kind", metadata !214, i32 134217876, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!468 = metadata !{i32 786689, metadata !455, metadata !"stream", metadata !214, i32 150995092, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!469 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !214, i32 152, metadata !470, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!470 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !471, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!471 = metadata !{metadata !217, metadata !472}
!472 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !473} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!473 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !474} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!474 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !130, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !475, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!475 = metadata !{metadata !476, metadata !478, metadata !484, metadata !485, metadata !486, metadata !487, metadata !488, metadata !489}
!476 = metadata !{i32 786445, metadata !474, metadata !"srcArray", metadata !130, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !477} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!477 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !130, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !234} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!478 = metadata !{i32 786445, metadata !474, metadata !"srcPos", metadata !130, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !479} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!479 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !130, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !480, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!480 = metadata !{metadata !481, metadata !482, metadata !483}
!481 = metadata !{i32 786445, metadata !479, metadata !"x", metadata !130, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !230} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!482 = metadata !{i32 786445, metadata !479, metadata !"y", metadata !130, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !230} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!483 = metadata !{i32 786445, metadata !479, metadata !"z", metadata !130, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !230} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!484 = metadata !{i32 786445, metadata !474, metadata !"srcPtr", metadata !130, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !320} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!485 = metadata !{i32 786445, metadata !474, metadata !"dstArray", metadata !130, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !477} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!486 = metadata !{i32 786445, metadata !474, metadata !"dstPos", metadata !130, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !479} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!487 = metadata !{i32 786445, metadata !474, metadata !"dstPtr", metadata !130, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !320} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!488 = metadata !{i32 786445, metadata !474, metadata !"extent", metadata !130, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !227} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!489 = metadata !{i32 786445, metadata !474, metadata !"kind", metadata !130, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !210} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!490 = metadata !{metadata !491}
!491 = metadata !{metadata !492}
!492 = metadata !{i32 786689, metadata !469, metadata !"p", metadata !214, i32 16777368, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!493 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !214, i32 156, metadata !494, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!494 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !495, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!495 = metadata !{metadata !217, metadata !472, metadata !402}
!496 = metadata !{metadata !497}
!497 = metadata !{metadata !498, metadata !499}
!498 = metadata !{i32 786689, metadata !493, metadata !"p", metadata !214, i32 16777372, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!499 = metadata !{i32 786689, metadata !493, metadata !"stream", metadata !214, i32 33554588, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!500 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !214, i32 160, metadata !501, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!501 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !502, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!502 = metadata !{metadata !217, metadata !503}
!503 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !504} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!504 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !505} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!505 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !130, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !506, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!506 = metadata !{metadata !507, metadata !508, metadata !509, metadata !510, metadata !511, metadata !512, metadata !513, metadata !514, metadata !515}
!507 = metadata !{i32 786445, metadata !505, metadata !"srcArray", metadata !130, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !477} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!508 = metadata !{i32 786445, metadata !505, metadata !"srcPos", metadata !130, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !479} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!509 = metadata !{i32 786445, metadata !505, metadata !"srcPtr", metadata !130, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !320} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!510 = metadata !{i32 786445, metadata !505, metadata !"srcDevice", metadata !130, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !21} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!511 = metadata !{i32 786445, metadata !505, metadata !"dstArray", metadata !130, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !477} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!512 = metadata !{i32 786445, metadata !505, metadata !"dstPos", metadata !130, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !479} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!513 = metadata !{i32 786445, metadata !505, metadata !"dstPtr", metadata !130, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !320} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!514 = metadata !{i32 786445, metadata !505, metadata !"dstDevice", metadata !130, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !21} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!515 = metadata !{i32 786445, metadata !505, metadata !"extent", metadata !130, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !227} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!516 = metadata !{metadata !517}
!517 = metadata !{metadata !518}
!518 = metadata !{i32 786689, metadata !500, metadata !"p", metadata !214, i32 16777376, metadata !503, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!519 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !214, i32 164, metadata !520, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!520 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !521, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!521 = metadata !{metadata !217, metadata !503, metadata !402}
!522 = metadata !{metadata !523}
!523 = metadata !{metadata !524, metadata !525}
!524 = metadata !{i32 786689, metadata !519, metadata !"p", metadata !214, i32 16777380, metadata !503, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!525 = metadata !{i32 786689, metadata !519, metadata !"stream", metadata !214, i32 33554596, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!526 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !214, i32 168, metadata !527, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!527 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !528, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!528 = metadata !{metadata !217, metadata !234, metadata !230, metadata !230, metadata !234, metadata !230, metadata !230, metadata !230, metadata !210}
!529 = metadata !{metadata !530}
!530 = metadata !{metadata !531, metadata !532, metadata !533, metadata !534, metadata !535, metadata !536, metadata !537, metadata !538}
!531 = metadata !{i32 786689, metadata !526, metadata !"dst", metadata !214, i32 16777384, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!532 = metadata !{i32 786689, metadata !526, metadata !"wOffsetDst", metadata !214, i32 33554600, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!533 = metadata !{i32 786689, metadata !526, metadata !"hOffsetDst", metadata !214, i32 50331816, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!534 = metadata !{i32 786689, metadata !526, metadata !"src", metadata !214, i32 67109033, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!535 = metadata !{i32 786689, metadata !526, metadata !"wOffsetSrc", metadata !214, i32 83886249, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!536 = metadata !{i32 786689, metadata !526, metadata !"hOffsetSrc", metadata !214, i32 100663465, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!537 = metadata !{i32 786689, metadata !526, metadata !"count", metadata !214, i32 117440682, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!538 = metadata !{i32 786689, metadata !526, metadata !"kind", metadata !214, i32 134217898, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!539 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !214, i32 174, metadata !540, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!540 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !541, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!541 = metadata !{metadata !217, metadata !76, metadata !77, metadata !230, metadata !210, metadata !402}
!542 = metadata !{metadata !543}
!543 = metadata !{metadata !544, metadata !545, metadata !546, metadata !547, metadata !548}
!544 = metadata !{i32 786689, metadata !539, metadata !"dst", metadata !214, i32 16777390, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!545 = metadata !{i32 786689, metadata !539, metadata !"src", metadata !214, i32 33554606, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!546 = metadata !{i32 786689, metadata !539, metadata !"count", metadata !214, i32 50331822, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!547 = metadata !{i32 786689, metadata !539, metadata !"kind", metadata !214, i32 67109039, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!548 = metadata !{i32 786689, metadata !539, metadata !"stream", metadata !214, i32 83886255, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!549 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !214, i32 179, metadata !550, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!550 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !551, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!551 = metadata !{metadata !217, metadata !76, metadata !234, metadata !230, metadata !230, metadata !230, metadata !210}
!552 = metadata !{metadata !553}
!553 = metadata !{metadata !554, metadata !555, metadata !556, metadata !557, metadata !558, metadata !559}
!554 = metadata !{i32 786689, metadata !549, metadata !"dst", metadata !214, i32 16777395, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!555 = metadata !{i32 786689, metadata !549, metadata !"src", metadata !214, i32 33554611, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!556 = metadata !{i32 786689, metadata !549, metadata !"wOffset", metadata !214, i32 50331827, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!557 = metadata !{i32 786689, metadata !549, metadata !"hOffset", metadata !214, i32 67109044, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!558 = metadata !{i32 786689, metadata !549, metadata !"count", metadata !214, i32 83886260, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!559 = metadata !{i32 786689, metadata !549, metadata !"kind", metadata !214, i32 100663476, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!560 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !214, i32 184, metadata !561, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!561 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !562, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!562 = metadata !{metadata !217, metadata !76, metadata !234, metadata !230, metadata !230, metadata !230, metadata !210, metadata !402}
!563 = metadata !{metadata !564}
!564 = metadata !{metadata !565, metadata !566, metadata !567, metadata !568, metadata !569, metadata !570, metadata !571}
!565 = metadata !{i32 786689, metadata !560, metadata !"dst", metadata !214, i32 16777400, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!566 = metadata !{i32 786689, metadata !560, metadata !"src", metadata !214, i32 33554616, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!567 = metadata !{i32 786689, metadata !560, metadata !"wOffset", metadata !214, i32 50331832, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!568 = metadata !{i32 786689, metadata !560, metadata !"hOffset", metadata !214, i32 67109049, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!569 = metadata !{i32 786689, metadata !560, metadata !"count", metadata !214, i32 83886265, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!570 = metadata !{i32 786689, metadata !560, metadata !"kind", metadata !214, i32 100663481, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!571 = metadata !{i32 786689, metadata !560, metadata !"stream", metadata !214, i32 117440698, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!572 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !214, i32 190, metadata !573, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!573 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !574, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!574 = metadata !{metadata !217, metadata !76, metadata !91, metadata !230, metadata !230, metadata !210}
!575 = metadata !{metadata !576}
!576 = metadata !{metadata !577, metadata !578, metadata !579, metadata !580, metadata !581}
!577 = metadata !{i32 786689, metadata !572, metadata !"dst", metadata !214, i32 16777406, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!578 = metadata !{i32 786689, metadata !572, metadata !"symbol", metadata !214, i32 33554622, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!579 = metadata !{i32 786689, metadata !572, metadata !"count", metadata !214, i32 50331838, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!580 = metadata !{i32 786689, metadata !572, metadata !"offset", metadata !214, i32 67109055, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!581 = metadata !{i32 786689, metadata !572, metadata !"kind", metadata !214, i32 83886271, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!582 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !214, i32 195, metadata !583, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!583 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !584, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!584 = metadata !{metadata !217, metadata !76, metadata !91, metadata !230, metadata !230, metadata !210, metadata !402}
!585 = metadata !{metadata !586}
!586 = metadata !{metadata !587, metadata !588, metadata !589, metadata !590, metadata !591, metadata !592}
!587 = metadata !{i32 786689, metadata !582, metadata !"dst", metadata !214, i32 16777411, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!588 = metadata !{i32 786689, metadata !582, metadata !"symbol", metadata !214, i32 33554627, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!589 = metadata !{i32 786689, metadata !582, metadata !"count", metadata !214, i32 50331843, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!590 = metadata !{i32 786689, metadata !582, metadata !"offset", metadata !214, i32 67109060, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!591 = metadata !{i32 786689, metadata !582, metadata !"kind", metadata !214, i32 83886276, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!592 = metadata !{i32 786689, metadata !582, metadata !"stream", metadata !214, i32 100663493, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!593 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !214, i32 201, metadata !594, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!594 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !595, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!595 = metadata !{metadata !217, metadata !76, metadata !21, metadata !77, metadata !21, metadata !230}
!596 = metadata !{metadata !597}
!597 = metadata !{metadata !598, metadata !599, metadata !600, metadata !601, metadata !602}
!598 = metadata !{i32 786689, metadata !593, metadata !"dst", metadata !214, i32 16777417, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!599 = metadata !{i32 786689, metadata !593, metadata !"dstDevice", metadata !214, i32 33554633, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!600 = metadata !{i32 786689, metadata !593, metadata !"src", metadata !214, i32 50331849, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!601 = metadata !{i32 786689, metadata !593, metadata !"srcDevice", metadata !214, i32 67109065, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!602 = metadata !{i32 786689, metadata !593, metadata !"count", metadata !214, i32 83886281, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!603 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !214, i32 206, metadata !604, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!604 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !605, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!605 = metadata !{metadata !217, metadata !76, metadata !21, metadata !77, metadata !21, metadata !230, metadata !402}
!606 = metadata !{metadata !607}
!607 = metadata !{metadata !608, metadata !609, metadata !610, metadata !611, metadata !612, metadata !613}
!608 = metadata !{i32 786689, metadata !603, metadata !"dst", metadata !214, i32 16777422, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!609 = metadata !{i32 786689, metadata !603, metadata !"dstDevice", metadata !214, i32 33554638, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!610 = metadata !{i32 786689, metadata !603, metadata !"src", metadata !214, i32 50331854, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!611 = metadata !{i32 786689, metadata !603, metadata !"srcDevice", metadata !214, i32 67109070, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!612 = metadata !{i32 786689, metadata !603, metadata !"count", metadata !214, i32 83886287, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!613 = metadata !{i32 786689, metadata !603, metadata !"stream", metadata !214, i32 100663503, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!614 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !214, i32 212, metadata !615, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!615 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !616, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!616 = metadata !{metadata !217, metadata !234, metadata !230, metadata !230, metadata !77, metadata !230, metadata !210}
!617 = metadata !{metadata !618}
!618 = metadata !{metadata !619, metadata !620, metadata !621, metadata !622, metadata !623, metadata !624}
!619 = metadata !{i32 786689, metadata !614, metadata !"dst", metadata !214, i32 16777428, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!620 = metadata !{i32 786689, metadata !614, metadata !"wOffset", metadata !214, i32 33554644, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!621 = metadata !{i32 786689, metadata !614, metadata !"hOffset", metadata !214, i32 50331860, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!622 = metadata !{i32 786689, metadata !614, metadata !"src", metadata !214, i32 67109077, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!623 = metadata !{i32 786689, metadata !614, metadata !"count", metadata !214, i32 83886293, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!624 = metadata !{i32 786689, metadata !614, metadata !"kind", metadata !214, i32 100663509, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!625 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !214, i32 217, metadata !626, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!626 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !627, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!627 = metadata !{metadata !217, metadata !234, metadata !230, metadata !230, metadata !77, metadata !230, metadata !210, metadata !402}
!628 = metadata !{metadata !629}
!629 = metadata !{metadata !630, metadata !631, metadata !632, metadata !633, metadata !634, metadata !635, metadata !636}
!630 = metadata !{i32 786689, metadata !625, metadata !"dst", metadata !214, i32 16777433, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!631 = metadata !{i32 786689, metadata !625, metadata !"wOffset", metadata !214, i32 33554649, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!632 = metadata !{i32 786689, metadata !625, metadata !"hOffset", metadata !214, i32 50331865, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!633 = metadata !{i32 786689, metadata !625, metadata !"src", metadata !214, i32 67109082, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!634 = metadata !{i32 786689, metadata !625, metadata !"count", metadata !214, i32 83886298, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!635 = metadata !{i32 786689, metadata !625, metadata !"kind", metadata !214, i32 100663514, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!636 = metadata !{i32 786689, metadata !625, metadata !"stream", metadata !214, i32 117440731, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!637 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !214, i32 223, metadata !638, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!638 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !639, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!639 = metadata !{metadata !217, metadata !88, metadata !77, metadata !230, metadata !230, metadata !210}
!640 = metadata !{metadata !641}
!641 = metadata !{metadata !642, metadata !643, metadata !644, metadata !645, metadata !646}
!642 = metadata !{i32 786689, metadata !637, metadata !"symbol", metadata !214, i32 16777439, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!643 = metadata !{i32 786689, metadata !637, metadata !"src", metadata !214, i32 33554655, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!644 = metadata !{i32 786689, metadata !637, metadata !"count", metadata !214, i32 50331871, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!645 = metadata !{i32 786689, metadata !637, metadata !"offset", metadata !214, i32 67109088, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!646 = metadata !{i32 786689, metadata !637, metadata !"kind", metadata !214, i32 83886304, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!647 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !214, i32 229, metadata !648, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!648 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !649, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!649 = metadata !{metadata !217, metadata !91, metadata !77, metadata !230, metadata !230, metadata !210, metadata !402}
!650 = metadata !{metadata !651}
!651 = metadata !{metadata !652, metadata !653, metadata !654, metadata !655, metadata !656, metadata !657}
!652 = metadata !{i32 786689, metadata !647, metadata !"symbol", metadata !214, i32 16777445, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!653 = metadata !{i32 786689, metadata !647, metadata !"src", metadata !214, i32 33554661, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!654 = metadata !{i32 786689, metadata !647, metadata !"count", metadata !214, i32 50331877, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!655 = metadata !{i32 786689, metadata !647, metadata !"offset", metadata !214, i32 67109093, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!656 = metadata !{i32 786689, metadata !647, metadata !"kind", metadata !214, i32 83886310, metadata !210, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!657 = metadata !{i32 786689, metadata !647, metadata !"stream", metadata !214, i32 100663526, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!658 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !214, i32 234, metadata !659, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!659 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !660, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!660 = metadata !{metadata !217, metadata !269, metadata !269}
!661 = metadata !{metadata !662}
!662 = metadata !{metadata !663, metadata !664}
!663 = metadata !{i32 786689, metadata !658, metadata !"free", metadata !214, i32 16777450, metadata !269, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!664 = metadata !{i32 786689, metadata !658, metadata !"total", metadata !214, i32 33554666, metadata !269, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!665 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !214, i32 238, metadata !666, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!666 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !667, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!667 = metadata !{metadata !217, metadata !76, metadata !21, metadata !230}
!668 = metadata !{metadata !669}
!669 = metadata !{metadata !670, metadata !671, metadata !672}
!670 = metadata !{i32 786689, metadata !665, metadata !"devPtr", metadata !214, i32 16777454, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!671 = metadata !{i32 786689, metadata !665, metadata !"value", metadata !214, i32 33554670, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!672 = metadata !{i32 786689, metadata !665, metadata !"count", metadata !214, i32 50331886, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!673 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !214, i32 243, metadata !674, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!674 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !675, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!675 = metadata !{metadata !217, metadata !76, metadata !230, metadata !21, metadata !230, metadata !230}
!676 = metadata !{metadata !677}
!677 = metadata !{metadata !678, metadata !679, metadata !680, metadata !681, metadata !682}
!678 = metadata !{i32 786689, metadata !673, metadata !"devPtr", metadata !214, i32 16777459, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!679 = metadata !{i32 786689, metadata !673, metadata !"pitch", metadata !214, i32 33554675, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!680 = metadata !{i32 786689, metadata !673, metadata !"value", metadata !214, i32 50331891, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!681 = metadata !{i32 786689, metadata !673, metadata !"width", metadata !214, i32 67109108, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!682 = metadata !{i32 786689, metadata !673, metadata !"height", metadata !214, i32 83886324, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!683 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !214, i32 248, metadata !684, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!684 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !685, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!685 = metadata !{metadata !217, metadata !76, metadata !230, metadata !21, metadata !230, metadata !230, metadata !402}
!686 = metadata !{metadata !687}
!687 = metadata !{metadata !688, metadata !689, metadata !690, metadata !691, metadata !692, metadata !693}
!688 = metadata !{i32 786689, metadata !683, metadata !"devPtr", metadata !214, i32 16777464, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!689 = metadata !{i32 786689, metadata !683, metadata !"pitch", metadata !214, i32 33554680, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!690 = metadata !{i32 786689, metadata !683, metadata !"value", metadata !214, i32 50331896, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!691 = metadata !{i32 786689, metadata !683, metadata !"width", metadata !214, i32 67109113, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!692 = metadata !{i32 786689, metadata !683, metadata !"height", metadata !214, i32 83886329, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!693 = metadata !{i32 786689, metadata !683, metadata !"stream", metadata !214, i32 100663545, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!694 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !214, i32 253, metadata !695, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!695 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !696, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!696 = metadata !{metadata !217, metadata !320, metadata !21, metadata !227}
!697 = metadata !{metadata !698}
!698 = metadata !{metadata !699, metadata !700, metadata !701}
!699 = metadata !{i32 786689, metadata !694, metadata !"pitchedDevPtr", metadata !214, i32 16777469, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!700 = metadata !{i32 786689, metadata !694, metadata !"value", metadata !214, i32 33554685, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!701 = metadata !{i32 786689, metadata !694, metadata !"extent", metadata !214, i32 50331902, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!702 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !214, i32 258, metadata !703, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!703 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !704, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!704 = metadata !{metadata !217, metadata !320, metadata !21, metadata !227, metadata !402}
!705 = metadata !{metadata !706}
!706 = metadata !{metadata !707, metadata !708, metadata !709, metadata !710}
!707 = metadata !{i32 786689, metadata !702, metadata !"pitchedDevPtr", metadata !214, i32 16777474, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!708 = metadata !{i32 786689, metadata !702, metadata !"value", metadata !214, i32 33554690, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!709 = metadata !{i32 786689, metadata !702, metadata !"extent", metadata !214, i32 50331907, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!710 = metadata !{i32 786689, metadata !702, metadata !"stream", metadata !214, i32 67109123, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!711 = metadata !{i32 786478, i32 0, metadata !214, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !214, i32 263, metadata !712, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!712 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !713, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!713 = metadata !{metadata !217, metadata !76, metadata !21, metadata !230, metadata !402}
!714 = metadata !{metadata !715}
!715 = metadata !{metadata !716, metadata !717, metadata !718, metadata !719}
!716 = metadata !{i32 786689, metadata !711, metadata !"devPtr", metadata !214, i32 16777479, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!717 = metadata !{i32 786689, metadata !711, metadata !"value", metadata !214, i32 33554695, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!718 = metadata !{i32 786689, metadata !711, metadata !"count", metadata !214, i32 50331911, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!719 = metadata !{i32 786689, metadata !711, metadata !"stream", metadata !214, i32 67109127, metadata !402, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!720 = metadata !{i32 13, i32 0, metadata !721, null}
!721 = metadata !{i32 786443, metadata !15, i32 11, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/053_misc2/main.cpp]
!722 = metadata !{i32 14, i32 0, metadata !721, null}
!723 = metadata !{i32 20, i32 0, metadata !724, null}
!724 = metadata !{i32 786443, metadata !22, i32 16, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/053_misc2/main.cpp]
!725 = metadata !{i32 22, i32 0, metadata !724, null}
!726 = metadata !{i32 23, i32 0, metadata !724, null}
!727 = metadata !{i32 24, i32 0, metadata !728, null}
!728 = metadata !{i32 786443, metadata !724, i32 24, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/053_misc2/main.cpp]
!729 = metadata !{i32 26, i32 0, metadata !728, null}
!730 = metadata !{i32 30, i32 0, metadata !724, null}
!731 = metadata !{i32 32, i32 0, metadata !732, null}
!732 = metadata !{i32 786443, metadata !724, i32 32, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/053_misc2/main.cpp]
!733 = metadata !{i32 33, i32 0, metadata !734, null}
!734 = metadata !{i32 786443, metadata !732, i32 32, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/053_misc2/main.cpp]
!735 = metadata !{i32 36, i32 0, metadata !724, null}
!736 = metadata !{i32 37, i32 0, metadata !724, null}
!737 = metadata !{i32 39, i32 0, metadata !724, null}
!738 = metadata !{i32 419, i32 0, metadata !25, null}
!739 = metadata !{i32 419, i32 0, metadata !68, null}
!740 = metadata !{i32 419, i32 0, metadata !741, null}
!741 = metadata !{i32 786443, metadata !68, i32 419, i32 0, metadata !26, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/053_misc2//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!742 = metadata !{i32 16, i32 0, metadata !87, null}
!743 = metadata !{i32 17, i32 0, metadata !87, null}
!744 = metadata !{metadata !"omnipotent char", metadata !745}
!745 = metadata !{metadata !"Simple C/C++ TBAA"}
!746 = metadata !{i32 18, i32 0, metadata !87, null}
!747 = metadata !{i32 14, i32 0, metadata !123, null}
!748 = metadata !{i32 15, i32 0, metadata !123, null}
!749 = metadata !{i32 16, i32 0, metadata !123, null}
!750 = metadata !{i32 26, i32 0, metadata !751, null}
!751 = metadata !{i32 786443, metadata !213, i32 25, i32 0, metadata !214, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!752 = metadata !{i32 30, i32 0, metadata !753, null}
!753 = metadata !{i32 786443, metadata !242, i32 29, i32 0, metadata !214, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!754 = metadata !{i32 31, i32 0, metadata !753, null}
!755 = metadata !{i32 35, i32 0, metadata !756, null}
!756 = metadata !{i32 786443, metadata !248, i32 34, i32 0, metadata !214, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!757 = metadata !{i32 36, i32 0, metadata !756, null}
!758 = metadata !{i32 40, i32 0, metadata !759, null}
!759 = metadata !{i32 786443, metadata !254, i32 39, i32 0, metadata !214, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!760 = metadata !{i32 41, i32 0, metadata !759, null}
!761 = metadata !{i32 45, i32 0, metadata !762, null}
!762 = metadata !{i32 786443, metadata !258, i32 44, i32 0, metadata !214, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!763 = metadata !{i32 49, i32 0, metadata !764, null}
!764 = metadata !{i32 786443, metadata !266, i32 48, i32 0, metadata !214, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!765 = metadata !{i32 53, i32 0, metadata !766, null}
!766 = metadata !{i32 786443, metadata !274, i32 52, i32 0, metadata !214, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!767 = metadata !{i32 57, i32 0, metadata !768, null}
!768 = metadata !{i32 786443, metadata !282, i32 56, i32 0, metadata !214, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!769 = metadata !{i32 61, i32 0, metadata !770, null}
!770 = metadata !{i32 786443, metadata !290, i32 60, i32 0, metadata !214, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!771 = metadata !{i32 65, i32 0, metadata !772, null}
!772 = metadata !{i32 786443, metadata !297, i32 64, i32 0, metadata !214, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!773 = metadata !{i32 69, i32 0, metadata !774, null}
!774 = metadata !{i32 786443, metadata !305, i32 68, i32 0, metadata !214, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!775 = metadata !{i32 73, i32 0, metadata !776, null}
!776 = metadata !{i32 786443, metadata !309, i32 72, i32 0, metadata !214, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!777 = metadata !{i32 74, i32 0, metadata !776, null}
!778 = metadata !{metadata !"any pointer", metadata !744}
!779 = metadata !{i32 75, i32 0, metadata !776, null}
!780 = metadata !{i32 77, i32 0, metadata !776, null}
!781 = metadata !{i32 81, i32 0, metadata !782, null}
!782 = metadata !{i32 786443, metadata !316, i32 80, i32 0, metadata !214, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!783 = metadata !{i32 86, i32 0, metadata !784, null}
!784 = metadata !{i32 786443, metadata !330, i32 85, i32 0, metadata !214, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!785 = metadata !{i32 91, i32 0, metadata !786, null}
!786 = metadata !{i32 786443, metadata !340, i32 90, i32 0, metadata !214, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!787 = metadata !{i32 95, i32 0, metadata !788, null}
!788 = metadata !{i32 786443, metadata !350, i32 94, i32 0, metadata !214, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!789 = metadata !{i32 96, i32 0, metadata !788, null}
!790 = metadata !{i32 97, i32 0, metadata !788, null}
!791 = metadata !{i32 99, i32 0, metadata !788, null}
!792 = metadata !{i32 103, i32 0, metadata !793, null}
!793 = metadata !{i32 786443, metadata !355, i32 102, i32 0, metadata !214, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!794 = metadata !{i32 108, i32 0, metadata !795, null}
!795 = metadata !{i32 786443, metadata !364, i32 106, i32 0, metadata !214, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!796 = metadata !{i32 113, i32 0, metadata !797, null}
!797 = metadata !{i32 786443, metadata !373, i32 112, i32 0, metadata !214, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!798 = metadata !{i32 119, i32 0, metadata !799, null}
!799 = metadata !{i32 786443, metadata !385, i32 118, i32 0, metadata !214, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!800 = metadata !{i32 125, i32 0, metadata !801, null}
!801 = metadata !{i32 786443, metadata !399, i32 124, i32 0, metadata !214, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!802 = metadata !{i32 131, i32 0, metadata !803, null}
!803 = metadata !{i32 786443, metadata !415, i32 130, i32 0, metadata !214, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!804 = metadata !{i32 137, i32 0, metadata !805, null}
!805 = metadata !{i32 786443, metadata !428, i32 136, i32 0, metadata !214, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!806 = metadata !{i32 143, i32 0, metadata !807, null}
!807 = metadata !{i32 786443, metadata !442, i32 142, i32 0, metadata !214, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!808 = metadata !{i32 149, i32 0, metadata !809, null}
!809 = metadata !{i32 786443, metadata !455, i32 148, i32 0, metadata !214, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!810 = metadata !{i32 153, i32 0, metadata !811, null}
!811 = metadata !{i32 786443, metadata !469, i32 152, i32 0, metadata !214, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!812 = metadata !{i32 157, i32 0, metadata !813, null}
!813 = metadata !{i32 786443, metadata !493, i32 156, i32 0, metadata !214, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!814 = metadata !{i32 161, i32 0, metadata !815, null}
!815 = metadata !{i32 786443, metadata !500, i32 160, i32 0, metadata !214, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!816 = metadata !{i32 165, i32 0, metadata !817, null}
!817 = metadata !{i32 786443, metadata !519, i32 164, i32 0, metadata !214, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!818 = metadata !{i32 171, i32 0, metadata !819, null}
!819 = metadata !{i32 786443, metadata !526, i32 170, i32 0, metadata !214, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!820 = metadata !{i32 176, i32 0, metadata !821, null}
!821 = metadata !{i32 786443, metadata !539, i32 175, i32 0, metadata !214, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!822 = metadata !{i32 181, i32 0, metadata !823, null}
!823 = metadata !{i32 786443, metadata !549, i32 180, i32 0, metadata !214, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!824 = metadata !{i32 187, i32 0, metadata !825, null}
!825 = metadata !{i32 786443, metadata !560, i32 186, i32 0, metadata !214, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!826 = metadata !{i32 192, i32 0, metadata !827, null}
!827 = metadata !{i32 786443, metadata !572, i32 191, i32 0, metadata !214, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!828 = metadata !{i32 198, i32 0, metadata !829, null}
!829 = metadata !{i32 786443, metadata !582, i32 197, i32 0, metadata !214, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!830 = metadata !{i32 203, i32 0, metadata !831, null}
!831 = metadata !{i32 786443, metadata !593, i32 201, i32 0, metadata !214, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!832 = metadata !{i32 209, i32 0, metadata !833, null}
!833 = metadata !{i32 786443, metadata !603, i32 207, i32 0, metadata !214, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!834 = metadata !{i32 214, i32 0, metadata !835, null}
!835 = metadata !{i32 786443, metadata !614, i32 213, i32 0, metadata !214, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!836 = metadata !{i32 220, i32 0, metadata !837, null}
!837 = metadata !{i32 786443, metadata !625, i32 219, i32 0, metadata !214, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!838 = metadata !{i32 225, i32 0, metadata !839, null}
!839 = metadata !{i32 786443, metadata !637, i32 224, i32 0, metadata !214, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!840 = metadata !{i32 226, i32 0, metadata !839, null}
!841 = metadata !{i32 231, i32 0, metadata !842, null}
!842 = metadata !{i32 786443, metadata !647, i32 230, i32 0, metadata !214, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!843 = metadata !{i32 235, i32 0, metadata !844, null}
!844 = metadata !{i32 786443, metadata !658, i32 234, i32 0, metadata !214, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!845 = metadata !{i32 239, i32 0, metadata !846, null}
!846 = metadata !{i32 786443, metadata !665, i32 238, i32 0, metadata !214, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!847 = metadata !{i32 240, i32 0, metadata !846, null}
!848 = metadata !{i32 245, i32 0, metadata !849, null}
!849 = metadata !{i32 786443, metadata !673, i32 244, i32 0, metadata !214, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!850 = metadata !{i32 250, i32 0, metadata !851, null}
!851 = metadata !{i32 786443, metadata !683, i32 249, i32 0, metadata !214, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!852 = metadata !{i32 255, i32 0, metadata !853, null}
!853 = metadata !{i32 786443, metadata !694, i32 254, i32 0, metadata !214, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!854 = metadata !{i32 260, i32 0, metadata !855, null}
!855 = metadata !{i32 786443, metadata !702, i32 259, i32 0, metadata !214, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!856 = metadata !{i32 264, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !711, i32 263, i32 0, metadata !214, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
