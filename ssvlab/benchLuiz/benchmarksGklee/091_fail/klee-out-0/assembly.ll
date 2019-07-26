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

@blockDim = external global %struct.dim3
@blockIdx = external global %struct.dim3
@threadIdx = external global %struct.dim3
@_ZZ4mainE1a = internal constant [16 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"c[i+1]!=c[i]+4\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define i32 @_Z5indexiii(i32 %col, i32 %row, i32 %ord) nounwind uwtable section "__device__" {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %col, i32* %1, align 4
  store i32 %row, i32* %2, align 4
  store i32 %ord, i32* %3, align 4
  %4 = load i32* %2, align 4, !dbg !731
  %5 = load i32* %3, align 4, !dbg !731
  %6 = mul nsw i32 %4, %5, !dbg !731
  %7 = load i32* %1, align 4, !dbg !731
  %8 = add nsw i32 %6, %7, !dbg !731
  ret i32 %8, !dbg !731
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @_Z9TransposePiPKi(i32* %c, i32* %a) nounwind uwtable noinline {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %col = alloca i32, align 4
  %row = alloca i32, align 4
  store i32* %c, i32** %1, align 8
  store i32* %a, i32** %2, align 8
  %3 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 0), align 4, !dbg !733
  %4 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i32 0, i32 0), align 4, !dbg !733
  %5 = mul i32 %3, %4, !dbg !733
  %6 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !733
  %7 = add i32 %5, %6, !dbg !733
  store i32 %7, i32* %col, align 4, !dbg !733
  %8 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 1), align 4, !dbg !735
  %9 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i32 0, i32 1), align 4, !dbg !735
  %10 = mul i32 %8, %9, !dbg !735
  %11 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 1), align 4, !dbg !735
  %12 = add i32 %10, %11, !dbg !735
  store i32 %12, i32* %row, align 4, !dbg !735
  %13 = load i32* %col, align 4, !dbg !736
  %14 = load i32* %row, align 4, !dbg !736
  %15 = call i32 @_Z5indexiii(i32 %13, i32 %14, i32 4), !dbg !736
  %16 = sext i32 %15 to i64, !dbg !736
  %17 = load i32** %2, align 8, !dbg !736
  %18 = getelementptr inbounds i32* %17, i64 %16, !dbg !736
  %19 = load i32* %18, align 4, !dbg !736
  %20 = load i32* %row, align 4, !dbg !736
  %21 = load i32* %col, align 4, !dbg !736
  %22 = call i32 @_Z5indexiii(i32 %20, i32 %21, i32 4), !dbg !736
  %23 = sext i32 %22 to i64, !dbg !736
  %24 = load i32** %1, align 8, !dbg !736
  %25 = getelementptr inbounds i32* %24, i64 %23, !dbg !736
  store i32 %19, i32* %25, align 4, !dbg !736
  ret void, !dbg !737
}

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %arraySize = alloca i32, align 4
  %c = alloca [16 x i32], align 16
  %dev_a = alloca i32*, align 8
  %dev_c = alloca i32*, align 8
  %dimgrid = alloca %struct.dim3, align 4
  %dimblock = alloca %struct.dim3, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 16, i32* %arraySize, align 4, !dbg !738
  %6 = bitcast [16 x i32]* %c to i8*, !dbg !740
  %7 = call i8* @memset(i8* %6, i32 0, i64 64)
  store i32* null, i32** %dev_a, align 8, !dbg !741
  store i32* null, i32** %dev_c, align 8, !dbg !742
  %8 = bitcast i32** %dev_c to i8**, !dbg !743
  %9 = call i32 @cudaMalloc(i8** %8, i64 64), !dbg !743
  %10 = bitcast i32** %dev_a to i8**, !dbg !744
  %11 = call i32 @cudaMalloc(i8** %10, i64 64), !dbg !744
  %12 = load i32** %dev_a, align 8, !dbg !745
  %13 = bitcast i32* %12 to i8*, !dbg !745
  %14 = call i32 @cudaMemcpy(i8* %13, i8* bitcast ([16 x i32]* @_ZZ4mainE1a to i8*), i64 64, i32 1), !dbg !745
  %15 = load i32** %dev_c, align 8, !dbg !746
  %16 = bitcast i32* %15 to i8*, !dbg !746
  %17 = getelementptr inbounds [16 x i32]* %c, i32 0, i32 0, !dbg !746
  %18 = bitcast i32* %17 to i8*, !dbg !746
  %19 = call i32 @cudaMemcpy(i8* %16, i8* %18, i64 64, i32 1), !dbg !746
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %dimgrid, i32 2, i32 2, i32 1), !dbg !747
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %dimblock, i32 2, i32 2, i32 1), !dbg !748
  %20 = bitcast %struct.dim3* %2 to i8*, !dbg !749
  %21 = bitcast %struct.dim3* %dimgrid to i8*, !dbg !749
  %22 = call i8* @memcpy(i8* %20, i8* %21, i64 12)
  %23 = bitcast %struct.dim3* %3 to i8*, !dbg !749
  %24 = bitcast %struct.dim3* %dimblock to i8*, !dbg !749
  %25 = call i8* @memcpy(i8* %23, i8* %24, i64 12)
  %26 = bitcast { i64, i32 }* %4 to i8*, !dbg !749
  %27 = bitcast %struct.dim3* %2 to i8*, !dbg !749
  %28 = call i8* @memcpy(i8* %26, i8* %27, i64 12)
  %29 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !749
  %30 = load i64* %29, align 1, !dbg !749
  %31 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !749
  %32 = load i32* %31, align 1, !dbg !749
  %33 = bitcast { i64, i32 }* %5 to i8*, !dbg !749
  %34 = bitcast %struct.dim3* %3 to i8*, !dbg !749
  %35 = call i8* @memcpy(i8* %33, i8* %34, i64 12)
  %36 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !749
  %37 = load i64* %36, align 1, !dbg !749
  %38 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !749
  %39 = load i32* %38, align 1, !dbg !749
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %30, i32 %32, i64 %37, i32 %39), !dbg !749
  %40 = load i32** %dev_c, align 8, !dbg !751
  %41 = load i32** %dev_a, align 8, !dbg !751
  call void @_Z9TransposePiPKi(i32* %40, i32* %41), !dbg !751
  %42 = getelementptr inbounds [16 x i32]* %c, i32 0, i32 0, !dbg !752
  %43 = bitcast i32* %42 to i8*, !dbg !752
  %44 = load i32** %dev_c, align 8, !dbg !752
  %45 = bitcast i32* %44 to i8*, !dbg !752
  %46 = call i32 @cudaMemcpy(i8* %43, i8* %45, i64 64, i32 2), !dbg !752
  %47 = load i32** %dev_c, align 8, !dbg !753
  %48 = bitcast i32* %47 to i8*, !dbg !753
  %49 = call i32 @cudaFree(i8* %48), !dbg !753
  %50 = load i32** %dev_a, align 8, !dbg !754
  %51 = bitcast i32* %50 to i8*, !dbg !754
  %52 = call i32 @cudaFree(i8* %51), !dbg !754
  store i32 0, i32* %i, align 4, !dbg !755
  br label %53, !dbg !755

; <label>:53                                      ; preds = %77, %0
  %54 = load i32* %i, align 4, !dbg !755
  %55 = icmp slt i32 %54, 16, !dbg !755
  br i1 %55, label %56, label %80, !dbg !755

; <label>:56                                      ; preds = %53
  %57 = load i32* %i, align 4, !dbg !757
  %58 = sext i32 %57 to i64, !dbg !757
  %59 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %58, !dbg !757
  %60 = load i32* %59, align 4, !dbg !757
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %60), !dbg !757
  %62 = load i32* %i, align 4, !dbg !759
  %63 = icmp slt i32 %62, 3, !dbg !759
  br i1 %63, label %64, label %77, !dbg !759

; <label>:64                                      ; preds = %56
  %65 = load i32* %i, align 4, !dbg !760
  %66 = add nsw i32 %65, 1, !dbg !760
  %67 = sext i32 %66 to i64, !dbg !760
  %68 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %67, !dbg !760
  %69 = load i32* %68, align 4, !dbg !760
  %70 = load i32* %i, align 4, !dbg !760
  %71 = sext i32 %70 to i64, !dbg !760
  %72 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %71, !dbg !760
  %73 = load i32* %72, align 4, !dbg !760
  %74 = add nsw i32 %73, 4, !dbg !760
  %75 = icmp ne i32 %69, %74, !dbg !760
  br i1 %75, label %77, label %76, !dbg !760

; <label>:76                                      ; preds = %64
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 55, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwi
  unreachable, !dbg !760

; <label>:77                                      ; preds = %56, %64
  %78 = load i32* %i, align 4, !dbg !755
  %79 = add nsw i32 %78, 1, !dbg !755
  store i32 %79, i32* %i, align 4, !dbg !755
  br label %53, !dbg !755

; <label>:80                                      ; preds = %53
  ret i32 0, !dbg !761
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

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
  %6 = load i32* %2, align 4, !dbg !762
  %7 = load i32* %3, align 4, !dbg !762
  %8 = load i32* %4, align 4, !dbg !762
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !762
  ret void, !dbg !762
}

