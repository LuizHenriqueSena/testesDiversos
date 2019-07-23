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
@.str = private unnamed_addr constant [19 x i8] c"A[t]==0 || A[t]==1\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define void @_Z9race_testPjPi(i32* %i, i32* %A) uwtable noinline {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %tid = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %i, i32** %1, align 8
  store i32* %A, i32** %2, align 8
  %3 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !723
  store i32 %3, i32* %tid, align 4, !dbg !723
  %4 = load i32** %1, align 8, !dbg !725
  %5 = call i32 @_ZL9atomicAddPjj(i32* %4, i32 1), !dbg !725
  store i32 %5, i32* %j, align 4, !dbg !725
  %6 = load i32* %tid, align 4, !dbg !726
  %7 = load i32* %j, align 4, !dbg !726
  %8 = sext i32 %7 to i64, !dbg !726
  %9 = load i32** %2, align 8, !dbg !726
  %10 = getelementptr inbounds i32* %9, i64 %8, !dbg !726
  store i32 %6, i32* %10, align 4, !dbg !726
  ret void, !dbg !727
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define internal i32 @_ZL9atomicAddPjj(i32* %address, i32 %val) uwtable inlinehint section "__device__" {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %address, i32** %1, align 8
  store i32 %val, i32* %2, align 4
  %3 = load i32** %1, align 8, !dbg !728
  %4 = load i32* %2, align 4, !dbg !728
  %5 = call i32 @__uAtomicAdd(i32* %3, i32 %4), !dbg !728
  ret i32 %5, !dbg !728
}

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %i = alloca i32*, align 8
  %A = alloca i32*, align 8
  %dev_i = alloca i32*, align 8
  %dev_A = alloca i32*, align 8
  %t = alloca i32, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %t1 = alloca i32, align 4
  store i32 0, i32* %1
  %6 = call noalias i8* @malloc(i64 8) nounwind, !dbg !730
  %7 = bitcast i8* %6 to i32*, !dbg !730
  store i32* %7, i32** %A, align 8, !dbg !730
  %8 = call noalias i8* @malloc(i64 4) nounwind, !dbg !732
  %9 = bitcast i8* %8 to i32*, !dbg !732
  store i32* %9, i32** %i, align 8, !dbg !732
  store i32 0, i32* %t, align 4, !dbg !733
  br label %10, !dbg !733

; <label>:10                                      ; preds = %13, %0
  %11 = load i32* %t, align 4, !dbg !733
  %12 = icmp slt i32 %11, 2, !dbg !733
  br i1 %12, label %13, label %20, !dbg !733

; <label>:13                                      ; preds = %10
  %14 = load i32** %A, align 8, !dbg !735
  %15 = load i32* %t, align 4, !dbg !735
  %16 = sext i32 %15 to i64, !dbg !735
  %17 = getelementptr inbounds i32* %14, i64 %16, !dbg !735
  store i32 4, i32* %17, align 4, !dbg !735
  %18 = load i32* %t, align 4, !dbg !733
  %19 = add nsw i32 %18, 1, !dbg !733
  store i32 %19, i32* %t, align 4, !dbg !733
  br label %10, !dbg !733

; <label>:20                                      ; preds = %10
  %21 = bitcast i32** %dev_A to i8**, !dbg !736
  %22 = call i32 @cudaMalloc(i8** %21, i64 8), !dbg !736
  %23 = bitcast i32** %dev_i to i8**, !dbg !737
  %24 = call i32 @cudaMalloc(i8** %23, i64 4), !dbg !737
  %25 = load i32** %dev_A, align 8, !dbg !738
  %26 = bitcast i32* %25 to i8*, !dbg !738
  %27 = load i32** %A, align 8, !dbg !738
  %28 = bitcast i32* %27 to i8*, !dbg !738
  %29 = call i32 @cudaMemcpy(i8* %26, i8* %28, i64 8, i32 1), !dbg !738
  %30 = load i32** %dev_i, align 8, !dbg !739
  %31 = bitcast i32* %30 to i8*, !dbg !739
  %32 = load i32** %i, align 8, !dbg !739
  %33 = bitcast i32* %32 to i8*, !dbg !739
  %34 = call i32 @cudaMemcpy(i8* %31, i8* %33, i64 4, i32 1), !dbg !739
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 2, i32 1, i32 1), !dbg !740
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 1, i32 1, i32 1), !dbg !740
  %35 = bitcast { i64, i32 }* %4 to i8*, !dbg !740
  %36 = bitcast %struct.dim3* %2 to i8*, !dbg !740
  %37 = call i8* @memcpy(i8* %35, i8* %36, i64 12)
  %38 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !740
  %39 = load i64* %38, align 1, !dbg !740
  %40 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !740
  %41 = load i32* %40, align 1, !dbg !740
  %42 = bitcast { i64, i32 }* %5 to i8*, !dbg !740
  %43 = bitcast %struct.dim3* %3 to i8*, !dbg !740
  %44 = call i8* @memcpy(i8* %42, i8* %43, i64 12)
  %45 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !740
  %46 = load i64* %45, align 1, !dbg !740
  %47 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !740
  %48 = load i32* %47, align 1, !dbg !740
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %39, i32 %41, i64 %46, i32 %48), !dbg !740
  %49 = load i32** %dev_i, align 8, !dbg !742
  %50 = load i32** %dev_A, align 8, !dbg !742
  call void @_Z9race_testPjPi(i32* %49, i32* %50), !dbg !742
  %51 = load i32** %A, align 8, !dbg !743
  %52 = bitcast i32* %51 to i8*, !dbg !743
  %53 = load i32** %dev_A, align 8, !dbg !743
  %54 = bitcast i32* %53 to i8*, !dbg !743
  %55 = call i32 @cudaMemcpy(i8* %52, i8* %54, i64 8, i32 2), !dbg !743
  store i32 0, i32* %t1, align 4, !dbg !744
  br label %56, !dbg !744

; <label>:56                                      ; preds = %74, %20
  %57 = load i32* %t1, align 4, !dbg !744
  %58 = icmp slt i32 %57, 2, !dbg !744
  br i1 %58, label %59, label %77, !dbg !744

; <label>:59                                      ; preds = %56
  %60 = load i32* %t1, align 4, !dbg !746
  %61 = sext i32 %60 to i64, !dbg !746
  %62 = load i32** %A, align 8, !dbg !746
  %63 = getelementptr inbounds i32* %62, i64 %61, !dbg !746
  %64 = load i32* %63, align 4, !dbg !746
  %65 = icmp eq i32 %64, 0, !dbg !746
  br i1 %65, label %74, label %66, !dbg !746

; <label>:66                                      ; preds = %59
  %67 = load i32* %t1, align 4, !dbg !746
  %68 = sext i32 %67 to i64, !dbg !746
  %69 = load i32** %A, align 8, !dbg !746
  %70 = getelementptr inbounds i32* %69, i64 %68, !dbg !746
  %71 = load i32* %70, align 4, !dbg !746
  %72 = icmp eq i32 %71, 1, !dbg !746
  br i1 %72, label %74, label %73, !dbg !746

; <label>:73                                      ; preds = %66
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 44, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwin
  unreachable, !dbg !746

; <label>:74                                      ; preds = %66, %59
  %75 = load i32* %t1, align 4, !dbg !744
  %76 = add nsw i32 %75, 1, !dbg !744
  store i32 %76, i32* %t1, align 4, !dbg !744
  br label %56, !dbg !744

; <label>:77                                      ; preds = %56
  %78 = load i32** %A, align 8, !dbg !747
  %79 = bitcast i32* %78 to i8*, !dbg !747
  call void @free(i8* %79) nounwind, !dbg !747
  %80 = load i32** %i, align 8, !dbg !748
  %81 = bitcast i32* %80 to i8*, !dbg !748
  call void @free(i8* %81) nounwind, !dbg !748
  %82 = load i32** %dev_A, align 8, !dbg !749
  %83 = bitcast i32* %82 to i8*, !dbg !749
  %84 = call i32 @cudaFree(i8* %83), !dbg !749
  %85 = load i32** %dev_i, align 8, !dbg !750
  %86 = bitcast i32* %85 to i8*, !dbg !750
  %87 = call i32 @cudaFree(i8* %86), !dbg !750
  ret i32 0, !dbg !751
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
  %6 = load i32* %2, align 4, !dbg !752
  %7 = load i32* %3, align 4, !dbg !752
  %8 = load i32* %4, align 4, !dbg !752
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !752
  ret void, !dbg !752
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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !753
  %7 = load i32* %2, align 4, !dbg !753
  store i32 %7, i32* %6, align 4, !dbg !753
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !753
  %9 = load i32* %3, align 4, !dbg !753
  store i32 %9, i32* %8, align 4, !dbg !753
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !753
  %11 = load i32* %4, align 4, !dbg !753
  store i32 %11, i32* %10, align 4, !dbg !753
  ret void, !dbg !754
}

