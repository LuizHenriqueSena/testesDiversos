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

@_ZZ3fooPiE1A = internal global [10 x i32] zeroinitializer, section "__shared__", align 16
@.str = private unnamed_addr constant [6 x i8] c" %d; \00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"b[0]==1\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define void @_Z3fooPi(i32* %p) nounwind uwtable noinline {
  %1 = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  store i32 1, i32* getelementptr inbounds ([10 x i32]* @_ZZ3fooPiE1A, i32 0, i64 0), align 4, !dbg !725
  %2 = load i32* getelementptr inbounds ([10 x i32]* @_ZZ3fooPiE1A, i32 0, i64 0), align 4, !dbg !727
  %3 = load i32** %1, align 8, !dbg !727
  %4 = getelementptr inbounds i32* %3, i64 0, !dbg !727
  store i32 %2, i32* %4, align 4, !dbg !727
  ret void, !dbg !728
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %b = alloca i32*, align 8
  %dev_b = alloca i32*, align 8
  %i = alloca i32, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  %6 = call noalias i8* @malloc(i64 8) nounwind, !dbg !729
  %7 = bitcast i8* %6 to i32*, !dbg !729
  store i32* %7, i32** %b, align 8, !dbg !729
  store i32 0, i32* %i, align 4, !dbg !731
  br label %8, !dbg !731

; <label>:8                                       ; preds = %11, %0
  %9 = load i32* %i, align 4, !dbg !731
  %10 = icmp slt i32 %9, 2, !dbg !731
  br i1 %10, label %11, label %26, !dbg !731

; <label>:11                                      ; preds = %8
  %12 = load i32* %i, align 4, !dbg !733
  %13 = add nsw i32 %12, 1, !dbg !733
  %14 = load i32* %i, align 4, !dbg !733
  %15 = sext i32 %14 to i64, !dbg !733
  %16 = load i32** %b, align 8, !dbg !733
  %17 = getelementptr inbounds i32* %16, i64 %15, !dbg !733
  store i32 %13, i32* %17, align 4, !dbg !733
  %18 = load i32* %i, align 4, !dbg !735
  %19 = sext i32 %18 to i64, !dbg !735
  %20 = load i32** %b, align 8, !dbg !735
  %21 = getelementptr inbounds i32* %20, i64 %19, !dbg !735
  %22 = load i32* %21, align 4, !dbg !735
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %22), !dbg !735
  %24 = load i32* %i, align 4, !dbg !731
  %25 = add nsw i32 %24, 1, !dbg !731
  store i32 %25, i32* %i, align 4, !dbg !731
  br label %8, !dbg !731

; <label>:26                                      ; preds = %8
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !dbg !736
  %28 = bitcast i32** %dev_b to i8**, !dbg !737
  %29 = call i32 @cudaMalloc(i8** %28, i64 8), !dbg !737
  %30 = load i32** %dev_b, align 8, !dbg !738
  %31 = bitcast i32* %30 to i8*, !dbg !738
  %32 = load i32** %b, align 8, !dbg !738
  %33 = bitcast i32* %32 to i8*, !dbg !738
  %34 = call i32 @cudaMemcpy(i8* %31, i8* %33, i64 8, i32 1), !dbg !738
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !739
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 2, i32 1, i32 1), !dbg !739
  %35 = bitcast { i64, i32 }* %4 to i8*, !dbg !739
  %36 = bitcast %struct.dim3* %2 to i8*, !dbg !739
  %37 = call i8* @memcpy(i8* %35, i8* %36, i64 12)
  %38 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !739
  %39 = load i64* %38, align 1, !dbg !739
  %40 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !739
  %41 = load i32* %40, align 1, !dbg !739
  %42 = bitcast { i64, i32 }* %5 to i8*, !dbg !739
  %43 = bitcast %struct.dim3* %3 to i8*, !dbg !739
  %44 = call i8* @memcpy(i8* %42, i8* %43, i64 12)
  %45 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !739
  %46 = load i64* %45, align 1, !dbg !739
  %47 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !739
  %48 = load i32* %47, align 1, !dbg !739
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %39, i32 %41, i64 %46, i32 %48), !dbg !739
  %49 = load i32** %dev_b, align 8, !dbg !741
  call void @_Z3fooPi(i32* %49), !dbg !741
  %50 = load i32** %b, align 8, !dbg !742
  %51 = bitcast i32* %50 to i8*, !dbg !742
  %52 = load i32** %dev_b, align 8, !dbg !742
  %53 = bitcast i32* %52 to i8*, !dbg !742
  %54 = call i32 @cudaMemcpy(i8* %51, i8* %53, i64 8, i32 2), !dbg !742
  store i32 0, i32* %i1, align 4, !dbg !743
  br label %55, !dbg !743

; <label>:55                                      ; preds = %70, %26
  %56 = load i32* %i1, align 4, !dbg !743
  %57 = icmp slt i32 %56, 2, !dbg !743
  br i1 %57, label %58, label %73, !dbg !743

; <label>:58                                      ; preds = %55
  %59 = load i32* %i1, align 4, !dbg !745
  %60 = sext i32 %59 to i64, !dbg !745
  %61 = load i32** %b, align 8, !dbg !745
  %62 = getelementptr inbounds i32* %61, i64 %60, !dbg !745
  %63 = load i32* %62, align 4, !dbg !745
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %63), !dbg !745
  %65 = load i32** %b, align 8, !dbg !747
  %66 = getelementptr inbounds i32* %65, i64 0, !dbg !747
  %67 = load i32* %66, align 4, !dbg !747
  %68 = icmp eq i32 %67, 1, !dbg !747
  br i1 %68, label %70, label %69, !dbg !747

; <label>:69                                      ; preds = %58
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0), i32 45, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwin
  unreachable, !dbg !747

; <label>:70                                      ; preds = %58
  %71 = load i32* %i1, align 4, !dbg !743
  %72 = add nsw i32 %71, 1, !dbg !743
  store i32 %72, i32* %i1, align 4, !dbg !743
  br label %55, !dbg !743

; <label>:73                                      ; preds = %55
  %74 = load i32** %b, align 8, !dbg !748
  %75 = bitcast i32* %74 to i8*, !dbg !748
  call void @free(i8* %75) nounwind, !dbg !748
  %76 = load i32** %dev_b, align 8, !dbg !749
  %77 = bitcast i32* %76 to i8*, !dbg !749
  %78 = call i32 @cudaFree(i8* %77), !dbg !749
  %79 = load i32* %1, !dbg !750
  ret i32 %79, !dbg !750
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8*, ...)

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
  %6 = load i32* %2, align 4, !dbg !751
  %7 = load i32* %3, align 4, !dbg !751
  %8 = load i32* %4, align 4, !dbg !751
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !751
  ret void, !dbg !751
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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !752
  %7 = load i32* %2, align 4, !dbg !752
  store i32 %7, i32* %6, align 4, !dbg !752
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !752
  %9 = load i32* %3, align 4, !dbg !752
  store i32 %9, i32* %8, align 4, !dbg !752
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !752
  %11 = load i32* %4, align 4, !dbg !752
  store i32 %11, i32* %10, align 4, !dbg !752
  ret void, !dbg !753
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !755
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !755

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !755
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !756
  %4 = load i8* %src.06, align 1, !dbg !756, !tbaa !757
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !756
  store i8 %4, i8* %dest.05, align 1, !dbg !756, !tbaa !757
  %6 = icmp eq i64 %2, 0, !dbg !755
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !755

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !759
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !760
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !760

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !761
  br label %3, !dbg !760

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !760
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !761
  store volatile i8 %2, i8* %a.05, align 1, !dbg !761, !tbaa !757
  %6 = icmp eq i64 %4, 0, !dbg !760
  br i1 %6, label %._crit_edge, label %3, !dbg !760

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !762
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !763
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !765
  ret i32 0, !dbg !767
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !768
  tail call void @free(i8* %1) nounwind, !dbg !768
  ret i32 0, !dbg !770
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !771
  ret i32 0, !dbg !773
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !774
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !776
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !778
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !780
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !782
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !784
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !786
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !788
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !790
  store i8* %1, i8** %devPtr, align 8, !dbg !790, !tbaa !791
  tail call void @__clear_device(), !dbg !792
  ret i32 0, !dbg !793
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !794
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !796
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !798
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !800
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !802
  store i8* %1, i8** %ptr, align 8, !dbg !802, !tbaa !791
  tail call void @__clear_host(), !dbg !803
  ret i32 0, !dbg !804
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !805
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !807
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !809
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !811
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !813
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !815
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !817
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !819
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !821
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !823
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !825
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !827
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !829
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !831
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !833
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !835
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !837
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !839
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !841
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !843
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !845
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !847
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !849
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !851
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !853
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !854
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !856
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !858
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !860
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !861
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !863
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !865
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !867
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !869
}

