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

@p_mul_func = global float (float*, i32)* @_Z13multiplyByTwoPfj, section "__device__", align 8
@p_div_func = global float (float*, i32)* @_Z11divideByTwoPfj, section "__device__", align 8
@.str = private unnamed_addr constant [17 x i8] c"f == divideByTwo\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__._Z3fooPfPFfS_jEji = private unnamed_addr constant [47 x i8] c"void foo(float *, funcType, unsigned int, int)\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"i != 0\00", align 1
@blockIdx = external global %struct.dim3
@blockDim = external global %struct.dim3
@threadIdx = external global %struct.dim3
@.str3 = private unnamed_addr constant [4 x i8] c"\0Aw:\00", align 1
@.str4 = private unnamed_addr constant [5 x i8] c" %f\09\00", align 1

define float @_Z13multiplyByTwoPfj(float* %v, i32 %tid) nounwind uwtable section "__device__" {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  store float* %v, float** %1, align 8
  store i32 %tid, i32* %2, align 4
  %3 = load i32* %2, align 4, !dbg !795
  %4 = zext i32 %3 to i64, !dbg !795
  %5 = load float** %1, align 8, !dbg !795
  %6 = getelementptr inbounds float* %5, i64 %4, !dbg !795
  %7 = load float* %6, align 4, !dbg !795
  %8 = fmul float %7, 2.000000e+00, !dbg !795
  ret float %8, !dbg !795
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define float @_Z11divideByTwoPfj(float* %v, i32 %tid) nounwind uwtable section "__device__" {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  store float* %v, float** %1, align 8
  store i32 %tid, i32* %2, align 4
  %3 = load i32* %2, align 4, !dbg !797
  %4 = zext i32 %3 to i64, !dbg !797
  %5 = load float** %1, align 8, !dbg !797
  %6 = getelementptr inbounds float* %5, i64 %4, !dbg !797
  %7 = load float* %6, align 4, !dbg !797
  %8 = fmul float %7, 5.000000e-01, !dbg !797
  ret float %8, !dbg !797
}

define void @_Z3fooPfPFfS_jEji(float* %v, float (float*, i32)* %f, i32 %size, i32 %i) uwtable noinline {
  %1 = alloca float*, align 8
  %2 = alloca float (float*, i32)*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %tid = alloca i32, align 4
  %x = alloca i8*, align 8
  %g = alloca float (float*, i32)*, align 8
  store float* %v, float** %1, align 8
  store float (float*, i32)* %f, float (float*, i32)** %2, align 8
  store i32 %size, i32* %3, align 4
  store i32 %i, i32* %4, align 4
  %5 = load float (float*, i32)** %2, align 8, !dbg !799
  %6 = icmp eq float (float*, i32)* %5, @_Z11divideByTwoPfj, !dbg !799
  br i1 %6, label %8, label %7, !dbg !799

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 31, i8* getelementptr inbounds ([47 x i8]* @__PRETTY_FUNCTION__._Z3fooPfPFfS_jEji, i32 0, i32 0)) nor
  unreachable, !dbg !799

; <label>:8                                       ; preds = %0
  %9 = load i32* %4, align 4, !dbg !801
  %10 = icmp ne i32 %9, 0, !dbg !801
  br i1 %10, label %12, label %11, !dbg !801

; <label>:11                                      ; preds = %8
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 32, i8* getelementptr inbounds ([47 x i8]* @__PRETTY_FUNCTION__._Z3fooPfPFfS_jEji, i32 0, i32 0)) nor
  unreachable, !dbg !801

; <label>:12                                      ; preds = %8
  %13 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i32 0, i32 0), align 4, !dbg !802
  %14 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 0), align 4, !dbg !802
  %15 = mul i32 %13, %14, !dbg !802
  %16 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !802
  %17 = add i32 %15, %16, !dbg !802
  store i32 %17, i32* %tid, align 4, !dbg !802
  %18 = load float (float*, i32)** %2, align 8, !dbg !803
  %19 = bitcast float (float*, i32)* %18 to i8*, !dbg !803
  store i8* %19, i8** %x, align 8, !dbg !803
  %20 = load i32* %4, align 4, !dbg !804
  %21 = icmp eq i32 %20, 0, !dbg !804
  br i1 %21, label %22, label %23, !dbg !804

; <label>:22                                      ; preds = %12
  store i8* null, i8** %x, align 8, !dbg !805
  br label %23, !dbg !805

; <label>:23                                      ; preds = %22, %12
  %24 = load i8** %x, align 8, !dbg !806
  %25 = bitcast i8* %24 to float (float*, i32)*, !dbg !806
  store float (float*, i32)* %25, float (float*, i32)** %g, align 8, !dbg !806
  %26 = load i32* %tid, align 4, !dbg !807
  %27 = load i32* %3, align 4, !dbg !807
  %28 = icmp ult i32 %26, %27, !dbg !807
  br i1 %28, label %29, label %38, !dbg !807

; <label>:29                                      ; preds = %23
  %30 = load float (float*, i32)** %g, align 8, !dbg !808
  %31 = load float** %1, align 8, !dbg !808
  %32 = load i32* %tid, align 4, !dbg !808
  %33 = call float %30(float* %31, i32 %32), !dbg !808
  %34 = load i32* %tid, align 4, !dbg !808
  %35 = zext i32 %34 to i64, !dbg !808
  %36 = load float** %1, align 8, !dbg !808
  %37 = getelementptr inbounds float* %36, i64 %35, !dbg !808
  store float %33, float* %37, align 4, !dbg !808
  br label %38, !dbg !810

; <label>:38                                      ; preds = %29, %23
  ret void, !dbg !811
}

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %w = alloca float*, align 8
  %dev_w = alloca float*, align 8
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %host_f = alloca float (float*, i32)*, align 8
  %dev_f = alloca float (float*, i32)*, align 8
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 32, i32* %size, align 4, !dbg !812
  %6 = load i32* %size, align 4, !dbg !814
  %7 = sext i32 %6 to i64, !dbg !814
  %8 = call noalias i8* @malloc(i64 %7) nounwind, !dbg !814
  %9 = bitcast i8* %8 to float*, !dbg !814
  store float* %9, float** %w, align 8, !dbg !814
  store i32 0, i32* %i, align 4, !dbg !815
  br label %10, !dbg !815

; <label>:10                                      ; preds = %13, %0
  %11 = load i32* %i, align 4, !dbg !815
  %12 = icmp slt i32 %11, 8, !dbg !815
  br i1 %12, label %13, label %22, !dbg !815

; <label>:13                                      ; preds = %10
  %14 = load i32* %i, align 4, !dbg !817
  %15 = sitofp i32 %14 to float, !dbg !817
  %16 = load i32* %i, align 4, !dbg !817
  %17 = sext i32 %16 to i64, !dbg !817
  %18 = load float** %w, align 8, !dbg !817
  %19 = getelementptr inbounds float* %18, i64 %17, !dbg !817
  store float %15, float* %19, align 4, !dbg !817
  %20 = load i32* %i, align 4, !dbg !815
  %21 = add nsw i32 %20, 1, !dbg !815
  store i32 %21, i32* %i, align 4, !dbg !815
  br label %10, !dbg !815

; <label>:22                                      ; preds = %10
  %23 = bitcast float** %dev_w to i8**, !dbg !819
  %24 = load i32* %size, align 4, !dbg !819
  %25 = sext i32 %24 to i64, !dbg !819
  %26 = call i32 @cudaMalloc(i8** %23, i64 %25), !dbg !819
  %27 = load float** %dev_w, align 8, !dbg !820
  %28 = bitcast float* %27 to i8*, !dbg !820
  %29 = load float** %w, align 8, !dbg !820
  %30 = bitcast float* %29 to i8*, !dbg !820
  %31 = load i32* %size, align 4, !dbg !820
  %32 = sext i32 %31 to i64, !dbg !820
  %33 = call i32 @cudaMemcpy(i8* %28, i8* %30, i64 %32, i32 1), !dbg !820
  %34 = bitcast float (float*, i32)** %host_f to i8*, !dbg !821
  %35 = call i32 @_ZN12_GLOBAL__N_120cudaMemcpyFromSymbolIPFfPfjEEE9cudaErrorPvRKT_mm14cudaMemcpyKind(i8* %34, float (float*, i32)** @p_div_func, i64 8, i64 0, i32 2), !dbg !821
  %36 = load float (float*, i32)** %host_f, align 8, !dbg !822
  store float (float*, i32)* %36, float (float*, i32)** %dev_f, align 8, !dbg !822
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !823
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 8, i32 1, i32 1), !dbg !823
  %37 = bitcast { i64, i32 }* %4 to i8*, !dbg !823
  %38 = bitcast %struct.dim3* %2 to i8*, !dbg !823
  %39 = call i8* @memcpy(i8* %37, i8* %38, i64 12)
  %40 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !823
  %41 = load i64* %40, align 1, !dbg !823
  %42 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !823
  %43 = load i32* %42, align 1, !dbg !823
  %44 = bitcast { i64, i32 }* %5 to i8*, !dbg !823
  %45 = bitcast %struct.dim3* %3 to i8*, !dbg !823
  %46 = call i8* @memcpy(i8* %44, i8* %45, i64 12)
  %47 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !823
  %48 = load i64* %47, align 1, !dbg !823
  %49 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !823
  %50 = load i32* %49, align 1, !dbg !823
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %41, i32 %43, i64 %48, i32 %50), !dbg !823
  %51 = load float** %dev_w, align 8, !dbg !825
  %52 = load float (float*, i32)** %dev_f, align 8, !dbg !825
  call void @_Z3fooPfPFfS_jEji(float* %51, float (float*, i32)* %52, i32 8, i32 1), !dbg !825
  %53 = call i32 @cudaThreadSynchronize(), !dbg !826
  %54 = load float** %w, align 8, !dbg !827
  %55 = bitcast float* %54 to i8*, !dbg !827
  %56 = load float** %dev_w, align 8, !dbg !827
  %57 = bitcast float* %56 to i8*, !dbg !827
  %58 = load i32* %size, align 4, !dbg !827
  %59 = sext i32 %58 to i64, !dbg !827
  %60 = call i32 @cudaMemcpy(i8* %55, i8* %57, i64 %59, i32 2), !dbg !827
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0)), !dbg !828
  store i32 0, i32* %i1, align 4, !dbg !829
  br label %62, !dbg !829

; <label>:62                                      ; preds = %65, %22
  %63 = load i32* %i1, align 4, !dbg !829
  %64 = icmp slt i32 %63, 8, !dbg !829
  br i1 %64, label %65, label %75, !dbg !829

; <label>:65                                      ; preds = %62
  %66 = load i32* %i1, align 4, !dbg !831
  %67 = sext i32 %66 to i64, !dbg !831
  %68 = load float** %w, align 8, !dbg !831
  %69 = getelementptr inbounds float* %68, i64 %67, !dbg !831
  %70 = load float* %69, align 4, !dbg !831
  %71 = fpext float %70 to double, !dbg !831
  %72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str4, i32 0, i32 0), double %71), !dbg !831
  %73 = load i32* %i1, align 4, !dbg !829
  %74 = add nsw i32 %73, 1, !dbg !829
  store i32 %74, i32* %i1, align 4, !dbg !829
  br label %62, !dbg !829

