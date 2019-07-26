; ModuleID = 'main'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.uint4 = type { i32, i32, i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.cudaChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.cudaExtent = type { i64, i64, i64 }
%struct.cudaArray = type opaque
%struct.cudaPitchedPtr = type { i8*, i64, i64, i64 }
%struct.CUstream_st = type opaque
%struct.cudaMemcpy3DParms = type { %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, %struct.cudaExtent, i32 }
%struct.cudaPos = type { i64, i64, i64 }
%struct.cudaMemcpy3DPeerParms = type { %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, i32, %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, i32, %struct.cudaExtent }

@_ZZ6kernelP5uint4E6vector = private unnamed_addr constant %struct.uint4 { i32 1, i32 1, i32 1, i32 1 }, align 16
@threadIdx = external global %struct.dim3
@.str = private unnamed_addr constant [3 x i8] c"%u\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"a[i].x != 1\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"a[i].y != 1\00", align 1
@.str4 = private unnamed_addr constant [12 x i8] c"a[i].z != 1\00", align 1
@.str5 = private unnamed_addr constant [12 x i8] c"a[i].w != 1\00", align 1

define void @_Z6kernelP5uint4(%struct.uint4* %out) nounwind uwtable noinline {
  %1 = alloca %struct.uint4*, align 8
  %vector = alloca %struct.uint4, align 16
  store %struct.uint4* %out, %struct.uint4** %1, align 8
  %2 = bitcast %struct.uint4* %vector to i8*, !dbg !740
  %3 = call i8* @memcpy(i8* %2, i8* bitcast (%struct.uint4* @_ZZ6kernelP5uint4E6vector to i8*), i64 16)
  %4 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !742
  %5 = zext i32 %4 to i64, !dbg !742
  %6 = load %struct.uint4** %1, align 8, !dbg !742
  %7 = getelementptr inbounds %struct.uint4* %6, i64 %5, !dbg !742
  %8 = bitcast %struct.uint4* %7 to i8*, !dbg !742
  %9 = bitcast %struct.uint4* %vector to i8*, !dbg !742
  %10 = call i8* @memcpy(i8* %8, i8* %9, i64 16)
  ret void, !dbg !743
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %a = alloca %struct.uint4*, align 8
  %dev_a = alloca %struct.uint4*, align 8
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i = alloca i32, align 4
  %6 = alloca %struct.uint4, align 16
  store i32 0, i32* %1
  %7 = call noalias i8* @malloc(i64 32) nounwind, !dbg !744
  %8 = bitcast i8* %7 to %struct.uint4*, !dbg !744
  store %struct.uint4* %8, %struct.uint4** %a, align 8, !dbg !744
  %9 = bitcast %struct.uint4** %dev_a to i8**, !dbg !746
  %10 = call i32 @cudaMalloc(i8** %9, i64 32), !dbg !746
  %11 = load %struct.uint4** %dev_a, align 8, !dbg !747
  %12 = bitcast %struct.uint4* %11 to i8*, !dbg !747
  %13 = load %struct.uint4** %a, align 8, !dbg !747
  %14 = bitcast %struct.uint4* %13 to i8*, !dbg !747
  %15 = call i32 @cudaMemcpy(i8* %12, i8* %14, i64 32, i32 1), !dbg !747
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !748
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 2, i32 1, i32 1), !dbg !748
  %16 = bitcast { i64, i32 }* %4 to i8*, !dbg !748
  %17 = bitcast %struct.dim3* %2 to i8*, !dbg !748
  %18 = call i8* @memcpy(i8* %16, i8* %17, i64 12)
  %19 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !748
  %20 = load i64* %19, align 1, !dbg !748
  %21 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !748
  %22 = load i32* %21, align 1, !dbg !748
  %23 = bitcast { i64, i32 }* %5 to i8*, !dbg !748
  %24 = bitcast %struct.dim3* %3 to i8*, !dbg !748
  %25 = call i8* @memcpy(i8* %23, i8* %24, i64 12)
  %26 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !748
  %27 = load i64* %26, align 1, !dbg !748
  %28 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !748
  %29 = load i32* %28, align 1, !dbg !748
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %20, i32 %22, i64 %27, i32 %29), !dbg !748
  %30 = load %struct.uint4** %dev_a, align 8, !dbg !750
  call void @_Z6kernelP5uint4(%struct.uint4* %30), !dbg !750
  %31 = load %struct.uint4** %a, align 8, !dbg !751
  %32 = bitcast %struct.uint4* %31 to i8*, !dbg !751
  %33 = load %struct.uint4** %dev_a, align 8, !dbg !751
  %34 = bitcast %struct.uint4* %33 to i8*, !dbg !751
  %35 = call i32 @cudaMemcpy(i8* %32, i8* %34, i64 32, i32 2), !dbg !751
  store i32 0, i32* %i, align 4, !dbg !752
  br label %36, !dbg !752

; <label>:36                                      ; preds = %88, %0
  %37 = load i32* %i, align 4, !dbg !752
  %38 = icmp slt i32 %37, 2, !dbg !752
  br i1 %38, label %39, label %91, !dbg !752

; <label>:39                                      ; preds = %36
  %40 = load i32* %i, align 4, !dbg !754
  %41 = sext i32 %40 to i64, !dbg !754
  %42 = load %struct.uint4** %a, align 8, !dbg !754
  %43 = getelementptr inbounds %struct.uint4* %42, i64 %41, !dbg !754
  %44 = bitcast %struct.uint4* %6 to i8*, !dbg !754
  %45 = bitcast %struct.uint4* %43 to i8*, !dbg !754
  %46 = call i8* @memcpy(i8* %44, i8* %45, i64 16)
  %47 = bitcast %struct.uint4* %6 to { i64, i64 }*, !dbg !754
  %48 = getelementptr { i64, i64 }* %47, i32 0, i32 0, !dbg !754
  %49 = load i64* %48, align 1, !dbg !754
  %50 = getelementptr { i64, i64 }* %47, i32 0, i32 1, !dbg !754
  %51 = load i64* %50, align 1, !dbg !754
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i64 %49, i64 %51), !dbg !754
  %53 = load i32* %i, align 4, !dbg !756
  %54 = sext i32 %53 to i64, !dbg !756
  %55 = load %struct.uint4** %a, align 8, !dbg !756
  %56 = getelementptr inbounds %struct.uint4* %55, i64 %54, !dbg !756
  %57 = getelementptr inbounds %struct.uint4* %56, i32 0, i32 0, !dbg !756
  %58 = load i32* %57, align 4, !dbg !756
  %59 = icmp ne i32 %58, 1, !dbg !756
  br i1 %59, label %61, label %60, !dbg !756

; <label>:60                                      ; preds = %39
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 33, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwi
  unreachable, !dbg !756

; <label>:61                                      ; preds = %39
  %62 = load i32* %i, align 4, !dbg !757
  %63 = sext i32 %62 to i64, !dbg !757
  %64 = load %struct.uint4** %a, align 8, !dbg !757
  %65 = getelementptr inbounds %struct.uint4* %64, i64 %63, !dbg !757
  %66 = getelementptr inbounds %struct.uint4* %65, i32 0, i32 1, !dbg !757
  %67 = load i32* %66, align 4, !dbg !757
  %68 = icmp ne i32 %67, 1, !dbg !757
  br i1 %68, label %70, label %69, !dbg !757

; <label>:69                                      ; preds = %61
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 34, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwi
  unreachable, !dbg !757

; <label>:70                                      ; preds = %61
  %71 = load i32* %i, align 4, !dbg !758
  %72 = sext i32 %71 to i64, !dbg !758
  %73 = load %struct.uint4** %a, align 8, !dbg !758
  %74 = getelementptr inbounds %struct.uint4* %73, i64 %72, !dbg !758
  %75 = getelementptr inbounds %struct.uint4* %74, i32 0, i32 2, !dbg !758
  %76 = load i32* %75, align 4, !dbg !758
  %77 = icmp ne i32 %76, 1, !dbg !758
  br i1 %77, label %79, label %78, !dbg !758

; <label>:78                                      ; preds = %70
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 35, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwi
  unreachable, !dbg !758

; <label>:79                                      ; preds = %70
  %80 = load i32* %i, align 4, !dbg !759
  %81 = sext i32 %80 to i64, !dbg !759
  %82 = load %struct.uint4** %a, align 8, !dbg !759
  %83 = getelementptr inbounds %struct.uint4* %82, i64 %81, !dbg !759
  %84 = getelementptr inbounds %struct.uint4* %83, i32 0, i32 3, !dbg !759
  %85 = load i32* %84, align 4, !dbg !759
  %86 = icmp ne i32 %85, 1, !dbg !759
  br i1 %86, label %88, label %87, !dbg !759

; <label>:87                                      ; preds = %79
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 36, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwi
  unreachable, !dbg !759

; <label>:88                                      ; preds = %79
  %89 = load i32* %i, align 4, !dbg !752
  %90 = add nsw i32 %89, 1, !dbg !752
  store i32 %90, i32* %i, align 4, !dbg !752
  br label %36, !dbg !752