declare void @__set_CUDAConfig(i64, i32, i64, i32, ...)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !763
  %7 = load i32* %2, align 4, !dbg !763
  store i32 %7, i32* %6, align 4, !dbg !763
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !763
  %9 = load i32* %3, align 4, !dbg !763
  store i32 %9, i32* %8, align 4, !dbg !763
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !763
  %11 = load i32* %4, align 4, !dbg !763
  store i32 %11, i32* %10, align 4, !dbg !763
  ret void, !dbg !764
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !766
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !766

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !766
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !767
  %4 = load i8* %src.06, align 1, !dbg !767, !tbaa !768
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !767
  store i8 %4, i8* %dest.05, align 1, !dbg !767, !tbaa !768
  %6 = icmp eq i64 %2, 0, !dbg !766
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !766

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !770
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !771
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !771

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !772
  br label %3, !dbg !771

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !771
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !772
  store volatile i8 %2, i8* %a.05, align 1, !dbg !772, !tbaa !768
  %6 = icmp eq i64 %4, 0, !dbg !771
  br i1 %6, label %._crit_edge, label %3, !dbg !771

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !773
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !774
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !776
  ret i32 0, !dbg !778
}

declare void @free(i8* nocapture) nounwind

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !779
  tail call void @free(i8* %1) nounwind, !dbg !779
  ret i32 0, !dbg !781
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !782
  ret i32 0, !dbg !784
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !785
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !787
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !789
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !791
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !793
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !795
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !797
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !799
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !801
  store i8* %1, i8** %devPtr, align 8, !dbg !801, !tbaa !802
  tail call void @__clear_device(), !dbg !803
  ret i32 0, !dbg !804
}

declare void @__set_device()

declare noalias i8* @malloc(i64) nounwind

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !805
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !807
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !809
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !811
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !813
  store i8* %1, i8** %ptr, align 8, !dbg !813, !tbaa !802
  tail call void @__clear_host(), !dbg !814
  ret i32 0, !dbg !815
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !816
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !818
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !820
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !822
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !824
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !826
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !828
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !830
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !832
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !834
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !836
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !838
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !840
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !842
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !844
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !846
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !848
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !850
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !852
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !854
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !856
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !858
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !860
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !862
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !864
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !865
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !867
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !869
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !871
}

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !872
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !874
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !876
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !878
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !880
}