declare i32 @__uAtomicAdd(i32*, i32) section "__device__"

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !756
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !756

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !756
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !757
  %4 = load i8* %src.06, align 1, !dbg !757, !tbaa !758
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !757
  store i8 %4, i8* %dest.05, align 1, !dbg !757, !tbaa !758
  %6 = icmp eq i64 %2, 0, !dbg !756
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !756

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !760
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !761
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !761

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !762
  br label %3, !dbg !761

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !761
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !762
  store volatile i8 %2, i8* %a.05, align 1, !dbg !762, !tbaa !758
  %6 = icmp eq i64 %4, 0, !dbg !761
  br i1 %6, label %._crit_edge, label %3, !dbg !761

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !763
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !764
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !766
  ret i32 0, !dbg !768
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !769
  tail call void @free(i8* %1) nounwind, !dbg !769
  ret i32 0, !dbg !771
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !772
  ret i32 0, !dbg !774
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !775
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !777
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !779
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !781
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !783
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !785
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !787
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !789
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !791
  store i8* %1, i8** %devPtr, align 8, !dbg !791, !tbaa !792
  tail call void @__clear_device(), !dbg !793
  ret i32 0, !dbg !794
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !795
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !797
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !799
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !801
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !803
  store i8* %1, i8** %ptr, align 8, !dbg !803, !tbaa !792
  tail call void @__clear_host(), !dbg !804
  ret i32 0, !dbg !805
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !806
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !808
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !810
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !812
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !814
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !816
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !818
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !820
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !822
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !824
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !826
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !828
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !830
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !832
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !834
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !836
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !838
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !840
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !842
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !844
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !846
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !848
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !850
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !852
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !854
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !855
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !857
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !859
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !861
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !862
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !864
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !866
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !868
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !870
}

