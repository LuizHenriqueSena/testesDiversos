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

@_ZZ16matrix_transposePfE4tile = internal global [2 x [2 x float]] zeroinitializer, section "__shared__", align 16
@threadIdx = external global %struct.dim3
@blockIdx = external global %struct.dim3
@.str = private unnamed_addr constant [21 x i8] c"\0AResultado de a:\0A   \00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%f\09\00", align 1

define void @_Z16matrix_transposePf(float* %A) uwtable noinline {
  %1 = alloca float*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %tile_x = alloca i32, align 4
  %tile_y = alloca i32, align 4
  store float* %A, float** %1, align 8
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !726
  store i32 %2, i32* %x, align 4, !dbg !726
  %3 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 1), align 4, !dbg !728
  store i32 %3, i32* %y, align 4, !dbg !728
  %4 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i32 0, i32 0), align 4, !dbg !729
  store i32 %4, i32* %tile_x, align 4, !dbg !729
  %5 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i32 0, i32 1), align 4, !dbg !730
  store i32 %5, i32* %tile_y, align 4, !dbg !730
  %6 = load i32* %x, align 4, !dbg !731
  %7 = load i32* %tile_x, align 4, !dbg !731
  %8 = mul nsw i32 %7, 2, !dbg !731
  %9 = add nsw i32 %6, %8, !dbg !731
  %10 = mul nsw i32 %9, 8, !dbg !731
  %11 = load i32* %y, align 4, !dbg !731
  %12 = load i32* %tile_y, align 4, !dbg !731
  %13 = mul nsw i32 %12, 2, !dbg !731
  %14 = add nsw i32 %11, %13, !dbg !731
  %15 = add nsw i32 %10, %14, !dbg !731
  %16 = sext i32 %15 to i64, !dbg !731
  %17 = load float** %1, align 8, !dbg !731
  %18 = getelementptr inbounds float* %17, i64 %16, !dbg !731
  %19 = load float* %18, align 4, !dbg !731
  %20 = load i32* %y, align 4, !dbg !731
  %21 = sext i32 %20 to i64, !dbg !731
  %22 = load i32* %x, align 4, !dbg !731
  %23 = sext i32 %22 to i64, !dbg !731
  %24 = getelementptr inbounds [2 x [2 x float]]* @_ZZ16matrix_transposePfE4tile, i32 0, i64 %23, !dbg !731
  %25 = getelementptr inbounds [2 x float]* %24, i32 0, i64 %21, !dbg !731
  store float %19, float* %25, align 4, !dbg !731
  %26 = load i32* %x, align 4, !dbg !732
  %27 = sext i32 %26 to i64, !dbg !732
  %28 = load i32* %y, align 4, !dbg !732
  %29 = sext i32 %28 to i64, !dbg !732
  %30 = getelementptr inbounds [2 x [2 x float]]* @_ZZ16matrix_transposePfE4tile, i32 0, i64 %29, !dbg !732
  %31 = getelementptr inbounds [2 x float]* %30, i32 0, i64 %27, !dbg !732
  %32 = load float* %31, align 4, !dbg !732
  %33 = load i32* %y, align 4, !dbg !732
  %34 = sext i32 %33 to i64, !dbg !732
  %35 = load i32* %x, align 4, !dbg !732
  %36 = sext i32 %35 to i64, !dbg !732
  %37 = getelementptr inbounds [2 x [2 x float]]* @_ZZ16matrix_transposePfE4tile, i32 0, i64 %36, !dbg !732
  %38 = getelementptr inbounds [2 x float]* %37, i32 0, i64 %34, !dbg !732
  store float %32, float* %38, align 4, !dbg !732
  call void @__syncthreads(), !dbg !733
  %39 = load i32* %y, align 4, !dbg !734
  %40 = sext i32 %39 to i64, !dbg !734
  %41 = load i32* %x, align 4, !dbg !734
  %42 = sext i32 %41 to i64, !dbg !734
  %43 = getelementptr inbounds [2 x [2 x float]]* @_ZZ16matrix_transposePfE4tile, i32 0, i64 %42, !dbg !734
  %44 = getelementptr inbounds [2 x float]* %43, i32 0, i64 %40, !dbg !734
  %45 = load float* %44, align 4, !dbg !734
  %46 = load i32* %x, align 4, !dbg !734
  %47 = load i32* %tile_y, align 4, !dbg !734
  %48 = mul nsw i32 %47, 2, !dbg !734
  %49 = add nsw i32 %46, %48, !dbg !734
  %50 = mul nsw i32 %49, 8, !dbg !734
  %51 = load i32* %y, align 4, !dbg !734
  %52 = load i32* %tile_x, align 4, !dbg !734
  %53 = mul nsw i32 %52, 2, !dbg !734
  %54 = add nsw i32 %51, %53, !dbg !734
  %55 = add nsw i32 %50, %54, !dbg !734
  %56 = sext i32 %55 to i64, !dbg !734
  %57 = load float** %1, align 8, !dbg !734
  %58 = getelementptr inbounds float* %57, i64 %56, !dbg !734
  store float %45, float* %58, align 4, !dbg !734
  ret void, !dbg !735
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @__syncthreads() section "__device__"

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %a = alloca float*, align 8
  %dev_a = alloca float*, align 8
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %GRIDDIM = alloca %struct.dim3, align 4
  %BLOCKDIM = alloca %struct.dim3, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 8, i32* %size, align 4, !dbg !736
  %6 = bitcast float** %dev_a to i8**, !dbg !738
  %7 = load i32* %size, align 4, !dbg !738
  %8 = sext i32 %7 to i64, !dbg !738
  %9 = call i32 @cudaMalloc(i8** %6, i64 %8), !dbg !738
  %10 = load i32* %size, align 4, !dbg !739
  %11 = sext i32 %10 to i64, !dbg !739
  %12 = call noalias i8* @malloc(i64 %11) nounwind, !dbg !739
  %13 = bitcast i8* %12 to float*, !dbg !739
  store float* %13, float** %a, align 8, !dbg !739
  store i32 0, i32* %i, align 4, !dbg !740
  br label %14, !dbg !740

; <label>:14                                      ; preds = %17, %0
  %15 = load i32* %i, align 4, !dbg !740
  %16 = icmp slt i32 %15, 2, !dbg !740
  br i1 %16, label %17, label %26, !dbg !740

; <label>:17                                      ; preds = %14
  %18 = load i32* %i, align 4, !dbg !742
  %19 = sitofp i32 %18 to float, !dbg !742
  %20 = load i32* %i, align 4, !dbg !742
  %21 = sext i32 %20 to i64, !dbg !742
  %22 = load float** %a, align 8, !dbg !742
  %23 = getelementptr inbounds float* %22, i64 %21, !dbg !742
  store float %19, float* %23, align 4, !dbg !742
  %24 = load i32* %i, align 4, !dbg !740
  %25 = add nsw i32 %24, 1, !dbg !740
  store i32 %25, i32* %i, align 4, !dbg !740
  br label %14, !dbg !740

; <label>:26                                      ; preds = %14
  %27 = load float** %dev_a, align 8, !dbg !743
  %28 = bitcast float* %27 to i8*, !dbg !743
  %29 = load float** %a, align 8, !dbg !743
  %30 = bitcast float* %29 to i8*, !dbg !743
  %31 = load i32* %size, align 4, !dbg !743
  %32 = sext i32 %31 to i64, !dbg !743
  %33 = call i32 @cudaMemcpy(i8* %28, i8* %30, i64 %32, i32 1), !dbg !743
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %GRIDDIM, i32 4, i32 4, i32 1), !dbg !744
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %BLOCKDIM, i32 2, i32 2, i32 1), !dbg !745
  %34 = bitcast %struct.dim3* %2 to i8*, !dbg !746
  %35 = bitcast %struct.dim3* %GRIDDIM to i8*, !dbg !746
  %36 = call i8* @memcpy(i8* %34, i8* %35, i64 12)
  %37 = bitcast %struct.dim3* %3 to i8*, !dbg !746
  %38 = bitcast %struct.dim3* %BLOCKDIM to i8*, !dbg !746
  %39 = call i8* @memcpy(i8* %37, i8* %38, i64 12)
  %40 = bitcast { i64, i32 }* %4 to i8*, !dbg !746
  %41 = bitcast %struct.dim3* %2 to i8*, !dbg !746
  %42 = call i8* @memcpy(i8* %40, i8* %41, i64 12)
  %43 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !746
  %44 = load i64* %43, align 1, !dbg !746
  %45 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !746
  %46 = load i32* %45, align 1, !dbg !746
  %47 = bitcast { i64, i32 }* %5 to i8*, !dbg !746
  %48 = bitcast %struct.dim3* %3 to i8*, !dbg !746
  %49 = call i8* @memcpy(i8* %47, i8* %48, i64 12)
  %50 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !746
  %51 = load i64* %50, align 1, !dbg !746
  %52 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !746
  %53 = load i32* %52, align 1, !dbg !746
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %44, i32 %46, i64 %51, i32 %53), !dbg !746
  %54 = load float** %dev_a, align 8, !dbg !748
  call void @_Z16matrix_transposePf(float* %54), !dbg !748
  %55 = load float** %a, align 8, !dbg !749
  %56 = bitcast float* %55 to i8*, !dbg !749
  %57 = load float** %dev_a, align 8, !dbg !749
  %58 = bitcast float* %57 to i8*, !dbg !749
  %59 = load i32* %size, align 4, !dbg !749
  %60 = sext i32 %59 to i64, !dbg !749
  %61 = call i32 @cudaMemcpy(i8* %56, i8* %58, i64 %60, i32 2), !dbg !749
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0)), !dbg !750
  store i32 0, i32* %i1, align 4, !dbg !751
  br label %63, !dbg !751