!llvm.dbg.cu = !{!0, !74, !98, !114, !131}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, 
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces", null} ; [ DW_TAG_file_type ]
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
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"foo", metadata !"foo", metadata !"_Z3fooPi", metadata !16, i32 9, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*)* @_Z3fooPi, null, null, metadata !11, i32 9
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!20 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 19, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 19} ; [ DW_TAG_
!22 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !20}
!24 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !25, i32 419, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!25 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces", null} ; [ DW_TAG_file_type ]
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
!69 = metadata !{metadata !70}
!70 = metadata !{i32 786484, i32 0, metadata !15, metadata !"A", metadata !"A", metadata !"", metadata !16, i32 11, metadata !71, i32 1, i32 1, [10 x i32]* @_ZZ3fooPiE1A} ; [ DW_TAG_variable ] [A] [line 11] [local] [def]
!71 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 320, i64 32, i32 0, i32 0, metadata !20, metadata !72, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 320, align 32, offset 0] [from int]
!72 = metadata !{metadata !73}
!73 = metadata !{i32 786465, i64 0, i64 9}        ; [ DW_TAG_subrange_type ] [0, 9]
!74 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!75 = metadata !{metadata !76}
!76 = metadata !{metadata !77}
!77 = metadata !{i32 786478, i32 0, metadata !78, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !78, i32 12, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !86, i
!78 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!79 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{metadata !81, metadata !81, metadata !82, metadata !84}
!81 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!82 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !83} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!83 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = metadata !{i32 786454, null, metadata !"size_t", metadata !78, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!85 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!86 = metadata !{metadata !87}
!87 = metadata !{metadata !88, metadata !89, metadata !90, metadata !91, metadata !95}
!88 = metadata !{i32 786689, metadata !77, metadata !"destaddr", metadata !78, i32 16777228, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!89 = metadata !{i32 786689, metadata !77, metadata !"srcaddr", metadata !78, i32 33554444, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!90 = metadata !{i32 786689, metadata !77, metadata !"len", metadata !78, i32 50331660, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!91 = metadata !{i32 786688, metadata !92, metadata !"dest", metadata !78, i32 13, metadata !93, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!92 = metadata !{i32 786443, metadata !77, i32 12, i32 0, metadata !78, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!93 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !94} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!94 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!95 = metadata !{i32 786688, metadata !92, metadata !"src", metadata !78, i32 14, metadata !96, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!96 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !97} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!97 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !94} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!98 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!99 = metadata !{metadata !100}
!100 = metadata !{metadata !101}
!101 = metadata !{i32 786478, i32 0, metadata !102, metadata !"memmove", metadata !"memmove", metadata !"", metadata !102, i32 12, metadata !103, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !106, i32 12} ; [ DW_TAG
!102 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!103 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !104, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!104 = metadata !{metadata !81, metadata !81, metadata !82, metadata !105}
!105 = metadata !{i32 786454, null, metadata !"size_t", metadata !102, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!106 = metadata !{metadata !107}
!107 = metadata !{metadata !108, metadata !109, metadata !110, metadata !111, metadata !113}
!108 = metadata !{i32 786689, metadata !101, metadata !"dst", metadata !102, i32 16777228, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!109 = metadata !{i32 786689, metadata !101, metadata !"src", metadata !102, i32 33554444, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!110 = metadata !{i32 786689, metadata !101, metadata !"count", metadata !102, i32 50331660, metadata !105, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!111 = metadata !{i32 786688, metadata !112, metadata !"a", metadata !102, i32 14, metadata !93, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!112 = metadata !{i32 786443, metadata !101, i32 12, i32 0, metadata !102, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!113 = metadata !{i32 786688, metadata !112, metadata !"b", metadata !102, i32 15, metadata !96, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!114 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!115 = metadata !{metadata !116}
!116 = metadata !{metadata !117}
!117 = metadata !{i32 786478, i32 0, metadata !118, metadata !"memset", metadata !"memset", metadata !"", metadata !118, i32 12, metadata !119, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!118 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!119 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !120, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!120 = metadata !{metadata !81, metadata !81, metadata !20, metadata !121}
!121 = metadata !{i32 786454, null, metadata !"size_t", metadata !118, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!122 = metadata !{metadata !123}
!123 = metadata !{metadata !124, metadata !125, metadata !126, metadata !127}
!124 = metadata !{i32 786689, metadata !117, metadata !"dst", metadata !118, i32 16777228, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!125 = metadata !{i32 786689, metadata !117, metadata !"s", metadata !118, i32 33554444, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!126 = metadata !{i32 786689, metadata !117, metadata !"count", metadata !118, i32 50331660, metadata !121, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!127 = metadata !{i32 786688, metadata !128, metadata !"a", metadata !118, i32 13, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!128 = metadata !{i32 786443, metadata !117, i32 12, i32 0, metadata !118, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!129 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !130} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!130 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !94} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!131 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!132 = metadata !{metadata !133}
!133 = metadata !{metadata !134, metadata !209, metadata !215}
!134 = metadata !{i32 786436, null, metadata !"cudaError", metadata !135, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !136, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!135 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!136 = metadata !{metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !149, metadata !150, metadata !151, metadata !1
!137 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!138 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!139 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!140 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!141 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!142 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!143 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!144 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!145 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!146 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!147 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!148 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!149 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!150 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!151 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!152 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!153 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!154 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!155 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!156 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!157 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!158 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!159 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!160 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!161 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!162 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!163 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!164 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!165 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!166 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!167 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!168 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!169 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!170 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!171 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!172 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!173 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!174 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!175 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!176 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!177 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!178 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!179 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!180 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!181 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!182 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!183 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!184 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!185 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!186 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!187 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!188 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!189 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!190 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!191 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!192 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!193 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!194 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!195 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!196 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!197 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!198 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!199 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!200 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!201 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!202 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!203 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!204 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!205 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!206 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!207 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!208 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!209 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !135, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !210, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!210 = metadata !{metadata !211, metadata !212, metadata !213, metadata !214}
!211 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!212 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!213 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!214 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!215 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !135, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!216 = metadata !{metadata !217}
!217 = metadata !{metadata !218, metadata !247, metadata !253, metadata !259, metadata !263, metadata !271, metadata !279, metadata !287, metadata !295, metadata !302, metadata !310, metadata !314, metadata !321, metadata !335, metadata !345, metadata !3
!218 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !219, i32 24, metadata !220, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!219 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!220 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !221, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!221 = metadata !{metadata !222, metadata !223, metadata !231, metadata !238, metadata !239}
!222 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !219, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !134} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!223 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !224} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!224 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !135, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !225, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!225 = metadata !{metadata !226, metadata !227, metadata !228, metadata !229, metadata !230}
!226 = metadata !{i32 786445, metadata !224, metadata !"x", metadata !135, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!227 = metadata !{i32 786445, metadata !224, metadata !"y", metadata !135, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !20} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!228 = metadata !{i32 786445, metadata !224, metadata !"z", metadata !135, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!229 = metadata !{i32 786445, metadata !224, metadata !"w", metadata !135, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !20} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!230 = metadata !{i32 786445, metadata !224, metadata !"f", metadata !135, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !209} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!231 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !232} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!232 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !135, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !233, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!233 = metadata !{metadata !234, metadata !236, metadata !237}
!234 = metadata !{i32 786445, metadata !232, metadata !"width", metadata !135, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !235} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!235 = metadata !{i32 786454, null, metadata !"size_t", metadata !135, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!236 = metadata !{i32 786445, metadata !232, metadata !"height", metadata !135, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !235} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!237 = metadata !{i32 786445, metadata !232, metadata !"depth", metadata !135, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !235} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!238 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!239 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !240} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!240 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !135, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!241 = metadata !{metadata !242}
!242 = metadata !{metadata !243, metadata !244, metadata !245, metadata !246}
!243 = metadata !{i32 786689, metadata !218, metadata !"desc", metadata !219, i32 16777240, metadata !223, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!244 = metadata !{i32 786689, metadata !218, metadata !"extent", metadata !219, i32 33554456, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!245 = metadata !{i32 786689, metadata !218, metadata !"flags", metadata !219, i32 50331673, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!246 = metadata !{i32 786689, metadata !218, metadata !"array", metadata !219, i32 67108889, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!247 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !219, i32 29, metadata !248, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !250, 
!248 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !249, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!249 = metadata !{metadata !222, metadata !81}
!250 = metadata !{metadata !251}
!251 = metadata !{metadata !252}
!252 = metadata !{i32 786689, metadata !247, metadata !"devPtr", metadata !219, i32 16777245, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!253 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !219, i32 34, metadata !254, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!254 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !255, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!255 = metadata !{metadata !222, metadata !239}
!256 = metadata !{metadata !257}
!257 = metadata !{metadata !258}
!258 = metadata !{i32 786689, metadata !253, metadata !"array", metadata !219, i32 16777250, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!259 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !219, i32 39, metadata !248, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!260 = metadata !{metadata !261}
!261 = metadata !{metadata !262}
!262 = metadata !{i32 786689, metadata !259, metadata !"ptr", metadata !219, i32 16777255, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!263 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !219, i32 44, metadata !264, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!264 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !265, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!265 = metadata !{metadata !222, metadata !266, metadata !96}
!266 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !81} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!267 = metadata !{metadata !268}
!268 = metadata !{metadata !269, metadata !270}
!269 = metadata !{i32 786689, metadata !263, metadata !"devPtr", metadata !219, i32 16777260, metadata !266, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!270 = metadata !{i32 786689, metadata !263, metadata !"symbol", metadata !219, i32 33554476, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!271 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !219, i32 48, metadata !272, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!272 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !273, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!273 = metadata !{metadata !222, metadata !274, metadata !96}
!274 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !235} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!275 = metadata !{metadata !276}
!276 = metadata !{metadata !277, metadata !278}
!277 = metadata !{i32 786689, metadata !271, metadata !"size", metadata !219, i32 16777264, metadata !274, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!278 = metadata !{i32 786689, metadata !271, metadata !"symbol", metadata !219, i32 33554480, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!279 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !219, i32 52, metadata !280, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!280 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !281, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!281 = metadata !{metadata !222, metadata !266, metadata !235, metadata !32}
!282 = metadata !{metadata !283}
!283 = metadata !{metadata !284, metadata !285, metadata !286}
!284 = metadata !{i32 786689, metadata !279, metadata !"pHost", metadata !219, i32 16777268, metadata !266, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!285 = metadata !{i32 786689, metadata !279, metadata !"size", metadata !219, i32 33554484, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!286 = metadata !{i32 786689, metadata !279, metadata !"flags", metadata !219, i32 50331700, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!287 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !219, i32 56, metadata !288, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!288 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !289, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!289 = metadata !{metadata !222, metadata !266, metadata !81, metadata !32}
!290 = metadata !{metadata !291}
!291 = metadata !{metadata !292, metadata !293, metadata !294}
!292 = metadata !{i32 786689, metadata !287, metadata !"pDevice", metadata !219, i32 16777272, metadata !266, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!293 = metadata !{i32 786689, metadata !287, metadata !"pHost", metadata !219, i32 33554488, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!294 = metadata !{i32 786689, metadata !287, metadata !"flags", metadata !219, i32 50331704, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!295 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !219, i32 60, metadata !296, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!296 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !297, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!297 = metadata !{metadata !222, metadata !238, metadata !81}
!298 = metadata !{metadata !299}
!299 = metadata !{metadata !300, metadata !301}
!300 = metadata !{i32 786689, metadata !295, metadata !"pFlags", metadata !219, i32 16777276, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!301 = metadata !{i32 786689, metadata !295, metadata !"pHost", metadata !219, i32 33554492, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!302 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !219, i32 64, metadata !303, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!303 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !304, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!304 = metadata !{metadata !222, metadata !81, metadata !235, metadata !32}
!305 = metadata !{metadata !306}
!306 = metadata !{metadata !307, metadata !308, metadata !309}
!307 = metadata !{i32 786689, metadata !302, metadata !"ptr", metadata !219, i32 16777280, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!308 = metadata !{i32 786689, metadata !302, metadata !"size", metadata !219, i32 33554496, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!309 = metadata !{i32 786689, metadata !302, metadata !"flags", metadata !219, i32 50331712, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!310 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !219, i32 68, metadata !248, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!311 = metadata !{metadata !312}
!312 = metadata !{metadata !313}
!313 = metadata !{i32 786689, metadata !310, metadata !"ptr", metadata !219, i32 16777284, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!314 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !219, i32 72, metadata !315, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!315 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !316, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!316 = metadata !{metadata !222, metadata !266, metadata !235}
!317 = metadata !{metadata !318}
!318 = metadata !{metadata !319, metadata !320}
!319 = metadata !{i32 786689, metadata !314, metadata !"devPtr", metadata !219, i32 16777288, metadata !266, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!320 = metadata !{i32 786689, metadata !314, metadata !"size", metadata !219, i32 33554504, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!321 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !219, i32 80, metadata !322, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!322 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !323, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!323 = metadata !{metadata !222, metadata !324, metadata !232}
!324 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !325} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!325 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !135, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !326, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!326 = metadata !{metadata !327, metadata !328, metadata !329, metadata !330}
!327 = metadata !{i32 786445, metadata !325, metadata !"ptr", metadata !135, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !81} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!328 = metadata !{i32 786445, metadata !325, metadata !"pitch", metadata !135, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !235} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!329 = metadata !{i32 786445, metadata !325, metadata !"xsize", metadata !135, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !235} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!330 = metadata !{i32 786445, metadata !325, metadata !"ysize", metadata !135, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !235} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!331 = metadata !{metadata !332}
!332 = metadata !{metadata !333, metadata !334}
!333 = metadata !{i32 786689, metadata !321, metadata !"pitchedDevPtr", metadata !219, i32 16777296, metadata !324, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!334 = metadata !{i32 786689, metadata !321, metadata !"extent", metadata !219, i32 33554512, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!335 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !219, i32 84, metadata !336, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!336 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !337, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!337 = metadata !{metadata !222, metadata !338, metadata !223, metadata !232, metadata !32}
!338 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!339 = metadata !{metadata !340}
!340 = metadata !{metadata !341, metadata !342, metadata !343, metadata !344}
!341 = metadata !{i32 786689, metadata !335, metadata !"array", metadata !219, i32 16777300, metadata !338, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!342 = metadata !{i32 786689, metadata !335, metadata !"desc", metadata !219, i32 33554516, metadata !223, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!343 = metadata !{i32 786689, metadata !335, metadata !"extent", metadata !219, i32 50331733, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!344 = metadata !{i32 786689, metadata !335, metadata !"flags", metadata !219, i32 67108949, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!345 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !219, i32 89, metadata !346, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!346 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !347, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!347 = metadata !{metadata !222, metadata !338, metadata !223, metadata !235, metadata !235, metadata !32}
!348 = metadata !{metadata !349}
!349 = metadata !{metadata !350, metadata !351, metadata !352, metadata !353, metadata !354}
!350 = metadata !{i32 786689, metadata !345, metadata !"array", metadata !219, i32 16777305, metadata !338, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!351 = metadata !{i32 786689, metadata !345, metadata !"desc", metadata !219, i32 33554521, metadata !223, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!352 = metadata !{i32 786689, metadata !345, metadata !"width", metadata !219, i32 50331738, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!353 = metadata !{i32 786689, metadata !345, metadata !"height", metadata !219, i32 67108954, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!354 = metadata !{i32 786689, metadata !345, metadata !"flags", metadata !219, i32 83886170, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!355 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !219, i32 94, metadata !315, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!356 = metadata !{metadata !357}
!357 = metadata !{metadata !358, metadata !359}
!358 = metadata !{i32 786689, metadata !355, metadata !"ptr", metadata !219, i32 16777310, metadata !266, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!359 = metadata !{i32 786689, metadata !355, metadata !"size", metadata !219, i32 33554526, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!360 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !219, i32 102, metadata !361, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!361 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !362, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!362 = metadata !{metadata !222, metadata !266, metadata !274, metadata !235, metadata !235}
!363 = metadata !{metadata !364}
!364 = metadata !{metadata !365, metadata !366, metadata !367, metadata !368}
!365 = metadata !{i32 786689, metadata !360, metadata !"devPtr", metadata !219, i32 16777318, metadata !266, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!366 = metadata !{i32 786689, metadata !360, metadata !"pitch", metadata !219, i32 33554534, metadata !274, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!367 = metadata !{i32 786689, metadata !360, metadata !"width", metadata !219, i32 50331750, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!368 = metadata !{i32 786689, metadata !360, metadata !"height", metadata !219, i32 67108966, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!369 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !219, i32 106, metadata !370, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!370 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !371, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!371 = metadata !{metadata !222, metadata !81, metadata !82, metadata !235, metadata !215}
!372 = metadata !{metadata !373}
!373 = metadata !{metadata !374, metadata !375, metadata !376, metadata !377}
!374 = metadata !{i32 786689, metadata !369, metadata !"dst", metadata !219, i32 16777322, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!375 = metadata !{i32 786689, metadata !369, metadata !"src", metadata !219, i32 33554538, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!376 = metadata !{i32 786689, metadata !369, metadata !"count", metadata !219, i32 50331754, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!377 = metadata !{i32 786689, metadata !369, metadata !"kind", metadata !219, i32 67108970, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!378 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !219, i32 111, metadata !379, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!379 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !380, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!380 = metadata !{metadata !222, metadata !81, metadata !235, metadata !82, metadata !235, metadata !235, metadata !235, metadata !215}
!381 = metadata !{metadata !382}
!382 = metadata !{metadata !383, metadata !384, metadata !385, metadata !386, metadata !387, metadata !388, metadata !389}
!383 = metadata !{i32 786689, metadata !378, metadata !"dst", metadata !219, i32 16777327, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!384 = metadata !{i32 786689, metadata !378, metadata !"dpitch", metadata !219, i32 33554543, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!385 = metadata !{i32 786689, metadata !378, metadata !"src", metadata !219, i32 50331759, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!386 = metadata !{i32 786689, metadata !378, metadata !"spitch", metadata !219, i32 67108975, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!387 = metadata !{i32 786689, metadata !378, metadata !"width", metadata !219, i32 83886192, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!388 = metadata !{i32 786689, metadata !378, metadata !"height", metadata !219, i32 100663408, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!389 = metadata !{i32 786689, metadata !378, metadata !"kind", metadata !219, i32 117440624, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!390 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !219, i32 116, metadata !391, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!391 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !392, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!392 = metadata !{metadata !222, metadata !239, metadata !235, metadata !235, metadata !239, metadata !235, metadata !235, metadata !235, metadata !235, metadata !215}
!393 = metadata !{metadata !394}
!394 = metadata !{metadata !395, metadata !396, metadata !397, metadata !398, metadata !399, metadata !400, metadata !401, metadata !402, metadata !403}
!395 = metadata !{i32 786689, metadata !390, metadata !"dst", metadata !219, i32 16777332, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!396 = metadata !{i32 786689, metadata !390, metadata !"wOffsetDst", metadata !219, i32 33554548, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!397 = metadata !{i32 786689, metadata !390, metadata !"hOffsetDst", metadata !219, i32 50331764, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!398 = metadata !{i32 786689, metadata !390, metadata !"src", metadata !219, i32 67108981, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!399 = metadata !{i32 786689, metadata !390, metadata !"wOffsetSrc", metadata !219, i32 83886197, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!400 = metadata !{i32 786689, metadata !390, metadata !"hOffsetSrc", metadata !219, i32 100663413, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!401 = metadata !{i32 786689, metadata !390, metadata !"width", metadata !219, i32 117440630, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!402 = metadata !{i32 786689, metadata !390, metadata !"height", metadata !219, i32 134217846, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!403 = metadata !{i32 786689, metadata !390, metadata !"kind", metadata !219, i32 150995062, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!404 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !219, i32 122, metadata !405, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!405 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !406, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!406 = metadata !{metadata !222, metadata !81, metadata !235, metadata !82, metadata !235, metadata !235, metadata !235, metadata !215, metadata !407}
!407 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !219, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !408} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!408 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !409} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!409 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !135, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!410 = metadata !{metadata !411}
!411 = metadata !{metadata !412, metadata !413, metadata !414, metadata !415, metadata !416, metadata !417, metadata !418, metadata !419}
!412 = metadata !{i32 786689, metadata !404, metadata !"dst", metadata !219, i32 16777338, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!413 = metadata !{i32 786689, metadata !404, metadata !"dpitch", metadata !219, i32 33554554, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!414 = metadata !{i32 786689, metadata !404, metadata !"src", metadata !219, i32 50331770, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!415 = metadata !{i32 786689, metadata !404, metadata !"spitch", metadata !219, i32 67108986, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!416 = metadata !{i32 786689, metadata !404, metadata !"width", metadata !219, i32 83886203, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!417 = metadata !{i32 786689, metadata !404, metadata !"height", metadata !219, i32 100663419, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!418 = metadata !{i32 786689, metadata !404, metadata !"kind", metadata !219, i32 117440635, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!419 = metadata !{i32 786689, metadata !404, metadata !"stream", metadata !219, i32 134217852, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!420 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !219, i32 128, metadata !421, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!421 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !422, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!422 = metadata !{metadata !222, metadata !81, metadata !235, metadata !239, metadata !235, metadata !235, metadata !235, metadata !235, metadata !215}
!423 = metadata !{metadata !424}
!424 = metadata !{metadata !425, metadata !426, metadata !427, metadata !428, metadata !429, metadata !430, metadata !431, metadata !432}
!425 = metadata !{i32 786689, metadata !420, metadata !"dst", metadata !219, i32 16777344, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!426 = metadata !{i32 786689, metadata !420, metadata !"dpitch", metadata !219, i32 33554560, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!427 = metadata !{i32 786689, metadata !420, metadata !"src", metadata !219, i32 50331776, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!428 = metadata !{i32 786689, metadata !420, metadata !"wOffset", metadata !219, i32 67108993, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!429 = metadata !{i32 786689, metadata !420, metadata !"hOffset", metadata !219, i32 83886209, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!430 = metadata !{i32 786689, metadata !420, metadata !"width", metadata !219, i32 100663425, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!431 = metadata !{i32 786689, metadata !420, metadata !"height", metadata !219, i32 117440641, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!432 = metadata !{i32 786689, metadata !420, metadata !"kind", metadata !219, i32 134217858, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!433 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !219, i32 134, metadata !434, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!434 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !435, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!435 = metadata !{metadata !222, metadata !81, metadata !235, metadata !239, metadata !235, metadata !235, metadata !235, metadata !235, metadata !215, metadata !407}
!436 = metadata !{metadata !437}
!437 = metadata !{metadata !438, metadata !439, metadata !440, metadata !441, metadata !442, metadata !443, metadata !444, metadata !445, metadata !446}
!438 = metadata !{i32 786689, metadata !433, metadata !"dst", metadata !219, i32 16777350, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!439 = metadata !{i32 786689, metadata !433, metadata !"dpitch", metadata !219, i32 33554566, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!440 = metadata !{i32 786689, metadata !433, metadata !"src", metadata !219, i32 50331782, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!441 = metadata !{i32 786689, metadata !433, metadata !"wOffset", metadata !219, i32 67108999, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!442 = metadata !{i32 786689, metadata !433, metadata !"hOffset", metadata !219, i32 83886215, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!443 = metadata !{i32 786689, metadata !433, metadata !"width", metadata !219, i32 100663431, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!444 = metadata !{i32 786689, metadata !433, metadata !"height", metadata !219, i32 117440647, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!445 = metadata !{i32 786689, metadata !433, metadata !"kind", metadata !219, i32 134217864, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!446 = metadata !{i32 786689, metadata !433, metadata !"stream", metadata !219, i32 150995080, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!447 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !219, i32 140, metadata !448, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!448 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !449, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!449 = metadata !{metadata !222, metadata !239, metadata !235, metadata !235, metadata !82, metadata !235, metadata !235, metadata !235, metadata !215}
!450 = metadata !{metadata !451}
!451 = metadata !{metadata !452, metadata !453, metadata !454, metadata !455, metadata !456, metadata !457, metadata !458, metadata !459}
!452 = metadata !{i32 786689, metadata !447, metadata !"dst", metadata !219, i32 16777356, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!453 = metadata !{i32 786689, metadata !447, metadata !"wOffset", metadata !219, i32 33554572, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!454 = metadata !{i32 786689, metadata !447, metadata !"hOffset", metadata !219, i32 50331788, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!455 = metadata !{i32 786689, metadata !447, metadata !"src", metadata !219, i32 67109005, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!456 = metadata !{i32 786689, metadata !447, metadata !"spitch", metadata !219, i32 83886221, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!457 = metadata !{i32 786689, metadata !447, metadata !"width", metadata !219, i32 100663437, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!458 = metadata !{i32 786689, metadata !447, metadata !"height", metadata !219, i32 117440653, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!459 = metadata !{i32 786689, metadata !447, metadata !"kind", metadata !219, i32 134217870, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!460 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !219, i32 146, metadata !461, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!461 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !462, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!462 = metadata !{metadata !222, metadata !239, metadata !235, metadata !235, metadata !82, metadata !235, metadata !235, metadata !235, metadata !215, metadata !407}
!463 = metadata !{metadata !464}
!464 = metadata !{metadata !465, metadata !466, metadata !467, metadata !468, metadata !469, metadata !470, metadata !471, metadata !472, metadata !473}
!465 = metadata !{i32 786689, metadata !460, metadata !"dst", metadata !219, i32 16777362, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!466 = metadata !{i32 786689, metadata !460, metadata !"wOffset", metadata !219, i32 33554578, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!467 = metadata !{i32 786689, metadata !460, metadata !"hOffset", metadata !219, i32 50331794, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!468 = metadata !{i32 786689, metadata !460, metadata !"src", metadata !219, i32 67109011, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!469 = metadata !{i32 786689, metadata !460, metadata !"spitch", metadata !219, i32 83886227, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!470 = metadata !{i32 786689, metadata !460, metadata !"width", metadata !219, i32 100663443, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!471 = metadata !{i32 786689, metadata !460, metadata !"height", metadata !219, i32 117440659, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!472 = metadata !{i32 786689, metadata !460, metadata !"kind", metadata !219, i32 134217876, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!473 = metadata !{i32 786689, metadata !460, metadata !"stream", metadata !219, i32 150995092, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!474 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !219, i32 152, metadata !475, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!475 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !476, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!476 = metadata !{metadata !222, metadata !477}
!477 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !478} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!478 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !479} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!479 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !135, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !480, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!480 = metadata !{metadata !481, metadata !483, metadata !489, metadata !490, metadata !491, metadata !492, metadata !493, metadata !494}
!481 = metadata !{i32 786445, metadata !479, metadata !"srcArray", metadata !135, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !482} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!482 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !135, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !239} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!483 = metadata !{i32 786445, metadata !479, metadata !"srcPos", metadata !135, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !484} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!484 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !135, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !485, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!485 = metadata !{metadata !486, metadata !487, metadata !488}
!486 = metadata !{i32 786445, metadata !484, metadata !"x", metadata !135, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !235} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!487 = metadata !{i32 786445, metadata !484, metadata !"y", metadata !135, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !235} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!488 = metadata !{i32 786445, metadata !484, metadata !"z", metadata !135, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !235} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!489 = metadata !{i32 786445, metadata !479, metadata !"srcPtr", metadata !135, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !325} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!490 = metadata !{i32 786445, metadata !479, metadata !"dstArray", metadata !135, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !482} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!491 = metadata !{i32 786445, metadata !479, metadata !"dstPos", metadata !135, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !484} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!492 = metadata !{i32 786445, metadata !479, metadata !"dstPtr", metadata !135, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !325} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!493 = metadata !{i32 786445, metadata !479, metadata !"extent", metadata !135, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !232} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!494 = metadata !{i32 786445, metadata !479, metadata !"kind", metadata !135, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !215} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!495 = metadata !{metadata !496}
!496 = metadata !{metadata !497}
!497 = metadata !{i32 786689, metadata !474, metadata !"p", metadata !219, i32 16777368, metadata !477, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!498 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !219, i32 156, metadata !499, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!499 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !500, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!500 = metadata !{metadata !222, metadata !477, metadata !407}
!501 = metadata !{metadata !502}
!502 = metadata !{metadata !503, metadata !504}
!503 = metadata !{i32 786689, metadata !498, metadata !"p", metadata !219, i32 16777372, metadata !477, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!504 = metadata !{i32 786689, metadata !498, metadata !"stream", metadata !219, i32 33554588, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!505 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !219, i32 160, metadata !506, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!506 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !507, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!507 = metadata !{metadata !222, metadata !508}
!508 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !509} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!509 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !510} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!510 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !135, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !511, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!511 = metadata !{metadata !512, metadata !513, metadata !514, metadata !515, metadata !516, metadata !517, metadata !518, metadata !519, metadata !520}
!512 = metadata !{i32 786445, metadata !510, metadata !"srcArray", metadata !135, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !482} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!513 = metadata !{i32 786445, metadata !510, metadata !"srcPos", metadata !135, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !484} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!514 = metadata !{i32 786445, metadata !510, metadata !"srcPtr", metadata !135, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !325} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!515 = metadata !{i32 786445, metadata !510, metadata !"srcDevice", metadata !135, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !20} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!516 = metadata !{i32 786445, metadata !510, metadata !"dstArray", metadata !135, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !482} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!517 = metadata !{i32 786445, metadata !510, metadata !"dstPos", metadata !135, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !484} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!518 = metadata !{i32 786445, metadata !510, metadata !"dstPtr", metadata !135, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !325} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!519 = metadata !{i32 786445, metadata !510, metadata !"dstDevice", metadata !135, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !20} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!520 = metadata !{i32 786445, metadata !510, metadata !"extent", metadata !135, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !232} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!521 = metadata !{metadata !522}
!522 = metadata !{metadata !523}
!523 = metadata !{i32 786689, metadata !505, metadata !"p", metadata !219, i32 16777376, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!524 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !219, i32 164, metadata !525, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!525 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !526, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!526 = metadata !{metadata !222, metadata !508, metadata !407}
!527 = metadata !{metadata !528}
!528 = metadata !{metadata !529, metadata !530}
!529 = metadata !{i32 786689, metadata !524, metadata !"p", metadata !219, i32 16777380, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!530 = metadata !{i32 786689, metadata !524, metadata !"stream", metadata !219, i32 33554596, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!531 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !219, i32 168, metadata !532, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!532 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !533, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!533 = metadata !{metadata !222, metadata !239, metadata !235, metadata !235, metadata !239, metadata !235, metadata !235, metadata !235, metadata !215}
!534 = metadata !{metadata !535}
!535 = metadata !{metadata !536, metadata !537, metadata !538, metadata !539, metadata !540, metadata !541, metadata !542, metadata !543}
!536 = metadata !{i32 786689, metadata !531, metadata !"dst", metadata !219, i32 16777384, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!537 = metadata !{i32 786689, metadata !531, metadata !"wOffsetDst", metadata !219, i32 33554600, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!538 = metadata !{i32 786689, metadata !531, metadata !"hOffsetDst", metadata !219, i32 50331816, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!539 = metadata !{i32 786689, metadata !531, metadata !"src", metadata !219, i32 67109033, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!540 = metadata !{i32 786689, metadata !531, metadata !"wOffsetSrc", metadata !219, i32 83886249, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!541 = metadata !{i32 786689, metadata !531, metadata !"hOffsetSrc", metadata !219, i32 100663465, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!542 = metadata !{i32 786689, metadata !531, metadata !"count", metadata !219, i32 117440682, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!543 = metadata !{i32 786689, metadata !531, metadata !"kind", metadata !219, i32 134217898, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!544 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !219, i32 174, metadata !545, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!545 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !546, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!546 = metadata !{metadata !222, metadata !81, metadata !82, metadata !235, metadata !215, metadata !407}
!547 = metadata !{metadata !548}
!548 = metadata !{metadata !549, metadata !550, metadata !551, metadata !552, metadata !553}
!549 = metadata !{i32 786689, metadata !544, metadata !"dst", metadata !219, i32 16777390, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!550 = metadata !{i32 786689, metadata !544, metadata !"src", metadata !219, i32 33554606, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!551 = metadata !{i32 786689, metadata !544, metadata !"count", metadata !219, i32 50331822, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!552 = metadata !{i32 786689, metadata !544, metadata !"kind", metadata !219, i32 67109039, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!553 = metadata !{i32 786689, metadata !544, metadata !"stream", metadata !219, i32 83886255, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!554 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !219, i32 179, metadata !555, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!555 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !556, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!556 = metadata !{metadata !222, metadata !81, metadata !239, metadata !235, metadata !235, metadata !235, metadata !215}
!557 = metadata !{metadata !558}
!558 = metadata !{metadata !559, metadata !560, metadata !561, metadata !562, metadata !563, metadata !564}
!559 = metadata !{i32 786689, metadata !554, metadata !"dst", metadata !219, i32 16777395, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!560 = metadata !{i32 786689, metadata !554, metadata !"src", metadata !219, i32 33554611, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!561 = metadata !{i32 786689, metadata !554, metadata !"wOffset", metadata !219, i32 50331827, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!562 = metadata !{i32 786689, metadata !554, metadata !"hOffset", metadata !219, i32 67109044, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!563 = metadata !{i32 786689, metadata !554, metadata !"count", metadata !219, i32 83886260, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!564 = metadata !{i32 786689, metadata !554, metadata !"kind", metadata !219, i32 100663476, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!565 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !219, i32 184, metadata !566, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!566 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !567, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!567 = metadata !{metadata !222, metadata !81, metadata !239, metadata !235, metadata !235, metadata !235, metadata !215, metadata !407}
!568 = metadata !{metadata !569}
!569 = metadata !{metadata !570, metadata !571, metadata !572, metadata !573, metadata !574, metadata !575, metadata !576}
!570 = metadata !{i32 786689, metadata !565, metadata !"dst", metadata !219, i32 16777400, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!571 = metadata !{i32 786689, metadata !565, metadata !"src", metadata !219, i32 33554616, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!572 = metadata !{i32 786689, metadata !565, metadata !"wOffset", metadata !219, i32 50331832, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!573 = metadata !{i32 786689, metadata !565, metadata !"hOffset", metadata !219, i32 67109049, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!574 = metadata !{i32 786689, metadata !565, metadata !"count", metadata !219, i32 83886265, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!575 = metadata !{i32 786689, metadata !565, metadata !"kind", metadata !219, i32 100663481, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!576 = metadata !{i32 786689, metadata !565, metadata !"stream", metadata !219, i32 117440698, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!577 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !219, i32 190, metadata !578, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!578 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !579, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!579 = metadata !{metadata !222, metadata !81, metadata !96, metadata !235, metadata !235, metadata !215}
!580 = metadata !{metadata !581}
!581 = metadata !{metadata !582, metadata !583, metadata !584, metadata !585, metadata !586}
!582 = metadata !{i32 786689, metadata !577, metadata !"dst", metadata !219, i32 16777406, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!583 = metadata !{i32 786689, metadata !577, metadata !"symbol", metadata !219, i32 33554622, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!584 = metadata !{i32 786689, metadata !577, metadata !"count", metadata !219, i32 50331838, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!585 = metadata !{i32 786689, metadata !577, metadata !"offset", metadata !219, i32 67109055, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!586 = metadata !{i32 786689, metadata !577, metadata !"kind", metadata !219, i32 83886271, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!587 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !219, i32 195, metadata !588, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!588 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !589, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!589 = metadata !{metadata !222, metadata !81, metadata !96, metadata !235, metadata !235, metadata !215, metadata !407}
!590 = metadata !{metadata !591}
!591 = metadata !{metadata !592, metadata !593, metadata !594, metadata !595, metadata !596, metadata !597}
!592 = metadata !{i32 786689, metadata !587, metadata !"dst", metadata !219, i32 16777411, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!593 = metadata !{i32 786689, metadata !587, metadata !"symbol", metadata !219, i32 33554627, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!594 = metadata !{i32 786689, metadata !587, metadata !"count", metadata !219, i32 50331843, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!595 = metadata !{i32 786689, metadata !587, metadata !"offset", metadata !219, i32 67109060, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!596 = metadata !{i32 786689, metadata !587, metadata !"kind", metadata !219, i32 83886276, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!597 = metadata !{i32 786689, metadata !587, metadata !"stream", metadata !219, i32 100663493, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!598 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !219, i32 201, metadata !599, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!599 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !600, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!600 = metadata !{metadata !222, metadata !81, metadata !20, metadata !82, metadata !20, metadata !235}
!601 = metadata !{metadata !602}
!602 = metadata !{metadata !603, metadata !604, metadata !605, metadata !606, metadata !607}
!603 = metadata !{i32 786689, metadata !598, metadata !"dst", metadata !219, i32 16777417, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!604 = metadata !{i32 786689, metadata !598, metadata !"dstDevice", metadata !219, i32 33554633, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!605 = metadata !{i32 786689, metadata !598, metadata !"src", metadata !219, i32 50331849, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!606 = metadata !{i32 786689, metadata !598, metadata !"srcDevice", metadata !219, i32 67109065, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!607 = metadata !{i32 786689, metadata !598, metadata !"count", metadata !219, i32 83886281, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!608 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !219, i32 206, metadata !609, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!609 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !610, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!610 = metadata !{metadata !222, metadata !81, metadata !20, metadata !82, metadata !20, metadata !235, metadata !407}
!611 = metadata !{metadata !612}
!612 = metadata !{metadata !613, metadata !614, metadata !615, metadata !616, metadata !617, metadata !618}
!613 = metadata !{i32 786689, metadata !608, metadata !"dst", metadata !219, i32 16777422, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!614 = metadata !{i32 786689, metadata !608, metadata !"dstDevice", metadata !219, i32 33554638, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!615 = metadata !{i32 786689, metadata !608, metadata !"src", metadata !219, i32 50331854, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!616 = metadata !{i32 786689, metadata !608, metadata !"srcDevice", metadata !219, i32 67109070, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!617 = metadata !{i32 786689, metadata !608, metadata !"count", metadata !219, i32 83886287, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!618 = metadata !{i32 786689, metadata !608, metadata !"stream", metadata !219, i32 100663503, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!619 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !219, i32 212, metadata !620, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!620 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !621, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!621 = metadata !{metadata !222, metadata !239, metadata !235, metadata !235, metadata !82, metadata !235, metadata !215}
!622 = metadata !{metadata !623}
!623 = metadata !{metadata !624, metadata !625, metadata !626, metadata !627, metadata !628, metadata !629}
!624 = metadata !{i32 786689, metadata !619, metadata !"dst", metadata !219, i32 16777428, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!625 = metadata !{i32 786689, metadata !619, metadata !"wOffset", metadata !219, i32 33554644, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!626 = metadata !{i32 786689, metadata !619, metadata !"hOffset", metadata !219, i32 50331860, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!627 = metadata !{i32 786689, metadata !619, metadata !"src", metadata !219, i32 67109077, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!628 = metadata !{i32 786689, metadata !619, metadata !"count", metadata !219, i32 83886293, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!629 = metadata !{i32 786689, metadata !619, metadata !"kind", metadata !219, i32 100663509, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!630 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !219, i32 217, metadata !631, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!631 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !632, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!632 = metadata !{metadata !222, metadata !239, metadata !235, metadata !235, metadata !82, metadata !235, metadata !215, metadata !407}
!633 = metadata !{metadata !634}
!634 = metadata !{metadata !635, metadata !636, metadata !637, metadata !638, metadata !639, metadata !640, metadata !641}
!635 = metadata !{i32 786689, metadata !630, metadata !"dst", metadata !219, i32 16777433, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!636 = metadata !{i32 786689, metadata !630, metadata !"wOffset", metadata !219, i32 33554649, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!637 = metadata !{i32 786689, metadata !630, metadata !"hOffset", metadata !219, i32 50331865, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!638 = metadata !{i32 786689, metadata !630, metadata !"src", metadata !219, i32 67109082, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!639 = metadata !{i32 786689, metadata !630, metadata !"count", metadata !219, i32 83886298, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!640 = metadata !{i32 786689, metadata !630, metadata !"kind", metadata !219, i32 100663514, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!641 = metadata !{i32 786689, metadata !630, metadata !"stream", metadata !219, i32 117440731, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!642 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !219, i32 223, metadata !643, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!643 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !644, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!644 = metadata !{metadata !222, metadata !93, metadata !82, metadata !235, metadata !235, metadata !215}
!645 = metadata !{metadata !646}
!646 = metadata !{metadata !647, metadata !648, metadata !649, metadata !650, metadata !651}
!647 = metadata !{i32 786689, metadata !642, metadata !"symbol", metadata !219, i32 16777439, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!648 = metadata !{i32 786689, metadata !642, metadata !"src", metadata !219, i32 33554655, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!649 = metadata !{i32 786689, metadata !642, metadata !"count", metadata !219, i32 50331871, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!650 = metadata !{i32 786689, metadata !642, metadata !"offset", metadata !219, i32 67109088, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!651 = metadata !{i32 786689, metadata !642, metadata !"kind", metadata !219, i32 83886304, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!652 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !219, i32 229, metadata !653, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!653 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !654, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!654 = metadata !{metadata !222, metadata !96, metadata !82, metadata !235, metadata !235, metadata !215, metadata !407}
!655 = metadata !{metadata !656}
!656 = metadata !{metadata !657, metadata !658, metadata !659, metadata !660, metadata !661, metadata !662}
!657 = metadata !{i32 786689, metadata !652, metadata !"symbol", metadata !219, i32 16777445, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!658 = metadata !{i32 786689, metadata !652, metadata !"src", metadata !219, i32 33554661, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!659 = metadata !{i32 786689, metadata !652, metadata !"count", metadata !219, i32 50331877, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!660 = metadata !{i32 786689, metadata !652, metadata !"offset", metadata !219, i32 67109093, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!661 = metadata !{i32 786689, metadata !652, metadata !"kind", metadata !219, i32 83886310, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!662 = metadata !{i32 786689, metadata !652, metadata !"stream", metadata !219, i32 100663526, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!663 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !219, i32 234, metadata !664, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!664 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !665, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!665 = metadata !{metadata !222, metadata !274, metadata !274}
!666 = metadata !{metadata !667}
!667 = metadata !{metadata !668, metadata !669}
!668 = metadata !{i32 786689, metadata !663, metadata !"free", metadata !219, i32 16777450, metadata !274, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!669 = metadata !{i32 786689, metadata !663, metadata !"total", metadata !219, i32 33554666, metadata !274, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!670 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !219, i32 238, metadata !671, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!671 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !672, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!672 = metadata !{metadata !222, metadata !81, metadata !20, metadata !235}
!673 = metadata !{metadata !674}
!674 = metadata !{metadata !675, metadata !676, metadata !677}
!675 = metadata !{i32 786689, metadata !670, metadata !"devPtr", metadata !219, i32 16777454, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!676 = metadata !{i32 786689, metadata !670, metadata !"value", metadata !219, i32 33554670, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!677 = metadata !{i32 786689, metadata !670, metadata !"count", metadata !219, i32 50331886, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!678 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !219, i32 243, metadata !679, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!679 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !680, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!680 = metadata !{metadata !222, metadata !81, metadata !235, metadata !20, metadata !235, metadata !235}
!681 = metadata !{metadata !682}
!682 = metadata !{metadata !683, metadata !684, metadata !685, metadata !686, metadata !687}
!683 = metadata !{i32 786689, metadata !678, metadata !"devPtr", metadata !219, i32 16777459, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!684 = metadata !{i32 786689, metadata !678, metadata !"pitch", metadata !219, i32 33554675, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!685 = metadata !{i32 786689, metadata !678, metadata !"value", metadata !219, i32 50331891, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!686 = metadata !{i32 786689, metadata !678, metadata !"width", metadata !219, i32 67109108, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!687 = metadata !{i32 786689, metadata !678, metadata !"height", metadata !219, i32 83886324, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!688 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !219, i32 248, metadata !689, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!689 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !690, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!690 = metadata !{metadata !222, metadata !81, metadata !235, metadata !20, metadata !235, metadata !235, metadata !407}
!691 = metadata !{metadata !692}
!692 = metadata !{metadata !693, metadata !694, metadata !695, metadata !696, metadata !697, metadata !698}
!693 = metadata !{i32 786689, metadata !688, metadata !"devPtr", metadata !219, i32 16777464, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!694 = metadata !{i32 786689, metadata !688, metadata !"pitch", metadata !219, i32 33554680, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!695 = metadata !{i32 786689, metadata !688, metadata !"value", metadata !219, i32 50331896, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!696 = metadata !{i32 786689, metadata !688, metadata !"width", metadata !219, i32 67109113, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!697 = metadata !{i32 786689, metadata !688, metadata !"height", metadata !219, i32 83886329, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!698 = metadata !{i32 786689, metadata !688, metadata !"stream", metadata !219, i32 100663545, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!699 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !219, i32 253, metadata !700, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!700 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !701, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!701 = metadata !{metadata !222, metadata !325, metadata !20, metadata !232}
!702 = metadata !{metadata !703}
!703 = metadata !{metadata !704, metadata !705, metadata !706}
!704 = metadata !{i32 786689, metadata !699, metadata !"pitchedDevPtr", metadata !219, i32 16777469, metadata !325, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!705 = metadata !{i32 786689, metadata !699, metadata !"value", metadata !219, i32 33554685, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!706 = metadata !{i32 786689, metadata !699, metadata !"extent", metadata !219, i32 50331902, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!707 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !219, i32 258, metadata !708, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!708 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !709, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!709 = metadata !{metadata !222, metadata !325, metadata !20, metadata !232, metadata !407}
!710 = metadata !{metadata !711}
!711 = metadata !{metadata !712, metadata !713, metadata !714, metadata !715}
!712 = metadata !{i32 786689, metadata !707, metadata !"pitchedDevPtr", metadata !219, i32 16777474, metadata !325, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!713 = metadata !{i32 786689, metadata !707, metadata !"value", metadata !219, i32 33554690, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!714 = metadata !{i32 786689, metadata !707, metadata !"extent", metadata !219, i32 50331907, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!715 = metadata !{i32 786689, metadata !707, metadata !"stream", metadata !219, i32 67109123, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!716 = metadata !{i32 786478, i32 0, metadata !219, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !219, i32 263, metadata !717, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!717 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !718, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!718 = metadata !{metadata !222, metadata !81, metadata !20, metadata !235, metadata !407}
!719 = metadata !{metadata !720}
!720 = metadata !{metadata !721, metadata !722, metadata !723, metadata !724}
!721 = metadata !{i32 786689, metadata !716, metadata !"devPtr", metadata !219, i32 16777479, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!722 = metadata !{i32 786689, metadata !716, metadata !"value", metadata !219, i32 33554695, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!723 = metadata !{i32 786689, metadata !716, metadata !"count", metadata !219, i32 50331911, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!724 = metadata !{i32 786689, metadata !716, metadata !"stream", metadata !219, i32 67109127, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!725 = metadata !{i32 13, i32 0, metadata !726, null}
!726 = metadata !{i32 786443, metadata !15, i32 9, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces/main.cpp]
!727 = metadata !{i32 15, i32 0, metadata !726, null}
!728 = metadata !{i32 17, i32 0, metadata !726, null}
!729 = metadata !{i32 24, i32 0, metadata !730, null}
!730 = metadata !{i32 786443, metadata !21, i32 19, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces/main.cpp]
!731 = metadata !{i32 26, i32 0, metadata !732, null}
!732 = metadata !{i32 786443, metadata !730, i32 26, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces/main.cpp]
!733 = metadata !{i32 27, i32 0, metadata !734, null}
!734 = metadata !{i32 786443, metadata !732, i32 26, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces/main.cpp]
!735 = metadata !{i32 28, i32 0, metadata !734, null}
!736 = metadata !{i32 30, i32 0, metadata !730, null}
!737 = metadata !{i32 32, i32 0, metadata !730, null}
!738 = metadata !{i32 34, i32 0, metadata !730, null}
!739 = metadata !{i32 35, i32 0, metadata !740, null}
!740 = metadata !{i32 786443, metadata !730, i32 35, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces/main.cpp]
!741 = metadata !{i32 37, i32 0, metadata !740, null}
!742 = metadata !{i32 41, i32 0, metadata !730, null}
!743 = metadata !{i32 43, i32 0, metadata !744, null}
!744 = metadata !{i32 786443, metadata !730, i32 43, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces/main.cpp]
!745 = metadata !{i32 44, i32 0, metadata !746, null}
!746 = metadata !{i32 786443, metadata !744, i32 43, i32 0, metadata !16, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces/main.cpp]
!747 = metadata !{i32 45, i32 0, metadata !746, null}
!748 = metadata !{i32 48, i32 0, metadata !730, null}
!749 = metadata !{i32 49, i32 0, metadata !730, null}
!750 = metadata !{i32 51, i32 0, metadata !730, null}
!751 = metadata !{i32 419, i32 0, metadata !24, null}
!752 = metadata !{i32 419, i32 0, metadata !67, null}
!753 = metadata !{i32 419, i32 0, metadata !754, null}
!754 = metadata !{i32 786443, metadata !67, i32 419, i32 0, metadata !25, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/041_test_copy_between_memory_spaces//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cud
!755 = metadata !{i32 16, i32 0, metadata !92, null}
!756 = metadata !{i32 17, i32 0, metadata !92, null}
!757 = metadata !{metadata !"omnipotent char", metadata !758}
!758 = metadata !{metadata !"Simple C/C++ TBAA"}
!759 = metadata !{i32 18, i32 0, metadata !92, null}
!760 = metadata !{i32 14, i32 0, metadata !128, null}
!761 = metadata !{i32 15, i32 0, metadata !128, null}
!762 = metadata !{i32 16, i32 0, metadata !128, null}
!763 = metadata !{i32 26, i32 0, metadata !764, null}
!764 = metadata !{i32 786443, metadata !218, i32 25, i32 0, metadata !219, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!765 = metadata !{i32 30, i32 0, metadata !766, null}
!766 = metadata !{i32 786443, metadata !247, i32 29, i32 0, metadata !219, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!767 = metadata !{i32 31, i32 0, metadata !766, null}
!768 = metadata !{i32 35, i32 0, metadata !769, null}
!769 = metadata !{i32 786443, metadata !253, i32 34, i32 0, metadata !219, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!770 = metadata !{i32 36, i32 0, metadata !769, null}
!771 = metadata !{i32 40, i32 0, metadata !772, null}
!772 = metadata !{i32 786443, metadata !259, i32 39, i32 0, metadata !219, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!773 = metadata !{i32 41, i32 0, metadata !772, null}
!774 = metadata !{i32 45, i32 0, metadata !775, null}
!775 = metadata !{i32 786443, metadata !263, i32 44, i32 0, metadata !219, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!776 = metadata !{i32 49, i32 0, metadata !777, null}
!777 = metadata !{i32 786443, metadata !271, i32 48, i32 0, metadata !219, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!778 = metadata !{i32 53, i32 0, metadata !779, null}
!779 = metadata !{i32 786443, metadata !279, i32 52, i32 0, metadata !219, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!780 = metadata !{i32 57, i32 0, metadata !781, null}
!781 = metadata !{i32 786443, metadata !287, i32 56, i32 0, metadata !219, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!782 = metadata !{i32 61, i32 0, metadata !783, null}
!783 = metadata !{i32 786443, metadata !295, i32 60, i32 0, metadata !219, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!784 = metadata !{i32 65, i32 0, metadata !785, null}
!785 = metadata !{i32 786443, metadata !302, i32 64, i32 0, metadata !219, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!786 = metadata !{i32 69, i32 0, metadata !787, null}
!787 = metadata !{i32 786443, metadata !310, i32 68, i32 0, metadata !219, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!788 = metadata !{i32 73, i32 0, metadata !789, null}
!789 = metadata !{i32 786443, metadata !314, i32 72, i32 0, metadata !219, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!790 = metadata !{i32 74, i32 0, metadata !789, null}
!791 = metadata !{metadata !"any pointer", metadata !757}
!792 = metadata !{i32 75, i32 0, metadata !789, null}
!793 = metadata !{i32 77, i32 0, metadata !789, null}
!794 = metadata !{i32 81, i32 0, metadata !795, null}
!795 = metadata !{i32 786443, metadata !321, i32 80, i32 0, metadata !219, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!796 = metadata !{i32 86, i32 0, metadata !797, null}
!797 = metadata !{i32 786443, metadata !335, i32 85, i32 0, metadata !219, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!798 = metadata !{i32 91, i32 0, metadata !799, null}
!799 = metadata !{i32 786443, metadata !345, i32 90, i32 0, metadata !219, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!800 = metadata !{i32 95, i32 0, metadata !801, null}
!801 = metadata !{i32 786443, metadata !355, i32 94, i32 0, metadata !219, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!802 = metadata !{i32 96, i32 0, metadata !801, null}
!803 = metadata !{i32 97, i32 0, metadata !801, null}
!804 = metadata !{i32 99, i32 0, metadata !801, null}
!805 = metadata !{i32 103, i32 0, metadata !806, null}
!806 = metadata !{i32 786443, metadata !360, i32 102, i32 0, metadata !219, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!807 = metadata !{i32 108, i32 0, metadata !808, null}
!808 = metadata !{i32 786443, metadata !369, i32 106, i32 0, metadata !219, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!809 = metadata !{i32 113, i32 0, metadata !810, null}
!810 = metadata !{i32 786443, metadata !378, i32 112, i32 0, metadata !219, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!811 = metadata !{i32 119, i32 0, metadata !812, null}
!812 = metadata !{i32 786443, metadata !390, i32 118, i32 0, metadata !219, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!813 = metadata !{i32 125, i32 0, metadata !814, null}
!814 = metadata !{i32 786443, metadata !404, i32 124, i32 0, metadata !219, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!815 = metadata !{i32 131, i32 0, metadata !816, null}
!816 = metadata !{i32 786443, metadata !420, i32 130, i32 0, metadata !219, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!817 = metadata !{i32 137, i32 0, metadata !818, null}
!818 = metadata !{i32 786443, metadata !433, i32 136, i32 0, metadata !219, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!819 = metadata !{i32 143, i32 0, metadata !820, null}
!820 = metadata !{i32 786443, metadata !447, i32 142, i32 0, metadata !219, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!821 = metadata !{i32 149, i32 0, metadata !822, null}
!822 = metadata !{i32 786443, metadata !460, i32 148, i32 0, metadata !219, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!823 = metadata !{i32 153, i32 0, metadata !824, null}
!824 = metadata !{i32 786443, metadata !474, i32 152, i32 0, metadata !219, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!825 = metadata !{i32 157, i32 0, metadata !826, null}
!826 = metadata !{i32 786443, metadata !498, i32 156, i32 0, metadata !219, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!827 = metadata !{i32 161, i32 0, metadata !828, null}
!828 = metadata !{i32 786443, metadata !505, i32 160, i32 0, metadata !219, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!829 = metadata !{i32 165, i32 0, metadata !830, null}
!830 = metadata !{i32 786443, metadata !524, i32 164, i32 0, metadata !219, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!831 = metadata !{i32 171, i32 0, metadata !832, null}
!832 = metadata !{i32 786443, metadata !531, i32 170, i32 0, metadata !219, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!833 = metadata !{i32 176, i32 0, metadata !834, null}
!834 = metadata !{i32 786443, metadata !544, i32 175, i32 0, metadata !219, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!835 = metadata !{i32 181, i32 0, metadata !836, null}
!836 = metadata !{i32 786443, metadata !554, i32 180, i32 0, metadata !219, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!837 = metadata !{i32 187, i32 0, metadata !838, null}
!838 = metadata !{i32 786443, metadata !565, i32 186, i32 0, metadata !219, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!839 = metadata !{i32 192, i32 0, metadata !840, null}
!840 = metadata !{i32 786443, metadata !577, i32 191, i32 0, metadata !219, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!841 = metadata !{i32 198, i32 0, metadata !842, null}
!842 = metadata !{i32 786443, metadata !587, i32 197, i32 0, metadata !219, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!843 = metadata !{i32 203, i32 0, metadata !844, null}
!844 = metadata !{i32 786443, metadata !598, i32 201, i32 0, metadata !219, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!845 = metadata !{i32 209, i32 0, metadata !846, null}
!846 = metadata !{i32 786443, metadata !608, i32 207, i32 0, metadata !219, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!847 = metadata !{i32 214, i32 0, metadata !848, null}
!848 = metadata !{i32 786443, metadata !619, i32 213, i32 0, metadata !219, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!849 = metadata !{i32 220, i32 0, metadata !850, null}
!850 = metadata !{i32 786443, metadata !630, i32 219, i32 0, metadata !219, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!851 = metadata !{i32 225, i32 0, metadata !852, null}
!852 = metadata !{i32 786443, metadata !642, i32 224, i32 0, metadata !219, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!853 = metadata !{i32 226, i32 0, metadata !852, null}
!854 = metadata !{i32 231, i32 0, metadata !855, null}
!855 = metadata !{i32 786443, metadata !652, i32 230, i32 0, metadata !219, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!856 = metadata !{i32 235, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !663, i32 234, i32 0, metadata !219, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!858 = metadata !{i32 239, i32 0, metadata !859, null}
!859 = metadata !{i32 786443, metadata !670, i32 238, i32 0, metadata !219, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!860 = metadata !{i32 240, i32 0, metadata !859, null}
!861 = metadata !{i32 245, i32 0, metadata !862, null}
!862 = metadata !{i32 786443, metadata !678, i32 244, i32 0, metadata !219, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!863 = metadata !{i32 250, i32 0, metadata !864, null}
!864 = metadata !{i32 786443, metadata !688, i32 249, i32 0, metadata !219, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!865 = metadata !{i32 255, i32 0, metadata !866, null}
!866 = metadata !{i32 786443, metadata !699, i32 254, i32 0, metadata !219, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!867 = metadata !{i32 260, i32 0, metadata !868, null}
!868 = metadata !{i32 786443, metadata !707, i32 259, i32 0, metadata !219, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!869 = metadata !{i32 264, i32 0, metadata !870, null}
!870 = metadata !{i32 786443, metadata !716, i32 263, i32 0, metadata !219, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