; <label>:91                                      ; preds = %36
  %92 = load %struct.uint4** %a, align 8, !dbg !760
  %93 = bitcast %struct.uint4* %92 to i8*, !dbg !760
  call void @free(i8* %93) nounwind, !dbg !760
  %94 = load %struct.uint4** %dev_a, align 8, !dbg !761
  %95 = bitcast %struct.uint4* %94 to i8*, !dbg !761
  %96 = call i32 @cudaFree(i8* %95), !dbg !761
  %97 = load i32* %1, !dbg !762
  ret i32 %97, !dbg !762
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
  %6 = load i32* %2, align 4, !dbg !763
  %7 = load i32* %3, align 4, !dbg !763
  %8 = load i32* %4, align 4, !dbg !763
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !763
  ret void, !dbg !763
}

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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !764
  %7 = load i32* %2, align 4, !dbg !764
  store i32 %7, i32* %6, align 4, !dbg !764
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !764
  %9 = load i32* %3, align 4, !dbg !764
  store i32 %9, i32* %8, align 4, !dbg !764
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !764
  %11 = load i32* %4, align 4, !dbg !764
  store i32 %11, i32* %10, align 4, !dbg !764
  ret void, !dbg !765
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !767
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !767

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !767
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !768
  %4 = load i8* %src.06, align 1, !dbg !768, !tbaa !769
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !768
  store i8 %4, i8* %dest.05, align 1, !dbg !768, !tbaa !769
  %6 = icmp eq i64 %2, 0, !dbg !767
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !767

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !771
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !772
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !772

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !773
  br label %3, !dbg !772

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !772
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !773
  store volatile i8 %2, i8* %a.05, align 1, !dbg !773, !tbaa !769
  %6 = icmp eq i64 %4, 0, !dbg !772
  br i1 %6, label %._crit_edge, label %3, !dbg !772

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !774
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !775
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !777
  ret i32 0, !dbg !779
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !780
  tail call void @free(i8* %1) nounwind, !dbg !780
  ret i32 0, !dbg !782
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !783
  ret i32 0, !dbg !785
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !786
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !788
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !790
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !792
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !794
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !796
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !798
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !800
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !802
  store i8* %1, i8** %devPtr, align 8, !dbg !802, !tbaa !803
  tail call void @__clear_device(), !dbg !804
  ret i32 0, !dbg !805
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !806
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !808
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !810
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !812
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !814
  store i8* %1, i8** %ptr, align 8, !dbg !814, !tbaa !803
  tail call void @__clear_host(), !dbg !815
  ret i32 0, !dbg !816
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !817
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !819
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !821
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !823
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !825
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !827
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !829
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !831
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !833
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !835
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !837
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !839
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !841
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !843
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !845
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !847
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !849
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !851
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !853
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !855
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !857
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !859
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !861
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !863
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !865
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !866
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !868
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !870
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !872
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !873
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !875
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !877
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !879
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !881
}