; <label>:63                                      ; preds = %66, %26
  %64 = load i32* %i1, align 4, !dbg !751
  %65 = icmp slt i32 %64, 2, !dbg !751
  br i1 %65, label %66, label %76, !dbg !751

; <label>:66                                      ; preds = %63
  %67 = load i32* %i1, align 4, !dbg !753
  %68 = sext i32 %67 to i64, !dbg !753
  %69 = load float** %a, align 8, !dbg !753
  %70 = getelementptr inbounds float* %69, i64 %68, !dbg !753
  %71 = load float* %70, align 4, !dbg !753
  %72 = fpext float %71 to double, !dbg !753
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), double %72), !dbg !753
  %74 = load i32* %i1, align 4, !dbg !751
  %75 = add nsw i32 %74, 1, !dbg !751
  store i32 %75, i32* %i1, align 4, !dbg !751
  br label %63, !dbg !751

; <label>:76                                      ; preds = %63
  %77 = load float** %a, align 8, !dbg !755
  %78 = bitcast float* %77 to i8*, !dbg !755
  call void @free(i8* %78) nounwind, !dbg !755
  %79 = load float** %dev_a, align 8, !dbg !756
  %80 = bitcast float* %79 to i8*, !dbg !756
  %81 = call i32 @cudaFree(i8* %80), !dbg !756
  ret i32 0, !dbg !757
}

declare noalias i8* @malloc(i64) nounwind

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
  %6 = load i32* %2, align 4, !dbg !758
  %7 = load i32* %3, align 4, !dbg !758
  %8 = load i32* %4, align 4, !dbg !758
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !758
  ret void, !dbg !758
}

declare void @__set_CUDAConfig(i64, i32, i64, i32, ...)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !759
  %7 = load i32* %2, align 4, !dbg !759
  store i32 %7, i32* %6, align 4, !dbg !759
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !759
  %9 = load i32* %3, align 4, !dbg !759
  store i32 %9, i32* %8, align 4, !dbg !759
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !759
  %11 = load i32* %4, align 4, !dbg !759
  store i32 %11, i32* %10, align 4, !dbg !759
  ret void, !dbg !760
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !762
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !762

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !762
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !763
  %4 = load i8* %src.06, align 1, !dbg !763, !tbaa !764
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !763
  store i8 %4, i8* %dest.05, align 1, !dbg !763, !tbaa !764
  %6 = icmp eq i64 %2, 0, !dbg !762
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !762

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !766
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !767
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !767

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !768
  br label %3, !dbg !767

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !767
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !768
  store volatile i8 %2, i8* %a.05, align 1, !dbg !768, !tbaa !764
  %6 = icmp eq i64 %4, 0, !dbg !767
  br i1 %6, label %._crit_edge, label %3, !dbg !767

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !769
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !770
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !772
  ret i32 0, !dbg !774
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !775
  tail call void @free(i8* %1) nounwind, !dbg !775
  ret i32 0, !dbg !777
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !778
  ret i32 0, !dbg !780
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !781
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !783
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !785
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !787
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !789
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !791
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !793
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !795
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !797
  store i8* %1, i8** %devPtr, align 8, !dbg !797, !tbaa !798
  tail call void @__clear_device(), !dbg !799
  ret i32 0, !dbg !800
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !801
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !803
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !805
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !807
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !809
  store i8* %1, i8** %ptr, align 8, !dbg !809, !tbaa !798
  tail call void @__clear_host(), !dbg !810
  ret i32 0, !dbg !811
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !812
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !814
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !816
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !818
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !820
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !822
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !824
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !826
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !828
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !830
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !832
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !834
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !836
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !838
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !840
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !842
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !844
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !846
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !848
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !850
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !852
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !854
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !856
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !858
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !860
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !861
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !863
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !865
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !867
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !868
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !870
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !872
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !874
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !876
}