!llvm.dbg.cu = !{!0, !73, !97, !113, !130}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metada
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !23, metadata !26, metadata !68, metadata !69}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"race_test", metadata !"race_test", metadata !"_Z9race_testPjPi", metadata !16, i32 10, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*)* @_Z9race_testPj
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19, metadata !21}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!20 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!21 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!22 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!23 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 17, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 17} ; [ DW_TAG_
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !22}
!26 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !27, i32 419, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!27 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail", null} ; [ DW_TAG_file_type ]
!28 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{null, metadata !30, metadata !20, metadata !20, metadata !20}
!30 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!31 = metadata !{i32 786451, null, metadata !"dim3", metadata !27, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !32, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!32 = metadata !{metadata !33, metadata !34, metadata !35, metadata !36, metadata !39, metadata !57, metadata !60, metadata !65}
!33 = metadata !{i32 786445, metadata !31, metadata !"x", metadata !27, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!34 = metadata !{i32 786445, metadata !31, metadata !"y", metadata !27, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !20} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!35 = metadata !{i32 786445, metadata !31, metadata !"z", metadata !27, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!36 = metadata !{i32 786478, i32 0, metadata !31, metadata !"dim3", metadata !"dim3", metadata !"", metadata !27, i32 419, metadata !28, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !37, i32 419} ; [ DW_TAG_subpr
!37 = metadata !{metadata !38}
!38 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!39 = metadata !{i32 786478, i32 0, metadata !31, metadata !"dim3", metadata !"dim3", metadata !"", metadata !27, i32 420, metadata !40, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !37, i32 420} ; [ DW_TAG_subpr
!40 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{null, metadata !30, metadata !42}
!42 = metadata !{i32 786454, null, metadata !"uint3", metadata !27, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!43 = metadata !{i32 786451, null, metadata !"uint3", metadata !27, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !44, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!44 = metadata !{metadata !45, metadata !46, metadata !47, metadata !48, metadata !52}
!45 = metadata !{i32 786445, metadata !43, metadata !"x", metadata !27, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!46 = metadata !{i32 786445, metadata !43, metadata !"y", metadata !27, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !20} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!47 = metadata !{i32 786445, metadata !43, metadata !"z", metadata !27, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!48 = metadata !{i32 786478, i32 0, metadata !43, metadata !"uint3", metadata !"uint3", metadata !"", metadata !27, i32 188, metadata !49, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !37, i32 188} ; [ DW_TAG_sub
!49 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = metadata !{null, metadata !51}
!51 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !43} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!52 = metadata !{i32 786478, i32 0, metadata !43, metadata !"uint3", metadata !"uint3", metadata !"", metadata !27, i32 188, metadata !53, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !37, i32 188} ; [ DW_TAG_sub
!53 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = metadata !{null, metadata !51, metadata !55}
!55 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !56} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!57 = metadata !{i32 786478, i32 0, metadata !31, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !27, i32 421, metadata !58, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!58 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = metadata !{metadata !42, metadata !30}
!60 = metadata !{i32 786478, i32 0, metadata !31, metadata !"dim3", metadata !"dim3", metadata !"", metadata !27, i32 415, metadata !61, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !37, i32 415} ; [ DW_TAG_subpr
!61 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !62, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = metadata !{null, metadata !30, metadata !63}
!63 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!65 = metadata !{i32 786478, i32 0, metadata !31, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !27, i32 415, metadata !66, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !37, i32 415} ; [ DW_TAG_sub
!66 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !67, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = metadata !{null, metadata !30}
!68 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !27, i32 419, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!69 = metadata !{i32 786478, i32 0, metadata !70, metadata !"atomicAdd", metadata !"atomicAdd", metadata !"_ZL9atomicAddPjj", metadata !70, i32 101, metadata !71, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*, i32)* @_ZL9atomicAddPjj
!70 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/sm_11_atomic_functions.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail", null} ; [ DW_TAG_file_type ]
!71 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !72, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = metadata !{metadata !20, metadata !19, metadata !20}
!73 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!74 = metadata !{metadata !75}
!75 = metadata !{metadata !76}
!76 = metadata !{i32 786478, i32 0, metadata !77, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !77, i32 12, metadata !78, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !85, i
!77 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!78 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !79, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = metadata !{metadata !80, metadata !80, metadata !81, metadata !83}
!80 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!81 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!82 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!83 = metadata !{i32 786454, null, metadata !"size_t", metadata !77, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!84 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!85 = metadata !{metadata !86}
!86 = metadata !{metadata !87, metadata !88, metadata !89, metadata !90, metadata !94}
!87 = metadata !{i32 786689, metadata !76, metadata !"destaddr", metadata !77, i32 16777228, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!88 = metadata !{i32 786689, metadata !76, metadata !"srcaddr", metadata !77, i32 33554444, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!89 = metadata !{i32 786689, metadata !76, metadata !"len", metadata !77, i32 50331660, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!90 = metadata !{i32 786688, metadata !91, metadata !"dest", metadata !77, i32 13, metadata !92, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!91 = metadata !{i32 786443, metadata !76, i32 12, i32 0, metadata !77, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!92 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !93} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!93 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!94 = metadata !{i32 786688, metadata !91, metadata !"src", metadata !77, i32 14, metadata !95, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!95 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !96} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!96 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !93} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!97 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!98 = metadata !{metadata !99}
!99 = metadata !{metadata !100}
!100 = metadata !{i32 786478, i32 0, metadata !101, metadata !"memmove", metadata !"memmove", metadata !"", metadata !101, i32 12, metadata !102, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !105, i32 12} ; [ DW_TAG
!101 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!102 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !103, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!103 = metadata !{metadata !80, metadata !80, metadata !81, metadata !104}
!104 = metadata !{i32 786454, null, metadata !"size_t", metadata !101, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!105 = metadata !{metadata !106}
!106 = metadata !{metadata !107, metadata !108, metadata !109, metadata !110, metadata !112}
!107 = metadata !{i32 786689, metadata !100, metadata !"dst", metadata !101, i32 16777228, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!108 = metadata !{i32 786689, metadata !100, metadata !"src", metadata !101, i32 33554444, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!109 = metadata !{i32 786689, metadata !100, metadata !"count", metadata !101, i32 50331660, metadata !104, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!110 = metadata !{i32 786688, metadata !111, metadata !"a", metadata !101, i32 14, metadata !92, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!111 = metadata !{i32 786443, metadata !100, i32 12, i32 0, metadata !101, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!112 = metadata !{i32 786688, metadata !111, metadata !"b", metadata !101, i32 15, metadata !95, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!113 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!114 = metadata !{metadata !115}
!115 = metadata !{metadata !116}
!116 = metadata !{i32 786478, i32 0, metadata !117, metadata !"memset", metadata !"memset", metadata !"", metadata !117, i32 12, metadata !118, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!117 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!118 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !119, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!119 = metadata !{metadata !80, metadata !80, metadata !22, metadata !120}
!120 = metadata !{i32 786454, null, metadata !"size_t", metadata !117, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!121 = metadata !{metadata !122}
!122 = metadata !{metadata !123, metadata !124, metadata !125, metadata !126}
!123 = metadata !{i32 786689, metadata !116, metadata !"dst", metadata !117, i32 16777228, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!124 = metadata !{i32 786689, metadata !116, metadata !"s", metadata !117, i32 33554444, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!125 = metadata !{i32 786689, metadata !116, metadata !"count", metadata !117, i32 50331660, metadata !120, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!126 = metadata !{i32 786688, metadata !127, metadata !"a", metadata !117, i32 13, metadata !128, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!127 = metadata !{i32 786443, metadata !116, i32 12, i32 0, metadata !117, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!128 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !129} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!129 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !93} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!130 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!131 = metadata !{metadata !132}
!132 = metadata !{metadata !133, metadata !208, metadata !214}
!133 = metadata !{i32 786436, null, metadata !"cudaError", metadata !134, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !135, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!134 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!135 = metadata !{metadata !136, metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !149, metadata !150, metadata !1
!136 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!137 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!138 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!139 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!140 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!141 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!142 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!143 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!144 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!145 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!146 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!147 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!148 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!149 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!150 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!151 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!152 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!153 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!154 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!155 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!156 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!157 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!158 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!159 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!160 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!161 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!162 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!163 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!164 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!165 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!166 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!167 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!168 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!169 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!170 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!171 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!172 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!173 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!174 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!175 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!176 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!177 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!178 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!179 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!180 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!181 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!182 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!183 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!184 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!185 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!186 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!187 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!188 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!189 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!190 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!191 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!192 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!193 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!194 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!195 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!196 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!197 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!198 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!199 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!200 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!201 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!202 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!203 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!204 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!205 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!206 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!207 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!208 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !134, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !209, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!209 = metadata !{metadata !210, metadata !211, metadata !212, metadata !213}
!210 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!211 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!212 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!213 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!214 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !134, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!215 = metadata !{metadata !216}
!216 = metadata !{metadata !217, metadata !245, metadata !251, metadata !257, metadata !261, metadata !269, metadata !277, metadata !285, metadata !293, metadata !300, metadata !308, metadata !312, metadata !319, metadata !333, metadata !343, metadata !3
!217 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !218, i32 24, metadata !219, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!218 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!219 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !220, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!220 = metadata !{metadata !221, metadata !222, metadata !230, metadata !19, metadata !237}
!221 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !218, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !133} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!222 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !223} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!223 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !134, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !224, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!224 = metadata !{metadata !225, metadata !226, metadata !227, metadata !228, metadata !229}
!225 = metadata !{i32 786445, metadata !223, metadata !"x", metadata !134, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !22} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!226 = metadata !{i32 786445, metadata !223, metadata !"y", metadata !134, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !22} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!227 = metadata !{i32 786445, metadata !223, metadata !"z", metadata !134, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !22} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!228 = metadata !{i32 786445, metadata !223, metadata !"w", metadata !134, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !22} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!229 = metadata !{i32 786445, metadata !223, metadata !"f", metadata !134, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !208} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!230 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !231} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!231 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !134, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !232, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!232 = metadata !{metadata !233, metadata !235, metadata !236}
!233 = metadata !{i32 786445, metadata !231, metadata !"width", metadata !134, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !234} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!234 = metadata !{i32 786454, null, metadata !"size_t", metadata !134, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!235 = metadata !{i32 786445, metadata !231, metadata !"height", metadata !134, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !234} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!236 = metadata !{i32 786445, metadata !231, metadata !"depth", metadata !134, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !234} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!237 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !238} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!238 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !134, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!239 = metadata !{metadata !240}
!240 = metadata !{metadata !241, metadata !242, metadata !243, metadata !244}
!241 = metadata !{i32 786689, metadata !217, metadata !"desc", metadata !218, i32 16777240, metadata !222, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!242 = metadata !{i32 786689, metadata !217, metadata !"extent", metadata !218, i32 33554456, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!243 = metadata !{i32 786689, metadata !217, metadata !"flags", metadata !218, i32 50331673, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!244 = metadata !{i32 786689, metadata !217, metadata !"array", metadata !218, i32 67108889, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!245 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !218, i32 29, metadata !246, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !248, 
!246 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !247, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!247 = metadata !{metadata !221, metadata !80}
!248 = metadata !{metadata !249}
!249 = metadata !{metadata !250}
!250 = metadata !{i32 786689, metadata !245, metadata !"devPtr", metadata !218, i32 16777245, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!251 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !218, i32 34, metadata !252, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!252 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !253, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!253 = metadata !{metadata !221, metadata !237}
!254 = metadata !{metadata !255}
!255 = metadata !{metadata !256}
!256 = metadata !{i32 786689, metadata !251, metadata !"array", metadata !218, i32 16777250, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!257 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !218, i32 39, metadata !246, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!258 = metadata !{metadata !259}
!259 = metadata !{metadata !260}
!260 = metadata !{i32 786689, metadata !257, metadata !"ptr", metadata !218, i32 16777255, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!261 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !218, i32 44, metadata !262, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!262 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !263, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!263 = metadata !{metadata !221, metadata !264, metadata !95}
!264 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!265 = metadata !{metadata !266}
!266 = metadata !{metadata !267, metadata !268}
!267 = metadata !{i32 786689, metadata !261, metadata !"devPtr", metadata !218, i32 16777260, metadata !264, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!268 = metadata !{i32 786689, metadata !261, metadata !"symbol", metadata !218, i32 33554476, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!269 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !218, i32 48, metadata !270, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!270 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !271, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!271 = metadata !{metadata !221, metadata !272, metadata !95}
!272 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !234} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!273 = metadata !{metadata !274}
!274 = metadata !{metadata !275, metadata !276}
!275 = metadata !{i32 786689, metadata !269, metadata !"size", metadata !218, i32 16777264, metadata !272, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!276 = metadata !{i32 786689, metadata !269, metadata !"symbol", metadata !218, i32 33554480, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!277 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !218, i32 52, metadata !278, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!278 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !279, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!279 = metadata !{metadata !221, metadata !264, metadata !234, metadata !20}
!280 = metadata !{metadata !281}
!281 = metadata !{metadata !282, metadata !283, metadata !284}
!282 = metadata !{i32 786689, metadata !277, metadata !"pHost", metadata !218, i32 16777268, metadata !264, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!283 = metadata !{i32 786689, metadata !277, metadata !"size", metadata !218, i32 33554484, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!284 = metadata !{i32 786689, metadata !277, metadata !"flags", metadata !218, i32 50331700, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!285 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !218, i32 56, metadata !286, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!286 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !287, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!287 = metadata !{metadata !221, metadata !264, metadata !80, metadata !20}
!288 = metadata !{metadata !289}
!289 = metadata !{metadata !290, metadata !291, metadata !292}
!290 = metadata !{i32 786689, metadata !285, metadata !"pDevice", metadata !218, i32 16777272, metadata !264, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!291 = metadata !{i32 786689, metadata !285, metadata !"pHost", metadata !218, i32 33554488, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!292 = metadata !{i32 786689, metadata !285, metadata !"flags", metadata !218, i32 50331704, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!293 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !218, i32 60, metadata !294, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!294 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !295, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!295 = metadata !{metadata !221, metadata !19, metadata !80}
!296 = metadata !{metadata !297}
!297 = metadata !{metadata !298, metadata !299}
!298 = metadata !{i32 786689, metadata !293, metadata !"pFlags", metadata !218, i32 16777276, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!299 = metadata !{i32 786689, metadata !293, metadata !"pHost", metadata !218, i32 33554492, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!300 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !218, i32 64, metadata !301, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!301 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !302, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!302 = metadata !{metadata !221, metadata !80, metadata !234, metadata !20}
!303 = metadata !{metadata !304}
!304 = metadata !{metadata !305, metadata !306, metadata !307}
!305 = metadata !{i32 786689, metadata !300, metadata !"ptr", metadata !218, i32 16777280, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!306 = metadata !{i32 786689, metadata !300, metadata !"size", metadata !218, i32 33554496, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!307 = metadata !{i32 786689, metadata !300, metadata !"flags", metadata !218, i32 50331712, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!308 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !218, i32 68, metadata !246, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!309 = metadata !{metadata !310}
!310 = metadata !{metadata !311}
!311 = metadata !{i32 786689, metadata !308, metadata !"ptr", metadata !218, i32 16777284, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!312 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !218, i32 72, metadata !313, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!313 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !314, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!314 = metadata !{metadata !221, metadata !264, metadata !234}
!315 = metadata !{metadata !316}
!316 = metadata !{metadata !317, metadata !318}
!317 = metadata !{i32 786689, metadata !312, metadata !"devPtr", metadata !218, i32 16777288, metadata !264, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!318 = metadata !{i32 786689, metadata !312, metadata !"size", metadata !218, i32 33554504, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!319 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !218, i32 80, metadata !320, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!320 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !321, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!321 = metadata !{metadata !221, metadata !322, metadata !231}
!322 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !323} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!323 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !134, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !324, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!324 = metadata !{metadata !325, metadata !326, metadata !327, metadata !328}
!325 = metadata !{i32 786445, metadata !323, metadata !"ptr", metadata !134, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!326 = metadata !{i32 786445, metadata !323, metadata !"pitch", metadata !134, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !234} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!327 = metadata !{i32 786445, metadata !323, metadata !"xsize", metadata !134, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !234} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!328 = metadata !{i32 786445, metadata !323, metadata !"ysize", metadata !134, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !234} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!329 = metadata !{metadata !330}
!330 = metadata !{metadata !331, metadata !332}
!331 = metadata !{i32 786689, metadata !319, metadata !"pitchedDevPtr", metadata !218, i32 16777296, metadata !322, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!332 = metadata !{i32 786689, metadata !319, metadata !"extent", metadata !218, i32 33554512, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!333 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !218, i32 84, metadata !334, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!334 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !335, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!335 = metadata !{metadata !221, metadata !336, metadata !222, metadata !231, metadata !20}
!336 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !237} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!337 = metadata !{metadata !338}
!338 = metadata !{metadata !339, metadata !340, metadata !341, metadata !342}
!339 = metadata !{i32 786689, metadata !333, metadata !"array", metadata !218, i32 16777300, metadata !336, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!340 = metadata !{i32 786689, metadata !333, metadata !"desc", metadata !218, i32 33554516, metadata !222, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!341 = metadata !{i32 786689, metadata !333, metadata !"extent", metadata !218, i32 50331733, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!342 = metadata !{i32 786689, metadata !333, metadata !"flags", metadata !218, i32 67108949, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!343 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !218, i32 89, metadata !344, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!344 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !345, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!345 = metadata !{metadata !221, metadata !336, metadata !222, metadata !234, metadata !234, metadata !20}
!346 = metadata !{metadata !347}
!347 = metadata !{metadata !348, metadata !349, metadata !350, metadata !351, metadata !352}
!348 = metadata !{i32 786689, metadata !343, metadata !"array", metadata !218, i32 16777305, metadata !336, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!349 = metadata !{i32 786689, metadata !343, metadata !"desc", metadata !218, i32 33554521, metadata !222, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!350 = metadata !{i32 786689, metadata !343, metadata !"width", metadata !218, i32 50331738, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!351 = metadata !{i32 786689, metadata !343, metadata !"height", metadata !218, i32 67108954, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!352 = metadata !{i32 786689, metadata !343, metadata !"flags", metadata !218, i32 83886170, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!353 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !218, i32 94, metadata !313, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!354 = metadata !{metadata !355}
!355 = metadata !{metadata !356, metadata !357}
!356 = metadata !{i32 786689, metadata !353, metadata !"ptr", metadata !218, i32 16777310, metadata !264, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!357 = metadata !{i32 786689, metadata !353, metadata !"size", metadata !218, i32 33554526, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!358 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !218, i32 102, metadata !359, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!359 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !360, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!360 = metadata !{metadata !221, metadata !264, metadata !272, metadata !234, metadata !234}
!361 = metadata !{metadata !362}
!362 = metadata !{metadata !363, metadata !364, metadata !365, metadata !366}
!363 = metadata !{i32 786689, metadata !358, metadata !"devPtr", metadata !218, i32 16777318, metadata !264, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!364 = metadata !{i32 786689, metadata !358, metadata !"pitch", metadata !218, i32 33554534, metadata !272, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!365 = metadata !{i32 786689, metadata !358, metadata !"width", metadata !218, i32 50331750, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!366 = metadata !{i32 786689, metadata !358, metadata !"height", metadata !218, i32 67108966, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!367 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !218, i32 106, metadata !368, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!368 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !369, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!369 = metadata !{metadata !221, metadata !80, metadata !81, metadata !234, metadata !214}
!370 = metadata !{metadata !371}
!371 = metadata !{metadata !372, metadata !373, metadata !374, metadata !375}
!372 = metadata !{i32 786689, metadata !367, metadata !"dst", metadata !218, i32 16777322, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!373 = metadata !{i32 786689, metadata !367, metadata !"src", metadata !218, i32 33554538, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!374 = metadata !{i32 786689, metadata !367, metadata !"count", metadata !218, i32 50331754, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!375 = metadata !{i32 786689, metadata !367, metadata !"kind", metadata !218, i32 67108970, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!376 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !218, i32 111, metadata !377, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!377 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !378, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!378 = metadata !{metadata !221, metadata !80, metadata !234, metadata !81, metadata !234, metadata !234, metadata !234, metadata !214}
!379 = metadata !{metadata !380}
!380 = metadata !{metadata !381, metadata !382, metadata !383, metadata !384, metadata !385, metadata !386, metadata !387}
!381 = metadata !{i32 786689, metadata !376, metadata !"dst", metadata !218, i32 16777327, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!382 = metadata !{i32 786689, metadata !376, metadata !"dpitch", metadata !218, i32 33554543, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!383 = metadata !{i32 786689, metadata !376, metadata !"src", metadata !218, i32 50331759, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!384 = metadata !{i32 786689, metadata !376, metadata !"spitch", metadata !218, i32 67108975, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!385 = metadata !{i32 786689, metadata !376, metadata !"width", metadata !218, i32 83886192, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!386 = metadata !{i32 786689, metadata !376, metadata !"height", metadata !218, i32 100663408, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!387 = metadata !{i32 786689, metadata !376, metadata !"kind", metadata !218, i32 117440624, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!388 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !218, i32 116, metadata !389, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!389 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !390, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!390 = metadata !{metadata !221, metadata !237, metadata !234, metadata !234, metadata !237, metadata !234, metadata !234, metadata !234, metadata !234, metadata !214}
!391 = metadata !{metadata !392}
!392 = metadata !{metadata !393, metadata !394, metadata !395, metadata !396, metadata !397, metadata !398, metadata !399, metadata !400, metadata !401}
!393 = metadata !{i32 786689, metadata !388, metadata !"dst", metadata !218, i32 16777332, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!394 = metadata !{i32 786689, metadata !388, metadata !"wOffsetDst", metadata !218, i32 33554548, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!395 = metadata !{i32 786689, metadata !388, metadata !"hOffsetDst", metadata !218, i32 50331764, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!396 = metadata !{i32 786689, metadata !388, metadata !"src", metadata !218, i32 67108981, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!397 = metadata !{i32 786689, metadata !388, metadata !"wOffsetSrc", metadata !218, i32 83886197, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!398 = metadata !{i32 786689, metadata !388, metadata !"hOffsetSrc", metadata !218, i32 100663413, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!399 = metadata !{i32 786689, metadata !388, metadata !"width", metadata !218, i32 117440630, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!400 = metadata !{i32 786689, metadata !388, metadata !"height", metadata !218, i32 134217846, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!401 = metadata !{i32 786689, metadata !388, metadata !"kind", metadata !218, i32 150995062, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!402 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !218, i32 122, metadata !403, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!403 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !404, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!404 = metadata !{metadata !221, metadata !80, metadata !234, metadata !81, metadata !234, metadata !234, metadata !234, metadata !214, metadata !405}
!405 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !218, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !406} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!406 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !407} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!407 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !134, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!408 = metadata !{metadata !409}
!409 = metadata !{metadata !410, metadata !411, metadata !412, metadata !413, metadata !414, metadata !415, metadata !416, metadata !417}
!410 = metadata !{i32 786689, metadata !402, metadata !"dst", metadata !218, i32 16777338, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!411 = metadata !{i32 786689, metadata !402, metadata !"dpitch", metadata !218, i32 33554554, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!412 = metadata !{i32 786689, metadata !402, metadata !"src", metadata !218, i32 50331770, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!413 = metadata !{i32 786689, metadata !402, metadata !"spitch", metadata !218, i32 67108986, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!414 = metadata !{i32 786689, metadata !402, metadata !"width", metadata !218, i32 83886203, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!415 = metadata !{i32 786689, metadata !402, metadata !"height", metadata !218, i32 100663419, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!416 = metadata !{i32 786689, metadata !402, metadata !"kind", metadata !218, i32 117440635, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!417 = metadata !{i32 786689, metadata !402, metadata !"stream", metadata !218, i32 134217852, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!418 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !218, i32 128, metadata !419, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!419 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !420, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!420 = metadata !{metadata !221, metadata !80, metadata !234, metadata !237, metadata !234, metadata !234, metadata !234, metadata !234, metadata !214}
!421 = metadata !{metadata !422}
!422 = metadata !{metadata !423, metadata !424, metadata !425, metadata !426, metadata !427, metadata !428, metadata !429, metadata !430}
!423 = metadata !{i32 786689, metadata !418, metadata !"dst", metadata !218, i32 16777344, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!424 = metadata !{i32 786689, metadata !418, metadata !"dpitch", metadata !218, i32 33554560, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!425 = metadata !{i32 786689, metadata !418, metadata !"src", metadata !218, i32 50331776, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!426 = metadata !{i32 786689, metadata !418, metadata !"wOffset", metadata !218, i32 67108993, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!427 = metadata !{i32 786689, metadata !418, metadata !"hOffset", metadata !218, i32 83886209, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!428 = metadata !{i32 786689, metadata !418, metadata !"width", metadata !218, i32 100663425, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!429 = metadata !{i32 786689, metadata !418, metadata !"height", metadata !218, i32 117440641, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!430 = metadata !{i32 786689, metadata !418, metadata !"kind", metadata !218, i32 134217858, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!431 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !218, i32 134, metadata !432, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!432 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !433, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!433 = metadata !{metadata !221, metadata !80, metadata !234, metadata !237, metadata !234, metadata !234, metadata !234, metadata !234, metadata !214, metadata !405}
!434 = metadata !{metadata !435}
!435 = metadata !{metadata !436, metadata !437, metadata !438, metadata !439, metadata !440, metadata !441, metadata !442, metadata !443, metadata !444}
!436 = metadata !{i32 786689, metadata !431, metadata !"dst", metadata !218, i32 16777350, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!437 = metadata !{i32 786689, metadata !431, metadata !"dpitch", metadata !218, i32 33554566, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!438 = metadata !{i32 786689, metadata !431, metadata !"src", metadata !218, i32 50331782, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!439 = metadata !{i32 786689, metadata !431, metadata !"wOffset", metadata !218, i32 67108999, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!440 = metadata !{i32 786689, metadata !431, metadata !"hOffset", metadata !218, i32 83886215, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!441 = metadata !{i32 786689, metadata !431, metadata !"width", metadata !218, i32 100663431, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!442 = metadata !{i32 786689, metadata !431, metadata !"height", metadata !218, i32 117440647, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!443 = metadata !{i32 786689, metadata !431, metadata !"kind", metadata !218, i32 134217864, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!444 = metadata !{i32 786689, metadata !431, metadata !"stream", metadata !218, i32 150995080, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!445 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !218, i32 140, metadata !446, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!446 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !447, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!447 = metadata !{metadata !221, metadata !237, metadata !234, metadata !234, metadata !81, metadata !234, metadata !234, metadata !234, metadata !214}
!448 = metadata !{metadata !449}
!449 = metadata !{metadata !450, metadata !451, metadata !452, metadata !453, metadata !454, metadata !455, metadata !456, metadata !457}
!450 = metadata !{i32 786689, metadata !445, metadata !"dst", metadata !218, i32 16777356, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!451 = metadata !{i32 786689, metadata !445, metadata !"wOffset", metadata !218, i32 33554572, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!452 = metadata !{i32 786689, metadata !445, metadata !"hOffset", metadata !218, i32 50331788, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!453 = metadata !{i32 786689, metadata !445, metadata !"src", metadata !218, i32 67109005, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!454 = metadata !{i32 786689, metadata !445, metadata !"spitch", metadata !218, i32 83886221, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!455 = metadata !{i32 786689, metadata !445, metadata !"width", metadata !218, i32 100663437, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!456 = metadata !{i32 786689, metadata !445, metadata !"height", metadata !218, i32 117440653, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!457 = metadata !{i32 786689, metadata !445, metadata !"kind", metadata !218, i32 134217870, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!458 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !218, i32 146, metadata !459, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!459 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !460, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!460 = metadata !{metadata !221, metadata !237, metadata !234, metadata !234, metadata !81, metadata !234, metadata !234, metadata !234, metadata !214, metadata !405}
!461 = metadata !{metadata !462}
!462 = metadata !{metadata !463, metadata !464, metadata !465, metadata !466, metadata !467, metadata !468, metadata !469, metadata !470, metadata !471}
!463 = metadata !{i32 786689, metadata !458, metadata !"dst", metadata !218, i32 16777362, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!464 = metadata !{i32 786689, metadata !458, metadata !"wOffset", metadata !218, i32 33554578, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!465 = metadata !{i32 786689, metadata !458, metadata !"hOffset", metadata !218, i32 50331794, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!466 = metadata !{i32 786689, metadata !458, metadata !"src", metadata !218, i32 67109011, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!467 = metadata !{i32 786689, metadata !458, metadata !"spitch", metadata !218, i32 83886227, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!468 = metadata !{i32 786689, metadata !458, metadata !"width", metadata !218, i32 100663443, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!469 = metadata !{i32 786689, metadata !458, metadata !"height", metadata !218, i32 117440659, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!470 = metadata !{i32 786689, metadata !458, metadata !"kind", metadata !218, i32 134217876, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!471 = metadata !{i32 786689, metadata !458, metadata !"stream", metadata !218, i32 150995092, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!472 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !218, i32 152, metadata !473, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!473 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !474, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!474 = metadata !{metadata !221, metadata !475}
!475 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !476} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!476 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !477} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!477 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !134, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !478, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!478 = metadata !{metadata !479, metadata !481, metadata !487, metadata !488, metadata !489, metadata !490, metadata !491, metadata !492}
!479 = metadata !{i32 786445, metadata !477, metadata !"srcArray", metadata !134, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !480} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!480 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !134, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !237} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!481 = metadata !{i32 786445, metadata !477, metadata !"srcPos", metadata !134, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !482} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!482 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !134, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !483, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!483 = metadata !{metadata !484, metadata !485, metadata !486}
!484 = metadata !{i32 786445, metadata !482, metadata !"x", metadata !134, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !234} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!485 = metadata !{i32 786445, metadata !482, metadata !"y", metadata !134, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !234} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!486 = metadata !{i32 786445, metadata !482, metadata !"z", metadata !134, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !234} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!487 = metadata !{i32 786445, metadata !477, metadata !"srcPtr", metadata !134, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !323} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!488 = metadata !{i32 786445, metadata !477, metadata !"dstArray", metadata !134, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !480} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!489 = metadata !{i32 786445, metadata !477, metadata !"dstPos", metadata !134, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !482} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!490 = metadata !{i32 786445, metadata !477, metadata !"dstPtr", metadata !134, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !323} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!491 = metadata !{i32 786445, metadata !477, metadata !"extent", metadata !134, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !231} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!492 = metadata !{i32 786445, metadata !477, metadata !"kind", metadata !134, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !214} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!493 = metadata !{metadata !494}
!494 = metadata !{metadata !495}
!495 = metadata !{i32 786689, metadata !472, metadata !"p", metadata !218, i32 16777368, metadata !475, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!496 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !218, i32 156, metadata !497, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!497 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !498, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!498 = metadata !{metadata !221, metadata !475, metadata !405}
!499 = metadata !{metadata !500}
!500 = metadata !{metadata !501, metadata !502}
!501 = metadata !{i32 786689, metadata !496, metadata !"p", metadata !218, i32 16777372, metadata !475, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!502 = metadata !{i32 786689, metadata !496, metadata !"stream", metadata !218, i32 33554588, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!503 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !218, i32 160, metadata !504, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!504 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !505, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!505 = metadata !{metadata !221, metadata !506}
!506 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !507} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!507 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !508} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!508 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !134, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !509, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!509 = metadata !{metadata !510, metadata !511, metadata !512, metadata !513, metadata !514, metadata !515, metadata !516, metadata !517, metadata !518}
!510 = metadata !{i32 786445, metadata !508, metadata !"srcArray", metadata !134, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !480} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!511 = metadata !{i32 786445, metadata !508, metadata !"srcPos", metadata !134, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !482} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!512 = metadata !{i32 786445, metadata !508, metadata !"srcPtr", metadata !134, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !323} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!513 = metadata !{i32 786445, metadata !508, metadata !"srcDevice", metadata !134, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !22} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!514 = metadata !{i32 786445, metadata !508, metadata !"dstArray", metadata !134, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !480} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!515 = metadata !{i32 786445, metadata !508, metadata !"dstPos", metadata !134, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !482} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!516 = metadata !{i32 786445, metadata !508, metadata !"dstPtr", metadata !134, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !323} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!517 = metadata !{i32 786445, metadata !508, metadata !"dstDevice", metadata !134, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !22} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!518 = metadata !{i32 786445, metadata !508, metadata !"extent", metadata !134, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !231} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!519 = metadata !{metadata !520}
!520 = metadata !{metadata !521}
!521 = metadata !{i32 786689, metadata !503, metadata !"p", metadata !218, i32 16777376, metadata !506, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!522 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !218, i32 164, metadata !523, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!523 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !524, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!524 = metadata !{metadata !221, metadata !506, metadata !405}
!525 = metadata !{metadata !526}
!526 = metadata !{metadata !527, metadata !528}
!527 = metadata !{i32 786689, metadata !522, metadata !"p", metadata !218, i32 16777380, metadata !506, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!528 = metadata !{i32 786689, metadata !522, metadata !"stream", metadata !218, i32 33554596, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!529 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !218, i32 168, metadata !530, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!530 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !531, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!531 = metadata !{metadata !221, metadata !237, metadata !234, metadata !234, metadata !237, metadata !234, metadata !234, metadata !234, metadata !214}
!532 = metadata !{metadata !533}
!533 = metadata !{metadata !534, metadata !535, metadata !536, metadata !537, metadata !538, metadata !539, metadata !540, metadata !541}
!534 = metadata !{i32 786689, metadata !529, metadata !"dst", metadata !218, i32 16777384, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!535 = metadata !{i32 786689, metadata !529, metadata !"wOffsetDst", metadata !218, i32 33554600, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!536 = metadata !{i32 786689, metadata !529, metadata !"hOffsetDst", metadata !218, i32 50331816, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!537 = metadata !{i32 786689, metadata !529, metadata !"src", metadata !218, i32 67109033, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!538 = metadata !{i32 786689, metadata !529, metadata !"wOffsetSrc", metadata !218, i32 83886249, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!539 = metadata !{i32 786689, metadata !529, metadata !"hOffsetSrc", metadata !218, i32 100663465, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!540 = metadata !{i32 786689, metadata !529, metadata !"count", metadata !218, i32 117440682, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!541 = metadata !{i32 786689, metadata !529, metadata !"kind", metadata !218, i32 134217898, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!542 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !218, i32 174, metadata !543, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!543 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !544, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!544 = metadata !{metadata !221, metadata !80, metadata !81, metadata !234, metadata !214, metadata !405}
!545 = metadata !{metadata !546}
!546 = metadata !{metadata !547, metadata !548, metadata !549, metadata !550, metadata !551}
!547 = metadata !{i32 786689, metadata !542, metadata !"dst", metadata !218, i32 16777390, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!548 = metadata !{i32 786689, metadata !542, metadata !"src", metadata !218, i32 33554606, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!549 = metadata !{i32 786689, metadata !542, metadata !"count", metadata !218, i32 50331822, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!550 = metadata !{i32 786689, metadata !542, metadata !"kind", metadata !218, i32 67109039, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!551 = metadata !{i32 786689, metadata !542, metadata !"stream", metadata !218, i32 83886255, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!552 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !218, i32 179, metadata !553, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!553 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !554, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!554 = metadata !{metadata !221, metadata !80, metadata !237, metadata !234, metadata !234, metadata !234, metadata !214}
!555 = metadata !{metadata !556}
!556 = metadata !{metadata !557, metadata !558, metadata !559, metadata !560, metadata !561, metadata !562}
!557 = metadata !{i32 786689, metadata !552, metadata !"dst", metadata !218, i32 16777395, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!558 = metadata !{i32 786689, metadata !552, metadata !"src", metadata !218, i32 33554611, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!559 = metadata !{i32 786689, metadata !552, metadata !"wOffset", metadata !218, i32 50331827, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!560 = metadata !{i32 786689, metadata !552, metadata !"hOffset", metadata !218, i32 67109044, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!561 = metadata !{i32 786689, metadata !552, metadata !"count", metadata !218, i32 83886260, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!562 = metadata !{i32 786689, metadata !552, metadata !"kind", metadata !218, i32 100663476, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!563 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !218, i32 184, metadata !564, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!564 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !565, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!565 = metadata !{metadata !221, metadata !80, metadata !237, metadata !234, metadata !234, metadata !234, metadata !214, metadata !405}
!566 = metadata !{metadata !567}
!567 = metadata !{metadata !568, metadata !569, metadata !570, metadata !571, metadata !572, metadata !573, metadata !574}
!568 = metadata !{i32 786689, metadata !563, metadata !"dst", metadata !218, i32 16777400, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!569 = metadata !{i32 786689, metadata !563, metadata !"src", metadata !218, i32 33554616, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!570 = metadata !{i32 786689, metadata !563, metadata !"wOffset", metadata !218, i32 50331832, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!571 = metadata !{i32 786689, metadata !563, metadata !"hOffset", metadata !218, i32 67109049, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!572 = metadata !{i32 786689, metadata !563, metadata !"count", metadata !218, i32 83886265, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!573 = metadata !{i32 786689, metadata !563, metadata !"kind", metadata !218, i32 100663481, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!574 = metadata !{i32 786689, metadata !563, metadata !"stream", metadata !218, i32 117440698, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!575 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !218, i32 190, metadata !576, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!576 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !577, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!577 = metadata !{metadata !221, metadata !80, metadata !95, metadata !234, metadata !234, metadata !214}
!578 = metadata !{metadata !579}
!579 = metadata !{metadata !580, metadata !581, metadata !582, metadata !583, metadata !584}
!580 = metadata !{i32 786689, metadata !575, metadata !"dst", metadata !218, i32 16777406, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!581 = metadata !{i32 786689, metadata !575, metadata !"symbol", metadata !218, i32 33554622, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!582 = metadata !{i32 786689, metadata !575, metadata !"count", metadata !218, i32 50331838, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!583 = metadata !{i32 786689, metadata !575, metadata !"offset", metadata !218, i32 67109055, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!584 = metadata !{i32 786689, metadata !575, metadata !"kind", metadata !218, i32 83886271, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!585 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !218, i32 195, metadata !586, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!586 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !587, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!587 = metadata !{metadata !221, metadata !80, metadata !95, metadata !234, metadata !234, metadata !214, metadata !405}
!588 = metadata !{metadata !589}
!589 = metadata !{metadata !590, metadata !591, metadata !592, metadata !593, metadata !594, metadata !595}
!590 = metadata !{i32 786689, metadata !585, metadata !"dst", metadata !218, i32 16777411, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!591 = metadata !{i32 786689, metadata !585, metadata !"symbol", metadata !218, i32 33554627, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!592 = metadata !{i32 786689, metadata !585, metadata !"count", metadata !218, i32 50331843, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!593 = metadata !{i32 786689, metadata !585, metadata !"offset", metadata !218, i32 67109060, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!594 = metadata !{i32 786689, metadata !585, metadata !"kind", metadata !218, i32 83886276, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!595 = metadata !{i32 786689, metadata !585, metadata !"stream", metadata !218, i32 100663493, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!596 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !218, i32 201, metadata !597, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!597 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !598, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!598 = metadata !{metadata !221, metadata !80, metadata !22, metadata !81, metadata !22, metadata !234}
!599 = metadata !{metadata !600}
!600 = metadata !{metadata !601, metadata !602, metadata !603, metadata !604, metadata !605}
!601 = metadata !{i32 786689, metadata !596, metadata !"dst", metadata !218, i32 16777417, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!602 = metadata !{i32 786689, metadata !596, metadata !"dstDevice", metadata !218, i32 33554633, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!603 = metadata !{i32 786689, metadata !596, metadata !"src", metadata !218, i32 50331849, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!604 = metadata !{i32 786689, metadata !596, metadata !"srcDevice", metadata !218, i32 67109065, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!605 = metadata !{i32 786689, metadata !596, metadata !"count", metadata !218, i32 83886281, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!606 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !218, i32 206, metadata !607, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!607 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !608, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!608 = metadata !{metadata !221, metadata !80, metadata !22, metadata !81, metadata !22, metadata !234, metadata !405}
!609 = metadata !{metadata !610}
!610 = metadata !{metadata !611, metadata !612, metadata !613, metadata !614, metadata !615, metadata !616}
!611 = metadata !{i32 786689, metadata !606, metadata !"dst", metadata !218, i32 16777422, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!612 = metadata !{i32 786689, metadata !606, metadata !"dstDevice", metadata !218, i32 33554638, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!613 = metadata !{i32 786689, metadata !606, metadata !"src", metadata !218, i32 50331854, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!614 = metadata !{i32 786689, metadata !606, metadata !"srcDevice", metadata !218, i32 67109070, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!615 = metadata !{i32 786689, metadata !606, metadata !"count", metadata !218, i32 83886287, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!616 = metadata !{i32 786689, metadata !606, metadata !"stream", metadata !218, i32 100663503, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!617 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !218, i32 212, metadata !618, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!618 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !619, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!619 = metadata !{metadata !221, metadata !237, metadata !234, metadata !234, metadata !81, metadata !234, metadata !214}
!620 = metadata !{metadata !621}
!621 = metadata !{metadata !622, metadata !623, metadata !624, metadata !625, metadata !626, metadata !627}
!622 = metadata !{i32 786689, metadata !617, metadata !"dst", metadata !218, i32 16777428, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!623 = metadata !{i32 786689, metadata !617, metadata !"wOffset", metadata !218, i32 33554644, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!624 = metadata !{i32 786689, metadata !617, metadata !"hOffset", metadata !218, i32 50331860, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!625 = metadata !{i32 786689, metadata !617, metadata !"src", metadata !218, i32 67109077, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!626 = metadata !{i32 786689, metadata !617, metadata !"count", metadata !218, i32 83886293, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!627 = metadata !{i32 786689, metadata !617, metadata !"kind", metadata !218, i32 100663509, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!628 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !218, i32 217, metadata !629, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!629 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !630, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!630 = metadata !{metadata !221, metadata !237, metadata !234, metadata !234, metadata !81, metadata !234, metadata !214, metadata !405}
!631 = metadata !{metadata !632}
!632 = metadata !{metadata !633, metadata !634, metadata !635, metadata !636, metadata !637, metadata !638, metadata !639}
!633 = metadata !{i32 786689, metadata !628, metadata !"dst", metadata !218, i32 16777433, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!634 = metadata !{i32 786689, metadata !628, metadata !"wOffset", metadata !218, i32 33554649, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!635 = metadata !{i32 786689, metadata !628, metadata !"hOffset", metadata !218, i32 50331865, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!636 = metadata !{i32 786689, metadata !628, metadata !"src", metadata !218, i32 67109082, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!637 = metadata !{i32 786689, metadata !628, metadata !"count", metadata !218, i32 83886298, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!638 = metadata !{i32 786689, metadata !628, metadata !"kind", metadata !218, i32 100663514, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!639 = metadata !{i32 786689, metadata !628, metadata !"stream", metadata !218, i32 117440731, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!640 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !218, i32 223, metadata !641, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!641 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !642, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!642 = metadata !{metadata !221, metadata !92, metadata !81, metadata !234, metadata !234, metadata !214}
!643 = metadata !{metadata !644}
!644 = metadata !{metadata !645, metadata !646, metadata !647, metadata !648, metadata !649}
!645 = metadata !{i32 786689, metadata !640, metadata !"symbol", metadata !218, i32 16777439, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!646 = metadata !{i32 786689, metadata !640, metadata !"src", metadata !218, i32 33554655, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!647 = metadata !{i32 786689, metadata !640, metadata !"count", metadata !218, i32 50331871, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!648 = metadata !{i32 786689, metadata !640, metadata !"offset", metadata !218, i32 67109088, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!649 = metadata !{i32 786689, metadata !640, metadata !"kind", metadata !218, i32 83886304, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!650 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !218, i32 229, metadata !651, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!651 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !652, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!652 = metadata !{metadata !221, metadata !95, metadata !81, metadata !234, metadata !234, metadata !214, metadata !405}
!653 = metadata !{metadata !654}
!654 = metadata !{metadata !655, metadata !656, metadata !657, metadata !658, metadata !659, metadata !660}
!655 = metadata !{i32 786689, metadata !650, metadata !"symbol", metadata !218, i32 16777445, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!656 = metadata !{i32 786689, metadata !650, metadata !"src", metadata !218, i32 33554661, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!657 = metadata !{i32 786689, metadata !650, metadata !"count", metadata !218, i32 50331877, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!658 = metadata !{i32 786689, metadata !650, metadata !"offset", metadata !218, i32 67109093, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!659 = metadata !{i32 786689, metadata !650, metadata !"kind", metadata !218, i32 83886310, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!660 = metadata !{i32 786689, metadata !650, metadata !"stream", metadata !218, i32 100663526, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!661 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !218, i32 234, metadata !662, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!662 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !663, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!663 = metadata !{metadata !221, metadata !272, metadata !272}
!664 = metadata !{metadata !665}
!665 = metadata !{metadata !666, metadata !667}
!666 = metadata !{i32 786689, metadata !661, metadata !"free", metadata !218, i32 16777450, metadata !272, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!667 = metadata !{i32 786689, metadata !661, metadata !"total", metadata !218, i32 33554666, metadata !272, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!668 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !218, i32 238, metadata !669, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!669 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !670, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!670 = metadata !{metadata !221, metadata !80, metadata !22, metadata !234}
!671 = metadata !{metadata !672}
!672 = metadata !{metadata !673, metadata !674, metadata !675}
!673 = metadata !{i32 786689, metadata !668, metadata !"devPtr", metadata !218, i32 16777454, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!674 = metadata !{i32 786689, metadata !668, metadata !"value", metadata !218, i32 33554670, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!675 = metadata !{i32 786689, metadata !668, metadata !"count", metadata !218, i32 50331886, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!676 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !218, i32 243, metadata !677, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!677 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !678, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!678 = metadata !{metadata !221, metadata !80, metadata !234, metadata !22, metadata !234, metadata !234}
!679 = metadata !{metadata !680}
!680 = metadata !{metadata !681, metadata !682, metadata !683, metadata !684, metadata !685}
!681 = metadata !{i32 786689, metadata !676, metadata !"devPtr", metadata !218, i32 16777459, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!682 = metadata !{i32 786689, metadata !676, metadata !"pitch", metadata !218, i32 33554675, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!683 = metadata !{i32 786689, metadata !676, metadata !"value", metadata !218, i32 50331891, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!684 = metadata !{i32 786689, metadata !676, metadata !"width", metadata !218, i32 67109108, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!685 = metadata !{i32 786689, metadata !676, metadata !"height", metadata !218, i32 83886324, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!686 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !218, i32 248, metadata !687, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!687 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !688, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!688 = metadata !{metadata !221, metadata !80, metadata !234, metadata !22, metadata !234, metadata !234, metadata !405}
!689 = metadata !{metadata !690}
!690 = metadata !{metadata !691, metadata !692, metadata !693, metadata !694, metadata !695, metadata !696}
!691 = metadata !{i32 786689, metadata !686, metadata !"devPtr", metadata !218, i32 16777464, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!692 = metadata !{i32 786689, metadata !686, metadata !"pitch", metadata !218, i32 33554680, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!693 = metadata !{i32 786689, metadata !686, metadata !"value", metadata !218, i32 50331896, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!694 = metadata !{i32 786689, metadata !686, metadata !"width", metadata !218, i32 67109113, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!695 = metadata !{i32 786689, metadata !686, metadata !"height", metadata !218, i32 83886329, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!696 = metadata !{i32 786689, metadata !686, metadata !"stream", metadata !218, i32 100663545, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!697 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !218, i32 253, metadata !698, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!698 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !699, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!699 = metadata !{metadata !221, metadata !323, metadata !22, metadata !231}
!700 = metadata !{metadata !701}
!701 = metadata !{metadata !702, metadata !703, metadata !704}
!702 = metadata !{i32 786689, metadata !697, metadata !"pitchedDevPtr", metadata !218, i32 16777469, metadata !323, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!703 = metadata !{i32 786689, metadata !697, metadata !"value", metadata !218, i32 33554685, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!704 = metadata !{i32 786689, metadata !697, metadata !"extent", metadata !218, i32 50331902, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!705 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !218, i32 258, metadata !706, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!706 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !707, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!707 = metadata !{metadata !221, metadata !323, metadata !22, metadata !231, metadata !405}
!708 = metadata !{metadata !709}
!709 = metadata !{metadata !710, metadata !711, metadata !712, metadata !713}
!710 = metadata !{i32 786689, metadata !705, metadata !"pitchedDevPtr", metadata !218, i32 16777474, metadata !323, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!711 = metadata !{i32 786689, metadata !705, metadata !"value", metadata !218, i32 33554690, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!712 = metadata !{i32 786689, metadata !705, metadata !"extent", metadata !218, i32 50331907, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!713 = metadata !{i32 786689, metadata !705, metadata !"stream", metadata !218, i32 67109123, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!714 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !218, i32 263, metadata !715, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!715 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !716, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!716 = metadata !{metadata !221, metadata !80, metadata !22, metadata !234, metadata !405}
!717 = metadata !{metadata !718}
!718 = metadata !{metadata !719, metadata !720, metadata !721, metadata !722}
!719 = metadata !{i32 786689, metadata !714, metadata !"devPtr", metadata !218, i32 16777479, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!720 = metadata !{i32 786689, metadata !714, metadata !"value", metadata !218, i32 33554695, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!721 = metadata !{i32 786689, metadata !714, metadata !"count", metadata !218, i32 50331911, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!722 = metadata !{i32 786689, metadata !714, metadata !"stream", metadata !218, i32 67109127, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!723 = metadata !{i32 12, i32 0, metadata !724, null}
!724 = metadata !{i32 786443, metadata !15, i32 11, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail/main.cpp]
!725 = metadata !{i32 13, i32 0, metadata !724, null}
!726 = metadata !{i32 14, i32 0, metadata !724, null}
!727 = metadata !{i32 15, i32 0, metadata !724, null}
!728 = metadata !{i32 103, i32 0, metadata !729, null}
!729 = metadata !{i32 786443, metadata !69, i32 102, i32 0, metadata !70, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/sm_11_atomic_func
!730 = metadata !{i32 24, i32 0, metadata !731, null}
!731 = metadata !{i32 786443, metadata !23, i32 17, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail/main.cpp]
!732 = metadata !{i32 25, i32 0, metadata !731, null}
!733 = metadata !{i32 27, i32 0, metadata !734, null}
!734 = metadata !{i32 786443, metadata !731, i32 27, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail/main.cpp]
!735 = metadata !{i32 28, i32 0, metadata !734, null}
!736 = metadata !{i32 30, i32 0, metadata !731, null}
!737 = metadata !{i32 31, i32 0, metadata !731, null}
!738 = metadata !{i32 33, i32 0, metadata !731, null}
!739 = metadata !{i32 34, i32 0, metadata !731, null}
!740 = metadata !{i32 35, i32 0, metadata !741, null}
!741 = metadata !{i32 786443, metadata !731, i32 35, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail/main.cpp]
!742 = metadata !{i32 37, i32 0, metadata !741, null}
!743 = metadata !{i32 41, i32 0, metadata !731, null}
!744 = metadata !{i32 43, i32 0, metadata !745, null}
!745 = metadata !{i32 786443, metadata !731, i32 43, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail/main.cpp]
!746 = metadata !{i32 44, i32 0, metadata !745, null}
!747 = metadata !{i32 46, i32 0, metadata !731, null}
!748 = metadata !{i32 47, i32 0, metadata !731, null}
!749 = metadata !{i32 48, i32 0, metadata !731, null}
!750 = metadata !{i32 49, i32 0, metadata !731, null}
!751 = metadata !{i32 51, i32 0, metadata !731, null}
!752 = metadata !{i32 419, i32 0, metadata !26, null}
!753 = metadata !{i32 419, i32 0, metadata !68, null}
!754 = metadata !{i32 419, i32 0, metadata !755, null}
!755 = metadata !{i32 786443, metadata !68, i32 419, i32 0, metadata !27, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/002_add_one_fail//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!756 = metadata !{i32 16, i32 0, metadata !91, null}
!757 = metadata !{i32 17, i32 0, metadata !91, null}
!758 = metadata !{metadata !"omnipotent char", metadata !759}
!759 = metadata !{metadata !"Simple C/C++ TBAA"}
!760 = metadata !{i32 18, i32 0, metadata !91, null}
!761 = metadata !{i32 14, i32 0, metadata !127, null}
!762 = metadata !{i32 15, i32 0, metadata !127, null}
!763 = metadata !{i32 16, i32 0, metadata !127, null}
!764 = metadata !{i32 26, i32 0, metadata !765, null}
!765 = metadata !{i32 786443, metadata !217, i32 25, i32 0, metadata !218, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!766 = metadata !{i32 30, i32 0, metadata !767, null}
!767 = metadata !{i32 786443, metadata !245, i32 29, i32 0, metadata !218, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!768 = metadata !{i32 31, i32 0, metadata !767, null}
!769 = metadata !{i32 35, i32 0, metadata !770, null}
!770 = metadata !{i32 786443, metadata !251, i32 34, i32 0, metadata !218, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!771 = metadata !{i32 36, i32 0, metadata !770, null}
!772 = metadata !{i32 40, i32 0, metadata !773, null}
!773 = metadata !{i32 786443, metadata !257, i32 39, i32 0, metadata !218, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!774 = metadata !{i32 41, i32 0, metadata !773, null}
!775 = metadata !{i32 45, i32 0, metadata !776, null}
!776 = metadata !{i32 786443, metadata !261, i32 44, i32 0, metadata !218, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!777 = metadata !{i32 49, i32 0, metadata !778, null}
!778 = metadata !{i32 786443, metadata !269, i32 48, i32 0, metadata !218, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!779 = metadata !{i32 53, i32 0, metadata !780, null}
!780 = metadata !{i32 786443, metadata !277, i32 52, i32 0, metadata !218, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!781 = metadata !{i32 57, i32 0, metadata !782, null}
!782 = metadata !{i32 786443, metadata !285, i32 56, i32 0, metadata !218, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!783 = metadata !{i32 61, i32 0, metadata !784, null}
!784 = metadata !{i32 786443, metadata !293, i32 60, i32 0, metadata !218, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!785 = metadata !{i32 65, i32 0, metadata !786, null}
!786 = metadata !{i32 786443, metadata !300, i32 64, i32 0, metadata !218, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!787 = metadata !{i32 69, i32 0, metadata !788, null}
!788 = metadata !{i32 786443, metadata !308, i32 68, i32 0, metadata !218, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!789 = metadata !{i32 73, i32 0, metadata !790, null}
!790 = metadata !{i32 786443, metadata !312, i32 72, i32 0, metadata !218, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!791 = metadata !{i32 74, i32 0, metadata !790, null}
!792 = metadata !{metadata !"any pointer", metadata !758}
!793 = metadata !{i32 75, i32 0, metadata !790, null}
!794 = metadata !{i32 77, i32 0, metadata !790, null}
!795 = metadata !{i32 81, i32 0, metadata !796, null}
!796 = metadata !{i32 786443, metadata !319, i32 80, i32 0, metadata !218, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!797 = metadata !{i32 86, i32 0, metadata !798, null}
!798 = metadata !{i32 786443, metadata !333, i32 85, i32 0, metadata !218, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!799 = metadata !{i32 91, i32 0, metadata !800, null}
!800 = metadata !{i32 786443, metadata !343, i32 90, i32 0, metadata !218, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!801 = metadata !{i32 95, i32 0, metadata !802, null}
!802 = metadata !{i32 786443, metadata !353, i32 94, i32 0, metadata !218, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!803 = metadata !{i32 96, i32 0, metadata !802, null}
!804 = metadata !{i32 97, i32 0, metadata !802, null}
!805 = metadata !{i32 99, i32 0, metadata !802, null}
!806 = metadata !{i32 103, i32 0, metadata !807, null}
!807 = metadata !{i32 786443, metadata !358, i32 102, i32 0, metadata !218, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!808 = metadata !{i32 108, i32 0, metadata !809, null}
!809 = metadata !{i32 786443, metadata !367, i32 106, i32 0, metadata !218, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!810 = metadata !{i32 113, i32 0, metadata !811, null}
!811 = metadata !{i32 786443, metadata !376, i32 112, i32 0, metadata !218, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!812 = metadata !{i32 119, i32 0, metadata !813, null}
!813 = metadata !{i32 786443, metadata !388, i32 118, i32 0, metadata !218, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!814 = metadata !{i32 125, i32 0, metadata !815, null}
!815 = metadata !{i32 786443, metadata !402, i32 124, i32 0, metadata !218, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!816 = metadata !{i32 131, i32 0, metadata !817, null}
!817 = metadata !{i32 786443, metadata !418, i32 130, i32 0, metadata !218, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!818 = metadata !{i32 137, i32 0, metadata !819, null}
!819 = metadata !{i32 786443, metadata !431, i32 136, i32 0, metadata !218, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!820 = metadata !{i32 143, i32 0, metadata !821, null}
!821 = metadata !{i32 786443, metadata !445, i32 142, i32 0, metadata !218, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!822 = metadata !{i32 149, i32 0, metadata !823, null}
!823 = metadata !{i32 786443, metadata !458, i32 148, i32 0, metadata !218, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!824 = metadata !{i32 153, i32 0, metadata !825, null}
!825 = metadata !{i32 786443, metadata !472, i32 152, i32 0, metadata !218, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!826 = metadata !{i32 157, i32 0, metadata !827, null}
!827 = metadata !{i32 786443, metadata !496, i32 156, i32 0, metadata !218, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!828 = metadata !{i32 161, i32 0, metadata !829, null}
!829 = metadata !{i32 786443, metadata !503, i32 160, i32 0, metadata !218, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!830 = metadata !{i32 165, i32 0, metadata !831, null}
!831 = metadata !{i32 786443, metadata !522, i32 164, i32 0, metadata !218, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!832 = metadata !{i32 171, i32 0, metadata !833, null}
!833 = metadata !{i32 786443, metadata !529, i32 170, i32 0, metadata !218, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!834 = metadata !{i32 176, i32 0, metadata !835, null}
!835 = metadata !{i32 786443, metadata !542, i32 175, i32 0, metadata !218, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!836 = metadata !{i32 181, i32 0, metadata !837, null}
!837 = metadata !{i32 786443, metadata !552, i32 180, i32 0, metadata !218, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!838 = metadata !{i32 187, i32 0, metadata !839, null}
!839 = metadata !{i32 786443, metadata !563, i32 186, i32 0, metadata !218, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!840 = metadata !{i32 192, i32 0, metadata !841, null}
!841 = metadata !{i32 786443, metadata !575, i32 191, i32 0, metadata !218, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!842 = metadata !{i32 198, i32 0, metadata !843, null}
!843 = metadata !{i32 786443, metadata !585, i32 197, i32 0, metadata !218, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!844 = metadata !{i32 203, i32 0, metadata !845, null}
!845 = metadata !{i32 786443, metadata !596, i32 201, i32 0, metadata !218, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!846 = metadata !{i32 209, i32 0, metadata !847, null}
!847 = metadata !{i32 786443, metadata !606, i32 207, i32 0, metadata !218, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!848 = metadata !{i32 214, i32 0, metadata !849, null}
!849 = metadata !{i32 786443, metadata !617, i32 213, i32 0, metadata !218, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!850 = metadata !{i32 220, i32 0, metadata !851, null}
!851 = metadata !{i32 786443, metadata !628, i32 219, i32 0, metadata !218, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!852 = metadata !{i32 225, i32 0, metadata !853, null}
!853 = metadata !{i32 786443, metadata !640, i32 224, i32 0, metadata !218, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!854 = metadata !{i32 226, i32 0, metadata !853, null}
!855 = metadata !{i32 231, i32 0, metadata !856, null}
!856 = metadata !{i32 786443, metadata !650, i32 230, i32 0, metadata !218, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!857 = metadata !{i32 235, i32 0, metadata !858, null}
!858 = metadata !{i32 786443, metadata !661, i32 234, i32 0, metadata !218, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!859 = metadata !{i32 239, i32 0, metadata !860, null}
!860 = metadata !{i32 786443, metadata !668, i32 238, i32 0, metadata !218, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!861 = metadata !{i32 240, i32 0, metadata !860, null}
!862 = metadata !{i32 245, i32 0, metadata !863, null}
!863 = metadata !{i32 786443, metadata !676, i32 244, i32 0, metadata !218, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!864 = metadata !{i32 250, i32 0, metadata !865, null}
!865 = metadata !{i32 786443, metadata !686, i32 249, i32 0, metadata !218, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!866 = metadata !{i32 255, i32 0, metadata !867, null}
!867 = metadata !{i32 786443, metadata !697, i32 254, i32 0, metadata !218, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!868 = metadata !{i32 260, i32 0, metadata !869, null}
!869 = metadata !{i32 786443, metadata !705, i32 259, i32 0, metadata !218, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!870 = metadata !{i32 264, i32 0, metadata !871, null}
!871 = metadata !{i32 786443, metadata !714, i32 263, i32 0, metadata !218, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