; <label>:75                                      ; preds = %62
  %76 = load float** %w, align 8, !dbg !833
  %77 = bitcast float* %76 to i8*, !dbg !833
  call void @free(i8* %77) nounwind, !dbg !833
  ret i32 0, !dbg !834
}

declare noalias i8* @malloc(i64) nounwind

define internal i32 @_ZN12_GLOBAL__N_120cudaMemcpyFromSymbolIPFfPfjEEE9cudaErrorPvRKT_mm14cudaMemcpyKind(i8* %dst, float (float*, i32)** %symbol, i64 %count, i64 %offset, i32 %kind) uwtable inlinehint {
  %1 = alloca i8*, align 8
  %2 = alloca float (float*, i32)**, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i8* %dst, i8** %1, align 8
  store float (float*, i32)** %symbol, float (float*, i32)*** %2, align 8
  store i64 %count, i64* %3, align 8
  store i64 %offset, i64* %4, align 8
  store i32 %kind, i32* %5, align 4
  %6 = load i8** %1, align 8, !dbg !835
  %7 = load float (float*, i32)*** %2, align 8, !dbg !835
  %8 = bitcast float (float*, i32)** %7 to i8*, !dbg !835
  %9 = load i64* %3, align 8, !dbg !835
  %10 = load i64* %4, align 8, !dbg !835
  %11 = load i32* %5, align 4, !dbg !835
  %12 = call i32 @cudaMemcpyFromSymbol(i8* %6, i8* %8, i64 %9, i64 %10, i32 %11), !dbg !835
  ret i32 %12, !dbg !835
}

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
  %6 = load i32* %2, align 4, !dbg !837
  %7 = load i32* %3, align 4, !dbg !837
  %8 = load i32* %4, align 4, !dbg !837
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !837
  ret void, !dbg !837
}

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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !838
  %7 = load i32* %2, align 4, !dbg !838
  store i32 %7, i32* %6, align 4, !dbg !838
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !838
  %9 = load i32* %3, align 4, !dbg !838
  store i32 %9, i32* %8, align 4, !dbg !838
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !838
  %11 = load i32* %4, align 4, !dbg !838
  store i32 %11, i32* %10, align 4, !dbg !838
  ret void, !dbg !839
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !841
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !841

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !841
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !842
  %4 = load i8* %src.06, align 1, !dbg !842, !tbaa !843
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !842
  store i8 %4, i8* %dest.05, align 1, !dbg !842, !tbaa !843
  %6 = icmp eq i64 %2, 0, !dbg !841
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !841

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !845
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !846
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !846

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !847
  br label %3, !dbg !846

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !846
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !847
  store volatile i8 %2, i8* %a.05, align 1, !dbg !847, !tbaa !843
  %6 = icmp eq i64 %4, 0, !dbg !846
  br i1 %6, label %._crit_edge, label %3, !dbg !846

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !848
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !849
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !851
  ret i32 0, !dbg !853
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !854
  tail call void @free(i8* %1) nounwind, !dbg !854
  ret i32 0, !dbg !856
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !857
  ret i32 0, !dbg !859
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !860
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !862
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !864
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !866
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !868
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !870
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !872
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !874
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !876
  store i8* %1, i8** %devPtr, align 8, !dbg !876, !tbaa !877
  tail call void @__clear_device(), !dbg !878
  ret i32 0, !dbg !879
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !880
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !882
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !884
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !886
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !888
  store i8* %1, i8** %ptr, align 8, !dbg !888, !tbaa !877
  tail call void @__clear_host(), !dbg !889
  ret i32 0, !dbg !890
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !891
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !893
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !895
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !897
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !899
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !901
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !903
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !905
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !907
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !909
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !911
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !913
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !915
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !917
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !919
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !921
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !923
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !925
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !927
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !929
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !931
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !933
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !935
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !937
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !939
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !940
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !942
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !944
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !946
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !947
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !949
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !951
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !953
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !955
}

define i32 @cudaThreadExit() nounwind uwtable readnone {
  ret i32 0, !dbg !957
}

define i32 @cudaThreadGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !959
}

define i32 @cudaThreadGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
  ret i32 0, !dbg !961
}

define i32 @cudaThreadSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !963
}

define i32 @cudaThreadSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
  ret i32 0, !dbg !965
}

define i32 @cudaThreadSynchronize() nounwind uwtable readnone {
  ret i32 0, !dbg !967
}

