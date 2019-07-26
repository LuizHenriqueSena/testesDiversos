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

@.str = private unnamed_addr constant [20 x i8] c"funcA with p%f = %f\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"funcB with p%f = %f\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"funcC with p%f = %f\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"funcD with p%f = %f\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"funcE with p%f = %f\00", align 1

define void @_Z1aPf(float* %v) uwtable section "__device__" {
  %1 = alloca float*, align 8
  store float* %v, float** %1, align 8
  %2 = load float** %1, align 8, !dbg !728
  %3 = load float* %2, align 4, !dbg !728
  %4 = fpext float %3 to double, !dbg !728
  %5 = load float** %1, align 8, !dbg !728
  %6 = load float* %5, align 4, !dbg !728
  %7 = fpext float %6 to double, !dbg !728
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), double %4, double %7), !dbg !728
  ret void, !dbg !730
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @printf(i8*, ...)

define void @_Z1bPf(float* %v) uwtable section "__device__" {
  %1 = alloca float*, align 8
  store float* %v, float** %1, align 8
  %2 = load float** %1, align 8, !dbg !731
  %3 = load float* %2, align 4, !dbg !731
  %4 = fpext float %3 to double, !dbg !731
  %5 = load float** %1, align 8, !dbg !731
  %6 = load float* %5, align 4, !dbg !731
  %7 = fpext float %6 to double, !dbg !731
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), double %4, double %7), !dbg !731
  ret void, !dbg !733
}

define void @_Z1cPf(float* %v) uwtable section "__device__" {
  %1 = alloca float*, align 8
  store float* %v, float** %1, align 8
  %2 = load float** %1, align 8, !dbg !734
  %3 = load float* %2, align 4, !dbg !734
  %4 = fpext float %3 to double, !dbg !734
  %5 = load float** %1, align 8, !dbg !734
  %6 = load float* %5, align 4, !dbg !734
  %7 = fpext float %6 to double, !dbg !734
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), double %4, double %7), !dbg !734
  ret void, !dbg !736
}

define void @_Z1dPf(float* %v) uwtable section "__device__" {
  %1 = alloca float*, align 8
  store float* %v, float** %1, align 8
  %2 = load float** %1, align 8, !dbg !737
  %3 = load float* %2, align 4, !dbg !737
  %4 = fpext float %3 to double, !dbg !737
  %5 = load float** %1, align 8, !dbg !737
  %6 = load float* %5, align 4, !dbg !737
  %7 = fpext float %6 to double, !dbg !737
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), double %4, double %7), !dbg !737
  ret void, !dbg !739
}

define void @_Z1ePf(float* %v) uwtable section "__device__" {
  %1 = alloca float*, align 8
  store float* %v, float** %1, align 8
  %2 = load float** %1, align 8, !dbg !740
  %3 = load float* %2, align 4, !dbg !740
  %4 = fpext float %3 to double, !dbg !740
  %5 = load float** %1, align 8, !dbg !740
  %6 = load float* %5, align 4, !dbg !740
  %7 = fpext float %6 to double, !dbg !740
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0), double %4, double %7), !dbg !740
  ret void, !dbg !742
}

define void @_Z11should_failPfS_S_S_S_ii(float* noalias %p1, float* noalias %p2, float* noalias %p3, float* noalias %p4, float* noalias %p5, i32 %x, i32 %y) uwtable noinline {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca float*, align 8
  %5 = alloca float*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %fp = alloca void (float*)*, align 8
  store float* %p1, float** %1, align 8
  store float* %p2, float** %2, align 8
  store float* %p3, float** %3, align 8
  store float* %p4, float** %4, align 8
  store float* %p5, float** %5, align 8
  store i32 %x, i32* %6, align 4
  store i32 %y, i32* %7, align 4
  store void (float*)* @_Z1aPf, void (float*)** %fp, align 8, !dbg !743
  %8 = load i32* %6, align 4, !dbg !745
  switch i32 %8, label %13 [
    i32 1, label %9
    i32 2, label %10
    i32 3, label %11
    i32 4, label %12
  ], !dbg !745

; <label>:9                                       ; preds = %0
  store void (float*)* @_Z1aPf, void (float*)** %fp, align 8, !dbg !746
  br label %14, !dbg !748

; <label>:10                                      ; preds = %0
  store void (float*)* @_Z1bPf, void (float*)** %fp, align 8, !dbg !749
  br label %14, !dbg !750

; <label>:11                                      ; preds = %0
  store void (float*)* @_Z1cPf, void (float*)** %fp, align 8, !dbg !751
  br label %14, !dbg !752

; <label>:12                                      ; preds = %0
  store void (float*)* @_Z1dPf, void (float*)** %fp, align 8, !dbg !753
  br label %14, !dbg !754

; <label>:13                                      ; preds = %0
  store void (float*)* @_Z1ePf, void (float*)** %fp, align 8, !dbg !755
  br label %14, !dbg !756

; <label>:14                                      ; preds = %13, %12, %11, %10, %9
  %15 = load i32* %7, align 4, !dbg !757
  switch i32 %15, label %28 [
    i32 1, label %16
    i32 2, label %19
    i32 3, label %22
    i32 4, label %25
  ], !dbg !757

; <label>:16                                      ; preds = %14
  %17 = load void (float*)** %fp, align 8, !dbg !758
  %18 = load float** %1, align 8, !dbg !758
  call void %17(float* %18), !dbg !758
  br label %31, !dbg !760

; <label>:19                                      ; preds = %14
  %20 = load void (float*)** %fp, align 8, !dbg !761
  %21 = load float** %2, align 8, !dbg !761
  call void %20(float* %21), !dbg !761
  br label %31, !dbg !762

; <label>:22                                      ; preds = %14
  %23 = load void (float*)** %fp, align 8, !dbg !763
  %24 = load float** %3, align 8, !dbg !763
  call void %23(float* %24), !dbg !763
  br label %31, !dbg !764

; <label>:25                                      ; preds = %14
  %26 = load void (float*)** %fp, align 8, !dbg !765
  %27 = load float** %4, align 8, !dbg !765
  call void %26(float* %27), !dbg !765
  br label %31, !dbg !766

; <label>:28                                      ; preds = %14
  %29 = load void (float*)** %fp, align 8, !dbg !767
  %30 = load float** %5, align 8, !dbg !767
  call void %29(float* %30), !dbg !767
  br label %31, !dbg !768

; <label>:31                                      ; preds = %28, %25, %22, %19, %16
  ret void, !dbg !769
}

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %p1 = alloca float, align 4
  %p2 = alloca float, align 4
  %p3 = alloca float, align 4
  %p4 = alloca float, align 4
  %p5 = alloca float, align 4
  %dev_p1 = alloca float*, align 8
  %dev_p2 = alloca float*, align 8
  %dev_p3 = alloca float*, align 8
  %dev_p4 = alloca float*, align 8
  %dev_p5 = alloca float*, align 8
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  store i32 0, i32* %1
  store float 1.000000e+00, float* %p1, align 4, !dbg !770
  store float 2.000000e+00, float* %p2, align 4, !dbg !770
  store float 3.000000e+00, float* %p3, align 4, !dbg !770
  store float 4.000000e+00, float* %p4, align 4, !dbg !770
  store float 5.000000e+00, float* %p5, align 4, !dbg !770
  %6 = bitcast float** %dev_p1 to i8**, !dbg !772
  %7 = call i32 @cudaMalloc(i8** %6, i64 4), !dbg !772
  %8 = bitcast float** %dev_p2 to i8**, !dbg !773
  %9 = call i32 @cudaMalloc(i8** %8, i64 4), !dbg !773
  %10 = bitcast float** %dev_p3 to i8**, !dbg !774
  %11 = call i32 @cudaMalloc(i8** %10, i64 4), !dbg !774
  %12 = bitcast float** %dev_p4 to i8**, !dbg !775
  %13 = call i32 @cudaMalloc(i8** %12, i64 4), !dbg !775
  %14 = bitcast float** %dev_p5 to i8**, !dbg !776
  %15 = call i32 @cudaMalloc(i8** %14, i64 4), !dbg !776
  %16 = load float** %dev_p1, align 8, !dbg !777
  %17 = bitcast float* %16 to i8*, !dbg !777
  %18 = bitcast float* %p1 to i8*, !dbg !777
  %19 = call i32 @cudaMemcpy(i8* %17, i8* %18, i64 4, i32 1), !dbg !777
  %20 = load float** %dev_p2, align 8, !dbg !778
  %21 = bitcast float* %20 to i8*, !dbg !778
  %22 = bitcast float* %p2 to i8*, !dbg !778
  %23 = call i32 @cudaMemcpy(i8* %21, i8* %22, i64 4, i32 1), !dbg !778
  %24 = load float** %dev_p3, align 8, !dbg !779
  %25 = bitcast float* %24 to i8*, !dbg !779
  %26 = bitcast float* %p3 to i8*, !dbg !779
  %27 = call i32 @cudaMemcpy(i8* %25, i8* %26, i64 4, i32 1), !dbg !779
  %28 = load float** %dev_p4, align 8, !dbg !780
  %29 = bitcast float* %28 to i8*, !dbg !780
  %30 = bitcast float* %p4 to i8*, !dbg !780
  %31 = call i32 @cudaMemcpy(i8* %29, i8* %30, i64 4, i32 1), !dbg !780
  %32 = load float** %dev_p5, align 8, !dbg !781
  %33 = bitcast float* %32 to i8*, !dbg !781
  %34 = bitcast float* %p5 to i8*, !dbg !781
  %35 = call i32 @cudaMemcpy(i8* %33, i8* %34, i64 4, i32 1), !dbg !781
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !782
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 2, i32 1, i32 1), !dbg !782
  %36 = bitcast { i64, i32 }* %4 to i8*, !dbg !782
  %37 = bitcast %struct.dim3* %2 to i8*, !dbg !782
  %38 = call i8* @memcpy(i8* %36, i8* %37, i64 12)
  %39 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !782
  %40 = load i64* %39, align 1, !dbg !782
  %41 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !782
  %42 = load i32* %41, align 1, !dbg !782
  %43 = bitcast { i64, i32 }* %5 to i8*, !dbg !782
  %44 = bitcast %struct.dim3* %3 to i8*, !dbg !782
  %45 = call i8* @memcpy(i8* %43, i8* %44, i64 12)
  %46 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !782
  %47 = load i64* %46, align 1, !dbg !782
  %48 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !782
  %49 = load i32* %48, align 1, !dbg !782
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %40, i32 %42, i64 %47, i32 %49), !dbg !782
  %50 = load float** %dev_p1, align 8, !dbg !784
  %51 = load float** %dev_p2, align 8, !dbg !784
  %52 = load float** %dev_p3, align 8, !dbg !784
  %53 = load float** %dev_p4, align 8, !dbg !784
  %54 = load float** %dev_p5, align 8, !dbg !784
  call void @_Z11should_failPfS_S_S_S_ii(float* %50, float* %51, float* %52, float* %53, float* %54, i32 4, i32 4), !dbg !784
  %55 = bitcast float* %p1 to i8*, !dbg !785
  %56 = load float** %dev_p1, align 8, !dbg !785
  %57 = bitcast float* %56 to i8*, !dbg !785
  %58 = call i32 @cudaMemcpy(i8* %55, i8* %57, i64 4, i32 2), !dbg !785
  %59 = bitcast float* %p2 to i8*, !dbg !786
  %60 = load float** %dev_p2, align 8, !dbg !786
  %61 = bitcast float* %60 to i8*, !dbg !786
  %62 = call i32 @cudaMemcpy(i8* %59, i8* %61, i64 4, i32 2), !dbg !786
  %63 = bitcast float* %p3 to i8*, !dbg !787
  %64 = load float** %dev_p3, align 8, !dbg !787
  %65 = bitcast float* %64 to i8*, !dbg !787
  %66 = call i32 @cudaMemcpy(i8* %63, i8* %65, i64 4, i32 2), !dbg !787
  %67 = bitcast float* %p4 to i8*, !dbg !788
  %68 = load float** %dev_p4, align 8, !dbg !788
  %69 = bitcast float* %68 to i8*, !dbg !788
  %70 = call i32 @cudaMemcpy(i8* %67, i8* %69, i64 4, i32 2), !dbg !788
  %71 = bitcast float* %p5 to i8*, !dbg !789
  %72 = load float** %dev_p5, align 8, !dbg !789
  %73 = bitcast float* %72 to i8*, !dbg !789
  %74 = call i32 @cudaMemcpy(i8* %71, i8* %73, i64 4, i32 2), !dbg !789
  %75 = load float** %dev_p1, align 8, !dbg !790
  %76 = bitcast float* %75 to i8*, !dbg !790
  %77 = call i32 @cudaFree(i8* %76), !dbg !790
  %78 = load float** %dev_p2, align 8, !dbg !791
  %79 = bitcast float* %78 to i8*, !dbg !791
  %80 = call i32 @cudaFree(i8* %79), !dbg !791
  %81 = load float** %dev_p3, align 8, !dbg !792
  %82 = bitcast float* %81 to i8*, !dbg !792
  %83 = call i32 @cudaFree(i8* %82), !dbg !792
  %84 = load float** %dev_p4, align 8, !dbg !793
  %85 = bitcast float* %84 to i8*, !dbg !793
  %86 = call i32 @cudaFree(i8* %85), !dbg !793
  %87 = load float** %dev_p5, align 8, !dbg !794
  %88 = bitcast float* %87 to i8*, !dbg !794
  %89 = call i32 @cudaFree(i8* %88), !dbg !794
  ret i32 0, !dbg !795
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
  %6 = load i32* %2, align 4, !dbg !796
  %7 = load i32* %3, align 4, !dbg !796
  %8 = load i32* %4, align 4, !dbg !796
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !796
  ret void, !dbg !796
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !797
  %7 = load i32* %2, align 4, !dbg !797
  store i32 %7, i32* %6, align 4, !dbg !797
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !797
  %9 = load i32* %3, align 4, !dbg !797
  store i32 %9, i32* %8, align 4, !dbg !797
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !797
  %11 = load i32* %4, align 4, !dbg !797
  store i32 %11, i32* %10, align 4, !dbg !797
  ret void, !dbg !798
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !800
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !800

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !800
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !801
  %4 = load i8* %src.06, align 1, !dbg !801, !tbaa !802
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !801
  store i8 %4, i8* %dest.05, align 1, !dbg !801, !tbaa !802
  %6 = icmp eq i64 %2, 0, !dbg !800
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !800

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !804
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !805
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !805

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !806
  br label %3, !dbg !805

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !805
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !806
  store volatile i8 %2, i8* %a.05, align 1, !dbg !806, !tbaa !802
  %6 = icmp eq i64 %4, 0, !dbg !805
  br i1 %6, label %._crit_edge, label %3, !dbg !805

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !807
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !808
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !810
  ret i32 0, !dbg !812
}

