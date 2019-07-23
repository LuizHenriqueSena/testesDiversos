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
@_ZL1A = internal global [4096 x i32] zeroinitializer, section "__constant__", align 16
@_ZL1B = internal global [3 x i32] [i32 0, i32 1, i32 2], section "__constant__", align 4
@.str = private unnamed_addr constant [8 x i8] c"c[i]!=0\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define void @_Z6kernelPi(i32* %x) nounwind uwtable noinline {
  %1 = alloca i32*, align 8
  store i32* %x, i32** %1, align 8
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !729
  %3 = zext i32 %2 to i64, !dbg !729
  %4 = getelementptr inbounds [4096 x i32]* @_ZL1A, i32 0, i64 %3, !dbg !729
  %5 = load i32* %4, align 4, !dbg !729
  %6 = load i32* getelementptr inbounds ([3 x i32]* @_ZL1B, i32 0, i64 0), align 4, !dbg !729
  %7 = add nsw i32 %5, %6, !dbg !729
  %8 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !729
  %9 = zext i32 %8 to i64, !dbg !729
  %10 = load i32** %1, align 8, !dbg !729
  %11 = getelementptr inbounds i32* %10, i64 %9, !dbg !729
  store i32 %7, i32* %11, align 4, !dbg !729
  ret void, !dbg !731
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %a = alloca i32*, align 8
  %c = alloca i32*, align 8
  %dev_a = alloca i32*, align 8
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 8, i32* %size, align 4, !dbg !732
  %6 = bitcast i32** %dev_a to i8**, !dbg !734
  %7 = load i32* %size, align 4, !dbg !734
  %8 = sext i32 %7 to i64, !dbg !734
  %9 = call i32 @cudaMalloc(i8** %6, i64 %8), !dbg !734
  %10 = load i32* %size, align 4, !dbg !735
  %11 = sext i32 %10 to i64, !dbg !735
  %12 = call noalias i8* @malloc(i64 %11) nounwind, !dbg !735
  %13 = bitcast i8* %12 to i32*, !dbg !735
  store i32* %13, i32** %a, align 8, !dbg !735
  %14 = load i32* %size, align 4, !dbg !736
  %15 = sext i32 %14 to i64, !dbg !736
  %16 = call noalias i8* @malloc(i64 %15) nounwind, !dbg !736
  %17 = bitcast i8* %16 to i32*, !dbg !736
  store i32* %17, i32** %c, align 8, !dbg !736
  store i32 0, i32* %i, align 4, !dbg !737
  br label %18, !dbg !737

; <label>:18                                      ; preds = %21, %0
  %19 = load i32* %i, align 4, !dbg !737
  %20 = icmp slt i32 %19, 2, !dbg !737
  br i1 %20, label %21, label %31, !dbg !737

; <label>:21                                      ; preds = %18
  %22 = call i32 @rand() nounwind, !dbg !739
  %23 = srem i32 %22, 10, !dbg !739
  %24 = add nsw i32 %23, 1, !dbg !739
  %25 = load i32* %i, align 4, !dbg !739
  %26 = sext i32 %25 to i64, !dbg !739
  %27 = load i32** %a, align 8, !dbg !739
  %28 = getelementptr inbounds i32* %27, i64 %26, !dbg !739
  store i32 %24, i32* %28, align 4, !dbg !739
  %29 = load i32* %i, align 4, !dbg !737
  %30 = add nsw i32 %29, 1, !dbg !737
  store i32 %30, i32* %i, align 4, !dbg !737
  br label %18, !dbg !737

; <label>:31                                      ; preds = %18
  %32 = load i32** %dev_a, align 8, !dbg !740
  %33 = bitcast i32* %32 to i8*, !dbg !740
  %34 = load i32** %a, align 8, !dbg !740
  %35 = bitcast i32* %34 to i8*, !dbg !740
  %36 = load i32* %size, align 4, !dbg !740
  %37 = sext i32 %36 to i64, !dbg !740
  %38 = call i32 @cudaMemcpy(i8* %33, i8* %35, i64 %37, i32 1), !dbg !740
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !741
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 2, i32 1, i32 1), !dbg !741
  %39 = bitcast { i64, i32 }* %4 to i8*, !dbg !741
  %40 = bitcast %struct.dim3* %2 to i8*, !dbg !741
  %41 = call i8* @memcpy(i8* %39, i8* %40, i64 12)
  %42 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !741
  %43 = load i64* %42, align 1, !dbg !741
  %44 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !741
  %45 = load i32* %44, align 1, !dbg !741
  %46 = bitcast { i64, i32 }* %5 to i8*, !dbg !741
  %47 = bitcast %struct.dim3* %3 to i8*, !dbg !741
  %48 = call i8* @memcpy(i8* %46, i8* %47, i64 12)
  %49 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !741
  %50 = load i64* %49, align 1, !dbg !741
  %51 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !741
  %52 = load i32* %51, align 1, !dbg !741
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %43, i32 %45, i64 %50, i32 %52), !dbg !741
  %53 = load i32** %dev_a, align 8, !dbg !743
  call void @_Z6kernelPi(i32* %53), !dbg !743
  %54 = load i32** %c, align 8, !dbg !744
  %55 = bitcast i32* %54 to i8*, !dbg !744
  %56 = load i32** %dev_a, align 8, !dbg !744
  %57 = bitcast i32* %56 to i8*, !dbg !744
  %58 = load i32* %size, align 4, !dbg !744
  %59 = sext i32 %58 to i64, !dbg !744
  %60 = call i32 @cudaMemcpy(i8* %55, i8* %57, i64 %59, i32 2), !dbg !744
  store i32 0, i32* %i1, align 4, !dbg !745
  br label %61, !dbg !745

; <label>:61                                      ; preds = %72, %31
  %62 = load i32* %i1, align 4, !dbg !745
  %63 = icmp slt i32 %62, 2, !dbg !745
  br i1 %63, label %64, label %75, !dbg !745

; <label>:64                                      ; preds = %61
  %65 = load i32* %i1, align 4, !dbg !747
  %66 = sext i32 %65 to i64, !dbg !747
  %67 = load i32** %c, align 8, !dbg !747
  %68 = getelementptr inbounds i32* %67, i64 %66, !dbg !747
  %69 = load i32* %68, align 4, !dbg !747
  %70 = icmp ne i32 %69, 0, !dbg !747
  br i1 %70, label %72, label %71, !dbg !747

; <label>:71                                      ; preds = %64
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 40, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwind
  unreachable, !dbg !747

; <label>:72                                      ; preds = %64
  %73 = load i32* %i1, align 4, !dbg !745
  %74 = add nsw i32 %73, 1, !dbg !745
  store i32 %74, i32* %i1, align 4, !dbg !745
  br label %61, !dbg !745

; <label>:75                                      ; preds = %61
  %76 = load i32** %a, align 8, !dbg !749
  %77 = bitcast i32* %76 to i8*, !dbg !749
  call void @free(i8* %77) nounwind, !dbg !749
  %78 = load i32** %c, align 8, !dbg !750
  %79 = bitcast i32* %78 to i8*, !dbg !750
  call void @free(i8* %79) nounwind, !dbg !750
  %80 = load i32** %dev_a, align 8, !dbg !751
  %81 = bitcast i32* %80 to i8*, !dbg !751
  %82 = call i32 @cudaFree(i8* %81), !dbg !751
  ret i32 0, !dbg !752
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @rand() nounwind

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
  %6 = load i32* %2, align 4, !dbg !753
  %7 = load i32* %3, align 4, !dbg !753
  %8 = load i32* %4, align 4, !dbg !753
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !753
  ret void, !dbg !753
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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !754
  %7 = load i32* %2, align 4, !dbg !754
  store i32 %7, i32* %6, align 4, !dbg !754
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !754
  %9 = load i32* %3, align 4, !dbg !754
  store i32 %9, i32* %8, align 4, !dbg !754
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !754
  %11 = load i32* %4, align 4, !dbg !754
  store i32 %11, i32* %10, align 4, !dbg !754
  ret void, !dbg !755
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !757
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !757

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !757
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !758
  %4 = load i8* %src.06, align 1, !dbg !758, !tbaa !759
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !758
  store i8 %4, i8* %dest.05, align 1, !dbg !758, !tbaa !759
  %6 = icmp eq i64 %2, 0, !dbg !757
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !757

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !761
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !762
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !762

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !763
  br label %3, !dbg !762

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !762
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !763
  store volatile i8 %2, i8* %a.05, align 1, !dbg !763, !tbaa !759
  %6 = icmp eq i64 %4, 0, !dbg !762
  br i1 %6, label %._crit_edge, label %3, !dbg !762

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !764
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !765
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !767
  ret i32 0, !dbg !769
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !770
  tail call void @free(i8* %1) nounwind, !dbg !770
  ret i32 0, !dbg !772
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !773
  ret i32 0, !dbg !775
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !776
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !778
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !780
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !782
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !784
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !786
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !788
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !790
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !792
  store i8* %1, i8** %devPtr, align 8, !dbg !792, !tbaa !793
  tail call void @__clear_device(), !dbg !794
  ret i32 0, !dbg !795
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !796
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !798
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !800
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !802
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !804
  store i8* %1, i8** %ptr, align 8, !dbg !804, !tbaa !793
  tail call void @__clear_host(), !dbg !805
  ret i32 0, !dbg !806
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !807
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !809
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !811
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !813
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !815
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !817
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !819
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !821
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !823
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !825
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !827
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !829
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !831
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !833
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !835
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !837
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !839
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !841
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !843
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !845
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !847
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !849
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !851
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !853
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !855
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !856
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !858
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !860
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !862
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !863
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !865
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !867
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !869
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !871
}

