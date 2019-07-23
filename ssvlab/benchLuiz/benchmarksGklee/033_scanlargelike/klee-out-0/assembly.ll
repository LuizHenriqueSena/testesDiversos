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
@.str = private unnamed_addr constant [4 x i8] c"D: \00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c" %f\09\09\00", align 1
@.str2 = private unnamed_addr constant [12 x i8] c"d[i] == 2*i\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define void @_Z1fPfPi(float* %odata, i32* %ai) nounwind uwtable section "__device__" {
  %1 = alloca float*, align 8
  %2 = alloca i32*, align 8
  %thid = alloca i32, align 4
  store float* %odata, float** %1, align 8
  store i32* %ai, i32** %2, align 8
  %3 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !724
  store i32 %3, i32* %thid, align 4, !dbg !724
  %4 = load i32* %thid, align 4, !dbg !726
  %5 = load i32** %2, align 8, !dbg !726
  store i32 %4, i32* %5, align 4, !dbg !726
  %6 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !727
  %7 = mul i32 2, %6, !dbg !727
  %8 = uitofp i32 %7 to float, !dbg !727
  %9 = load i32** %2, align 8, !dbg !727
  %10 = load i32* %9, align 4, !dbg !727
  %11 = sext i32 %10 to i64, !dbg !727
  %12 = load float** %1, align 8, !dbg !727
  %13 = getelementptr inbounds float* %12, i64 %11, !dbg !727
  store float %8, float* %13, align 4, !dbg !727
  ret void, !dbg !728
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @_Z1kPf(float* %g_odata) nounwind uwtable noinline {
  %1 = alloca float*, align 8
  %ai = alloca i32, align 4
  store float* %g_odata, float** %1, align 8
  %2 = load float** %1, align 8, !dbg !729
  call void @_Z1fPfPi(float* %2, i32* %ai), !dbg !729
  ret void, !dbg !731
}

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %d = alloca float*, align 8
  %dev_d = alloca float*, align 8
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %6 = call noalias i8* @malloc(i64 8) nounwind, !dbg !732
  %7 = bitcast i8* %6 to float*, !dbg !732
  store float* %7, float** %d, align 8, !dbg !732
  %8 = bitcast float** %dev_d to i8**, !dbg !734
  %9 = call i32 @cudaMalloc(i8** %8, i64 8), !dbg !734
  %10 = load float** %dev_d, align 8, !dbg !735
  %11 = bitcast float* %10 to i8*, !dbg !735
  %12 = load float** %d, align 8, !dbg !735
  %13 = bitcast float* %12 to i8*, !dbg !735
  %14 = call i32 @cudaMemcpy(i8* %11, i8* %13, i64 8, i32 1), !dbg !735
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !736
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 2, i32 1, i32 1), !dbg !736
  %15 = bitcast { i64, i32 }* %4 to i8*, !dbg !736
  %16 = bitcast %struct.dim3* %2 to i8*, !dbg !736
  %17 = call i8* @memcpy(i8* %15, i8* %16, i64 12)
  %18 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !736
  %19 = load i64* %18, align 1, !dbg !736
  %20 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !736
  %21 = load i32* %20, align 1, !dbg !736
  %22 = bitcast { i64, i32 }* %5 to i8*, !dbg !736
  %23 = bitcast %struct.dim3* %3 to i8*, !dbg !736
  %24 = call i8* @memcpy(i8* %22, i8* %23, i64 12)
  %25 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !736
  %26 = load i64* %25, align 1, !dbg !736
  %27 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !736
  %28 = load i32* %27, align 1, !dbg !736
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %19, i32 %21, i64 %26, i32 %28), !dbg !736
  %29 = load float** %dev_d, align 8, !dbg !738
  call void @_Z1kPf(float* %29), !dbg !738
  %30 = load float** %d, align 8, !dbg !739
  %31 = bitcast float* %30 to i8*, !dbg !739
  %32 = load float** %dev_d, align 8, !dbg !739
  %33 = bitcast float* %32 to i8*, !dbg !739
  %34 = call i32 @cudaMemcpy(i8* %31, i8* %33, i64 8, i32 2), !dbg !739
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0)), !dbg !740
  store i32 0, i32* %i, align 4, !dbg !741
  br label %36, !dbg !741

; <label>:36                                      ; preds = %57, %0
  %37 = load i32* %i, align 4, !dbg !741
  %38 = icmp slt i32 %37, 2, !dbg !741
  br i1 %38, label %39, label %60, !dbg !741

; <label>:39                                      ; preds = %36
  %40 = load i32* %i, align 4, !dbg !743
  %41 = sext i32 %40 to i64, !dbg !743
  %42 = load float** %d, align 8, !dbg !743
  %43 = getelementptr inbounds float* %42, i64 %41, !dbg !743
  %44 = load float* %43, align 4, !dbg !743
  %45 = fpext float %44 to double, !dbg !743
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), double %45), !dbg !743
  %47 = load i32* %i, align 4, !dbg !745
  %48 = sext i32 %47 to i64, !dbg !745
  %49 = load float** %d, align 8, !dbg !745
  %50 = getelementptr inbounds float* %49, i64 %48, !dbg !745
  %51 = load float* %50, align 4, !dbg !745
  %52 = load i32* %i, align 4, !dbg !745
  %53 = mul nsw i32 2, %52, !dbg !745
  %54 = sitofp i32 %53 to float, !dbg !745
  %55 = fcmp oeq float %51, %54, !dbg !745
  br i1 %55, label %57, label %56, !dbg !745

; <label>:56                                      ; preds = %39
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0), i32 40, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwi
  unreachable, !dbg !745

; <label>:57                                      ; preds = %39
  %58 = load i32* %i, align 4, !dbg !741
  %59 = add nsw i32 %58, 1, !dbg !741
  store i32 %59, i32* %i, align 4, !dbg !741
  br label %36, !dbg !741

; <label>:60                                      ; preds = %36
  %61 = load float** %dev_d, align 8, !dbg !746
  %62 = bitcast float* %61 to i8*, !dbg !746
  %63 = call i32 @cudaFree(i8* %62), !dbg !746
  ret i32 0, !dbg !747
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
  %6 = load i32* %2, align 4, !dbg !748
  %7 = load i32* %3, align 4, !dbg !748
  %8 = load i32* %4, align 4, !dbg !748
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !748
  ret void, !dbg !748
}

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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !749
  %7 = load i32* %2, align 4, !dbg !749
  store i32 %7, i32* %6, align 4, !dbg !749
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !749
  %9 = load i32* %3, align 4, !dbg !749
  store i32 %9, i32* %8, align 4, !dbg !749
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !749
  %11 = load i32* %4, align 4, !dbg !749
  store i32 %11, i32* %10, align 4, !dbg !749
  ret void, !dbg !750
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !752
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !752

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !752
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !753
  %4 = load i8* %src.06, align 1, !dbg !753, !tbaa !754
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !753
  store i8 %4, i8* %dest.05, align 1, !dbg !753, !tbaa !754
  %6 = icmp eq i64 %2, 0, !dbg !752
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !752

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !756
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !757
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !757

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !758
  br label %3, !dbg !757

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !757
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !758
  store volatile i8 %2, i8* %a.05, align 1, !dbg !758, !tbaa !754
  %6 = icmp eq i64 %4, 0, !dbg !757
  br i1 %6, label %._crit_edge, label %3, !dbg !757

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !759
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !760
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !762
  ret i32 0, !dbg !764
}