!llvm.dbg.cu = !{!0, !75, !99, !115, !132}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !11, me
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !21, metadata !25, metadata !68}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"matrix_transpose", metadata !"matrix_transpose", metadata !"_Z16matrix_transposePf", metadata !16, i32 12, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*)*
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!20 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!21 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 31, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 31} ; [ DW_TAG_
!22 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!25 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !26, i32 419, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!26 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d", null} ; [ DW_TAG_file_type ]
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
!69 = metadata !{metadata !70}
!70 = metadata !{metadata !71}
!71 = metadata !{i32 786484, i32 0, metadata !15, metadata !"tile", metadata !"tile", metadata !"", metadata !16, i32 14, metadata !72, i32 1, i32 1, [2 x [2 x float]]* @_ZZ16matrix_transposePfE4tile} ; [ DW_TAG_variable ] [tile] [line 14] [local] [def]
!72 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 128, i64 32, i32 0, i32 0, metadata !20, metadata !73, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from float]
!73 = metadata !{metadata !74, metadata !74}
!74 = metadata !{i32 786465, i64 0, i64 1}        ; [ DW_TAG_subrange_type ] [0, 1]
!75 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!76 = metadata !{metadata !77}
!77 = metadata !{metadata !78}
!78 = metadata !{i32 786478, i32 0, metadata !79, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !79, i32 12, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !87, i
!79 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!80 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !81, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!81 = metadata !{metadata !82, metadata !82, metadata !83, metadata !85}
!82 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!83 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !84} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!84 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!85 = metadata !{i32 786454, null, metadata !"size_t", metadata !79, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !86} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!86 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!87 = metadata !{metadata !88}
!88 = metadata !{metadata !89, metadata !90, metadata !91, metadata !92, metadata !96}
!89 = metadata !{i32 786689, metadata !78, metadata !"destaddr", metadata !79, i32 16777228, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!90 = metadata !{i32 786689, metadata !78, metadata !"srcaddr", metadata !79, i32 33554444, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!91 = metadata !{i32 786689, metadata !78, metadata !"len", metadata !79, i32 50331660, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!92 = metadata !{i32 786688, metadata !93, metadata !"dest", metadata !79, i32 13, metadata !94, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!93 = metadata !{i32 786443, metadata !78, i32 12, i32 0, metadata !79, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!94 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !95} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!95 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!96 = metadata !{i32 786688, metadata !93, metadata !"src", metadata !79, i32 14, metadata !97, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!97 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !98} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!98 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !95} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!99 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!100 = metadata !{metadata !101}
!101 = metadata !{metadata !102}
!102 = metadata !{i32 786478, i32 0, metadata !103, metadata !"memmove", metadata !"memmove", metadata !"", metadata !103, i32 12, metadata !104, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !107, i32 12} ; [ DW_TAG
!103 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!104 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !105, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!105 = metadata !{metadata !82, metadata !82, metadata !83, metadata !106}
!106 = metadata !{i32 786454, null, metadata !"size_t", metadata !103, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !86} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!107 = metadata !{metadata !108}
!108 = metadata !{metadata !109, metadata !110, metadata !111, metadata !112, metadata !114}
!109 = metadata !{i32 786689, metadata !102, metadata !"dst", metadata !103, i32 16777228, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!110 = metadata !{i32 786689, metadata !102, metadata !"src", metadata !103, i32 33554444, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!111 = metadata !{i32 786689, metadata !102, metadata !"count", metadata !103, i32 50331660, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!112 = metadata !{i32 786688, metadata !113, metadata !"a", metadata !103, i32 14, metadata !94, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!113 = metadata !{i32 786443, metadata !102, i32 12, i32 0, metadata !103, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!114 = metadata !{i32 786688, metadata !113, metadata !"b", metadata !103, i32 15, metadata !97, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!115 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!116 = metadata !{metadata !117}
!117 = metadata !{metadata !118}
!118 = metadata !{i32 786478, i32 0, metadata !119, metadata !"memset", metadata !"memset", metadata !"", metadata !119, i32 12, metadata !120, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!119 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!120 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !121, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!121 = metadata !{metadata !82, metadata !82, metadata !24, metadata !122}
!122 = metadata !{i32 786454, null, metadata !"size_t", metadata !119, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !86} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!123 = metadata !{metadata !124}
!124 = metadata !{metadata !125, metadata !126, metadata !127, metadata !128}
!125 = metadata !{i32 786689, metadata !118, metadata !"dst", metadata !119, i32 16777228, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!126 = metadata !{i32 786689, metadata !118, metadata !"s", metadata !119, i32 33554444, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!127 = metadata !{i32 786689, metadata !118, metadata !"count", metadata !119, i32 50331660, metadata !122, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!128 = metadata !{i32 786688, metadata !129, metadata !"a", metadata !119, i32 13, metadata !130, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!129 = metadata !{i32 786443, metadata !118, i32 12, i32 0, metadata !119, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!130 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !131} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!131 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !95} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!132 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!133 = metadata !{metadata !134}
!134 = metadata !{metadata !135, metadata !210, metadata !216}
!135 = metadata !{i32 786436, null, metadata !"cudaError", metadata !136, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !137, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!136 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!137 = metadata !{metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !149, metadata !150, metadata !151, metadata !152, metadata !1
!138 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!139 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!140 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!141 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!142 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!143 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!144 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!145 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!146 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!147 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!148 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!149 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!150 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!151 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!152 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!153 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!154 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!155 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!156 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!157 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!158 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!159 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!160 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!161 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!162 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!163 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!164 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!165 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!166 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!167 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!168 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!169 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!170 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!171 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!172 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!173 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!174 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!175 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!176 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!177 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!178 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!179 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!180 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!181 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!182 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!183 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!184 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!185 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!186 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!187 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!188 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!189 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!190 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!191 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!192 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!193 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!194 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!195 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!196 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!197 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!198 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!199 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!200 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!201 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!202 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!203 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!204 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!205 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!206 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!207 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!208 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!209 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!210 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !136, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !211, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!211 = metadata !{metadata !212, metadata !213, metadata !214, metadata !215}
!212 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!213 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!214 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!215 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!216 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !136, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!217 = metadata !{metadata !218}
!218 = metadata !{metadata !219, metadata !248, metadata !254, metadata !260, metadata !264, metadata !272, metadata !280, metadata !288, metadata !296, metadata !303, metadata !311, metadata !315, metadata !322, metadata !336, metadata !346, metadata !3
!219 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !220, i32 24, metadata !221, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!220 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!221 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !222, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!222 = metadata !{metadata !223, metadata !224, metadata !232, metadata !239, metadata !240}
!223 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !220, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !135} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!224 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !225} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!225 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !136, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !226, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!226 = metadata !{metadata !227, metadata !228, metadata !229, metadata !230, metadata !231}
!227 = metadata !{i32 786445, metadata !225, metadata !"x", metadata !136, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !24} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!228 = metadata !{i32 786445, metadata !225, metadata !"y", metadata !136, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !24} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!229 = metadata !{i32 786445, metadata !225, metadata !"z", metadata !136, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !24} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!230 = metadata !{i32 786445, metadata !225, metadata !"w", metadata !136, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !24} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!231 = metadata !{i32 786445, metadata !225, metadata !"f", metadata !136, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !210} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!232 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !233} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!233 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !136, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !234, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!234 = metadata !{metadata !235, metadata !237, metadata !238}
!235 = metadata !{i32 786445, metadata !233, metadata !"width", metadata !136, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !236} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!236 = metadata !{i32 786454, null, metadata !"size_t", metadata !136, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !86} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!237 = metadata !{i32 786445, metadata !233, metadata !"height", metadata !136, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !236} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!238 = metadata !{i32 786445, metadata !233, metadata !"depth", metadata !136, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !236} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!239 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!240 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !241} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!241 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !136, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!242 = metadata !{metadata !243}
!243 = metadata !{metadata !244, metadata !245, metadata !246, metadata !247}
!244 = metadata !{i32 786689, metadata !219, metadata !"desc", metadata !220, i32 16777240, metadata !224, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!245 = metadata !{i32 786689, metadata !219, metadata !"extent", metadata !220, i32 33554456, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!246 = metadata !{i32 786689, metadata !219, metadata !"flags", metadata !220, i32 50331673, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!247 = metadata !{i32 786689, metadata !219, metadata !"array", metadata !220, i32 67108889, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!248 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !220, i32 29, metadata !249, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !251, 
!249 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !250, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!250 = metadata !{metadata !223, metadata !82}
!251 = metadata !{metadata !252}
!252 = metadata !{metadata !253}
!253 = metadata !{i32 786689, metadata !248, metadata !"devPtr", metadata !220, i32 16777245, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!254 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !220, i32 34, metadata !255, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!255 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !256, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!256 = metadata !{metadata !223, metadata !240}
!257 = metadata !{metadata !258}
!258 = metadata !{metadata !259}
!259 = metadata !{i32 786689, metadata !254, metadata !"array", metadata !220, i32 16777250, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!260 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !220, i32 39, metadata !249, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!261 = metadata !{metadata !262}
!262 = metadata !{metadata !263}
!263 = metadata !{i32 786689, metadata !260, metadata !"ptr", metadata !220, i32 16777255, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!264 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !220, i32 44, metadata !265, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!265 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !266, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!266 = metadata !{metadata !223, metadata !267, metadata !97}
!267 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!268 = metadata !{metadata !269}
!269 = metadata !{metadata !270, metadata !271}
!270 = metadata !{i32 786689, metadata !264, metadata !"devPtr", metadata !220, i32 16777260, metadata !267, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!271 = metadata !{i32 786689, metadata !264, metadata !"symbol", metadata !220, i32 33554476, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!272 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !220, i32 48, metadata !273, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!273 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !274, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!274 = metadata !{metadata !223, metadata !275, metadata !97}
!275 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !236} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!276 = metadata !{metadata !277}
!277 = metadata !{metadata !278, metadata !279}
!278 = metadata !{i32 786689, metadata !272, metadata !"size", metadata !220, i32 16777264, metadata !275, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!279 = metadata !{i32 786689, metadata !272, metadata !"symbol", metadata !220, i32 33554480, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!280 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !220, i32 52, metadata !281, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!281 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !282, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!282 = metadata !{metadata !223, metadata !267, metadata !236, metadata !33}
!283 = metadata !{metadata !284}
!284 = metadata !{metadata !285, metadata !286, metadata !287}
!285 = metadata !{i32 786689, metadata !280, metadata !"pHost", metadata !220, i32 16777268, metadata !267, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!286 = metadata !{i32 786689, metadata !280, metadata !"size", metadata !220, i32 33554484, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!287 = metadata !{i32 786689, metadata !280, metadata !"flags", metadata !220, i32 50331700, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!288 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !220, i32 56, metadata !289, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!289 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !290, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!290 = metadata !{metadata !223, metadata !267, metadata !82, metadata !33}
!291 = metadata !{metadata !292}
!292 = metadata !{metadata !293, metadata !294, metadata !295}
!293 = metadata !{i32 786689, metadata !288, metadata !"pDevice", metadata !220, i32 16777272, metadata !267, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!294 = metadata !{i32 786689, metadata !288, metadata !"pHost", metadata !220, i32 33554488, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!295 = metadata !{i32 786689, metadata !288, metadata !"flags", metadata !220, i32 50331704, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!296 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !220, i32 60, metadata !297, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!297 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !298, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!298 = metadata !{metadata !223, metadata !239, metadata !82}
!299 = metadata !{metadata !300}
!300 = metadata !{metadata !301, metadata !302}
!301 = metadata !{i32 786689, metadata !296, metadata !"pFlags", metadata !220, i32 16777276, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!302 = metadata !{i32 786689, metadata !296, metadata !"pHost", metadata !220, i32 33554492, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!303 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !220, i32 64, metadata !304, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!304 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !305, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!305 = metadata !{metadata !223, metadata !82, metadata !236, metadata !33}
!306 = metadata !{metadata !307}
!307 = metadata !{metadata !308, metadata !309, metadata !310}
!308 = metadata !{i32 786689, metadata !303, metadata !"ptr", metadata !220, i32 16777280, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!309 = metadata !{i32 786689, metadata !303, metadata !"size", metadata !220, i32 33554496, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!310 = metadata !{i32 786689, metadata !303, metadata !"flags", metadata !220, i32 50331712, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!311 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !220, i32 68, metadata !249, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!312 = metadata !{metadata !313}
!313 = metadata !{metadata !314}
!314 = metadata !{i32 786689, metadata !311, metadata !"ptr", metadata !220, i32 16777284, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!315 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !220, i32 72, metadata !316, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!316 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !317, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!317 = metadata !{metadata !223, metadata !267, metadata !236}
!318 = metadata !{metadata !319}
!319 = metadata !{metadata !320, metadata !321}
!320 = metadata !{i32 786689, metadata !315, metadata !"devPtr", metadata !220, i32 16777288, metadata !267, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!321 = metadata !{i32 786689, metadata !315, metadata !"size", metadata !220, i32 33554504, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!322 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !220, i32 80, metadata !323, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!323 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !324, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!324 = metadata !{metadata !223, metadata !325, metadata !233}
!325 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !326} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!326 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !136, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !327, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!327 = metadata !{metadata !328, metadata !329, metadata !330, metadata !331}
!328 = metadata !{i32 786445, metadata !326, metadata !"ptr", metadata !136, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!329 = metadata !{i32 786445, metadata !326, metadata !"pitch", metadata !136, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !236} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!330 = metadata !{i32 786445, metadata !326, metadata !"xsize", metadata !136, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !236} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!331 = metadata !{i32 786445, metadata !326, metadata !"ysize", metadata !136, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !236} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!332 = metadata !{metadata !333}
!333 = metadata !{metadata !334, metadata !335}
!334 = metadata !{i32 786689, metadata !322, metadata !"pitchedDevPtr", metadata !220, i32 16777296, metadata !325, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!335 = metadata !{i32 786689, metadata !322, metadata !"extent", metadata !220, i32 33554512, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!336 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !220, i32 84, metadata !337, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!337 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !338, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!338 = metadata !{metadata !223, metadata !339, metadata !224, metadata !233, metadata !33}
!339 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !240} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!340 = metadata !{metadata !341}
!341 = metadata !{metadata !342, metadata !343, metadata !344, metadata !345}
!342 = metadata !{i32 786689, metadata !336, metadata !"array", metadata !220, i32 16777300, metadata !339, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!343 = metadata !{i32 786689, metadata !336, metadata !"desc", metadata !220, i32 33554516, metadata !224, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!344 = metadata !{i32 786689, metadata !336, metadata !"extent", metadata !220, i32 50331733, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!345 = metadata !{i32 786689, metadata !336, metadata !"flags", metadata !220, i32 67108949, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!346 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !220, i32 89, metadata !347, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!347 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !348, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!348 = metadata !{metadata !223, metadata !339, metadata !224, metadata !236, metadata !236, metadata !33}
!349 = metadata !{metadata !350}
!350 = metadata !{metadata !351, metadata !352, metadata !353, metadata !354, metadata !355}
!351 = metadata !{i32 786689, metadata !346, metadata !"array", metadata !220, i32 16777305, metadata !339, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!352 = metadata !{i32 786689, metadata !346, metadata !"desc", metadata !220, i32 33554521, metadata !224, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!353 = metadata !{i32 786689, metadata !346, metadata !"width", metadata !220, i32 50331738, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!354 = metadata !{i32 786689, metadata !346, metadata !"height", metadata !220, i32 67108954, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!355 = metadata !{i32 786689, metadata !346, metadata !"flags", metadata !220, i32 83886170, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!356 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !220, i32 94, metadata !316, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!357 = metadata !{metadata !358}
!358 = metadata !{metadata !359, metadata !360}
!359 = metadata !{i32 786689, metadata !356, metadata !"ptr", metadata !220, i32 16777310, metadata !267, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!360 = metadata !{i32 786689, metadata !356, metadata !"size", metadata !220, i32 33554526, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!361 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !220, i32 102, metadata !362, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!362 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !363, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!363 = metadata !{metadata !223, metadata !267, metadata !275, metadata !236, metadata !236}
!364 = metadata !{metadata !365}
!365 = metadata !{metadata !366, metadata !367, metadata !368, metadata !369}
!366 = metadata !{i32 786689, metadata !361, metadata !"devPtr", metadata !220, i32 16777318, metadata !267, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!367 = metadata !{i32 786689, metadata !361, metadata !"pitch", metadata !220, i32 33554534, metadata !275, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!368 = metadata !{i32 786689, metadata !361, metadata !"width", metadata !220, i32 50331750, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!369 = metadata !{i32 786689, metadata !361, metadata !"height", metadata !220, i32 67108966, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!370 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !220, i32 106, metadata !371, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!371 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !372, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!372 = metadata !{metadata !223, metadata !82, metadata !83, metadata !236, metadata !216}
!373 = metadata !{metadata !374}
!374 = metadata !{metadata !375, metadata !376, metadata !377, metadata !378}
!375 = metadata !{i32 786689, metadata !370, metadata !"dst", metadata !220, i32 16777322, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!376 = metadata !{i32 786689, metadata !370, metadata !"src", metadata !220, i32 33554538, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!377 = metadata !{i32 786689, metadata !370, metadata !"count", metadata !220, i32 50331754, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!378 = metadata !{i32 786689, metadata !370, metadata !"kind", metadata !220, i32 67108970, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!379 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !220, i32 111, metadata !380, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!380 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !381, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!381 = metadata !{metadata !223, metadata !82, metadata !236, metadata !83, metadata !236, metadata !236, metadata !236, metadata !216}
!382 = metadata !{metadata !383}
!383 = metadata !{metadata !384, metadata !385, metadata !386, metadata !387, metadata !388, metadata !389, metadata !390}
!384 = metadata !{i32 786689, metadata !379, metadata !"dst", metadata !220, i32 16777327, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!385 = metadata !{i32 786689, metadata !379, metadata !"dpitch", metadata !220, i32 33554543, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!386 = metadata !{i32 786689, metadata !379, metadata !"src", metadata !220, i32 50331759, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!387 = metadata !{i32 786689, metadata !379, metadata !"spitch", metadata !220, i32 67108975, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!388 = metadata !{i32 786689, metadata !379, metadata !"width", metadata !220, i32 83886192, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!389 = metadata !{i32 786689, metadata !379, metadata !"height", metadata !220, i32 100663408, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!390 = metadata !{i32 786689, metadata !379, metadata !"kind", metadata !220, i32 117440624, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!391 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !220, i32 116, metadata !392, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!392 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !393, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!393 = metadata !{metadata !223, metadata !240, metadata !236, metadata !236, metadata !240, metadata !236, metadata !236, metadata !236, metadata !236, metadata !216}
!394 = metadata !{metadata !395}
!395 = metadata !{metadata !396, metadata !397, metadata !398, metadata !399, metadata !400, metadata !401, metadata !402, metadata !403, metadata !404}
!396 = metadata !{i32 786689, metadata !391, metadata !"dst", metadata !220, i32 16777332, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!397 = metadata !{i32 786689, metadata !391, metadata !"wOffsetDst", metadata !220, i32 33554548, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!398 = metadata !{i32 786689, metadata !391, metadata !"hOffsetDst", metadata !220, i32 50331764, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!399 = metadata !{i32 786689, metadata !391, metadata !"src", metadata !220, i32 67108981, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!400 = metadata !{i32 786689, metadata !391, metadata !"wOffsetSrc", metadata !220, i32 83886197, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!401 = metadata !{i32 786689, metadata !391, metadata !"hOffsetSrc", metadata !220, i32 100663413, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!402 = metadata !{i32 786689, metadata !391, metadata !"width", metadata !220, i32 117440630, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!403 = metadata !{i32 786689, metadata !391, metadata !"height", metadata !220, i32 134217846, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!404 = metadata !{i32 786689, metadata !391, metadata !"kind", metadata !220, i32 150995062, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!405 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !220, i32 122, metadata !406, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!406 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !407, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!407 = metadata !{metadata !223, metadata !82, metadata !236, metadata !83, metadata !236, metadata !236, metadata !236, metadata !216, metadata !408}
!408 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !220, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !409} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!409 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !410} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!410 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !136, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!411 = metadata !{metadata !412}
!412 = metadata !{metadata !413, metadata !414, metadata !415, metadata !416, metadata !417, metadata !418, metadata !419, metadata !420}
!413 = metadata !{i32 786689, metadata !405, metadata !"dst", metadata !220, i32 16777338, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!414 = metadata !{i32 786689, metadata !405, metadata !"dpitch", metadata !220, i32 33554554, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!415 = metadata !{i32 786689, metadata !405, metadata !"src", metadata !220, i32 50331770, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!416 = metadata !{i32 786689, metadata !405, metadata !"spitch", metadata !220, i32 67108986, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!417 = metadata !{i32 786689, metadata !405, metadata !"width", metadata !220, i32 83886203, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!418 = metadata !{i32 786689, metadata !405, metadata !"height", metadata !220, i32 100663419, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!419 = metadata !{i32 786689, metadata !405, metadata !"kind", metadata !220, i32 117440635, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!420 = metadata !{i32 786689, metadata !405, metadata !"stream", metadata !220, i32 134217852, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!421 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !220, i32 128, metadata !422, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!422 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !423, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!423 = metadata !{metadata !223, metadata !82, metadata !236, metadata !240, metadata !236, metadata !236, metadata !236, metadata !236, metadata !216}
!424 = metadata !{metadata !425}
!425 = metadata !{metadata !426, metadata !427, metadata !428, metadata !429, metadata !430, metadata !431, metadata !432, metadata !433}
!426 = metadata !{i32 786689, metadata !421, metadata !"dst", metadata !220, i32 16777344, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!427 = metadata !{i32 786689, metadata !421, metadata !"dpitch", metadata !220, i32 33554560, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!428 = metadata !{i32 786689, metadata !421, metadata !"src", metadata !220, i32 50331776, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!429 = metadata !{i32 786689, metadata !421, metadata !"wOffset", metadata !220, i32 67108993, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!430 = metadata !{i32 786689, metadata !421, metadata !"hOffset", metadata !220, i32 83886209, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!431 = metadata !{i32 786689, metadata !421, metadata !"width", metadata !220, i32 100663425, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!432 = metadata !{i32 786689, metadata !421, metadata !"height", metadata !220, i32 117440641, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!433 = metadata !{i32 786689, metadata !421, metadata !"kind", metadata !220, i32 134217858, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!434 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !220, i32 134, metadata !435, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!435 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !436, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!436 = metadata !{metadata !223, metadata !82, metadata !236, metadata !240, metadata !236, metadata !236, metadata !236, metadata !236, metadata !216, metadata !408}
!437 = metadata !{metadata !438}
!438 = metadata !{metadata !439, metadata !440, metadata !441, metadata !442, metadata !443, metadata !444, metadata !445, metadata !446, metadata !447}
!439 = metadata !{i32 786689, metadata !434, metadata !"dst", metadata !220, i32 16777350, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!440 = metadata !{i32 786689, metadata !434, metadata !"dpitch", metadata !220, i32 33554566, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!441 = metadata !{i32 786689, metadata !434, metadata !"src", metadata !220, i32 50331782, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!442 = metadata !{i32 786689, metadata !434, metadata !"wOffset", metadata !220, i32 67108999, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!443 = metadata !{i32 786689, metadata !434, metadata !"hOffset", metadata !220, i32 83886215, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!444 = metadata !{i32 786689, metadata !434, metadata !"width", metadata !220, i32 100663431, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!445 = metadata !{i32 786689, metadata !434, metadata !"height", metadata !220, i32 117440647, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!446 = metadata !{i32 786689, metadata !434, metadata !"kind", metadata !220, i32 134217864, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!447 = metadata !{i32 786689, metadata !434, metadata !"stream", metadata !220, i32 150995080, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!448 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !220, i32 140, metadata !449, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!449 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !450, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!450 = metadata !{metadata !223, metadata !240, metadata !236, metadata !236, metadata !83, metadata !236, metadata !236, metadata !236, metadata !216}
!451 = metadata !{metadata !452}
!452 = metadata !{metadata !453, metadata !454, metadata !455, metadata !456, metadata !457, metadata !458, metadata !459, metadata !460}
!453 = metadata !{i32 786689, metadata !448, metadata !"dst", metadata !220, i32 16777356, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!454 = metadata !{i32 786689, metadata !448, metadata !"wOffset", metadata !220, i32 33554572, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!455 = metadata !{i32 786689, metadata !448, metadata !"hOffset", metadata !220, i32 50331788, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!456 = metadata !{i32 786689, metadata !448, metadata !"src", metadata !220, i32 67109005, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!457 = metadata !{i32 786689, metadata !448, metadata !"spitch", metadata !220, i32 83886221, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!458 = metadata !{i32 786689, metadata !448, metadata !"width", metadata !220, i32 100663437, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!459 = metadata !{i32 786689, metadata !448, metadata !"height", metadata !220, i32 117440653, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!460 = metadata !{i32 786689, metadata !448, metadata !"kind", metadata !220, i32 134217870, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!461 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !220, i32 146, metadata !462, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!462 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !463, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!463 = metadata !{metadata !223, metadata !240, metadata !236, metadata !236, metadata !83, metadata !236, metadata !236, metadata !236, metadata !216, metadata !408}
!464 = metadata !{metadata !465}
!465 = metadata !{metadata !466, metadata !467, metadata !468, metadata !469, metadata !470, metadata !471, metadata !472, metadata !473, metadata !474}
!466 = metadata !{i32 786689, metadata !461, metadata !"dst", metadata !220, i32 16777362, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!467 = metadata !{i32 786689, metadata !461, metadata !"wOffset", metadata !220, i32 33554578, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!468 = metadata !{i32 786689, metadata !461, metadata !"hOffset", metadata !220, i32 50331794, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!469 = metadata !{i32 786689, metadata !461, metadata !"src", metadata !220, i32 67109011, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!470 = metadata !{i32 786689, metadata !461, metadata !"spitch", metadata !220, i32 83886227, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!471 = metadata !{i32 786689, metadata !461, metadata !"width", metadata !220, i32 100663443, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!472 = metadata !{i32 786689, metadata !461, metadata !"height", metadata !220, i32 117440659, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!473 = metadata !{i32 786689, metadata !461, metadata !"kind", metadata !220, i32 134217876, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!474 = metadata !{i32 786689, metadata !461, metadata !"stream", metadata !220, i32 150995092, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!475 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !220, i32 152, metadata !476, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!476 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !477, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!477 = metadata !{metadata !223, metadata !478}
!478 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !479} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!479 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !480} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!480 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !136, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !481, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!481 = metadata !{metadata !482, metadata !484, metadata !490, metadata !491, metadata !492, metadata !493, metadata !494, metadata !495}
!482 = metadata !{i32 786445, metadata !480, metadata !"srcArray", metadata !136, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !483} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!483 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !136, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !240} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!484 = metadata !{i32 786445, metadata !480, metadata !"srcPos", metadata !136, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !485} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!485 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !136, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !486, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!486 = metadata !{metadata !487, metadata !488, metadata !489}
!487 = metadata !{i32 786445, metadata !485, metadata !"x", metadata !136, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !236} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!488 = metadata !{i32 786445, metadata !485, metadata !"y", metadata !136, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !236} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!489 = metadata !{i32 786445, metadata !485, metadata !"z", metadata !136, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !236} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!490 = metadata !{i32 786445, metadata !480, metadata !"srcPtr", metadata !136, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !326} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!491 = metadata !{i32 786445, metadata !480, metadata !"dstArray", metadata !136, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !483} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!492 = metadata !{i32 786445, metadata !480, metadata !"dstPos", metadata !136, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !485} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!493 = metadata !{i32 786445, metadata !480, metadata !"dstPtr", metadata !136, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !326} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!494 = metadata !{i32 786445, metadata !480, metadata !"extent", metadata !136, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !233} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!495 = metadata !{i32 786445, metadata !480, metadata !"kind", metadata !136, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !216} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!496 = metadata !{metadata !497}
!497 = metadata !{metadata !498}
!498 = metadata !{i32 786689, metadata !475, metadata !"p", metadata !220, i32 16777368, metadata !478, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!499 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !220, i32 156, metadata !500, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!500 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !501, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!501 = metadata !{metadata !223, metadata !478, metadata !408}
!502 = metadata !{metadata !503}
!503 = metadata !{metadata !504, metadata !505}
!504 = metadata !{i32 786689, metadata !499, metadata !"p", metadata !220, i32 16777372, metadata !478, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!505 = metadata !{i32 786689, metadata !499, metadata !"stream", metadata !220, i32 33554588, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!506 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !220, i32 160, metadata !507, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!507 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !508, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!508 = metadata !{metadata !223, metadata !509}
!509 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !510} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!510 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !511} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!511 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !136, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !512, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!512 = metadata !{metadata !513, metadata !514, metadata !515, metadata !516, metadata !517, metadata !518, metadata !519, metadata !520, metadata !521}
!513 = metadata !{i32 786445, metadata !511, metadata !"srcArray", metadata !136, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !483} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!514 = metadata !{i32 786445, metadata !511, metadata !"srcPos", metadata !136, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !485} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!515 = metadata !{i32 786445, metadata !511, metadata !"srcPtr", metadata !136, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !326} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!516 = metadata !{i32 786445, metadata !511, metadata !"srcDevice", metadata !136, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !24} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!517 = metadata !{i32 786445, metadata !511, metadata !"dstArray", metadata !136, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !483} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!518 = metadata !{i32 786445, metadata !511, metadata !"dstPos", metadata !136, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !485} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!519 = metadata !{i32 786445, metadata !511, metadata !"dstPtr", metadata !136, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !326} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!520 = metadata !{i32 786445, metadata !511, metadata !"dstDevice", metadata !136, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !24} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!521 = metadata !{i32 786445, metadata !511, metadata !"extent", metadata !136, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !233} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!522 = metadata !{metadata !523}
!523 = metadata !{metadata !524}
!524 = metadata !{i32 786689, metadata !506, metadata !"p", metadata !220, i32 16777376, metadata !509, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!525 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !220, i32 164, metadata !526, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!526 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !527, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!527 = metadata !{metadata !223, metadata !509, metadata !408}
!528 = metadata !{metadata !529}
!529 = metadata !{metadata !530, metadata !531}
!530 = metadata !{i32 786689, metadata !525, metadata !"p", metadata !220, i32 16777380, metadata !509, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!531 = metadata !{i32 786689, metadata !525, metadata !"stream", metadata !220, i32 33554596, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!532 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !220, i32 168, metadata !533, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!533 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !534, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!534 = metadata !{metadata !223, metadata !240, metadata !236, metadata !236, metadata !240, metadata !236, metadata !236, metadata !236, metadata !216}
!535 = metadata !{metadata !536}
!536 = metadata !{metadata !537, metadata !538, metadata !539, metadata !540, metadata !541, metadata !542, metadata !543, metadata !544}
!537 = metadata !{i32 786689, metadata !532, metadata !"dst", metadata !220, i32 16777384, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!538 = metadata !{i32 786689, metadata !532, metadata !"wOffsetDst", metadata !220, i32 33554600, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!539 = metadata !{i32 786689, metadata !532, metadata !"hOffsetDst", metadata !220, i32 50331816, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!540 = metadata !{i32 786689, metadata !532, metadata !"src", metadata !220, i32 67109033, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!541 = metadata !{i32 786689, metadata !532, metadata !"wOffsetSrc", metadata !220, i32 83886249, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!542 = metadata !{i32 786689, metadata !532, metadata !"hOffsetSrc", metadata !220, i32 100663465, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!543 = metadata !{i32 786689, metadata !532, metadata !"count", metadata !220, i32 117440682, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!544 = metadata !{i32 786689, metadata !532, metadata !"kind", metadata !220, i32 134217898, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!545 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !220, i32 174, metadata !546, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!546 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !547, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!547 = metadata !{metadata !223, metadata !82, metadata !83, metadata !236, metadata !216, metadata !408}
!548 = metadata !{metadata !549}
!549 = metadata !{metadata !550, metadata !551, metadata !552, metadata !553, metadata !554}
!550 = metadata !{i32 786689, metadata !545, metadata !"dst", metadata !220, i32 16777390, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!551 = metadata !{i32 786689, metadata !545, metadata !"src", metadata !220, i32 33554606, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!552 = metadata !{i32 786689, metadata !545, metadata !"count", metadata !220, i32 50331822, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!553 = metadata !{i32 786689, metadata !545, metadata !"kind", metadata !220, i32 67109039, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!554 = metadata !{i32 786689, metadata !545, metadata !"stream", metadata !220, i32 83886255, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!555 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !220, i32 179, metadata !556, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!556 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !557, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!557 = metadata !{metadata !223, metadata !82, metadata !240, metadata !236, metadata !236, metadata !236, metadata !216}
!558 = metadata !{metadata !559}
!559 = metadata !{metadata !560, metadata !561, metadata !562, metadata !563, metadata !564, metadata !565}
!560 = metadata !{i32 786689, metadata !555, metadata !"dst", metadata !220, i32 16777395, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!561 = metadata !{i32 786689, metadata !555, metadata !"src", metadata !220, i32 33554611, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!562 = metadata !{i32 786689, metadata !555, metadata !"wOffset", metadata !220, i32 50331827, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!563 = metadata !{i32 786689, metadata !555, metadata !"hOffset", metadata !220, i32 67109044, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!564 = metadata !{i32 786689, metadata !555, metadata !"count", metadata !220, i32 83886260, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!565 = metadata !{i32 786689, metadata !555, metadata !"kind", metadata !220, i32 100663476, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!566 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !220, i32 184, metadata !567, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!567 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !568, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!568 = metadata !{metadata !223, metadata !82, metadata !240, metadata !236, metadata !236, metadata !236, metadata !216, metadata !408}
!569 = metadata !{metadata !570}
!570 = metadata !{metadata !571, metadata !572, metadata !573, metadata !574, metadata !575, metadata !576, metadata !577}
!571 = metadata !{i32 786689, metadata !566, metadata !"dst", metadata !220, i32 16777400, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!572 = metadata !{i32 786689, metadata !566, metadata !"src", metadata !220, i32 33554616, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!573 = metadata !{i32 786689, metadata !566, metadata !"wOffset", metadata !220, i32 50331832, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!574 = metadata !{i32 786689, metadata !566, metadata !"hOffset", metadata !220, i32 67109049, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!575 = metadata !{i32 786689, metadata !566, metadata !"count", metadata !220, i32 83886265, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!576 = metadata !{i32 786689, metadata !566, metadata !"kind", metadata !220, i32 100663481, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!577 = metadata !{i32 786689, metadata !566, metadata !"stream", metadata !220, i32 117440698, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!578 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !220, i32 190, metadata !579, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!579 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !580, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!580 = metadata !{metadata !223, metadata !82, metadata !97, metadata !236, metadata !236, metadata !216}
!581 = metadata !{metadata !582}
!582 = metadata !{metadata !583, metadata !584, metadata !585, metadata !586, metadata !587}
!583 = metadata !{i32 786689, metadata !578, metadata !"dst", metadata !220, i32 16777406, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!584 = metadata !{i32 786689, metadata !578, metadata !"symbol", metadata !220, i32 33554622, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!585 = metadata !{i32 786689, metadata !578, metadata !"count", metadata !220, i32 50331838, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!586 = metadata !{i32 786689, metadata !578, metadata !"offset", metadata !220, i32 67109055, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!587 = metadata !{i32 786689, metadata !578, metadata !"kind", metadata !220, i32 83886271, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!588 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !220, i32 195, metadata !589, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!589 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !590, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!590 = metadata !{metadata !223, metadata !82, metadata !97, metadata !236, metadata !236, metadata !216, metadata !408}
!591 = metadata !{metadata !592}
!592 = metadata !{metadata !593, metadata !594, metadata !595, metadata !596, metadata !597, metadata !598}
!593 = metadata !{i32 786689, metadata !588, metadata !"dst", metadata !220, i32 16777411, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!594 = metadata !{i32 786689, metadata !588, metadata !"symbol", metadata !220, i32 33554627, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!595 = metadata !{i32 786689, metadata !588, metadata !"count", metadata !220, i32 50331843, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!596 = metadata !{i32 786689, metadata !588, metadata !"offset", metadata !220, i32 67109060, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!597 = metadata !{i32 786689, metadata !588, metadata !"kind", metadata !220, i32 83886276, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!598 = metadata !{i32 786689, metadata !588, metadata !"stream", metadata !220, i32 100663493, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!599 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !220, i32 201, metadata !600, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!600 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !601, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!601 = metadata !{metadata !223, metadata !82, metadata !24, metadata !83, metadata !24, metadata !236}
!602 = metadata !{metadata !603}
!603 = metadata !{metadata !604, metadata !605, metadata !606, metadata !607, metadata !608}
!604 = metadata !{i32 786689, metadata !599, metadata !"dst", metadata !220, i32 16777417, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!605 = metadata !{i32 786689, metadata !599, metadata !"dstDevice", metadata !220, i32 33554633, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!606 = metadata !{i32 786689, metadata !599, metadata !"src", metadata !220, i32 50331849, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!607 = metadata !{i32 786689, metadata !599, metadata !"srcDevice", metadata !220, i32 67109065, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!608 = metadata !{i32 786689, metadata !599, metadata !"count", metadata !220, i32 83886281, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!609 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !220, i32 206, metadata !610, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!610 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !611, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!611 = metadata !{metadata !223, metadata !82, metadata !24, metadata !83, metadata !24, metadata !236, metadata !408}
!612 = metadata !{metadata !613}
!613 = metadata !{metadata !614, metadata !615, metadata !616, metadata !617, metadata !618, metadata !619}
!614 = metadata !{i32 786689, metadata !609, metadata !"dst", metadata !220, i32 16777422, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!615 = metadata !{i32 786689, metadata !609, metadata !"dstDevice", metadata !220, i32 33554638, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!616 = metadata !{i32 786689, metadata !609, metadata !"src", metadata !220, i32 50331854, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!617 = metadata !{i32 786689, metadata !609, metadata !"srcDevice", metadata !220, i32 67109070, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!618 = metadata !{i32 786689, metadata !609, metadata !"count", metadata !220, i32 83886287, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!619 = metadata !{i32 786689, metadata !609, metadata !"stream", metadata !220, i32 100663503, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!620 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !220, i32 212, metadata !621, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!621 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !622, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!622 = metadata !{metadata !223, metadata !240, metadata !236, metadata !236, metadata !83, metadata !236, metadata !216}
!623 = metadata !{metadata !624}
!624 = metadata !{metadata !625, metadata !626, metadata !627, metadata !628, metadata !629, metadata !630}
!625 = metadata !{i32 786689, metadata !620, metadata !"dst", metadata !220, i32 16777428, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!626 = metadata !{i32 786689, metadata !620, metadata !"wOffset", metadata !220, i32 33554644, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!627 = metadata !{i32 786689, metadata !620, metadata !"hOffset", metadata !220, i32 50331860, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!628 = metadata !{i32 786689, metadata !620, metadata !"src", metadata !220, i32 67109077, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!629 = metadata !{i32 786689, metadata !620, metadata !"count", metadata !220, i32 83886293, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!630 = metadata !{i32 786689, metadata !620, metadata !"kind", metadata !220, i32 100663509, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!631 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !220, i32 217, metadata !632, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!632 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !633, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!633 = metadata !{metadata !223, metadata !240, metadata !236, metadata !236, metadata !83, metadata !236, metadata !216, metadata !408}
!634 = metadata !{metadata !635}
!635 = metadata !{metadata !636, metadata !637, metadata !638, metadata !639, metadata !640, metadata !641, metadata !642}
!636 = metadata !{i32 786689, metadata !631, metadata !"dst", metadata !220, i32 16777433, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!637 = metadata !{i32 786689, metadata !631, metadata !"wOffset", metadata !220, i32 33554649, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!638 = metadata !{i32 786689, metadata !631, metadata !"hOffset", metadata !220, i32 50331865, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!639 = metadata !{i32 786689, metadata !631, metadata !"src", metadata !220, i32 67109082, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!640 = metadata !{i32 786689, metadata !631, metadata !"count", metadata !220, i32 83886298, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!641 = metadata !{i32 786689, metadata !631, metadata !"kind", metadata !220, i32 100663514, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!642 = metadata !{i32 786689, metadata !631, metadata !"stream", metadata !220, i32 117440731, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!643 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !220, i32 223, metadata !644, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!644 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !645, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!645 = metadata !{metadata !223, metadata !94, metadata !83, metadata !236, metadata !236, metadata !216}
!646 = metadata !{metadata !647}
!647 = metadata !{metadata !648, metadata !649, metadata !650, metadata !651, metadata !652}
!648 = metadata !{i32 786689, metadata !643, metadata !"symbol", metadata !220, i32 16777439, metadata !94, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!649 = metadata !{i32 786689, metadata !643, metadata !"src", metadata !220, i32 33554655, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!650 = metadata !{i32 786689, metadata !643, metadata !"count", metadata !220, i32 50331871, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!651 = metadata !{i32 786689, metadata !643, metadata !"offset", metadata !220, i32 67109088, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!652 = metadata !{i32 786689, metadata !643, metadata !"kind", metadata !220, i32 83886304, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!653 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !220, i32 229, metadata !654, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!654 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !655, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!655 = metadata !{metadata !223, metadata !97, metadata !83, metadata !236, metadata !236, metadata !216, metadata !408}
!656 = metadata !{metadata !657}
!657 = metadata !{metadata !658, metadata !659, metadata !660, metadata !661, metadata !662, metadata !663}
!658 = metadata !{i32 786689, metadata !653, metadata !"symbol", metadata !220, i32 16777445, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!659 = metadata !{i32 786689, metadata !653, metadata !"src", metadata !220, i32 33554661, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!660 = metadata !{i32 786689, metadata !653, metadata !"count", metadata !220, i32 50331877, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!661 = metadata !{i32 786689, metadata !653, metadata !"offset", metadata !220, i32 67109093, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!662 = metadata !{i32 786689, metadata !653, metadata !"kind", metadata !220, i32 83886310, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!663 = metadata !{i32 786689, metadata !653, metadata !"stream", metadata !220, i32 100663526, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!664 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !220, i32 234, metadata !665, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!665 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !666, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!666 = metadata !{metadata !223, metadata !275, metadata !275}
!667 = metadata !{metadata !668}
!668 = metadata !{metadata !669, metadata !670}
!669 = metadata !{i32 786689, metadata !664, metadata !"free", metadata !220, i32 16777450, metadata !275, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!670 = metadata !{i32 786689, metadata !664, metadata !"total", metadata !220, i32 33554666, metadata !275, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!671 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !220, i32 238, metadata !672, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!672 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !673, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!673 = metadata !{metadata !223, metadata !82, metadata !24, metadata !236}
!674 = metadata !{metadata !675}
!675 = metadata !{metadata !676, metadata !677, metadata !678}
!676 = metadata !{i32 786689, metadata !671, metadata !"devPtr", metadata !220, i32 16777454, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!677 = metadata !{i32 786689, metadata !671, metadata !"value", metadata !220, i32 33554670, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!678 = metadata !{i32 786689, metadata !671, metadata !"count", metadata !220, i32 50331886, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!679 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !220, i32 243, metadata !680, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!680 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !681, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!681 = metadata !{metadata !223, metadata !82, metadata !236, metadata !24, metadata !236, metadata !236}
!682 = metadata !{metadata !683}
!683 = metadata !{metadata !684, metadata !685, metadata !686, metadata !687, metadata !688}
!684 = metadata !{i32 786689, metadata !679, metadata !"devPtr", metadata !220, i32 16777459, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!685 = metadata !{i32 786689, metadata !679, metadata !"pitch", metadata !220, i32 33554675, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!686 = metadata !{i32 786689, metadata !679, metadata !"value", metadata !220, i32 50331891, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!687 = metadata !{i32 786689, metadata !679, metadata !"width", metadata !220, i32 67109108, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!688 = metadata !{i32 786689, metadata !679, metadata !"height", metadata !220, i32 83886324, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!689 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !220, i32 248, metadata !690, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!690 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !691, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!691 = metadata !{metadata !223, metadata !82, metadata !236, metadata !24, metadata !236, metadata !236, metadata !408}
!692 = metadata !{metadata !693}
!693 = metadata !{metadata !694, metadata !695, metadata !696, metadata !697, metadata !698, metadata !699}
!694 = metadata !{i32 786689, metadata !689, metadata !"devPtr", metadata !220, i32 16777464, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!695 = metadata !{i32 786689, metadata !689, metadata !"pitch", metadata !220, i32 33554680, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!696 = metadata !{i32 786689, metadata !689, metadata !"value", metadata !220, i32 50331896, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!697 = metadata !{i32 786689, metadata !689, metadata !"width", metadata !220, i32 67109113, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!698 = metadata !{i32 786689, metadata !689, metadata !"height", metadata !220, i32 83886329, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!699 = metadata !{i32 786689, metadata !689, metadata !"stream", metadata !220, i32 100663545, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!700 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !220, i32 253, metadata !701, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!701 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !702, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!702 = metadata !{metadata !223, metadata !326, metadata !24, metadata !233}
!703 = metadata !{metadata !704}
!704 = metadata !{metadata !705, metadata !706, metadata !707}
!705 = metadata !{i32 786689, metadata !700, metadata !"pitchedDevPtr", metadata !220, i32 16777469, metadata !326, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!706 = metadata !{i32 786689, metadata !700, metadata !"value", metadata !220, i32 33554685, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!707 = metadata !{i32 786689, metadata !700, metadata !"extent", metadata !220, i32 50331902, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!708 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !220, i32 258, metadata !709, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!709 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !710, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!710 = metadata !{metadata !223, metadata !326, metadata !24, metadata !233, metadata !408}
!711 = metadata !{metadata !712}
!712 = metadata !{metadata !713, metadata !714, metadata !715, metadata !716}
!713 = metadata !{i32 786689, metadata !708, metadata !"pitchedDevPtr", metadata !220, i32 16777474, metadata !326, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!714 = metadata !{i32 786689, metadata !708, metadata !"value", metadata !220, i32 33554690, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!715 = metadata !{i32 786689, metadata !708, metadata !"extent", metadata !220, i32 50331907, metadata !233, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!716 = metadata !{i32 786689, metadata !708, metadata !"stream", metadata !220, i32 67109123, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!717 = metadata !{i32 786478, i32 0, metadata !220, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !220, i32 263, metadata !718, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!718 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !719, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!719 = metadata !{metadata !223, metadata !82, metadata !24, metadata !236, metadata !408}
!720 = metadata !{metadata !721}
!721 = metadata !{metadata !722, metadata !723, metadata !724, metadata !725}
!722 = metadata !{i32 786689, metadata !717, metadata !"devPtr", metadata !220, i32 16777479, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!723 = metadata !{i32 786689, metadata !717, metadata !"value", metadata !220, i32 33554695, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!724 = metadata !{i32 786689, metadata !717, metadata !"count", metadata !220, i32 50331911, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!725 = metadata !{i32 786689, metadata !717, metadata !"stream", metadata !220, i32 67109127, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!726 = metadata !{i32 16, i32 0, metadata !727, null}
!727 = metadata !{i32 786443, metadata !15, i32 13, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d/main.cpp]
!728 = metadata !{i32 17, i32 0, metadata !727, null}
!729 = metadata !{i32 19, i32 0, metadata !727, null}
!730 = metadata !{i32 20, i32 0, metadata !727, null}
!731 = metadata !{i32 22, i32 0, metadata !727, null}
!732 = metadata !{i32 24, i32 0, metadata !727, null}
!733 = metadata !{i32 26, i32 0, metadata !727, null}
!734 = metadata !{i32 28, i32 0, metadata !727, null}
!735 = metadata !{i32 29, i32 0, metadata !727, null}
!736 = metadata !{i32 34, i32 0, metadata !737, null}
!737 = metadata !{i32 786443, metadata !21, i32 31, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d/main.cpp]
!738 = metadata !{i32 36, i32 0, metadata !737, null}
!739 = metadata !{i32 38, i32 0, metadata !737, null}
!740 = metadata !{i32 40, i32 0, metadata !741, null}
!741 = metadata !{i32 786443, metadata !737, i32 40, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d/main.cpp]
!742 = metadata !{i32 41, i32 0, metadata !741, null}
!743 = metadata !{i32 43, i32 0, metadata !737, null}
!744 = metadata !{i32 45, i32 0, metadata !737, null}
!745 = metadata !{i32 46, i32 0, metadata !737, null}
!746 = metadata !{i32 47, i32 0, metadata !747, null}
!747 = metadata !{i32 786443, metadata !737, i32 47, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d/main.cpp]
!748 = metadata !{i32 49, i32 0, metadata !747, null}
!749 = metadata !{i32 53, i32 0, metadata !737, null}
!750 = metadata !{i32 55, i32 0, metadata !737, null}
!751 = metadata !{i32 57, i32 0, metadata !752, null}
!752 = metadata !{i32 786443, metadata !737, i32 57, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d/main.cpp]
!753 = metadata !{i32 58, i32 0, metadata !754, null}
!754 = metadata !{i32 786443, metadata !752, i32 57, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d/main.cpp]
!755 = metadata !{i32 62, i32 0, metadata !737, null}
!756 = metadata !{i32 63, i32 0, metadata !737, null}
!757 = metadata !{i32 64, i32 0, metadata !737, null}
!758 = metadata !{i32 419, i32 0, metadata !25, null}
!759 = metadata !{i32 419, i32 0, metadata !68, null}
!760 = metadata !{i32 419, i32 0, metadata !761, null}
!761 = metadata !{i32 786443, metadata !68, i32 419, i32 0, metadata !26, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/092_2d//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!762 = metadata !{i32 16, i32 0, metadata !93, null}
!763 = metadata !{i32 17, i32 0, metadata !93, null}
!764 = metadata !{metadata !"omnipotent char", metadata !765}
!765 = metadata !{metadata !"Simple C/C++ TBAA"}
!766 = metadata !{i32 18, i32 0, metadata !93, null}
!767 = metadata !{i32 14, i32 0, metadata !129, null}
!768 = metadata !{i32 15, i32 0, metadata !129, null}
!769 = metadata !{i32 16, i32 0, metadata !129, null}
!770 = metadata !{i32 26, i32 0, metadata !771, null}
!771 = metadata !{i32 786443, metadata !219, i32 25, i32 0, metadata !220, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!772 = metadata !{i32 30, i32 0, metadata !773, null}
!773 = metadata !{i32 786443, metadata !248, i32 29, i32 0, metadata !220, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!774 = metadata !{i32 31, i32 0, metadata !773, null}
!775 = metadata !{i32 35, i32 0, metadata !776, null}
!776 = metadata !{i32 786443, metadata !254, i32 34, i32 0, metadata !220, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!777 = metadata !{i32 36, i32 0, metadata !776, null}
!778 = metadata !{i32 40, i32 0, metadata !779, null}
!779 = metadata !{i32 786443, metadata !260, i32 39, i32 0, metadata !220, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!780 = metadata !{i32 41, i32 0, metadata !779, null}
!781 = metadata !{i32 45, i32 0, metadata !782, null}
!782 = metadata !{i32 786443, metadata !264, i32 44, i32 0, metadata !220, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!783 = metadata !{i32 49, i32 0, metadata !784, null}
!784 = metadata !{i32 786443, metadata !272, i32 48, i32 0, metadata !220, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!785 = metadata !{i32 53, i32 0, metadata !786, null}
!786 = metadata !{i32 786443, metadata !280, i32 52, i32 0, metadata !220, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!787 = metadata !{i32 57, i32 0, metadata !788, null}
!788 = metadata !{i32 786443, metadata !288, i32 56, i32 0, metadata !220, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!789 = metadata !{i32 61, i32 0, metadata !790, null}
!790 = metadata !{i32 786443, metadata !296, i32 60, i32 0, metadata !220, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!791 = metadata !{i32 65, i32 0, metadata !792, null}
!792 = metadata !{i32 786443, metadata !303, i32 64, i32 0, metadata !220, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!793 = metadata !{i32 69, i32 0, metadata !794, null}
!794 = metadata !{i32 786443, metadata !311, i32 68, i32 0, metadata !220, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!795 = metadata !{i32 73, i32 0, metadata !796, null}
!796 = metadata !{i32 786443, metadata !315, i32 72, i32 0, metadata !220, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!797 = metadata !{i32 74, i32 0, metadata !796, null}
!798 = metadata !{metadata !"any pointer", metadata !764}
!799 = metadata !{i32 75, i32 0, metadata !796, null}
!800 = metadata !{i32 77, i32 0, metadata !796, null}
!801 = metadata !{i32 81, i32 0, metadata !802, null}
!802 = metadata !{i32 786443, metadata !322, i32 80, i32 0, metadata !220, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!803 = metadata !{i32 86, i32 0, metadata !804, null}
!804 = metadata !{i32 786443, metadata !336, i32 85, i32 0, metadata !220, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!805 = metadata !{i32 91, i32 0, metadata !806, null}
!806 = metadata !{i32 786443, metadata !346, i32 90, i32 0, metadata !220, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!807 = metadata !{i32 95, i32 0, metadata !808, null}
!808 = metadata !{i32 786443, metadata !356, i32 94, i32 0, metadata !220, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!809 = metadata !{i32 96, i32 0, metadata !808, null}
!810 = metadata !{i32 97, i32 0, metadata !808, null}
!811 = metadata !{i32 99, i32 0, metadata !808, null}
!812 = metadata !{i32 103, i32 0, metadata !813, null}
!813 = metadata !{i32 786443, metadata !361, i32 102, i32 0, metadata !220, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!814 = metadata !{i32 108, i32 0, metadata !815, null}
!815 = metadata !{i32 786443, metadata !370, i32 106, i32 0, metadata !220, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!816 = metadata !{i32 113, i32 0, metadata !817, null}
!817 = metadata !{i32 786443, metadata !379, i32 112, i32 0, metadata !220, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!818 = metadata !{i32 119, i32 0, metadata !819, null}
!819 = metadata !{i32 786443, metadata !391, i32 118, i32 0, metadata !220, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!820 = metadata !{i32 125, i32 0, metadata !821, null}
!821 = metadata !{i32 786443, metadata !405, i32 124, i32 0, metadata !220, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!822 = metadata !{i32 131, i32 0, metadata !823, null}
!823 = metadata !{i32 786443, metadata !421, i32 130, i32 0, metadata !220, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!824 = metadata !{i32 137, i32 0, metadata !825, null}
!825 = metadata !{i32 786443, metadata !434, i32 136, i32 0, metadata !220, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!826 = metadata !{i32 143, i32 0, metadata !827, null}
!827 = metadata !{i32 786443, metadata !448, i32 142, i32 0, metadata !220, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!828 = metadata !{i32 149, i32 0, metadata !829, null}
!829 = metadata !{i32 786443, metadata !461, i32 148, i32 0, metadata !220, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!830 = metadata !{i32 153, i32 0, metadata !831, null}
!831 = metadata !{i32 786443, metadata !475, i32 152, i32 0, metadata !220, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!832 = metadata !{i32 157, i32 0, metadata !833, null}
!833 = metadata !{i32 786443, metadata !499, i32 156, i32 0, metadata !220, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!834 = metadata !{i32 161, i32 0, metadata !835, null}
!835 = metadata !{i32 786443, metadata !506, i32 160, i32 0, metadata !220, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!836 = metadata !{i32 165, i32 0, metadata !837, null}
!837 = metadata !{i32 786443, metadata !525, i32 164, i32 0, metadata !220, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!838 = metadata !{i32 171, i32 0, metadata !839, null}
!839 = metadata !{i32 786443, metadata !532, i32 170, i32 0, metadata !220, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!840 = metadata !{i32 176, i32 0, metadata !841, null}
!841 = metadata !{i32 786443, metadata !545, i32 175, i32 0, metadata !220, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!842 = metadata !{i32 181, i32 0, metadata !843, null}
!843 = metadata !{i32 786443, metadata !555, i32 180, i32 0, metadata !220, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!844 = metadata !{i32 187, i32 0, metadata !845, null}
!845 = metadata !{i32 786443, metadata !566, i32 186, i32 0, metadata !220, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!846 = metadata !{i32 192, i32 0, metadata !847, null}
!847 = metadata !{i32 786443, metadata !578, i32 191, i32 0, metadata !220, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!848 = metadata !{i32 198, i32 0, metadata !849, null}
!849 = metadata !{i32 786443, metadata !588, i32 197, i32 0, metadata !220, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!850 = metadata !{i32 203, i32 0, metadata !851, null}
!851 = metadata !{i32 786443, metadata !599, i32 201, i32 0, metadata !220, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!852 = metadata !{i32 209, i32 0, metadata !853, null}
!853 = metadata !{i32 786443, metadata !609, i32 207, i32 0, metadata !220, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!854 = metadata !{i32 214, i32 0, metadata !855, null}
!855 = metadata !{i32 786443, metadata !620, i32 213, i32 0, metadata !220, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!856 = metadata !{i32 220, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !631, i32 219, i32 0, metadata !220, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!858 = metadata !{i32 225, i32 0, metadata !859, null}
!859 = metadata !{i32 786443, metadata !643, i32 224, i32 0, metadata !220, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!860 = metadata !{i32 226, i32 0, metadata !859, null}
!861 = metadata !{i32 231, i32 0, metadata !862, null}
!862 = metadata !{i32 786443, metadata !653, i32 230, i32 0, metadata !220, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!863 = metadata !{i32 235, i32 0, metadata !864, null}
!864 = metadata !{i32 786443, metadata !664, i32 234, i32 0, metadata !220, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!865 = metadata !{i32 239, i32 0, metadata !866, null}
!866 = metadata !{i32 786443, metadata !671, i32 238, i32 0, metadata !220, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!867 = metadata !{i32 240, i32 0, metadata !866, null}
!868 = metadata !{i32 245, i32 0, metadata !869, null}
!869 = metadata !{i32 786443, metadata !679, i32 244, i32 0, metadata !220, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!870 = metadata !{i32 250, i32 0, metadata !871, null}
!871 = metadata !{i32 786443, metadata !689, i32 249, i32 0, metadata !220, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!872 = metadata !{i32 255, i32 0, metadata !873, null}
!873 = metadata !{i32 786443, metadata !700, i32 254, i32 0, metadata !220, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!874 = metadata !{i32 260, i32 0, metadata !875, null}
!875 = metadata !{i32 786443, metadata !708, i32 259, i32 0, metadata !220, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!876 = metadata !{i32 264, i32 0, metadata !877, null}
!877 = metadata !{i32 786443, metadata !717, i32 263, i32 0, metadata !220, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