declare void @free(i8* nocapture) nounwind

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !813
  tail call void @free(i8* %1) nounwind, !dbg !813
  ret i32 0, !dbg !815
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !816
  ret i32 0, !dbg !818
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !819
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !821
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !823
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !825
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !827
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !829
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !831
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !833
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !835
  store i8* %1, i8** %devPtr, align 8, !dbg !835, !tbaa !836
  tail call void @__clear_device(), !dbg !837
  ret i32 0, !dbg !838
}

declare void @__set_device()

declare noalias i8* @malloc(i64) nounwind

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !839
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !841
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !843
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !845
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !847
  store i8* %1, i8** %ptr, align 8, !dbg !847, !tbaa !836
  tail call void @__clear_host(), !dbg !848
  ret i32 0, !dbg !849
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !850
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !852
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !854
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !856
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !858
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !860
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !862
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !864
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !866
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !868
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !870
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !872
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !874
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !876
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !878
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !880
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !882
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !884
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !886
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !888
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !890
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !892
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !894
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !896
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !898
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !899
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !901
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !903
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !905
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !906
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !908
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !910
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !912
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !914
}

!llvm.dbg.cu = !{!0, !77, !101, !117, !134}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !30, metadata !33, metadata !76}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"a", metadata !"a", metadata !"_Z1aPf", metadata !16, i32 12, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*)* @_Z1aPf, null, null, metadata !11, i32 13} ; 
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!20 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!21 = metadata !{i32 786478, i32 0, metadata !16, metadata !"b", metadata !"b", metadata !"_Z1bPf", metadata !16, i32 16, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*)* @_Z1bPf, null, null, metadata !11, i32 17} ; 
!22 = metadata !{i32 786478, i32 0, metadata !16, metadata !"c", metadata !"c", metadata !"_Z1cPf", metadata !16, i32 21, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*)* @_Z1cPf, null, null, metadata !11, i32 22} ; 
!23 = metadata !{i32 786478, i32 0, metadata !16, metadata !"d", metadata !"d", metadata !"_Z1dPf", metadata !16, i32 26, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*)* @_Z1dPf, null, null, metadata !11, i32 27} ; 
!24 = metadata !{i32 786478, i32 0, metadata !16, metadata !"e", metadata !"e", metadata !"_Z1ePf", metadata !16, i32 31, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*)* @_Z1ePf, null, null, metadata !11, i32 32} ; 
!25 = metadata !{i32 786478, i32 0, metadata !16, metadata !"should_fail", metadata !"should_fail", metadata !"_Z11should_failPfS_S_S_S_ii", metadata !16, i32 36, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*, float
!26 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{null, metadata !28, metadata !28, metadata !28, metadata !28, metadata !28, metadata !29, metadata !29}
!28 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 79, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 79} ; [ DW_TAG_
!31 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{metadata !29}
!33 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !34, i32 419, metadata !35, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!34 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair", null} ; [ DW_TAG_file_type ]
!35 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{null, metadata !37, metadata !41, metadata !41, metadata !41}
!37 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!38 = metadata !{i32 786451, null, metadata !"dim3", metadata !34, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !39, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!39 = metadata !{metadata !40, metadata !42, metadata !43, metadata !44, metadata !47, metadata !65, metadata !68, metadata !73}
!40 = metadata !{i32 786445, metadata !38, metadata !"x", metadata !34, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!41 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!42 = metadata !{i32 786445, metadata !38, metadata !"y", metadata !34, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !41} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!43 = metadata !{i32 786445, metadata !38, metadata !"z", metadata !34, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !41} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!44 = metadata !{i32 786478, i32 0, metadata !38, metadata !"dim3", metadata !"dim3", metadata !"", metadata !34, i32 419, metadata !35, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !45, i32 419} ; [ DW_TAG_subpr
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!47 = metadata !{i32 786478, i32 0, metadata !38, metadata !"dim3", metadata !"dim3", metadata !"", metadata !34, i32 420, metadata !48, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !45, i32 420} ; [ DW_TAG_subpr
!48 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{null, metadata !37, metadata !50}
!50 = metadata !{i32 786454, null, metadata !"uint3", metadata !34, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!51 = metadata !{i32 786451, null, metadata !"uint3", metadata !34, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !52, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!52 = metadata !{metadata !53, metadata !54, metadata !55, metadata !56, metadata !60}
!53 = metadata !{i32 786445, metadata !51, metadata !"x", metadata !34, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!54 = metadata !{i32 786445, metadata !51, metadata !"y", metadata !34, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !41} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!55 = metadata !{i32 786445, metadata !51, metadata !"z", metadata !34, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !41} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!56 = metadata !{i32 786478, i32 0, metadata !51, metadata !"uint3", metadata !"uint3", metadata !"", metadata !34, i32 188, metadata !57, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !45, i32 188} ; [ DW_TAG_sub
!57 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{null, metadata !59}
!59 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!60 = metadata !{i32 786478, i32 0, metadata !51, metadata !"uint3", metadata !"uint3", metadata !"", metadata !34, i32 188, metadata !61, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !45, i32 188} ; [ DW_TAG_sub
!61 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !62, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = metadata !{null, metadata !59, metadata !63}
!63 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!65 = metadata !{i32 786478, i32 0, metadata !38, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !34, i32 421, metadata !66, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!66 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !67, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = metadata !{metadata !50, metadata !37}
!68 = metadata !{i32 786478, i32 0, metadata !38, metadata !"dim3", metadata !"dim3", metadata !"", metadata !34, i32 415, metadata !69, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !45, i32 415} ; [ DW_TAG_subpr
!69 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{null, metadata !37, metadata !71}
!71 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !72} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !38} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!73 = metadata !{i32 786478, i32 0, metadata !38, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !34, i32 415, metadata !74, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !45, i32 415} ; [ DW_TAG_sub
!74 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !75, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = metadata !{null, metadata !37}
!76 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !34, i32 419, metadata !35, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!77 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!78 = metadata !{metadata !79}
!79 = metadata !{metadata !80}
!80 = metadata !{i32 786478, i32 0, metadata !81, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !81, i32 12, metadata !82, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !89, i
!81 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!82 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !83, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!83 = metadata !{metadata !84, metadata !84, metadata !85, metadata !87}
!84 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!85 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !86} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!86 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!87 = metadata !{i32 786454, null, metadata !"size_t", metadata !81, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!88 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!89 = metadata !{metadata !90}
!90 = metadata !{metadata !91, metadata !92, metadata !93, metadata !94, metadata !98}
!91 = metadata !{i32 786689, metadata !80, metadata !"destaddr", metadata !81, i32 16777228, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!92 = metadata !{i32 786689, metadata !80, metadata !"srcaddr", metadata !81, i32 33554444, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!93 = metadata !{i32 786689, metadata !80, metadata !"len", metadata !81, i32 50331660, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!94 = metadata !{i32 786688, metadata !95, metadata !"dest", metadata !81, i32 13, metadata !96, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!95 = metadata !{i32 786443, metadata !80, i32 12, i32 0, metadata !81, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!96 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !97} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!97 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!98 = metadata !{i32 786688, metadata !95, metadata !"src", metadata !81, i32 14, metadata !99, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!99 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !100} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!100 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !97} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!101 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2
!102 = metadata !{metadata !103}
!103 = metadata !{metadata !104}
!104 = metadata !{i32 786478, i32 0, metadata !105, metadata !"memmove", metadata !"memmove", metadata !"", metadata !105, i32 12, metadata !106, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !109, i32 12} ; [ DW_TAG
!105 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!106 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !107, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!107 = metadata !{metadata !84, metadata !84, metadata !85, metadata !108}
!108 = metadata !{i32 786454, null, metadata !"size_t", metadata !105, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!109 = metadata !{metadata !110}
!110 = metadata !{metadata !111, metadata !112, metadata !113, metadata !114, metadata !116}
!111 = metadata !{i32 786689, metadata !104, metadata !"dst", metadata !105, i32 16777228, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!112 = metadata !{i32 786689, metadata !104, metadata !"src", metadata !105, i32 33554444, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!113 = metadata !{i32 786689, metadata !104, metadata !"count", metadata !105, i32 50331660, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!114 = metadata !{i32 786688, metadata !115, metadata !"a", metadata !105, i32 14, metadata !96, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!115 = metadata !{i32 786443, metadata !104, i32 12, i32 0, metadata !105, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!116 = metadata !{i32 786688, metadata !115, metadata !"b", metadata !105, i32 15, metadata !99, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!117 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!118 = metadata !{metadata !119}
!119 = metadata !{metadata !120}
!120 = metadata !{i32 786478, i32 0, metadata !121, metadata !"memset", metadata !"memset", metadata !"", metadata !121, i32 12, metadata !122, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!121 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!122 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !123, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!123 = metadata !{metadata !84, metadata !84, metadata !29, metadata !124}
!124 = metadata !{i32 786454, null, metadata !"size_t", metadata !121, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!125 = metadata !{metadata !126}
!126 = metadata !{metadata !127, metadata !128, metadata !129, metadata !130}
!127 = metadata !{i32 786689, metadata !120, metadata !"dst", metadata !121, i32 16777228, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!128 = metadata !{i32 786689, metadata !120, metadata !"s", metadata !121, i32 33554444, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!129 = metadata !{i32 786689, metadata !120, metadata !"count", metadata !121, i32 50331660, metadata !124, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!130 = metadata !{i32 786688, metadata !131, metadata !"a", metadata !121, i32 13, metadata !132, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!131 = metadata !{i32 786443, metadata !120, i32 12, i32 0, metadata !121, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!132 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !133} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!133 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !97} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!134 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!135 = metadata !{metadata !136}
!136 = metadata !{metadata !137, metadata !212, metadata !218}
!137 = metadata !{i32 786436, null, metadata !"cudaError", metadata !138, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !139, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!138 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!139 = metadata !{metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !149, metadata !150, metadata !151, metadata !152, metadata !153, metadata !154, metadata !1
!140 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!141 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!142 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!143 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!144 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!145 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!146 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!147 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!148 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!149 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!150 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!151 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!152 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!153 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!154 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!155 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!156 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!157 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!158 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!159 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!160 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!161 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!162 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!163 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!164 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!165 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!166 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!167 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!168 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!169 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!170 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!171 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!172 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!173 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!174 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!175 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!176 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!177 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!178 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!179 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!180 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!181 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!182 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!183 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!184 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!185 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!186 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!187 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!188 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!189 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!190 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!191 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!192 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!193 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!194 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!195 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!196 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!197 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!198 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!199 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!200 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!201 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!202 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!203 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!204 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!205 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!206 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!207 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!208 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!209 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!210 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!211 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!212 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !138, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !213, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!213 = metadata !{metadata !214, metadata !215, metadata !216, metadata !217}
!214 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!215 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!216 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!217 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!218 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !138, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!219 = metadata !{metadata !220}
!220 = metadata !{metadata !221, metadata !250, metadata !256, metadata !262, metadata !266, metadata !274, metadata !282, metadata !290, metadata !298, metadata !305, metadata !313, metadata !317, metadata !324, metadata !338, metadata !348, metadata !3
!221 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !222, i32 24, metadata !223, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!222 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!223 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !224, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!224 = metadata !{metadata !225, metadata !226, metadata !234, metadata !241, metadata !242}
!225 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !222, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !137} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!226 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !227} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!227 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !138, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !228, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!228 = metadata !{metadata !229, metadata !230, metadata !231, metadata !232, metadata !233}
!229 = metadata !{i32 786445, metadata !227, metadata !"x", metadata !138, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !29} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!230 = metadata !{i32 786445, metadata !227, metadata !"y", metadata !138, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !29} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!231 = metadata !{i32 786445, metadata !227, metadata !"z", metadata !138, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !29} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!232 = metadata !{i32 786445, metadata !227, metadata !"w", metadata !138, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !29} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!233 = metadata !{i32 786445, metadata !227, metadata !"f", metadata !138, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !212} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!234 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !235} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!235 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !138, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !236, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!236 = metadata !{metadata !237, metadata !239, metadata !240}
!237 = metadata !{i32 786445, metadata !235, metadata !"width", metadata !138, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !238} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!238 = metadata !{i32 786454, null, metadata !"size_t", metadata !138, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!239 = metadata !{i32 786445, metadata !235, metadata !"height", metadata !138, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !238} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!240 = metadata !{i32 786445, metadata !235, metadata !"depth", metadata !138, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !238} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!241 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!242 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !243} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!243 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !138, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!244 = metadata !{metadata !245}
!245 = metadata !{metadata !246, metadata !247, metadata !248, metadata !249}
!246 = metadata !{i32 786689, metadata !221, metadata !"desc", metadata !222, i32 16777240, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!247 = metadata !{i32 786689, metadata !221, metadata !"extent", metadata !222, i32 33554456, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!248 = metadata !{i32 786689, metadata !221, metadata !"flags", metadata !222, i32 50331673, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!249 = metadata !{i32 786689, metadata !221, metadata !"array", metadata !222, i32 67108889, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!250 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !222, i32 29, metadata !251, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !253, 
!251 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !252, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!252 = metadata !{metadata !225, metadata !84}
!253 = metadata !{metadata !254}
!254 = metadata !{metadata !255}
!255 = metadata !{i32 786689, metadata !250, metadata !"devPtr", metadata !222, i32 16777245, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!256 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !222, i32 34, metadata !257, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!257 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !258, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!258 = metadata !{metadata !225, metadata !242}
!259 = metadata !{metadata !260}
!260 = metadata !{metadata !261}
!261 = metadata !{i32 786689, metadata !256, metadata !"array", metadata !222, i32 16777250, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!262 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !222, i32 39, metadata !251, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!263 = metadata !{metadata !264}
!264 = metadata !{metadata !265}
!265 = metadata !{i32 786689, metadata !262, metadata !"ptr", metadata !222, i32 16777255, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!266 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !222, i32 44, metadata !267, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!267 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !268, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!268 = metadata !{metadata !225, metadata !269, metadata !99}
!269 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !84} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!270 = metadata !{metadata !271}
!271 = metadata !{metadata !272, metadata !273}
!272 = metadata !{i32 786689, metadata !266, metadata !"devPtr", metadata !222, i32 16777260, metadata !269, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!273 = metadata !{i32 786689, metadata !266, metadata !"symbol", metadata !222, i32 33554476, metadata !99, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!274 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !222, i32 48, metadata !275, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!275 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !276, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!276 = metadata !{metadata !225, metadata !277, metadata !99}
!277 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !238} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!278 = metadata !{metadata !279}
!279 = metadata !{metadata !280, metadata !281}
!280 = metadata !{i32 786689, metadata !274, metadata !"size", metadata !222, i32 16777264, metadata !277, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!281 = metadata !{i32 786689, metadata !274, metadata !"symbol", metadata !222, i32 33554480, metadata !99, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!282 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !222, i32 52, metadata !283, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!283 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !284, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!284 = metadata !{metadata !225, metadata !269, metadata !238, metadata !41}
!285 = metadata !{metadata !286}
!286 = metadata !{metadata !287, metadata !288, metadata !289}
!287 = metadata !{i32 786689, metadata !282, metadata !"pHost", metadata !222, i32 16777268, metadata !269, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!288 = metadata !{i32 786689, metadata !282, metadata !"size", metadata !222, i32 33554484, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!289 = metadata !{i32 786689, metadata !282, metadata !"flags", metadata !222, i32 50331700, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!290 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !222, i32 56, metadata !291, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!291 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !292, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!292 = metadata !{metadata !225, metadata !269, metadata !84, metadata !41}
!293 = metadata !{metadata !294}
!294 = metadata !{metadata !295, metadata !296, metadata !297}
!295 = metadata !{i32 786689, metadata !290, metadata !"pDevice", metadata !222, i32 16777272, metadata !269, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!296 = metadata !{i32 786689, metadata !290, metadata !"pHost", metadata !222, i32 33554488, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!297 = metadata !{i32 786689, metadata !290, metadata !"flags", metadata !222, i32 50331704, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!298 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !222, i32 60, metadata !299, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!299 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !300, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!300 = metadata !{metadata !225, metadata !241, metadata !84}
!301 = metadata !{metadata !302}
!302 = metadata !{metadata !303, metadata !304}
!303 = metadata !{i32 786689, metadata !298, metadata !"pFlags", metadata !222, i32 16777276, metadata !241, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!304 = metadata !{i32 786689, metadata !298, metadata !"pHost", metadata !222, i32 33554492, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!305 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !222, i32 64, metadata !306, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!306 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !307, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!307 = metadata !{metadata !225, metadata !84, metadata !238, metadata !41}
!308 = metadata !{metadata !309}
!309 = metadata !{metadata !310, metadata !311, metadata !312}
!310 = metadata !{i32 786689, metadata !305, metadata !"ptr", metadata !222, i32 16777280, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!311 = metadata !{i32 786689, metadata !305, metadata !"size", metadata !222, i32 33554496, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!312 = metadata !{i32 786689, metadata !305, metadata !"flags", metadata !222, i32 50331712, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!313 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !222, i32 68, metadata !251, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!314 = metadata !{metadata !315}
!315 = metadata !{metadata !316}
!316 = metadata !{i32 786689, metadata !313, metadata !"ptr", metadata !222, i32 16777284, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!317 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !222, i32 72, metadata !318, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!318 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !319, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!319 = metadata !{metadata !225, metadata !269, metadata !238}
!320 = metadata !{metadata !321}
!321 = metadata !{metadata !322, metadata !323}
!322 = metadata !{i32 786689, metadata !317, metadata !"devPtr", metadata !222, i32 16777288, metadata !269, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!323 = metadata !{i32 786689, metadata !317, metadata !"size", metadata !222, i32 33554504, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!324 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !222, i32 80, metadata !325, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!325 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !326, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!326 = metadata !{metadata !225, metadata !327, metadata !235}
!327 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !328} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!328 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !138, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !329, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!329 = metadata !{metadata !330, metadata !331, metadata !332, metadata !333}
!330 = metadata !{i32 786445, metadata !328, metadata !"ptr", metadata !138, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !84} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!331 = metadata !{i32 786445, metadata !328, metadata !"pitch", metadata !138, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !238} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!332 = metadata !{i32 786445, metadata !328, metadata !"xsize", metadata !138, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !238} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!333 = metadata !{i32 786445, metadata !328, metadata !"ysize", metadata !138, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !238} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!334 = metadata !{metadata !335}
!335 = metadata !{metadata !336, metadata !337}
!336 = metadata !{i32 786689, metadata !324, metadata !"pitchedDevPtr", metadata !222, i32 16777296, metadata !327, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!337 = metadata !{i32 786689, metadata !324, metadata !"extent", metadata !222, i32 33554512, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!338 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !222, i32 84, metadata !339, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!339 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !340, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!340 = metadata !{metadata !225, metadata !341, metadata !226, metadata !235, metadata !41}
!341 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !242} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!342 = metadata !{metadata !343}
!343 = metadata !{metadata !344, metadata !345, metadata !346, metadata !347}
!344 = metadata !{i32 786689, metadata !338, metadata !"array", metadata !222, i32 16777300, metadata !341, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!345 = metadata !{i32 786689, metadata !338, metadata !"desc", metadata !222, i32 33554516, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!346 = metadata !{i32 786689, metadata !338, metadata !"extent", metadata !222, i32 50331733, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!347 = metadata !{i32 786689, metadata !338, metadata !"flags", metadata !222, i32 67108949, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!348 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !222, i32 89, metadata !349, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!349 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !350, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!350 = metadata !{metadata !225, metadata !341, metadata !226, metadata !238, metadata !238, metadata !41}
!351 = metadata !{metadata !352}
!352 = metadata !{metadata !353, metadata !354, metadata !355, metadata !356, metadata !357}
!353 = metadata !{i32 786689, metadata !348, metadata !"array", metadata !222, i32 16777305, metadata !341, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!354 = metadata !{i32 786689, metadata !348, metadata !"desc", metadata !222, i32 33554521, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!355 = metadata !{i32 786689, metadata !348, metadata !"width", metadata !222, i32 50331738, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!356 = metadata !{i32 786689, metadata !348, metadata !"height", metadata !222, i32 67108954, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!357 = metadata !{i32 786689, metadata !348, metadata !"flags", metadata !222, i32 83886170, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!358 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !222, i32 94, metadata !318, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!359 = metadata !{metadata !360}
!360 = metadata !{metadata !361, metadata !362}
!361 = metadata !{i32 786689, metadata !358, metadata !"ptr", metadata !222, i32 16777310, metadata !269, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!362 = metadata !{i32 786689, metadata !358, metadata !"size", metadata !222, i32 33554526, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!363 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !222, i32 102, metadata !364, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!364 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !365, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!365 = metadata !{metadata !225, metadata !269, metadata !277, metadata !238, metadata !238}
!366 = metadata !{metadata !367}
!367 = metadata !{metadata !368, metadata !369, metadata !370, metadata !371}
!368 = metadata !{i32 786689, metadata !363, metadata !"devPtr", metadata !222, i32 16777318, metadata !269, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!369 = metadata !{i32 786689, metadata !363, metadata !"pitch", metadata !222, i32 33554534, metadata !277, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!370 = metadata !{i32 786689, metadata !363, metadata !"width", metadata !222, i32 50331750, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!371 = metadata !{i32 786689, metadata !363, metadata !"height", metadata !222, i32 67108966, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!372 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !222, i32 106, metadata !373, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!373 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !374, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!374 = metadata !{metadata !225, metadata !84, metadata !85, metadata !238, metadata !218}
!375 = metadata !{metadata !376}
!376 = metadata !{metadata !377, metadata !378, metadata !379, metadata !380}
!377 = metadata !{i32 786689, metadata !372, metadata !"dst", metadata !222, i32 16777322, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!378 = metadata !{i32 786689, metadata !372, metadata !"src", metadata !222, i32 33554538, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!379 = metadata !{i32 786689, metadata !372, metadata !"count", metadata !222, i32 50331754, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!380 = metadata !{i32 786689, metadata !372, metadata !"kind", metadata !222, i32 67108970, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!381 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !222, i32 111, metadata !382, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!382 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !383, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!383 = metadata !{metadata !225, metadata !84, metadata !238, metadata !85, metadata !238, metadata !238, metadata !238, metadata !218}
!384 = metadata !{metadata !385}
!385 = metadata !{metadata !386, metadata !387, metadata !388, metadata !389, metadata !390, metadata !391, metadata !392}
!386 = metadata !{i32 786689, metadata !381, metadata !"dst", metadata !222, i32 16777327, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!387 = metadata !{i32 786689, metadata !381, metadata !"dpitch", metadata !222, i32 33554543, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!388 = metadata !{i32 786689, metadata !381, metadata !"src", metadata !222, i32 50331759, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!389 = metadata !{i32 786689, metadata !381, metadata !"spitch", metadata !222, i32 67108975, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!390 = metadata !{i32 786689, metadata !381, metadata !"width", metadata !222, i32 83886192, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!391 = metadata !{i32 786689, metadata !381, metadata !"height", metadata !222, i32 100663408, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!392 = metadata !{i32 786689, metadata !381, metadata !"kind", metadata !222, i32 117440624, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!393 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !222, i32 116, metadata !394, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!394 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !395, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!395 = metadata !{metadata !225, metadata !242, metadata !238, metadata !238, metadata !242, metadata !238, metadata !238, metadata !238, metadata !238, metadata !218}
!396 = metadata !{metadata !397}
!397 = metadata !{metadata !398, metadata !399, metadata !400, metadata !401, metadata !402, metadata !403, metadata !404, metadata !405, metadata !406}
!398 = metadata !{i32 786689, metadata !393, metadata !"dst", metadata !222, i32 16777332, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!399 = metadata !{i32 786689, metadata !393, metadata !"wOffsetDst", metadata !222, i32 33554548, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!400 = metadata !{i32 786689, metadata !393, metadata !"hOffsetDst", metadata !222, i32 50331764, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!401 = metadata !{i32 786689, metadata !393, metadata !"src", metadata !222, i32 67108981, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!402 = metadata !{i32 786689, metadata !393, metadata !"wOffsetSrc", metadata !222, i32 83886197, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!403 = metadata !{i32 786689, metadata !393, metadata !"hOffsetSrc", metadata !222, i32 100663413, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!404 = metadata !{i32 786689, metadata !393, metadata !"width", metadata !222, i32 117440630, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!405 = metadata !{i32 786689, metadata !393, metadata !"height", metadata !222, i32 134217846, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!406 = metadata !{i32 786689, metadata !393, metadata !"kind", metadata !222, i32 150995062, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!407 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !222, i32 122, metadata !408, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!408 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !409, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!409 = metadata !{metadata !225, metadata !84, metadata !238, metadata !85, metadata !238, metadata !238, metadata !238, metadata !218, metadata !410}
!410 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !222, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !411} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!411 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !412} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!412 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !138, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!413 = metadata !{metadata !414}
!414 = metadata !{metadata !415, metadata !416, metadata !417, metadata !418, metadata !419, metadata !420, metadata !421, metadata !422}
!415 = metadata !{i32 786689, metadata !407, metadata !"dst", metadata !222, i32 16777338, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!416 = metadata !{i32 786689, metadata !407, metadata !"dpitch", metadata !222, i32 33554554, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!417 = metadata !{i32 786689, metadata !407, metadata !"src", metadata !222, i32 50331770, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!418 = metadata !{i32 786689, metadata !407, metadata !"spitch", metadata !222, i32 67108986, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!419 = metadata !{i32 786689, metadata !407, metadata !"width", metadata !222, i32 83886203, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!420 = metadata !{i32 786689, metadata !407, metadata !"height", metadata !222, i32 100663419, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!421 = metadata !{i32 786689, metadata !407, metadata !"kind", metadata !222, i32 117440635, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!422 = metadata !{i32 786689, metadata !407, metadata !"stream", metadata !222, i32 134217852, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!423 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !222, i32 128, metadata !424, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!424 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !425, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!425 = metadata !{metadata !225, metadata !84, metadata !238, metadata !242, metadata !238, metadata !238, metadata !238, metadata !238, metadata !218}
!426 = metadata !{metadata !427}
!427 = metadata !{metadata !428, metadata !429, metadata !430, metadata !431, metadata !432, metadata !433, metadata !434, metadata !435}
!428 = metadata !{i32 786689, metadata !423, metadata !"dst", metadata !222, i32 16777344, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!429 = metadata !{i32 786689, metadata !423, metadata !"dpitch", metadata !222, i32 33554560, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!430 = metadata !{i32 786689, metadata !423, metadata !"src", metadata !222, i32 50331776, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!431 = metadata !{i32 786689, metadata !423, metadata !"wOffset", metadata !222, i32 67108993, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!432 = metadata !{i32 786689, metadata !423, metadata !"hOffset", metadata !222, i32 83886209, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!433 = metadata !{i32 786689, metadata !423, metadata !"width", metadata !222, i32 100663425, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!434 = metadata !{i32 786689, metadata !423, metadata !"height", metadata !222, i32 117440641, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!435 = metadata !{i32 786689, metadata !423, metadata !"kind", metadata !222, i32 134217858, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!436 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !222, i32 134, metadata !437, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!437 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !438, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!438 = metadata !{metadata !225, metadata !84, metadata !238, metadata !242, metadata !238, metadata !238, metadata !238, metadata !238, metadata !218, metadata !410}
!439 = metadata !{metadata !440}
!440 = metadata !{metadata !441, metadata !442, metadata !443, metadata !444, metadata !445, metadata !446, metadata !447, metadata !448, metadata !449}
!441 = metadata !{i32 786689, metadata !436, metadata !"dst", metadata !222, i32 16777350, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!442 = metadata !{i32 786689, metadata !436, metadata !"dpitch", metadata !222, i32 33554566, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!443 = metadata !{i32 786689, metadata !436, metadata !"src", metadata !222, i32 50331782, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!444 = metadata !{i32 786689, metadata !436, metadata !"wOffset", metadata !222, i32 67108999, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!445 = metadata !{i32 786689, metadata !436, metadata !"hOffset", metadata !222, i32 83886215, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!446 = metadata !{i32 786689, metadata !436, metadata !"width", metadata !222, i32 100663431, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!447 = metadata !{i32 786689, metadata !436, metadata !"height", metadata !222, i32 117440647, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!448 = metadata !{i32 786689, metadata !436, metadata !"kind", metadata !222, i32 134217864, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!449 = metadata !{i32 786689, metadata !436, metadata !"stream", metadata !222, i32 150995080, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!450 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !222, i32 140, metadata !451, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!451 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !452, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!452 = metadata !{metadata !225, metadata !242, metadata !238, metadata !238, metadata !85, metadata !238, metadata !238, metadata !238, metadata !218}
!453 = metadata !{metadata !454}
!454 = metadata !{metadata !455, metadata !456, metadata !457, metadata !458, metadata !459, metadata !460, metadata !461, metadata !462}
!455 = metadata !{i32 786689, metadata !450, metadata !"dst", metadata !222, i32 16777356, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!456 = metadata !{i32 786689, metadata !450, metadata !"wOffset", metadata !222, i32 33554572, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!457 = metadata !{i32 786689, metadata !450, metadata !"hOffset", metadata !222, i32 50331788, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!458 = metadata !{i32 786689, metadata !450, metadata !"src", metadata !222, i32 67109005, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!459 = metadata !{i32 786689, metadata !450, metadata !"spitch", metadata !222, i32 83886221, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!460 = metadata !{i32 786689, metadata !450, metadata !"width", metadata !222, i32 100663437, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!461 = metadata !{i32 786689, metadata !450, metadata !"height", metadata !222, i32 117440653, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!462 = metadata !{i32 786689, metadata !450, metadata !"kind", metadata !222, i32 134217870, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!463 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !222, i32 146, metadata !464, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!464 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !465, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!465 = metadata !{metadata !225, metadata !242, metadata !238, metadata !238, metadata !85, metadata !238, metadata !238, metadata !238, metadata !218, metadata !410}
!466 = metadata !{metadata !467}
!467 = metadata !{metadata !468, metadata !469, metadata !470, metadata !471, metadata !472, metadata !473, metadata !474, metadata !475, metadata !476}
!468 = metadata !{i32 786689, metadata !463, metadata !"dst", metadata !222, i32 16777362, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!469 = metadata !{i32 786689, metadata !463, metadata !"wOffset", metadata !222, i32 33554578, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!470 = metadata !{i32 786689, metadata !463, metadata !"hOffset", metadata !222, i32 50331794, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!471 = metadata !{i32 786689, metadata !463, metadata !"src", metadata !222, i32 67109011, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!472 = metadata !{i32 786689, metadata !463, metadata !"spitch", metadata !222, i32 83886227, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!473 = metadata !{i32 786689, metadata !463, metadata !"width", metadata !222, i32 100663443, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!474 = metadata !{i32 786689, metadata !463, metadata !"height", metadata !222, i32 117440659, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!475 = metadata !{i32 786689, metadata !463, metadata !"kind", metadata !222, i32 134217876, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!476 = metadata !{i32 786689, metadata !463, metadata !"stream", metadata !222, i32 150995092, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!477 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !222, i32 152, metadata !478, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!478 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !479, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!479 = metadata !{metadata !225, metadata !480}
!480 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !481} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!481 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !482} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!482 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !138, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !483, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!483 = metadata !{metadata !484, metadata !486, metadata !492, metadata !493, metadata !494, metadata !495, metadata !496, metadata !497}
!484 = metadata !{i32 786445, metadata !482, metadata !"srcArray", metadata !138, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !485} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!485 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !138, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !242} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!486 = metadata !{i32 786445, metadata !482, metadata !"srcPos", metadata !138, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !487} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!487 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !138, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !488, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!488 = metadata !{metadata !489, metadata !490, metadata !491}
!489 = metadata !{i32 786445, metadata !487, metadata !"x", metadata !138, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !238} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!490 = metadata !{i32 786445, metadata !487, metadata !"y", metadata !138, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !238} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!491 = metadata !{i32 786445, metadata !487, metadata !"z", metadata !138, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !238} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!492 = metadata !{i32 786445, metadata !482, metadata !"srcPtr", metadata !138, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !328} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!493 = metadata !{i32 786445, metadata !482, metadata !"dstArray", metadata !138, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !485} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!494 = metadata !{i32 786445, metadata !482, metadata !"dstPos", metadata !138, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !487} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!495 = metadata !{i32 786445, metadata !482, metadata !"dstPtr", metadata !138, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !328} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!496 = metadata !{i32 786445, metadata !482, metadata !"extent", metadata !138, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !235} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!497 = metadata !{i32 786445, metadata !482, metadata !"kind", metadata !138, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !218} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!498 = metadata !{metadata !499}
!499 = metadata !{metadata !500}
!500 = metadata !{i32 786689, metadata !477, metadata !"p", metadata !222, i32 16777368, metadata !480, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!501 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !222, i32 156, metadata !502, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!502 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !503, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!503 = metadata !{metadata !225, metadata !480, metadata !410}
!504 = metadata !{metadata !505}
!505 = metadata !{metadata !506, metadata !507}
!506 = metadata !{i32 786689, metadata !501, metadata !"p", metadata !222, i32 16777372, metadata !480, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!507 = metadata !{i32 786689, metadata !501, metadata !"stream", metadata !222, i32 33554588, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!508 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !222, i32 160, metadata !509, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!509 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !510, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!510 = metadata !{metadata !225, metadata !511}
!511 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !512} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!512 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !513} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!513 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !138, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !514, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!514 = metadata !{metadata !515, metadata !516, metadata !517, metadata !518, metadata !519, metadata !520, metadata !521, metadata !522, metadata !523}
!515 = metadata !{i32 786445, metadata !513, metadata !"srcArray", metadata !138, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !485} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!516 = metadata !{i32 786445, metadata !513, metadata !"srcPos", metadata !138, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !487} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!517 = metadata !{i32 786445, metadata !513, metadata !"srcPtr", metadata !138, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !328} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!518 = metadata !{i32 786445, metadata !513, metadata !"srcDevice", metadata !138, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !29} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!519 = metadata !{i32 786445, metadata !513, metadata !"dstArray", metadata !138, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !485} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!520 = metadata !{i32 786445, metadata !513, metadata !"dstPos", metadata !138, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !487} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!521 = metadata !{i32 786445, metadata !513, metadata !"dstPtr", metadata !138, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !328} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!522 = metadata !{i32 786445, metadata !513, metadata !"dstDevice", metadata !138, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !29} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!523 = metadata !{i32 786445, metadata !513, metadata !"extent", metadata !138, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !235} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!524 = metadata !{metadata !525}
!525 = metadata !{metadata !526}
!526 = metadata !{i32 786689, metadata !508, metadata !"p", metadata !222, i32 16777376, metadata !511, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!527 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !222, i32 164, metadata !528, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!528 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !529, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!529 = metadata !{metadata !225, metadata !511, metadata !410}
!530 = metadata !{metadata !531}
!531 = metadata !{metadata !532, metadata !533}
!532 = metadata !{i32 786689, metadata !527, metadata !"p", metadata !222, i32 16777380, metadata !511, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!533 = metadata !{i32 786689, metadata !527, metadata !"stream", metadata !222, i32 33554596, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!534 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !222, i32 168, metadata !535, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!535 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !536, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!536 = metadata !{metadata !225, metadata !242, metadata !238, metadata !238, metadata !242, metadata !238, metadata !238, metadata !238, metadata !218}
!537 = metadata !{metadata !538}
!538 = metadata !{metadata !539, metadata !540, metadata !541, metadata !542, metadata !543, metadata !544, metadata !545, metadata !546}
!539 = metadata !{i32 786689, metadata !534, metadata !"dst", metadata !222, i32 16777384, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!540 = metadata !{i32 786689, metadata !534, metadata !"wOffsetDst", metadata !222, i32 33554600, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!541 = metadata !{i32 786689, metadata !534, metadata !"hOffsetDst", metadata !222, i32 50331816, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!542 = metadata !{i32 786689, metadata !534, metadata !"src", metadata !222, i32 67109033, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!543 = metadata !{i32 786689, metadata !534, metadata !"wOffsetSrc", metadata !222, i32 83886249, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!544 = metadata !{i32 786689, metadata !534, metadata !"hOffsetSrc", metadata !222, i32 100663465, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!545 = metadata !{i32 786689, metadata !534, metadata !"count", metadata !222, i32 117440682, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!546 = metadata !{i32 786689, metadata !534, metadata !"kind", metadata !222, i32 134217898, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!547 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !222, i32 174, metadata !548, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!548 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !549, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!549 = metadata !{metadata !225, metadata !84, metadata !85, metadata !238, metadata !218, metadata !410}
!550 = metadata !{metadata !551}
!551 = metadata !{metadata !552, metadata !553, metadata !554, metadata !555, metadata !556}
!552 = metadata !{i32 786689, metadata !547, metadata !"dst", metadata !222, i32 16777390, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!553 = metadata !{i32 786689, metadata !547, metadata !"src", metadata !222, i32 33554606, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!554 = metadata !{i32 786689, metadata !547, metadata !"count", metadata !222, i32 50331822, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!555 = metadata !{i32 786689, metadata !547, metadata !"kind", metadata !222, i32 67109039, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!556 = metadata !{i32 786689, metadata !547, metadata !"stream", metadata !222, i32 83886255, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!557 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !222, i32 179, metadata !558, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!558 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !559, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!559 = metadata !{metadata !225, metadata !84, metadata !242, metadata !238, metadata !238, metadata !238, metadata !218}
!560 = metadata !{metadata !561}
!561 = metadata !{metadata !562, metadata !563, metadata !564, metadata !565, metadata !566, metadata !567}
!562 = metadata !{i32 786689, metadata !557, metadata !"dst", metadata !222, i32 16777395, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!563 = metadata !{i32 786689, metadata !557, metadata !"src", metadata !222, i32 33554611, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!564 = metadata !{i32 786689, metadata !557, metadata !"wOffset", metadata !222, i32 50331827, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!565 = metadata !{i32 786689, metadata !557, metadata !"hOffset", metadata !222, i32 67109044, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!566 = metadata !{i32 786689, metadata !557, metadata !"count", metadata !222, i32 83886260, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!567 = metadata !{i32 786689, metadata !557, metadata !"kind", metadata !222, i32 100663476, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!568 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !222, i32 184, metadata !569, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!569 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !570, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!570 = metadata !{metadata !225, metadata !84, metadata !242, metadata !238, metadata !238, metadata !238, metadata !218, metadata !410}
!571 = metadata !{metadata !572}
!572 = metadata !{metadata !573, metadata !574, metadata !575, metadata !576, metadata !577, metadata !578, metadata !579}
!573 = metadata !{i32 786689, metadata !568, metadata !"dst", metadata !222, i32 16777400, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!574 = metadata !{i32 786689, metadata !568, metadata !"src", metadata !222, i32 33554616, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!575 = metadata !{i32 786689, metadata !568, metadata !"wOffset", metadata !222, i32 50331832, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!576 = metadata !{i32 786689, metadata !568, metadata !"hOffset", metadata !222, i32 67109049, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!577 = metadata !{i32 786689, metadata !568, metadata !"count", metadata !222, i32 83886265, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!578 = metadata !{i32 786689, metadata !568, metadata !"kind", metadata !222, i32 100663481, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!579 = metadata !{i32 786689, metadata !568, metadata !"stream", metadata !222, i32 117440698, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!580 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !222, i32 190, metadata !581, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!581 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !582, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!582 = metadata !{metadata !225, metadata !84, metadata !99, metadata !238, metadata !238, metadata !218}
!583 = metadata !{metadata !584}
!584 = metadata !{metadata !585, metadata !586, metadata !587, metadata !588, metadata !589}
!585 = metadata !{i32 786689, metadata !580, metadata !"dst", metadata !222, i32 16777406, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!586 = metadata !{i32 786689, metadata !580, metadata !"symbol", metadata !222, i32 33554622, metadata !99, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!587 = metadata !{i32 786689, metadata !580, metadata !"count", metadata !222, i32 50331838, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!588 = metadata !{i32 786689, metadata !580, metadata !"offset", metadata !222, i32 67109055, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!589 = metadata !{i32 786689, metadata !580, metadata !"kind", metadata !222, i32 83886271, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!590 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !222, i32 195, metadata !591, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!591 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !592, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!592 = metadata !{metadata !225, metadata !84, metadata !99, metadata !238, metadata !238, metadata !218, metadata !410}
!593 = metadata !{metadata !594}
!594 = metadata !{metadata !595, metadata !596, metadata !597, metadata !598, metadata !599, metadata !600}
!595 = metadata !{i32 786689, metadata !590, metadata !"dst", metadata !222, i32 16777411, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!596 = metadata !{i32 786689, metadata !590, metadata !"symbol", metadata !222, i32 33554627, metadata !99, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!597 = metadata !{i32 786689, metadata !590, metadata !"count", metadata !222, i32 50331843, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!598 = metadata !{i32 786689, metadata !590, metadata !"offset", metadata !222, i32 67109060, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!599 = metadata !{i32 786689, metadata !590, metadata !"kind", metadata !222, i32 83886276, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!600 = metadata !{i32 786689, metadata !590, metadata !"stream", metadata !222, i32 100663493, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!601 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !222, i32 201, metadata !602, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!602 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !603, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!603 = metadata !{metadata !225, metadata !84, metadata !29, metadata !85, metadata !29, metadata !238}
!604 = metadata !{metadata !605}
!605 = metadata !{metadata !606, metadata !607, metadata !608, metadata !609, metadata !610}
!606 = metadata !{i32 786689, metadata !601, metadata !"dst", metadata !222, i32 16777417, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!607 = metadata !{i32 786689, metadata !601, metadata !"dstDevice", metadata !222, i32 33554633, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!608 = metadata !{i32 786689, metadata !601, metadata !"src", metadata !222, i32 50331849, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!609 = metadata !{i32 786689, metadata !601, metadata !"srcDevice", metadata !222, i32 67109065, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!610 = metadata !{i32 786689, metadata !601, metadata !"count", metadata !222, i32 83886281, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!611 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !222, i32 206, metadata !612, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!612 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !613, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!613 = metadata !{metadata !225, metadata !84, metadata !29, metadata !85, metadata !29, metadata !238, metadata !410}
!614 = metadata !{metadata !615}
!615 = metadata !{metadata !616, metadata !617, metadata !618, metadata !619, metadata !620, metadata !621}
!616 = metadata !{i32 786689, metadata !611, metadata !"dst", metadata !222, i32 16777422, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!617 = metadata !{i32 786689, metadata !611, metadata !"dstDevice", metadata !222, i32 33554638, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!618 = metadata !{i32 786689, metadata !611, metadata !"src", metadata !222, i32 50331854, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!619 = metadata !{i32 786689, metadata !611, metadata !"srcDevice", metadata !222, i32 67109070, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!620 = metadata !{i32 786689, metadata !611, metadata !"count", metadata !222, i32 83886287, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!621 = metadata !{i32 786689, metadata !611, metadata !"stream", metadata !222, i32 100663503, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!622 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !222, i32 212, metadata !623, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!623 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !624, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!624 = metadata !{metadata !225, metadata !242, metadata !238, metadata !238, metadata !85, metadata !238, metadata !218}
!625 = metadata !{metadata !626}
!626 = metadata !{metadata !627, metadata !628, metadata !629, metadata !630, metadata !631, metadata !632}
!627 = metadata !{i32 786689, metadata !622, metadata !"dst", metadata !222, i32 16777428, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!628 = metadata !{i32 786689, metadata !622, metadata !"wOffset", metadata !222, i32 33554644, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!629 = metadata !{i32 786689, metadata !622, metadata !"hOffset", metadata !222, i32 50331860, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!630 = metadata !{i32 786689, metadata !622, metadata !"src", metadata !222, i32 67109077, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!631 = metadata !{i32 786689, metadata !622, metadata !"count", metadata !222, i32 83886293, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!632 = metadata !{i32 786689, metadata !622, metadata !"kind", metadata !222, i32 100663509, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!633 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !222, i32 217, metadata !634, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!634 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !635, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!635 = metadata !{metadata !225, metadata !242, metadata !238, metadata !238, metadata !85, metadata !238, metadata !218, metadata !410}
!636 = metadata !{metadata !637}
!637 = metadata !{metadata !638, metadata !639, metadata !640, metadata !641, metadata !642, metadata !643, metadata !644}
!638 = metadata !{i32 786689, metadata !633, metadata !"dst", metadata !222, i32 16777433, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!639 = metadata !{i32 786689, metadata !633, metadata !"wOffset", metadata !222, i32 33554649, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!640 = metadata !{i32 786689, metadata !633, metadata !"hOffset", metadata !222, i32 50331865, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!641 = metadata !{i32 786689, metadata !633, metadata !"src", metadata !222, i32 67109082, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!642 = metadata !{i32 786689, metadata !633, metadata !"count", metadata !222, i32 83886298, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!643 = metadata !{i32 786689, metadata !633, metadata !"kind", metadata !222, i32 100663514, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!644 = metadata !{i32 786689, metadata !633, metadata !"stream", metadata !222, i32 117440731, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!645 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !222, i32 223, metadata !646, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!646 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !647, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!647 = metadata !{metadata !225, metadata !96, metadata !85, metadata !238, metadata !238, metadata !218}
!648 = metadata !{metadata !649}
!649 = metadata !{metadata !650, metadata !651, metadata !652, metadata !653, metadata !654}
!650 = metadata !{i32 786689, metadata !645, metadata !"symbol", metadata !222, i32 16777439, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!651 = metadata !{i32 786689, metadata !645, metadata !"src", metadata !222, i32 33554655, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!652 = metadata !{i32 786689, metadata !645, metadata !"count", metadata !222, i32 50331871, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!653 = metadata !{i32 786689, metadata !645, metadata !"offset", metadata !222, i32 67109088, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!654 = metadata !{i32 786689, metadata !645, metadata !"kind", metadata !222, i32 83886304, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!655 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !222, i32 229, metadata !656, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!656 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !657, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!657 = metadata !{metadata !225, metadata !99, metadata !85, metadata !238, metadata !238, metadata !218, metadata !410}
!658 = metadata !{metadata !659}
!659 = metadata !{metadata !660, metadata !661, metadata !662, metadata !663, metadata !664, metadata !665}
!660 = metadata !{i32 786689, metadata !655, metadata !"symbol", metadata !222, i32 16777445, metadata !99, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!661 = metadata !{i32 786689, metadata !655, metadata !"src", metadata !222, i32 33554661, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!662 = metadata !{i32 786689, metadata !655, metadata !"count", metadata !222, i32 50331877, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!663 = metadata !{i32 786689, metadata !655, metadata !"offset", metadata !222, i32 67109093, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!664 = metadata !{i32 786689, metadata !655, metadata !"kind", metadata !222, i32 83886310, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!665 = metadata !{i32 786689, metadata !655, metadata !"stream", metadata !222, i32 100663526, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!666 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !222, i32 234, metadata !667, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!667 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !668, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!668 = metadata !{metadata !225, metadata !277, metadata !277}
!669 = metadata !{metadata !670}
!670 = metadata !{metadata !671, metadata !672}
!671 = metadata !{i32 786689, metadata !666, metadata !"free", metadata !222, i32 16777450, metadata !277, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!672 = metadata !{i32 786689, metadata !666, metadata !"total", metadata !222, i32 33554666, metadata !277, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!673 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !222, i32 238, metadata !674, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!674 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !675, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!675 = metadata !{metadata !225, metadata !84, metadata !29, metadata !238}
!676 = metadata !{metadata !677}
!677 = metadata !{metadata !678, metadata !679, metadata !680}
!678 = metadata !{i32 786689, metadata !673, metadata !"devPtr", metadata !222, i32 16777454, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!679 = metadata !{i32 786689, metadata !673, metadata !"value", metadata !222, i32 33554670, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!680 = metadata !{i32 786689, metadata !673, metadata !"count", metadata !222, i32 50331886, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!681 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !222, i32 243, metadata !682, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!682 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !683, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!683 = metadata !{metadata !225, metadata !84, metadata !238, metadata !29, metadata !238, metadata !238}
!684 = metadata !{metadata !685}
!685 = metadata !{metadata !686, metadata !687, metadata !688, metadata !689, metadata !690}
!686 = metadata !{i32 786689, metadata !681, metadata !"devPtr", metadata !222, i32 16777459, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!687 = metadata !{i32 786689, metadata !681, metadata !"pitch", metadata !222, i32 33554675, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!688 = metadata !{i32 786689, metadata !681, metadata !"value", metadata !222, i32 50331891, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!689 = metadata !{i32 786689, metadata !681, metadata !"width", metadata !222, i32 67109108, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!690 = metadata !{i32 786689, metadata !681, metadata !"height", metadata !222, i32 83886324, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!691 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !222, i32 248, metadata !692, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!692 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !693, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!693 = metadata !{metadata !225, metadata !84, metadata !238, metadata !29, metadata !238, metadata !238, metadata !410}
!694 = metadata !{metadata !695}
!695 = metadata !{metadata !696, metadata !697, metadata !698, metadata !699, metadata !700, metadata !701}
!696 = metadata !{i32 786689, metadata !691, metadata !"devPtr", metadata !222, i32 16777464, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!697 = metadata !{i32 786689, metadata !691, metadata !"pitch", metadata !222, i32 33554680, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!698 = metadata !{i32 786689, metadata !691, metadata !"value", metadata !222, i32 50331896, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!699 = metadata !{i32 786689, metadata !691, metadata !"width", metadata !222, i32 67109113, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!700 = metadata !{i32 786689, metadata !691, metadata !"height", metadata !222, i32 83886329, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!701 = metadata !{i32 786689, metadata !691, metadata !"stream", metadata !222, i32 100663545, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!702 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !222, i32 253, metadata !703, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!703 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !704, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!704 = metadata !{metadata !225, metadata !328, metadata !29, metadata !235}
!705 = metadata !{metadata !706}
!706 = metadata !{metadata !707, metadata !708, metadata !709}
!707 = metadata !{i32 786689, metadata !702, metadata !"pitchedDevPtr", metadata !222, i32 16777469, metadata !328, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!708 = metadata !{i32 786689, metadata !702, metadata !"value", metadata !222, i32 33554685, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!709 = metadata !{i32 786689, metadata !702, metadata !"extent", metadata !222, i32 50331902, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!710 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !222, i32 258, metadata !711, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!711 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !712, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!712 = metadata !{metadata !225, metadata !328, metadata !29, metadata !235, metadata !410}
!713 = metadata !{metadata !714}
!714 = metadata !{metadata !715, metadata !716, metadata !717, metadata !718}
!715 = metadata !{i32 786689, metadata !710, metadata !"pitchedDevPtr", metadata !222, i32 16777474, metadata !328, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!716 = metadata !{i32 786689, metadata !710, metadata !"value", metadata !222, i32 33554690, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!717 = metadata !{i32 786689, metadata !710, metadata !"extent", metadata !222, i32 50331907, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!718 = metadata !{i32 786689, metadata !710, metadata !"stream", metadata !222, i32 67109123, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!719 = metadata !{i32 786478, i32 0, metadata !222, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !222, i32 263, metadata !720, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!720 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !721, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!721 = metadata !{metadata !225, metadata !84, metadata !29, metadata !238, metadata !410}
!722 = metadata !{metadata !723}
!723 = metadata !{metadata !724, metadata !725, metadata !726, metadata !727}
!724 = metadata !{i32 786689, metadata !719, metadata !"devPtr", metadata !222, i32 16777479, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!725 = metadata !{i32 786689, metadata !719, metadata !"value", metadata !222, i32 33554695, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!726 = metadata !{i32 786689, metadata !719, metadata !"count", metadata !222, i32 50331911, metadata !238, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!727 = metadata !{i32 786689, metadata !719, metadata !"stream", metadata !222, i32 67109127, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!728 = metadata !{i32 14, i32 0, metadata !729, null}
!729 = metadata !{i32 786443, metadata !15, i32 13, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair/main.cpp]
!730 = metadata !{i32 15, i32 0, metadata !729, null}
!731 = metadata !{i32 18, i32 0, metadata !732, null}
!732 = metadata !{i32 786443, metadata !21, i32 17, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair/main.cpp]
!733 = metadata !{i32 19, i32 0, metadata !732, null}
!734 = metadata !{i32 23, i32 0, metadata !735, null}
!735 = metadata !{i32 786443, metadata !22, i32 22, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair/main.cpp]
!736 = metadata !{i32 24, i32 0, metadata !735, null}
!737 = metadata !{i32 28, i32 0, metadata !738, null}
!738 = metadata !{i32 786443, metadata !23, i32 27, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair/main.cpp]
!739 = metadata !{i32 29, i32 0, metadata !738, null}
!740 = metadata !{i32 33, i32 0, metadata !741, null}
!741 = metadata !{i32 786443, metadata !24, i32 32, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair/main.cpp]
!742 = metadata !{i32 34, i32 0, metadata !741, null}
!743 = metadata !{i32 38, i32 0, metadata !744, null}
!744 = metadata !{i32 786443, metadata !25, i32 37, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair/main.cpp]
!745 = metadata !{i32 40, i32 0, metadata !744, null}
!746 = metadata !{i32 42, i32 0, metadata !747, null}
!747 = metadata !{i32 786443, metadata !744, i32 40, i32 0, metadata !16, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair/main.cpp]
!748 = metadata !{i32 43, i32 0, metadata !747, null}
!749 = metadata !{i32 45, i32 0, metadata !747, null}
!750 = metadata !{i32 46, i32 0, metadata !747, null}
!751 = metadata !{i32 48, i32 0, metadata !747, null}
!752 = metadata !{i32 49, i32 0, metadata !747, null}
!753 = metadata !{i32 51, i32 0, metadata !747, null}
!754 = metadata !{i32 52, i32 0, metadata !747, null}
!755 = metadata !{i32 54, i32 0, metadata !747, null}
!756 = metadata !{i32 55, i32 0, metadata !747, null}
!757 = metadata !{i32 58, i32 0, metadata !744, null}
!758 = metadata !{i32 60, i32 0, metadata !759, null}
!759 = metadata !{i32 786443, metadata !744, i32 58, i32 0, metadata !16, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair/main.cpp]
!760 = metadata !{i32 61, i32 0, metadata !759, null}
!761 = metadata !{i32 63, i32 0, metadata !759, null}
!762 = metadata !{i32 64, i32 0, metadata !759, null}
!763 = metadata !{i32 66, i32 0, metadata !759, null}
!764 = metadata !{i32 67, i32 0, metadata !759, null}
!765 = metadata !{i32 69, i32 0, metadata !759, null}
!766 = metadata !{i32 70, i32 0, metadata !759, null}
!767 = metadata !{i32 72, i32 0, metadata !759, null}
!768 = metadata !{i32 73, i32 0, metadata !759, null}
!769 = metadata !{i32 77, i32 0, metadata !744, null}
!770 = metadata !{i32 84, i32 0, metadata !771, null}
!771 = metadata !{i32 786443, metadata !30, i32 79, i32 0, metadata !16, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair/main.cpp]
!772 = metadata !{i32 86, i32 0, metadata !771, null}
!773 = metadata !{i32 87, i32 0, metadata !771, null}
!774 = metadata !{i32 88, i32 0, metadata !771, null}
!775 = metadata !{i32 89, i32 0, metadata !771, null}
!776 = metadata !{i32 90, i32 0, metadata !771, null}
!777 = metadata !{i32 92, i32 0, metadata !771, null}
!778 = metadata !{i32 93, i32 0, metadata !771, null}
!779 = metadata !{i32 94, i32 0, metadata !771, null}
!780 = metadata !{i32 95, i32 0, metadata !771, null}
!781 = metadata !{i32 96, i32 0, metadata !771, null}
!782 = metadata !{i32 97, i32 0, metadata !783, null}
!783 = metadata !{i32 786443, metadata !771, i32 97, i32 0, metadata !16, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair/main.cpp]
!784 = metadata !{i32 99, i32 0, metadata !783, null}
!785 = metadata !{i32 103, i32 0, metadata !771, null}
!786 = metadata !{i32 104, i32 0, metadata !771, null}
!787 = metadata !{i32 105, i32 0, metadata !771, null}
!788 = metadata !{i32 106, i32 0, metadata !771, null}
!789 = metadata !{i32 107, i32 0, metadata !771, null}
!790 = metadata !{i32 109, i32 0, metadata !771, null}
!791 = metadata !{i32 110, i32 0, metadata !771, null}
!792 = metadata !{i32 111, i32 0, metadata !771, null}
!793 = metadata !{i32 112, i32 0, metadata !771, null}
!794 = metadata !{i32 113, i32 0, metadata !771, null}
!795 = metadata !{i32 115, i32 0, metadata !771, null}
!796 = metadata !{i32 419, i32 0, metadata !33, null}
!797 = metadata !{i32 419, i32 0, metadata !76, null}
!798 = metadata !{i32 419, i32 0, metadata !799, null}
!799 = metadata !{i32 786443, metadata !76, i32 419, i32 0, metadata !34, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/005_soundness_issue_pair//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_t
!800 = metadata !{i32 16, i32 0, metadata !95, null}
!801 = metadata !{i32 17, i32 0, metadata !95, null}
!802 = metadata !{metadata !"omnipotent char", metadata !803}
!803 = metadata !{metadata !"Simple C/C++ TBAA"}
!804 = metadata !{i32 18, i32 0, metadata !95, null}
!805 = metadata !{i32 14, i32 0, metadata !131, null}
!806 = metadata !{i32 15, i32 0, metadata !131, null}
!807 = metadata !{i32 16, i32 0, metadata !131, null}
!808 = metadata !{i32 26, i32 0, metadata !809, null}
!809 = metadata !{i32 786443, metadata !221, i32 25, i32 0, metadata !222, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!810 = metadata !{i32 30, i32 0, metadata !811, null}
!811 = metadata !{i32 786443, metadata !250, i32 29, i32 0, metadata !222, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!812 = metadata !{i32 31, i32 0, metadata !811, null}
!813 = metadata !{i32 35, i32 0, metadata !814, null}
!814 = metadata !{i32 786443, metadata !256, i32 34, i32 0, metadata !222, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!815 = metadata !{i32 36, i32 0, metadata !814, null}
!816 = metadata !{i32 40, i32 0, metadata !817, null}
!817 = metadata !{i32 786443, metadata !262, i32 39, i32 0, metadata !222, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!818 = metadata !{i32 41, i32 0, metadata !817, null}
!819 = metadata !{i32 45, i32 0, metadata !820, null}
!820 = metadata !{i32 786443, metadata !266, i32 44, i32 0, metadata !222, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!821 = metadata !{i32 49, i32 0, metadata !822, null}
!822 = metadata !{i32 786443, metadata !274, i32 48, i32 0, metadata !222, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!823 = metadata !{i32 53, i32 0, metadata !824, null}
!824 = metadata !{i32 786443, metadata !282, i32 52, i32 0, metadata !222, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!825 = metadata !{i32 57, i32 0, metadata !826, null}
!826 = metadata !{i32 786443, metadata !290, i32 56, i32 0, metadata !222, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!827 = metadata !{i32 61, i32 0, metadata !828, null}
!828 = metadata !{i32 786443, metadata !298, i32 60, i32 0, metadata !222, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!829 = metadata !{i32 65, i32 0, metadata !830, null}
!830 = metadata !{i32 786443, metadata !305, i32 64, i32 0, metadata !222, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!831 = metadata !{i32 69, i32 0, metadata !832, null}
!832 = metadata !{i32 786443, metadata !313, i32 68, i32 0, metadata !222, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!833 = metadata !{i32 73, i32 0, metadata !834, null}
!834 = metadata !{i32 786443, metadata !317, i32 72, i32 0, metadata !222, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!835 = metadata !{i32 74, i32 0, metadata !834, null}
!836 = metadata !{metadata !"any pointer", metadata !802}
!837 = metadata !{i32 75, i32 0, metadata !834, null}
!838 = metadata !{i32 77, i32 0, metadata !834, null}
!839 = metadata !{i32 81, i32 0, metadata !840, null}
!840 = metadata !{i32 786443, metadata !324, i32 80, i32 0, metadata !222, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!841 = metadata !{i32 86, i32 0, metadata !842, null}
!842 = metadata !{i32 786443, metadata !338, i32 85, i32 0, metadata !222, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!843 = metadata !{i32 91, i32 0, metadata !844, null}
!844 = metadata !{i32 786443, metadata !348, i32 90, i32 0, metadata !222, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!845 = metadata !{i32 95, i32 0, metadata !846, null}
!846 = metadata !{i32 786443, metadata !358, i32 94, i32 0, metadata !222, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!847 = metadata !{i32 96, i32 0, metadata !846, null}
!848 = metadata !{i32 97, i32 0, metadata !846, null}
!849 = metadata !{i32 99, i32 0, metadata !846, null}
!850 = metadata !{i32 103, i32 0, metadata !851, null}
!851 = metadata !{i32 786443, metadata !363, i32 102, i32 0, metadata !222, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!852 = metadata !{i32 108, i32 0, metadata !853, null}
!853 = metadata !{i32 786443, metadata !372, i32 106, i32 0, metadata !222, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!854 = metadata !{i32 113, i32 0, metadata !855, null}
!855 = metadata !{i32 786443, metadata !381, i32 112, i32 0, metadata !222, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!856 = metadata !{i32 119, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !393, i32 118, i32 0, metadata !222, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!858 = metadata !{i32 125, i32 0, metadata !859, null}
!859 = metadata !{i32 786443, metadata !407, i32 124, i32 0, metadata !222, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!860 = metadata !{i32 131, i32 0, metadata !861, null}
!861 = metadata !{i32 786443, metadata !423, i32 130, i32 0, metadata !222, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!862 = metadata !{i32 137, i32 0, metadata !863, null}
!863 = metadata !{i32 786443, metadata !436, i32 136, i32 0, metadata !222, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!864 = metadata !{i32 143, i32 0, metadata !865, null}
!865 = metadata !{i32 786443, metadata !450, i32 142, i32 0, metadata !222, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!866 = metadata !{i32 149, i32 0, metadata !867, null}
!867 = metadata !{i32 786443, metadata !463, i32 148, i32 0, metadata !222, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!868 = metadata !{i32 153, i32 0, metadata !869, null}
!869 = metadata !{i32 786443, metadata !477, i32 152, i32 0, metadata !222, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!870 = metadata !{i32 157, i32 0, metadata !871, null}
!871 = metadata !{i32 786443, metadata !501, i32 156, i32 0, metadata !222, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!872 = metadata !{i32 161, i32 0, metadata !873, null}
!873 = metadata !{i32 786443, metadata !508, i32 160, i32 0, metadata !222, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!874 = metadata !{i32 165, i32 0, metadata !875, null}
!875 = metadata !{i32 786443, metadata !527, i32 164, i32 0, metadata !222, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!876 = metadata !{i32 171, i32 0, metadata !877, null}
!877 = metadata !{i32 786443, metadata !534, i32 170, i32 0, metadata !222, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!878 = metadata !{i32 176, i32 0, metadata !879, null}
!879 = metadata !{i32 786443, metadata !547, i32 175, i32 0, metadata !222, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!880 = metadata !{i32 181, i32 0, metadata !881, null}
!881 = metadata !{i32 786443, metadata !557, i32 180, i32 0, metadata !222, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!882 = metadata !{i32 187, i32 0, metadata !883, null}
!883 = metadata !{i32 786443, metadata !568, i32 186, i32 0, metadata !222, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!884 = metadata !{i32 192, i32 0, metadata !885, null}
!885 = metadata !{i32 786443, metadata !580, i32 191, i32 0, metadata !222, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!886 = metadata !{i32 198, i32 0, metadata !887, null}
!887 = metadata !{i32 786443, metadata !590, i32 197, i32 0, metadata !222, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!888 = metadata !{i32 203, i32 0, metadata !889, null}
!889 = metadata !{i32 786443, metadata !601, i32 201, i32 0, metadata !222, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!890 = metadata !{i32 209, i32 0, metadata !891, null}
!891 = metadata !{i32 786443, metadata !611, i32 207, i32 0, metadata !222, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!892 = metadata !{i32 214, i32 0, metadata !893, null}
!893 = metadata !{i32 786443, metadata !622, i32 213, i32 0, metadata !222, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!894 = metadata !{i32 220, i32 0, metadata !895, null}
!895 = metadata !{i32 786443, metadata !633, i32 219, i32 0, metadata !222, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!896 = metadata !{i32 225, i32 0, metadata !897, null}
!897 = metadata !{i32 786443, metadata !645, i32 224, i32 0, metadata !222, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!898 = metadata !{i32 226, i32 0, metadata !897, null}
!899 = metadata !{i32 231, i32 0, metadata !900, null}
!900 = metadata !{i32 786443, metadata !655, i32 230, i32 0, metadata !222, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!901 = metadata !{i32 235, i32 0, metadata !902, null}
!902 = metadata !{i32 786443, metadata !666, i32 234, i32 0, metadata !222, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!903 = metadata !{i32 239, i32 0, metadata !904, null}
!904 = metadata !{i32 786443, metadata !673, i32 238, i32 0, metadata !222, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!905 = metadata !{i32 240, i32 0, metadata !904, null}
!906 = metadata !{i32 245, i32 0, metadata !907, null}
!907 = metadata !{i32 786443, metadata !681, i32 244, i32 0, metadata !222, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!908 = metadata !{i32 250, i32 0, metadata !909, null}
!909 = metadata !{i32 786443, metadata !691, i32 249, i32 0, metadata !222, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!910 = metadata !{i32 255, i32 0, metadata !911, null}
!911 = metadata !{i32 786443, metadata !702, i32 254, i32 0, metadata !222, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!912 = metadata !{i32 260, i32 0, metadata !913, null}
!913 = metadata !{i32 786443, metadata !710, i32 259, i32 0, metadata !222, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!914 = metadata !{i32 264, i32 0, metadata !915, null}
!915 = metadata !{i32 786443, metadata !719, i32 263, i32 0, metadata !222, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