declare void @free(i8* nocapture) nounwind

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !765
  tail call void @free(i8* %1) nounwind, !dbg !765
  ret i32 0, !dbg !767
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !768
  ret i32 0, !dbg !770
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !771
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !773
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !775
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !777
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !779
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !781
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !783
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !785
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !787
  store i8* %1, i8** %devPtr, align 8, !dbg !787, !tbaa !788
  tail call void @__clear_device(), !dbg !789
  ret i32 0, !dbg !790
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !791
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !793
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !795
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !797
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !799
  store i8* %1, i8** %ptr, align 8, !dbg !799, !tbaa !788
  tail call void @__clear_host(), !dbg !800
  ret i32 0, !dbg !801
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !802
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !804
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !806
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !808
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !810
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !812
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !814
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !816
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !818
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !820
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !822
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !824
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !826
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !828
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !830
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !832
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !834
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !836
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !838
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !840
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !842
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !844
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !846
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !848
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !850
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !851
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !853
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !855
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !857
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !858
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !860
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !862
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !864
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !866
}

!llvm.dbg.cu = !{!0, !73, !97, !113, !130}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metad
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !23, metadata !26, metadata !29, metadata !72}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"f", metadata !"f", metadata !"_Z1fPfPi", metadata !16, i32 9, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*, i32*)* @_Z1fPfPi, null, null, metadata !11, i
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19, metadata !21}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!20 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!21 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!22 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!23 = metadata !{i32 786478, i32 0, metadata !16, metadata !"k", metadata !"k", metadata !"_Z1kPf", metadata !16, i32 15, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*)* @_Z1kPf, null, null, metadata !11, i32 15} ; 
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !19}
!26 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 21, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 21} ; [ DW_TAG_
!27 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{metadata !22}
!29 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !30, i32 419, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!30 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike", null} ; [ DW_TAG_file_type ]
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
!216 = metadata !{metadata !217, metadata !246, metadata !252, metadata !258, metadata !262, metadata !270, metadata !278, metadata !286, metadata !294, metadata !301, metadata !309, metadata !313, metadata !320, metadata !334, metadata !344, metadata !3
!217 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !218, i32 24, metadata !219, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!218 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!219 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !220, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!220 = metadata !{metadata !221, metadata !222, metadata !230, metadata !237, metadata !238}
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
!237 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!238 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!239 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !134, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!240 = metadata !{metadata !241}
!241 = metadata !{metadata !242, metadata !243, metadata !244, metadata !245}
!242 = metadata !{i32 786689, metadata !217, metadata !"desc", metadata !218, i32 16777240, metadata !222, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!243 = metadata !{i32 786689, metadata !217, metadata !"extent", metadata !218, i32 33554456, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!244 = metadata !{i32 786689, metadata !217, metadata !"flags", metadata !218, i32 50331673, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!245 = metadata !{i32 786689, metadata !217, metadata !"array", metadata !218, i32 67108889, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!246 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !218, i32 29, metadata !247, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !249, 
!247 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !248, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!248 = metadata !{metadata !221, metadata !80}
!249 = metadata !{metadata !250}
!250 = metadata !{metadata !251}
!251 = metadata !{i32 786689, metadata !246, metadata !"devPtr", metadata !218, i32 16777245, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!252 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !218, i32 34, metadata !253, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!253 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !254, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!254 = metadata !{metadata !221, metadata !238}
!255 = metadata !{metadata !256}
!256 = metadata !{metadata !257}
!257 = metadata !{i32 786689, metadata !252, metadata !"array", metadata !218, i32 16777250, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!258 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !218, i32 39, metadata !247, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!259 = metadata !{metadata !260}
!260 = metadata !{metadata !261}
!261 = metadata !{i32 786689, metadata !258, metadata !"ptr", metadata !218, i32 16777255, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!262 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !218, i32 44, metadata !263, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!263 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !264, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!264 = metadata !{metadata !221, metadata !265, metadata !95}
!265 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!266 = metadata !{metadata !267}
!267 = metadata !{metadata !268, metadata !269}
!268 = metadata !{i32 786689, metadata !262, metadata !"devPtr", metadata !218, i32 16777260, metadata !265, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!269 = metadata !{i32 786689, metadata !262, metadata !"symbol", metadata !218, i32 33554476, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!270 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !218, i32 48, metadata !271, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!271 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !272, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!272 = metadata !{metadata !221, metadata !273, metadata !95}
!273 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !234} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!274 = metadata !{metadata !275}
!275 = metadata !{metadata !276, metadata !277}
!276 = metadata !{i32 786689, metadata !270, metadata !"size", metadata !218, i32 16777264, metadata !273, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!277 = metadata !{i32 786689, metadata !270, metadata !"symbol", metadata !218, i32 33554480, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!278 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !218, i32 52, metadata !279, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!279 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !280, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!280 = metadata !{metadata !221, metadata !265, metadata !234, metadata !37}
!281 = metadata !{metadata !282}
!282 = metadata !{metadata !283, metadata !284, metadata !285}
!283 = metadata !{i32 786689, metadata !278, metadata !"pHost", metadata !218, i32 16777268, metadata !265, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!284 = metadata !{i32 786689, metadata !278, metadata !"size", metadata !218, i32 33554484, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!285 = metadata !{i32 786689, metadata !278, metadata !"flags", metadata !218, i32 50331700, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!286 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !218, i32 56, metadata !287, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!287 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !288, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!288 = metadata !{metadata !221, metadata !265, metadata !80, metadata !37}
!289 = metadata !{metadata !290}
!290 = metadata !{metadata !291, metadata !292, metadata !293}
!291 = metadata !{i32 786689, metadata !286, metadata !"pDevice", metadata !218, i32 16777272, metadata !265, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!292 = metadata !{i32 786689, metadata !286, metadata !"pHost", metadata !218, i32 33554488, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!293 = metadata !{i32 786689, metadata !286, metadata !"flags", metadata !218, i32 50331704, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!294 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !218, i32 60, metadata !295, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!295 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !296, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!296 = metadata !{metadata !221, metadata !237, metadata !80}
!297 = metadata !{metadata !298}
!298 = metadata !{metadata !299, metadata !300}
!299 = metadata !{i32 786689, metadata !294, metadata !"pFlags", metadata !218, i32 16777276, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!300 = metadata !{i32 786689, metadata !294, metadata !"pHost", metadata !218, i32 33554492, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!301 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !218, i32 64, metadata !302, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!302 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !303, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!303 = metadata !{metadata !221, metadata !80, metadata !234, metadata !37}
!304 = metadata !{metadata !305}
!305 = metadata !{metadata !306, metadata !307, metadata !308}
!306 = metadata !{i32 786689, metadata !301, metadata !"ptr", metadata !218, i32 16777280, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!307 = metadata !{i32 786689, metadata !301, metadata !"size", metadata !218, i32 33554496, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!308 = metadata !{i32 786689, metadata !301, metadata !"flags", metadata !218, i32 50331712, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!309 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !218, i32 68, metadata !247, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!310 = metadata !{metadata !311}
!311 = metadata !{metadata !312}
!312 = metadata !{i32 786689, metadata !309, metadata !"ptr", metadata !218, i32 16777284, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!313 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !218, i32 72, metadata !314, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!314 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !315, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!315 = metadata !{metadata !221, metadata !265, metadata !234}
!316 = metadata !{metadata !317}
!317 = metadata !{metadata !318, metadata !319}
!318 = metadata !{i32 786689, metadata !313, metadata !"devPtr", metadata !218, i32 16777288, metadata !265, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!319 = metadata !{i32 786689, metadata !313, metadata !"size", metadata !218, i32 33554504, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!320 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !218, i32 80, metadata !321, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!321 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !322, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!322 = metadata !{metadata !221, metadata !323, metadata !231}
!323 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !324} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!324 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !134, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !325, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!325 = metadata !{metadata !326, metadata !327, metadata !328, metadata !329}
!326 = metadata !{i32 786445, metadata !324, metadata !"ptr", metadata !134, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!327 = metadata !{i32 786445, metadata !324, metadata !"pitch", metadata !134, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !234} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!328 = metadata !{i32 786445, metadata !324, metadata !"xsize", metadata !134, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !234} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!329 = metadata !{i32 786445, metadata !324, metadata !"ysize", metadata !134, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !234} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!330 = metadata !{metadata !331}
!331 = metadata !{metadata !332, metadata !333}
!332 = metadata !{i32 786689, metadata !320, metadata !"pitchedDevPtr", metadata !218, i32 16777296, metadata !323, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!333 = metadata !{i32 786689, metadata !320, metadata !"extent", metadata !218, i32 33554512, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!334 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !218, i32 84, metadata !335, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!335 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !336, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!336 = metadata !{metadata !221, metadata !337, metadata !222, metadata !231, metadata !37}
!337 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !238} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!338 = metadata !{metadata !339}
!339 = metadata !{metadata !340, metadata !341, metadata !342, metadata !343}
!340 = metadata !{i32 786689, metadata !334, metadata !"array", metadata !218, i32 16777300, metadata !337, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!341 = metadata !{i32 786689, metadata !334, metadata !"desc", metadata !218, i32 33554516, metadata !222, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!342 = metadata !{i32 786689, metadata !334, metadata !"extent", metadata !218, i32 50331733, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!343 = metadata !{i32 786689, metadata !334, metadata !"flags", metadata !218, i32 67108949, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!344 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !218, i32 89, metadata !345, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!345 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !346, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!346 = metadata !{metadata !221, metadata !337, metadata !222, metadata !234, metadata !234, metadata !37}
!347 = metadata !{metadata !348}
!348 = metadata !{metadata !349, metadata !350, metadata !351, metadata !352, metadata !353}
!349 = metadata !{i32 786689, metadata !344, metadata !"array", metadata !218, i32 16777305, metadata !337, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!350 = metadata !{i32 786689, metadata !344, metadata !"desc", metadata !218, i32 33554521, metadata !222, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!351 = metadata !{i32 786689, metadata !344, metadata !"width", metadata !218, i32 50331738, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!352 = metadata !{i32 786689, metadata !344, metadata !"height", metadata !218, i32 67108954, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!353 = metadata !{i32 786689, metadata !344, metadata !"flags", metadata !218, i32 83886170, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!354 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !218, i32 94, metadata !314, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!355 = metadata !{metadata !356}
!356 = metadata !{metadata !357, metadata !358}
!357 = metadata !{i32 786689, metadata !354, metadata !"ptr", metadata !218, i32 16777310, metadata !265, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!358 = metadata !{i32 786689, metadata !354, metadata !"size", metadata !218, i32 33554526, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!359 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !218, i32 102, metadata !360, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!360 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !361, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!361 = metadata !{metadata !221, metadata !265, metadata !273, metadata !234, metadata !234}
!362 = metadata !{metadata !363}
!363 = metadata !{metadata !364, metadata !365, metadata !366, metadata !367}
!364 = metadata !{i32 786689, metadata !359, metadata !"devPtr", metadata !218, i32 16777318, metadata !265, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!365 = metadata !{i32 786689, metadata !359, metadata !"pitch", metadata !218, i32 33554534, metadata !273, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!366 = metadata !{i32 786689, metadata !359, metadata !"width", metadata !218, i32 50331750, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!367 = metadata !{i32 786689, metadata !359, metadata !"height", metadata !218, i32 67108966, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!368 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !218, i32 106, metadata !369, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!369 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !370, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!370 = metadata !{metadata !221, metadata !80, metadata !81, metadata !234, metadata !214}
!371 = metadata !{metadata !372}
!372 = metadata !{metadata !373, metadata !374, metadata !375, metadata !376}
!373 = metadata !{i32 786689, metadata !368, metadata !"dst", metadata !218, i32 16777322, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!374 = metadata !{i32 786689, metadata !368, metadata !"src", metadata !218, i32 33554538, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!375 = metadata !{i32 786689, metadata !368, metadata !"count", metadata !218, i32 50331754, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!376 = metadata !{i32 786689, metadata !368, metadata !"kind", metadata !218, i32 67108970, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!377 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !218, i32 111, metadata !378, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!378 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !379, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!379 = metadata !{metadata !221, metadata !80, metadata !234, metadata !81, metadata !234, metadata !234, metadata !234, metadata !214}
!380 = metadata !{metadata !381}
!381 = metadata !{metadata !382, metadata !383, metadata !384, metadata !385, metadata !386, metadata !387, metadata !388}
!382 = metadata !{i32 786689, metadata !377, metadata !"dst", metadata !218, i32 16777327, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!383 = metadata !{i32 786689, metadata !377, metadata !"dpitch", metadata !218, i32 33554543, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!384 = metadata !{i32 786689, metadata !377, metadata !"src", metadata !218, i32 50331759, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!385 = metadata !{i32 786689, metadata !377, metadata !"spitch", metadata !218, i32 67108975, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!386 = metadata !{i32 786689, metadata !377, metadata !"width", metadata !218, i32 83886192, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!387 = metadata !{i32 786689, metadata !377, metadata !"height", metadata !218, i32 100663408, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!388 = metadata !{i32 786689, metadata !377, metadata !"kind", metadata !218, i32 117440624, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!389 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !218, i32 116, metadata !390, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!390 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !391, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!391 = metadata !{metadata !221, metadata !238, metadata !234, metadata !234, metadata !238, metadata !234, metadata !234, metadata !234, metadata !234, metadata !214}
!392 = metadata !{metadata !393}
!393 = metadata !{metadata !394, metadata !395, metadata !396, metadata !397, metadata !398, metadata !399, metadata !400, metadata !401, metadata !402}
!394 = metadata !{i32 786689, metadata !389, metadata !"dst", metadata !218, i32 16777332, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!395 = metadata !{i32 786689, metadata !389, metadata !"wOffsetDst", metadata !218, i32 33554548, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!396 = metadata !{i32 786689, metadata !389, metadata !"hOffsetDst", metadata !218, i32 50331764, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!397 = metadata !{i32 786689, metadata !389, metadata !"src", metadata !218, i32 67108981, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!398 = metadata !{i32 786689, metadata !389, metadata !"wOffsetSrc", metadata !218, i32 83886197, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!399 = metadata !{i32 786689, metadata !389, metadata !"hOffsetSrc", metadata !218, i32 100663413, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!400 = metadata !{i32 786689, metadata !389, metadata !"width", metadata !218, i32 117440630, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!401 = metadata !{i32 786689, metadata !389, metadata !"height", metadata !218, i32 134217846, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!402 = metadata !{i32 786689, metadata !389, metadata !"kind", metadata !218, i32 150995062, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!403 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !218, i32 122, metadata !404, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!404 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !405, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!405 = metadata !{metadata !221, metadata !80, metadata !234, metadata !81, metadata !234, metadata !234, metadata !234, metadata !214, metadata !406}
!406 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !218, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !407} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!407 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !408} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!408 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !134, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!409 = metadata !{metadata !410}
!410 = metadata !{metadata !411, metadata !412, metadata !413, metadata !414, metadata !415, metadata !416, metadata !417, metadata !418}
!411 = metadata !{i32 786689, metadata !403, metadata !"dst", metadata !218, i32 16777338, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!412 = metadata !{i32 786689, metadata !403, metadata !"dpitch", metadata !218, i32 33554554, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!413 = metadata !{i32 786689, metadata !403, metadata !"src", metadata !218, i32 50331770, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!414 = metadata !{i32 786689, metadata !403, metadata !"spitch", metadata !218, i32 67108986, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!415 = metadata !{i32 786689, metadata !403, metadata !"width", metadata !218, i32 83886203, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!416 = metadata !{i32 786689, metadata !403, metadata !"height", metadata !218, i32 100663419, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!417 = metadata !{i32 786689, metadata !403, metadata !"kind", metadata !218, i32 117440635, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!418 = metadata !{i32 786689, metadata !403, metadata !"stream", metadata !218, i32 134217852, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!419 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !218, i32 128, metadata !420, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!420 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !421, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!421 = metadata !{metadata !221, metadata !80, metadata !234, metadata !238, metadata !234, metadata !234, metadata !234, metadata !234, metadata !214}
!422 = metadata !{metadata !423}
!423 = metadata !{metadata !424, metadata !425, metadata !426, metadata !427, metadata !428, metadata !429, metadata !430, metadata !431}
!424 = metadata !{i32 786689, metadata !419, metadata !"dst", metadata !218, i32 16777344, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!425 = metadata !{i32 786689, metadata !419, metadata !"dpitch", metadata !218, i32 33554560, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!426 = metadata !{i32 786689, metadata !419, metadata !"src", metadata !218, i32 50331776, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!427 = metadata !{i32 786689, metadata !419, metadata !"wOffset", metadata !218, i32 67108993, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!428 = metadata !{i32 786689, metadata !419, metadata !"hOffset", metadata !218, i32 83886209, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!429 = metadata !{i32 786689, metadata !419, metadata !"width", metadata !218, i32 100663425, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!430 = metadata !{i32 786689, metadata !419, metadata !"height", metadata !218, i32 117440641, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!431 = metadata !{i32 786689, metadata !419, metadata !"kind", metadata !218, i32 134217858, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!432 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !218, i32 134, metadata !433, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!433 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !434, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!434 = metadata !{metadata !221, metadata !80, metadata !234, metadata !238, metadata !234, metadata !234, metadata !234, metadata !234, metadata !214, metadata !406}
!435 = metadata !{metadata !436}
!436 = metadata !{metadata !437, metadata !438, metadata !439, metadata !440, metadata !441, metadata !442, metadata !443, metadata !444, metadata !445}
!437 = metadata !{i32 786689, metadata !432, metadata !"dst", metadata !218, i32 16777350, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!438 = metadata !{i32 786689, metadata !432, metadata !"dpitch", metadata !218, i32 33554566, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!439 = metadata !{i32 786689, metadata !432, metadata !"src", metadata !218, i32 50331782, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!440 = metadata !{i32 786689, metadata !432, metadata !"wOffset", metadata !218, i32 67108999, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!441 = metadata !{i32 786689, metadata !432, metadata !"hOffset", metadata !218, i32 83886215, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!442 = metadata !{i32 786689, metadata !432, metadata !"width", metadata !218, i32 100663431, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!443 = metadata !{i32 786689, metadata !432, metadata !"height", metadata !218, i32 117440647, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!444 = metadata !{i32 786689, metadata !432, metadata !"kind", metadata !218, i32 134217864, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!445 = metadata !{i32 786689, metadata !432, metadata !"stream", metadata !218, i32 150995080, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!446 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !218, i32 140, metadata !447, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!447 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !448, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!448 = metadata !{metadata !221, metadata !238, metadata !234, metadata !234, metadata !81, metadata !234, metadata !234, metadata !234, metadata !214}
!449 = metadata !{metadata !450}
!450 = metadata !{metadata !451, metadata !452, metadata !453, metadata !454, metadata !455, metadata !456, metadata !457, metadata !458}
!451 = metadata !{i32 786689, metadata !446, metadata !"dst", metadata !218, i32 16777356, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!452 = metadata !{i32 786689, metadata !446, metadata !"wOffset", metadata !218, i32 33554572, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!453 = metadata !{i32 786689, metadata !446, metadata !"hOffset", metadata !218, i32 50331788, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!454 = metadata !{i32 786689, metadata !446, metadata !"src", metadata !218, i32 67109005, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!455 = metadata !{i32 786689, metadata !446, metadata !"spitch", metadata !218, i32 83886221, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!456 = metadata !{i32 786689, metadata !446, metadata !"width", metadata !218, i32 100663437, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!457 = metadata !{i32 786689, metadata !446, metadata !"height", metadata !218, i32 117440653, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!458 = metadata !{i32 786689, metadata !446, metadata !"kind", metadata !218, i32 134217870, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!459 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !218, i32 146, metadata !460, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!460 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !461, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!461 = metadata !{metadata !221, metadata !238, metadata !234, metadata !234, metadata !81, metadata !234, metadata !234, metadata !234, metadata !214, metadata !406}
!462 = metadata !{metadata !463}
!463 = metadata !{metadata !464, metadata !465, metadata !466, metadata !467, metadata !468, metadata !469, metadata !470, metadata !471, metadata !472}
!464 = metadata !{i32 786689, metadata !459, metadata !"dst", metadata !218, i32 16777362, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!465 = metadata !{i32 786689, metadata !459, metadata !"wOffset", metadata !218, i32 33554578, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!466 = metadata !{i32 786689, metadata !459, metadata !"hOffset", metadata !218, i32 50331794, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!467 = metadata !{i32 786689, metadata !459, metadata !"src", metadata !218, i32 67109011, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!468 = metadata !{i32 786689, metadata !459, metadata !"spitch", metadata !218, i32 83886227, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!469 = metadata !{i32 786689, metadata !459, metadata !"width", metadata !218, i32 100663443, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!470 = metadata !{i32 786689, metadata !459, metadata !"height", metadata !218, i32 117440659, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!471 = metadata !{i32 786689, metadata !459, metadata !"kind", metadata !218, i32 134217876, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!472 = metadata !{i32 786689, metadata !459, metadata !"stream", metadata !218, i32 150995092, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!473 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !218, i32 152, metadata !474, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!474 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !475, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!475 = metadata !{metadata !221, metadata !476}
!476 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !477} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!477 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !478} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!478 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !134, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !479, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!479 = metadata !{metadata !480, metadata !482, metadata !488, metadata !489, metadata !490, metadata !491, metadata !492, metadata !493}
!480 = metadata !{i32 786445, metadata !478, metadata !"srcArray", metadata !134, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !481} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!481 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !134, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !238} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!482 = metadata !{i32 786445, metadata !478, metadata !"srcPos", metadata !134, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !483} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!483 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !134, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !484, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!484 = metadata !{metadata !485, metadata !486, metadata !487}
!485 = metadata !{i32 786445, metadata !483, metadata !"x", metadata !134, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !234} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!486 = metadata !{i32 786445, metadata !483, metadata !"y", metadata !134, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !234} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!487 = metadata !{i32 786445, metadata !483, metadata !"z", metadata !134, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !234} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!488 = metadata !{i32 786445, metadata !478, metadata !"srcPtr", metadata !134, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !324} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!489 = metadata !{i32 786445, metadata !478, metadata !"dstArray", metadata !134, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !481} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!490 = metadata !{i32 786445, metadata !478, metadata !"dstPos", metadata !134, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !483} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!491 = metadata !{i32 786445, metadata !478, metadata !"dstPtr", metadata !134, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !324} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!492 = metadata !{i32 786445, metadata !478, metadata !"extent", metadata !134, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !231} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!493 = metadata !{i32 786445, metadata !478, metadata !"kind", metadata !134, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !214} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!494 = metadata !{metadata !495}
!495 = metadata !{metadata !496}
!496 = metadata !{i32 786689, metadata !473, metadata !"p", metadata !218, i32 16777368, metadata !476, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!497 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !218, i32 156, metadata !498, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!498 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !499, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!499 = metadata !{metadata !221, metadata !476, metadata !406}
!500 = metadata !{metadata !501}
!501 = metadata !{metadata !502, metadata !503}
!502 = metadata !{i32 786689, metadata !497, metadata !"p", metadata !218, i32 16777372, metadata !476, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!503 = metadata !{i32 786689, metadata !497, metadata !"stream", metadata !218, i32 33554588, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!504 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !218, i32 160, metadata !505, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!505 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !506, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!506 = metadata !{metadata !221, metadata !507}
!507 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !508} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!508 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !509} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!509 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !134, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !510, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!510 = metadata !{metadata !511, metadata !512, metadata !513, metadata !514, metadata !515, metadata !516, metadata !517, metadata !518, metadata !519}
!511 = metadata !{i32 786445, metadata !509, metadata !"srcArray", metadata !134, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !481} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!512 = metadata !{i32 786445, metadata !509, metadata !"srcPos", metadata !134, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !483} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!513 = metadata !{i32 786445, metadata !509, metadata !"srcPtr", metadata !134, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !324} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!514 = metadata !{i32 786445, metadata !509, metadata !"srcDevice", metadata !134, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !22} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!515 = metadata !{i32 786445, metadata !509, metadata !"dstArray", metadata !134, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !481} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!516 = metadata !{i32 786445, metadata !509, metadata !"dstPos", metadata !134, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !483} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!517 = metadata !{i32 786445, metadata !509, metadata !"dstPtr", metadata !134, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !324} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!518 = metadata !{i32 786445, metadata !509, metadata !"dstDevice", metadata !134, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !22} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!519 = metadata !{i32 786445, metadata !509, metadata !"extent", metadata !134, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !231} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!520 = metadata !{metadata !521}
!521 = metadata !{metadata !522}
!522 = metadata !{i32 786689, metadata !504, metadata !"p", metadata !218, i32 16777376, metadata !507, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!523 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !218, i32 164, metadata !524, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!524 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !525, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!525 = metadata !{metadata !221, metadata !507, metadata !406}
!526 = metadata !{metadata !527}
!527 = metadata !{metadata !528, metadata !529}
!528 = metadata !{i32 786689, metadata !523, metadata !"p", metadata !218, i32 16777380, metadata !507, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!529 = metadata !{i32 786689, metadata !523, metadata !"stream", metadata !218, i32 33554596, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!530 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !218, i32 168, metadata !531, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!531 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !532, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!532 = metadata !{metadata !221, metadata !238, metadata !234, metadata !234, metadata !238, metadata !234, metadata !234, metadata !234, metadata !214}
!533 = metadata !{metadata !534}
!534 = metadata !{metadata !535, metadata !536, metadata !537, metadata !538, metadata !539, metadata !540, metadata !541, metadata !542}
!535 = metadata !{i32 786689, metadata !530, metadata !"dst", metadata !218, i32 16777384, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!536 = metadata !{i32 786689, metadata !530, metadata !"wOffsetDst", metadata !218, i32 33554600, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!537 = metadata !{i32 786689, metadata !530, metadata !"hOffsetDst", metadata !218, i32 50331816, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!538 = metadata !{i32 786689, metadata !530, metadata !"src", metadata !218, i32 67109033, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!539 = metadata !{i32 786689, metadata !530, metadata !"wOffsetSrc", metadata !218, i32 83886249, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!540 = metadata !{i32 786689, metadata !530, metadata !"hOffsetSrc", metadata !218, i32 100663465, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!541 = metadata !{i32 786689, metadata !530, metadata !"count", metadata !218, i32 117440682, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!542 = metadata !{i32 786689, metadata !530, metadata !"kind", metadata !218, i32 134217898, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!543 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !218, i32 174, metadata !544, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!544 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !545, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!545 = metadata !{metadata !221, metadata !80, metadata !81, metadata !234, metadata !214, metadata !406}
!546 = metadata !{metadata !547}
!547 = metadata !{metadata !548, metadata !549, metadata !550, metadata !551, metadata !552}
!548 = metadata !{i32 786689, metadata !543, metadata !"dst", metadata !218, i32 16777390, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!549 = metadata !{i32 786689, metadata !543, metadata !"src", metadata !218, i32 33554606, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!550 = metadata !{i32 786689, metadata !543, metadata !"count", metadata !218, i32 50331822, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!551 = metadata !{i32 786689, metadata !543, metadata !"kind", metadata !218, i32 67109039, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!552 = metadata !{i32 786689, metadata !543, metadata !"stream", metadata !218, i32 83886255, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!553 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !218, i32 179, metadata !554, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!554 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !555, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!555 = metadata !{metadata !221, metadata !80, metadata !238, metadata !234, metadata !234, metadata !234, metadata !214}
!556 = metadata !{metadata !557}
!557 = metadata !{metadata !558, metadata !559, metadata !560, metadata !561, metadata !562, metadata !563}
!558 = metadata !{i32 786689, metadata !553, metadata !"dst", metadata !218, i32 16777395, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!559 = metadata !{i32 786689, metadata !553, metadata !"src", metadata !218, i32 33554611, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!560 = metadata !{i32 786689, metadata !553, metadata !"wOffset", metadata !218, i32 50331827, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!561 = metadata !{i32 786689, metadata !553, metadata !"hOffset", metadata !218, i32 67109044, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!562 = metadata !{i32 786689, metadata !553, metadata !"count", metadata !218, i32 83886260, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!563 = metadata !{i32 786689, metadata !553, metadata !"kind", metadata !218, i32 100663476, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!564 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !218, i32 184, metadata !565, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!565 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !566, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!566 = metadata !{metadata !221, metadata !80, metadata !238, metadata !234, metadata !234, metadata !234, metadata !214, metadata !406}
!567 = metadata !{metadata !568}
!568 = metadata !{metadata !569, metadata !570, metadata !571, metadata !572, metadata !573, metadata !574, metadata !575}
!569 = metadata !{i32 786689, metadata !564, metadata !"dst", metadata !218, i32 16777400, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!570 = metadata !{i32 786689, metadata !564, metadata !"src", metadata !218, i32 33554616, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!571 = metadata !{i32 786689, metadata !564, metadata !"wOffset", metadata !218, i32 50331832, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!572 = metadata !{i32 786689, metadata !564, metadata !"hOffset", metadata !218, i32 67109049, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!573 = metadata !{i32 786689, metadata !564, metadata !"count", metadata !218, i32 83886265, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!574 = metadata !{i32 786689, metadata !564, metadata !"kind", metadata !218, i32 100663481, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!575 = metadata !{i32 786689, metadata !564, metadata !"stream", metadata !218, i32 117440698, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!576 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !218, i32 190, metadata !577, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!577 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !578, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!578 = metadata !{metadata !221, metadata !80, metadata !95, metadata !234, metadata !234, metadata !214}
!579 = metadata !{metadata !580}
!580 = metadata !{metadata !581, metadata !582, metadata !583, metadata !584, metadata !585}
!581 = metadata !{i32 786689, metadata !576, metadata !"dst", metadata !218, i32 16777406, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!582 = metadata !{i32 786689, metadata !576, metadata !"symbol", metadata !218, i32 33554622, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!583 = metadata !{i32 786689, metadata !576, metadata !"count", metadata !218, i32 50331838, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!584 = metadata !{i32 786689, metadata !576, metadata !"offset", metadata !218, i32 67109055, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!585 = metadata !{i32 786689, metadata !576, metadata !"kind", metadata !218, i32 83886271, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!586 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !218, i32 195, metadata !587, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!587 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !588, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!588 = metadata !{metadata !221, metadata !80, metadata !95, metadata !234, metadata !234, metadata !214, metadata !406}
!589 = metadata !{metadata !590}
!590 = metadata !{metadata !591, metadata !592, metadata !593, metadata !594, metadata !595, metadata !596}
!591 = metadata !{i32 786689, metadata !586, metadata !"dst", metadata !218, i32 16777411, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!592 = metadata !{i32 786689, metadata !586, metadata !"symbol", metadata !218, i32 33554627, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!593 = metadata !{i32 786689, metadata !586, metadata !"count", metadata !218, i32 50331843, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!594 = metadata !{i32 786689, metadata !586, metadata !"offset", metadata !218, i32 67109060, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!595 = metadata !{i32 786689, metadata !586, metadata !"kind", metadata !218, i32 83886276, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!596 = metadata !{i32 786689, metadata !586, metadata !"stream", metadata !218, i32 100663493, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!597 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !218, i32 201, metadata !598, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!598 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !599, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!599 = metadata !{metadata !221, metadata !80, metadata !22, metadata !81, metadata !22, metadata !234}
!600 = metadata !{metadata !601}
!601 = metadata !{metadata !602, metadata !603, metadata !604, metadata !605, metadata !606}
!602 = metadata !{i32 786689, metadata !597, metadata !"dst", metadata !218, i32 16777417, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!603 = metadata !{i32 786689, metadata !597, metadata !"dstDevice", metadata !218, i32 33554633, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!604 = metadata !{i32 786689, metadata !597, metadata !"src", metadata !218, i32 50331849, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!605 = metadata !{i32 786689, metadata !597, metadata !"srcDevice", metadata !218, i32 67109065, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!606 = metadata !{i32 786689, metadata !597, metadata !"count", metadata !218, i32 83886281, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!607 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !218, i32 206, metadata !608, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!608 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !609, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!609 = metadata !{metadata !221, metadata !80, metadata !22, metadata !81, metadata !22, metadata !234, metadata !406}
!610 = metadata !{metadata !611}
!611 = metadata !{metadata !612, metadata !613, metadata !614, metadata !615, metadata !616, metadata !617}
!612 = metadata !{i32 786689, metadata !607, metadata !"dst", metadata !218, i32 16777422, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!613 = metadata !{i32 786689, metadata !607, metadata !"dstDevice", metadata !218, i32 33554638, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!614 = metadata !{i32 786689, metadata !607, metadata !"src", metadata !218, i32 50331854, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!615 = metadata !{i32 786689, metadata !607, metadata !"srcDevice", metadata !218, i32 67109070, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!616 = metadata !{i32 786689, metadata !607, metadata !"count", metadata !218, i32 83886287, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!617 = metadata !{i32 786689, metadata !607, metadata !"stream", metadata !218, i32 100663503, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!618 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !218, i32 212, metadata !619, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!619 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !620, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!620 = metadata !{metadata !221, metadata !238, metadata !234, metadata !234, metadata !81, metadata !234, metadata !214}
!621 = metadata !{metadata !622}
!622 = metadata !{metadata !623, metadata !624, metadata !625, metadata !626, metadata !627, metadata !628}
!623 = metadata !{i32 786689, metadata !618, metadata !"dst", metadata !218, i32 16777428, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!624 = metadata !{i32 786689, metadata !618, metadata !"wOffset", metadata !218, i32 33554644, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!625 = metadata !{i32 786689, metadata !618, metadata !"hOffset", metadata !218, i32 50331860, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!626 = metadata !{i32 786689, metadata !618, metadata !"src", metadata !218, i32 67109077, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!627 = metadata !{i32 786689, metadata !618, metadata !"count", metadata !218, i32 83886293, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!628 = metadata !{i32 786689, metadata !618, metadata !"kind", metadata !218, i32 100663509, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!629 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !218, i32 217, metadata !630, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!630 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !631, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!631 = metadata !{metadata !221, metadata !238, metadata !234, metadata !234, metadata !81, metadata !234, metadata !214, metadata !406}
!632 = metadata !{metadata !633}
!633 = metadata !{metadata !634, metadata !635, metadata !636, metadata !637, metadata !638, metadata !639, metadata !640}
!634 = metadata !{i32 786689, metadata !629, metadata !"dst", metadata !218, i32 16777433, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!635 = metadata !{i32 786689, metadata !629, metadata !"wOffset", metadata !218, i32 33554649, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!636 = metadata !{i32 786689, metadata !629, metadata !"hOffset", metadata !218, i32 50331865, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!637 = metadata !{i32 786689, metadata !629, metadata !"src", metadata !218, i32 67109082, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!638 = metadata !{i32 786689, metadata !629, metadata !"count", metadata !218, i32 83886298, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!639 = metadata !{i32 786689, metadata !629, metadata !"kind", metadata !218, i32 100663514, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!640 = metadata !{i32 786689, metadata !629, metadata !"stream", metadata !218, i32 117440731, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!641 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !218, i32 223, metadata !642, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!642 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !643, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!643 = metadata !{metadata !221, metadata !92, metadata !81, metadata !234, metadata !234, metadata !214}
!644 = metadata !{metadata !645}
!645 = metadata !{metadata !646, metadata !647, metadata !648, metadata !649, metadata !650}
!646 = metadata !{i32 786689, metadata !641, metadata !"symbol", metadata !218, i32 16777439, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!647 = metadata !{i32 786689, metadata !641, metadata !"src", metadata !218, i32 33554655, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!648 = metadata !{i32 786689, metadata !641, metadata !"count", metadata !218, i32 50331871, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!649 = metadata !{i32 786689, metadata !641, metadata !"offset", metadata !218, i32 67109088, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!650 = metadata !{i32 786689, metadata !641, metadata !"kind", metadata !218, i32 83886304, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!651 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !218, i32 229, metadata !652, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!652 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !653, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!653 = metadata !{metadata !221, metadata !95, metadata !81, metadata !234, metadata !234, metadata !214, metadata !406}
!654 = metadata !{metadata !655}
!655 = metadata !{metadata !656, metadata !657, metadata !658, metadata !659, metadata !660, metadata !661}
!656 = metadata !{i32 786689, metadata !651, metadata !"symbol", metadata !218, i32 16777445, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!657 = metadata !{i32 786689, metadata !651, metadata !"src", metadata !218, i32 33554661, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!658 = metadata !{i32 786689, metadata !651, metadata !"count", metadata !218, i32 50331877, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!659 = metadata !{i32 786689, metadata !651, metadata !"offset", metadata !218, i32 67109093, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!660 = metadata !{i32 786689, metadata !651, metadata !"kind", metadata !218, i32 83886310, metadata !214, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!661 = metadata !{i32 786689, metadata !651, metadata !"stream", metadata !218, i32 100663526, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!662 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !218, i32 234, metadata !663, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!663 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !664, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!664 = metadata !{metadata !221, metadata !273, metadata !273}
!665 = metadata !{metadata !666}
!666 = metadata !{metadata !667, metadata !668}
!667 = metadata !{i32 786689, metadata !662, metadata !"free", metadata !218, i32 16777450, metadata !273, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!668 = metadata !{i32 786689, metadata !662, metadata !"total", metadata !218, i32 33554666, metadata !273, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!669 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !218, i32 238, metadata !670, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!670 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !671, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!671 = metadata !{metadata !221, metadata !80, metadata !22, metadata !234}
!672 = metadata !{metadata !673}
!673 = metadata !{metadata !674, metadata !675, metadata !676}
!674 = metadata !{i32 786689, metadata !669, metadata !"devPtr", metadata !218, i32 16777454, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!675 = metadata !{i32 786689, metadata !669, metadata !"value", metadata !218, i32 33554670, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!676 = metadata !{i32 786689, metadata !669, metadata !"count", metadata !218, i32 50331886, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!677 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !218, i32 243, metadata !678, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!678 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !679, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!679 = metadata !{metadata !221, metadata !80, metadata !234, metadata !22, metadata !234, metadata !234}
!680 = metadata !{metadata !681}
!681 = metadata !{metadata !682, metadata !683, metadata !684, metadata !685, metadata !686}
!682 = metadata !{i32 786689, metadata !677, metadata !"devPtr", metadata !218, i32 16777459, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!683 = metadata !{i32 786689, metadata !677, metadata !"pitch", metadata !218, i32 33554675, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!684 = metadata !{i32 786689, metadata !677, metadata !"value", metadata !218, i32 50331891, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!685 = metadata !{i32 786689, metadata !677, metadata !"width", metadata !218, i32 67109108, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!686 = metadata !{i32 786689, metadata !677, metadata !"height", metadata !218, i32 83886324, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!687 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !218, i32 248, metadata !688, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!688 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !689, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!689 = metadata !{metadata !221, metadata !80, metadata !234, metadata !22, metadata !234, metadata !234, metadata !406}
!690 = metadata !{metadata !691}
!691 = metadata !{metadata !692, metadata !693, metadata !694, metadata !695, metadata !696, metadata !697}
!692 = metadata !{i32 786689, metadata !687, metadata !"devPtr", metadata !218, i32 16777464, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!693 = metadata !{i32 786689, metadata !687, metadata !"pitch", metadata !218, i32 33554680, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!694 = metadata !{i32 786689, metadata !687, metadata !"value", metadata !218, i32 50331896, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!695 = metadata !{i32 786689, metadata !687, metadata !"width", metadata !218, i32 67109113, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!696 = metadata !{i32 786689, metadata !687, metadata !"height", metadata !218, i32 83886329, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!697 = metadata !{i32 786689, metadata !687, metadata !"stream", metadata !218, i32 100663545, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!698 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !218, i32 253, metadata !699, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!699 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !700, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!700 = metadata !{metadata !221, metadata !324, metadata !22, metadata !231}
!701 = metadata !{metadata !702}
!702 = metadata !{metadata !703, metadata !704, metadata !705}
!703 = metadata !{i32 786689, metadata !698, metadata !"pitchedDevPtr", metadata !218, i32 16777469, metadata !324, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!704 = metadata !{i32 786689, metadata !698, metadata !"value", metadata !218, i32 33554685, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!705 = metadata !{i32 786689, metadata !698, metadata !"extent", metadata !218, i32 50331902, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!706 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !218, i32 258, metadata !707, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!707 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !708, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!708 = metadata !{metadata !221, metadata !324, metadata !22, metadata !231, metadata !406}
!709 = metadata !{metadata !710}
!710 = metadata !{metadata !711, metadata !712, metadata !713, metadata !714}
!711 = metadata !{i32 786689, metadata !706, metadata !"pitchedDevPtr", metadata !218, i32 16777474, metadata !324, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!712 = metadata !{i32 786689, metadata !706, metadata !"value", metadata !218, i32 33554690, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!713 = metadata !{i32 786689, metadata !706, metadata !"extent", metadata !218, i32 50331907, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!714 = metadata !{i32 786689, metadata !706, metadata !"stream", metadata !218, i32 67109123, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!715 = metadata !{i32 786478, i32 0, metadata !218, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !218, i32 263, metadata !716, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!716 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !717, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!717 = metadata !{metadata !221, metadata !80, metadata !22, metadata !234, metadata !406}
!718 = metadata !{metadata !719}
!719 = metadata !{metadata !720, metadata !721, metadata !722, metadata !723}
!720 = metadata !{i32 786689, metadata !715, metadata !"devPtr", metadata !218, i32 16777479, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!721 = metadata !{i32 786689, metadata !715, metadata !"value", metadata !218, i32 33554695, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!722 = metadata !{i32 786689, metadata !715, metadata !"count", metadata !218, i32 50331911, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!723 = metadata !{i32 786689, metadata !715, metadata !"stream", metadata !218, i32 67109127, metadata !406, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!724 = metadata !{i32 10, i32 0, metadata !725, null}
!725 = metadata !{i32 786443, metadata !15, i32 9, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike/main.cpp]
!726 = metadata !{i32 11, i32 0, metadata !725, null}
!727 = metadata !{i32 12, i32 0, metadata !725, null}
!728 = metadata !{i32 13, i32 0, metadata !725, null}
!729 = metadata !{i32 17, i32 0, metadata !730, null}
!730 = metadata !{i32 786443, metadata !23, i32 15, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike/main.cpp]
!731 = metadata !{i32 18, i32 0, metadata !730, null}
!732 = metadata !{i32 25, i32 0, metadata !733, null}
!733 = metadata !{i32 786443, metadata !26, i32 21, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike/main.cpp]
!734 = metadata !{i32 26, i32 0, metadata !733, null}
!735 = metadata !{i32 28, i32 0, metadata !733, null}
!736 = metadata !{i32 29, i32 0, metadata !737, null}
!737 = metadata !{i32 786443, metadata !733, i32 29, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike/main.cpp]
!738 = metadata !{i32 31, i32 0, metadata !737, null}
!739 = metadata !{i32 35, i32 0, metadata !733, null}
!740 = metadata !{i32 37, i32 0, metadata !733, null}
!741 = metadata !{i32 38, i32 0, metadata !742, null}
!742 = metadata !{i32 786443, metadata !733, i32 38, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike/main.cpp]
!743 = metadata !{i32 39, i32 0, metadata !744, null}
!744 = metadata !{i32 786443, metadata !742, i32 38, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike/main.cpp]
!745 = metadata !{i32 40, i32 0, metadata !744, null}
!746 = metadata !{i32 42, i32 0, metadata !733, null}
!747 = metadata !{i32 44, i32 0, metadata !733, null}
!748 = metadata !{i32 419, i32 0, metadata !29, null}
!749 = metadata !{i32 419, i32 0, metadata !72, null}
!750 = metadata !{i32 419, i32 0, metadata !751, null}
!751 = metadata !{i32 786443, metadata !72, i32 419, i32 0, metadata !30, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/033_scanlargelike//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!752 = metadata !{i32 16, i32 0, metadata !91, null}
!753 = metadata !{i32 17, i32 0, metadata !91, null}
!754 = metadata !{metadata !"omnipotent char", metadata !755}
!755 = metadata !{metadata !"Simple C/C++ TBAA"}
!756 = metadata !{i32 18, i32 0, metadata !91, null}
!757 = metadata !{i32 14, i32 0, metadata !127, null}
!758 = metadata !{i32 15, i32 0, metadata !127, null}
!759 = metadata !{i32 16, i32 0, metadata !127, null}
!760 = metadata !{i32 26, i32 0, metadata !761, null}
!761 = metadata !{i32 786443, metadata !217, i32 25, i32 0, metadata !218, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!762 = metadata !{i32 30, i32 0, metadata !763, null}
!763 = metadata !{i32 786443, metadata !246, i32 29, i32 0, metadata !218, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!764 = metadata !{i32 31, i32 0, metadata !763, null}
!765 = metadata !{i32 35, i32 0, metadata !766, null}
!766 = metadata !{i32 786443, metadata !252, i32 34, i32 0, metadata !218, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!767 = metadata !{i32 36, i32 0, metadata !766, null}
!768 = metadata !{i32 40, i32 0, metadata !769, null}
!769 = metadata !{i32 786443, metadata !258, i32 39, i32 0, metadata !218, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!770 = metadata !{i32 41, i32 0, metadata !769, null}
!771 = metadata !{i32 45, i32 0, metadata !772, null}
!772 = metadata !{i32 786443, metadata !262, i32 44, i32 0, metadata !218, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!773 = metadata !{i32 49, i32 0, metadata !774, null}
!774 = metadata !{i32 786443, metadata !270, i32 48, i32 0, metadata !218, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!775 = metadata !{i32 53, i32 0, metadata !776, null}
!776 = metadata !{i32 786443, metadata !278, i32 52, i32 0, metadata !218, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!777 = metadata !{i32 57, i32 0, metadata !778, null}
!778 = metadata !{i32 786443, metadata !286, i32 56, i32 0, metadata !218, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!779 = metadata !{i32 61, i32 0, metadata !780, null}
!780 = metadata !{i32 786443, metadata !294, i32 60, i32 0, metadata !218, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!781 = metadata !{i32 65, i32 0, metadata !782, null}
!782 = metadata !{i32 786443, metadata !301, i32 64, i32 0, metadata !218, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!783 = metadata !{i32 69, i32 0, metadata !784, null}
!784 = metadata !{i32 786443, metadata !309, i32 68, i32 0, metadata !218, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!785 = metadata !{i32 73, i32 0, metadata !786, null}
!786 = metadata !{i32 786443, metadata !313, i32 72, i32 0, metadata !218, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!787 = metadata !{i32 74, i32 0, metadata !786, null}
!788 = metadata !{metadata !"any pointer", metadata !754}
!789 = metadata !{i32 75, i32 0, metadata !786, null}
!790 = metadata !{i32 77, i32 0, metadata !786, null}
!791 = metadata !{i32 81, i32 0, metadata !792, null}
!792 = metadata !{i32 786443, metadata !320, i32 80, i32 0, metadata !218, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!793 = metadata !{i32 86, i32 0, metadata !794, null}
!794 = metadata !{i32 786443, metadata !334, i32 85, i32 0, metadata !218, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!795 = metadata !{i32 91, i32 0, metadata !796, null}
!796 = metadata !{i32 786443, metadata !344, i32 90, i32 0, metadata !218, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!797 = metadata !{i32 95, i32 0, metadata !798, null}
!798 = metadata !{i32 786443, metadata !354, i32 94, i32 0, metadata !218, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!799 = metadata !{i32 96, i32 0, metadata !798, null}
!800 = metadata !{i32 97, i32 0, metadata !798, null}
!801 = metadata !{i32 99, i32 0, metadata !798, null}
!802 = metadata !{i32 103, i32 0, metadata !803, null}
!803 = metadata !{i32 786443, metadata !359, i32 102, i32 0, metadata !218, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!804 = metadata !{i32 108, i32 0, metadata !805, null}
!805 = metadata !{i32 786443, metadata !368, i32 106, i32 0, metadata !218, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!806 = metadata !{i32 113, i32 0, metadata !807, null}
!807 = metadata !{i32 786443, metadata !377, i32 112, i32 0, metadata !218, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!808 = metadata !{i32 119, i32 0, metadata !809, null}
!809 = metadata !{i32 786443, metadata !389, i32 118, i32 0, metadata !218, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!810 = metadata !{i32 125, i32 0, metadata !811, null}
!811 = metadata !{i32 786443, metadata !403, i32 124, i32 0, metadata !218, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!812 = metadata !{i32 131, i32 0, metadata !813, null}
!813 = metadata !{i32 786443, metadata !419, i32 130, i32 0, metadata !218, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!814 = metadata !{i32 137, i32 0, metadata !815, null}
!815 = metadata !{i32 786443, metadata !432, i32 136, i32 0, metadata !218, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!816 = metadata !{i32 143, i32 0, metadata !817, null}
!817 = metadata !{i32 786443, metadata !446, i32 142, i32 0, metadata !218, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!818 = metadata !{i32 149, i32 0, metadata !819, null}
!819 = metadata !{i32 786443, metadata !459, i32 148, i32 0, metadata !218, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!820 = metadata !{i32 153, i32 0, metadata !821, null}
!821 = metadata !{i32 786443, metadata !473, i32 152, i32 0, metadata !218, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!822 = metadata !{i32 157, i32 0, metadata !823, null}
!823 = metadata !{i32 786443, metadata !497, i32 156, i32 0, metadata !218, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!824 = metadata !{i32 161, i32 0, metadata !825, null}
!825 = metadata !{i32 786443, metadata !504, i32 160, i32 0, metadata !218, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!826 = metadata !{i32 165, i32 0, metadata !827, null}
!827 = metadata !{i32 786443, metadata !523, i32 164, i32 0, metadata !218, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!828 = metadata !{i32 171, i32 0, metadata !829, null}
!829 = metadata !{i32 786443, metadata !530, i32 170, i32 0, metadata !218, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!830 = metadata !{i32 176, i32 0, metadata !831, null}
!831 = metadata !{i32 786443, metadata !543, i32 175, i32 0, metadata !218, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!832 = metadata !{i32 181, i32 0, metadata !833, null}
!833 = metadata !{i32 786443, metadata !553, i32 180, i32 0, metadata !218, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!834 = metadata !{i32 187, i32 0, metadata !835, null}
!835 = metadata !{i32 786443, metadata !564, i32 186, i32 0, metadata !218, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!836 = metadata !{i32 192, i32 0, metadata !837, null}
!837 = metadata !{i32 786443, metadata !576, i32 191, i32 0, metadata !218, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!838 = metadata !{i32 198, i32 0, metadata !839, null}
!839 = metadata !{i32 786443, metadata !586, i32 197, i32 0, metadata !218, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!840 = metadata !{i32 203, i32 0, metadata !841, null}
!841 = metadata !{i32 786443, metadata !597, i32 201, i32 0, metadata !218, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!842 = metadata !{i32 209, i32 0, metadata !843, null}
!843 = metadata !{i32 786443, metadata !607, i32 207, i32 0, metadata !218, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!844 = metadata !{i32 214, i32 0, metadata !845, null}
!845 = metadata !{i32 786443, metadata !618, i32 213, i32 0, metadata !218, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!846 = metadata !{i32 220, i32 0, metadata !847, null}
!847 = metadata !{i32 786443, metadata !629, i32 219, i32 0, metadata !218, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!848 = metadata !{i32 225, i32 0, metadata !849, null}
!849 = metadata !{i32 786443, metadata !641, i32 224, i32 0, metadata !218, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!850 = metadata !{i32 226, i32 0, metadata !849, null}
!851 = metadata !{i32 231, i32 0, metadata !852, null}
!852 = metadata !{i32 786443, metadata !651, i32 230, i32 0, metadata !218, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!853 = metadata !{i32 235, i32 0, metadata !854, null}
!854 = metadata !{i32 786443, metadata !662, i32 234, i32 0, metadata !218, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!855 = metadata !{i32 239, i32 0, metadata !856, null}
!856 = metadata !{i32 786443, metadata !669, i32 238, i32 0, metadata !218, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!857 = metadata !{i32 240, i32 0, metadata !856, null}
!858 = metadata !{i32 245, i32 0, metadata !859, null}
!859 = metadata !{i32 786443, metadata !677, i32 244, i32 0, metadata !218, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!860 = metadata !{i32 250, i32 0, metadata !861, null}
!861 = metadata !{i32 786443, metadata !687, i32 249, i32 0, metadata !218, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!862 = metadata !{i32 255, i32 0, metadata !863, null}
!863 = metadata !{i32 786443, metadata !698, i32 254, i32 0, metadata !218, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!864 = metadata !{i32 260, i32 0, metadata !865, null}
!865 = metadata !{i32 786443, metadata !706, i32 259, i32 0, metadata !218, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!866 = metadata !{i32 264, i32 0, metadata !867, null}
!867 = metadata !{i32 786443, metadata !715, i32 263, i32 0, metadata !218, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