!llvm.dbg.cu = !{!0, !89, !113, !129, !146}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/052_initstruct_fail", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, met
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/052_initstruct_fail", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !45, metadata !49, metadata !88}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"kernel", metadata !"kernel", metadata !"_Z6kernelP5uint4", metadata !16, i32 9, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.uint4*)* @_Z6kernelP5uint4,
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/052_initstruct_fail", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint4]
!20 = metadata !{i32 786454, null, metadata !"uint4", metadata !16, i32 383, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ] [uint4] [line 383, size 0, align 0, offset 0] [from uint4]
!21 = metadata !{i32 786451, null, metadata !"uint4", metadata !22, i32 198, i64 128, i64 128, i32 0, i32 0, null, metadata !23, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint4] [line 198, size 128, align 128, offset 0] [from ]
!22 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/052_initstruct_fail", null} ; [ DW_TAG_file_type ]
!23 = metadata !{metadata !24, metadata !26, metadata !27, metadata !28, metadata !29, metadata !35, metadata !40, metadata !41}
!24 = metadata !{i32 786445, metadata !21, metadata !"x", metadata !22, i32 200, i64 32, i64 32, i64 0, i32 0, metadata !25} ; [ DW_TAG_member ] [x] [line 200, size 32, align 32, offset 0] [from unsigned int]
!25 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!26 = metadata !{i32 786445, metadata !21, metadata !"y", metadata !22, i32 200, i64 32, i64 32, i64 32, i32 0, metadata !25} ; [ DW_TAG_member ] [y] [line 200, size 32, align 32, offset 32] [from unsigned int]
!27 = metadata !{i32 786445, metadata !21, metadata !"z", metadata !22, i32 200, i64 32, i64 32, i64 64, i32 0, metadata !25} ; [ DW_TAG_member ] [z] [line 200, size 32, align 32, offset 64] [from unsigned int]
!28 = metadata !{i32 786445, metadata !21, metadata !"w", metadata !22, i32 200, i64 32, i64 32, i64 96, i32 0, metadata !25} ; [ DW_TAG_member ] [w] [line 200, size 32, align 32, offset 96] [from unsigned int]
!29 = metadata !{i32 786478, i32 0, metadata !21, metadata !"uint4", metadata !"uint4", metadata !"", metadata !22, i32 198, metadata !30, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !33, i32 198} ; [ DW_TAG_sub
!30 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{null, metadata !32}
!32 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint4]
!33 = metadata !{metadata !34}
!34 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!35 = metadata !{i32 786478, i32 0, metadata !21, metadata !"uint4", metadata !"uint4", metadata !"", metadata !22, i32 198, metadata !36, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !33, i32 198} ; [ DW_TAG_sub
!36 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = metadata !{null, metadata !32, metadata !38}
!38 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint4]
!40 = metadata !{i32 786478, i32 0, metadata !21, metadata !"~uint4", metadata !"~uint4", metadata !"", metadata !22, i32 198, metadata !30, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !33, i32 198} ; [ DW_TAG_s
!41 = metadata !{i32 786478, i32 0, metadata !21, metadata !"operator=", metadata !"operator=", metadata !"_ZN5uint4aSERKS_", metadata !22, i32 198, metadata !42, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !33,
!42 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{metadata !44, metadata !32, metadata !38}
!44 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from uint4]
!45 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 14, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 14} ; [ DW_TAG_
!46 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{metadata !48}
!48 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!49 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !22, i32 419, metadata !50, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!50 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !51, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = metadata !{null, metadata !52, metadata !25, metadata !25, metadata !25}
!52 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !53} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!53 = metadata !{i32 786451, null, metadata !"dim3", metadata !22, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !54, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!54 = metadata !{metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !77, metadata !80, metadata !85}
!55 = metadata !{i32 786445, metadata !53, metadata !"x", metadata !22, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !25} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!56 = metadata !{i32 786445, metadata !53, metadata !"y", metadata !22, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !25} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!57 = metadata !{i32 786445, metadata !53, metadata !"z", metadata !22, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !25} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!58 = metadata !{i32 786478, i32 0, metadata !53, metadata !"dim3", metadata !"dim3", metadata !"", metadata !22, i32 419, metadata !50, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !33, i32 419} ; [ DW_TAG_subpr
!59 = metadata !{i32 786478, i32 0, metadata !53, metadata !"dim3", metadata !"dim3", metadata !"", metadata !22, i32 420, metadata !60, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !33, i32 420} ; [ DW_TAG_subpr
!60 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{null, metadata !52, metadata !62}
!62 = metadata !{i32 786454, null, metadata !"uint3", metadata !22, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !63} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!63 = metadata !{i32 786451, null, metadata !"uint3", metadata !22, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !64, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!64 = metadata !{metadata !65, metadata !66, metadata !67, metadata !68, metadata !72}
!65 = metadata !{i32 786445, metadata !63, metadata !"x", metadata !22, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !25} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!66 = metadata !{i32 786445, metadata !63, metadata !"y", metadata !22, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !25} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!67 = metadata !{i32 786445, metadata !63, metadata !"z", metadata !22, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !25} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!68 = metadata !{i32 786478, i32 0, metadata !63, metadata !"uint3", metadata !"uint3", metadata !"", metadata !22, i32 188, metadata !69, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !33, i32 188} ; [ DW_TAG_sub
!69 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{null, metadata !71}
!71 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !63} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!72 = metadata !{i32 786478, i32 0, metadata !63, metadata !"uint3", metadata !"uint3", metadata !"", metadata !22, i32 188, metadata !73, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !33, i32 188} ; [ DW_TAG_sub
!73 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{null, metadata !71, metadata !75}
!75 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !63} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!77 = metadata !{i32 786478, i32 0, metadata !53, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !22, i32 421, metadata !78, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!78 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !79, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = metadata !{metadata !62, metadata !52}
!80 = metadata !{i32 786478, i32 0, metadata !53, metadata !"dim3", metadata !"dim3", metadata !"", metadata !22, i32 415, metadata !81, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !33, i32 415} ; [ DW_TAG_subpr
!81 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !82, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = metadata !{null, metadata !52, metadata !83}
!83 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!85 = metadata !{i32 786478, i32 0, metadata !53, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !22, i32 415, metadata !86, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !33, i32 415} ; [ DW_TAG_sub
!86 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !87, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!87 = metadata !{null, metadata !52}
!88 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !22, i32 419, metadata !50, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!89 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!90 = metadata !{metadata !91}
!91 = metadata !{metadata !92}
!92 = metadata !{i32 786478, i32 0, metadata !93, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !93, i32 12, metadata !94, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !101, 
!93 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!94 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = metadata !{metadata !96, metadata !96, metadata !97, metadata !99}
!96 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!97 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !98} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!98 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!99 = metadata !{i32 786454, null, metadata !"size_t", metadata !93, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!100 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!101 = metadata !{metadata !102}
!102 = metadata !{metadata !103, metadata !104, metadata !105, metadata !106, metadata !110}
!103 = metadata !{i32 786689, metadata !92, metadata !"destaddr", metadata !93, i32 16777228, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!104 = metadata !{i32 786689, metadata !92, metadata !"srcaddr", metadata !93, i32 33554444, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!105 = metadata !{i32 786689, metadata !92, metadata !"len", metadata !93, i32 50331660, metadata !99, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!106 = metadata !{i32 786688, metadata !107, metadata !"dest", metadata !93, i32 13, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!107 = metadata !{i32 786443, metadata !92, i32 12, i32 0, metadata !93, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/
!108 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !109} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!109 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!110 = metadata !{i32 786688, metadata !107, metadata !"src", metadata !93, i32 14, metadata !111, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!111 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !112} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!112 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !109} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!113 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2
!114 = metadata !{metadata !115}
!115 = metadata !{metadata !116}
!116 = metadata !{i32 786478, i32 0, metadata !117, metadata !"memmove", metadata !"memmove", metadata !"", metadata !117, i32 12, metadata !118, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !121, i32 12} ; [ DW_TAG
!117 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!118 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !119, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!119 = metadata !{metadata !96, metadata !96, metadata !97, metadata !120}
!120 = metadata !{i32 786454, null, metadata !"size_t", metadata !117, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!121 = metadata !{metadata !122}
!122 = metadata !{metadata !123, metadata !124, metadata !125, metadata !126, metadata !128}
!123 = metadata !{i32 786689, metadata !116, metadata !"dst", metadata !117, i32 16777228, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!124 = metadata !{i32 786689, metadata !116, metadata !"src", metadata !117, i32 33554444, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!125 = metadata !{i32 786689, metadata !116, metadata !"count", metadata !117, i32 50331660, metadata !120, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!126 = metadata !{i32 786688, metadata !127, metadata !"a", metadata !117, i32 14, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!127 = metadata !{i32 786443, metadata !116, i32 12, i32 0, metadata !117, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!128 = metadata !{i32 786688, metadata !127, metadata !"b", metadata !117, i32 15, metadata !111, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!129 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!130 = metadata !{metadata !131}
!131 = metadata !{metadata !132}
!132 = metadata !{i32 786478, i32 0, metadata !133, metadata !"memset", metadata !"memset", metadata !"", metadata !133, i32 12, metadata !134, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!133 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!134 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !135, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!135 = metadata !{metadata !96, metadata !96, metadata !48, metadata !136}
!136 = metadata !{i32 786454, null, metadata !"size_t", metadata !133, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!137 = metadata !{metadata !138}
!138 = metadata !{metadata !139, metadata !140, metadata !141, metadata !142}
!139 = metadata !{i32 786689, metadata !132, metadata !"dst", metadata !133, i32 16777228, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!140 = metadata !{i32 786689, metadata !132, metadata !"s", metadata !133, i32 33554444, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!141 = metadata !{i32 786689, metadata !132, metadata !"count", metadata !133, i32 50331660, metadata !136, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!142 = metadata !{i32 786688, metadata !143, metadata !"a", metadata !133, i32 13, metadata !144, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!143 = metadata !{i32 786443, metadata !132, i32 12, i32 0, metadata !133, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!144 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !145} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!145 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !109} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!146 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!147 = metadata !{metadata !148}
!148 = metadata !{metadata !149, metadata !224, metadata !230}
!149 = metadata !{i32 786436, null, metadata !"cudaError", metadata !150, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !151, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!150 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!151 = metadata !{metadata !152, metadata !153, metadata !154, metadata !155, metadata !156, metadata !157, metadata !158, metadata !159, metadata !160, metadata !161, metadata !162, metadata !163, metadata !164, metadata !165, metadata !166, metadata !1
!152 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!153 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!154 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!155 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!156 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!157 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!158 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!159 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!160 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!161 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!162 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!163 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!164 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!165 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!166 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!167 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!168 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!169 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!170 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!171 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!172 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!173 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!174 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!175 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!176 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!177 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!178 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!179 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!180 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!181 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!182 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!183 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!184 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!185 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!186 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!187 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!188 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!189 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!190 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!191 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!192 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!193 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!194 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!195 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!196 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!197 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!198 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!199 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!200 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!201 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!202 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!203 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!204 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!205 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!206 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!207 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!208 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!209 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!210 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!211 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!212 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!213 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!214 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!215 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!216 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!217 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!218 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!219 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!220 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!221 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!222 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!223 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!224 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !150, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !225, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!225 = metadata !{metadata !226, metadata !227, metadata !228, metadata !229}
!226 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!227 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!228 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!229 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!230 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !150, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!231 = metadata !{metadata !232}
!232 = metadata !{metadata !233, metadata !262, metadata !268, metadata !274, metadata !278, metadata !286, metadata !294, metadata !302, metadata !310, metadata !317, metadata !325, metadata !329, metadata !336, metadata !350, metadata !360, metadata !3
!233 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !234, i32 24, metadata !235, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!234 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!235 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !236, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!236 = metadata !{metadata !237, metadata !238, metadata !246, metadata !253, metadata !254}
!237 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !234, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !149} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!238 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!239 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !150, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !240, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!240 = metadata !{metadata !241, metadata !242, metadata !243, metadata !244, metadata !245}
!241 = metadata !{i32 786445, metadata !239, metadata !"x", metadata !150, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !48} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!242 = metadata !{i32 786445, metadata !239, metadata !"y", metadata !150, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !48} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!243 = metadata !{i32 786445, metadata !239, metadata !"z", metadata !150, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !48} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!244 = metadata !{i32 786445, metadata !239, metadata !"w", metadata !150, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !48} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!245 = metadata !{i32 786445, metadata !239, metadata !"f", metadata !150, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !224} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!246 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !247} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!247 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !150, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !248, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!248 = metadata !{metadata !249, metadata !251, metadata !252}
!249 = metadata !{i32 786445, metadata !247, metadata !"width", metadata !150, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !250} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!250 = metadata !{i32 786454, null, metadata !"size_t", metadata !150, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!251 = metadata !{i32 786445, metadata !247, metadata !"height", metadata !150, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !250} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!252 = metadata !{i32 786445, metadata !247, metadata !"depth", metadata !150, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !250} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!253 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!254 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !255} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!255 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !150, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!256 = metadata !{metadata !257}
!257 = metadata !{metadata !258, metadata !259, metadata !260, metadata !261}
!258 = metadata !{i32 786689, metadata !233, metadata !"desc", metadata !234, i32 16777240, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!259 = metadata !{i32 786689, metadata !233, metadata !"extent", metadata !234, i32 33554456, metadata !246, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!260 = metadata !{i32 786689, metadata !233, metadata !"flags", metadata !234, i32 50331673, metadata !253, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!261 = metadata !{i32 786689, metadata !233, metadata !"array", metadata !234, i32 67108889, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!262 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !234, i32 29, metadata !263, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !265, 
!263 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !264, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!264 = metadata !{metadata !237, metadata !96}
!265 = metadata !{metadata !266}
!266 = metadata !{metadata !267}
!267 = metadata !{i32 786689, metadata !262, metadata !"devPtr", metadata !234, i32 16777245, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!268 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !234, i32 34, metadata !269, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!269 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !270, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!270 = metadata !{metadata !237, metadata !254}
!271 = metadata !{metadata !272}
!272 = metadata !{metadata !273}
!273 = metadata !{i32 786689, metadata !268, metadata !"array", metadata !234, i32 16777250, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!274 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !234, i32 39, metadata !263, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!275 = metadata !{metadata !276}
!276 = metadata !{metadata !277}
!277 = metadata !{i32 786689, metadata !274, metadata !"ptr", metadata !234, i32 16777255, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!278 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !234, i32 44, metadata !279, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!279 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !280, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!280 = metadata !{metadata !237, metadata !281, metadata !111}
!281 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !96} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!282 = metadata !{metadata !283}
!283 = metadata !{metadata !284, metadata !285}
!284 = metadata !{i32 786689, metadata !278, metadata !"devPtr", metadata !234, i32 16777260, metadata !281, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!285 = metadata !{i32 786689, metadata !278, metadata !"symbol", metadata !234, i32 33554476, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!286 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !234, i32 48, metadata !287, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!287 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !288, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!288 = metadata !{metadata !237, metadata !289, metadata !111}
!289 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !250} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!290 = metadata !{metadata !291}
!291 = metadata !{metadata !292, metadata !293}
!292 = metadata !{i32 786689, metadata !286, metadata !"size", metadata !234, i32 16777264, metadata !289, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!293 = metadata !{i32 786689, metadata !286, metadata !"symbol", metadata !234, i32 33554480, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!294 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !234, i32 52, metadata !295, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!295 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !296, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!296 = metadata !{metadata !237, metadata !281, metadata !250, metadata !25}
!297 = metadata !{metadata !298}
!298 = metadata !{metadata !299, metadata !300, metadata !301}
!299 = metadata !{i32 786689, metadata !294, metadata !"pHost", metadata !234, i32 16777268, metadata !281, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!300 = metadata !{i32 786689, metadata !294, metadata !"size", metadata !234, i32 33554484, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!301 = metadata !{i32 786689, metadata !294, metadata !"flags", metadata !234, i32 50331700, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!302 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !234, i32 56, metadata !303, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!303 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !304, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!304 = metadata !{metadata !237, metadata !281, metadata !96, metadata !25}
!305 = metadata !{metadata !306}
!306 = metadata !{metadata !307, metadata !308, metadata !309}
!307 = metadata !{i32 786689, metadata !302, metadata !"pDevice", metadata !234, i32 16777272, metadata !281, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!308 = metadata !{i32 786689, metadata !302, metadata !"pHost", metadata !234, i32 33554488, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!309 = metadata !{i32 786689, metadata !302, metadata !"flags", metadata !234, i32 50331704, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!310 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !234, i32 60, metadata !311, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!311 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !312, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!312 = metadata !{metadata !237, metadata !253, metadata !96}
!313 = metadata !{metadata !314}
!314 = metadata !{metadata !315, metadata !316}
!315 = metadata !{i32 786689, metadata !310, metadata !"pFlags", metadata !234, i32 16777276, metadata !253, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!316 = metadata !{i32 786689, metadata !310, metadata !"pHost", metadata !234, i32 33554492, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!317 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !234, i32 64, metadata !318, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!318 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !319, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!319 = metadata !{metadata !237, metadata !96, metadata !250, metadata !25}
!320 = metadata !{metadata !321}
!321 = metadata !{metadata !322, metadata !323, metadata !324}
!322 = metadata !{i32 786689, metadata !317, metadata !"ptr", metadata !234, i32 16777280, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!323 = metadata !{i32 786689, metadata !317, metadata !"size", metadata !234, i32 33554496, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!324 = metadata !{i32 786689, metadata !317, metadata !"flags", metadata !234, i32 50331712, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!325 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !234, i32 68, metadata !263, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!326 = metadata !{metadata !327}
!327 = metadata !{metadata !328}
!328 = metadata !{i32 786689, metadata !325, metadata !"ptr", metadata !234, i32 16777284, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!329 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !234, i32 72, metadata !330, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!330 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !331, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!331 = metadata !{metadata !237, metadata !281, metadata !250}
!332 = metadata !{metadata !333}
!333 = metadata !{metadata !334, metadata !335}
!334 = metadata !{i32 786689, metadata !329, metadata !"devPtr", metadata !234, i32 16777288, metadata !281, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!335 = metadata !{i32 786689, metadata !329, metadata !"size", metadata !234, i32 33554504, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!336 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !234, i32 80, metadata !337, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!337 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !338, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!338 = metadata !{metadata !237, metadata !339, metadata !247}
!339 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !340} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!340 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !150, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !341, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!341 = metadata !{metadata !342, metadata !343, metadata !344, metadata !345}
!342 = metadata !{i32 786445, metadata !340, metadata !"ptr", metadata !150, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !96} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!343 = metadata !{i32 786445, metadata !340, metadata !"pitch", metadata !150, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !250} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!344 = metadata !{i32 786445, metadata !340, metadata !"xsize", metadata !150, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !250} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!345 = metadata !{i32 786445, metadata !340, metadata !"ysize", metadata !150, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !250} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!346 = metadata !{metadata !347}
!347 = metadata !{metadata !348, metadata !349}
!348 = metadata !{i32 786689, metadata !336, metadata !"pitchedDevPtr", metadata !234, i32 16777296, metadata !339, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!349 = metadata !{i32 786689, metadata !336, metadata !"extent", metadata !234, i32 33554512, metadata !247, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!350 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !234, i32 84, metadata !351, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!351 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !352, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!352 = metadata !{metadata !237, metadata !353, metadata !238, metadata !247, metadata !25}
!353 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !254} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!354 = metadata !{metadata !355}
!355 = metadata !{metadata !356, metadata !357, metadata !358, metadata !359}
!356 = metadata !{i32 786689, metadata !350, metadata !"array", metadata !234, i32 16777300, metadata !353, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!357 = metadata !{i32 786689, metadata !350, metadata !"desc", metadata !234, i32 33554516, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!358 = metadata !{i32 786689, metadata !350, metadata !"extent", metadata !234, i32 50331733, metadata !247, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!359 = metadata !{i32 786689, metadata !350, metadata !"flags", metadata !234, i32 67108949, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!360 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !234, i32 89, metadata !361, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!361 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !362, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!362 = metadata !{metadata !237, metadata !353, metadata !238, metadata !250, metadata !250, metadata !25}
!363 = metadata !{metadata !364}
!364 = metadata !{metadata !365, metadata !366, metadata !367, metadata !368, metadata !369}
!365 = metadata !{i32 786689, metadata !360, metadata !"array", metadata !234, i32 16777305, metadata !353, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!366 = metadata !{i32 786689, metadata !360, metadata !"desc", metadata !234, i32 33554521, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!367 = metadata !{i32 786689, metadata !360, metadata !"width", metadata !234, i32 50331738, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!368 = metadata !{i32 786689, metadata !360, metadata !"height", metadata !234, i32 67108954, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!369 = metadata !{i32 786689, metadata !360, metadata !"flags", metadata !234, i32 83886170, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!370 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !234, i32 94, metadata !330, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!371 = metadata !{metadata !372}
!372 = metadata !{metadata !373, metadata !374}
!373 = metadata !{i32 786689, metadata !370, metadata !"ptr", metadata !234, i32 16777310, metadata !281, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!374 = metadata !{i32 786689, metadata !370, metadata !"size", metadata !234, i32 33554526, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!375 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !234, i32 102, metadata !376, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!376 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !377, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!377 = metadata !{metadata !237, metadata !281, metadata !289, metadata !250, metadata !250}
!378 = metadata !{metadata !379}
!379 = metadata !{metadata !380, metadata !381, metadata !382, metadata !383}
!380 = metadata !{i32 786689, metadata !375, metadata !"devPtr", metadata !234, i32 16777318, metadata !281, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!381 = metadata !{i32 786689, metadata !375, metadata !"pitch", metadata !234, i32 33554534, metadata !289, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!382 = metadata !{i32 786689, metadata !375, metadata !"width", metadata !234, i32 50331750, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!383 = metadata !{i32 786689, metadata !375, metadata !"height", metadata !234, i32 67108966, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!384 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !234, i32 106, metadata !385, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!385 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !386, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!386 = metadata !{metadata !237, metadata !96, metadata !97, metadata !250, metadata !230}
!387 = metadata !{metadata !388}
!388 = metadata !{metadata !389, metadata !390, metadata !391, metadata !392}
!389 = metadata !{i32 786689, metadata !384, metadata !"dst", metadata !234, i32 16777322, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!390 = metadata !{i32 786689, metadata !384, metadata !"src", metadata !234, i32 33554538, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!391 = metadata !{i32 786689, metadata !384, metadata !"count", metadata !234, i32 50331754, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!392 = metadata !{i32 786689, metadata !384, metadata !"kind", metadata !234, i32 67108970, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!393 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !234, i32 111, metadata !394, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!394 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !395, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!395 = metadata !{metadata !237, metadata !96, metadata !250, metadata !97, metadata !250, metadata !250, metadata !250, metadata !230}
!396 = metadata !{metadata !397}
!397 = metadata !{metadata !398, metadata !399, metadata !400, metadata !401, metadata !402, metadata !403, metadata !404}
!398 = metadata !{i32 786689, metadata !393, metadata !"dst", metadata !234, i32 16777327, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!399 = metadata !{i32 786689, metadata !393, metadata !"dpitch", metadata !234, i32 33554543, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!400 = metadata !{i32 786689, metadata !393, metadata !"src", metadata !234, i32 50331759, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!401 = metadata !{i32 786689, metadata !393, metadata !"spitch", metadata !234, i32 67108975, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!402 = metadata !{i32 786689, metadata !393, metadata !"width", metadata !234, i32 83886192, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!403 = metadata !{i32 786689, metadata !393, metadata !"height", metadata !234, i32 100663408, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!404 = metadata !{i32 786689, metadata !393, metadata !"kind", metadata !234, i32 117440624, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!405 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !234, i32 116, metadata !406, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!406 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !407, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!407 = metadata !{metadata !237, metadata !254, metadata !250, metadata !250, metadata !254, metadata !250, metadata !250, metadata !250, metadata !250, metadata !230}
!408 = metadata !{metadata !409}
!409 = metadata !{metadata !410, metadata !411, metadata !412, metadata !413, metadata !414, metadata !415, metadata !416, metadata !417, metadata !418}
!410 = metadata !{i32 786689, metadata !405, metadata !"dst", metadata !234, i32 16777332, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!411 = metadata !{i32 786689, metadata !405, metadata !"wOffsetDst", metadata !234, i32 33554548, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!412 = metadata !{i32 786689, metadata !405, metadata !"hOffsetDst", metadata !234, i32 50331764, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!413 = metadata !{i32 786689, metadata !405, metadata !"src", metadata !234, i32 67108981, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!414 = metadata !{i32 786689, metadata !405, metadata !"wOffsetSrc", metadata !234, i32 83886197, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!415 = metadata !{i32 786689, metadata !405, metadata !"hOffsetSrc", metadata !234, i32 100663413, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!416 = metadata !{i32 786689, metadata !405, metadata !"width", metadata !234, i32 117440630, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!417 = metadata !{i32 786689, metadata !405, metadata !"height", metadata !234, i32 134217846, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!418 = metadata !{i32 786689, metadata !405, metadata !"kind", metadata !234, i32 150995062, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!419 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !234, i32 122, metadata !420, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!420 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !421, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!421 = metadata !{metadata !237, metadata !96, metadata !250, metadata !97, metadata !250, metadata !250, metadata !250, metadata !230, metadata !422}
!422 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !234, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !423} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!423 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !424} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!424 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !150, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!425 = metadata !{metadata !426}
!426 = metadata !{metadata !427, metadata !428, metadata !429, metadata !430, metadata !431, metadata !432, metadata !433, metadata !434}
!427 = metadata !{i32 786689, metadata !419, metadata !"dst", metadata !234, i32 16777338, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!428 = metadata !{i32 786689, metadata !419, metadata !"dpitch", metadata !234, i32 33554554, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!429 = metadata !{i32 786689, metadata !419, metadata !"src", metadata !234, i32 50331770, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!430 = metadata !{i32 786689, metadata !419, metadata !"spitch", metadata !234, i32 67108986, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!431 = metadata !{i32 786689, metadata !419, metadata !"width", metadata !234, i32 83886203, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!432 = metadata !{i32 786689, metadata !419, metadata !"height", metadata !234, i32 100663419, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!433 = metadata !{i32 786689, metadata !419, metadata !"kind", metadata !234, i32 117440635, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!434 = metadata !{i32 786689, metadata !419, metadata !"stream", metadata !234, i32 134217852, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!435 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !234, i32 128, metadata !436, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!436 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !437, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!437 = metadata !{metadata !237, metadata !96, metadata !250, metadata !254, metadata !250, metadata !250, metadata !250, metadata !250, metadata !230}
!438 = metadata !{metadata !439}
!439 = metadata !{metadata !440, metadata !441, metadata !442, metadata !443, metadata !444, metadata !445, metadata !446, metadata !447}
!440 = metadata !{i32 786689, metadata !435, metadata !"dst", metadata !234, i32 16777344, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!441 = metadata !{i32 786689, metadata !435, metadata !"dpitch", metadata !234, i32 33554560, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!442 = metadata !{i32 786689, metadata !435, metadata !"src", metadata !234, i32 50331776, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!443 = metadata !{i32 786689, metadata !435, metadata !"wOffset", metadata !234, i32 67108993, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!444 = metadata !{i32 786689, metadata !435, metadata !"hOffset", metadata !234, i32 83886209, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!445 = metadata !{i32 786689, metadata !435, metadata !"width", metadata !234, i32 100663425, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!446 = metadata !{i32 786689, metadata !435, metadata !"height", metadata !234, i32 117440641, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!447 = metadata !{i32 786689, metadata !435, metadata !"kind", metadata !234, i32 134217858, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!448 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !234, i32 134, metadata !449, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!449 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !450, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!450 = metadata !{metadata !237, metadata !96, metadata !250, metadata !254, metadata !250, metadata !250, metadata !250, metadata !250, metadata !230, metadata !422}
!451 = metadata !{metadata !452}
!452 = metadata !{metadata !453, metadata !454, metadata !455, metadata !456, metadata !457, metadata !458, metadata !459, metadata !460, metadata !461}
!453 = metadata !{i32 786689, metadata !448, metadata !"dst", metadata !234, i32 16777350, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!454 = metadata !{i32 786689, metadata !448, metadata !"dpitch", metadata !234, i32 33554566, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!455 = metadata !{i32 786689, metadata !448, metadata !"src", metadata !234, i32 50331782, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!456 = metadata !{i32 786689, metadata !448, metadata !"wOffset", metadata !234, i32 67108999, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!457 = metadata !{i32 786689, metadata !448, metadata !"hOffset", metadata !234, i32 83886215, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!458 = metadata !{i32 786689, metadata !448, metadata !"width", metadata !234, i32 100663431, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!459 = metadata !{i32 786689, metadata !448, metadata !"height", metadata !234, i32 117440647, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!460 = metadata !{i32 786689, metadata !448, metadata !"kind", metadata !234, i32 134217864, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!461 = metadata !{i32 786689, metadata !448, metadata !"stream", metadata !234, i32 150995080, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!462 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !234, i32 140, metadata !463, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!463 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !464, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!464 = metadata !{metadata !237, metadata !254, metadata !250, metadata !250, metadata !97, metadata !250, metadata !250, metadata !250, metadata !230}
!465 = metadata !{metadata !466}
!466 = metadata !{metadata !467, metadata !468, metadata !469, metadata !470, metadata !471, metadata !472, metadata !473, metadata !474}
!467 = metadata !{i32 786689, metadata !462, metadata !"dst", metadata !234, i32 16777356, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!468 = metadata !{i32 786689, metadata !462, metadata !"wOffset", metadata !234, i32 33554572, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!469 = metadata !{i32 786689, metadata !462, metadata !"hOffset", metadata !234, i32 50331788, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!470 = metadata !{i32 786689, metadata !462, metadata !"src", metadata !234, i32 67109005, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!471 = metadata !{i32 786689, metadata !462, metadata !"spitch", metadata !234, i32 83886221, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!472 = metadata !{i32 786689, metadata !462, metadata !"width", metadata !234, i32 100663437, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!473 = metadata !{i32 786689, metadata !462, metadata !"height", metadata !234, i32 117440653, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!474 = metadata !{i32 786689, metadata !462, metadata !"kind", metadata !234, i32 134217870, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!475 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !234, i32 146, metadata !476, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!476 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !477, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!477 = metadata !{metadata !237, metadata !254, metadata !250, metadata !250, metadata !97, metadata !250, metadata !250, metadata !250, metadata !230, metadata !422}
!478 = metadata !{metadata !479}
!479 = metadata !{metadata !480, metadata !481, metadata !482, metadata !483, metadata !484, metadata !485, metadata !486, metadata !487, metadata !488}
!480 = metadata !{i32 786689, metadata !475, metadata !"dst", metadata !234, i32 16777362, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!481 = metadata !{i32 786689, metadata !475, metadata !"wOffset", metadata !234, i32 33554578, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!482 = metadata !{i32 786689, metadata !475, metadata !"hOffset", metadata !234, i32 50331794, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!483 = metadata !{i32 786689, metadata !475, metadata !"src", metadata !234, i32 67109011, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!484 = metadata !{i32 786689, metadata !475, metadata !"spitch", metadata !234, i32 83886227, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!485 = metadata !{i32 786689, metadata !475, metadata !"width", metadata !234, i32 100663443, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!486 = metadata !{i32 786689, metadata !475, metadata !"height", metadata !234, i32 117440659, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!487 = metadata !{i32 786689, metadata !475, metadata !"kind", metadata !234, i32 134217876, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!488 = metadata !{i32 786689, metadata !475, metadata !"stream", metadata !234, i32 150995092, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!489 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !234, i32 152, metadata !490, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!490 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !491, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!491 = metadata !{metadata !237, metadata !492}
!492 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !493} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!493 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !494} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!494 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !150, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !495, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!495 = metadata !{metadata !496, metadata !498, metadata !504, metadata !505, metadata !506, metadata !507, metadata !508, metadata !509}
!496 = metadata !{i32 786445, metadata !494, metadata !"srcArray", metadata !150, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !497} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!497 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !150, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !254} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!498 = metadata !{i32 786445, metadata !494, metadata !"srcPos", metadata !150, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !499} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!499 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !150, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !500, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!500 = metadata !{metadata !501, metadata !502, metadata !503}
!501 = metadata !{i32 786445, metadata !499, metadata !"x", metadata !150, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !250} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!502 = metadata !{i32 786445, metadata !499, metadata !"y", metadata !150, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !250} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!503 = metadata !{i32 786445, metadata !499, metadata !"z", metadata !150, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !250} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!504 = metadata !{i32 786445, metadata !494, metadata !"srcPtr", metadata !150, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !340} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!505 = metadata !{i32 786445, metadata !494, metadata !"dstArray", metadata !150, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !497} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!506 = metadata !{i32 786445, metadata !494, metadata !"dstPos", metadata !150, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !499} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!507 = metadata !{i32 786445, metadata !494, metadata !"dstPtr", metadata !150, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !340} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!508 = metadata !{i32 786445, metadata !494, metadata !"extent", metadata !150, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !247} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!509 = metadata !{i32 786445, metadata !494, metadata !"kind", metadata !150, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !230} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!510 = metadata !{metadata !511}
!511 = metadata !{metadata !512}
!512 = metadata !{i32 786689, metadata !489, metadata !"p", metadata !234, i32 16777368, metadata !492, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!513 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !234, i32 156, metadata !514, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!514 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !515, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!515 = metadata !{metadata !237, metadata !492, metadata !422}
!516 = metadata !{metadata !517}
!517 = metadata !{metadata !518, metadata !519}
!518 = metadata !{i32 786689, metadata !513, metadata !"p", metadata !234, i32 16777372, metadata !492, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!519 = metadata !{i32 786689, metadata !513, metadata !"stream", metadata !234, i32 33554588, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!520 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !234, i32 160, metadata !521, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!521 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !522, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!522 = metadata !{metadata !237, metadata !523}
!523 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !524} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!524 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !525} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!525 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !150, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !526, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!526 = metadata !{metadata !527, metadata !528, metadata !529, metadata !530, metadata !531, metadata !532, metadata !533, metadata !534, metadata !535}
!527 = metadata !{i32 786445, metadata !525, metadata !"srcArray", metadata !150, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !497} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!528 = metadata !{i32 786445, metadata !525, metadata !"srcPos", metadata !150, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !499} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!529 = metadata !{i32 786445, metadata !525, metadata !"srcPtr", metadata !150, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !340} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!530 = metadata !{i32 786445, metadata !525, metadata !"srcDevice", metadata !150, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !48} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!531 = metadata !{i32 786445, metadata !525, metadata !"dstArray", metadata !150, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !497} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!532 = metadata !{i32 786445, metadata !525, metadata !"dstPos", metadata !150, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !499} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!533 = metadata !{i32 786445, metadata !525, metadata !"dstPtr", metadata !150, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !340} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!534 = metadata !{i32 786445, metadata !525, metadata !"dstDevice", metadata !150, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !48} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!535 = metadata !{i32 786445, metadata !525, metadata !"extent", metadata !150, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !247} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!536 = metadata !{metadata !537}
!537 = metadata !{metadata !538}
!538 = metadata !{i32 786689, metadata !520, metadata !"p", metadata !234, i32 16777376, metadata !523, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!539 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !234, i32 164, metadata !540, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!540 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !541, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!541 = metadata !{metadata !237, metadata !523, metadata !422}
!542 = metadata !{metadata !543}
!543 = metadata !{metadata !544, metadata !545}
!544 = metadata !{i32 786689, metadata !539, metadata !"p", metadata !234, i32 16777380, metadata !523, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!545 = metadata !{i32 786689, metadata !539, metadata !"stream", metadata !234, i32 33554596, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!546 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !234, i32 168, metadata !547, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!547 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !548, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!548 = metadata !{metadata !237, metadata !254, metadata !250, metadata !250, metadata !254, metadata !250, metadata !250, metadata !250, metadata !230}
!549 = metadata !{metadata !550}
!550 = metadata !{metadata !551, metadata !552, metadata !553, metadata !554, metadata !555, metadata !556, metadata !557, metadata !558}
!551 = metadata !{i32 786689, metadata !546, metadata !"dst", metadata !234, i32 16777384, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!552 = metadata !{i32 786689, metadata !546, metadata !"wOffsetDst", metadata !234, i32 33554600, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!553 = metadata !{i32 786689, metadata !546, metadata !"hOffsetDst", metadata !234, i32 50331816, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!554 = metadata !{i32 786689, metadata !546, metadata !"src", metadata !234, i32 67109033, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!555 = metadata !{i32 786689, metadata !546, metadata !"wOffsetSrc", metadata !234, i32 83886249, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!556 = metadata !{i32 786689, metadata !546, metadata !"hOffsetSrc", metadata !234, i32 100663465, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!557 = metadata !{i32 786689, metadata !546, metadata !"count", metadata !234, i32 117440682, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!558 = metadata !{i32 786689, metadata !546, metadata !"kind", metadata !234, i32 134217898, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!559 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !234, i32 174, metadata !560, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!560 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !561, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!561 = metadata !{metadata !237, metadata !96, metadata !97, metadata !250, metadata !230, metadata !422}
!562 = metadata !{metadata !563}
!563 = metadata !{metadata !564, metadata !565, metadata !566, metadata !567, metadata !568}
!564 = metadata !{i32 786689, metadata !559, metadata !"dst", metadata !234, i32 16777390, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!565 = metadata !{i32 786689, metadata !559, metadata !"src", metadata !234, i32 33554606, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!566 = metadata !{i32 786689, metadata !559, metadata !"count", metadata !234, i32 50331822, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!567 = metadata !{i32 786689, metadata !559, metadata !"kind", metadata !234, i32 67109039, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!568 = metadata !{i32 786689, metadata !559, metadata !"stream", metadata !234, i32 83886255, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!569 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !234, i32 179, metadata !570, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!570 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !571, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!571 = metadata !{metadata !237, metadata !96, metadata !254, metadata !250, metadata !250, metadata !250, metadata !230}
!572 = metadata !{metadata !573}
!573 = metadata !{metadata !574, metadata !575, metadata !576, metadata !577, metadata !578, metadata !579}
!574 = metadata !{i32 786689, metadata !569, metadata !"dst", metadata !234, i32 16777395, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!575 = metadata !{i32 786689, metadata !569, metadata !"src", metadata !234, i32 33554611, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!576 = metadata !{i32 786689, metadata !569, metadata !"wOffset", metadata !234, i32 50331827, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!577 = metadata !{i32 786689, metadata !569, metadata !"hOffset", metadata !234, i32 67109044, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!578 = metadata !{i32 786689, metadata !569, metadata !"count", metadata !234, i32 83886260, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!579 = metadata !{i32 786689, metadata !569, metadata !"kind", metadata !234, i32 100663476, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!580 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !234, i32 184, metadata !581, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!581 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !582, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!582 = metadata !{metadata !237, metadata !96, metadata !254, metadata !250, metadata !250, metadata !250, metadata !230, metadata !422}
!583 = metadata !{metadata !584}
!584 = metadata !{metadata !585, metadata !586, metadata !587, metadata !588, metadata !589, metadata !590, metadata !591}
!585 = metadata !{i32 786689, metadata !580, metadata !"dst", metadata !234, i32 16777400, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!586 = metadata !{i32 786689, metadata !580, metadata !"src", metadata !234, i32 33554616, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!587 = metadata !{i32 786689, metadata !580, metadata !"wOffset", metadata !234, i32 50331832, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!588 = metadata !{i32 786689, metadata !580, metadata !"hOffset", metadata !234, i32 67109049, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!589 = metadata !{i32 786689, metadata !580, metadata !"count", metadata !234, i32 83886265, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!590 = metadata !{i32 786689, metadata !580, metadata !"kind", metadata !234, i32 100663481, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!591 = metadata !{i32 786689, metadata !580, metadata !"stream", metadata !234, i32 117440698, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!592 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !234, i32 190, metadata !593, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!593 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !594, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!594 = metadata !{metadata !237, metadata !96, metadata !111, metadata !250, metadata !250, metadata !230}
!595 = metadata !{metadata !596}
!596 = metadata !{metadata !597, metadata !598, metadata !599, metadata !600, metadata !601}
!597 = metadata !{i32 786689, metadata !592, metadata !"dst", metadata !234, i32 16777406, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!598 = metadata !{i32 786689, metadata !592, metadata !"symbol", metadata !234, i32 33554622, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!599 = metadata !{i32 786689, metadata !592, metadata !"count", metadata !234, i32 50331838, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!600 = metadata !{i32 786689, metadata !592, metadata !"offset", metadata !234, i32 67109055, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!601 = metadata !{i32 786689, metadata !592, metadata !"kind", metadata !234, i32 83886271, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!602 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !234, i32 195, metadata !603, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!603 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !604, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!604 = metadata !{metadata !237, metadata !96, metadata !111, metadata !250, metadata !250, metadata !230, metadata !422}
!605 = metadata !{metadata !606}
!606 = metadata !{metadata !607, metadata !608, metadata !609, metadata !610, metadata !611, metadata !612}
!607 = metadata !{i32 786689, metadata !602, metadata !"dst", metadata !234, i32 16777411, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!608 = metadata !{i32 786689, metadata !602, metadata !"symbol", metadata !234, i32 33554627, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!609 = metadata !{i32 786689, metadata !602, metadata !"count", metadata !234, i32 50331843, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!610 = metadata !{i32 786689, metadata !602, metadata !"offset", metadata !234, i32 67109060, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!611 = metadata !{i32 786689, metadata !602, metadata !"kind", metadata !234, i32 83886276, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!612 = metadata !{i32 786689, metadata !602, metadata !"stream", metadata !234, i32 100663493, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!613 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !234, i32 201, metadata !614, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!614 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !615, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!615 = metadata !{metadata !237, metadata !96, metadata !48, metadata !97, metadata !48, metadata !250}
!616 = metadata !{metadata !617}
!617 = metadata !{metadata !618, metadata !619, metadata !620, metadata !621, metadata !622}
!618 = metadata !{i32 786689, metadata !613, metadata !"dst", metadata !234, i32 16777417, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!619 = metadata !{i32 786689, metadata !613, metadata !"dstDevice", metadata !234, i32 33554633, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!620 = metadata !{i32 786689, metadata !613, metadata !"src", metadata !234, i32 50331849, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!621 = metadata !{i32 786689, metadata !613, metadata !"srcDevice", metadata !234, i32 67109065, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!622 = metadata !{i32 786689, metadata !613, metadata !"count", metadata !234, i32 83886281, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!623 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !234, i32 206, metadata !624, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!624 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !625, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!625 = metadata !{metadata !237, metadata !96, metadata !48, metadata !97, metadata !48, metadata !250, metadata !422}
!626 = metadata !{metadata !627}
!627 = metadata !{metadata !628, metadata !629, metadata !630, metadata !631, metadata !632, metadata !633}
!628 = metadata !{i32 786689, metadata !623, metadata !"dst", metadata !234, i32 16777422, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!629 = metadata !{i32 786689, metadata !623, metadata !"dstDevice", metadata !234, i32 33554638, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!630 = metadata !{i32 786689, metadata !623, metadata !"src", metadata !234, i32 50331854, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!631 = metadata !{i32 786689, metadata !623, metadata !"srcDevice", metadata !234, i32 67109070, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!632 = metadata !{i32 786689, metadata !623, metadata !"count", metadata !234, i32 83886287, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!633 = metadata !{i32 786689, metadata !623, metadata !"stream", metadata !234, i32 100663503, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!634 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !234, i32 212, metadata !635, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!635 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !636, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!636 = metadata !{metadata !237, metadata !254, metadata !250, metadata !250, metadata !97, metadata !250, metadata !230}
!637 = metadata !{metadata !638}
!638 = metadata !{metadata !639, metadata !640, metadata !641, metadata !642, metadata !643, metadata !644}
!639 = metadata !{i32 786689, metadata !634, metadata !"dst", metadata !234, i32 16777428, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!640 = metadata !{i32 786689, metadata !634, metadata !"wOffset", metadata !234, i32 33554644, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!641 = metadata !{i32 786689, metadata !634, metadata !"hOffset", metadata !234, i32 50331860, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!642 = metadata !{i32 786689, metadata !634, metadata !"src", metadata !234, i32 67109077, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!643 = metadata !{i32 786689, metadata !634, metadata !"count", metadata !234, i32 83886293, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!644 = metadata !{i32 786689, metadata !634, metadata !"kind", metadata !234, i32 100663509, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!645 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !234, i32 217, metadata !646, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!646 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !647, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!647 = metadata !{metadata !237, metadata !254, metadata !250, metadata !250, metadata !97, metadata !250, metadata !230, metadata !422}
!648 = metadata !{metadata !649}
!649 = metadata !{metadata !650, metadata !651, metadata !652, metadata !653, metadata !654, metadata !655, metadata !656}
!650 = metadata !{i32 786689, metadata !645, metadata !"dst", metadata !234, i32 16777433, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!651 = metadata !{i32 786689, metadata !645, metadata !"wOffset", metadata !234, i32 33554649, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!652 = metadata !{i32 786689, metadata !645, metadata !"hOffset", metadata !234, i32 50331865, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!653 = metadata !{i32 786689, metadata !645, metadata !"src", metadata !234, i32 67109082, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!654 = metadata !{i32 786689, metadata !645, metadata !"count", metadata !234, i32 83886298, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!655 = metadata !{i32 786689, metadata !645, metadata !"kind", metadata !234, i32 100663514, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!656 = metadata !{i32 786689, metadata !645, metadata !"stream", metadata !234, i32 117440731, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!657 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !234, i32 223, metadata !658, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!658 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !659, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!659 = metadata !{metadata !237, metadata !108, metadata !97, metadata !250, metadata !250, metadata !230}
!660 = metadata !{metadata !661}
!661 = metadata !{metadata !662, metadata !663, metadata !664, metadata !665, metadata !666}
!662 = metadata !{i32 786689, metadata !657, metadata !"symbol", metadata !234, i32 16777439, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!663 = metadata !{i32 786689, metadata !657, metadata !"src", metadata !234, i32 33554655, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!664 = metadata !{i32 786689, metadata !657, metadata !"count", metadata !234, i32 50331871, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!665 = metadata !{i32 786689, metadata !657, metadata !"offset", metadata !234, i32 67109088, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!666 = metadata !{i32 786689, metadata !657, metadata !"kind", metadata !234, i32 83886304, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!667 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !234, i32 229, metadata !668, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!668 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !669, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!669 = metadata !{metadata !237, metadata !111, metadata !97, metadata !250, metadata !250, metadata !230, metadata !422}
!670 = metadata !{metadata !671}
!671 = metadata !{metadata !672, metadata !673, metadata !674, metadata !675, metadata !676, metadata !677}
!672 = metadata !{i32 786689, metadata !667, metadata !"symbol", metadata !234, i32 16777445, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!673 = metadata !{i32 786689, metadata !667, metadata !"src", metadata !234, i32 33554661, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!674 = metadata !{i32 786689, metadata !667, metadata !"count", metadata !234, i32 50331877, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!675 = metadata !{i32 786689, metadata !667, metadata !"offset", metadata !234, i32 67109093, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!676 = metadata !{i32 786689, metadata !667, metadata !"kind", metadata !234, i32 83886310, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!677 = metadata !{i32 786689, metadata !667, metadata !"stream", metadata !234, i32 100663526, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!678 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !234, i32 234, metadata !679, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!679 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !680, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!680 = metadata !{metadata !237, metadata !289, metadata !289}
!681 = metadata !{metadata !682}
!682 = metadata !{metadata !683, metadata !684}
!683 = metadata !{i32 786689, metadata !678, metadata !"free", metadata !234, i32 16777450, metadata !289, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!684 = metadata !{i32 786689, metadata !678, metadata !"total", metadata !234, i32 33554666, metadata !289, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!685 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !234, i32 238, metadata !686, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!686 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !687, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!687 = metadata !{metadata !237, metadata !96, metadata !48, metadata !250}
!688 = metadata !{metadata !689}
!689 = metadata !{metadata !690, metadata !691, metadata !692}
!690 = metadata !{i32 786689, metadata !685, metadata !"devPtr", metadata !234, i32 16777454, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!691 = metadata !{i32 786689, metadata !685, metadata !"value", metadata !234, i32 33554670, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!692 = metadata !{i32 786689, metadata !685, metadata !"count", metadata !234, i32 50331886, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!693 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !234, i32 243, metadata !694, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!694 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !695, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!695 = metadata !{metadata !237, metadata !96, metadata !250, metadata !48, metadata !250, metadata !250}
!696 = metadata !{metadata !697}
!697 = metadata !{metadata !698, metadata !699, metadata !700, metadata !701, metadata !702}
!698 = metadata !{i32 786689, metadata !693, metadata !"devPtr", metadata !234, i32 16777459, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!699 = metadata !{i32 786689, metadata !693, metadata !"pitch", metadata !234, i32 33554675, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!700 = metadata !{i32 786689, metadata !693, metadata !"value", metadata !234, i32 50331891, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!701 = metadata !{i32 786689, metadata !693, metadata !"width", metadata !234, i32 67109108, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!702 = metadata !{i32 786689, metadata !693, metadata !"height", metadata !234, i32 83886324, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!703 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !234, i32 248, metadata !704, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!704 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !705, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!705 = metadata !{metadata !237, metadata !96, metadata !250, metadata !48, metadata !250, metadata !250, metadata !422}
!706 = metadata !{metadata !707}
!707 = metadata !{metadata !708, metadata !709, metadata !710, metadata !711, metadata !712, metadata !713}
!708 = metadata !{i32 786689, metadata !703, metadata !"devPtr", metadata !234, i32 16777464, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!709 = metadata !{i32 786689, metadata !703, metadata !"pitch", metadata !234, i32 33554680, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!710 = metadata !{i32 786689, metadata !703, metadata !"value", metadata !234, i32 50331896, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!711 = metadata !{i32 786689, metadata !703, metadata !"width", metadata !234, i32 67109113, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!712 = metadata !{i32 786689, metadata !703, metadata !"height", metadata !234, i32 83886329, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!713 = metadata !{i32 786689, metadata !703, metadata !"stream", metadata !234, i32 100663545, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!714 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !234, i32 253, metadata !715, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!715 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !716, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!716 = metadata !{metadata !237, metadata !340, metadata !48, metadata !247}
!717 = metadata !{metadata !718}
!718 = metadata !{metadata !719, metadata !720, metadata !721}
!719 = metadata !{i32 786689, metadata !714, metadata !"pitchedDevPtr", metadata !234, i32 16777469, metadata !340, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!720 = metadata !{i32 786689, metadata !714, metadata !"value", metadata !234, i32 33554685, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!721 = metadata !{i32 786689, metadata !714, metadata !"extent", metadata !234, i32 50331902, metadata !247, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!722 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !234, i32 258, metadata !723, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!723 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !724, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!724 = metadata !{metadata !237, metadata !340, metadata !48, metadata !247, metadata !422}
!725 = metadata !{metadata !726}
!726 = metadata !{metadata !727, metadata !728, metadata !729, metadata !730}
!727 = metadata !{i32 786689, metadata !722, metadata !"pitchedDevPtr", metadata !234, i32 16777474, metadata !340, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!728 = metadata !{i32 786689, metadata !722, metadata !"value", metadata !234, i32 33554690, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!729 = metadata !{i32 786689, metadata !722, metadata !"extent", metadata !234, i32 50331907, metadata !247, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!730 = metadata !{i32 786689, metadata !722, metadata !"stream", metadata !234, i32 67109123, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!731 = metadata !{i32 786478, i32 0, metadata !234, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !234, i32 263, metadata !732, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!732 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !733, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!733 = metadata !{metadata !237, metadata !96, metadata !48, metadata !250, metadata !422}
!734 = metadata !{metadata !735}
!735 = metadata !{metadata !736, metadata !737, metadata !738, metadata !739}
!736 = metadata !{i32 786689, metadata !731, metadata !"devPtr", metadata !234, i32 16777479, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!737 = metadata !{i32 786689, metadata !731, metadata !"value", metadata !234, i32 33554695, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!738 = metadata !{i32 786689, metadata !731, metadata !"count", metadata !234, i32 50331911, metadata !250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!739 = metadata !{i32 786689, metadata !731, metadata !"stream", metadata !234, i32 67109127, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!740 = metadata !{i32 10, i32 0, metadata !741, null}
!741 = metadata !{i32 786443, metadata !15, i32 9, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/052_initstruct_fail/main.cpp]
!742 = metadata !{i32 11, i32 0, metadata !741, null}
!743 = metadata !{i32 12, i32 0, metadata !741, null}
!744 = metadata !{i32 18, i32 0, metadata !745, null}
!745 = metadata !{i32 786443, metadata !45, i32 14, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/052_initstruct_fail/main.cpp]
!746 = metadata !{i32 20, i32 0, metadata !745, null}
!747 = metadata !{i32 22, i32 0, metadata !745, null}
!748 = metadata !{i32 23, i32 0, metadata !749, null}
!749 = metadata !{i32 786443, metadata !745, i32 23, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/052_initstruct_fail/main.cpp]
!750 = metadata !{i32 25, i32 0, metadata !749, null}
!751 = metadata !{i32 29, i32 0, metadata !745, null}
!752 = metadata !{i32 31, i32 0, metadata !753, null}
!753 = metadata !{i32 786443, metadata !745, i32 31, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/052_initstruct_fail/main.cpp]
!754 = metadata !{i32 32, i32 0, metadata !755, null}
!755 = metadata !{i32 786443, metadata !753, i32 31, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/052_initstruct_fail/main.cpp]
!756 = metadata !{i32 33, i32 0, metadata !755, null}
!757 = metadata !{i32 34, i32 0, metadata !755, null}
!758 = metadata !{i32 35, i32 0, metadata !755, null}
!759 = metadata !{i32 36, i32 0, metadata !755, null}
!760 = metadata !{i32 39, i32 0, metadata !745, null}
!761 = metadata !{i32 40, i32 0, metadata !745, null}
!762 = metadata !{i32 42, i32 0, metadata !745, null}
!763 = metadata !{i32 419, i32 0, metadata !49, null}
!764 = metadata !{i32 419, i32 0, metadata !88, null}
!765 = metadata !{i32 419, i32 0, metadata !766, null}
!766 = metadata !{i32 786443, metadata !88, i32 419, i32 0, metadata !22, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/052_initstruct_fail//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h
!767 = metadata !{i32 16, i32 0, metadata !107, null}
!768 = metadata !{i32 17, i32 0, metadata !107, null}
!769 = metadata !{metadata !"omnipotent char", metadata !770}
!770 = metadata !{metadata !"Simple C/C++ TBAA"}
!771 = metadata !{i32 18, i32 0, metadata !107, null}
!772 = metadata !{i32 14, i32 0, metadata !143, null}
!773 = metadata !{i32 15, i32 0, metadata !143, null}
!774 = metadata !{i32 16, i32 0, metadata !143, null}
!775 = metadata !{i32 26, i32 0, metadata !776, null}
!776 = metadata !{i32 786443, metadata !233, i32 25, i32 0, metadata !234, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!777 = metadata !{i32 30, i32 0, metadata !778, null}
!778 = metadata !{i32 786443, metadata !262, i32 29, i32 0, metadata !234, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!779 = metadata !{i32 31, i32 0, metadata !778, null}
!780 = metadata !{i32 35, i32 0, metadata !781, null}
!781 = metadata !{i32 786443, metadata !268, i32 34, i32 0, metadata !234, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!782 = metadata !{i32 36, i32 0, metadata !781, null}
!783 = metadata !{i32 40, i32 0, metadata !784, null}
!784 = metadata !{i32 786443, metadata !274, i32 39, i32 0, metadata !234, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!785 = metadata !{i32 41, i32 0, metadata !784, null}
!786 = metadata !{i32 45, i32 0, metadata !787, null}
!787 = metadata !{i32 786443, metadata !278, i32 44, i32 0, metadata !234, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!788 = metadata !{i32 49, i32 0, metadata !789, null}
!789 = metadata !{i32 786443, metadata !286, i32 48, i32 0, metadata !234, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!790 = metadata !{i32 53, i32 0, metadata !791, null}
!791 = metadata !{i32 786443, metadata !294, i32 52, i32 0, metadata !234, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!792 = metadata !{i32 57, i32 0, metadata !793, null}
!793 = metadata !{i32 786443, metadata !302, i32 56, i32 0, metadata !234, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!794 = metadata !{i32 61, i32 0, metadata !795, null}
!795 = metadata !{i32 786443, metadata !310, i32 60, i32 0, metadata !234, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!796 = metadata !{i32 65, i32 0, metadata !797, null}
!797 = metadata !{i32 786443, metadata !317, i32 64, i32 0, metadata !234, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!798 = metadata !{i32 69, i32 0, metadata !799, null}
!799 = metadata !{i32 786443, metadata !325, i32 68, i32 0, metadata !234, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!800 = metadata !{i32 73, i32 0, metadata !801, null}
!801 = metadata !{i32 786443, metadata !329, i32 72, i32 0, metadata !234, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!802 = metadata !{i32 74, i32 0, metadata !801, null}
!803 = metadata !{metadata !"any pointer", metadata !769}
!804 = metadata !{i32 75, i32 0, metadata !801, null}
!805 = metadata !{i32 77, i32 0, metadata !801, null}
!806 = metadata !{i32 81, i32 0, metadata !807, null}
!807 = metadata !{i32 786443, metadata !336, i32 80, i32 0, metadata !234, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!808 = metadata !{i32 86, i32 0, metadata !809, null}
!809 = metadata !{i32 786443, metadata !350, i32 85, i32 0, metadata !234, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!810 = metadata !{i32 91, i32 0, metadata !811, null}
!811 = metadata !{i32 786443, metadata !360, i32 90, i32 0, metadata !234, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!812 = metadata !{i32 95, i32 0, metadata !813, null}
!813 = metadata !{i32 786443, metadata !370, i32 94, i32 0, metadata !234, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!814 = metadata !{i32 96, i32 0, metadata !813, null}
!815 = metadata !{i32 97, i32 0, metadata !813, null}
!816 = metadata !{i32 99, i32 0, metadata !813, null}
!817 = metadata !{i32 103, i32 0, metadata !818, null}
!818 = metadata !{i32 786443, metadata !375, i32 102, i32 0, metadata !234, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!819 = metadata !{i32 108, i32 0, metadata !820, null}
!820 = metadata !{i32 786443, metadata !384, i32 106, i32 0, metadata !234, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!821 = metadata !{i32 113, i32 0, metadata !822, null}
!822 = metadata !{i32 786443, metadata !393, i32 112, i32 0, metadata !234, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!823 = metadata !{i32 119, i32 0, metadata !824, null}
!824 = metadata !{i32 786443, metadata !405, i32 118, i32 0, metadata !234, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!825 = metadata !{i32 125, i32 0, metadata !826, null}
!826 = metadata !{i32 786443, metadata !419, i32 124, i32 0, metadata !234, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!827 = metadata !{i32 131, i32 0, metadata !828, null}
!828 = metadata !{i32 786443, metadata !435, i32 130, i32 0, metadata !234, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!829 = metadata !{i32 137, i32 0, metadata !830, null}
!830 = metadata !{i32 786443, metadata !448, i32 136, i32 0, metadata !234, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!831 = metadata !{i32 143, i32 0, metadata !832, null}
!832 = metadata !{i32 786443, metadata !462, i32 142, i32 0, metadata !234, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!833 = metadata !{i32 149, i32 0, metadata !834, null}
!834 = metadata !{i32 786443, metadata !475, i32 148, i32 0, metadata !234, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!835 = metadata !{i32 153, i32 0, metadata !836, null}
!836 = metadata !{i32 786443, metadata !489, i32 152, i32 0, metadata !234, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!837 = metadata !{i32 157, i32 0, metadata !838, null}
!838 = metadata !{i32 786443, metadata !513, i32 156, i32 0, metadata !234, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!839 = metadata !{i32 161, i32 0, metadata !840, null}
!840 = metadata !{i32 786443, metadata !520, i32 160, i32 0, metadata !234, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!841 = metadata !{i32 165, i32 0, metadata !842, null}
!842 = metadata !{i32 786443, metadata !539, i32 164, i32 0, metadata !234, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!843 = metadata !{i32 171, i32 0, metadata !844, null}
!844 = metadata !{i32 786443, metadata !546, i32 170, i32 0, metadata !234, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!845 = metadata !{i32 176, i32 0, metadata !846, null}
!846 = metadata !{i32 786443, metadata !559, i32 175, i32 0, metadata !234, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!847 = metadata !{i32 181, i32 0, metadata !848, null}
!848 = metadata !{i32 786443, metadata !569, i32 180, i32 0, metadata !234, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!849 = metadata !{i32 187, i32 0, metadata !850, null}
!850 = metadata !{i32 786443, metadata !580, i32 186, i32 0, metadata !234, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!851 = metadata !{i32 192, i32 0, metadata !852, null}
!852 = metadata !{i32 786443, metadata !592, i32 191, i32 0, metadata !234, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!853 = metadata !{i32 198, i32 0, metadata !854, null}
!854 = metadata !{i32 786443, metadata !602, i32 197, i32 0, metadata !234, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!855 = metadata !{i32 203, i32 0, metadata !856, null}
!856 = metadata !{i32 786443, metadata !613, i32 201, i32 0, metadata !234, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!857 = metadata !{i32 209, i32 0, metadata !858, null}
!858 = metadata !{i32 786443, metadata !623, i32 207, i32 0, metadata !234, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!859 = metadata !{i32 214, i32 0, metadata !860, null}
!860 = metadata !{i32 786443, metadata !634, i32 213, i32 0, metadata !234, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!861 = metadata !{i32 220, i32 0, metadata !862, null}
!862 = metadata !{i32 786443, metadata !645, i32 219, i32 0, metadata !234, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!863 = metadata !{i32 225, i32 0, metadata !864, null}
!864 = metadata !{i32 786443, metadata !657, i32 224, i32 0, metadata !234, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!865 = metadata !{i32 226, i32 0, metadata !864, null}
!866 = metadata !{i32 231, i32 0, metadata !867, null}
!867 = metadata !{i32 786443, metadata !667, i32 230, i32 0, metadata !234, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!868 = metadata !{i32 235, i32 0, metadata !869, null}
!869 = metadata !{i32 786443, metadata !678, i32 234, i32 0, metadata !234, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!870 = metadata !{i32 239, i32 0, metadata !871, null}
!871 = metadata !{i32 786443, metadata !685, i32 238, i32 0, metadata !234, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!872 = metadata !{i32 240, i32 0, metadata !871, null}
!873 = metadata !{i32 245, i32 0, metadata !874, null}
!874 = metadata !{i32 786443, metadata !693, i32 244, i32 0, metadata !234, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!875 = metadata !{i32 250, i32 0, metadata !876, null}
!876 = metadata !{i32 786443, metadata !703, i32 249, i32 0, metadata !234, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!877 = metadata !{i32 255, i32 0, metadata !878, null}
!878 = metadata !{i32 786443, metadata !714, i32 254, i32 0, metadata !234, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!879 = metadata !{i32 260, i32 0, metadata !880, null}
!880 = metadata !{i32 786443, metadata !722, i32 259, i32 0, metadata !234, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!881 = metadata !{i32 264, i32 0, metadata !882, null}
!882 = metadata !{i32 786443, metadata !731, i32 263, i32 0, metadata !234, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