!llvm.dbg.cu = !{!0, !166, !188, !204, !221, !742}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, meta
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3, metadata !11}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{i32 786436, null, metadata !"cudaError", metadata !4, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !12, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29,
!13 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!14 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!15 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!16 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!17 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!18 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!19 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!20 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!21 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!22 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!23 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!24 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!25 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!26 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!27 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!28 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!29 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!30 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!31 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!32 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!33 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!34 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!35 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!36 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!37 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!38 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!39 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!40 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!41 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!42 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!43 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!44 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!45 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!46 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!47 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!48 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!49 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!50 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!51 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!52 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!53 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!54 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!55 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!56 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!57 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!58 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!59 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!60 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!61 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!62 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!63 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!64 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!65 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!66 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!67 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!68 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!69 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!70 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!71 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!72 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!73 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!74 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!75 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!76 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!77 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!78 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!79 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!80 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!81 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!82 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!83 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!84 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!85 = metadata !{metadata !86}
!86 = metadata !{i32 0}
!87 = metadata !{metadata !88}
!88 = metadata !{metadata !89, metadata !96, metadata !97, metadata !103, metadata !106, metadata !119, metadata !161}
!89 = metadata !{i32 786478, i32 0, metadata !90, metadata !"multiplyByTwo", metadata !"multiplyByTwo", metadata !"_Z13multiplyByTwoPfj", metadata !90, i32 12, metadata !91, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, float (float*, i32)* @
!90 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr", null} ; [ DW_TAG_file_type ]
!91 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !92, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!92 = metadata !{metadata !93, metadata !94, metadata !95}
!93 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!94 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !93} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!95 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!96 = metadata !{i32 786478, i32 0, metadata !90, metadata !"divideByTwo", metadata !"divideByTwo", metadata !"_Z11divideByTwoPfj", metadata !90, i32 17, metadata !91, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, float (float*, i32)* @_Z11di
!97 = metadata !{i32 786478, i32 0, metadata !90, metadata !"foo", metadata !"foo", metadata !"_Z3fooPfPFfS_jEji", metadata !90, i32 29, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*, float (float*, i32)*, i32, i32)
!98 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!99 = metadata !{null, metadata !94, metadata !100, metadata !95, metadata !102}
!100 = metadata !{i32 786454, null, metadata !"funcType", metadata !90, i32 10, i64 0, i64 0, i64 0, i32 0, metadata !101} ; [ DW_TAG_typedef ] [funcType] [line 10, size 0, align 0, offset 0] [from ]
!101 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !91} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!102 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!103 = metadata !{i32 786478, i32 0, metadata !90, metadata !"main", metadata !"main", metadata !"", metadata !90, i32 49, metadata !104, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !85, i32 49} ; [ DW_TA
!104 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !105, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!105 = metadata !{metadata !102}
!106 = metadata !{i32 786478, i32 0, metadata !107, metadata !"cudaMemcpyFromSymbol<float (*)(float *, unsigned int)>", metadata !"cudaMemcpyFromSymbol<float (*)(float *, unsigned int)>", metadata !"_ZN12_GLOBAL__N_120cudaMemcpyFromSymbolIPFfPfjEEE9cudaE
!107 = metadata !{i32 786489, null, metadata !"", metadata !108, i32 93} ; [ DW_TAG_namespace ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/cuda_runtime.h]
!108 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/cuda_runtime.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr", null} ; [ DW_TAG_file_type ]
!109 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !110, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = metadata !{metadata !111, metadata !112, metadata !113, metadata !115, metadata !115, metadata !3}
!111 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !108, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!112 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!113 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !114} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!114 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !101} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!115 = metadata !{i32 786454, null, metadata !"size_t", metadata !108, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !116} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!116 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!117 = metadata !{metadata !118}
!118 = metadata !{i32 786479, null, metadata !"T", metadata !101, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!119 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !120, i32 419, metadata !121, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ej
!120 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr", null} ; [ DW_TAG_file_type ]
!121 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !122, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = metadata !{null, metadata !123, metadata !95, metadata !95, metadata !95}
!123 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !124} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!124 = metadata !{i32 786451, null, metadata !"dim3", metadata !120, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !125, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!125 = metadata !{metadata !126, metadata !127, metadata !128, metadata !129, metadata !132, metadata !150, metadata !153, metadata !158}
!126 = metadata !{i32 786445, metadata !124, metadata !"x", metadata !120, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !95} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!127 = metadata !{i32 786445, metadata !124, metadata !"y", metadata !120, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !95} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!128 = metadata !{i32 786445, metadata !124, metadata !"z", metadata !120, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !95} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!129 = metadata !{i32 786478, i32 0, metadata !124, metadata !"dim3", metadata !"dim3", metadata !"", metadata !120, i32 419, metadata !121, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !130, i32 419} ; [ DW_TAG_
!130 = metadata !{metadata !131}
!131 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!132 = metadata !{i32 786478, i32 0, metadata !124, metadata !"dim3", metadata !"dim3", metadata !"", metadata !120, i32 420, metadata !133, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !130, i32 420} ; [ DW_TAG_
!133 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !134, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!134 = metadata !{null, metadata !123, metadata !135}
!135 = metadata !{i32 786454, null, metadata !"uint3", metadata !120, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !136} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!136 = metadata !{i32 786451, null, metadata !"uint3", metadata !120, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !137, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!137 = metadata !{metadata !138, metadata !139, metadata !140, metadata !141, metadata !145}
!138 = metadata !{i32 786445, metadata !136, metadata !"x", metadata !120, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !95} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!139 = metadata !{i32 786445, metadata !136, metadata !"y", metadata !120, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !95} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!140 = metadata !{i32 786445, metadata !136, metadata !"z", metadata !120, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !95} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!141 = metadata !{i32 786478, i32 0, metadata !136, metadata !"uint3", metadata !"uint3", metadata !"", metadata !120, i32 188, metadata !142, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !130, i32 188} ; [ DW_TA
!142 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !143, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!143 = metadata !{null, metadata !144}
!144 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !136} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!145 = metadata !{i32 786478, i32 0, metadata !136, metadata !"uint3", metadata !"uint3", metadata !"", metadata !120, i32 188, metadata !146, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !130, i32 188} ; [ DW_TA
!146 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !147, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!147 = metadata !{null, metadata !144, metadata !148}
!148 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !149} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!149 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !136} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!150 = metadata !{i32 786478, i32 0, metadata !124, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !120, i32 421, metadata !151, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 
!151 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !152, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!152 = metadata !{metadata !135, metadata !123}
!153 = metadata !{i32 786478, i32 0, metadata !124, metadata !"dim3", metadata !"dim3", metadata !"", metadata !120, i32 415, metadata !154, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !130, i32 415} ; [ DW_TAG_
!154 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !155, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!155 = metadata !{null, metadata !123, metadata !156}
!156 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !157} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!157 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !124} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!158 = metadata !{i32 786478, i32 0, metadata !124, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !120, i32 415, metadata !159, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !130, i32 415} ; [ DW_TA
!159 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !160, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!160 = metadata !{null, metadata !123}
!161 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !120, i32 419, metadata !121, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ej
!162 = metadata !{metadata !163}
!163 = metadata !{metadata !164, metadata !165}
!164 = metadata !{i32 786484, i32 0, null, metadata !"p_mul_func", metadata !"p_mul_func", metadata !"", metadata !90, i32 24, metadata !100, i32 0, i32 1, float (float*, i32)** @p_mul_func} ; [ DW_TAG_variable ] [p_mul_func] [line 24] [def]
!165 = metadata !{i32 786484, i32 0, null, metadata !"p_div_func", metadata !"p_div_func", metadata !"", metadata !90, i32 26, metadata !100, i32 0, i32 1, float (float*, i32)** @p_div_func} ; [ DW_TAG_variable ] [p_div_func] [line 26] [def]
!166 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!167 = metadata !{metadata !168}
!168 = metadata !{metadata !169}
!169 = metadata !{i32 786478, i32 0, metadata !170, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !170, i32 12, metadata !171, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !1
!170 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!171 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !172, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!172 = metadata !{metadata !112, metadata !112, metadata !173, metadata !175}
!173 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !174} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!174 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!175 = metadata !{i32 786454, null, metadata !"size_t", metadata !170, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !116} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!176 = metadata !{metadata !177}
!177 = metadata !{metadata !178, metadata !179, metadata !180, metadata !181, metadata !185}
!178 = metadata !{i32 786689, metadata !169, metadata !"destaddr", metadata !170, i32 16777228, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!179 = metadata !{i32 786689, metadata !169, metadata !"srcaddr", metadata !170, i32 33554444, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!180 = metadata !{i32 786689, metadata !169, metadata !"len", metadata !170, i32 50331660, metadata !175, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!181 = metadata !{i32 786688, metadata !182, metadata !"dest", metadata !170, i32 13, metadata !183, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!182 = metadata !{i32 786443, metadata !169, i32 12, i32 0, metadata !170, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!183 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !184} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!184 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!185 = metadata !{i32 786688, metadata !182, metadata !"src", metadata !170, i32 14, metadata !186, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!186 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !187} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!187 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !184} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!188 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2
!189 = metadata !{metadata !190}
!190 = metadata !{metadata !191}
!191 = metadata !{i32 786478, i32 0, metadata !192, metadata !"memmove", metadata !"memmove", metadata !"", metadata !192, i32 12, metadata !193, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !196, i32 12} ; [ DW_TAG
!192 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!193 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !194, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!194 = metadata !{metadata !112, metadata !112, metadata !173, metadata !195}
!195 = metadata !{i32 786454, null, metadata !"size_t", metadata !192, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !116} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!196 = metadata !{metadata !197}
!197 = metadata !{metadata !198, metadata !199, metadata !200, metadata !201, metadata !203}
!198 = metadata !{i32 786689, metadata !191, metadata !"dst", metadata !192, i32 16777228, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!199 = metadata !{i32 786689, metadata !191, metadata !"src", metadata !192, i32 33554444, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!200 = metadata !{i32 786689, metadata !191, metadata !"count", metadata !192, i32 50331660, metadata !195, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!201 = metadata !{i32 786688, metadata !202, metadata !"a", metadata !192, i32 14, metadata !183, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!202 = metadata !{i32 786443, metadata !191, i32 12, i32 0, metadata !192, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!203 = metadata !{i32 786688, metadata !202, metadata !"b", metadata !192, i32 15, metadata !186, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!204 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!205 = metadata !{metadata !206}
!206 = metadata !{metadata !207}
!207 = metadata !{i32 786478, i32 0, metadata !208, metadata !"memset", metadata !"memset", metadata !"", metadata !208, i32 12, metadata !209, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !2
!208 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!209 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !210, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!210 = metadata !{metadata !112, metadata !112, metadata !102, metadata !211}
!211 = metadata !{i32 786454, null, metadata !"size_t", metadata !208, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !116} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!212 = metadata !{metadata !213}
!213 = metadata !{metadata !214, metadata !215, metadata !216, metadata !217}
!214 = metadata !{i32 786689, metadata !207, metadata !"dst", metadata !208, i32 16777228, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!215 = metadata !{i32 786689, metadata !207, metadata !"s", metadata !208, i32 33554444, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!216 = metadata !{i32 786689, metadata !207, metadata !"count", metadata !208, i32 50331660, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!217 = metadata !{i32 786688, metadata !218, metadata !"a", metadata !208, i32 13, metadata !219, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!218 = metadata !{i32 786443, metadata !207, i32 12, i32 0, metadata !208, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!219 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !220} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!220 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !184} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!221 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!222 = metadata !{metadata !223}
!223 = metadata !{metadata !224, metadata !226, metadata !232}
!224 = metadata !{i32 786436, null, metadata !"cudaError", metadata !225, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !12, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!225 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!226 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !225, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !227, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!227 = metadata !{metadata !228, metadata !229, metadata !230, metadata !231}
!228 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!229 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!230 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!231 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!232 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !225, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!233 = metadata !{metadata !234}
!234 = metadata !{metadata !235, metadata !264, metadata !270, metadata !276, metadata !280, metadata !288, metadata !296, metadata !304, metadata !312, metadata !319, metadata !327, metadata !331, metadata !338, metadata !352, metadata !362, metadata !3
!235 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !236, i32 24, metadata !237, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!236 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!237 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !238, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!238 = metadata !{metadata !239, metadata !240, metadata !248, metadata !255, metadata !256}
!239 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !236, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !224} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!240 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !241} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!241 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !225, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !242, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!242 = metadata !{metadata !243, metadata !244, metadata !245, metadata !246, metadata !247}
!243 = metadata !{i32 786445, metadata !241, metadata !"x", metadata !225, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !102} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!244 = metadata !{i32 786445, metadata !241, metadata !"y", metadata !225, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !102} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!245 = metadata !{i32 786445, metadata !241, metadata !"z", metadata !225, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !102} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!246 = metadata !{i32 786445, metadata !241, metadata !"w", metadata !225, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !102} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!247 = metadata !{i32 786445, metadata !241, metadata !"f", metadata !225, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !226} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!248 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !249} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!249 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !225, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !250, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!250 = metadata !{metadata !251, metadata !253, metadata !254}
!251 = metadata !{i32 786445, metadata !249, metadata !"width", metadata !225, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !252} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!252 = metadata !{i32 786454, null, metadata !"size_t", metadata !225, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !116} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!253 = metadata !{i32 786445, metadata !249, metadata !"height", metadata !225, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !252} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!254 = metadata !{i32 786445, metadata !249, metadata !"depth", metadata !225, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !252} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!255 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !95} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!256 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !257} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!257 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !225, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!258 = metadata !{metadata !259}
!259 = metadata !{metadata !260, metadata !261, metadata !262, metadata !263}
!260 = metadata !{i32 786689, metadata !235, metadata !"desc", metadata !236, i32 16777240, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!261 = metadata !{i32 786689, metadata !235, metadata !"extent", metadata !236, i32 33554456, metadata !248, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!262 = metadata !{i32 786689, metadata !235, metadata !"flags", metadata !236, i32 50331673, metadata !255, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!263 = metadata !{i32 786689, metadata !235, metadata !"array", metadata !236, i32 67108889, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!264 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !236, i32 29, metadata !265, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !267, 
!265 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !266, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!266 = metadata !{metadata !239, metadata !112}
!267 = metadata !{metadata !268}
!268 = metadata !{metadata !269}
!269 = metadata !{i32 786689, metadata !264, metadata !"devPtr", metadata !236, i32 16777245, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!270 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !236, i32 34, metadata !271, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!271 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !272, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!272 = metadata !{metadata !239, metadata !256}
!273 = metadata !{metadata !274}
!274 = metadata !{metadata !275}
!275 = metadata !{i32 786689, metadata !270, metadata !"array", metadata !236, i32 16777250, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!276 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !236, i32 39, metadata !265, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!277 = metadata !{metadata !278}
!278 = metadata !{metadata !279}
!279 = metadata !{i32 786689, metadata !276, metadata !"ptr", metadata !236, i32 16777255, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!280 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !236, i32 44, metadata !281, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!281 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !282, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!282 = metadata !{metadata !239, metadata !283, metadata !186}
!283 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !112} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!284 = metadata !{metadata !285}
!285 = metadata !{metadata !286, metadata !287}
!286 = metadata !{i32 786689, metadata !280, metadata !"devPtr", metadata !236, i32 16777260, metadata !283, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!287 = metadata !{i32 786689, metadata !280, metadata !"symbol", metadata !236, i32 33554476, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!288 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !236, i32 48, metadata !289, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!289 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !290, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!290 = metadata !{metadata !239, metadata !291, metadata !186}
!291 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !252} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!292 = metadata !{metadata !293}
!293 = metadata !{metadata !294, metadata !295}
!294 = metadata !{i32 786689, metadata !288, metadata !"size", metadata !236, i32 16777264, metadata !291, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!295 = metadata !{i32 786689, metadata !288, metadata !"symbol", metadata !236, i32 33554480, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!296 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !236, i32 52, metadata !297, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!297 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !298, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!298 = metadata !{metadata !239, metadata !283, metadata !252, metadata !95}
!299 = metadata !{metadata !300}
!300 = metadata !{metadata !301, metadata !302, metadata !303}
!301 = metadata !{i32 786689, metadata !296, metadata !"pHost", metadata !236, i32 16777268, metadata !283, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!302 = metadata !{i32 786689, metadata !296, metadata !"size", metadata !236, i32 33554484, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!303 = metadata !{i32 786689, metadata !296, metadata !"flags", metadata !236, i32 50331700, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!304 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !236, i32 56, metadata !305, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!305 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !306, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!306 = metadata !{metadata !239, metadata !283, metadata !112, metadata !95}
!307 = metadata !{metadata !308}
!308 = metadata !{metadata !309, metadata !310, metadata !311}
!309 = metadata !{i32 786689, metadata !304, metadata !"pDevice", metadata !236, i32 16777272, metadata !283, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!310 = metadata !{i32 786689, metadata !304, metadata !"pHost", metadata !236, i32 33554488, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!311 = metadata !{i32 786689, metadata !304, metadata !"flags", metadata !236, i32 50331704, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!312 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !236, i32 60, metadata !313, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!313 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !314, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!314 = metadata !{metadata !239, metadata !255, metadata !112}
!315 = metadata !{metadata !316}
!316 = metadata !{metadata !317, metadata !318}
!317 = metadata !{i32 786689, metadata !312, metadata !"pFlags", metadata !236, i32 16777276, metadata !255, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!318 = metadata !{i32 786689, metadata !312, metadata !"pHost", metadata !236, i32 33554492, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!319 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !236, i32 64, metadata !320, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!320 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !321, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!321 = metadata !{metadata !239, metadata !112, metadata !252, metadata !95}
!322 = metadata !{metadata !323}
!323 = metadata !{metadata !324, metadata !325, metadata !326}
!324 = metadata !{i32 786689, metadata !319, metadata !"ptr", metadata !236, i32 16777280, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!325 = metadata !{i32 786689, metadata !319, metadata !"size", metadata !236, i32 33554496, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!326 = metadata !{i32 786689, metadata !319, metadata !"flags", metadata !236, i32 50331712, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!327 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !236, i32 68, metadata !265, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!328 = metadata !{metadata !329}
!329 = metadata !{metadata !330}
!330 = metadata !{i32 786689, metadata !327, metadata !"ptr", metadata !236, i32 16777284, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!331 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !236, i32 72, metadata !332, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!332 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !333, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!333 = metadata !{metadata !239, metadata !283, metadata !252}
!334 = metadata !{metadata !335}
!335 = metadata !{metadata !336, metadata !337}
!336 = metadata !{i32 786689, metadata !331, metadata !"devPtr", metadata !236, i32 16777288, metadata !283, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!337 = metadata !{i32 786689, metadata !331, metadata !"size", metadata !236, i32 33554504, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!338 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !236, i32 80, metadata !339, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!339 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !340, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!340 = metadata !{metadata !239, metadata !341, metadata !249}
!341 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !342} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!342 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !225, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !343, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!343 = metadata !{metadata !344, metadata !345, metadata !346, metadata !347}
!344 = metadata !{i32 786445, metadata !342, metadata !"ptr", metadata !225, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !112} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!345 = metadata !{i32 786445, metadata !342, metadata !"pitch", metadata !225, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !252} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!346 = metadata !{i32 786445, metadata !342, metadata !"xsize", metadata !225, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !252} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!347 = metadata !{i32 786445, metadata !342, metadata !"ysize", metadata !225, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !252} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!348 = metadata !{metadata !349}
!349 = metadata !{metadata !350, metadata !351}
!350 = metadata !{i32 786689, metadata !338, metadata !"pitchedDevPtr", metadata !236, i32 16777296, metadata !341, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!351 = metadata !{i32 786689, metadata !338, metadata !"extent", metadata !236, i32 33554512, metadata !249, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!352 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !236, i32 84, metadata !353, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!353 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !354, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!354 = metadata !{metadata !239, metadata !355, metadata !240, metadata !249, metadata !95}
!355 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !256} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!356 = metadata !{metadata !357}
!357 = metadata !{metadata !358, metadata !359, metadata !360, metadata !361}
!358 = metadata !{i32 786689, metadata !352, metadata !"array", metadata !236, i32 16777300, metadata !355, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!359 = metadata !{i32 786689, metadata !352, metadata !"desc", metadata !236, i32 33554516, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!360 = metadata !{i32 786689, metadata !352, metadata !"extent", metadata !236, i32 50331733, metadata !249, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!361 = metadata !{i32 786689, metadata !352, metadata !"flags", metadata !236, i32 67108949, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!362 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !236, i32 89, metadata !363, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!363 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !364, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!364 = metadata !{metadata !239, metadata !355, metadata !240, metadata !252, metadata !252, metadata !95}
!365 = metadata !{metadata !366}
!366 = metadata !{metadata !367, metadata !368, metadata !369, metadata !370, metadata !371}
!367 = metadata !{i32 786689, metadata !362, metadata !"array", metadata !236, i32 16777305, metadata !355, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!368 = metadata !{i32 786689, metadata !362, metadata !"desc", metadata !236, i32 33554521, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!369 = metadata !{i32 786689, metadata !362, metadata !"width", metadata !236, i32 50331738, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!370 = metadata !{i32 786689, metadata !362, metadata !"height", metadata !236, i32 67108954, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!371 = metadata !{i32 786689, metadata !362, metadata !"flags", metadata !236, i32 83886170, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!372 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !236, i32 94, metadata !332, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!373 = metadata !{metadata !374}
!374 = metadata !{metadata !375, metadata !376}
!375 = metadata !{i32 786689, metadata !372, metadata !"ptr", metadata !236, i32 16777310, metadata !283, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!376 = metadata !{i32 786689, metadata !372, metadata !"size", metadata !236, i32 33554526, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!377 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !236, i32 102, metadata !378, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!378 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !379, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!379 = metadata !{metadata !239, metadata !283, metadata !291, metadata !252, metadata !252}
!380 = metadata !{metadata !381}
!381 = metadata !{metadata !382, metadata !383, metadata !384, metadata !385}
!382 = metadata !{i32 786689, metadata !377, metadata !"devPtr", metadata !236, i32 16777318, metadata !283, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!383 = metadata !{i32 786689, metadata !377, metadata !"pitch", metadata !236, i32 33554534, metadata !291, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!384 = metadata !{i32 786689, metadata !377, metadata !"width", metadata !236, i32 50331750, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!385 = metadata !{i32 786689, metadata !377, metadata !"height", metadata !236, i32 67108966, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!386 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !236, i32 106, metadata !387, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!387 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !388, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!388 = metadata !{metadata !239, metadata !112, metadata !173, metadata !252, metadata !232}
!389 = metadata !{metadata !390}
!390 = metadata !{metadata !391, metadata !392, metadata !393, metadata !394}
!391 = metadata !{i32 786689, metadata !386, metadata !"dst", metadata !236, i32 16777322, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!392 = metadata !{i32 786689, metadata !386, metadata !"src", metadata !236, i32 33554538, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!393 = metadata !{i32 786689, metadata !386, metadata !"count", metadata !236, i32 50331754, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!394 = metadata !{i32 786689, metadata !386, metadata !"kind", metadata !236, i32 67108970, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!395 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !236, i32 111, metadata !396, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!396 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !397, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!397 = metadata !{metadata !239, metadata !112, metadata !252, metadata !173, metadata !252, metadata !252, metadata !252, metadata !232}
!398 = metadata !{metadata !399}
!399 = metadata !{metadata !400, metadata !401, metadata !402, metadata !403, metadata !404, metadata !405, metadata !406}
!400 = metadata !{i32 786689, metadata !395, metadata !"dst", metadata !236, i32 16777327, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!401 = metadata !{i32 786689, metadata !395, metadata !"dpitch", metadata !236, i32 33554543, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!402 = metadata !{i32 786689, metadata !395, metadata !"src", metadata !236, i32 50331759, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!403 = metadata !{i32 786689, metadata !395, metadata !"spitch", metadata !236, i32 67108975, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!404 = metadata !{i32 786689, metadata !395, metadata !"width", metadata !236, i32 83886192, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!405 = metadata !{i32 786689, metadata !395, metadata !"height", metadata !236, i32 100663408, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!406 = metadata !{i32 786689, metadata !395, metadata !"kind", metadata !236, i32 117440624, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!407 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !236, i32 116, metadata !408, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!408 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !409, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!409 = metadata !{metadata !239, metadata !256, metadata !252, metadata !252, metadata !256, metadata !252, metadata !252, metadata !252, metadata !252, metadata !232}
!410 = metadata !{metadata !411}
!411 = metadata !{metadata !412, metadata !413, metadata !414, metadata !415, metadata !416, metadata !417, metadata !418, metadata !419, metadata !420}
!412 = metadata !{i32 786689, metadata !407, metadata !"dst", metadata !236, i32 16777332, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!413 = metadata !{i32 786689, metadata !407, metadata !"wOffsetDst", metadata !236, i32 33554548, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!414 = metadata !{i32 786689, metadata !407, metadata !"hOffsetDst", metadata !236, i32 50331764, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!415 = metadata !{i32 786689, metadata !407, metadata !"src", metadata !236, i32 67108981, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!416 = metadata !{i32 786689, metadata !407, metadata !"wOffsetSrc", metadata !236, i32 83886197, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!417 = metadata !{i32 786689, metadata !407, metadata !"hOffsetSrc", metadata !236, i32 100663413, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!418 = metadata !{i32 786689, metadata !407, metadata !"width", metadata !236, i32 117440630, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!419 = metadata !{i32 786689, metadata !407, metadata !"height", metadata !236, i32 134217846, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!420 = metadata !{i32 786689, metadata !407, metadata !"kind", metadata !236, i32 150995062, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!421 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !236, i32 122, metadata !422, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!422 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !423, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!423 = metadata !{metadata !239, metadata !112, metadata !252, metadata !173, metadata !252, metadata !252, metadata !252, metadata !232, metadata !424}
!424 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !236, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !425} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!425 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !426} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!426 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !225, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!427 = metadata !{metadata !428}
!428 = metadata !{metadata !429, metadata !430, metadata !431, metadata !432, metadata !433, metadata !434, metadata !435, metadata !436}
!429 = metadata !{i32 786689, metadata !421, metadata !"dst", metadata !236, i32 16777338, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!430 = metadata !{i32 786689, metadata !421, metadata !"dpitch", metadata !236, i32 33554554, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!431 = metadata !{i32 786689, metadata !421, metadata !"src", metadata !236, i32 50331770, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!432 = metadata !{i32 786689, metadata !421, metadata !"spitch", metadata !236, i32 67108986, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!433 = metadata !{i32 786689, metadata !421, metadata !"width", metadata !236, i32 83886203, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!434 = metadata !{i32 786689, metadata !421, metadata !"height", metadata !236, i32 100663419, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!435 = metadata !{i32 786689, metadata !421, metadata !"kind", metadata !236, i32 117440635, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!436 = metadata !{i32 786689, metadata !421, metadata !"stream", metadata !236, i32 134217852, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!437 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !236, i32 128, metadata !438, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!438 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !439, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!439 = metadata !{metadata !239, metadata !112, metadata !252, metadata !256, metadata !252, metadata !252, metadata !252, metadata !252, metadata !232}
!440 = metadata !{metadata !441}
!441 = metadata !{metadata !442, metadata !443, metadata !444, metadata !445, metadata !446, metadata !447, metadata !448, metadata !449}
!442 = metadata !{i32 786689, metadata !437, metadata !"dst", metadata !236, i32 16777344, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!443 = metadata !{i32 786689, metadata !437, metadata !"dpitch", metadata !236, i32 33554560, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!444 = metadata !{i32 786689, metadata !437, metadata !"src", metadata !236, i32 50331776, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!445 = metadata !{i32 786689, metadata !437, metadata !"wOffset", metadata !236, i32 67108993, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!446 = metadata !{i32 786689, metadata !437, metadata !"hOffset", metadata !236, i32 83886209, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!447 = metadata !{i32 786689, metadata !437, metadata !"width", metadata !236, i32 100663425, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!448 = metadata !{i32 786689, metadata !437, metadata !"height", metadata !236, i32 117440641, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!449 = metadata !{i32 786689, metadata !437, metadata !"kind", metadata !236, i32 134217858, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!450 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !236, i32 134, metadata !451, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!451 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !452, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!452 = metadata !{metadata !239, metadata !112, metadata !252, metadata !256, metadata !252, metadata !252, metadata !252, metadata !252, metadata !232, metadata !424}
!453 = metadata !{metadata !454}
!454 = metadata !{metadata !455, metadata !456, metadata !457, metadata !458, metadata !459, metadata !460, metadata !461, metadata !462, metadata !463}
!455 = metadata !{i32 786689, metadata !450, metadata !"dst", metadata !236, i32 16777350, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!456 = metadata !{i32 786689, metadata !450, metadata !"dpitch", metadata !236, i32 33554566, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!457 = metadata !{i32 786689, metadata !450, metadata !"src", metadata !236, i32 50331782, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!458 = metadata !{i32 786689, metadata !450, metadata !"wOffset", metadata !236, i32 67108999, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!459 = metadata !{i32 786689, metadata !450, metadata !"hOffset", metadata !236, i32 83886215, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!460 = metadata !{i32 786689, metadata !450, metadata !"width", metadata !236, i32 100663431, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!461 = metadata !{i32 786689, metadata !450, metadata !"height", metadata !236, i32 117440647, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!462 = metadata !{i32 786689, metadata !450, metadata !"kind", metadata !236, i32 134217864, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!463 = metadata !{i32 786689, metadata !450, metadata !"stream", metadata !236, i32 150995080, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!464 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !236, i32 140, metadata !465, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!465 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !466, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!466 = metadata !{metadata !239, metadata !256, metadata !252, metadata !252, metadata !173, metadata !252, metadata !252, metadata !252, metadata !232}
!467 = metadata !{metadata !468}
!468 = metadata !{metadata !469, metadata !470, metadata !471, metadata !472, metadata !473, metadata !474, metadata !475, metadata !476}
!469 = metadata !{i32 786689, metadata !464, metadata !"dst", metadata !236, i32 16777356, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!470 = metadata !{i32 786689, metadata !464, metadata !"wOffset", metadata !236, i32 33554572, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!471 = metadata !{i32 786689, metadata !464, metadata !"hOffset", metadata !236, i32 50331788, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!472 = metadata !{i32 786689, metadata !464, metadata !"src", metadata !236, i32 67109005, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!473 = metadata !{i32 786689, metadata !464, metadata !"spitch", metadata !236, i32 83886221, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!474 = metadata !{i32 786689, metadata !464, metadata !"width", metadata !236, i32 100663437, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!475 = metadata !{i32 786689, metadata !464, metadata !"height", metadata !236, i32 117440653, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!476 = metadata !{i32 786689, metadata !464, metadata !"kind", metadata !236, i32 134217870, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!477 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !236, i32 146, metadata !478, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!478 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !479, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!479 = metadata !{metadata !239, metadata !256, metadata !252, metadata !252, metadata !173, metadata !252, metadata !252, metadata !252, metadata !232, metadata !424}
!480 = metadata !{metadata !481}
!481 = metadata !{metadata !482, metadata !483, metadata !484, metadata !485, metadata !486, metadata !487, metadata !488, metadata !489, metadata !490}
!482 = metadata !{i32 786689, metadata !477, metadata !"dst", metadata !236, i32 16777362, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!483 = metadata !{i32 786689, metadata !477, metadata !"wOffset", metadata !236, i32 33554578, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!484 = metadata !{i32 786689, metadata !477, metadata !"hOffset", metadata !236, i32 50331794, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!485 = metadata !{i32 786689, metadata !477, metadata !"src", metadata !236, i32 67109011, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!486 = metadata !{i32 786689, metadata !477, metadata !"spitch", metadata !236, i32 83886227, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!487 = metadata !{i32 786689, metadata !477, metadata !"width", metadata !236, i32 100663443, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!488 = metadata !{i32 786689, metadata !477, metadata !"height", metadata !236, i32 117440659, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!489 = metadata !{i32 786689, metadata !477, metadata !"kind", metadata !236, i32 134217876, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!490 = metadata !{i32 786689, metadata !477, metadata !"stream", metadata !236, i32 150995092, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!491 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !236, i32 152, metadata !492, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!492 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !493, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!493 = metadata !{metadata !239, metadata !494}
!494 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !495} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!495 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !496} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!496 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !225, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !497, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!497 = metadata !{metadata !498, metadata !500, metadata !506, metadata !507, metadata !508, metadata !509, metadata !510, metadata !511}
!498 = metadata !{i32 786445, metadata !496, metadata !"srcArray", metadata !225, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !499} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!499 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !225, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !256} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!500 = metadata !{i32 786445, metadata !496, metadata !"srcPos", metadata !225, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !501} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!501 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !225, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !502, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!502 = metadata !{metadata !503, metadata !504, metadata !505}
!503 = metadata !{i32 786445, metadata !501, metadata !"x", metadata !225, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !252} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!504 = metadata !{i32 786445, metadata !501, metadata !"y", metadata !225, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !252} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!505 = metadata !{i32 786445, metadata !501, metadata !"z", metadata !225, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !252} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!506 = metadata !{i32 786445, metadata !496, metadata !"srcPtr", metadata !225, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !342} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!507 = metadata !{i32 786445, metadata !496, metadata !"dstArray", metadata !225, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !499} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!508 = metadata !{i32 786445, metadata !496, metadata !"dstPos", metadata !225, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !501} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!509 = metadata !{i32 786445, metadata !496, metadata !"dstPtr", metadata !225, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !342} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!510 = metadata !{i32 786445, metadata !496, metadata !"extent", metadata !225, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !249} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!511 = metadata !{i32 786445, metadata !496, metadata !"kind", metadata !225, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !232} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!512 = metadata !{metadata !513}
!513 = metadata !{metadata !514}
!514 = metadata !{i32 786689, metadata !491, metadata !"p", metadata !236, i32 16777368, metadata !494, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!515 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !236, i32 156, metadata !516, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!516 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !517, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!517 = metadata !{metadata !239, metadata !494, metadata !424}
!518 = metadata !{metadata !519}
!519 = metadata !{metadata !520, metadata !521}
!520 = metadata !{i32 786689, metadata !515, metadata !"p", metadata !236, i32 16777372, metadata !494, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!521 = metadata !{i32 786689, metadata !515, metadata !"stream", metadata !236, i32 33554588, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!522 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !236, i32 160, metadata !523, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!523 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !524, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!524 = metadata !{metadata !239, metadata !525}
!525 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !526} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!526 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !527} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!527 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !225, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !528, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!528 = metadata !{metadata !529, metadata !530, metadata !531, metadata !532, metadata !533, metadata !534, metadata !535, metadata !536, metadata !537}
!529 = metadata !{i32 786445, metadata !527, metadata !"srcArray", metadata !225, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !499} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!530 = metadata !{i32 786445, metadata !527, metadata !"srcPos", metadata !225, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !501} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!531 = metadata !{i32 786445, metadata !527, metadata !"srcPtr", metadata !225, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !342} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!532 = metadata !{i32 786445, metadata !527, metadata !"srcDevice", metadata !225, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !102} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!533 = metadata !{i32 786445, metadata !527, metadata !"dstArray", metadata !225, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !499} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!534 = metadata !{i32 786445, metadata !527, metadata !"dstPos", metadata !225, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !501} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!535 = metadata !{i32 786445, metadata !527, metadata !"dstPtr", metadata !225, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !342} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!536 = metadata !{i32 786445, metadata !527, metadata !"dstDevice", metadata !225, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !102} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!537 = metadata !{i32 786445, metadata !527, metadata !"extent", metadata !225, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !249} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!538 = metadata !{metadata !539}
!539 = metadata !{metadata !540}
!540 = metadata !{i32 786689, metadata !522, metadata !"p", metadata !236, i32 16777376, metadata !525, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!541 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !236, i32 164, metadata !542, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!542 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !543, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!543 = metadata !{metadata !239, metadata !525, metadata !424}
!544 = metadata !{metadata !545}
!545 = metadata !{metadata !546, metadata !547}
!546 = metadata !{i32 786689, metadata !541, metadata !"p", metadata !236, i32 16777380, metadata !525, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!547 = metadata !{i32 786689, metadata !541, metadata !"stream", metadata !236, i32 33554596, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!548 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !236, i32 168, metadata !549, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!549 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !550, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!550 = metadata !{metadata !239, metadata !256, metadata !252, metadata !252, metadata !256, metadata !252, metadata !252, metadata !252, metadata !232}
!551 = metadata !{metadata !552}
!552 = metadata !{metadata !553, metadata !554, metadata !555, metadata !556, metadata !557, metadata !558, metadata !559, metadata !560}
!553 = metadata !{i32 786689, metadata !548, metadata !"dst", metadata !236, i32 16777384, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!554 = metadata !{i32 786689, metadata !548, metadata !"wOffsetDst", metadata !236, i32 33554600, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!555 = metadata !{i32 786689, metadata !548, metadata !"hOffsetDst", metadata !236, i32 50331816, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!556 = metadata !{i32 786689, metadata !548, metadata !"src", metadata !236, i32 67109033, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!557 = metadata !{i32 786689, metadata !548, metadata !"wOffsetSrc", metadata !236, i32 83886249, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!558 = metadata !{i32 786689, metadata !548, metadata !"hOffsetSrc", metadata !236, i32 100663465, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!559 = metadata !{i32 786689, metadata !548, metadata !"count", metadata !236, i32 117440682, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!560 = metadata !{i32 786689, metadata !548, metadata !"kind", metadata !236, i32 134217898, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!561 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !236, i32 174, metadata !562, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!562 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !563, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!563 = metadata !{metadata !239, metadata !112, metadata !173, metadata !252, metadata !232, metadata !424}
!564 = metadata !{metadata !565}
!565 = metadata !{metadata !566, metadata !567, metadata !568, metadata !569, metadata !570}
!566 = metadata !{i32 786689, metadata !561, metadata !"dst", metadata !236, i32 16777390, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!567 = metadata !{i32 786689, metadata !561, metadata !"src", metadata !236, i32 33554606, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!568 = metadata !{i32 786689, metadata !561, metadata !"count", metadata !236, i32 50331822, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!569 = metadata !{i32 786689, metadata !561, metadata !"kind", metadata !236, i32 67109039, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!570 = metadata !{i32 786689, metadata !561, metadata !"stream", metadata !236, i32 83886255, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!571 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !236, i32 179, metadata !572, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!572 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !573, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!573 = metadata !{metadata !239, metadata !112, metadata !256, metadata !252, metadata !252, metadata !252, metadata !232}
!574 = metadata !{metadata !575}
!575 = metadata !{metadata !576, metadata !577, metadata !578, metadata !579, metadata !580, metadata !581}
!576 = metadata !{i32 786689, metadata !571, metadata !"dst", metadata !236, i32 16777395, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!577 = metadata !{i32 786689, metadata !571, metadata !"src", metadata !236, i32 33554611, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!578 = metadata !{i32 786689, metadata !571, metadata !"wOffset", metadata !236, i32 50331827, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!579 = metadata !{i32 786689, metadata !571, metadata !"hOffset", metadata !236, i32 67109044, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!580 = metadata !{i32 786689, metadata !571, metadata !"count", metadata !236, i32 83886260, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!581 = metadata !{i32 786689, metadata !571, metadata !"kind", metadata !236, i32 100663476, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!582 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !236, i32 184, metadata !583, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!583 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !584, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!584 = metadata !{metadata !239, metadata !112, metadata !256, metadata !252, metadata !252, metadata !252, metadata !232, metadata !424}
!585 = metadata !{metadata !586}
!586 = metadata !{metadata !587, metadata !588, metadata !589, metadata !590, metadata !591, metadata !592, metadata !593}
!587 = metadata !{i32 786689, metadata !582, metadata !"dst", metadata !236, i32 16777400, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!588 = metadata !{i32 786689, metadata !582, metadata !"src", metadata !236, i32 33554616, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!589 = metadata !{i32 786689, metadata !582, metadata !"wOffset", metadata !236, i32 50331832, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!590 = metadata !{i32 786689, metadata !582, metadata !"hOffset", metadata !236, i32 67109049, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!591 = metadata !{i32 786689, metadata !582, metadata !"count", metadata !236, i32 83886265, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!592 = metadata !{i32 786689, metadata !582, metadata !"kind", metadata !236, i32 100663481, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!593 = metadata !{i32 786689, metadata !582, metadata !"stream", metadata !236, i32 117440698, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!594 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !236, i32 190, metadata !595, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!595 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !596, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!596 = metadata !{metadata !239, metadata !112, metadata !186, metadata !252, metadata !252, metadata !232}
!597 = metadata !{metadata !598}
!598 = metadata !{metadata !599, metadata !600, metadata !601, metadata !602, metadata !603}
!599 = metadata !{i32 786689, metadata !594, metadata !"dst", metadata !236, i32 16777406, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!600 = metadata !{i32 786689, metadata !594, metadata !"symbol", metadata !236, i32 33554622, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!601 = metadata !{i32 786689, metadata !594, metadata !"count", metadata !236, i32 50331838, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!602 = metadata !{i32 786689, metadata !594, metadata !"offset", metadata !236, i32 67109055, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!603 = metadata !{i32 786689, metadata !594, metadata !"kind", metadata !236, i32 83886271, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!604 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !236, i32 195, metadata !605, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!605 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !606, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!606 = metadata !{metadata !239, metadata !112, metadata !186, metadata !252, metadata !252, metadata !232, metadata !424}
!607 = metadata !{metadata !608}
!608 = metadata !{metadata !609, metadata !610, metadata !611, metadata !612, metadata !613, metadata !614}
!609 = metadata !{i32 786689, metadata !604, metadata !"dst", metadata !236, i32 16777411, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!610 = metadata !{i32 786689, metadata !604, metadata !"symbol", metadata !236, i32 33554627, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!611 = metadata !{i32 786689, metadata !604, metadata !"count", metadata !236, i32 50331843, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!612 = metadata !{i32 786689, metadata !604, metadata !"offset", metadata !236, i32 67109060, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!613 = metadata !{i32 786689, metadata !604, metadata !"kind", metadata !236, i32 83886276, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!614 = metadata !{i32 786689, metadata !604, metadata !"stream", metadata !236, i32 100663493, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!615 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !236, i32 201, metadata !616, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!616 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !617, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!617 = metadata !{metadata !239, metadata !112, metadata !102, metadata !173, metadata !102, metadata !252}
!618 = metadata !{metadata !619}
!619 = metadata !{metadata !620, metadata !621, metadata !622, metadata !623, metadata !624}
!620 = metadata !{i32 786689, metadata !615, metadata !"dst", metadata !236, i32 16777417, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!621 = metadata !{i32 786689, metadata !615, metadata !"dstDevice", metadata !236, i32 33554633, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!622 = metadata !{i32 786689, metadata !615, metadata !"src", metadata !236, i32 50331849, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!623 = metadata !{i32 786689, metadata !615, metadata !"srcDevice", metadata !236, i32 67109065, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!624 = metadata !{i32 786689, metadata !615, metadata !"count", metadata !236, i32 83886281, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!625 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !236, i32 206, metadata !626, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!626 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !627, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!627 = metadata !{metadata !239, metadata !112, metadata !102, metadata !173, metadata !102, metadata !252, metadata !424}
!628 = metadata !{metadata !629}
!629 = metadata !{metadata !630, metadata !631, metadata !632, metadata !633, metadata !634, metadata !635}
!630 = metadata !{i32 786689, metadata !625, metadata !"dst", metadata !236, i32 16777422, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!631 = metadata !{i32 786689, metadata !625, metadata !"dstDevice", metadata !236, i32 33554638, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!632 = metadata !{i32 786689, metadata !625, metadata !"src", metadata !236, i32 50331854, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!633 = metadata !{i32 786689, metadata !625, metadata !"srcDevice", metadata !236, i32 67109070, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!634 = metadata !{i32 786689, metadata !625, metadata !"count", metadata !236, i32 83886287, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!635 = metadata !{i32 786689, metadata !625, metadata !"stream", metadata !236, i32 100663503, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!636 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !236, i32 212, metadata !637, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!637 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !638, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!638 = metadata !{metadata !239, metadata !256, metadata !252, metadata !252, metadata !173, metadata !252, metadata !232}
!639 = metadata !{metadata !640}
!640 = metadata !{metadata !641, metadata !642, metadata !643, metadata !644, metadata !645, metadata !646}
!641 = metadata !{i32 786689, metadata !636, metadata !"dst", metadata !236, i32 16777428, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!642 = metadata !{i32 786689, metadata !636, metadata !"wOffset", metadata !236, i32 33554644, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!643 = metadata !{i32 786689, metadata !636, metadata !"hOffset", metadata !236, i32 50331860, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!644 = metadata !{i32 786689, metadata !636, metadata !"src", metadata !236, i32 67109077, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!645 = metadata !{i32 786689, metadata !636, metadata !"count", metadata !236, i32 83886293, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!646 = metadata !{i32 786689, metadata !636, metadata !"kind", metadata !236, i32 100663509, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!647 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !236, i32 217, metadata !648, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!648 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !649, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!649 = metadata !{metadata !239, metadata !256, metadata !252, metadata !252, metadata !173, metadata !252, metadata !232, metadata !424}
!650 = metadata !{metadata !651}
!651 = metadata !{metadata !652, metadata !653, metadata !654, metadata !655, metadata !656, metadata !657, metadata !658}
!652 = metadata !{i32 786689, metadata !647, metadata !"dst", metadata !236, i32 16777433, metadata !256, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!653 = metadata !{i32 786689, metadata !647, metadata !"wOffset", metadata !236, i32 33554649, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!654 = metadata !{i32 786689, metadata !647, metadata !"hOffset", metadata !236, i32 50331865, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!655 = metadata !{i32 786689, metadata !647, metadata !"src", metadata !236, i32 67109082, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!656 = metadata !{i32 786689, metadata !647, metadata !"count", metadata !236, i32 83886298, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!657 = metadata !{i32 786689, metadata !647, metadata !"kind", metadata !236, i32 100663514, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!658 = metadata !{i32 786689, metadata !647, metadata !"stream", metadata !236, i32 117440731, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!659 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !236, i32 223, metadata !660, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!660 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !661, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!661 = metadata !{metadata !239, metadata !183, metadata !173, metadata !252, metadata !252, metadata !232}
!662 = metadata !{metadata !663}
!663 = metadata !{metadata !664, metadata !665, metadata !666, metadata !667, metadata !668}
!664 = metadata !{i32 786689, metadata !659, metadata !"symbol", metadata !236, i32 16777439, metadata !183, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!665 = metadata !{i32 786689, metadata !659, metadata !"src", metadata !236, i32 33554655, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!666 = metadata !{i32 786689, metadata !659, metadata !"count", metadata !236, i32 50331871, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!667 = metadata !{i32 786689, metadata !659, metadata !"offset", metadata !236, i32 67109088, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!668 = metadata !{i32 786689, metadata !659, metadata !"kind", metadata !236, i32 83886304, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!669 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !236, i32 229, metadata !670, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!670 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !671, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!671 = metadata !{metadata !239, metadata !186, metadata !173, metadata !252, metadata !252, metadata !232, metadata !424}
!672 = metadata !{metadata !673}
!673 = metadata !{metadata !674, metadata !675, metadata !676, metadata !677, metadata !678, metadata !679}
!674 = metadata !{i32 786689, metadata !669, metadata !"symbol", metadata !236, i32 16777445, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!675 = metadata !{i32 786689, metadata !669, metadata !"src", metadata !236, i32 33554661, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!676 = metadata !{i32 786689, metadata !669, metadata !"count", metadata !236, i32 50331877, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!677 = metadata !{i32 786689, metadata !669, metadata !"offset", metadata !236, i32 67109093, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!678 = metadata !{i32 786689, metadata !669, metadata !"kind", metadata !236, i32 83886310, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!679 = metadata !{i32 786689, metadata !669, metadata !"stream", metadata !236, i32 100663526, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!680 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !236, i32 234, metadata !681, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!681 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !682, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!682 = metadata !{metadata !239, metadata !291, metadata !291}
!683 = metadata !{metadata !684}
!684 = metadata !{metadata !685, metadata !686}
!685 = metadata !{i32 786689, metadata !680, metadata !"free", metadata !236, i32 16777450, metadata !291, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!686 = metadata !{i32 786689, metadata !680, metadata !"total", metadata !236, i32 33554666, metadata !291, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!687 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !236, i32 238, metadata !688, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!688 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !689, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!689 = metadata !{metadata !239, metadata !112, metadata !102, metadata !252}
!690 = metadata !{metadata !691}
!691 = metadata !{metadata !692, metadata !693, metadata !694}
!692 = metadata !{i32 786689, metadata !687, metadata !"devPtr", metadata !236, i32 16777454, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!693 = metadata !{i32 786689, metadata !687, metadata !"value", metadata !236, i32 33554670, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!694 = metadata !{i32 786689, metadata !687, metadata !"count", metadata !236, i32 50331886, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!695 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !236, i32 243, metadata !696, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!696 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !697, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!697 = metadata !{metadata !239, metadata !112, metadata !252, metadata !102, metadata !252, metadata !252}
!698 = metadata !{metadata !699}
!699 = metadata !{metadata !700, metadata !701, metadata !702, metadata !703, metadata !704}
!700 = metadata !{i32 786689, metadata !695, metadata !"devPtr", metadata !236, i32 16777459, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!701 = metadata !{i32 786689, metadata !695, metadata !"pitch", metadata !236, i32 33554675, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!702 = metadata !{i32 786689, metadata !695, metadata !"value", metadata !236, i32 50331891, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!703 = metadata !{i32 786689, metadata !695, metadata !"width", metadata !236, i32 67109108, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!704 = metadata !{i32 786689, metadata !695, metadata !"height", metadata !236, i32 83886324, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!705 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !236, i32 248, metadata !706, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!706 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !707, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!707 = metadata !{metadata !239, metadata !112, metadata !252, metadata !102, metadata !252, metadata !252, metadata !424}
!708 = metadata !{metadata !709}
!709 = metadata !{metadata !710, metadata !711, metadata !712, metadata !713, metadata !714, metadata !715}
!710 = metadata !{i32 786689, metadata !705, metadata !"devPtr", metadata !236, i32 16777464, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!711 = metadata !{i32 786689, metadata !705, metadata !"pitch", metadata !236, i32 33554680, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!712 = metadata !{i32 786689, metadata !705, metadata !"value", metadata !236, i32 50331896, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!713 = metadata !{i32 786689, metadata !705, metadata !"width", metadata !236, i32 67109113, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!714 = metadata !{i32 786689, metadata !705, metadata !"height", metadata !236, i32 83886329, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!715 = metadata !{i32 786689, metadata !705, metadata !"stream", metadata !236, i32 100663545, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!716 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !236, i32 253, metadata !717, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!717 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !718, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!718 = metadata !{metadata !239, metadata !342, metadata !102, metadata !249}
!719 = metadata !{metadata !720}
!720 = metadata !{metadata !721, metadata !722, metadata !723}
!721 = metadata !{i32 786689, metadata !716, metadata !"pitchedDevPtr", metadata !236, i32 16777469, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!722 = metadata !{i32 786689, metadata !716, metadata !"value", metadata !236, i32 33554685, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!723 = metadata !{i32 786689, metadata !716, metadata !"extent", metadata !236, i32 50331902, metadata !249, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!724 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !236, i32 258, metadata !725, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!725 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !726, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!726 = metadata !{metadata !239, metadata !342, metadata !102, metadata !249, metadata !424}
!727 = metadata !{metadata !728}
!728 = metadata !{metadata !729, metadata !730, metadata !731, metadata !732}
!729 = metadata !{i32 786689, metadata !724, metadata !"pitchedDevPtr", metadata !236, i32 16777474, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!730 = metadata !{i32 786689, metadata !724, metadata !"value", metadata !236, i32 33554690, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!731 = metadata !{i32 786689, metadata !724, metadata !"extent", metadata !236, i32 50331907, metadata !249, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!732 = metadata !{i32 786689, metadata !724, metadata !"stream", metadata !236, i32 67109123, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!733 = metadata !{i32 786478, i32 0, metadata !236, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !236, i32 263, metadata !734, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!734 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !735, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!735 = metadata !{metadata !239, metadata !112, metadata !102, metadata !252, metadata !424}
!736 = metadata !{metadata !737}
!737 = metadata !{metadata !738, metadata !739, metadata !740, metadata !741}
!738 = metadata !{i32 786689, metadata !733, metadata !"devPtr", metadata !236, i32 16777479, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!739 = metadata !{i32 786689, metadata !733, metadata !"value", metadata !236, i32 33554695, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!740 = metadata !{i32 786689, metadata !733, metadata !"count", metadata !236, i32 50331911, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!741 = metadata !{i32 786689, metadata !733, metadata !"stream", metadata !236, i32 67109127, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!742 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaThreadManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clan
!743 = metadata !{metadata !744}
!744 = metadata !{metadata !224, metadata !745, metadata !751}
!745 = metadata !{i32 786436, null, metadata !"cudaFuncCache", metadata !225, i32 1007, i64 32, i64 32, i32 0, i32 0, null, metadata !746, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaFuncCache] [line 1007, size 32, align 32, offset 0] [from ]
!746 = metadata !{metadata !747, metadata !748, metadata !749, metadata !750}
!747 = metadata !{i32 786472, metadata !"cudaFuncCachePreferNone", i64 0} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferNone :: 0]
!748 = metadata !{i32 786472, metadata !"cudaFuncCachePreferShared", i64 1} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferShared :: 1]
!749 = metadata !{i32 786472, metadata !"cudaFuncCachePreferL1", i64 2} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferL1 :: 2]
!750 = metadata !{i32 786472, metadata !"cudaFuncCachePreferEqual", i64 3} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferEqual :: 3]
!751 = metadata !{i32 786436, null, metadata !"cudaLimit", metadata !225, i32 1040, i64 32, i64 32, i32 0, i32 0, null, metadata !752, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaLimit] [line 1040, size 32, align 32, offset 0] [from ]
!752 = metadata !{metadata !753, metadata !754, metadata !755, metadata !756, metadata !757}
!753 = metadata !{i32 786472, metadata !"cudaLimitStackSize", i64 0} ; [ DW_TAG_enumerator ] [cudaLimitStackSize :: 0]
!754 = metadata !{i32 786472, metadata !"cudaLimitPrintfFifoSize", i64 1} ; [ DW_TAG_enumerator ] [cudaLimitPrintfFifoSize :: 1]
!755 = metadata !{i32 786472, metadata !"cudaLimitMallocHeapSize", i64 2} ; [ DW_TAG_enumerator ] [cudaLimitMallocHeapSize :: 2]
!756 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimeSyncDepth", i64 3} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimeSyncDepth :: 3]
!757 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimePendingLaunchCount", i64 4} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimePendingLaunchCount :: 4]
!758 = metadata !{metadata !759}
!759 = metadata !{metadata !760, metadata !765, metadata !772, metadata !781, metadata !787, metadata !794}
!760 = metadata !{i32 786478, i32 0, metadata !761, metadata !"cudaThreadExit", metadata !"cudaThreadExit", metadata !"", metadata !761, i32 13, metadata !762, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaThreadExit, null, null, 
!761 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaThreadManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!762 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !763, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!763 = metadata !{metadata !764}
!764 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !761, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !224} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!765 = metadata !{i32 786478, i32 0, metadata !761, metadata !"cudaThreadGetCacheConfig", metadata !"cudaThreadGetCacheConfig", metadata !"", metadata !761, i32 17, metadata !766, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cuda
!766 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !767, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!767 = metadata !{metadata !764, metadata !768}
!768 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !745} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaFuncCache]
!769 = metadata !{metadata !770}
!770 = metadata !{metadata !771}
!771 = metadata !{i32 786689, metadata !765, metadata !"pCacheConfig", metadata !761, i32 16777233, metadata !768, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 17]
!772 = metadata !{i32 786478, i32 0, metadata !761, metadata !"cudaThreadGetLimit", metadata !"cudaThreadGetLimit", metadata !"", metadata !761, i32 21, metadata !773, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaThreadG
!773 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !774, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!774 = metadata !{metadata !764, metadata !775, metadata !751}
!775 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !776} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!776 = metadata !{i32 786454, null, metadata !"size_t", metadata !761, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !116} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!777 = metadata !{metadata !778}
!778 = metadata !{metadata !779, metadata !780}
!779 = metadata !{i32 786689, metadata !772, metadata !"pValue", metadata !761, i32 16777237, metadata !775, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 21]
!780 = metadata !{i32 786689, metadata !772, metadata !"limit", metadata !761, i32 33554453, metadata !751, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 21]
!781 = metadata !{i32 786478, i32 0, metadata !761, metadata !"cudaThreadSetCacheConfig", metadata !"cudaThreadSetCacheConfig", metadata !"", metadata !761, i32 25, metadata !782, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaT
!782 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !783, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!783 = metadata !{metadata !764, metadata !745}
!784 = metadata !{metadata !785}
!785 = metadata !{metadata !786}
!786 = metadata !{i32 786689, metadata !781, metadata !"cacheConfig", metadata !761, i32 16777241, metadata !745, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 25]
!787 = metadata !{i32 786478, i32 0, metadata !761, metadata !"cudaThreadSetLimit", metadata !"cudaThreadSetLimit", metadata !"", metadata !761, i32 29, metadata !788, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaThreadSe
!788 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !789, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!789 = metadata !{metadata !764, metadata !751, metadata !776}
!790 = metadata !{metadata !791}
!791 = metadata !{metadata !792, metadata !793}
!792 = metadata !{i32 786689, metadata !787, metadata !"limit", metadata !761, i32 16777245, metadata !751, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 29]
!793 = metadata !{i32 786689, metadata !787, metadata !"value", metadata !761, i32 33554461, metadata !776, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 29]
!794 = metadata !{i32 786478, i32 0, metadata !761, metadata !"cudaThreadSynchronize", metadata !"cudaThreadSynchronize", metadata !"", metadata !761, i32 33, metadata !762, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaThreadSync
!795 = metadata !{i32 14, i32 0, metadata !796, null}
!796 = metadata !{i32 786443, metadata !89, i32 13, i32 0, metadata !90, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr/main.cpp]
!797 = metadata !{i32 19, i32 0, metadata !798, null}
!798 = metadata !{i32 786443, metadata !96, i32 18, i32 0, metadata !90, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr/main.cpp]
!799 = metadata !{i32 31, i32 0, metadata !800, null}
!800 = metadata !{i32 786443, metadata !97, i32 30, i32 0, metadata !90, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr/main.cpp]
!801 = metadata !{i32 32, i32 0, metadata !800, null}
!802 = metadata !{i32 34, i32 0, metadata !800, null}
!803 = metadata !{i32 36, i32 0, metadata !800, null}
!804 = metadata !{i32 38, i32 0, metadata !800, null}
!805 = metadata !{i32 39, i32 0, metadata !800, null}
!806 = metadata !{i32 41, i32 0, metadata !800, null}
!807 = metadata !{i32 43, i32 0, metadata !800, null}
!808 = metadata !{i32 45, i32 0, metadata !809, null}
!809 = metadata !{i32 786443, metadata !800, i32 44, i32 0, metadata !90, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr/main.cpp]
!810 = metadata !{i32 46, i32 0, metadata !809, null}
!811 = metadata !{i32 47, i32 0, metadata !800, null}
!812 = metadata !{i32 53, i32 0, metadata !813, null}
!813 = metadata !{i32 786443, metadata !103, i32 49, i32 0, metadata !90, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr/main.cpp]
!814 = metadata !{i32 55, i32 0, metadata !813, null}
!815 = metadata !{i32 57, i32 0, metadata !816, null}
!816 = metadata !{i32 786443, metadata !813, i32 57, i32 0, metadata !90, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr/main.cpp]
!817 = metadata !{i32 58, i32 0, metadata !818, null}
!818 = metadata !{i32 786443, metadata !816, i32 57, i32 0, metadata !90, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr/main.cpp]
!819 = metadata !{i32 61, i32 0, metadata !813, null}
!820 = metadata !{i32 63, i32 0, metadata !813, null}
!821 = metadata !{i32 67, i32 0, metadata !813, null}
!822 = metadata !{i32 69, i32 0, metadata !813, null}
!823 = metadata !{i32 70, i32 0, metadata !824, null}
!824 = metadata !{i32 786443, metadata !813, i32 70, i32 0, metadata !90, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr/main.cpp]
!825 = metadata !{i32 72, i32 0, metadata !824, null}
!826 = metadata !{i32 75, i32 0, metadata !813, null}
!827 = metadata !{i32 77, i32 0, metadata !813, null}
!828 = metadata !{i32 79, i32 0, metadata !813, null}
!829 = metadata !{i32 80, i32 0, metadata !830, null}
!830 = metadata !{i32 786443, metadata !813, i32 80, i32 0, metadata !90, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr/main.cpp]
!831 = metadata !{i32 81, i32 0, metadata !832, null}
!832 = metadata !{i32 786443, metadata !830, i32 80, i32 0, metadata !90, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr/main.cpp]
!833 = metadata !{i32 84, i32 0, metadata !813, null}
!834 = metadata !{i32 86, i32 0, metadata !813, null}
!835 = metadata !{i32 426, i32 0, metadata !836, null}
!836 = metadata !{i32 786443, metadata !106, i32 425, i32 0, metadata !108, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/cuda_runtime
!837 = metadata !{i32 419, i32 0, metadata !119, null}
!838 = metadata !{i32 419, i32 0, metadata !161, null}
!839 = metadata !{i32 419, i32 0, metadata !840, null}
!840 = metadata !{i32 786443, metadata !161, i32 419, i32 0, metadata !120, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/101_funcptr_to_ptr//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types
!841 = metadata !{i32 16, i32 0, metadata !182, null}
!842 = metadata !{i32 17, i32 0, metadata !182, null}
!843 = metadata !{metadata !"omnipotent char", metadata !844}
!844 = metadata !{metadata !"Simple C/C++ TBAA"}
!845 = metadata !{i32 18, i32 0, metadata !182, null}
!846 = metadata !{i32 14, i32 0, metadata !218, null}
!847 = metadata !{i32 15, i32 0, metadata !218, null}
!848 = metadata !{i32 16, i32 0, metadata !218, null}
!849 = metadata !{i32 26, i32 0, metadata !850, null}
!850 = metadata !{i32 786443, metadata !235, i32 25, i32 0, metadata !236, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!851 = metadata !{i32 30, i32 0, metadata !852, null}
!852 = metadata !{i32 786443, metadata !264, i32 29, i32 0, metadata !236, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!853 = metadata !{i32 31, i32 0, metadata !852, null}
!854 = metadata !{i32 35, i32 0, metadata !855, null}
!855 = metadata !{i32 786443, metadata !270, i32 34, i32 0, metadata !236, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!856 = metadata !{i32 36, i32 0, metadata !855, null}
!857 = metadata !{i32 40, i32 0, metadata !858, null}
!858 = metadata !{i32 786443, metadata !276, i32 39, i32 0, metadata !236, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!859 = metadata !{i32 41, i32 0, metadata !858, null}
!860 = metadata !{i32 45, i32 0, metadata !861, null}
!861 = metadata !{i32 786443, metadata !280, i32 44, i32 0, metadata !236, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!862 = metadata !{i32 49, i32 0, metadata !863, null}
!863 = metadata !{i32 786443, metadata !288, i32 48, i32 0, metadata !236, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!864 = metadata !{i32 53, i32 0, metadata !865, null}
!865 = metadata !{i32 786443, metadata !296, i32 52, i32 0, metadata !236, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!866 = metadata !{i32 57, i32 0, metadata !867, null}
!867 = metadata !{i32 786443, metadata !304, i32 56, i32 0, metadata !236, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!868 = metadata !{i32 61, i32 0, metadata !869, null}
!869 = metadata !{i32 786443, metadata !312, i32 60, i32 0, metadata !236, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!870 = metadata !{i32 65, i32 0, metadata !871, null}
!871 = metadata !{i32 786443, metadata !319, i32 64, i32 0, metadata !236, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!872 = metadata !{i32 69, i32 0, metadata !873, null}
!873 = metadata !{i32 786443, metadata !327, i32 68, i32 0, metadata !236, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!874 = metadata !{i32 73, i32 0, metadata !875, null}
!875 = metadata !{i32 786443, metadata !331, i32 72, i32 0, metadata !236, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!876 = metadata !{i32 74, i32 0, metadata !875, null}
!877 = metadata !{metadata !"any pointer", metadata !843}
!878 = metadata !{i32 75, i32 0, metadata !875, null}
!879 = metadata !{i32 77, i32 0, metadata !875, null}
!880 = metadata !{i32 81, i32 0, metadata !881, null}
!881 = metadata !{i32 786443, metadata !338, i32 80, i32 0, metadata !236, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!882 = metadata !{i32 86, i32 0, metadata !883, null}
!883 = metadata !{i32 786443, metadata !352, i32 85, i32 0, metadata !236, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!884 = metadata !{i32 91, i32 0, metadata !885, null}
!885 = metadata !{i32 786443, metadata !362, i32 90, i32 0, metadata !236, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!886 = metadata !{i32 95, i32 0, metadata !887, null}
!887 = metadata !{i32 786443, metadata !372, i32 94, i32 0, metadata !236, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!888 = metadata !{i32 96, i32 0, metadata !887, null}
!889 = metadata !{i32 97, i32 0, metadata !887, null}
!890 = metadata !{i32 99, i32 0, metadata !887, null}
!891 = metadata !{i32 103, i32 0, metadata !892, null}
!892 = metadata !{i32 786443, metadata !377, i32 102, i32 0, metadata !236, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!893 = metadata !{i32 108, i32 0, metadata !894, null}
!894 = metadata !{i32 786443, metadata !386, i32 106, i32 0, metadata !236, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!895 = metadata !{i32 113, i32 0, metadata !896, null}
!896 = metadata !{i32 786443, metadata !395, i32 112, i32 0, metadata !236, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!897 = metadata !{i32 119, i32 0, metadata !898, null}
!898 = metadata !{i32 786443, metadata !407, i32 118, i32 0, metadata !236, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!899 = metadata !{i32 125, i32 0, metadata !900, null}
!900 = metadata !{i32 786443, metadata !421, i32 124, i32 0, metadata !236, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!901 = metadata !{i32 131, i32 0, metadata !902, null}
!902 = metadata !{i32 786443, metadata !437, i32 130, i32 0, metadata !236, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!903 = metadata !{i32 137, i32 0, metadata !904, null}
!904 = metadata !{i32 786443, metadata !450, i32 136, i32 0, metadata !236, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!905 = metadata !{i32 143, i32 0, metadata !906, null}
!906 = metadata !{i32 786443, metadata !464, i32 142, i32 0, metadata !236, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!907 = metadata !{i32 149, i32 0, metadata !908, null}
!908 = metadata !{i32 786443, metadata !477, i32 148, i32 0, metadata !236, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!909 = metadata !{i32 153, i32 0, metadata !910, null}
!910 = metadata !{i32 786443, metadata !491, i32 152, i32 0, metadata !236, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!911 = metadata !{i32 157, i32 0, metadata !912, null}
!912 = metadata !{i32 786443, metadata !515, i32 156, i32 0, metadata !236, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!913 = metadata !{i32 161, i32 0, metadata !914, null}
!914 = metadata !{i32 786443, metadata !522, i32 160, i32 0, metadata !236, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!915 = metadata !{i32 165, i32 0, metadata !916, null}
!916 = metadata !{i32 786443, metadata !541, i32 164, i32 0, metadata !236, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!917 = metadata !{i32 171, i32 0, metadata !918, null}
!918 = metadata !{i32 786443, metadata !548, i32 170, i32 0, metadata !236, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!919 = metadata !{i32 176, i32 0, metadata !920, null}
!920 = metadata !{i32 786443, metadata !561, i32 175, i32 0, metadata !236, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!921 = metadata !{i32 181, i32 0, metadata !922, null}
!922 = metadata !{i32 786443, metadata !571, i32 180, i32 0, metadata !236, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!923 = metadata !{i32 187, i32 0, metadata !924, null}
!924 = metadata !{i32 786443, metadata !582, i32 186, i32 0, metadata !236, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!925 = metadata !{i32 192, i32 0, metadata !926, null}
!926 = metadata !{i32 786443, metadata !594, i32 191, i32 0, metadata !236, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!927 = metadata !{i32 198, i32 0, metadata !928, null}
!928 = metadata !{i32 786443, metadata !604, i32 197, i32 0, metadata !236, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!929 = metadata !{i32 203, i32 0, metadata !930, null}
!930 = metadata !{i32 786443, metadata !615, i32 201, i32 0, metadata !236, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!931 = metadata !{i32 209, i32 0, metadata !932, null}
!932 = metadata !{i32 786443, metadata !625, i32 207, i32 0, metadata !236, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!933 = metadata !{i32 214, i32 0, metadata !934, null}
!934 = metadata !{i32 786443, metadata !636, i32 213, i32 0, metadata !236, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!935 = metadata !{i32 220, i32 0, metadata !936, null}
!936 = metadata !{i32 786443, metadata !647, i32 219, i32 0, metadata !236, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!937 = metadata !{i32 225, i32 0, metadata !938, null}
!938 = metadata !{i32 786443, metadata !659, i32 224, i32 0, metadata !236, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!939 = metadata !{i32 226, i32 0, metadata !938, null}
!940 = metadata !{i32 231, i32 0, metadata !941, null}
!941 = metadata !{i32 786443, metadata !669, i32 230, i32 0, metadata !236, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!942 = metadata !{i32 235, i32 0, metadata !943, null}
!943 = metadata !{i32 786443, metadata !680, i32 234, i32 0, metadata !236, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!944 = metadata !{i32 239, i32 0, metadata !945, null}
!945 = metadata !{i32 786443, metadata !687, i32 238, i32 0, metadata !236, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!946 = metadata !{i32 240, i32 0, metadata !945, null}
!947 = metadata !{i32 245, i32 0, metadata !948, null}
!948 = metadata !{i32 786443, metadata !695, i32 244, i32 0, metadata !236, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!949 = metadata !{i32 250, i32 0, metadata !950, null}
!950 = metadata !{i32 786443, metadata !705, i32 249, i32 0, metadata !236, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!951 = metadata !{i32 255, i32 0, metadata !952, null}
!952 = metadata !{i32 786443, metadata !716, i32 254, i32 0, metadata !236, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!953 = metadata !{i32 260, i32 0, metadata !954, null}
!954 = metadata !{i32 786443, metadata !724, i32 259, i32 0, metadata !236, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!955 = metadata !{i32 264, i32 0, metadata !956, null}
!956 = metadata !{i32 786443, metadata !733, i32 263, i32 0, metadata !236, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!957 = metadata !{i32 14, i32 0, metadata !958, null}
!958 = metadata !{i32 786443, metadata !760, i32 13, i32 0, metadata !761, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!959 = metadata !{i32 18, i32 0, metadata !960, null}
!960 = metadata !{i32 786443, metadata !765, i32 17, i32 0, metadata !761, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!961 = metadata !{i32 22, i32 0, metadata !962, null}
!962 = metadata !{i32 786443, metadata !772, i32 21, i32 0, metadata !761, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!963 = metadata !{i32 26, i32 0, metadata !964, null}
!964 = metadata !{i32 786443, metadata !781, i32 25, i32 0, metadata !761, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!965 = metadata !{i32 30, i32 0, metadata !966, null}
!966 = metadata !{i32 786443, metadata !787, i32 29, i32 0, metadata !761, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!967 = metadata !{i32 34, i32 0, metadata !968, null}
!968 = metadata !{i32 786443, metadata !794, i32 33, i32 0, metadata !761, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