!llvm.dbg.cu = !{!0, !78, !102, !118, !135}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !11, 
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail", null} ; [ DW_TAG_file_type ]
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
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"kernel", metadata !"kernel", metadata !"_Z6kernelPi", metadata !16, i32 12, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @_Z6kernelPi, null, null, metada
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!20 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 15, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 15} ; [ DW_TAG_
!22 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !20}
!24 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !25, i32 419, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!25 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail", null} ; [ DW_TAG_file_type ]
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
!68 = metadata !{metadata !69}
!69 = metadata !{metadata !70, metadata !74}
!70 = metadata !{i32 786484, i32 0, null, metadata !"B", metadata !"B", metadata !"_ZL1B", metadata !16, i32 10, metadata !71, i32 1, i32 1, [3 x i32]* @_ZL1B} ; [ DW_TAG_variable ] [B] [line 10] [local] [def]
!71 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !20, metadata !72, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!72 = metadata !{metadata !73}
!73 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ] [0, 2]
!74 = metadata !{i32 786484, i32 0, null, metadata !"A", metadata !"A", metadata !"_ZL1A", metadata !16, i32 9, metadata !75, i32 1, i32 1, [4096 x i32]* @_ZL1A} ; [ DW_TAG_variable ] [A] [line 9] [local] [def]
!75 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 131072, i64 32, i32 0, i32 0, metadata !20, metadata !76, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 131072, align 32, offset 0] [from int]
!76 = metadata !{metadata !77}
!77 = metadata !{i32 786465, i64 0, i64 4095}     ; [ DW_TAG_subrange_type ] [0, 4095]
!78 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!79 = metadata !{metadata !80}
!80 = metadata !{metadata !81}
!81 = metadata !{i32 786478, i32 0, metadata !82, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !82, i32 12, metadata !83, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !90, i
!82 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!83 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = metadata !{metadata !85, metadata !85, metadata !86, metadata !88}
!85 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!86 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !87} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!87 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!88 = metadata !{i32 786454, null, metadata !"size_t", metadata !82, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !89} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!89 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!90 = metadata !{metadata !91}
!91 = metadata !{metadata !92, metadata !93, metadata !94, metadata !95, metadata !99}
!92 = metadata !{i32 786689, metadata !81, metadata !"destaddr", metadata !82, i32 16777228, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!93 = metadata !{i32 786689, metadata !81, metadata !"srcaddr", metadata !82, i32 33554444, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!94 = metadata !{i32 786689, metadata !81, metadata !"len", metadata !82, i32 50331660, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!95 = metadata !{i32 786688, metadata !96, metadata !"dest", metadata !82, i32 13, metadata !97, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!96 = metadata !{i32 786443, metadata !81, i32 12, i32 0, metadata !82, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!97 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !98} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!98 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!99 = metadata !{i32 786688, metadata !96, metadata !"src", metadata !82, i32 14, metadata !100, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!100 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !101} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!101 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !98} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!102 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2
!103 = metadata !{metadata !104}
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786478, i32 0, metadata !106, metadata !"memmove", metadata !"memmove", metadata !"", metadata !106, i32 12, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !110, i32 12} ; [ DW_TAG
!106 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!107 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = metadata !{metadata !85, metadata !85, metadata !86, metadata !109}
!109 = metadata !{i32 786454, null, metadata !"size_t", metadata !106, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !89} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!110 = metadata !{metadata !111}
!111 = metadata !{metadata !112, metadata !113, metadata !114, metadata !115, metadata !117}
!112 = metadata !{i32 786689, metadata !105, metadata !"dst", metadata !106, i32 16777228, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!113 = metadata !{i32 786689, metadata !105, metadata !"src", metadata !106, i32 33554444, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!114 = metadata !{i32 786689, metadata !105, metadata !"count", metadata !106, i32 50331660, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!115 = metadata !{i32 786688, metadata !116, metadata !"a", metadata !106, i32 14, metadata !97, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!116 = metadata !{i32 786443, metadata !105, i32 12, i32 0, metadata !106, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!117 = metadata !{i32 786688, metadata !116, metadata !"b", metadata !106, i32 15, metadata !100, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!118 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!119 = metadata !{metadata !120}
!120 = metadata !{metadata !121}
!121 = metadata !{i32 786478, i32 0, metadata !122, metadata !"memset", metadata !"memset", metadata !"", metadata !122, i32 12, metadata !123, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!122 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!123 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !124, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!124 = metadata !{metadata !85, metadata !85, metadata !20, metadata !125}
!125 = metadata !{i32 786454, null, metadata !"size_t", metadata !122, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !89} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!126 = metadata !{metadata !127}
!127 = metadata !{metadata !128, metadata !129, metadata !130, metadata !131}
!128 = metadata !{i32 786689, metadata !121, metadata !"dst", metadata !122, i32 16777228, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!129 = metadata !{i32 786689, metadata !121, metadata !"s", metadata !122, i32 33554444, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!130 = metadata !{i32 786689, metadata !121, metadata !"count", metadata !122, i32 50331660, metadata !125, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!131 = metadata !{i32 786688, metadata !132, metadata !"a", metadata !122, i32 13, metadata !133, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!132 = metadata !{i32 786443, metadata !121, i32 12, i32 0, metadata !122, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!133 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !134} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!134 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !98} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!135 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!136 = metadata !{metadata !137}
!137 = metadata !{metadata !138, metadata !213, metadata !219}
!138 = metadata !{i32 786436, null, metadata !"cudaError", metadata !139, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !140, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!139 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!140 = metadata !{metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !149, metadata !150, metadata !151, metadata !152, metadata !153, metadata !154, metadata !155, metadata !1
!141 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!142 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!143 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!144 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!145 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!146 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!147 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!148 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!149 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!150 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!151 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!152 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!153 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!154 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!155 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!156 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!157 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!158 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!159 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!160 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!161 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!162 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!163 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!164 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!165 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!166 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!167 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!168 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!169 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!170 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!171 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!172 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!173 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!174 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!175 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!176 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!177 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!178 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!179 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!180 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!181 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!182 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!183 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!184 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!185 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!186 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!187 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!188 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!189 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!190 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!191 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!192 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!193 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!194 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!195 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!196 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!197 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!198 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!199 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!200 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!201 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!202 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!203 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!204 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!205 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!206 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!207 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!208 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!209 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!210 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!211 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!212 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!213 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !139, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !214, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!214 = metadata !{metadata !215, metadata !216, metadata !217, metadata !218}
!215 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!216 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!217 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!218 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!219 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !139, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!220 = metadata !{metadata !221}
!221 = metadata !{metadata !222, metadata !251, metadata !257, metadata !263, metadata !267, metadata !275, metadata !283, metadata !291, metadata !299, metadata !306, metadata !314, metadata !318, metadata !325, metadata !339, metadata !349, metadata !3
!222 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !223, i32 24, metadata !224, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!223 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!224 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !225, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!225 = metadata !{metadata !226, metadata !227, metadata !235, metadata !242, metadata !243}
!226 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !223, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !138} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!227 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !228} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!228 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !139, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !229, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!229 = metadata !{metadata !230, metadata !231, metadata !232, metadata !233, metadata !234}
!230 = metadata !{i32 786445, metadata !228, metadata !"x", metadata !139, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!231 = metadata !{i32 786445, metadata !228, metadata !"y", metadata !139, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !20} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!232 = metadata !{i32 786445, metadata !228, metadata !"z", metadata !139, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!233 = metadata !{i32 786445, metadata !228, metadata !"w", metadata !139, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !20} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!234 = metadata !{i32 786445, metadata !228, metadata !"f", metadata !139, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !213} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!235 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !236} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!236 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !139, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !237, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!237 = metadata !{metadata !238, metadata !240, metadata !241}
!238 = metadata !{i32 786445, metadata !236, metadata !"width", metadata !139, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!239 = metadata !{i32 786454, null, metadata !"size_t", metadata !139, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !89} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!240 = metadata !{i32 786445, metadata !236, metadata !"height", metadata !139, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !239} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!241 = metadata !{i32 786445, metadata !236, metadata !"depth", metadata !139, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !239} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!242 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!243 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !244} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!244 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !139, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!245 = metadata !{metadata !246}
!246 = metadata !{metadata !247, metadata !248, metadata !249, metadata !250}
!247 = metadata !{i32 786689, metadata !222, metadata !"desc", metadata !223, i32 16777240, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!248 = metadata !{i32 786689, metadata !222, metadata !"extent", metadata !223, i32 33554456, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!249 = metadata !{i32 786689, metadata !222, metadata !"flags", metadata !223, i32 50331673, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!250 = metadata !{i32 786689, metadata !222, metadata !"array", metadata !223, i32 67108889, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!251 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !223, i32 29, metadata !252, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !254, 
!252 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !253, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!253 = metadata !{metadata !226, metadata !85}
!254 = metadata !{metadata !255}
!255 = metadata !{metadata !256}
!256 = metadata !{i32 786689, metadata !251, metadata !"devPtr", metadata !223, i32 16777245, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!257 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !223, i32 34, metadata !258, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!258 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !259, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!259 = metadata !{metadata !226, metadata !243}
!260 = metadata !{metadata !261}
!261 = metadata !{metadata !262}
!262 = metadata !{i32 786689, metadata !257, metadata !"array", metadata !223, i32 16777250, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!263 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !223, i32 39, metadata !252, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!264 = metadata !{metadata !265}
!265 = metadata !{metadata !266}
!266 = metadata !{i32 786689, metadata !263, metadata !"ptr", metadata !223, i32 16777255, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!267 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !223, i32 44, metadata !268, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!268 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !269, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!269 = metadata !{metadata !226, metadata !270, metadata !100}
!270 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !85} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!271 = metadata !{metadata !272}
!272 = metadata !{metadata !273, metadata !274}
!273 = metadata !{i32 786689, metadata !267, metadata !"devPtr", metadata !223, i32 16777260, metadata !270, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!274 = metadata !{i32 786689, metadata !267, metadata !"symbol", metadata !223, i32 33554476, metadata !100, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!275 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !223, i32 48, metadata !276, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!276 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !277, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!277 = metadata !{metadata !226, metadata !278, metadata !100}
!278 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!279 = metadata !{metadata !280}
!280 = metadata !{metadata !281, metadata !282}
!281 = metadata !{i32 786689, metadata !275, metadata !"size", metadata !223, i32 16777264, metadata !278, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!282 = metadata !{i32 786689, metadata !275, metadata !"symbol", metadata !223, i32 33554480, metadata !100, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!283 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !223, i32 52, metadata !284, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!284 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !285, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!285 = metadata !{metadata !226, metadata !270, metadata !239, metadata !32}
!286 = metadata !{metadata !287}
!287 = metadata !{metadata !288, metadata !289, metadata !290}
!288 = metadata !{i32 786689, metadata !283, metadata !"pHost", metadata !223, i32 16777268, metadata !270, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!289 = metadata !{i32 786689, metadata !283, metadata !"size", metadata !223, i32 33554484, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!290 = metadata !{i32 786689, metadata !283, metadata !"flags", metadata !223, i32 50331700, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!291 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !223, i32 56, metadata !292, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!292 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !293, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!293 = metadata !{metadata !226, metadata !270, metadata !85, metadata !32}
!294 = metadata !{metadata !295}
!295 = metadata !{metadata !296, metadata !297, metadata !298}
!296 = metadata !{i32 786689, metadata !291, metadata !"pDevice", metadata !223, i32 16777272, metadata !270, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!297 = metadata !{i32 786689, metadata !291, metadata !"pHost", metadata !223, i32 33554488, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!298 = metadata !{i32 786689, metadata !291, metadata !"flags", metadata !223, i32 50331704, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!299 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !223, i32 60, metadata !300, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!300 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !301, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!301 = metadata !{metadata !226, metadata !242, metadata !85}
!302 = metadata !{metadata !303}
!303 = metadata !{metadata !304, metadata !305}
!304 = metadata !{i32 786689, metadata !299, metadata !"pFlags", metadata !223, i32 16777276, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!305 = metadata !{i32 786689, metadata !299, metadata !"pHost", metadata !223, i32 33554492, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!306 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !223, i32 64, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!307 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !308, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!308 = metadata !{metadata !226, metadata !85, metadata !239, metadata !32}
!309 = metadata !{metadata !310}
!310 = metadata !{metadata !311, metadata !312, metadata !313}
!311 = metadata !{i32 786689, metadata !306, metadata !"ptr", metadata !223, i32 16777280, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!312 = metadata !{i32 786689, metadata !306, metadata !"size", metadata !223, i32 33554496, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!313 = metadata !{i32 786689, metadata !306, metadata !"flags", metadata !223, i32 50331712, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!314 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !223, i32 68, metadata !252, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!315 = metadata !{metadata !316}
!316 = metadata !{metadata !317}
!317 = metadata !{i32 786689, metadata !314, metadata !"ptr", metadata !223, i32 16777284, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!318 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !223, i32 72, metadata !319, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!319 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !320, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!320 = metadata !{metadata !226, metadata !270, metadata !239}
!321 = metadata !{metadata !322}
!322 = metadata !{metadata !323, metadata !324}
!323 = metadata !{i32 786689, metadata !318, metadata !"devPtr", metadata !223, i32 16777288, metadata !270, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!324 = metadata !{i32 786689, metadata !318, metadata !"size", metadata !223, i32 33554504, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!325 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !223, i32 80, metadata !326, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!326 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !327, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!327 = metadata !{metadata !226, metadata !328, metadata !236}
!328 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !329} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!329 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !139, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !330, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!330 = metadata !{metadata !331, metadata !332, metadata !333, metadata !334}
!331 = metadata !{i32 786445, metadata !329, metadata !"ptr", metadata !139, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !85} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!332 = metadata !{i32 786445, metadata !329, metadata !"pitch", metadata !139, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !239} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!333 = metadata !{i32 786445, metadata !329, metadata !"xsize", metadata !139, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !239} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!334 = metadata !{i32 786445, metadata !329, metadata !"ysize", metadata !139, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !239} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!335 = metadata !{metadata !336}
!336 = metadata !{metadata !337, metadata !338}
!337 = metadata !{i32 786689, metadata !325, metadata !"pitchedDevPtr", metadata !223, i32 16777296, metadata !328, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!338 = metadata !{i32 786689, metadata !325, metadata !"extent", metadata !223, i32 33554512, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!339 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !223, i32 84, metadata !340, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!340 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !341, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!341 = metadata !{metadata !226, metadata !342, metadata !227, metadata !236, metadata !32}
!342 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !243} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!343 = metadata !{metadata !344}
!344 = metadata !{metadata !345, metadata !346, metadata !347, metadata !348}
!345 = metadata !{i32 786689, metadata !339, metadata !"array", metadata !223, i32 16777300, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!346 = metadata !{i32 786689, metadata !339, metadata !"desc", metadata !223, i32 33554516, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!347 = metadata !{i32 786689, metadata !339, metadata !"extent", metadata !223, i32 50331733, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!348 = metadata !{i32 786689, metadata !339, metadata !"flags", metadata !223, i32 67108949, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!349 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !223, i32 89, metadata !350, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!350 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !351, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!351 = metadata !{metadata !226, metadata !342, metadata !227, metadata !239, metadata !239, metadata !32}
!352 = metadata !{metadata !353}
!353 = metadata !{metadata !354, metadata !355, metadata !356, metadata !357, metadata !358}
!354 = metadata !{i32 786689, metadata !349, metadata !"array", metadata !223, i32 16777305, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!355 = metadata !{i32 786689, metadata !349, metadata !"desc", metadata !223, i32 33554521, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!356 = metadata !{i32 786689, metadata !349, metadata !"width", metadata !223, i32 50331738, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!357 = metadata !{i32 786689, metadata !349, metadata !"height", metadata !223, i32 67108954, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!358 = metadata !{i32 786689, metadata !349, metadata !"flags", metadata !223, i32 83886170, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!359 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !223, i32 94, metadata !319, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!360 = metadata !{metadata !361}
!361 = metadata !{metadata !362, metadata !363}
!362 = metadata !{i32 786689, metadata !359, metadata !"ptr", metadata !223, i32 16777310, metadata !270, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!363 = metadata !{i32 786689, metadata !359, metadata !"size", metadata !223, i32 33554526, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!364 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !223, i32 102, metadata !365, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!365 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !366, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!366 = metadata !{metadata !226, metadata !270, metadata !278, metadata !239, metadata !239}
!367 = metadata !{metadata !368}
!368 = metadata !{metadata !369, metadata !370, metadata !371, metadata !372}
!369 = metadata !{i32 786689, metadata !364, metadata !"devPtr", metadata !223, i32 16777318, metadata !270, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!370 = metadata !{i32 786689, metadata !364, metadata !"pitch", metadata !223, i32 33554534, metadata !278, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!371 = metadata !{i32 786689, metadata !364, metadata !"width", metadata !223, i32 50331750, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!372 = metadata !{i32 786689, metadata !364, metadata !"height", metadata !223, i32 67108966, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!373 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !223, i32 106, metadata !374, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!374 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !375, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!375 = metadata !{metadata !226, metadata !85, metadata !86, metadata !239, metadata !219}
!376 = metadata !{metadata !377}
!377 = metadata !{metadata !378, metadata !379, metadata !380, metadata !381}
!378 = metadata !{i32 786689, metadata !373, metadata !"dst", metadata !223, i32 16777322, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!379 = metadata !{i32 786689, metadata !373, metadata !"src", metadata !223, i32 33554538, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!380 = metadata !{i32 786689, metadata !373, metadata !"count", metadata !223, i32 50331754, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!381 = metadata !{i32 786689, metadata !373, metadata !"kind", metadata !223, i32 67108970, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!382 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !223, i32 111, metadata !383, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!383 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !384, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!384 = metadata !{metadata !226, metadata !85, metadata !239, metadata !86, metadata !239, metadata !239, metadata !239, metadata !219}
!385 = metadata !{metadata !386}
!386 = metadata !{metadata !387, metadata !388, metadata !389, metadata !390, metadata !391, metadata !392, metadata !393}
!387 = metadata !{i32 786689, metadata !382, metadata !"dst", metadata !223, i32 16777327, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!388 = metadata !{i32 786689, metadata !382, metadata !"dpitch", metadata !223, i32 33554543, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!389 = metadata !{i32 786689, metadata !382, metadata !"src", metadata !223, i32 50331759, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!390 = metadata !{i32 786689, metadata !382, metadata !"spitch", metadata !223, i32 67108975, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!391 = metadata !{i32 786689, metadata !382, metadata !"width", metadata !223, i32 83886192, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!392 = metadata !{i32 786689, metadata !382, metadata !"height", metadata !223, i32 100663408, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!393 = metadata !{i32 786689, metadata !382, metadata !"kind", metadata !223, i32 117440624, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!394 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !223, i32 116, metadata !395, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!395 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !396, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!396 = metadata !{metadata !226, metadata !243, metadata !239, metadata !239, metadata !243, metadata !239, metadata !239, metadata !239, metadata !239, metadata !219}
!397 = metadata !{metadata !398}
!398 = metadata !{metadata !399, metadata !400, metadata !401, metadata !402, metadata !403, metadata !404, metadata !405, metadata !406, metadata !407}
!399 = metadata !{i32 786689, metadata !394, metadata !"dst", metadata !223, i32 16777332, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!400 = metadata !{i32 786689, metadata !394, metadata !"wOffsetDst", metadata !223, i32 33554548, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!401 = metadata !{i32 786689, metadata !394, metadata !"hOffsetDst", metadata !223, i32 50331764, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!402 = metadata !{i32 786689, metadata !394, metadata !"src", metadata !223, i32 67108981, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!403 = metadata !{i32 786689, metadata !394, metadata !"wOffsetSrc", metadata !223, i32 83886197, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!404 = metadata !{i32 786689, metadata !394, metadata !"hOffsetSrc", metadata !223, i32 100663413, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!405 = metadata !{i32 786689, metadata !394, metadata !"width", metadata !223, i32 117440630, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!406 = metadata !{i32 786689, metadata !394, metadata !"height", metadata !223, i32 134217846, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!407 = metadata !{i32 786689, metadata !394, metadata !"kind", metadata !223, i32 150995062, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!408 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !223, i32 122, metadata !409, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!409 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !410, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!410 = metadata !{metadata !226, metadata !85, metadata !239, metadata !86, metadata !239, metadata !239, metadata !239, metadata !219, metadata !411}
!411 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !223, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !412} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!412 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !413} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!413 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !139, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!414 = metadata !{metadata !415}
!415 = metadata !{metadata !416, metadata !417, metadata !418, metadata !419, metadata !420, metadata !421, metadata !422, metadata !423}
!416 = metadata !{i32 786689, metadata !408, metadata !"dst", metadata !223, i32 16777338, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!417 = metadata !{i32 786689, metadata !408, metadata !"dpitch", metadata !223, i32 33554554, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!418 = metadata !{i32 786689, metadata !408, metadata !"src", metadata !223, i32 50331770, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!419 = metadata !{i32 786689, metadata !408, metadata !"spitch", metadata !223, i32 67108986, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!420 = metadata !{i32 786689, metadata !408, metadata !"width", metadata !223, i32 83886203, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!421 = metadata !{i32 786689, metadata !408, metadata !"height", metadata !223, i32 100663419, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!422 = metadata !{i32 786689, metadata !408, metadata !"kind", metadata !223, i32 117440635, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!423 = metadata !{i32 786689, metadata !408, metadata !"stream", metadata !223, i32 134217852, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!424 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !223, i32 128, metadata !425, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!425 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !426, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!426 = metadata !{metadata !226, metadata !85, metadata !239, metadata !243, metadata !239, metadata !239, metadata !239, metadata !239, metadata !219}
!427 = metadata !{metadata !428}
!428 = metadata !{metadata !429, metadata !430, metadata !431, metadata !432, metadata !433, metadata !434, metadata !435, metadata !436}
!429 = metadata !{i32 786689, metadata !424, metadata !"dst", metadata !223, i32 16777344, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!430 = metadata !{i32 786689, metadata !424, metadata !"dpitch", metadata !223, i32 33554560, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!431 = metadata !{i32 786689, metadata !424, metadata !"src", metadata !223, i32 50331776, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!432 = metadata !{i32 786689, metadata !424, metadata !"wOffset", metadata !223, i32 67108993, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!433 = metadata !{i32 786689, metadata !424, metadata !"hOffset", metadata !223, i32 83886209, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!434 = metadata !{i32 786689, metadata !424, metadata !"width", metadata !223, i32 100663425, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!435 = metadata !{i32 786689, metadata !424, metadata !"height", metadata !223, i32 117440641, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!436 = metadata !{i32 786689, metadata !424, metadata !"kind", metadata !223, i32 134217858, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!437 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !223, i32 134, metadata !438, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!438 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !439, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!439 = metadata !{metadata !226, metadata !85, metadata !239, metadata !243, metadata !239, metadata !239, metadata !239, metadata !239, metadata !219, metadata !411}
!440 = metadata !{metadata !441}
!441 = metadata !{metadata !442, metadata !443, metadata !444, metadata !445, metadata !446, metadata !447, metadata !448, metadata !449, metadata !450}
!442 = metadata !{i32 786689, metadata !437, metadata !"dst", metadata !223, i32 16777350, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!443 = metadata !{i32 786689, metadata !437, metadata !"dpitch", metadata !223, i32 33554566, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!444 = metadata !{i32 786689, metadata !437, metadata !"src", metadata !223, i32 50331782, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!445 = metadata !{i32 786689, metadata !437, metadata !"wOffset", metadata !223, i32 67108999, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!446 = metadata !{i32 786689, metadata !437, metadata !"hOffset", metadata !223, i32 83886215, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!447 = metadata !{i32 786689, metadata !437, metadata !"width", metadata !223, i32 100663431, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!448 = metadata !{i32 786689, metadata !437, metadata !"height", metadata !223, i32 117440647, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!449 = metadata !{i32 786689, metadata !437, metadata !"kind", metadata !223, i32 134217864, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!450 = metadata !{i32 786689, metadata !437, metadata !"stream", metadata !223, i32 150995080, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!451 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !223, i32 140, metadata !452, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!452 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !453, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!453 = metadata !{metadata !226, metadata !243, metadata !239, metadata !239, metadata !86, metadata !239, metadata !239, metadata !239, metadata !219}
!454 = metadata !{metadata !455}
!455 = metadata !{metadata !456, metadata !457, metadata !458, metadata !459, metadata !460, metadata !461, metadata !462, metadata !463}
!456 = metadata !{i32 786689, metadata !451, metadata !"dst", metadata !223, i32 16777356, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!457 = metadata !{i32 786689, metadata !451, metadata !"wOffset", metadata !223, i32 33554572, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!458 = metadata !{i32 786689, metadata !451, metadata !"hOffset", metadata !223, i32 50331788, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!459 = metadata !{i32 786689, metadata !451, metadata !"src", metadata !223, i32 67109005, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!460 = metadata !{i32 786689, metadata !451, metadata !"spitch", metadata !223, i32 83886221, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!461 = metadata !{i32 786689, metadata !451, metadata !"width", metadata !223, i32 100663437, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!462 = metadata !{i32 786689, metadata !451, metadata !"height", metadata !223, i32 117440653, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!463 = metadata !{i32 786689, metadata !451, metadata !"kind", metadata !223, i32 134217870, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!464 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !223, i32 146, metadata !465, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!465 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !466, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!466 = metadata !{metadata !226, metadata !243, metadata !239, metadata !239, metadata !86, metadata !239, metadata !239, metadata !239, metadata !219, metadata !411}
!467 = metadata !{metadata !468}
!468 = metadata !{metadata !469, metadata !470, metadata !471, metadata !472, metadata !473, metadata !474, metadata !475, metadata !476, metadata !477}
!469 = metadata !{i32 786689, metadata !464, metadata !"dst", metadata !223, i32 16777362, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!470 = metadata !{i32 786689, metadata !464, metadata !"wOffset", metadata !223, i32 33554578, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!471 = metadata !{i32 786689, metadata !464, metadata !"hOffset", metadata !223, i32 50331794, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!472 = metadata !{i32 786689, metadata !464, metadata !"src", metadata !223, i32 67109011, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!473 = metadata !{i32 786689, metadata !464, metadata !"spitch", metadata !223, i32 83886227, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!474 = metadata !{i32 786689, metadata !464, metadata !"width", metadata !223, i32 100663443, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!475 = metadata !{i32 786689, metadata !464, metadata !"height", metadata !223, i32 117440659, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!476 = metadata !{i32 786689, metadata !464, metadata !"kind", metadata !223, i32 134217876, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!477 = metadata !{i32 786689, metadata !464, metadata !"stream", metadata !223, i32 150995092, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!478 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !223, i32 152, metadata !479, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!479 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !480, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!480 = metadata !{metadata !226, metadata !481}
!481 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !482} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!482 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !483} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!483 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !139, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !484, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!484 = metadata !{metadata !485, metadata !487, metadata !493, metadata !494, metadata !495, metadata !496, metadata !497, metadata !498}
!485 = metadata !{i32 786445, metadata !483, metadata !"srcArray", metadata !139, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !486} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!486 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !139, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !243} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!487 = metadata !{i32 786445, metadata !483, metadata !"srcPos", metadata !139, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !488} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!488 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !139, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !489, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!489 = metadata !{metadata !490, metadata !491, metadata !492}
!490 = metadata !{i32 786445, metadata !488, metadata !"x", metadata !139, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!491 = metadata !{i32 786445, metadata !488, metadata !"y", metadata !139, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !239} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!492 = metadata !{i32 786445, metadata !488, metadata !"z", metadata !139, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !239} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!493 = metadata !{i32 786445, metadata !483, metadata !"srcPtr", metadata !139, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !329} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!494 = metadata !{i32 786445, metadata !483, metadata !"dstArray", metadata !139, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !486} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!495 = metadata !{i32 786445, metadata !483, metadata !"dstPos", metadata !139, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !488} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!496 = metadata !{i32 786445, metadata !483, metadata !"dstPtr", metadata !139, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !329} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!497 = metadata !{i32 786445, metadata !483, metadata !"extent", metadata !139, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !236} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!498 = metadata !{i32 786445, metadata !483, metadata !"kind", metadata !139, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !219} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!499 = metadata !{metadata !500}
!500 = metadata !{metadata !501}
!501 = metadata !{i32 786689, metadata !478, metadata !"p", metadata !223, i32 16777368, metadata !481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!502 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !223, i32 156, metadata !503, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!503 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !504, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!504 = metadata !{metadata !226, metadata !481, metadata !411}
!505 = metadata !{metadata !506}
!506 = metadata !{metadata !507, metadata !508}
!507 = metadata !{i32 786689, metadata !502, metadata !"p", metadata !223, i32 16777372, metadata !481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!508 = metadata !{i32 786689, metadata !502, metadata !"stream", metadata !223, i32 33554588, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!509 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !223, i32 160, metadata !510, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!510 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !511, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!511 = metadata !{metadata !226, metadata !512}
!512 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !513} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!513 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !514} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!514 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !139, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !515, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!515 = metadata !{metadata !516, metadata !517, metadata !518, metadata !519, metadata !520, metadata !521, metadata !522, metadata !523, metadata !524}
!516 = metadata !{i32 786445, metadata !514, metadata !"srcArray", metadata !139, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !486} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!517 = metadata !{i32 786445, metadata !514, metadata !"srcPos", metadata !139, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !488} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!518 = metadata !{i32 786445, metadata !514, metadata !"srcPtr", metadata !139, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !329} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!519 = metadata !{i32 786445, metadata !514, metadata !"srcDevice", metadata !139, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !20} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!520 = metadata !{i32 786445, metadata !514, metadata !"dstArray", metadata !139, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !486} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!521 = metadata !{i32 786445, metadata !514, metadata !"dstPos", metadata !139, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !488} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!522 = metadata !{i32 786445, metadata !514, metadata !"dstPtr", metadata !139, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !329} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!523 = metadata !{i32 786445, metadata !514, metadata !"dstDevice", metadata !139, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !20} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!524 = metadata !{i32 786445, metadata !514, metadata !"extent", metadata !139, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !236} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!525 = metadata !{metadata !526}
!526 = metadata !{metadata !527}
!527 = metadata !{i32 786689, metadata !509, metadata !"p", metadata !223, i32 16777376, metadata !512, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!528 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !223, i32 164, metadata !529, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!529 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !530, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!530 = metadata !{metadata !226, metadata !512, metadata !411}
!531 = metadata !{metadata !532}
!532 = metadata !{metadata !533, metadata !534}
!533 = metadata !{i32 786689, metadata !528, metadata !"p", metadata !223, i32 16777380, metadata !512, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!534 = metadata !{i32 786689, metadata !528, metadata !"stream", metadata !223, i32 33554596, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!535 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !223, i32 168, metadata !536, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!536 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !537, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!537 = metadata !{metadata !226, metadata !243, metadata !239, metadata !239, metadata !243, metadata !239, metadata !239, metadata !239, metadata !219}
!538 = metadata !{metadata !539}
!539 = metadata !{metadata !540, metadata !541, metadata !542, metadata !543, metadata !544, metadata !545, metadata !546, metadata !547}
!540 = metadata !{i32 786689, metadata !535, metadata !"dst", metadata !223, i32 16777384, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!541 = metadata !{i32 786689, metadata !535, metadata !"wOffsetDst", metadata !223, i32 33554600, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!542 = metadata !{i32 786689, metadata !535, metadata !"hOffsetDst", metadata !223, i32 50331816, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!543 = metadata !{i32 786689, metadata !535, metadata !"src", metadata !223, i32 67109033, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!544 = metadata !{i32 786689, metadata !535, metadata !"wOffsetSrc", metadata !223, i32 83886249, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!545 = metadata !{i32 786689, metadata !535, metadata !"hOffsetSrc", metadata !223, i32 100663465, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!546 = metadata !{i32 786689, metadata !535, metadata !"count", metadata !223, i32 117440682, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!547 = metadata !{i32 786689, metadata !535, metadata !"kind", metadata !223, i32 134217898, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!548 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !223, i32 174, metadata !549, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!549 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !550, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!550 = metadata !{metadata !226, metadata !85, metadata !86, metadata !239, metadata !219, metadata !411}
!551 = metadata !{metadata !552}
!552 = metadata !{metadata !553, metadata !554, metadata !555, metadata !556, metadata !557}
!553 = metadata !{i32 786689, metadata !548, metadata !"dst", metadata !223, i32 16777390, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!554 = metadata !{i32 786689, metadata !548, metadata !"src", metadata !223, i32 33554606, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!555 = metadata !{i32 786689, metadata !548, metadata !"count", metadata !223, i32 50331822, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!556 = metadata !{i32 786689, metadata !548, metadata !"kind", metadata !223, i32 67109039, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!557 = metadata !{i32 786689, metadata !548, metadata !"stream", metadata !223, i32 83886255, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!558 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !223, i32 179, metadata !559, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!559 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !560, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!560 = metadata !{metadata !226, metadata !85, metadata !243, metadata !239, metadata !239, metadata !239, metadata !219}
!561 = metadata !{metadata !562}
!562 = metadata !{metadata !563, metadata !564, metadata !565, metadata !566, metadata !567, metadata !568}
!563 = metadata !{i32 786689, metadata !558, metadata !"dst", metadata !223, i32 16777395, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!564 = metadata !{i32 786689, metadata !558, metadata !"src", metadata !223, i32 33554611, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!565 = metadata !{i32 786689, metadata !558, metadata !"wOffset", metadata !223, i32 50331827, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!566 = metadata !{i32 786689, metadata !558, metadata !"hOffset", metadata !223, i32 67109044, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!567 = metadata !{i32 786689, metadata !558, metadata !"count", metadata !223, i32 83886260, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!568 = metadata !{i32 786689, metadata !558, metadata !"kind", metadata !223, i32 100663476, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!569 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !223, i32 184, metadata !570, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!570 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !571, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!571 = metadata !{metadata !226, metadata !85, metadata !243, metadata !239, metadata !239, metadata !239, metadata !219, metadata !411}
!572 = metadata !{metadata !573}
!573 = metadata !{metadata !574, metadata !575, metadata !576, metadata !577, metadata !578, metadata !579, metadata !580}
!574 = metadata !{i32 786689, metadata !569, metadata !"dst", metadata !223, i32 16777400, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!575 = metadata !{i32 786689, metadata !569, metadata !"src", metadata !223, i32 33554616, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!576 = metadata !{i32 786689, metadata !569, metadata !"wOffset", metadata !223, i32 50331832, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!577 = metadata !{i32 786689, metadata !569, metadata !"hOffset", metadata !223, i32 67109049, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!578 = metadata !{i32 786689, metadata !569, metadata !"count", metadata !223, i32 83886265, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!579 = metadata !{i32 786689, metadata !569, metadata !"kind", metadata !223, i32 100663481, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!580 = metadata !{i32 786689, metadata !569, metadata !"stream", metadata !223, i32 117440698, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!581 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !223, i32 190, metadata !582, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!582 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !583, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!583 = metadata !{metadata !226, metadata !85, metadata !100, metadata !239, metadata !239, metadata !219}
!584 = metadata !{metadata !585}
!585 = metadata !{metadata !586, metadata !587, metadata !588, metadata !589, metadata !590}
!586 = metadata !{i32 786689, metadata !581, metadata !"dst", metadata !223, i32 16777406, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!587 = metadata !{i32 786689, metadata !581, metadata !"symbol", metadata !223, i32 33554622, metadata !100, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!588 = metadata !{i32 786689, metadata !581, metadata !"count", metadata !223, i32 50331838, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!589 = metadata !{i32 786689, metadata !581, metadata !"offset", metadata !223, i32 67109055, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!590 = metadata !{i32 786689, metadata !581, metadata !"kind", metadata !223, i32 83886271, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!591 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !223, i32 195, metadata !592, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!592 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !593, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!593 = metadata !{metadata !226, metadata !85, metadata !100, metadata !239, metadata !239, metadata !219, metadata !411}
!594 = metadata !{metadata !595}
!595 = metadata !{metadata !596, metadata !597, metadata !598, metadata !599, metadata !600, metadata !601}
!596 = metadata !{i32 786689, metadata !591, metadata !"dst", metadata !223, i32 16777411, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!597 = metadata !{i32 786689, metadata !591, metadata !"symbol", metadata !223, i32 33554627, metadata !100, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!598 = metadata !{i32 786689, metadata !591, metadata !"count", metadata !223, i32 50331843, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!599 = metadata !{i32 786689, metadata !591, metadata !"offset", metadata !223, i32 67109060, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!600 = metadata !{i32 786689, metadata !591, metadata !"kind", metadata !223, i32 83886276, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!601 = metadata !{i32 786689, metadata !591, metadata !"stream", metadata !223, i32 100663493, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!602 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !223, i32 201, metadata !603, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!603 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !604, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!604 = metadata !{metadata !226, metadata !85, metadata !20, metadata !86, metadata !20, metadata !239}
!605 = metadata !{metadata !606}
!606 = metadata !{metadata !607, metadata !608, metadata !609, metadata !610, metadata !611}
!607 = metadata !{i32 786689, metadata !602, metadata !"dst", metadata !223, i32 16777417, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!608 = metadata !{i32 786689, metadata !602, metadata !"dstDevice", metadata !223, i32 33554633, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!609 = metadata !{i32 786689, metadata !602, metadata !"src", metadata !223, i32 50331849, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!610 = metadata !{i32 786689, metadata !602, metadata !"srcDevice", metadata !223, i32 67109065, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!611 = metadata !{i32 786689, metadata !602, metadata !"count", metadata !223, i32 83886281, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!612 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !223, i32 206, metadata !613, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!613 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !614, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!614 = metadata !{metadata !226, metadata !85, metadata !20, metadata !86, metadata !20, metadata !239, metadata !411}
!615 = metadata !{metadata !616}
!616 = metadata !{metadata !617, metadata !618, metadata !619, metadata !620, metadata !621, metadata !622}
!617 = metadata !{i32 786689, metadata !612, metadata !"dst", metadata !223, i32 16777422, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!618 = metadata !{i32 786689, metadata !612, metadata !"dstDevice", metadata !223, i32 33554638, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!619 = metadata !{i32 786689, metadata !612, metadata !"src", metadata !223, i32 50331854, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!620 = metadata !{i32 786689, metadata !612, metadata !"srcDevice", metadata !223, i32 67109070, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!621 = metadata !{i32 786689, metadata !612, metadata !"count", metadata !223, i32 83886287, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!622 = metadata !{i32 786689, metadata !612, metadata !"stream", metadata !223, i32 100663503, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!623 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !223, i32 212, metadata !624, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!624 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !625, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!625 = metadata !{metadata !226, metadata !243, metadata !239, metadata !239, metadata !86, metadata !239, metadata !219}
!626 = metadata !{metadata !627}
!627 = metadata !{metadata !628, metadata !629, metadata !630, metadata !631, metadata !632, metadata !633}
!628 = metadata !{i32 786689, metadata !623, metadata !"dst", metadata !223, i32 16777428, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!629 = metadata !{i32 786689, metadata !623, metadata !"wOffset", metadata !223, i32 33554644, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!630 = metadata !{i32 786689, metadata !623, metadata !"hOffset", metadata !223, i32 50331860, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!631 = metadata !{i32 786689, metadata !623, metadata !"src", metadata !223, i32 67109077, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!632 = metadata !{i32 786689, metadata !623, metadata !"count", metadata !223, i32 83886293, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!633 = metadata !{i32 786689, metadata !623, metadata !"kind", metadata !223, i32 100663509, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!634 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !223, i32 217, metadata !635, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!635 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !636, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!636 = metadata !{metadata !226, metadata !243, metadata !239, metadata !239, metadata !86, metadata !239, metadata !219, metadata !411}
!637 = metadata !{metadata !638}
!638 = metadata !{metadata !639, metadata !640, metadata !641, metadata !642, metadata !643, metadata !644, metadata !645}
!639 = metadata !{i32 786689, metadata !634, metadata !"dst", metadata !223, i32 16777433, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!640 = metadata !{i32 786689, metadata !634, metadata !"wOffset", metadata !223, i32 33554649, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!641 = metadata !{i32 786689, metadata !634, metadata !"hOffset", metadata !223, i32 50331865, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!642 = metadata !{i32 786689, metadata !634, metadata !"src", metadata !223, i32 67109082, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!643 = metadata !{i32 786689, metadata !634, metadata !"count", metadata !223, i32 83886298, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!644 = metadata !{i32 786689, metadata !634, metadata !"kind", metadata !223, i32 100663514, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!645 = metadata !{i32 786689, metadata !634, metadata !"stream", metadata !223, i32 117440731, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!646 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !223, i32 223, metadata !647, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!647 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !648, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!648 = metadata !{metadata !226, metadata !97, metadata !86, metadata !239, metadata !239, metadata !219}
!649 = metadata !{metadata !650}
!650 = metadata !{metadata !651, metadata !652, metadata !653, metadata !654, metadata !655}
!651 = metadata !{i32 786689, metadata !646, metadata !"symbol", metadata !223, i32 16777439, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!652 = metadata !{i32 786689, metadata !646, metadata !"src", metadata !223, i32 33554655, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!653 = metadata !{i32 786689, metadata !646, metadata !"count", metadata !223, i32 50331871, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!654 = metadata !{i32 786689, metadata !646, metadata !"offset", metadata !223, i32 67109088, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!655 = metadata !{i32 786689, metadata !646, metadata !"kind", metadata !223, i32 83886304, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!656 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !223, i32 229, metadata !657, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!657 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !658, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!658 = metadata !{metadata !226, metadata !100, metadata !86, metadata !239, metadata !239, metadata !219, metadata !411}
!659 = metadata !{metadata !660}
!660 = metadata !{metadata !661, metadata !662, metadata !663, metadata !664, metadata !665, metadata !666}
!661 = metadata !{i32 786689, metadata !656, metadata !"symbol", metadata !223, i32 16777445, metadata !100, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!662 = metadata !{i32 786689, metadata !656, metadata !"src", metadata !223, i32 33554661, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!663 = metadata !{i32 786689, metadata !656, metadata !"count", metadata !223, i32 50331877, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!664 = metadata !{i32 786689, metadata !656, metadata !"offset", metadata !223, i32 67109093, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!665 = metadata !{i32 786689, metadata !656, metadata !"kind", metadata !223, i32 83886310, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!666 = metadata !{i32 786689, metadata !656, metadata !"stream", metadata !223, i32 100663526, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!667 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !223, i32 234, metadata !668, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!668 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !669, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!669 = metadata !{metadata !226, metadata !278, metadata !278}
!670 = metadata !{metadata !671}
!671 = metadata !{metadata !672, metadata !673}
!672 = metadata !{i32 786689, metadata !667, metadata !"free", metadata !223, i32 16777450, metadata !278, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!673 = metadata !{i32 786689, metadata !667, metadata !"total", metadata !223, i32 33554666, metadata !278, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!674 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !223, i32 238, metadata !675, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!675 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !676, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!676 = metadata !{metadata !226, metadata !85, metadata !20, metadata !239}
!677 = metadata !{metadata !678}
!678 = metadata !{metadata !679, metadata !680, metadata !681}
!679 = metadata !{i32 786689, metadata !674, metadata !"devPtr", metadata !223, i32 16777454, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!680 = metadata !{i32 786689, metadata !674, metadata !"value", metadata !223, i32 33554670, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!681 = metadata !{i32 786689, metadata !674, metadata !"count", metadata !223, i32 50331886, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!682 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !223, i32 243, metadata !683, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!683 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !684, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!684 = metadata !{metadata !226, metadata !85, metadata !239, metadata !20, metadata !239, metadata !239}
!685 = metadata !{metadata !686}
!686 = metadata !{metadata !687, metadata !688, metadata !689, metadata !690, metadata !691}
!687 = metadata !{i32 786689, metadata !682, metadata !"devPtr", metadata !223, i32 16777459, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!688 = metadata !{i32 786689, metadata !682, metadata !"pitch", metadata !223, i32 33554675, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!689 = metadata !{i32 786689, metadata !682, metadata !"value", metadata !223, i32 50331891, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!690 = metadata !{i32 786689, metadata !682, metadata !"width", metadata !223, i32 67109108, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!691 = metadata !{i32 786689, metadata !682, metadata !"height", metadata !223, i32 83886324, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!692 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !223, i32 248, metadata !693, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!693 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !694, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!694 = metadata !{metadata !226, metadata !85, metadata !239, metadata !20, metadata !239, metadata !239, metadata !411}
!695 = metadata !{metadata !696}
!696 = metadata !{metadata !697, metadata !698, metadata !699, metadata !700, metadata !701, metadata !702}
!697 = metadata !{i32 786689, metadata !692, metadata !"devPtr", metadata !223, i32 16777464, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!698 = metadata !{i32 786689, metadata !692, metadata !"pitch", metadata !223, i32 33554680, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!699 = metadata !{i32 786689, metadata !692, metadata !"value", metadata !223, i32 50331896, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!700 = metadata !{i32 786689, metadata !692, metadata !"width", metadata !223, i32 67109113, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!701 = metadata !{i32 786689, metadata !692, metadata !"height", metadata !223, i32 83886329, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!702 = metadata !{i32 786689, metadata !692, metadata !"stream", metadata !223, i32 100663545, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!703 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !223, i32 253, metadata !704, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!704 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !705, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!705 = metadata !{metadata !226, metadata !329, metadata !20, metadata !236}
!706 = metadata !{metadata !707}
!707 = metadata !{metadata !708, metadata !709, metadata !710}
!708 = metadata !{i32 786689, metadata !703, metadata !"pitchedDevPtr", metadata !223, i32 16777469, metadata !329, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!709 = metadata !{i32 786689, metadata !703, metadata !"value", metadata !223, i32 33554685, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!710 = metadata !{i32 786689, metadata !703, metadata !"extent", metadata !223, i32 50331902, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!711 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !223, i32 258, metadata !712, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!712 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !713, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!713 = metadata !{metadata !226, metadata !329, metadata !20, metadata !236, metadata !411}
!714 = metadata !{metadata !715}
!715 = metadata !{metadata !716, metadata !717, metadata !718, metadata !719}
!716 = metadata !{i32 786689, metadata !711, metadata !"pitchedDevPtr", metadata !223, i32 16777474, metadata !329, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!717 = metadata !{i32 786689, metadata !711, metadata !"value", metadata !223, i32 33554690, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!718 = metadata !{i32 786689, metadata !711, metadata !"extent", metadata !223, i32 50331907, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!719 = metadata !{i32 786689, metadata !711, metadata !"stream", metadata !223, i32 67109123, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!720 = metadata !{i32 786478, i32 0, metadata !223, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !223, i32 263, metadata !721, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!721 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !722, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!722 = metadata !{metadata !226, metadata !85, metadata !20, metadata !239, metadata !411}
!723 = metadata !{metadata !724}
!724 = metadata !{metadata !725, metadata !726, metadata !727, metadata !728}
!725 = metadata !{i32 786689, metadata !720, metadata !"devPtr", metadata !223, i32 16777479, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!726 = metadata !{i32 786689, metadata !720, metadata !"value", metadata !223, i32 33554695, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!727 = metadata !{i32 786689, metadata !720, metadata !"count", metadata !223, i32 50331911, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!728 = metadata !{i32 786689, metadata !720, metadata !"stream", metadata !223, i32 67109127, metadata !411, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!729 = metadata !{i32 13, i32 0, metadata !730, null}
!730 = metadata !{i32 786443, metadata !15, i32 12, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail/main.cpp]
!731 = metadata !{i32 14, i32 0, metadata !730, null}
!732 = metadata !{i32 20, i32 0, metadata !733, null}
!733 = metadata !{i32 786443, metadata !21, i32 15, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail/main.cpp]
!734 = metadata !{i32 22, i32 0, metadata !733, null}
!735 = metadata !{i32 24, i32 0, metadata !733, null}
!736 = metadata !{i32 25, i32 0, metadata !733, null}
!737 = metadata !{i32 27, i32 0, metadata !738, null}
!738 = metadata !{i32 786443, metadata !733, i32 27, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail/main.cpp]
!739 = metadata !{i32 28, i32 0, metadata !738, null}
!740 = metadata !{i32 30, i32 0, metadata !733, null}
!741 = metadata !{i32 31, i32 0, metadata !742, null}
!742 = metadata !{i32 786443, metadata !733, i32 31, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail/main.cpp]
!743 = metadata !{i32 33, i32 0, metadata !742, null}
!744 = metadata !{i32 37, i32 0, metadata !733, null}
!745 = metadata !{i32 39, i32 0, metadata !746, null}
!746 = metadata !{i32 786443, metadata !733, i32 39, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail/main.cpp]
!747 = metadata !{i32 40, i32 0, metadata !748, null}
!748 = metadata !{i32 786443, metadata !746, i32 39, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail/main.cpp]
!749 = metadata !{i32 42, i32 0, metadata !733, null}
!750 = metadata !{i32 43, i32 0, metadata !733, null}
!751 = metadata !{i32 44, i32 0, metadata !733, null}
!752 = metadata !{i32 46, i32 0, metadata !733, null}
!753 = metadata !{i32 419, i32 0, metadata !24, null}
!754 = metadata !{i32 419, i32 0, metadata !67, null}
!755 = metadata !{i32 419, i32 0, metadata !756, null}
!756 = metadata !{i32 786443, metadata !67, i32 419, i32 0, metadata !25, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/050_fail//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!757 = metadata !{i32 16, i32 0, metadata !96, null}
!758 = metadata !{i32 17, i32 0, metadata !96, null}
!759 = metadata !{metadata !"omnipotent char", metadata !760}
!760 = metadata !{metadata !"Simple C/C++ TBAA"}
!761 = metadata !{i32 18, i32 0, metadata !96, null}
!762 = metadata !{i32 14, i32 0, metadata !132, null}
!763 = metadata !{i32 15, i32 0, metadata !132, null}
!764 = metadata !{i32 16, i32 0, metadata !132, null}
!765 = metadata !{i32 26, i32 0, metadata !766, null}
!766 = metadata !{i32 786443, metadata !222, i32 25, i32 0, metadata !223, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!767 = metadata !{i32 30, i32 0, metadata !768, null}
!768 = metadata !{i32 786443, metadata !251, i32 29, i32 0, metadata !223, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!769 = metadata !{i32 31, i32 0, metadata !768, null}
!770 = metadata !{i32 35, i32 0, metadata !771, null}
!771 = metadata !{i32 786443, metadata !257, i32 34, i32 0, metadata !223, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!772 = metadata !{i32 36, i32 0, metadata !771, null}
!773 = metadata !{i32 40, i32 0, metadata !774, null}
!774 = metadata !{i32 786443, metadata !263, i32 39, i32 0, metadata !223, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!775 = metadata !{i32 41, i32 0, metadata !774, null}
!776 = metadata !{i32 45, i32 0, metadata !777, null}
!777 = metadata !{i32 786443, metadata !267, i32 44, i32 0, metadata !223, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!778 = metadata !{i32 49, i32 0, metadata !779, null}
!779 = metadata !{i32 786443, metadata !275, i32 48, i32 0, metadata !223, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!780 = metadata !{i32 53, i32 0, metadata !781, null}
!781 = metadata !{i32 786443, metadata !283, i32 52, i32 0, metadata !223, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!782 = metadata !{i32 57, i32 0, metadata !783, null}
!783 = metadata !{i32 786443, metadata !291, i32 56, i32 0, metadata !223, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!784 = metadata !{i32 61, i32 0, metadata !785, null}
!785 = metadata !{i32 786443, metadata !299, i32 60, i32 0, metadata !223, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!786 = metadata !{i32 65, i32 0, metadata !787, null}
!787 = metadata !{i32 786443, metadata !306, i32 64, i32 0, metadata !223, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!788 = metadata !{i32 69, i32 0, metadata !789, null}
!789 = metadata !{i32 786443, metadata !314, i32 68, i32 0, metadata !223, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!790 = metadata !{i32 73, i32 0, metadata !791, null}
!791 = metadata !{i32 786443, metadata !318, i32 72, i32 0, metadata !223, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!792 = metadata !{i32 74, i32 0, metadata !791, null}
!793 = metadata !{metadata !"any pointer", metadata !759}
!794 = metadata !{i32 75, i32 0, metadata !791, null}
!795 = metadata !{i32 77, i32 0, metadata !791, null}
!796 = metadata !{i32 81, i32 0, metadata !797, null}
!797 = metadata !{i32 786443, metadata !325, i32 80, i32 0, metadata !223, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!798 = metadata !{i32 86, i32 0, metadata !799, null}
!799 = metadata !{i32 786443, metadata !339, i32 85, i32 0, metadata !223, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!800 = metadata !{i32 91, i32 0, metadata !801, null}
!801 = metadata !{i32 786443, metadata !349, i32 90, i32 0, metadata !223, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!802 = metadata !{i32 95, i32 0, metadata !803, null}
!803 = metadata !{i32 786443, metadata !359, i32 94, i32 0, metadata !223, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!804 = metadata !{i32 96, i32 0, metadata !803, null}
!805 = metadata !{i32 97, i32 0, metadata !803, null}
!806 = metadata !{i32 99, i32 0, metadata !803, null}
!807 = metadata !{i32 103, i32 0, metadata !808, null}
!808 = metadata !{i32 786443, metadata !364, i32 102, i32 0, metadata !223, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!809 = metadata !{i32 108, i32 0, metadata !810, null}
!810 = metadata !{i32 786443, metadata !373, i32 106, i32 0, metadata !223, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!811 = metadata !{i32 113, i32 0, metadata !812, null}
!812 = metadata !{i32 786443, metadata !382, i32 112, i32 0, metadata !223, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!813 = metadata !{i32 119, i32 0, metadata !814, null}
!814 = metadata !{i32 786443, metadata !394, i32 118, i32 0, metadata !223, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!815 = metadata !{i32 125, i32 0, metadata !816, null}
!816 = metadata !{i32 786443, metadata !408, i32 124, i32 0, metadata !223, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!817 = metadata !{i32 131, i32 0, metadata !818, null}
!818 = metadata !{i32 786443, metadata !424, i32 130, i32 0, metadata !223, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!819 = metadata !{i32 137, i32 0, metadata !820, null}
!820 = metadata !{i32 786443, metadata !437, i32 136, i32 0, metadata !223, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!821 = metadata !{i32 143, i32 0, metadata !822, null}
!822 = metadata !{i32 786443, metadata !451, i32 142, i32 0, metadata !223, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!823 = metadata !{i32 149, i32 0, metadata !824, null}
!824 = metadata !{i32 786443, metadata !464, i32 148, i32 0, metadata !223, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!825 = metadata !{i32 153, i32 0, metadata !826, null}
!826 = metadata !{i32 786443, metadata !478, i32 152, i32 0, metadata !223, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!827 = metadata !{i32 157, i32 0, metadata !828, null}
!828 = metadata !{i32 786443, metadata !502, i32 156, i32 0, metadata !223, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!829 = metadata !{i32 161, i32 0, metadata !830, null}
!830 = metadata !{i32 786443, metadata !509, i32 160, i32 0, metadata !223, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!831 = metadata !{i32 165, i32 0, metadata !832, null}
!832 = metadata !{i32 786443, metadata !528, i32 164, i32 0, metadata !223, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!833 = metadata !{i32 171, i32 0, metadata !834, null}
!834 = metadata !{i32 786443, metadata !535, i32 170, i32 0, metadata !223, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!835 = metadata !{i32 176, i32 0, metadata !836, null}
!836 = metadata !{i32 786443, metadata !548, i32 175, i32 0, metadata !223, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!837 = metadata !{i32 181, i32 0, metadata !838, null}
!838 = metadata !{i32 786443, metadata !558, i32 180, i32 0, metadata !223, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!839 = metadata !{i32 187, i32 0, metadata !840, null}
!840 = metadata !{i32 786443, metadata !569, i32 186, i32 0, metadata !223, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!841 = metadata !{i32 192, i32 0, metadata !842, null}
!842 = metadata !{i32 786443, metadata !581, i32 191, i32 0, metadata !223, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!843 = metadata !{i32 198, i32 0, metadata !844, null}
!844 = metadata !{i32 786443, metadata !591, i32 197, i32 0, metadata !223, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!845 = metadata !{i32 203, i32 0, metadata !846, null}
!846 = metadata !{i32 786443, metadata !602, i32 201, i32 0, metadata !223, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!847 = metadata !{i32 209, i32 0, metadata !848, null}
!848 = metadata !{i32 786443, metadata !612, i32 207, i32 0, metadata !223, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!849 = metadata !{i32 214, i32 0, metadata !850, null}
!850 = metadata !{i32 786443, metadata !623, i32 213, i32 0, metadata !223, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!851 = metadata !{i32 220, i32 0, metadata !852, null}
!852 = metadata !{i32 786443, metadata !634, i32 219, i32 0, metadata !223, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!853 = metadata !{i32 225, i32 0, metadata !854, null}
!854 = metadata !{i32 786443, metadata !646, i32 224, i32 0, metadata !223, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!855 = metadata !{i32 226, i32 0, metadata !854, null}
!856 = metadata !{i32 231, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !656, i32 230, i32 0, metadata !223, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!858 = metadata !{i32 235, i32 0, metadata !859, null}
!859 = metadata !{i32 786443, metadata !667, i32 234, i32 0, metadata !223, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!860 = metadata !{i32 239, i32 0, metadata !861, null}
!861 = metadata !{i32 786443, metadata !674, i32 238, i32 0, metadata !223, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!862 = metadata !{i32 240, i32 0, metadata !861, null}
!863 = metadata !{i32 245, i32 0, metadata !864, null}
!864 = metadata !{i32 786443, metadata !682, i32 244, i32 0, metadata !223, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!865 = metadata !{i32 250, i32 0, metadata !866, null}
!866 = metadata !{i32 786443, metadata !692, i32 249, i32 0, metadata !223, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!867 = metadata !{i32 255, i32 0, metadata !868, null}
!868 = metadata !{i32 786443, metadata !703, i32 254, i32 0, metadata !223, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!869 = metadata !{i32 260, i32 0, metadata !870, null}
!870 = metadata !{i32 786443, metadata !711, i32 259, i32 0, metadata !223, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!871 = metadata !{i32 264, i32 0, metadata !872, null}
!872 = metadata !{i32 786443, metadata !720, i32 263, i32 0, metadata !223, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