!llvm.dbg.cu = !{!0, !80, !104, !120, !137}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !11, 
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !20, metadata !26, metadata !29, metadata !72}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"index", metadata !"index", metadata !"_Z5indexiii", metadata !16, i32 10, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32, i32)* @_Z5indexiii, null, null, 
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19, metadata !19, metadata !19}
!19 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = metadata !{i32 786478, i32 0, metadata !16, metadata !"Transpose", metadata !"Transpose", metadata !"_Z9TransposePiPKi", metadata !16, i32 14, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*)* @_Z9TransposeP
!21 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{null, metadata !23, metadata !24}
!23 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!24 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!25 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!26 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 20, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 21} ; [ DW_TAG_
!27 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{metadata !19}
!29 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !30, i32 419, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!30 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail", null} ; [ DW_TAG_file_type ]
!31 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{null, metadata !33, metadata !37, metadata !37, metadata !37}
!33 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !34} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!34 = metadata !{i32 786451, null, metadata !"dim3", metadata !30, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !35, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!35 = metadata !{metadata !36, metadata !38, metadata !39, metadata !40, metadata !43, metadata !61, metadata !64, metadata !69}
!36 = metadata !{i32 786445, metadata !34, metadata !"x", metadata !30, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !37} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!37 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!38 = metadata !{i32 786445, metadata !34, metadata !"y", metadata !30, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !37} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!39 = metadata !{i32 786445, metadata !34, metadata !"z", metadata !30, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !37} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!40 = metadata !{i32 786478, i32 0, metadata !34, metadata !"dim3", metadata !"dim3", metadata !"", metadata !30, i32 419, metadata !31, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !41, i32 419} ; [ DW_TAG_subpr
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!43 = metadata !{i32 786478, i32 0, metadata !34, metadata !"dim3", metadata !"dim3", metadata !"", metadata !30, i32 420, metadata !44, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !41, i32 420} ; [ DW_TAG_subpr
!44 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !45, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = metadata !{null, metadata !33, metadata !46}
!46 = metadata !{i32 786454, null, metadata !"uint3", metadata !30, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !47} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!47 = metadata !{i32 786451, null, metadata !"uint3", metadata !30, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !48, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!48 = metadata !{metadata !49, metadata !50, metadata !51, metadata !52, metadata !56}
!49 = metadata !{i32 786445, metadata !47, metadata !"x", metadata !30, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !37} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!50 = metadata !{i32 786445, metadata !47, metadata !"y", metadata !30, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !37} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!51 = metadata !{i32 786445, metadata !47, metadata !"z", metadata !30, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !37} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!52 = metadata !{i32 786478, i32 0, metadata !47, metadata !"uint3", metadata !"uint3", metadata !"", metadata !30, i32 188, metadata !53, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !41, i32 188} ; [ DW_TAG_sub
!53 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = metadata !{null, metadata !55}
!55 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !47} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!56 = metadata !{i32 786478, i32 0, metadata !47, metadata !"uint3", metadata !"uint3", metadata !"", metadata !30, i32 188, metadata !57, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !41, i32 188} ; [ DW_TAG_sub
!57 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{null, metadata !55, metadata !59}
!59 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !47} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!61 = metadata !{i32 786478, i32 0, metadata !34, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !30, i32 421, metadata !62, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!62 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = metadata !{metadata !46, metadata !33}
!64 = metadata !{i32 786478, i32 0, metadata !34, metadata !"dim3", metadata !"dim3", metadata !"", metadata !30, i32 415, metadata !65, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !41, i32 415} ; [ DW_TAG_subpr
!65 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{null, metadata !33, metadata !67}
!67 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!69 = metadata !{i32 786478, i32 0, metadata !34, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !30, i32 415, metadata !70, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !41, i32 415} ; [ DW_TAG_sub
!70 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = metadata !{null, metadata !33}
!72 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !30, i32 419, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!73 = metadata !{metadata !74}
!74 = metadata !{metadata !75, metadata !79, metadata !79, metadata !79, metadata !79, metadata !79, metadata !79}
!75 = metadata !{i32 786484, i32 0, metadata !26, metadata !"a", metadata !"a", metadata !"", metadata !16, i32 23, metadata !76, i32 1, i32 1, [16 x i32]* @_ZZ4mainE1a} ; [ DW_TAG_variable ] [a] [line 23] [local] [def]
!76 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 32, i32 0, i32 0, metadata !25, metadata !77, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from ]
!77 = metadata !{metadata !78}
!78 = metadata !{i32 786465, i64 0, i64 15}       ; [ DW_TAG_subrange_type ] [0, 15]
!79 = metadata !{i32 786484, i32 0, metadata !16, metadata !"arraySize", metadata !"arraySize", metadata !"arraySize", metadata !16, i32 22, metadata !25, i32 1, i32 1, i32 16} ; [ DW_TAG_variable ] [arraySize] [line 22] [local] [def]
!80 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!81 = metadata !{metadata !82}
!82 = metadata !{metadata !83}
!83 = metadata !{i32 786478, i32 0, metadata !84, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !84, i32 12, metadata !85, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !92, i
!84 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!85 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !86, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!86 = metadata !{metadata !87, metadata !87, metadata !88, metadata !90}
!87 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!88 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !89} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!89 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!90 = metadata !{i32 786454, null, metadata !"size_t", metadata !84, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !91} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!91 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!92 = metadata !{metadata !93}
!93 = metadata !{metadata !94, metadata !95, metadata !96, metadata !97, metadata !101}
!94 = metadata !{i32 786689, metadata !83, metadata !"destaddr", metadata !84, i32 16777228, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!95 = metadata !{i32 786689, metadata !83, metadata !"srcaddr", metadata !84, i32 33554444, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!96 = metadata !{i32 786689, metadata !83, metadata !"len", metadata !84, i32 50331660, metadata !90, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!97 = metadata !{i32 786688, metadata !98, metadata !"dest", metadata !84, i32 13, metadata !99, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!98 = metadata !{i32 786443, metadata !83, i32 12, i32 0, metadata !84, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!99 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !100} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!100 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!101 = metadata !{i32 786688, metadata !98, metadata !"src", metadata !84, i32 14, metadata !102, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!102 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !103} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!103 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!104 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2
!105 = metadata !{metadata !106}
!106 = metadata !{metadata !107}
!107 = metadata !{i32 786478, i32 0, metadata !108, metadata !"memmove", metadata !"memmove", metadata !"", metadata !108, i32 12, metadata !109, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !112, i32 12} ; [ DW_TAG
!108 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!109 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !110, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = metadata !{metadata !87, metadata !87, metadata !88, metadata !111}
!111 = metadata !{i32 786454, null, metadata !"size_t", metadata !108, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !91} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!112 = metadata !{metadata !113}
!113 = metadata !{metadata !114, metadata !115, metadata !116, metadata !117, metadata !119}
!114 = metadata !{i32 786689, metadata !107, metadata !"dst", metadata !108, i32 16777228, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!115 = metadata !{i32 786689, metadata !107, metadata !"src", metadata !108, i32 33554444, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!116 = metadata !{i32 786689, metadata !107, metadata !"count", metadata !108, i32 50331660, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!117 = metadata !{i32 786688, metadata !118, metadata !"a", metadata !108, i32 14, metadata !99, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!118 = metadata !{i32 786443, metadata !107, i32 12, i32 0, metadata !108, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!119 = metadata !{i32 786688, metadata !118, metadata !"b", metadata !108, i32 15, metadata !102, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!120 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!121 = metadata !{metadata !122}
!122 = metadata !{metadata !123}
!123 = metadata !{i32 786478, i32 0, metadata !124, metadata !"memset", metadata !"memset", metadata !"", metadata !124, i32 12, metadata !125, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!124 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!125 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !126, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!126 = metadata !{metadata !87, metadata !87, metadata !19, metadata !127}
!127 = metadata !{i32 786454, null, metadata !"size_t", metadata !124, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !91} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!128 = metadata !{metadata !129}
!129 = metadata !{metadata !130, metadata !131, metadata !132, metadata !133}
!130 = metadata !{i32 786689, metadata !123, metadata !"dst", metadata !124, i32 16777228, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!131 = metadata !{i32 786689, metadata !123, metadata !"s", metadata !124, i32 33554444, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!132 = metadata !{i32 786689, metadata !123, metadata !"count", metadata !124, i32 50331660, metadata !127, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!133 = metadata !{i32 786688, metadata !134, metadata !"a", metadata !124, i32 13, metadata !135, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!134 = metadata !{i32 786443, metadata !123, i32 12, i32 0, metadata !124, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!135 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !136} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!136 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!137 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!138 = metadata !{metadata !139}
!139 = metadata !{metadata !140, metadata !215, metadata !221}
!140 = metadata !{i32 786436, null, metadata !"cudaError", metadata !141, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !142, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!141 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!142 = metadata !{metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !149, metadata !150, metadata !151, metadata !152, metadata !153, metadata !154, metadata !155, metadata !156, metadata !157, metadata !1
!143 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!144 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!145 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!146 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!147 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!148 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!149 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!150 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!151 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!152 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!153 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!154 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!155 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!156 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!157 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!158 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!159 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!160 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!161 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!162 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!163 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!164 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!165 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!166 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!167 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!168 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!169 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!170 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!171 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!172 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!173 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!174 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!175 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!176 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!177 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!178 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!179 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!180 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!181 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!182 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!183 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!184 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!185 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!186 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!187 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!188 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!189 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!190 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!191 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!192 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!193 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!194 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!195 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!196 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!197 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!198 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!199 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!200 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!201 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!202 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!203 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!204 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!205 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!206 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!207 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!208 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!209 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!210 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!211 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!212 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!213 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!214 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!215 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !141, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !216, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!216 = metadata !{metadata !217, metadata !218, metadata !219, metadata !220}
!217 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!218 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!219 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!220 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!221 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !141, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!222 = metadata !{metadata !223}
!223 = metadata !{metadata !224, metadata !253, metadata !259, metadata !265, metadata !269, metadata !277, metadata !285, metadata !293, metadata !301, metadata !308, metadata !316, metadata !320, metadata !327, metadata !341, metadata !351, metadata !3
!224 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !225, i32 24, metadata !226, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!225 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!226 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !227, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!227 = metadata !{metadata !228, metadata !229, metadata !237, metadata !244, metadata !245}
!228 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !225, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !140} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!229 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !230} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!230 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !141, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !231, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!231 = metadata !{metadata !232, metadata !233, metadata !234, metadata !235, metadata !236}
!232 = metadata !{i32 786445, metadata !230, metadata !"x", metadata !141, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!233 = metadata !{i32 786445, metadata !230, metadata !"y", metadata !141, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !19} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!234 = metadata !{i32 786445, metadata !230, metadata !"z", metadata !141, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !19} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!235 = metadata !{i32 786445, metadata !230, metadata !"w", metadata !141, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !19} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!236 = metadata !{i32 786445, metadata !230, metadata !"f", metadata !141, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !215} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!237 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !238} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!238 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !141, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !239, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!239 = metadata !{metadata !240, metadata !242, metadata !243}
!240 = metadata !{i32 786445, metadata !238, metadata !"width", metadata !141, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !241} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!241 = metadata !{i32 786454, null, metadata !"size_t", metadata !141, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !91} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!242 = metadata !{i32 786445, metadata !238, metadata !"height", metadata !141, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !241} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!243 = metadata !{i32 786445, metadata !238, metadata !"depth", metadata !141, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !241} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!244 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!245 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !246} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!246 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !141, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!247 = metadata !{metadata !248}
!248 = metadata !{metadata !249, metadata !250, metadata !251, metadata !252}
!249 = metadata !{i32 786689, metadata !224, metadata !"desc", metadata !225, i32 16777240, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!250 = metadata !{i32 786689, metadata !224, metadata !"extent", metadata !225, i32 33554456, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!251 = metadata !{i32 786689, metadata !224, metadata !"flags", metadata !225, i32 50331673, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!252 = metadata !{i32 786689, metadata !224, metadata !"array", metadata !225, i32 67108889, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!253 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !225, i32 29, metadata !254, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !256, 
!254 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !255, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!255 = metadata !{metadata !228, metadata !87}
!256 = metadata !{metadata !257}
!257 = metadata !{metadata !258}
!258 = metadata !{i32 786689, metadata !253, metadata !"devPtr", metadata !225, i32 16777245, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!259 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !225, i32 34, metadata !260, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!260 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !261, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!261 = metadata !{metadata !228, metadata !245}
!262 = metadata !{metadata !263}
!263 = metadata !{metadata !264}
!264 = metadata !{i32 786689, metadata !259, metadata !"array", metadata !225, i32 16777250, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!265 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !225, i32 39, metadata !254, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!266 = metadata !{metadata !267}
!267 = metadata !{metadata !268}
!268 = metadata !{i32 786689, metadata !265, metadata !"ptr", metadata !225, i32 16777255, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!269 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !225, i32 44, metadata !270, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!270 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !271, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!271 = metadata !{metadata !228, metadata !272, metadata !102}
!272 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !87} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!273 = metadata !{metadata !274}
!274 = metadata !{metadata !275, metadata !276}
!275 = metadata !{i32 786689, metadata !269, metadata !"devPtr", metadata !225, i32 16777260, metadata !272, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!276 = metadata !{i32 786689, metadata !269, metadata !"symbol", metadata !225, i32 33554476, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!277 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !225, i32 48, metadata !278, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!278 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !279, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!279 = metadata !{metadata !228, metadata !280, metadata !102}
!280 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !241} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!281 = metadata !{metadata !282}
!282 = metadata !{metadata !283, metadata !284}
!283 = metadata !{i32 786689, metadata !277, metadata !"size", metadata !225, i32 16777264, metadata !280, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!284 = metadata !{i32 786689, metadata !277, metadata !"symbol", metadata !225, i32 33554480, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!285 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !225, i32 52, metadata !286, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!286 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !287, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!287 = metadata !{metadata !228, metadata !272, metadata !241, metadata !37}
!288 = metadata !{metadata !289}
!289 = metadata !{metadata !290, metadata !291, metadata !292}
!290 = metadata !{i32 786689, metadata !285, metadata !"pHost", metadata !225, i32 16777268, metadata !272, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!291 = metadata !{i32 786689, metadata !285, metadata !"size", metadata !225, i32 33554484, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!292 = metadata !{i32 786689, metadata !285, metadata !"flags", metadata !225, i32 50331700, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!293 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !225, i32 56, metadata !294, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!294 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !295, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!295 = metadata !{metadata !228, metadata !272, metadata !87, metadata !37}
!296 = metadata !{metadata !297}
!297 = metadata !{metadata !298, metadata !299, metadata !300}
!298 = metadata !{i32 786689, metadata !293, metadata !"pDevice", metadata !225, i32 16777272, metadata !272, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!299 = metadata !{i32 786689, metadata !293, metadata !"pHost", metadata !225, i32 33554488, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!300 = metadata !{i32 786689, metadata !293, metadata !"flags", metadata !225, i32 50331704, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!301 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !225, i32 60, metadata !302, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!302 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !303, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!303 = metadata !{metadata !228, metadata !244, metadata !87}
!304 = metadata !{metadata !305}
!305 = metadata !{metadata !306, metadata !307}
!306 = metadata !{i32 786689, metadata !301, metadata !"pFlags", metadata !225, i32 16777276, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!307 = metadata !{i32 786689, metadata !301, metadata !"pHost", metadata !225, i32 33554492, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!308 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !225, i32 64, metadata !309, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!309 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !310, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!310 = metadata !{metadata !228, metadata !87, metadata !241, metadata !37}
!311 = metadata !{metadata !312}
!312 = metadata !{metadata !313, metadata !314, metadata !315}
!313 = metadata !{i32 786689, metadata !308, metadata !"ptr", metadata !225, i32 16777280, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!314 = metadata !{i32 786689, metadata !308, metadata !"size", metadata !225, i32 33554496, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!315 = metadata !{i32 786689, metadata !308, metadata !"flags", metadata !225, i32 50331712, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!316 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !225, i32 68, metadata !254, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!317 = metadata !{metadata !318}
!318 = metadata !{metadata !319}
!319 = metadata !{i32 786689, metadata !316, metadata !"ptr", metadata !225, i32 16777284, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!320 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !225, i32 72, metadata !321, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!321 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !322, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!322 = metadata !{metadata !228, metadata !272, metadata !241}
!323 = metadata !{metadata !324}
!324 = metadata !{metadata !325, metadata !326}
!325 = metadata !{i32 786689, metadata !320, metadata !"devPtr", metadata !225, i32 16777288, metadata !272, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!326 = metadata !{i32 786689, metadata !320, metadata !"size", metadata !225, i32 33554504, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!327 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !225, i32 80, metadata !328, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!328 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !329, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!329 = metadata !{metadata !228, metadata !330, metadata !238}
!330 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !331} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!331 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !141, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !332, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!332 = metadata !{metadata !333, metadata !334, metadata !335, metadata !336}
!333 = metadata !{i32 786445, metadata !331, metadata !"ptr", metadata !141, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !87} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!334 = metadata !{i32 786445, metadata !331, metadata !"pitch", metadata !141, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !241} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!335 = metadata !{i32 786445, metadata !331, metadata !"xsize", metadata !141, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !241} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!336 = metadata !{i32 786445, metadata !331, metadata !"ysize", metadata !141, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !241} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!337 = metadata !{metadata !338}
!338 = metadata !{metadata !339, metadata !340}
!339 = metadata !{i32 786689, metadata !327, metadata !"pitchedDevPtr", metadata !225, i32 16777296, metadata !330, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!340 = metadata !{i32 786689, metadata !327, metadata !"extent", metadata !225, i32 33554512, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!341 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !225, i32 84, metadata !342, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!342 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !343, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!343 = metadata !{metadata !228, metadata !344, metadata !229, metadata !238, metadata !37}
!344 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !245} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!345 = metadata !{metadata !346}
!346 = metadata !{metadata !347, metadata !348, metadata !349, metadata !350}
!347 = metadata !{i32 786689, metadata !341, metadata !"array", metadata !225, i32 16777300, metadata !344, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!348 = metadata !{i32 786689, metadata !341, metadata !"desc", metadata !225, i32 33554516, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!349 = metadata !{i32 786689, metadata !341, metadata !"extent", metadata !225, i32 50331733, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!350 = metadata !{i32 786689, metadata !341, metadata !"flags", metadata !225, i32 67108949, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!351 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !225, i32 89, metadata !352, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!352 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !353, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!353 = metadata !{metadata !228, metadata !344, metadata !229, metadata !241, metadata !241, metadata !37}
!354 = metadata !{metadata !355}
!355 = metadata !{metadata !356, metadata !357, metadata !358, metadata !359, metadata !360}
!356 = metadata !{i32 786689, metadata !351, metadata !"array", metadata !225, i32 16777305, metadata !344, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!357 = metadata !{i32 786689, metadata !351, metadata !"desc", metadata !225, i32 33554521, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!358 = metadata !{i32 786689, metadata !351, metadata !"width", metadata !225, i32 50331738, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!359 = metadata !{i32 786689, metadata !351, metadata !"height", metadata !225, i32 67108954, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!360 = metadata !{i32 786689, metadata !351, metadata !"flags", metadata !225, i32 83886170, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!361 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !225, i32 94, metadata !321, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!362 = metadata !{metadata !363}
!363 = metadata !{metadata !364, metadata !365}
!364 = metadata !{i32 786689, metadata !361, metadata !"ptr", metadata !225, i32 16777310, metadata !272, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!365 = metadata !{i32 786689, metadata !361, metadata !"size", metadata !225, i32 33554526, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!366 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !225, i32 102, metadata !367, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!367 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !368, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!368 = metadata !{metadata !228, metadata !272, metadata !280, metadata !241, metadata !241}
!369 = metadata !{metadata !370}
!370 = metadata !{metadata !371, metadata !372, metadata !373, metadata !374}
!371 = metadata !{i32 786689, metadata !366, metadata !"devPtr", metadata !225, i32 16777318, metadata !272, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!372 = metadata !{i32 786689, metadata !366, metadata !"pitch", metadata !225, i32 33554534, metadata !280, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!373 = metadata !{i32 786689, metadata !366, metadata !"width", metadata !225, i32 50331750, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!374 = metadata !{i32 786689, metadata !366, metadata !"height", metadata !225, i32 67108966, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!375 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !225, i32 106, metadata !376, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!376 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !377, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!377 = metadata !{metadata !228, metadata !87, metadata !88, metadata !241, metadata !221}
!378 = metadata !{metadata !379}
!379 = metadata !{metadata !380, metadata !381, metadata !382, metadata !383}
!380 = metadata !{i32 786689, metadata !375, metadata !"dst", metadata !225, i32 16777322, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!381 = metadata !{i32 786689, metadata !375, metadata !"src", metadata !225, i32 33554538, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!382 = metadata !{i32 786689, metadata !375, metadata !"count", metadata !225, i32 50331754, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!383 = metadata !{i32 786689, metadata !375, metadata !"kind", metadata !225, i32 67108970, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!384 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !225, i32 111, metadata !385, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!385 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !386, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!386 = metadata !{metadata !228, metadata !87, metadata !241, metadata !88, metadata !241, metadata !241, metadata !241, metadata !221}
!387 = metadata !{metadata !388}
!388 = metadata !{metadata !389, metadata !390, metadata !391, metadata !392, metadata !393, metadata !394, metadata !395}
!389 = metadata !{i32 786689, metadata !384, metadata !"dst", metadata !225, i32 16777327, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!390 = metadata !{i32 786689, metadata !384, metadata !"dpitch", metadata !225, i32 33554543, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!391 = metadata !{i32 786689, metadata !384, metadata !"src", metadata !225, i32 50331759, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!392 = metadata !{i32 786689, metadata !384, metadata !"spitch", metadata !225, i32 67108975, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!393 = metadata !{i32 786689, metadata !384, metadata !"width", metadata !225, i32 83886192, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!394 = metadata !{i32 786689, metadata !384, metadata !"height", metadata !225, i32 100663408, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!395 = metadata !{i32 786689, metadata !384, metadata !"kind", metadata !225, i32 117440624, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!396 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !225, i32 116, metadata !397, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!397 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !398, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!398 = metadata !{metadata !228, metadata !245, metadata !241, metadata !241, metadata !245, metadata !241, metadata !241, metadata !241, metadata !241, metadata !221}
!399 = metadata !{metadata !400}
!400 = metadata !{metadata !401, metadata !402, metadata !403, metadata !404, metadata !405, metadata !406, metadata !407, metadata !408, metadata !409}
!401 = metadata !{i32 786689, metadata !396, metadata !"dst", metadata !225, i32 16777332, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!402 = metadata !{i32 786689, metadata !396, metadata !"wOffsetDst", metadata !225, i32 33554548, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!403 = metadata !{i32 786689, metadata !396, metadata !"hOffsetDst", metadata !225, i32 50331764, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!404 = metadata !{i32 786689, metadata !396, metadata !"src", metadata !225, i32 67108981, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!405 = metadata !{i32 786689, metadata !396, metadata !"wOffsetSrc", metadata !225, i32 83886197, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!406 = metadata !{i32 786689, metadata !396, metadata !"hOffsetSrc", metadata !225, i32 100663413, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!407 = metadata !{i32 786689, metadata !396, metadata !"width", metadata !225, i32 117440630, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!408 = metadata !{i32 786689, metadata !396, metadata !"height", metadata !225, i32 134217846, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!409 = metadata !{i32 786689, metadata !396, metadata !"kind", metadata !225, i32 150995062, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!410 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !225, i32 122, metadata !411, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!411 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !412, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!412 = metadata !{metadata !228, metadata !87, metadata !241, metadata !88, metadata !241, metadata !241, metadata !241, metadata !221, metadata !413}
!413 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !225, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !414} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!414 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !415} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!415 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !141, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!416 = metadata !{metadata !417}
!417 = metadata !{metadata !418, metadata !419, metadata !420, metadata !421, metadata !422, metadata !423, metadata !424, metadata !425}
!418 = metadata !{i32 786689, metadata !410, metadata !"dst", metadata !225, i32 16777338, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!419 = metadata !{i32 786689, metadata !410, metadata !"dpitch", metadata !225, i32 33554554, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!420 = metadata !{i32 786689, metadata !410, metadata !"src", metadata !225, i32 50331770, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!421 = metadata !{i32 786689, metadata !410, metadata !"spitch", metadata !225, i32 67108986, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!422 = metadata !{i32 786689, metadata !410, metadata !"width", metadata !225, i32 83886203, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!423 = metadata !{i32 786689, metadata !410, metadata !"height", metadata !225, i32 100663419, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!424 = metadata !{i32 786689, metadata !410, metadata !"kind", metadata !225, i32 117440635, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!425 = metadata !{i32 786689, metadata !410, metadata !"stream", metadata !225, i32 134217852, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!426 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !225, i32 128, metadata !427, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!427 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !428, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!428 = metadata !{metadata !228, metadata !87, metadata !241, metadata !245, metadata !241, metadata !241, metadata !241, metadata !241, metadata !221}
!429 = metadata !{metadata !430}
!430 = metadata !{metadata !431, metadata !432, metadata !433, metadata !434, metadata !435, metadata !436, metadata !437, metadata !438}
!431 = metadata !{i32 786689, metadata !426, metadata !"dst", metadata !225, i32 16777344, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!432 = metadata !{i32 786689, metadata !426, metadata !"dpitch", metadata !225, i32 33554560, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!433 = metadata !{i32 786689, metadata !426, metadata !"src", metadata !225, i32 50331776, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!434 = metadata !{i32 786689, metadata !426, metadata !"wOffset", metadata !225, i32 67108993, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!435 = metadata !{i32 786689, metadata !426, metadata !"hOffset", metadata !225, i32 83886209, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!436 = metadata !{i32 786689, metadata !426, metadata !"width", metadata !225, i32 100663425, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!437 = metadata !{i32 786689, metadata !426, metadata !"height", metadata !225, i32 117440641, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!438 = metadata !{i32 786689, metadata !426, metadata !"kind", metadata !225, i32 134217858, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!439 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !225, i32 134, metadata !440, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!440 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !441, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!441 = metadata !{metadata !228, metadata !87, metadata !241, metadata !245, metadata !241, metadata !241, metadata !241, metadata !241, metadata !221, metadata !413}
!442 = metadata !{metadata !443}
!443 = metadata !{metadata !444, metadata !445, metadata !446, metadata !447, metadata !448, metadata !449, metadata !450, metadata !451, metadata !452}
!444 = metadata !{i32 786689, metadata !439, metadata !"dst", metadata !225, i32 16777350, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!445 = metadata !{i32 786689, metadata !439, metadata !"dpitch", metadata !225, i32 33554566, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!446 = metadata !{i32 786689, metadata !439, metadata !"src", metadata !225, i32 50331782, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!447 = metadata !{i32 786689, metadata !439, metadata !"wOffset", metadata !225, i32 67108999, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!448 = metadata !{i32 786689, metadata !439, metadata !"hOffset", metadata !225, i32 83886215, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!449 = metadata !{i32 786689, metadata !439, metadata !"width", metadata !225, i32 100663431, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!450 = metadata !{i32 786689, metadata !439, metadata !"height", metadata !225, i32 117440647, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!451 = metadata !{i32 786689, metadata !439, metadata !"kind", metadata !225, i32 134217864, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!452 = metadata !{i32 786689, metadata !439, metadata !"stream", metadata !225, i32 150995080, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!453 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !225, i32 140, metadata !454, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!454 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !455, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!455 = metadata !{metadata !228, metadata !245, metadata !241, metadata !241, metadata !88, metadata !241, metadata !241, metadata !241, metadata !221}
!456 = metadata !{metadata !457}
!457 = metadata !{metadata !458, metadata !459, metadata !460, metadata !461, metadata !462, metadata !463, metadata !464, metadata !465}
!458 = metadata !{i32 786689, metadata !453, metadata !"dst", metadata !225, i32 16777356, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!459 = metadata !{i32 786689, metadata !453, metadata !"wOffset", metadata !225, i32 33554572, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!460 = metadata !{i32 786689, metadata !453, metadata !"hOffset", metadata !225, i32 50331788, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!461 = metadata !{i32 786689, metadata !453, metadata !"src", metadata !225, i32 67109005, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!462 = metadata !{i32 786689, metadata !453, metadata !"spitch", metadata !225, i32 83886221, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!463 = metadata !{i32 786689, metadata !453, metadata !"width", metadata !225, i32 100663437, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!464 = metadata !{i32 786689, metadata !453, metadata !"height", metadata !225, i32 117440653, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!465 = metadata !{i32 786689, metadata !453, metadata !"kind", metadata !225, i32 134217870, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!466 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !225, i32 146, metadata !467, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!467 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !468, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!468 = metadata !{metadata !228, metadata !245, metadata !241, metadata !241, metadata !88, metadata !241, metadata !241, metadata !241, metadata !221, metadata !413}
!469 = metadata !{metadata !470}
!470 = metadata !{metadata !471, metadata !472, metadata !473, metadata !474, metadata !475, metadata !476, metadata !477, metadata !478, metadata !479}
!471 = metadata !{i32 786689, metadata !466, metadata !"dst", metadata !225, i32 16777362, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!472 = metadata !{i32 786689, metadata !466, metadata !"wOffset", metadata !225, i32 33554578, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!473 = metadata !{i32 786689, metadata !466, metadata !"hOffset", metadata !225, i32 50331794, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!474 = metadata !{i32 786689, metadata !466, metadata !"src", metadata !225, i32 67109011, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!475 = metadata !{i32 786689, metadata !466, metadata !"spitch", metadata !225, i32 83886227, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!476 = metadata !{i32 786689, metadata !466, metadata !"width", metadata !225, i32 100663443, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!477 = metadata !{i32 786689, metadata !466, metadata !"height", metadata !225, i32 117440659, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!478 = metadata !{i32 786689, metadata !466, metadata !"kind", metadata !225, i32 134217876, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!479 = metadata !{i32 786689, metadata !466, metadata !"stream", metadata !225, i32 150995092, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!480 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !225, i32 152, metadata !481, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!481 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !482, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!482 = metadata !{metadata !228, metadata !483}
!483 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !484} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!484 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !485} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!485 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !141, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !486, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!486 = metadata !{metadata !487, metadata !489, metadata !495, metadata !496, metadata !497, metadata !498, metadata !499, metadata !500}
!487 = metadata !{i32 786445, metadata !485, metadata !"srcArray", metadata !141, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !488} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!488 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !141, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !245} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!489 = metadata !{i32 786445, metadata !485, metadata !"srcPos", metadata !141, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !490} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!490 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !141, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !491, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!491 = metadata !{metadata !492, metadata !493, metadata !494}
!492 = metadata !{i32 786445, metadata !490, metadata !"x", metadata !141, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !241} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!493 = metadata !{i32 786445, metadata !490, metadata !"y", metadata !141, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !241} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!494 = metadata !{i32 786445, metadata !490, metadata !"z", metadata !141, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !241} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!495 = metadata !{i32 786445, metadata !485, metadata !"srcPtr", metadata !141, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !331} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!496 = metadata !{i32 786445, metadata !485, metadata !"dstArray", metadata !141, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !488} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!497 = metadata !{i32 786445, metadata !485, metadata !"dstPos", metadata !141, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !490} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!498 = metadata !{i32 786445, metadata !485, metadata !"dstPtr", metadata !141, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !331} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!499 = metadata !{i32 786445, metadata !485, metadata !"extent", metadata !141, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !238} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!500 = metadata !{i32 786445, metadata !485, metadata !"kind", metadata !141, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !221} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!501 = metadata !{metadata !502}
!502 = metadata !{metadata !503}
!503 = metadata !{i32 786689, metadata !480, metadata !"p", metadata !225, i32 16777368, metadata !483, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!504 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !225, i32 156, metadata !505, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!505 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !506, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!506 = metadata !{metadata !228, metadata !483, metadata !413}
!507 = metadata !{metadata !508}
!508 = metadata !{metadata !509, metadata !510}
!509 = metadata !{i32 786689, metadata !504, metadata !"p", metadata !225, i32 16777372, metadata !483, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!510 = metadata !{i32 786689, metadata !504, metadata !"stream", metadata !225, i32 33554588, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!511 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !225, i32 160, metadata !512, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!512 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !513, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!513 = metadata !{metadata !228, metadata !514}
!514 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !515} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!515 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !516} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!516 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !141, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !517, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!517 = metadata !{metadata !518, metadata !519, metadata !520, metadata !521, metadata !522, metadata !523, metadata !524, metadata !525, metadata !526}
!518 = metadata !{i32 786445, metadata !516, metadata !"srcArray", metadata !141, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !488} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!519 = metadata !{i32 786445, metadata !516, metadata !"srcPos", metadata !141, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !490} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!520 = metadata !{i32 786445, metadata !516, metadata !"srcPtr", metadata !141, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !331} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!521 = metadata !{i32 786445, metadata !516, metadata !"srcDevice", metadata !141, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !19} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!522 = metadata !{i32 786445, metadata !516, metadata !"dstArray", metadata !141, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !488} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!523 = metadata !{i32 786445, metadata !516, metadata !"dstPos", metadata !141, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !490} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!524 = metadata !{i32 786445, metadata !516, metadata !"dstPtr", metadata !141, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !331} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!525 = metadata !{i32 786445, metadata !516, metadata !"dstDevice", metadata !141, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !19} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!526 = metadata !{i32 786445, metadata !516, metadata !"extent", metadata !141, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !238} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!527 = metadata !{metadata !528}
!528 = metadata !{metadata !529}
!529 = metadata !{i32 786689, metadata !511, metadata !"p", metadata !225, i32 16777376, metadata !514, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!530 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !225, i32 164, metadata !531, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!531 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !532, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!532 = metadata !{metadata !228, metadata !514, metadata !413}
!533 = metadata !{metadata !534}
!534 = metadata !{metadata !535, metadata !536}
!535 = metadata !{i32 786689, metadata !530, metadata !"p", metadata !225, i32 16777380, metadata !514, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!536 = metadata !{i32 786689, metadata !530, metadata !"stream", metadata !225, i32 33554596, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!537 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !225, i32 168, metadata !538, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!538 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !539, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!539 = metadata !{metadata !228, metadata !245, metadata !241, metadata !241, metadata !245, metadata !241, metadata !241, metadata !241, metadata !221}
!540 = metadata !{metadata !541}
!541 = metadata !{metadata !542, metadata !543, metadata !544, metadata !545, metadata !546, metadata !547, metadata !548, metadata !549}
!542 = metadata !{i32 786689, metadata !537, metadata !"dst", metadata !225, i32 16777384, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!543 = metadata !{i32 786689, metadata !537, metadata !"wOffsetDst", metadata !225, i32 33554600, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!544 = metadata !{i32 786689, metadata !537, metadata !"hOffsetDst", metadata !225, i32 50331816, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!545 = metadata !{i32 786689, metadata !537, metadata !"src", metadata !225, i32 67109033, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!546 = metadata !{i32 786689, metadata !537, metadata !"wOffsetSrc", metadata !225, i32 83886249, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!547 = metadata !{i32 786689, metadata !537, metadata !"hOffsetSrc", metadata !225, i32 100663465, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!548 = metadata !{i32 786689, metadata !537, metadata !"count", metadata !225, i32 117440682, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!549 = metadata !{i32 786689, metadata !537, metadata !"kind", metadata !225, i32 134217898, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!550 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !225, i32 174, metadata !551, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!551 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !552, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!552 = metadata !{metadata !228, metadata !87, metadata !88, metadata !241, metadata !221, metadata !413}
!553 = metadata !{metadata !554}
!554 = metadata !{metadata !555, metadata !556, metadata !557, metadata !558, metadata !559}
!555 = metadata !{i32 786689, metadata !550, metadata !"dst", metadata !225, i32 16777390, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!556 = metadata !{i32 786689, metadata !550, metadata !"src", metadata !225, i32 33554606, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!557 = metadata !{i32 786689, metadata !550, metadata !"count", metadata !225, i32 50331822, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!558 = metadata !{i32 786689, metadata !550, metadata !"kind", metadata !225, i32 67109039, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!559 = metadata !{i32 786689, metadata !550, metadata !"stream", metadata !225, i32 83886255, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!560 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !225, i32 179, metadata !561, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!561 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !562, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!562 = metadata !{metadata !228, metadata !87, metadata !245, metadata !241, metadata !241, metadata !241, metadata !221}
!563 = metadata !{metadata !564}
!564 = metadata !{metadata !565, metadata !566, metadata !567, metadata !568, metadata !569, metadata !570}
!565 = metadata !{i32 786689, metadata !560, metadata !"dst", metadata !225, i32 16777395, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!566 = metadata !{i32 786689, metadata !560, metadata !"src", metadata !225, i32 33554611, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!567 = metadata !{i32 786689, metadata !560, metadata !"wOffset", metadata !225, i32 50331827, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!568 = metadata !{i32 786689, metadata !560, metadata !"hOffset", metadata !225, i32 67109044, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!569 = metadata !{i32 786689, metadata !560, metadata !"count", metadata !225, i32 83886260, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!570 = metadata !{i32 786689, metadata !560, metadata !"kind", metadata !225, i32 100663476, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!571 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !225, i32 184, metadata !572, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!572 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !573, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!573 = metadata !{metadata !228, metadata !87, metadata !245, metadata !241, metadata !241, metadata !241, metadata !221, metadata !413}
!574 = metadata !{metadata !575}
!575 = metadata !{metadata !576, metadata !577, metadata !578, metadata !579, metadata !580, metadata !581, metadata !582}
!576 = metadata !{i32 786689, metadata !571, metadata !"dst", metadata !225, i32 16777400, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!577 = metadata !{i32 786689, metadata !571, metadata !"src", metadata !225, i32 33554616, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!578 = metadata !{i32 786689, metadata !571, metadata !"wOffset", metadata !225, i32 50331832, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!579 = metadata !{i32 786689, metadata !571, metadata !"hOffset", metadata !225, i32 67109049, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!580 = metadata !{i32 786689, metadata !571, metadata !"count", metadata !225, i32 83886265, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!581 = metadata !{i32 786689, metadata !571, metadata !"kind", metadata !225, i32 100663481, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!582 = metadata !{i32 786689, metadata !571, metadata !"stream", metadata !225, i32 117440698, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!583 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !225, i32 190, metadata !584, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!584 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !585, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!585 = metadata !{metadata !228, metadata !87, metadata !102, metadata !241, metadata !241, metadata !221}
!586 = metadata !{metadata !587}
!587 = metadata !{metadata !588, metadata !589, metadata !590, metadata !591, metadata !592}
!588 = metadata !{i32 786689, metadata !583, metadata !"dst", metadata !225, i32 16777406, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!589 = metadata !{i32 786689, metadata !583, metadata !"symbol", metadata !225, i32 33554622, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!590 = metadata !{i32 786689, metadata !583, metadata !"count", metadata !225, i32 50331838, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!591 = metadata !{i32 786689, metadata !583, metadata !"offset", metadata !225, i32 67109055, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!592 = metadata !{i32 786689, metadata !583, metadata !"kind", metadata !225, i32 83886271, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!593 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !225, i32 195, metadata !594, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!594 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !595, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!595 = metadata !{metadata !228, metadata !87, metadata !102, metadata !241, metadata !241, metadata !221, metadata !413}
!596 = metadata !{metadata !597}
!597 = metadata !{metadata !598, metadata !599, metadata !600, metadata !601, metadata !602, metadata !603}
!598 = metadata !{i32 786689, metadata !593, metadata !"dst", metadata !225, i32 16777411, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!599 = metadata !{i32 786689, metadata !593, metadata !"symbol", metadata !225, i32 33554627, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!600 = metadata !{i32 786689, metadata !593, metadata !"count", metadata !225, i32 50331843, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!601 = metadata !{i32 786689, metadata !593, metadata !"offset", metadata !225, i32 67109060, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!602 = metadata !{i32 786689, metadata !593, metadata !"kind", metadata !225, i32 83886276, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!603 = metadata !{i32 786689, metadata !593, metadata !"stream", metadata !225, i32 100663493, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!604 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !225, i32 201, metadata !605, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!605 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !606, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!606 = metadata !{metadata !228, metadata !87, metadata !19, metadata !88, metadata !19, metadata !241}
!607 = metadata !{metadata !608}
!608 = metadata !{metadata !609, metadata !610, metadata !611, metadata !612, metadata !613}
!609 = metadata !{i32 786689, metadata !604, metadata !"dst", metadata !225, i32 16777417, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!610 = metadata !{i32 786689, metadata !604, metadata !"dstDevice", metadata !225, i32 33554633, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!611 = metadata !{i32 786689, metadata !604, metadata !"src", metadata !225, i32 50331849, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!612 = metadata !{i32 786689, metadata !604, metadata !"srcDevice", metadata !225, i32 67109065, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!613 = metadata !{i32 786689, metadata !604, metadata !"count", metadata !225, i32 83886281, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!614 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !225, i32 206, metadata !615, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!615 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !616, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!616 = metadata !{metadata !228, metadata !87, metadata !19, metadata !88, metadata !19, metadata !241, metadata !413}
!617 = metadata !{metadata !618}
!618 = metadata !{metadata !619, metadata !620, metadata !621, metadata !622, metadata !623, metadata !624}
!619 = metadata !{i32 786689, metadata !614, metadata !"dst", metadata !225, i32 16777422, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!620 = metadata !{i32 786689, metadata !614, metadata !"dstDevice", metadata !225, i32 33554638, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!621 = metadata !{i32 786689, metadata !614, metadata !"src", metadata !225, i32 50331854, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!622 = metadata !{i32 786689, metadata !614, metadata !"srcDevice", metadata !225, i32 67109070, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!623 = metadata !{i32 786689, metadata !614, metadata !"count", metadata !225, i32 83886287, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!624 = metadata !{i32 786689, metadata !614, metadata !"stream", metadata !225, i32 100663503, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!625 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !225, i32 212, metadata !626, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!626 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !627, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!627 = metadata !{metadata !228, metadata !245, metadata !241, metadata !241, metadata !88, metadata !241, metadata !221}
!628 = metadata !{metadata !629}
!629 = metadata !{metadata !630, metadata !631, metadata !632, metadata !633, metadata !634, metadata !635}
!630 = metadata !{i32 786689, metadata !625, metadata !"dst", metadata !225, i32 16777428, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!631 = metadata !{i32 786689, metadata !625, metadata !"wOffset", metadata !225, i32 33554644, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!632 = metadata !{i32 786689, metadata !625, metadata !"hOffset", metadata !225, i32 50331860, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!633 = metadata !{i32 786689, metadata !625, metadata !"src", metadata !225, i32 67109077, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!634 = metadata !{i32 786689, metadata !625, metadata !"count", metadata !225, i32 83886293, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!635 = metadata !{i32 786689, metadata !625, metadata !"kind", metadata !225, i32 100663509, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!636 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !225, i32 217, metadata !637, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!637 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !638, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!638 = metadata !{metadata !228, metadata !245, metadata !241, metadata !241, metadata !88, metadata !241, metadata !221, metadata !413}
!639 = metadata !{metadata !640}
!640 = metadata !{metadata !641, metadata !642, metadata !643, metadata !644, metadata !645, metadata !646, metadata !647}
!641 = metadata !{i32 786689, metadata !636, metadata !"dst", metadata !225, i32 16777433, metadata !245, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!642 = metadata !{i32 786689, metadata !636, metadata !"wOffset", metadata !225, i32 33554649, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!643 = metadata !{i32 786689, metadata !636, metadata !"hOffset", metadata !225, i32 50331865, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!644 = metadata !{i32 786689, metadata !636, metadata !"src", metadata !225, i32 67109082, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!645 = metadata !{i32 786689, metadata !636, metadata !"count", metadata !225, i32 83886298, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!646 = metadata !{i32 786689, metadata !636, metadata !"kind", metadata !225, i32 100663514, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!647 = metadata !{i32 786689, metadata !636, metadata !"stream", metadata !225, i32 117440731, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!648 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !225, i32 223, metadata !649, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!649 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !650, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!650 = metadata !{metadata !228, metadata !99, metadata !88, metadata !241, metadata !241, metadata !221}
!651 = metadata !{metadata !652}
!652 = metadata !{metadata !653, metadata !654, metadata !655, metadata !656, metadata !657}
!653 = metadata !{i32 786689, metadata !648, metadata !"symbol", metadata !225, i32 16777439, metadata !99, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!654 = metadata !{i32 786689, metadata !648, metadata !"src", metadata !225, i32 33554655, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!655 = metadata !{i32 786689, metadata !648, metadata !"count", metadata !225, i32 50331871, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!656 = metadata !{i32 786689, metadata !648, metadata !"offset", metadata !225, i32 67109088, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!657 = metadata !{i32 786689, metadata !648, metadata !"kind", metadata !225, i32 83886304, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!658 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !225, i32 229, metadata !659, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!659 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !660, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!660 = metadata !{metadata !228, metadata !102, metadata !88, metadata !241, metadata !241, metadata !221, metadata !413}
!661 = metadata !{metadata !662}
!662 = metadata !{metadata !663, metadata !664, metadata !665, metadata !666, metadata !667, metadata !668}
!663 = metadata !{i32 786689, metadata !658, metadata !"symbol", metadata !225, i32 16777445, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!664 = metadata !{i32 786689, metadata !658, metadata !"src", metadata !225, i32 33554661, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!665 = metadata !{i32 786689, metadata !658, metadata !"count", metadata !225, i32 50331877, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!666 = metadata !{i32 786689, metadata !658, metadata !"offset", metadata !225, i32 67109093, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!667 = metadata !{i32 786689, metadata !658, metadata !"kind", metadata !225, i32 83886310, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!668 = metadata !{i32 786689, metadata !658, metadata !"stream", metadata !225, i32 100663526, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!669 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !225, i32 234, metadata !670, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!670 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !671, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!671 = metadata !{metadata !228, metadata !280, metadata !280}
!672 = metadata !{metadata !673}
!673 = metadata !{metadata !674, metadata !675}
!674 = metadata !{i32 786689, metadata !669, metadata !"free", metadata !225, i32 16777450, metadata !280, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!675 = metadata !{i32 786689, metadata !669, metadata !"total", metadata !225, i32 33554666, metadata !280, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!676 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !225, i32 238, metadata !677, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!677 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !678, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!678 = metadata !{metadata !228, metadata !87, metadata !19, metadata !241}
!679 = metadata !{metadata !680}
!680 = metadata !{metadata !681, metadata !682, metadata !683}
!681 = metadata !{i32 786689, metadata !676, metadata !"devPtr", metadata !225, i32 16777454, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!682 = metadata !{i32 786689, metadata !676, metadata !"value", metadata !225, i32 33554670, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!683 = metadata !{i32 786689, metadata !676, metadata !"count", metadata !225, i32 50331886, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!684 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !225, i32 243, metadata !685, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!685 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !686, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!686 = metadata !{metadata !228, metadata !87, metadata !241, metadata !19, metadata !241, metadata !241}
!687 = metadata !{metadata !688}
!688 = metadata !{metadata !689, metadata !690, metadata !691, metadata !692, metadata !693}
!689 = metadata !{i32 786689, metadata !684, metadata !"devPtr", metadata !225, i32 16777459, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!690 = metadata !{i32 786689, metadata !684, metadata !"pitch", metadata !225, i32 33554675, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!691 = metadata !{i32 786689, metadata !684, metadata !"value", metadata !225, i32 50331891, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!692 = metadata !{i32 786689, metadata !684, metadata !"width", metadata !225, i32 67109108, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!693 = metadata !{i32 786689, metadata !684, metadata !"height", metadata !225, i32 83886324, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!694 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !225, i32 248, metadata !695, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!695 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !696, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!696 = metadata !{metadata !228, metadata !87, metadata !241, metadata !19, metadata !241, metadata !241, metadata !413}
!697 = metadata !{metadata !698}
!698 = metadata !{metadata !699, metadata !700, metadata !701, metadata !702, metadata !703, metadata !704}
!699 = metadata !{i32 786689, metadata !694, metadata !"devPtr", metadata !225, i32 16777464, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!700 = metadata !{i32 786689, metadata !694, metadata !"pitch", metadata !225, i32 33554680, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!701 = metadata !{i32 786689, metadata !694, metadata !"value", metadata !225, i32 50331896, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!702 = metadata !{i32 786689, metadata !694, metadata !"width", metadata !225, i32 67109113, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!703 = metadata !{i32 786689, metadata !694, metadata !"height", metadata !225, i32 83886329, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!704 = metadata !{i32 786689, metadata !694, metadata !"stream", metadata !225, i32 100663545, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!705 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !225, i32 253, metadata !706, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!706 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !707, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!707 = metadata !{metadata !228, metadata !331, metadata !19, metadata !238}
!708 = metadata !{metadata !709}
!709 = metadata !{metadata !710, metadata !711, metadata !712}
!710 = metadata !{i32 786689, metadata !705, metadata !"pitchedDevPtr", metadata !225, i32 16777469, metadata !331, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!711 = metadata !{i32 786689, metadata !705, metadata !"value", metadata !225, i32 33554685, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!712 = metadata !{i32 786689, metadata !705, metadata !"extent", metadata !225, i32 50331902, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!713 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !225, i32 258, metadata !714, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!714 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !715, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!715 = metadata !{metadata !228, metadata !331, metadata !19, metadata !238, metadata !413}
!716 = metadata !{metadata !717}
!717 = metadata !{metadata !718, metadata !719, metadata !720, metadata !721}
!718 = metadata !{i32 786689, metadata !713, metadata !"pitchedDevPtr", metadata !225, i32 16777474, metadata !331, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!719 = metadata !{i32 786689, metadata !713, metadata !"value", metadata !225, i32 33554690, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!720 = metadata !{i32 786689, metadata !713, metadata !"extent", metadata !225, i32 50331907, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!721 = metadata !{i32 786689, metadata !713, metadata !"stream", metadata !225, i32 67109123, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!722 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !225, i32 263, metadata !723, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!723 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !724, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!724 = metadata !{metadata !228, metadata !87, metadata !19, metadata !241, metadata !413}
!725 = metadata !{metadata !726}
!726 = metadata !{metadata !727, metadata !728, metadata !729, metadata !730}
!727 = metadata !{i32 786689, metadata !722, metadata !"devPtr", metadata !225, i32 16777479, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!728 = metadata !{i32 786689, metadata !722, metadata !"value", metadata !225, i32 33554695, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!729 = metadata !{i32 786689, metadata !722, metadata !"count", metadata !225, i32 50331911, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!730 = metadata !{i32 786689, metadata !722, metadata !"stream", metadata !225, i32 67109127, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!731 = metadata !{i32 11, i32 0, metadata !732, null}
!732 = metadata !{i32 786443, metadata !15, i32 10, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail/main.cpp]
!733 = metadata !{i32 15, i32 0, metadata !734, null}
!734 = metadata !{i32 786443, metadata !20, i32 14, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail/main.cpp]
!735 = metadata !{i32 16, i32 0, metadata !734, null}
!736 = metadata !{i32 17, i32 0, metadata !734, null}
!737 = metadata !{i32 18, i32 0, metadata !734, null}
!738 = metadata !{i32 22, i32 0, metadata !739, null}
!739 = metadata !{i32 786443, metadata !26, i32 21, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail/main.cpp]
!740 = metadata !{i32 24, i32 0, metadata !739, null}
!741 = metadata !{i32 26, i32 0, metadata !739, null}
!742 = metadata !{i32 27, i32 0, metadata !739, null}
!743 = metadata !{i32 30, i32 0, metadata !739, null}
!744 = metadata !{i32 31, i32 0, metadata !739, null}
!745 = metadata !{i32 34, i32 0, metadata !739, null}
!746 = metadata !{i32 35, i32 0, metadata !739, null}
!747 = metadata !{i32 38, i32 0, metadata !739, null}
!748 = metadata !{i32 39, i32 0, metadata !739, null}
!749 = metadata !{i32 40, i32 0, metadata !750, null}
!750 = metadata !{i32 786443, metadata !739, i32 40, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail/main.cpp]
!751 = metadata !{i32 42, i32 0, metadata !750, null}
!752 = metadata !{i32 47, i32 0, metadata !739, null}
!753 = metadata !{i32 49, i32 0, metadata !739, null}
!754 = metadata !{i32 50, i32 0, metadata !739, null}
!755 = metadata !{i32 52, i32 0, metadata !756, null}
!756 = metadata !{i32 786443, metadata !739, i32 52, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail/main.cpp]
!757 = metadata !{i32 53, i32 0, metadata !758, null}
!758 = metadata !{i32 786443, metadata !756, i32 52, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail/main.cpp]
!759 = metadata !{i32 54, i32 0, metadata !758, null}
!760 = metadata !{i32 55, i32 0, metadata !758, null}
!761 = metadata !{i32 59, i32 0, metadata !739, null}
!762 = metadata !{i32 419, i32 0, metadata !29, null}
!763 = metadata !{i32 419, i32 0, metadata !72, null}
!764 = metadata !{i32 419, i32 0, metadata !765, null}
!765 = metadata !{i32 786443, metadata !72, i32 419, i32 0, metadata !30, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/091_fail//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!766 = metadata !{i32 16, i32 0, metadata !98, null}
!767 = metadata !{i32 17, i32 0, metadata !98, null}
!768 = metadata !{metadata !"omnipotent char", metadata !769}
!769 = metadata !{metadata !"Simple C/C++ TBAA"}
!770 = metadata !{i32 18, i32 0, metadata !98, null}
!771 = metadata !{i32 14, i32 0, metadata !134, null}
!772 = metadata !{i32 15, i32 0, metadata !134, null}
!773 = metadata !{i32 16, i32 0, metadata !134, null}
!774 = metadata !{i32 26, i32 0, metadata !775, null}
!775 = metadata !{i32 786443, metadata !224, i32 25, i32 0, metadata !225, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!776 = metadata !{i32 30, i32 0, metadata !777, null}
!777 = metadata !{i32 786443, metadata !253, i32 29, i32 0, metadata !225, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!778 = metadata !{i32 31, i32 0, metadata !777, null}
!779 = metadata !{i32 35, i32 0, metadata !780, null}
!780 = metadata !{i32 786443, metadata !259, i32 34, i32 0, metadata !225, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!781 = metadata !{i32 36, i32 0, metadata !780, null}
!782 = metadata !{i32 40, i32 0, metadata !783, null}
!783 = metadata !{i32 786443, metadata !265, i32 39, i32 0, metadata !225, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!784 = metadata !{i32 41, i32 0, metadata !783, null}
!785 = metadata !{i32 45, i32 0, metadata !786, null}
!786 = metadata !{i32 786443, metadata !269, i32 44, i32 0, metadata !225, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!787 = metadata !{i32 49, i32 0, metadata !788, null}
!788 = metadata !{i32 786443, metadata !277, i32 48, i32 0, metadata !225, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!789 = metadata !{i32 53, i32 0, metadata !790, null}
!790 = metadata !{i32 786443, metadata !285, i32 52, i32 0, metadata !225, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!791 = metadata !{i32 57, i32 0, metadata !792, null}
!792 = metadata !{i32 786443, metadata !293, i32 56, i32 0, metadata !225, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!793 = metadata !{i32 61, i32 0, metadata !794, null}
!794 = metadata !{i32 786443, metadata !301, i32 60, i32 0, metadata !225, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!795 = metadata !{i32 65, i32 0, metadata !796, null}
!796 = metadata !{i32 786443, metadata !308, i32 64, i32 0, metadata !225, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!797 = metadata !{i32 69, i32 0, metadata !798, null}
!798 = metadata !{i32 786443, metadata !316, i32 68, i32 0, metadata !225, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!799 = metadata !{i32 73, i32 0, metadata !800, null}
!800 = metadata !{i32 786443, metadata !320, i32 72, i32 0, metadata !225, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!801 = metadata !{i32 74, i32 0, metadata !800, null}
!802 = metadata !{metadata !"any pointer", metadata !768}
!803 = metadata !{i32 75, i32 0, metadata !800, null}
!804 = metadata !{i32 77, i32 0, metadata !800, null}
!805 = metadata !{i32 81, i32 0, metadata !806, null}
!806 = metadata !{i32 786443, metadata !327, i32 80, i32 0, metadata !225, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!807 = metadata !{i32 86, i32 0, metadata !808, null}
!808 = metadata !{i32 786443, metadata !341, i32 85, i32 0, metadata !225, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!809 = metadata !{i32 91, i32 0, metadata !810, null}
!810 = metadata !{i32 786443, metadata !351, i32 90, i32 0, metadata !225, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!811 = metadata !{i32 95, i32 0, metadata !812, null}
!812 = metadata !{i32 786443, metadata !361, i32 94, i32 0, metadata !225, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!813 = metadata !{i32 96, i32 0, metadata !812, null}
!814 = metadata !{i32 97, i32 0, metadata !812, null}
!815 = metadata !{i32 99, i32 0, metadata !812, null}
!816 = metadata !{i32 103, i32 0, metadata !817, null}
!817 = metadata !{i32 786443, metadata !366, i32 102, i32 0, metadata !225, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!818 = metadata !{i32 108, i32 0, metadata !819, null}
!819 = metadata !{i32 786443, metadata !375, i32 106, i32 0, metadata !225, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!820 = metadata !{i32 113, i32 0, metadata !821, null}
!821 = metadata !{i32 786443, metadata !384, i32 112, i32 0, metadata !225, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!822 = metadata !{i32 119, i32 0, metadata !823, null}
!823 = metadata !{i32 786443, metadata !396, i32 118, i32 0, metadata !225, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!824 = metadata !{i32 125, i32 0, metadata !825, null}
!825 = metadata !{i32 786443, metadata !410, i32 124, i32 0, metadata !225, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!826 = metadata !{i32 131, i32 0, metadata !827, null}
!827 = metadata !{i32 786443, metadata !426, i32 130, i32 0, metadata !225, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!828 = metadata !{i32 137, i32 0, metadata !829, null}
!829 = metadata !{i32 786443, metadata !439, i32 136, i32 0, metadata !225, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!830 = metadata !{i32 143, i32 0, metadata !831, null}
!831 = metadata !{i32 786443, metadata !453, i32 142, i32 0, metadata !225, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!832 = metadata !{i32 149, i32 0, metadata !833, null}
!833 = metadata !{i32 786443, metadata !466, i32 148, i32 0, metadata !225, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!834 = metadata !{i32 153, i32 0, metadata !835, null}
!835 = metadata !{i32 786443, metadata !480, i32 152, i32 0, metadata !225, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!836 = metadata !{i32 157, i32 0, metadata !837, null}
!837 = metadata !{i32 786443, metadata !504, i32 156, i32 0, metadata !225, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!838 = metadata !{i32 161, i32 0, metadata !839, null}
!839 = metadata !{i32 786443, metadata !511, i32 160, i32 0, metadata !225, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!840 = metadata !{i32 165, i32 0, metadata !841, null}
!841 = metadata !{i32 786443, metadata !530, i32 164, i32 0, metadata !225, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!842 = metadata !{i32 171, i32 0, metadata !843, null}
!843 = metadata !{i32 786443, metadata !537, i32 170, i32 0, metadata !225, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!844 = metadata !{i32 176, i32 0, metadata !845, null}
!845 = metadata !{i32 786443, metadata !550, i32 175, i32 0, metadata !225, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!846 = metadata !{i32 181, i32 0, metadata !847, null}
!847 = metadata !{i32 786443, metadata !560, i32 180, i32 0, metadata !225, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!848 = metadata !{i32 187, i32 0, metadata !849, null}
!849 = metadata !{i32 786443, metadata !571, i32 186, i32 0, metadata !225, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!850 = metadata !{i32 192, i32 0, metadata !851, null}
!851 = metadata !{i32 786443, metadata !583, i32 191, i32 0, metadata !225, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!852 = metadata !{i32 198, i32 0, metadata !853, null}
!853 = metadata !{i32 786443, metadata !593, i32 197, i32 0, metadata !225, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!854 = metadata !{i32 203, i32 0, metadata !855, null}
!855 = metadata !{i32 786443, metadata !604, i32 201, i32 0, metadata !225, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!856 = metadata !{i32 209, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !614, i32 207, i32 0, metadata !225, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!858 = metadata !{i32 214, i32 0, metadata !859, null}
!859 = metadata !{i32 786443, metadata !625, i32 213, i32 0, metadata !225, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!860 = metadata !{i32 220, i32 0, metadata !861, null}
!861 = metadata !{i32 786443, metadata !636, i32 219, i32 0, metadata !225, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!862 = metadata !{i32 225, i32 0, metadata !863, null}
!863 = metadata !{i32 786443, metadata !648, i32 224, i32 0, metadata !225, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!864 = metadata !{i32 226, i32 0, metadata !863, null}
!865 = metadata !{i32 231, i32 0, metadata !866, null}
!866 = metadata !{i32 786443, metadata !658, i32 230, i32 0, metadata !225, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!867 = metadata !{i32 235, i32 0, metadata !868, null}
!868 = metadata !{i32 786443, metadata !669, i32 234, i32 0, metadata !225, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!869 = metadata !{i32 239, i32 0, metadata !870, null}
!870 = metadata !{i32 786443, metadata !676, i32 238, i32 0, metadata !225, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!871 = metadata !{i32 240, i32 0, metadata !870, null}
!872 = metadata !{i32 245, i32 0, metadata !873, null}
!873 = metadata !{i32 786443, metadata !684, i32 244, i32 0, metadata !225, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!874 = metadata !{i32 250, i32 0, metadata !875, null}
!875 = metadata !{i32 786443, metadata !694, i32 249, i32 0, metadata !225, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!876 = metadata !{i32 255, i32 0, metadata !877, null}
!877 = metadata !{i32 786443, metadata !705, i32 254, i32 0, metadata !225, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!878 = metadata !{i32 260, i32 0, metadata !879, null}
!879 = metadata !{i32 786443, metadata !713, i32 259, i32 0, metadata !225, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!880 = metadata !{i32 264, i32 0, metadata !881, null}
!881 = metadata !{i32 786443, metadata !722, i32 263, i32 0, metadata !225, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
