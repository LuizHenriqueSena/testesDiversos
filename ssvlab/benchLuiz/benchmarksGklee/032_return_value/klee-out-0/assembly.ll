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

@blockIdx = external global %struct.dim3
@blockDim = external global %struct.dim3
@threadIdx = external global %struct.dim3
@.str = private unnamed_addr constant [100 x i8] c"Digite 0 para multiplicar um vetor por 4 ou\0ADigite outro valor para multiplicar um vetor por 2.5: \0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c" %.1f; \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c"a[i]==4*v[i]\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str5 = private unnamed_addr constant [15 x i8] c"a[i]==2.5*v[i]\00", align 1

define float @_Z13multiplyByTwoPfj(float* %v, i32 %tid) nounwind uwtable section "__device__" {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  store float* %v, float** %1, align 8
  store i32 %tid, i32* %2, align 4
  %3 = load i32* %2, align 4, !dbg !730
  %4 = zext i32 %3 to i64, !dbg !730
  %5 = load float** %1, align 8, !dbg !730
  %6 = getelementptr inbounds float* %5, i64 %4, !dbg !730
  %7 = load float* %6, align 4, !dbg !730
  %8 = fmul float %7, 2.000000e+00, !dbg !730
  ret float %8, !dbg !730
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define float @_Z11divideByTwoPfj(float* %v, i32 %tid) nounwind uwtable section "__device__" {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  store float* %v, float** %1, align 8
  store i32 %tid, i32* %2, align 4
  %3 = load i32* %2, align 4, !dbg !732
  %4 = zext i32 %3 to i64, !dbg !732
  %5 = load float** %1, align 8, !dbg !732
  %6 = getelementptr inbounds float* %5, i64 %4, !dbg !732
  %7 = load float* %6, align 4, !dbg !732
  %8 = fmul float %7, 5.000000e-01, !dbg !732
  ret float %8, !dbg !732
}

define float (float*, i32)* @_Z12grabFunctioni(i32 %i) nounwind uwtable section "__device__" {
  %1 = alloca float (float*, i32)*, align 8
  %2 = alloca i32, align 4
  store i32 %i, i32* %2, align 4
  %3 = load i32* %2, align 4, !dbg !734
  %4 = icmp eq i32 %3, 0, !dbg !734
  br i1 %4, label %5, label %6, !dbg !734

; <label>:5                                       ; preds = %0
  store float (float*, i32)* @_Z13multiplyByTwoPfj, float (float*, i32)** %1, !dbg !736
  br label %7, !dbg !736

; <label>:6                                       ; preds = %0
  store float (float*, i32)* @_Z11divideByTwoPfj, float (float*, i32)** %1, !dbg !737
  br label %7, !dbg !737

; <label>:7                                       ; preds = %6, %5
  %8 = load float (float*, i32)** %1, !dbg !738
  ret float (float*, i32)* %8, !dbg !738
}

define void @_Z3fooPfji(float* %v, i32 %size, i32 %i) uwtable noinline {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %tid = alloca i32, align 4
  %f = alloca float (float*, i32)*, align 8
  %x = alloca float, align 4
  store float* %v, float** %1, align 8
  store i32 %size, i32* %2, align 4
  store i32 %i, i32* %3, align 4
  %4 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i32 0, i32 0), align 4, !dbg !739
  %5 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 0), align 4, !dbg !739
  %6 = mul i32 %4, %5, !dbg !739
  %7 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !739
  %8 = add i32 %6, %7, !dbg !739
  store i32 %8, i32* %tid, align 4, !dbg !739
  %9 = load i32* %3, align 4, !dbg !741
  %10 = call float (float*, i32)* (i32)* @_Z12grabFunctioni(i32 %9), !dbg !741
  store float (float*, i32)* %10, float (float*, i32)** %f, align 8, !dbg !741
  %11 = load i32* %tid, align 4, !dbg !742
  %12 = load i32* %2, align 4, !dbg !742
  %13 = icmp ult i32 %11, %12, !dbg !742
  br i1 %13, label %14, label %29, !dbg !742

; <label>:14                                      ; preds = %0
  %15 = load float (float*, i32)** %f, align 8, !dbg !743
  %16 = load float** %1, align 8, !dbg !743
  %17 = load i32* %tid, align 4, !dbg !743
  %18 = call float %15(float* %16, i32 %17), !dbg !743
  store float %18, float* %x, align 4, !dbg !743
  %19 = load float** %1, align 8, !dbg !745
  %20 = load i32* %tid, align 4, !dbg !745
  %21 = call float @_Z13multiplyByTwoPfj(float* %19, i32 %20), !dbg !745
  %22 = load float* %x, align 4, !dbg !745
  %23 = fadd float %22, %21, !dbg !745
  store float %23, float* %x, align 4, !dbg !745
  %24 = load float* %x, align 4, !dbg !746
  %25 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !746
  %26 = zext i32 %25 to i64, !dbg !746
  %27 = load float** %1, align 8, !dbg !746
  %28 = getelementptr inbounds float* %27, i64 %26, !dbg !746
  store float %24, float* %28, align 4, !dbg !746
  br label %29, !dbg !747

; <label>:29                                      ; preds = %14, %0
  ret void, !dbg !748
}

define i32 @_Z10nondet_intv() nounwind uwtable {
  %a = alloca i32, align 4
  %1 = load i32* %a, align 4, !dbg !749
  ret i32 %1, !dbg !749
}

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %c = alloca i32, align 4
  %v = alloca float*, align 8
  %a = alloca float*, align 8
  %dev_v = alloca float*, align 8
  %fun = alloca float (float*, i32)*, align 8
  %i = alloca i32, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %c, align 4, !dbg !751
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([100 x i8]* @.str, i32 0, i32 0)), !dbg !753
  %7 = call i32 @_Z10nondet_intv(), !dbg !754
  store i32 %7, i32* %c, align 4, !dbg !754
  %8 = call noalias i8* @malloc(i64 8) nounwind, !dbg !755
  %9 = bitcast i8* %8 to float*, !dbg !755
  store float* %9, float** %v, align 8, !dbg !755
  %10 = call noalias i8* @malloc(i64 8) nounwind, !dbg !756
  %11 = bitcast i8* %10 to float*, !dbg !756
  store float* %11, float** %a, align 8, !dbg !756
  store i32 0, i32* %i, align 4, !dbg !757
  br label %12, !dbg !757

; <label>:12                                      ; preds = %15, %0
  %13 = load i32* %i, align 4, !dbg !757
  %14 = icmp slt i32 %13, 2, !dbg !757
  br i1 %14, label %15, label %33, !dbg !757

; <label>:15                                      ; preds = %12
  %16 = call i32 @rand() nounwind, !dbg !759
  %17 = srem i32 %16, 10, !dbg !759
  %18 = add nsw i32 %17, 1, !dbg !759
  %19 = sitofp i32 %18 to float, !dbg !759
  %20 = load i32* %i, align 4, !dbg !759
  %21 = sext i32 %20 to i64, !dbg !759
  %22 = load float** %v, align 8, !dbg !759
  %23 = getelementptr inbounds float* %22, i64 %21, !dbg !759
  store float %19, float* %23, align 4, !dbg !759
  %24 = load i32* %i, align 4, !dbg !761
  %25 = sext i32 %24 to i64, !dbg !761
  %26 = load float** %v, align 8, !dbg !761
  %27 = getelementptr inbounds float* %26, i64 %25, !dbg !761
  %28 = load float* %27, align 4, !dbg !761
  %29 = fpext float %28 to double, !dbg !761
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %29), !dbg !761
  %31 = load i32* %i, align 4, !dbg !757
  %32 = add nsw i32 %31, 1, !dbg !757
  store i32 %32, i32* %i, align 4, !dbg !757
  br label %12, !dbg !757

; <label>:33                                      ; preds = %12
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !762
  %35 = bitcast float** %dev_v to i8**, !dbg !763
  %36 = call i32 @cudaMalloc(i8** %35, i64 8), !dbg !763
  %37 = load float** %dev_v, align 8, !dbg !764
  %38 = bitcast float* %37 to i8*, !dbg !764
  %39 = load float** %v, align 8, !dbg !764
  %40 = bitcast float* %39 to i8*, !dbg !764
  %41 = call i32 @cudaMemcpy(i8* %38, i8* %40, i64 8, i32 1), !dbg !764
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !765
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 2, i32 1, i32 1), !dbg !765
  %42 = bitcast { i64, i32 }* %4 to i8*, !dbg !765
  %43 = bitcast %struct.dim3* %2 to i8*, !dbg !765
  %44 = call i8* @memcpy(i8* %42, i8* %43, i64 12)
  %45 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !765
  %46 = load i64* %45, align 1, !dbg !765
  %47 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !765
  %48 = load i32* %47, align 1, !dbg !765
  %49 = bitcast { i64, i32 }* %5 to i8*, !dbg !765
  %50 = bitcast %struct.dim3* %3 to i8*, !dbg !765
  %51 = call i8* @memcpy(i8* %49, i8* %50, i64 12)
  %52 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !765
  %53 = load i64* %52, align 1, !dbg !765
  %54 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !765
  %55 = load i32* %54, align 1, !dbg !765
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %46, i32 %48, i64 %53, i32 %55), !dbg !765
  %56 = load float** %dev_v, align 8, !dbg !767
  %57 = load i32* %c, align 4, !dbg !767
  call void @_Z3fooPfji(float* %56, i32 2, i32 %57), !dbg !767
  %58 = load float** %a, align 8, !dbg !768
  %59 = bitcast float* %58 to i8*, !dbg !768
  %60 = load float** %dev_v, align 8, !dbg !768
  %61 = bitcast float* %60 to i8*, !dbg !768
  %62 = call i32 @cudaMemcpy(i8* %59, i8* %61, i64 8, i32 2), !dbg !768
  store i32 0, i32* %i1, align 4, !dbg !769
  br label %63, !dbg !769

; <label>:63                                      ; preds = %101, %33
  %64 = load i32* %i1, align 4, !dbg !769
  %65 = icmp slt i32 %64, 2, !dbg !769
  br i1 %65, label %66, label %104, !dbg !769

; <label>:66                                      ; preds = %63
  %67 = load i32* %i1, align 4, !dbg !771
  %68 = sext i32 %67 to i64, !dbg !771
  %69 = load float** %a, align 8, !dbg !771
  %70 = getelementptr inbounds float* %69, i64 %68, !dbg !771
  %71 = load float* %70, align 4, !dbg !771
  %72 = fpext float %71 to double, !dbg !771
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %72), !dbg !771
  %74 = load i32* %c, align 4, !dbg !773
  %75 = icmp eq i32 %74, 0, !dbg !773
  %76 = load i32* %i1, align 4, !dbg !774
  %77 = sext i32 %76 to i64, !dbg !774
  %78 = load float** %a, align 8, !dbg !774
  %79 = getelementptr inbounds float* %78, i64 %77, !dbg !774
  %80 = load float* %79, align 4, !dbg !774
  br i1 %75, label %81, label %90, !dbg !773

; <label>:81                                      ; preds = %66
  %82 = load i32* %i1, align 4, !dbg !774
  %83 = sext i32 %82 to i64, !dbg !774
  %84 = load float** %v, align 8, !dbg !774
  %85 = getelementptr inbounds float* %84, i64 %83, !dbg !774
  %86 = load float* %85, align 4, !dbg !774
  %87 = fmul float 4.000000e+00, %86, !dbg !774
  %88 = fcmp oeq float %80, %87, !dbg !774
  br i1 %88, label %101, label %89, !dbg !774

; <label>:89                                      ; preds = %81
  call void @__assert_fail(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32 87, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwi
  unreachable, !dbg !774

; <label>:90                                      ; preds = %66
  %91 = fpext float %80 to double, !dbg !775
  %92 = load i32* %i1, align 4, !dbg !775
  %93 = sext i32 %92 to i64, !dbg !775
  %94 = load float** %v, align 8, !dbg !775
  %95 = getelementptr inbounds float* %94, i64 %93, !dbg !775
  %96 = load float* %95, align 4, !dbg !775
  %97 = fpext float %96 to double, !dbg !775
  %98 = fmul double 2.500000e+00, %97, !dbg !775
  %99 = fcmp oeq double %91, %98, !dbg !775
  br i1 %99, label %101, label %100, !dbg !775

; <label>:100                                     ; preds = %90
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32 89, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwi
  unreachable, !dbg !775

; <label>:101                                     ; preds = %81, %90
  %102 = load i32* %i1, align 4, !dbg !769
  %103 = add nsw i32 %102, 1, !dbg !769
  store i32 %103, i32* %i1, align 4, !dbg !769
  br label %63, !dbg !769

; <label>:104                                     ; preds = %63
  %105 = load float** %v, align 8, !dbg !776
  %106 = bitcast float* %105 to i8*, !dbg !776
  call void @free(i8* %106) nounwind, !dbg !776
  %107 = load float** %a, align 8, !dbg !776
  %108 = bitcast float* %107 to i8*, !dbg !776
  call void @free(i8* %108) nounwind, !dbg !776
  %109 = load float** %dev_v, align 8, !dbg !777
  %110 = bitcast float* %109 to i8*, !dbg !777
  %111 = call i32 @cudaFree(i8* %110), !dbg !777
  ret i32 0, !dbg !778
}

declare i32 @printf(i8*, ...)

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
  %6 = load i32* %2, align 4, !dbg !779
  %7 = load i32* %3, align 4, !dbg !779
  %8 = load i32* %4, align 4, !dbg !779
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !779
  ret void, !dbg !779
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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !780
  %7 = load i32* %2, align 4, !dbg !780
  store i32 %7, i32* %6, align 4, !dbg !780
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !780
  %9 = load i32* %3, align 4, !dbg !780
  store i32 %9, i32* %8, align 4, !dbg !780
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !780
  %11 = load i32* %4, align 4, !dbg !780
  store i32 %11, i32* %10, align 4, !dbg !780
  ret void, !dbg !781
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !783
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !783

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !783
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !784
  %4 = load i8* %src.06, align 1, !dbg !784, !tbaa !785
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !784
  store i8 %4, i8* %dest.05, align 1, !dbg !784, !tbaa !785
  %6 = icmp eq i64 %2, 0, !dbg !783
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !783

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !787
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !788
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !788

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !789
  br label %3, !dbg !788

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !788
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !789
  store volatile i8 %2, i8* %a.05, align 1, !dbg !789, !tbaa !785
  %6 = icmp eq i64 %4, 0, !dbg !788
  br i1 %6, label %._crit_edge, label %3, !dbg !788

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !790
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !791
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !793
  ret i32 0, !dbg !795
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !796
  tail call void @free(i8* %1) nounwind, !dbg !796
  ret i32 0, !dbg !798
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !799
  ret i32 0, !dbg !801
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !802
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !804
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !806
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !808
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !810
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !812
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !814
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !816
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !818
  store i8* %1, i8** %devPtr, align 8, !dbg !818, !tbaa !819
  tail call void @__clear_device(), !dbg !820
  ret i32 0, !dbg !821
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !822
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !824
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !826
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !828
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !830
  store i8* %1, i8** %ptr, align 8, !dbg !830, !tbaa !819
  tail call void @__clear_host(), !dbg !831
  ret i32 0, !dbg !832
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !833
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !835
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !837
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !839
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !841
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !843
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !845
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !847
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !849
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !851
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !853
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !855
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !857
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !859
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !861
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !863
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !865
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !867
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !869
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !871
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !873
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !875
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !877
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !879
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !881
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !882
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !884
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !886
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !888
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !889
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !891
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !893
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !895
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !897
}

!llvm.dbg.cu = !{!0, !79, !103, !119, !136}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metada
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !22, metadata !23, metadata !29, metadata !32, metadata !35, metadata !36, metadata !78}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"multiplyByTwo", metadata !"multiplyByTwo", metadata !"_Z13multiplyByTwoPfj", metadata !16, i32 11, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, float (float*, i32)* @
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !20, metadata !21}
!19 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!20 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!21 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!22 = metadata !{i32 786478, i32 0, metadata !16, metadata !"divideByTwo", metadata !"divideByTwo", metadata !"_Z11divideByTwoPfj", metadata !16, i32 16, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, float (float*, i32)* @_Z11di
!23 = metadata !{i32 786478, i32 0, metadata !16, metadata !"grabFunction", metadata !"grabFunction", metadata !"_Z12grabFunctioni", metadata !16, i32 21, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, float (float*, i32)* (i32)*
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !26, metadata !28}
!26 = metadata !{i32 786454, null, metadata !"funcType", metadata !16, i32 9, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ] [funcType] [line 9, size 0, align 0, offset 0] [from ]
!27 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!29 = metadata !{i32 786478, i32 0, metadata !16, metadata !"foo", metadata !"foo", metadata !"_Z3fooPfji", metadata !16, i32 30, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*, i32, i32)* @_Z3fooPfji, null, null, me
!30 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{null, metadata !20, metadata !21, metadata !28}
!32 = metadata !{i32 786478, i32 0, metadata !16, metadata !"nondet_int", metadata !"nondet_int", metadata !"_Z10nondet_intv", metadata !16, i32 44, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @_Z10nondet_intv, null, n
!33 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = metadata !{metadata !28}
!35 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 49, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 49} ; [ DW_TAG_
!36 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !37, i32 419, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!37 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value", null} ; [ DW_TAG_file_type ]
!38 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{null, metadata !40, metadata !21, metadata !21, metadata !21}
!40 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!41 = metadata !{i32 786451, null, metadata !"dim3", metadata !37, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !42, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!42 = metadata !{metadata !43, metadata !44, metadata !45, metadata !46, metadata !49, metadata !67, metadata !70, metadata !75}
!43 = metadata !{i32 786445, metadata !41, metadata !"x", metadata !37, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!44 = metadata !{i32 786445, metadata !41, metadata !"y", metadata !37, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !21} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!45 = metadata !{i32 786445, metadata !41, metadata !"z", metadata !37, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!46 = metadata !{i32 786478, i32 0, metadata !41, metadata !"dim3", metadata !"dim3", metadata !"", metadata !37, i32 419, metadata !38, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !47, i32 419} ; [ DW_TAG_subpr
!47 = metadata !{metadata !48}
!48 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!49 = metadata !{i32 786478, i32 0, metadata !41, metadata !"dim3", metadata !"dim3", metadata !"", metadata !37, i32 420, metadata !50, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !47, i32 420} ; [ DW_TAG_subpr
!50 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !51, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = metadata !{null, metadata !40, metadata !52}
!52 = metadata !{i32 786454, null, metadata !"uint3", metadata !37, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!53 = metadata !{i32 786451, null, metadata !"uint3", metadata !37, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !54, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!54 = metadata !{metadata !55, metadata !56, metadata !57, metadata !58, metadata !62}
!55 = metadata !{i32 786445, metadata !53, metadata !"x", metadata !37, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!56 = metadata !{i32 786445, metadata !53, metadata !"y", metadata !37, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !21} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!57 = metadata !{i32 786445, metadata !53, metadata !"z", metadata !37, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!58 = metadata !{i32 786478, i32 0, metadata !53, metadata !"uint3", metadata !"uint3", metadata !"", metadata !37, i32 188, metadata !59, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !47, i32 188} ; [ DW_TAG_sub
!59 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !60, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = metadata !{null, metadata !61}
!61 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !53} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!62 = metadata !{i32 786478, i32 0, metadata !53, metadata !"uint3", metadata !"uint3", metadata !"", metadata !37, i32 188, metadata !63, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !47, i32 188} ; [ DW_TAG_sub
!63 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{null, metadata !61, metadata !65}
!65 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!67 = metadata !{i32 786478, i32 0, metadata !41, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !37, i32 421, metadata !68, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!68 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !69, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!69 = metadata !{metadata !52, metadata !40}
!70 = metadata !{i32 786478, i32 0, metadata !41, metadata !"dim3", metadata !"dim3", metadata !"", metadata !37, i32 415, metadata !71, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !47, i32 415} ; [ DW_TAG_subpr
!71 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !72, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = metadata !{null, metadata !40, metadata !73}
!73 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !74} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!75 = metadata !{i32 786478, i32 0, metadata !41, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !37, i32 415, metadata !76, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !47, i32 415} ; [ DW_TAG_sub
!76 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !77, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!77 = metadata !{null, metadata !40}
!78 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !37, i32 419, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!79 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!80 = metadata !{metadata !81}
!81 = metadata !{metadata !82}
!82 = metadata !{i32 786478, i32 0, metadata !83, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !83, i32 12, metadata !84, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !91, i
!83 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!84 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !85, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!85 = metadata !{metadata !86, metadata !86, metadata !87, metadata !89}
!86 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!87 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !88} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!88 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!89 = metadata !{i32 786454, null, metadata !"size_t", metadata !83, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !90} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!90 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!91 = metadata !{metadata !92}
!92 = metadata !{metadata !93, metadata !94, metadata !95, metadata !96, metadata !100}
!93 = metadata !{i32 786689, metadata !82, metadata !"destaddr", metadata !83, i32 16777228, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!94 = metadata !{i32 786689, metadata !82, metadata !"srcaddr", metadata !83, i32 33554444, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!95 = metadata !{i32 786689, metadata !82, metadata !"len", metadata !83, i32 50331660, metadata !89, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!96 = metadata !{i32 786688, metadata !97, metadata !"dest", metadata !83, i32 13, metadata !98, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!97 = metadata !{i32 786443, metadata !82, i32 12, i32 0, metadata !83, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!98 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !99} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!99 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!100 = metadata !{i32 786688, metadata !97, metadata !"src", metadata !83, i32 14, metadata !101, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!101 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !102} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!102 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !99} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!103 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2
!104 = metadata !{metadata !105}
!105 = metadata !{metadata !106}
!106 = metadata !{i32 786478, i32 0, metadata !107, metadata !"memmove", metadata !"memmove", metadata !"", metadata !107, i32 12, metadata !108, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !111, i32 12} ; [ DW_TAG
!107 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!108 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !109, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!109 = metadata !{metadata !86, metadata !86, metadata !87, metadata !110}
!110 = metadata !{i32 786454, null, metadata !"size_t", metadata !107, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !90} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!111 = metadata !{metadata !112}
!112 = metadata !{metadata !113, metadata !114, metadata !115, metadata !116, metadata !118}
!113 = metadata !{i32 786689, metadata !106, metadata !"dst", metadata !107, i32 16777228, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!114 = metadata !{i32 786689, metadata !106, metadata !"src", metadata !107, i32 33554444, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!115 = metadata !{i32 786689, metadata !106, metadata !"count", metadata !107, i32 50331660, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!116 = metadata !{i32 786688, metadata !117, metadata !"a", metadata !107, i32 14, metadata !98, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!117 = metadata !{i32 786443, metadata !106, i32 12, i32 0, metadata !107, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!118 = metadata !{i32 786688, metadata !117, metadata !"b", metadata !107, i32 15, metadata !101, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!119 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!120 = metadata !{metadata !121}
!121 = metadata !{metadata !122}
!122 = metadata !{i32 786478, i32 0, metadata !123, metadata !"memset", metadata !"memset", metadata !"", metadata !123, i32 12, metadata !124, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!123 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!124 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !125, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!125 = metadata !{metadata !86, metadata !86, metadata !28, metadata !126}
!126 = metadata !{i32 786454, null, metadata !"size_t", metadata !123, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !90} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!127 = metadata !{metadata !128}
!128 = metadata !{metadata !129, metadata !130, metadata !131, metadata !132}
!129 = metadata !{i32 786689, metadata !122, metadata !"dst", metadata !123, i32 16777228, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!130 = metadata !{i32 786689, metadata !122, metadata !"s", metadata !123, i32 33554444, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!131 = metadata !{i32 786689, metadata !122, metadata !"count", metadata !123, i32 50331660, metadata !126, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!132 = metadata !{i32 786688, metadata !133, metadata !"a", metadata !123, i32 13, metadata !134, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!133 = metadata !{i32 786443, metadata !122, i32 12, i32 0, metadata !123, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!134 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !135} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!135 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !99} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!136 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!137 = metadata !{metadata !138}
!138 = metadata !{metadata !139, metadata !214, metadata !220}
!139 = metadata !{i32 786436, null, metadata !"cudaError", metadata !140, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !141, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!140 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!141 = metadata !{metadata !142, metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !149, metadata !150, metadata !151, metadata !152, metadata !153, metadata !154, metadata !155, metadata !156, metadata !1
!142 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!143 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!144 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!145 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!146 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!147 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!148 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!149 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!150 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!151 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!152 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!153 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!154 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!155 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!156 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!157 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!158 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!159 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!160 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!161 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!162 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!163 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!164 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!165 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!166 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!167 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!168 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!169 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!170 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!171 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!172 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!173 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!174 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!175 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!176 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!177 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!178 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!179 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!180 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!181 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!182 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!183 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!184 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!185 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!186 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!187 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!188 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!189 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!190 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!191 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!192 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!193 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!194 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!195 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!196 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!197 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!198 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!199 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!200 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!201 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!202 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!203 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!204 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!205 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!206 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!207 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!208 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!209 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!210 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!211 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!212 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!213 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!214 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !140, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !215, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!215 = metadata !{metadata !216, metadata !217, metadata !218, metadata !219}
!216 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!217 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!218 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!219 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!220 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !140, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!221 = metadata !{metadata !222}
!222 = metadata !{metadata !223, metadata !252, metadata !258, metadata !264, metadata !268, metadata !276, metadata !284, metadata !292, metadata !300, metadata !307, metadata !315, metadata !319, metadata !326, metadata !340, metadata !350, metadata !3
!223 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !224, i32 24, metadata !225, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!224 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!225 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !226, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!226 = metadata !{metadata !227, metadata !228, metadata !236, metadata !243, metadata !244}
!227 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !224, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !139} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!228 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !229} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!229 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !140, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !230, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!230 = metadata !{metadata !231, metadata !232, metadata !233, metadata !234, metadata !235}
!231 = metadata !{i32 786445, metadata !229, metadata !"x", metadata !140, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !28} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!232 = metadata !{i32 786445, metadata !229, metadata !"y", metadata !140, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !28} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!233 = metadata !{i32 786445, metadata !229, metadata !"z", metadata !140, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !28} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!234 = metadata !{i32 786445, metadata !229, metadata !"w", metadata !140, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !28} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!235 = metadata !{i32 786445, metadata !229, metadata !"f", metadata !140, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !214} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!236 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !237} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!237 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !140, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !238, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!238 = metadata !{metadata !239, metadata !241, metadata !242}
!239 = metadata !{i32 786445, metadata !237, metadata !"width", metadata !140, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !240} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!240 = metadata !{i32 786454, null, metadata !"size_t", metadata !140, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !90} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!241 = metadata !{i32 786445, metadata !237, metadata !"height", metadata !140, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !240} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!242 = metadata !{i32 786445, metadata !237, metadata !"depth", metadata !140, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !240} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!243 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!244 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !245} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!245 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !140, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!246 = metadata !{metadata !247}
!247 = metadata !{metadata !248, metadata !249, metadata !250, metadata !251}
!248 = metadata !{i32 786689, metadata !223, metadata !"desc", metadata !224, i32 16777240, metadata !228, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!249 = metadata !{i32 786689, metadata !223, metadata !"extent", metadata !224, i32 33554456, metadata !236, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!250 = metadata !{i32 786689, metadata !223, metadata !"flags", metadata !224, i32 50331673, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!251 = metadata !{i32 786689, metadata !223, metadata !"array", metadata !224, i32 67108889, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!252 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !224, i32 29, metadata !253, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !255, 
!253 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !254, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!254 = metadata !{metadata !227, metadata !86}
!255 = metadata !{metadata !256}
!256 = metadata !{metadata !257}
!257 = metadata !{i32 786689, metadata !252, metadata !"devPtr", metadata !224, i32 16777245, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!258 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !224, i32 34, metadata !259, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!259 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !260, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!260 = metadata !{metadata !227, metadata !244}
!261 = metadata !{metadata !262}
!262 = metadata !{metadata !263}
!263 = metadata !{i32 786689, metadata !258, metadata !"array", metadata !224, i32 16777250, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!264 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !224, i32 39, metadata !253, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!265 = metadata !{metadata !266}
!266 = metadata !{metadata !267}
!267 = metadata !{i32 786689, metadata !264, metadata !"ptr", metadata !224, i32 16777255, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!268 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !224, i32 44, metadata !269, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!269 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !270, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!270 = metadata !{metadata !227, metadata !271, metadata !101}
!271 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !86} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!272 = metadata !{metadata !273}
!273 = metadata !{metadata !274, metadata !275}
!274 = metadata !{i32 786689, metadata !268, metadata !"devPtr", metadata !224, i32 16777260, metadata !271, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!275 = metadata !{i32 786689, metadata !268, metadata !"symbol", metadata !224, i32 33554476, metadata !101, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!276 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !224, i32 48, metadata !277, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!277 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !278, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!278 = metadata !{metadata !227, metadata !279, metadata !101}
!279 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !240} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!280 = metadata !{metadata !281}
!281 = metadata !{metadata !282, metadata !283}
!282 = metadata !{i32 786689, metadata !276, metadata !"size", metadata !224, i32 16777264, metadata !279, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!283 = metadata !{i32 786689, metadata !276, metadata !"symbol", metadata !224, i32 33554480, metadata !101, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!284 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !224, i32 52, metadata !285, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!285 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !286, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!286 = metadata !{metadata !227, metadata !271, metadata !240, metadata !21}
!287 = metadata !{metadata !288}
!288 = metadata !{metadata !289, metadata !290, metadata !291}
!289 = metadata !{i32 786689, metadata !284, metadata !"pHost", metadata !224, i32 16777268, metadata !271, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!290 = metadata !{i32 786689, metadata !284, metadata !"size", metadata !224, i32 33554484, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!291 = metadata !{i32 786689, metadata !284, metadata !"flags", metadata !224, i32 50331700, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!292 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !224, i32 56, metadata !293, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!293 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !294, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!294 = metadata !{metadata !227, metadata !271, metadata !86, metadata !21}
!295 = metadata !{metadata !296}
!296 = metadata !{metadata !297, metadata !298, metadata !299}
!297 = metadata !{i32 786689, metadata !292, metadata !"pDevice", metadata !224, i32 16777272, metadata !271, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!298 = metadata !{i32 786689, metadata !292, metadata !"pHost", metadata !224, i32 33554488, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!299 = metadata !{i32 786689, metadata !292, metadata !"flags", metadata !224, i32 50331704, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!300 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !224, i32 60, metadata !301, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!301 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !302, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!302 = metadata !{metadata !227, metadata !243, metadata !86}
!303 = metadata !{metadata !304}
!304 = metadata !{metadata !305, metadata !306}
!305 = metadata !{i32 786689, metadata !300, metadata !"pFlags", metadata !224, i32 16777276, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!306 = metadata !{i32 786689, metadata !300, metadata !"pHost", metadata !224, i32 33554492, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!307 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !224, i32 64, metadata !308, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!308 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !309, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!309 = metadata !{metadata !227, metadata !86, metadata !240, metadata !21}
!310 = metadata !{metadata !311}
!311 = metadata !{metadata !312, metadata !313, metadata !314}
!312 = metadata !{i32 786689, metadata !307, metadata !"ptr", metadata !224, i32 16777280, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!313 = metadata !{i32 786689, metadata !307, metadata !"size", metadata !224, i32 33554496, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!314 = metadata !{i32 786689, metadata !307, metadata !"flags", metadata !224, i32 50331712, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!315 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !224, i32 68, metadata !253, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!316 = metadata !{metadata !317}
!317 = metadata !{metadata !318}
!318 = metadata !{i32 786689, metadata !315, metadata !"ptr", metadata !224, i32 16777284, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!319 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !224, i32 72, metadata !320, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!320 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !321, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!321 = metadata !{metadata !227, metadata !271, metadata !240}
!322 = metadata !{metadata !323}
!323 = metadata !{metadata !324, metadata !325}
!324 = metadata !{i32 786689, metadata !319, metadata !"devPtr", metadata !224, i32 16777288, metadata !271, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!325 = metadata !{i32 786689, metadata !319, metadata !"size", metadata !224, i32 33554504, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!326 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !224, i32 80, metadata !327, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!327 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !328, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!328 = metadata !{metadata !227, metadata !329, metadata !237}
!329 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !330} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!330 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !140, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !331, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!331 = metadata !{metadata !332, metadata !333, metadata !334, metadata !335}
!332 = metadata !{i32 786445, metadata !330, metadata !"ptr", metadata !140, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !86} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!333 = metadata !{i32 786445, metadata !330, metadata !"pitch", metadata !140, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !240} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!334 = metadata !{i32 786445, metadata !330, metadata !"xsize", metadata !140, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !240} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!335 = metadata !{i32 786445, metadata !330, metadata !"ysize", metadata !140, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !240} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!336 = metadata !{metadata !337}
!337 = metadata !{metadata !338, metadata !339}
!338 = metadata !{i32 786689, metadata !326, metadata !"pitchedDevPtr", metadata !224, i32 16777296, metadata !329, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!339 = metadata !{i32 786689, metadata !326, metadata !"extent", metadata !224, i32 33554512, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!340 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !224, i32 84, metadata !341, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!341 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !342, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!342 = metadata !{metadata !227, metadata !343, metadata !228, metadata !237, metadata !21}
!343 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !244} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!344 = metadata !{metadata !345}
!345 = metadata !{metadata !346, metadata !347, metadata !348, metadata !349}
!346 = metadata !{i32 786689, metadata !340, metadata !"array", metadata !224, i32 16777300, metadata !343, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!347 = metadata !{i32 786689, metadata !340, metadata !"desc", metadata !224, i32 33554516, metadata !228, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!348 = metadata !{i32 786689, metadata !340, metadata !"extent", metadata !224, i32 50331733, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!349 = metadata !{i32 786689, metadata !340, metadata !"flags", metadata !224, i32 67108949, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!350 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !224, i32 89, metadata !351, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!351 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !352, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!352 = metadata !{metadata !227, metadata !343, metadata !228, metadata !240, metadata !240, metadata !21}
!353 = metadata !{metadata !354}
!354 = metadata !{metadata !355, metadata !356, metadata !357, metadata !358, metadata !359}
!355 = metadata !{i32 786689, metadata !350, metadata !"array", metadata !224, i32 16777305, metadata !343, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!356 = metadata !{i32 786689, metadata !350, metadata !"desc", metadata !224, i32 33554521, metadata !228, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!357 = metadata !{i32 786689, metadata !350, metadata !"width", metadata !224, i32 50331738, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!358 = metadata !{i32 786689, metadata !350, metadata !"height", metadata !224, i32 67108954, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!359 = metadata !{i32 786689, metadata !350, metadata !"flags", metadata !224, i32 83886170, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!360 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !224, i32 94, metadata !320, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!361 = metadata !{metadata !362}
!362 = metadata !{metadata !363, metadata !364}
!363 = metadata !{i32 786689, metadata !360, metadata !"ptr", metadata !224, i32 16777310, metadata !271, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!364 = metadata !{i32 786689, metadata !360, metadata !"size", metadata !224, i32 33554526, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!365 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !224, i32 102, metadata !366, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!366 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !367, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!367 = metadata !{metadata !227, metadata !271, metadata !279, metadata !240, metadata !240}
!368 = metadata !{metadata !369}
!369 = metadata !{metadata !370, metadata !371, metadata !372, metadata !373}
!370 = metadata !{i32 786689, metadata !365, metadata !"devPtr", metadata !224, i32 16777318, metadata !271, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!371 = metadata !{i32 786689, metadata !365, metadata !"pitch", metadata !224, i32 33554534, metadata !279, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!372 = metadata !{i32 786689, metadata !365, metadata !"width", metadata !224, i32 50331750, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!373 = metadata !{i32 786689, metadata !365, metadata !"height", metadata !224, i32 67108966, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!374 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !224, i32 106, metadata !375, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!375 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !376, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!376 = metadata !{metadata !227, metadata !86, metadata !87, metadata !240, metadata !220}
!377 = metadata !{metadata !378}
!378 = metadata !{metadata !379, metadata !380, metadata !381, metadata !382}
!379 = metadata !{i32 786689, metadata !374, metadata !"dst", metadata !224, i32 16777322, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!380 = metadata !{i32 786689, metadata !374, metadata !"src", metadata !224, i32 33554538, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!381 = metadata !{i32 786689, metadata !374, metadata !"count", metadata !224, i32 50331754, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!382 = metadata !{i32 786689, metadata !374, metadata !"kind", metadata !224, i32 67108970, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!383 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !224, i32 111, metadata !384, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!384 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !385, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!385 = metadata !{metadata !227, metadata !86, metadata !240, metadata !87, metadata !240, metadata !240, metadata !240, metadata !220}
!386 = metadata !{metadata !387}
!387 = metadata !{metadata !388, metadata !389, metadata !390, metadata !391, metadata !392, metadata !393, metadata !394}
!388 = metadata !{i32 786689, metadata !383, metadata !"dst", metadata !224, i32 16777327, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!389 = metadata !{i32 786689, metadata !383, metadata !"dpitch", metadata !224, i32 33554543, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!390 = metadata !{i32 786689, metadata !383, metadata !"src", metadata !224, i32 50331759, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!391 = metadata !{i32 786689, metadata !383, metadata !"spitch", metadata !224, i32 67108975, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!392 = metadata !{i32 786689, metadata !383, metadata !"width", metadata !224, i32 83886192, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!393 = metadata !{i32 786689, metadata !383, metadata !"height", metadata !224, i32 100663408, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!394 = metadata !{i32 786689, metadata !383, metadata !"kind", metadata !224, i32 117440624, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!395 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !224, i32 116, metadata !396, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!396 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !397, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!397 = metadata !{metadata !227, metadata !244, metadata !240, metadata !240, metadata !244, metadata !240, metadata !240, metadata !240, metadata !240, metadata !220}
!398 = metadata !{metadata !399}
!399 = metadata !{metadata !400, metadata !401, metadata !402, metadata !403, metadata !404, metadata !405, metadata !406, metadata !407, metadata !408}
!400 = metadata !{i32 786689, metadata !395, metadata !"dst", metadata !224, i32 16777332, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!401 = metadata !{i32 786689, metadata !395, metadata !"wOffsetDst", metadata !224, i32 33554548, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!402 = metadata !{i32 786689, metadata !395, metadata !"hOffsetDst", metadata !224, i32 50331764, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!403 = metadata !{i32 786689, metadata !395, metadata !"src", metadata !224, i32 67108981, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!404 = metadata !{i32 786689, metadata !395, metadata !"wOffsetSrc", metadata !224, i32 83886197, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!405 = metadata !{i32 786689, metadata !395, metadata !"hOffsetSrc", metadata !224, i32 100663413, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!406 = metadata !{i32 786689, metadata !395, metadata !"width", metadata !224, i32 117440630, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!407 = metadata !{i32 786689, metadata !395, metadata !"height", metadata !224, i32 134217846, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!408 = metadata !{i32 786689, metadata !395, metadata !"kind", metadata !224, i32 150995062, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!409 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !224, i32 122, metadata !410, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!410 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !411, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!411 = metadata !{metadata !227, metadata !86, metadata !240, metadata !87, metadata !240, metadata !240, metadata !240, metadata !220, metadata !412}
!412 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !224, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !413} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!413 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !414} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!414 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !140, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!415 = metadata !{metadata !416}
!416 = metadata !{metadata !417, metadata !418, metadata !419, metadata !420, metadata !421, metadata !422, metadata !423, metadata !424}
!417 = metadata !{i32 786689, metadata !409, metadata !"dst", metadata !224, i32 16777338, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!418 = metadata !{i32 786689, metadata !409, metadata !"dpitch", metadata !224, i32 33554554, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!419 = metadata !{i32 786689, metadata !409, metadata !"src", metadata !224, i32 50331770, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!420 = metadata !{i32 786689, metadata !409, metadata !"spitch", metadata !224, i32 67108986, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!421 = metadata !{i32 786689, metadata !409, metadata !"width", metadata !224, i32 83886203, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!422 = metadata !{i32 786689, metadata !409, metadata !"height", metadata !224, i32 100663419, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!423 = metadata !{i32 786689, metadata !409, metadata !"kind", metadata !224, i32 117440635, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!424 = metadata !{i32 786689, metadata !409, metadata !"stream", metadata !224, i32 134217852, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!425 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !224, i32 128, metadata !426, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!426 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !427, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!427 = metadata !{metadata !227, metadata !86, metadata !240, metadata !244, metadata !240, metadata !240, metadata !240, metadata !240, metadata !220}
!428 = metadata !{metadata !429}
!429 = metadata !{metadata !430, metadata !431, metadata !432, metadata !433, metadata !434, metadata !435, metadata !436, metadata !437}
!430 = metadata !{i32 786689, metadata !425, metadata !"dst", metadata !224, i32 16777344, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!431 = metadata !{i32 786689, metadata !425, metadata !"dpitch", metadata !224, i32 33554560, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!432 = metadata !{i32 786689, metadata !425, metadata !"src", metadata !224, i32 50331776, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!433 = metadata !{i32 786689, metadata !425, metadata !"wOffset", metadata !224, i32 67108993, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!434 = metadata !{i32 786689, metadata !425, metadata !"hOffset", metadata !224, i32 83886209, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!435 = metadata !{i32 786689, metadata !425, metadata !"width", metadata !224, i32 100663425, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!436 = metadata !{i32 786689, metadata !425, metadata !"height", metadata !224, i32 117440641, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!437 = metadata !{i32 786689, metadata !425, metadata !"kind", metadata !224, i32 134217858, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!438 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !224, i32 134, metadata !439, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!439 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !440, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!440 = metadata !{metadata !227, metadata !86, metadata !240, metadata !244, metadata !240, metadata !240, metadata !240, metadata !240, metadata !220, metadata !412}
!441 = metadata !{metadata !442}
!442 = metadata !{metadata !443, metadata !444, metadata !445, metadata !446, metadata !447, metadata !448, metadata !449, metadata !450, metadata !451}
!443 = metadata !{i32 786689, metadata !438, metadata !"dst", metadata !224, i32 16777350, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!444 = metadata !{i32 786689, metadata !438, metadata !"dpitch", metadata !224, i32 33554566, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!445 = metadata !{i32 786689, metadata !438, metadata !"src", metadata !224, i32 50331782, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!446 = metadata !{i32 786689, metadata !438, metadata !"wOffset", metadata !224, i32 67108999, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!447 = metadata !{i32 786689, metadata !438, metadata !"hOffset", metadata !224, i32 83886215, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!448 = metadata !{i32 786689, metadata !438, metadata !"width", metadata !224, i32 100663431, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!449 = metadata !{i32 786689, metadata !438, metadata !"height", metadata !224, i32 117440647, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!450 = metadata !{i32 786689, metadata !438, metadata !"kind", metadata !224, i32 134217864, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!451 = metadata !{i32 786689, metadata !438, metadata !"stream", metadata !224, i32 150995080, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!452 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !224, i32 140, metadata !453, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!453 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !454, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!454 = metadata !{metadata !227, metadata !244, metadata !240, metadata !240, metadata !87, metadata !240, metadata !240, metadata !240, metadata !220}
!455 = metadata !{metadata !456}
!456 = metadata !{metadata !457, metadata !458, metadata !459, metadata !460, metadata !461, metadata !462, metadata !463, metadata !464}
!457 = metadata !{i32 786689, metadata !452, metadata !"dst", metadata !224, i32 16777356, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!458 = metadata !{i32 786689, metadata !452, metadata !"wOffset", metadata !224, i32 33554572, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!459 = metadata !{i32 786689, metadata !452, metadata !"hOffset", metadata !224, i32 50331788, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!460 = metadata !{i32 786689, metadata !452, metadata !"src", metadata !224, i32 67109005, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!461 = metadata !{i32 786689, metadata !452, metadata !"spitch", metadata !224, i32 83886221, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!462 = metadata !{i32 786689, metadata !452, metadata !"width", metadata !224, i32 100663437, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!463 = metadata !{i32 786689, metadata !452, metadata !"height", metadata !224, i32 117440653, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!464 = metadata !{i32 786689, metadata !452, metadata !"kind", metadata !224, i32 134217870, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!465 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !224, i32 146, metadata !466, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!466 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !467, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!467 = metadata !{metadata !227, metadata !244, metadata !240, metadata !240, metadata !87, metadata !240, metadata !240, metadata !240, metadata !220, metadata !412}
!468 = metadata !{metadata !469}
!469 = metadata !{metadata !470, metadata !471, metadata !472, metadata !473, metadata !474, metadata !475, metadata !476, metadata !477, metadata !478}
!470 = metadata !{i32 786689, metadata !465, metadata !"dst", metadata !224, i32 16777362, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!471 = metadata !{i32 786689, metadata !465, metadata !"wOffset", metadata !224, i32 33554578, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!472 = metadata !{i32 786689, metadata !465, metadata !"hOffset", metadata !224, i32 50331794, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!473 = metadata !{i32 786689, metadata !465, metadata !"src", metadata !224, i32 67109011, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!474 = metadata !{i32 786689, metadata !465, metadata !"spitch", metadata !224, i32 83886227, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!475 = metadata !{i32 786689, metadata !465, metadata !"width", metadata !224, i32 100663443, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!476 = metadata !{i32 786689, metadata !465, metadata !"height", metadata !224, i32 117440659, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!477 = metadata !{i32 786689, metadata !465, metadata !"kind", metadata !224, i32 134217876, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!478 = metadata !{i32 786689, metadata !465, metadata !"stream", metadata !224, i32 150995092, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!479 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !224, i32 152, metadata !480, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!480 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !481, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!481 = metadata !{metadata !227, metadata !482}
!482 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !483} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!483 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !484} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!484 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !140, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !485, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!485 = metadata !{metadata !486, metadata !488, metadata !494, metadata !495, metadata !496, metadata !497, metadata !498, metadata !499}
!486 = metadata !{i32 786445, metadata !484, metadata !"srcArray", metadata !140, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !487} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!487 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !140, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !244} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!488 = metadata !{i32 786445, metadata !484, metadata !"srcPos", metadata !140, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !489} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!489 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !140, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !490, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!490 = metadata !{metadata !491, metadata !492, metadata !493}
!491 = metadata !{i32 786445, metadata !489, metadata !"x", metadata !140, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !240} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!492 = metadata !{i32 786445, metadata !489, metadata !"y", metadata !140, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !240} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!493 = metadata !{i32 786445, metadata !489, metadata !"z", metadata !140, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !240} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!494 = metadata !{i32 786445, metadata !484, metadata !"srcPtr", metadata !140, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !330} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!495 = metadata !{i32 786445, metadata !484, metadata !"dstArray", metadata !140, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !487} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!496 = metadata !{i32 786445, metadata !484, metadata !"dstPos", metadata !140, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !489} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!497 = metadata !{i32 786445, metadata !484, metadata !"dstPtr", metadata !140, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !330} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!498 = metadata !{i32 786445, metadata !484, metadata !"extent", metadata !140, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !237} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!499 = metadata !{i32 786445, metadata !484, metadata !"kind", metadata !140, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !220} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!500 = metadata !{metadata !501}
!501 = metadata !{metadata !502}
!502 = metadata !{i32 786689, metadata !479, metadata !"p", metadata !224, i32 16777368, metadata !482, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!503 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !224, i32 156, metadata !504, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!504 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !505, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!505 = metadata !{metadata !227, metadata !482, metadata !412}
!506 = metadata !{metadata !507}
!507 = metadata !{metadata !508, metadata !509}
!508 = metadata !{i32 786689, metadata !503, metadata !"p", metadata !224, i32 16777372, metadata !482, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!509 = metadata !{i32 786689, metadata !503, metadata !"stream", metadata !224, i32 33554588, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!510 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !224, i32 160, metadata !511, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!511 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !512, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!512 = metadata !{metadata !227, metadata !513}
!513 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !514} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!514 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !515} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!515 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !140, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !516, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!516 = metadata !{metadata !517, metadata !518, metadata !519, metadata !520, metadata !521, metadata !522, metadata !523, metadata !524, metadata !525}
!517 = metadata !{i32 786445, metadata !515, metadata !"srcArray", metadata !140, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !487} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!518 = metadata !{i32 786445, metadata !515, metadata !"srcPos", metadata !140, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !489} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!519 = metadata !{i32 786445, metadata !515, metadata !"srcPtr", metadata !140, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !330} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!520 = metadata !{i32 786445, metadata !515, metadata !"srcDevice", metadata !140, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !28} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!521 = metadata !{i32 786445, metadata !515, metadata !"dstArray", metadata !140, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !487} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!522 = metadata !{i32 786445, metadata !515, metadata !"dstPos", metadata !140, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !489} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!523 = metadata !{i32 786445, metadata !515, metadata !"dstPtr", metadata !140, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !330} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!524 = metadata !{i32 786445, metadata !515, metadata !"dstDevice", metadata !140, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !28} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!525 = metadata !{i32 786445, metadata !515, metadata !"extent", metadata !140, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !237} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!526 = metadata !{metadata !527}
!527 = metadata !{metadata !528}
!528 = metadata !{i32 786689, metadata !510, metadata !"p", metadata !224, i32 16777376, metadata !513, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!529 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !224, i32 164, metadata !530, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!530 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !531, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!531 = metadata !{metadata !227, metadata !513, metadata !412}
!532 = metadata !{metadata !533}
!533 = metadata !{metadata !534, metadata !535}
!534 = metadata !{i32 786689, metadata !529, metadata !"p", metadata !224, i32 16777380, metadata !513, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!535 = metadata !{i32 786689, metadata !529, metadata !"stream", metadata !224, i32 33554596, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!536 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !224, i32 168, metadata !537, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!537 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !538, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!538 = metadata !{metadata !227, metadata !244, metadata !240, metadata !240, metadata !244, metadata !240, metadata !240, metadata !240, metadata !220}
!539 = metadata !{metadata !540}
!540 = metadata !{metadata !541, metadata !542, metadata !543, metadata !544, metadata !545, metadata !546, metadata !547, metadata !548}
!541 = metadata !{i32 786689, metadata !536, metadata !"dst", metadata !224, i32 16777384, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!542 = metadata !{i32 786689, metadata !536, metadata !"wOffsetDst", metadata !224, i32 33554600, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!543 = metadata !{i32 786689, metadata !536, metadata !"hOffsetDst", metadata !224, i32 50331816, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!544 = metadata !{i32 786689, metadata !536, metadata !"src", metadata !224, i32 67109033, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!545 = metadata !{i32 786689, metadata !536, metadata !"wOffsetSrc", metadata !224, i32 83886249, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!546 = metadata !{i32 786689, metadata !536, metadata !"hOffsetSrc", metadata !224, i32 100663465, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!547 = metadata !{i32 786689, metadata !536, metadata !"count", metadata !224, i32 117440682, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!548 = metadata !{i32 786689, metadata !536, metadata !"kind", metadata !224, i32 134217898, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!549 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !224, i32 174, metadata !550, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!550 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !551, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!551 = metadata !{metadata !227, metadata !86, metadata !87, metadata !240, metadata !220, metadata !412}
!552 = metadata !{metadata !553}
!553 = metadata !{metadata !554, metadata !555, metadata !556, metadata !557, metadata !558}
!554 = metadata !{i32 786689, metadata !549, metadata !"dst", metadata !224, i32 16777390, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!555 = metadata !{i32 786689, metadata !549, metadata !"src", metadata !224, i32 33554606, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!556 = metadata !{i32 786689, metadata !549, metadata !"count", metadata !224, i32 50331822, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!557 = metadata !{i32 786689, metadata !549, metadata !"kind", metadata !224, i32 67109039, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!558 = metadata !{i32 786689, metadata !549, metadata !"stream", metadata !224, i32 83886255, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!559 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !224, i32 179, metadata !560, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!560 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !561, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!561 = metadata !{metadata !227, metadata !86, metadata !244, metadata !240, metadata !240, metadata !240, metadata !220}
!562 = metadata !{metadata !563}
!563 = metadata !{metadata !564, metadata !565, metadata !566, metadata !567, metadata !568, metadata !569}
!564 = metadata !{i32 786689, metadata !559, metadata !"dst", metadata !224, i32 16777395, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!565 = metadata !{i32 786689, metadata !559, metadata !"src", metadata !224, i32 33554611, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!566 = metadata !{i32 786689, metadata !559, metadata !"wOffset", metadata !224, i32 50331827, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!567 = metadata !{i32 786689, metadata !559, metadata !"hOffset", metadata !224, i32 67109044, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!568 = metadata !{i32 786689, metadata !559, metadata !"count", metadata !224, i32 83886260, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!569 = metadata !{i32 786689, metadata !559, metadata !"kind", metadata !224, i32 100663476, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!570 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !224, i32 184, metadata !571, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!571 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !572, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!572 = metadata !{metadata !227, metadata !86, metadata !244, metadata !240, metadata !240, metadata !240, metadata !220, metadata !412}
!573 = metadata !{metadata !574}
!574 = metadata !{metadata !575, metadata !576, metadata !577, metadata !578, metadata !579, metadata !580, metadata !581}
!575 = metadata !{i32 786689, metadata !570, metadata !"dst", metadata !224, i32 16777400, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!576 = metadata !{i32 786689, metadata !570, metadata !"src", metadata !224, i32 33554616, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!577 = metadata !{i32 786689, metadata !570, metadata !"wOffset", metadata !224, i32 50331832, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!578 = metadata !{i32 786689, metadata !570, metadata !"hOffset", metadata !224, i32 67109049, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!579 = metadata !{i32 786689, metadata !570, metadata !"count", metadata !224, i32 83886265, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!580 = metadata !{i32 786689, metadata !570, metadata !"kind", metadata !224, i32 100663481, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!581 = metadata !{i32 786689, metadata !570, metadata !"stream", metadata !224, i32 117440698, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!582 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !224, i32 190, metadata !583, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!583 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !584, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!584 = metadata !{metadata !227, metadata !86, metadata !101, metadata !240, metadata !240, metadata !220}
!585 = metadata !{metadata !586}
!586 = metadata !{metadata !587, metadata !588, metadata !589, metadata !590, metadata !591}
!587 = metadata !{i32 786689, metadata !582, metadata !"dst", metadata !224, i32 16777406, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!588 = metadata !{i32 786689, metadata !582, metadata !"symbol", metadata !224, i32 33554622, metadata !101, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!589 = metadata !{i32 786689, metadata !582, metadata !"count", metadata !224, i32 50331838, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!590 = metadata !{i32 786689, metadata !582, metadata !"offset", metadata !224, i32 67109055, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!591 = metadata !{i32 786689, metadata !582, metadata !"kind", metadata !224, i32 83886271, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!592 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !224, i32 195, metadata !593, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!593 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !594, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!594 = metadata !{metadata !227, metadata !86, metadata !101, metadata !240, metadata !240, metadata !220, metadata !412}
!595 = metadata !{metadata !596}
!596 = metadata !{metadata !597, metadata !598, metadata !599, metadata !600, metadata !601, metadata !602}
!597 = metadata !{i32 786689, metadata !592, metadata !"dst", metadata !224, i32 16777411, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!598 = metadata !{i32 786689, metadata !592, metadata !"symbol", metadata !224, i32 33554627, metadata !101, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!599 = metadata !{i32 786689, metadata !592, metadata !"count", metadata !224, i32 50331843, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!600 = metadata !{i32 786689, metadata !592, metadata !"offset", metadata !224, i32 67109060, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!601 = metadata !{i32 786689, metadata !592, metadata !"kind", metadata !224, i32 83886276, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!602 = metadata !{i32 786689, metadata !592, metadata !"stream", metadata !224, i32 100663493, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!603 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !224, i32 201, metadata !604, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!604 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !605, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!605 = metadata !{metadata !227, metadata !86, metadata !28, metadata !87, metadata !28, metadata !240}
!606 = metadata !{metadata !607}
!607 = metadata !{metadata !608, metadata !609, metadata !610, metadata !611, metadata !612}
!608 = metadata !{i32 786689, metadata !603, metadata !"dst", metadata !224, i32 16777417, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!609 = metadata !{i32 786689, metadata !603, metadata !"dstDevice", metadata !224, i32 33554633, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!610 = metadata !{i32 786689, metadata !603, metadata !"src", metadata !224, i32 50331849, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!611 = metadata !{i32 786689, metadata !603, metadata !"srcDevice", metadata !224, i32 67109065, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!612 = metadata !{i32 786689, metadata !603, metadata !"count", metadata !224, i32 83886281, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!613 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !224, i32 206, metadata !614, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!614 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !615, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!615 = metadata !{metadata !227, metadata !86, metadata !28, metadata !87, metadata !28, metadata !240, metadata !412}
!616 = metadata !{metadata !617}
!617 = metadata !{metadata !618, metadata !619, metadata !620, metadata !621, metadata !622, metadata !623}
!618 = metadata !{i32 786689, metadata !613, metadata !"dst", metadata !224, i32 16777422, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!619 = metadata !{i32 786689, metadata !613, metadata !"dstDevice", metadata !224, i32 33554638, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!620 = metadata !{i32 786689, metadata !613, metadata !"src", metadata !224, i32 50331854, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!621 = metadata !{i32 786689, metadata !613, metadata !"srcDevice", metadata !224, i32 67109070, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!622 = metadata !{i32 786689, metadata !613, metadata !"count", metadata !224, i32 83886287, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!623 = metadata !{i32 786689, metadata !613, metadata !"stream", metadata !224, i32 100663503, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!624 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !224, i32 212, metadata !625, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!625 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !626, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!626 = metadata !{metadata !227, metadata !244, metadata !240, metadata !240, metadata !87, metadata !240, metadata !220}
!627 = metadata !{metadata !628}
!628 = metadata !{metadata !629, metadata !630, metadata !631, metadata !632, metadata !633, metadata !634}
!629 = metadata !{i32 786689, metadata !624, metadata !"dst", metadata !224, i32 16777428, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!630 = metadata !{i32 786689, metadata !624, metadata !"wOffset", metadata !224, i32 33554644, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!631 = metadata !{i32 786689, metadata !624, metadata !"hOffset", metadata !224, i32 50331860, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!632 = metadata !{i32 786689, metadata !624, metadata !"src", metadata !224, i32 67109077, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!633 = metadata !{i32 786689, metadata !624, metadata !"count", metadata !224, i32 83886293, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!634 = metadata !{i32 786689, metadata !624, metadata !"kind", metadata !224, i32 100663509, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!635 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !224, i32 217, metadata !636, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!636 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !637, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!637 = metadata !{metadata !227, metadata !244, metadata !240, metadata !240, metadata !87, metadata !240, metadata !220, metadata !412}
!638 = metadata !{metadata !639}
!639 = metadata !{metadata !640, metadata !641, metadata !642, metadata !643, metadata !644, metadata !645, metadata !646}
!640 = metadata !{i32 786689, metadata !635, metadata !"dst", metadata !224, i32 16777433, metadata !244, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!641 = metadata !{i32 786689, metadata !635, metadata !"wOffset", metadata !224, i32 33554649, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!642 = metadata !{i32 786689, metadata !635, metadata !"hOffset", metadata !224, i32 50331865, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!643 = metadata !{i32 786689, metadata !635, metadata !"src", metadata !224, i32 67109082, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!644 = metadata !{i32 786689, metadata !635, metadata !"count", metadata !224, i32 83886298, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!645 = metadata !{i32 786689, metadata !635, metadata !"kind", metadata !224, i32 100663514, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!646 = metadata !{i32 786689, metadata !635, metadata !"stream", metadata !224, i32 117440731, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!647 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !224, i32 223, metadata !648, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!648 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !649, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!649 = metadata !{metadata !227, metadata !98, metadata !87, metadata !240, metadata !240, metadata !220}
!650 = metadata !{metadata !651}
!651 = metadata !{metadata !652, metadata !653, metadata !654, metadata !655, metadata !656}
!652 = metadata !{i32 786689, metadata !647, metadata !"symbol", metadata !224, i32 16777439, metadata !98, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!653 = metadata !{i32 786689, metadata !647, metadata !"src", metadata !224, i32 33554655, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!654 = metadata !{i32 786689, metadata !647, metadata !"count", metadata !224, i32 50331871, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!655 = metadata !{i32 786689, metadata !647, metadata !"offset", metadata !224, i32 67109088, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!656 = metadata !{i32 786689, metadata !647, metadata !"kind", metadata !224, i32 83886304, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!657 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !224, i32 229, metadata !658, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!658 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !659, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!659 = metadata !{metadata !227, metadata !101, metadata !87, metadata !240, metadata !240, metadata !220, metadata !412}
!660 = metadata !{metadata !661}
!661 = metadata !{metadata !662, metadata !663, metadata !664, metadata !665, metadata !666, metadata !667}
!662 = metadata !{i32 786689, metadata !657, metadata !"symbol", metadata !224, i32 16777445, metadata !101, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!663 = metadata !{i32 786689, metadata !657, metadata !"src", metadata !224, i32 33554661, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!664 = metadata !{i32 786689, metadata !657, metadata !"count", metadata !224, i32 50331877, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!665 = metadata !{i32 786689, metadata !657, metadata !"offset", metadata !224, i32 67109093, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!666 = metadata !{i32 786689, metadata !657, metadata !"kind", metadata !224, i32 83886310, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!667 = metadata !{i32 786689, metadata !657, metadata !"stream", metadata !224, i32 100663526, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!668 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !224, i32 234, metadata !669, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!669 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !670, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!670 = metadata !{metadata !227, metadata !279, metadata !279}
!671 = metadata !{metadata !672}
!672 = metadata !{metadata !673, metadata !674}
!673 = metadata !{i32 786689, metadata !668, metadata !"free", metadata !224, i32 16777450, metadata !279, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!674 = metadata !{i32 786689, metadata !668, metadata !"total", metadata !224, i32 33554666, metadata !279, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!675 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !224, i32 238, metadata !676, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!676 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !677, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!677 = metadata !{metadata !227, metadata !86, metadata !28, metadata !240}
!678 = metadata !{metadata !679}
!679 = metadata !{metadata !680, metadata !681, metadata !682}
!680 = metadata !{i32 786689, metadata !675, metadata !"devPtr", metadata !224, i32 16777454, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!681 = metadata !{i32 786689, metadata !675, metadata !"value", metadata !224, i32 33554670, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!682 = metadata !{i32 786689, metadata !675, metadata !"count", metadata !224, i32 50331886, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!683 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !224, i32 243, metadata !684, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!684 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !685, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!685 = metadata !{metadata !227, metadata !86, metadata !240, metadata !28, metadata !240, metadata !240}
!686 = metadata !{metadata !687}
!687 = metadata !{metadata !688, metadata !689, metadata !690, metadata !691, metadata !692}
!688 = metadata !{i32 786689, metadata !683, metadata !"devPtr", metadata !224, i32 16777459, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!689 = metadata !{i32 786689, metadata !683, metadata !"pitch", metadata !224, i32 33554675, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!690 = metadata !{i32 786689, metadata !683, metadata !"value", metadata !224, i32 50331891, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!691 = metadata !{i32 786689, metadata !683, metadata !"width", metadata !224, i32 67109108, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!692 = metadata !{i32 786689, metadata !683, metadata !"height", metadata !224, i32 83886324, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!693 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !224, i32 248, metadata !694, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!694 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !695, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!695 = metadata !{metadata !227, metadata !86, metadata !240, metadata !28, metadata !240, metadata !240, metadata !412}
!696 = metadata !{metadata !697}
!697 = metadata !{metadata !698, metadata !699, metadata !700, metadata !701, metadata !702, metadata !703}
!698 = metadata !{i32 786689, metadata !693, metadata !"devPtr", metadata !224, i32 16777464, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!699 = metadata !{i32 786689, metadata !693, metadata !"pitch", metadata !224, i32 33554680, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!700 = metadata !{i32 786689, metadata !693, metadata !"value", metadata !224, i32 50331896, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!701 = metadata !{i32 786689, metadata !693, metadata !"width", metadata !224, i32 67109113, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!702 = metadata !{i32 786689, metadata !693, metadata !"height", metadata !224, i32 83886329, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!703 = metadata !{i32 786689, metadata !693, metadata !"stream", metadata !224, i32 100663545, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!704 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !224, i32 253, metadata !705, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!705 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !706, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!706 = metadata !{metadata !227, metadata !330, metadata !28, metadata !237}
!707 = metadata !{metadata !708}
!708 = metadata !{metadata !709, metadata !710, metadata !711}
!709 = metadata !{i32 786689, metadata !704, metadata !"pitchedDevPtr", metadata !224, i32 16777469, metadata !330, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!710 = metadata !{i32 786689, metadata !704, metadata !"value", metadata !224, i32 33554685, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!711 = metadata !{i32 786689, metadata !704, metadata !"extent", metadata !224, i32 50331902, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!712 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !224, i32 258, metadata !713, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!713 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !714, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!714 = metadata !{metadata !227, metadata !330, metadata !28, metadata !237, metadata !412}
!715 = metadata !{metadata !716}
!716 = metadata !{metadata !717, metadata !718, metadata !719, metadata !720}
!717 = metadata !{i32 786689, metadata !712, metadata !"pitchedDevPtr", metadata !224, i32 16777474, metadata !330, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!718 = metadata !{i32 786689, metadata !712, metadata !"value", metadata !224, i32 33554690, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!719 = metadata !{i32 786689, metadata !712, metadata !"extent", metadata !224, i32 50331907, metadata !237, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!720 = metadata !{i32 786689, metadata !712, metadata !"stream", metadata !224, i32 67109123, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!721 = metadata !{i32 786478, i32 0, metadata !224, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !224, i32 263, metadata !722, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!722 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !723, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!723 = metadata !{metadata !227, metadata !86, metadata !28, metadata !240, metadata !412}
!724 = metadata !{metadata !725}
!725 = metadata !{metadata !726, metadata !727, metadata !728, metadata !729}
!726 = metadata !{i32 786689, metadata !721, metadata !"devPtr", metadata !224, i32 16777479, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!727 = metadata !{i32 786689, metadata !721, metadata !"value", metadata !224, i32 33554695, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!728 = metadata !{i32 786689, metadata !721, metadata !"count", metadata !224, i32 50331911, metadata !240, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!729 = metadata !{i32 786689, metadata !721, metadata !"stream", metadata !224, i32 67109127, metadata !412, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!730 = metadata !{i32 13, i32 0, metadata !731, null}
!731 = metadata !{i32 786443, metadata !15, i32 12, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!732 = metadata !{i32 18, i32 0, metadata !733, null}
!733 = metadata !{i32 786443, metadata !22, i32 17, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!734 = metadata !{i32 24, i32 0, metadata !735, null}
!735 = metadata !{i32 786443, metadata !23, i32 21, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!736 = metadata !{i32 25, i32 0, metadata !735, null}
!737 = metadata !{i32 27, i32 0, metadata !735, null}
!738 = metadata !{i32 28, i32 0, metadata !735, null}
!739 = metadata !{i32 33, i32 0, metadata !740, null}
!740 = metadata !{i32 786443, metadata !29, i32 31, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!741 = metadata !{i32 34, i32 0, metadata !740, null}
!742 = metadata !{i32 36, i32 0, metadata !740, null}
!743 = metadata !{i32 38, i32 0, metadata !744, null}
!744 = metadata !{i32 786443, metadata !740, i32 37, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!745 = metadata !{i32 39, i32 0, metadata !744, null}
!746 = metadata !{i32 40, i32 0, metadata !744, null}
!747 = metadata !{i32 41, i32 0, metadata !744, null}
!748 = metadata !{i32 42, i32 0, metadata !740, null}
!749 = metadata !{i32 46, i32 0, metadata !750, null}
!750 = metadata !{i32 786443, metadata !32, i32 44, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!751 = metadata !{i32 51, i32 0, metadata !752, null}
!752 = metadata !{i32 786443, metadata !35, i32 49, i32 0, metadata !16, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!753 = metadata !{i32 59, i32 0, metadata !752, null}
!754 = metadata !{i32 60, i32 0, metadata !752, null}
!755 = metadata !{i32 62, i32 0, metadata !752, null}
!756 = metadata !{i32 63, i32 0, metadata !752, null}
!757 = metadata !{i32 65, i32 0, metadata !758, null}
!758 = metadata !{i32 786443, metadata !752, i32 65, i32 0, metadata !16, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!759 = metadata !{i32 66, i32 0, metadata !760, null}
!760 = metadata !{i32 786443, metadata !758, i32 65, i32 0, metadata !16, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!761 = metadata !{i32 67, i32 0, metadata !760, null}
!762 = metadata !{i32 70, i32 0, metadata !752, null}
!763 = metadata !{i32 72, i32 0, metadata !752, null}
!764 = metadata !{i32 74, i32 0, metadata !752, null}
!765 = metadata !{i32 75, i32 0, metadata !766, null}
!766 = metadata !{i32 786443, metadata !752, i32 75, i32 0, metadata !16, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!767 = metadata !{i32 77, i32 0, metadata !766, null}
!768 = metadata !{i32 81, i32 0, metadata !752, null}
!769 = metadata !{i32 84, i32 0, metadata !770, null}
!770 = metadata !{i32 786443, metadata !752, i32 84, i32 0, metadata !16, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!771 = metadata !{i32 85, i32 0, metadata !772, null}
!772 = metadata !{i32 786443, metadata !770, i32 84, i32 0, metadata !16, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value/main.cpp]
!773 = metadata !{i32 86, i32 0, metadata !772, null}
!774 = metadata !{i32 87, i32 0, metadata !772, null}
!775 = metadata !{i32 89, i32 0, metadata !772, null}
!776 = metadata !{i32 92, i32 0, metadata !752, null}
!777 = metadata !{i32 93, i32 0, metadata !752, null}
!778 = metadata !{i32 95, i32 0, metadata !752, null}
!779 = metadata !{i32 419, i32 0, metadata !36, null}
!780 = metadata !{i32 419, i32 0, metadata !78, null}
!781 = metadata !{i32 419, i32 0, metadata !782, null}
!782 = metadata !{i32 786443, metadata !78, i32 419, i32 0, metadata !37, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/032_return_value//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!783 = metadata !{i32 16, i32 0, metadata !97, null}
!784 = metadata !{i32 17, i32 0, metadata !97, null}
!785 = metadata !{metadata !"omnipotent char", metadata !786}
!786 = metadata !{metadata !"Simple C/C++ TBAA"}
!787 = metadata !{i32 18, i32 0, metadata !97, null}
!788 = metadata !{i32 14, i32 0, metadata !133, null}
!789 = metadata !{i32 15, i32 0, metadata !133, null}
!790 = metadata !{i32 16, i32 0, metadata !133, null}
!791 = metadata !{i32 26, i32 0, metadata !792, null}
!792 = metadata !{i32 786443, metadata !223, i32 25, i32 0, metadata !224, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!793 = metadata !{i32 30, i32 0, metadata !794, null}
!794 = metadata !{i32 786443, metadata !252, i32 29, i32 0, metadata !224, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!795 = metadata !{i32 31, i32 0, metadata !794, null}
!796 = metadata !{i32 35, i32 0, metadata !797, null}
!797 = metadata !{i32 786443, metadata !258, i32 34, i32 0, metadata !224, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!798 = metadata !{i32 36, i32 0, metadata !797, null}
!799 = metadata !{i32 40, i32 0, metadata !800, null}
!800 = metadata !{i32 786443, metadata !264, i32 39, i32 0, metadata !224, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!801 = metadata !{i32 41, i32 0, metadata !800, null}
!802 = metadata !{i32 45, i32 0, metadata !803, null}
!803 = metadata !{i32 786443, metadata !268, i32 44, i32 0, metadata !224, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!804 = metadata !{i32 49, i32 0, metadata !805, null}
!805 = metadata !{i32 786443, metadata !276, i32 48, i32 0, metadata !224, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!806 = metadata !{i32 53, i32 0, metadata !807, null}
!807 = metadata !{i32 786443, metadata !284, i32 52, i32 0, metadata !224, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!808 = metadata !{i32 57, i32 0, metadata !809, null}
!809 = metadata !{i32 786443, metadata !292, i32 56, i32 0, metadata !224, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!810 = metadata !{i32 61, i32 0, metadata !811, null}
!811 = metadata !{i32 786443, metadata !300, i32 60, i32 0, metadata !224, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!812 = metadata !{i32 65, i32 0, metadata !813, null}
!813 = metadata !{i32 786443, metadata !307, i32 64, i32 0, metadata !224, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!814 = metadata !{i32 69, i32 0, metadata !815, null}
!815 = metadata !{i32 786443, metadata !315, i32 68, i32 0, metadata !224, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!816 = metadata !{i32 73, i32 0, metadata !817, null}
!817 = metadata !{i32 786443, metadata !319, i32 72, i32 0, metadata !224, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!818 = metadata !{i32 74, i32 0, metadata !817, null}
!819 = metadata !{metadata !"any pointer", metadata !785}
!820 = metadata !{i32 75, i32 0, metadata !817, null}
!821 = metadata !{i32 77, i32 0, metadata !817, null}
!822 = metadata !{i32 81, i32 0, metadata !823, null}
!823 = metadata !{i32 786443, metadata !326, i32 80, i32 0, metadata !224, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!824 = metadata !{i32 86, i32 0, metadata !825, null}
!825 = metadata !{i32 786443, metadata !340, i32 85, i32 0, metadata !224, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!826 = metadata !{i32 91, i32 0, metadata !827, null}
!827 = metadata !{i32 786443, metadata !350, i32 90, i32 0, metadata !224, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!828 = metadata !{i32 95, i32 0, metadata !829, null}
!829 = metadata !{i32 786443, metadata !360, i32 94, i32 0, metadata !224, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!830 = metadata !{i32 96, i32 0, metadata !829, null}
!831 = metadata !{i32 97, i32 0, metadata !829, null}
!832 = metadata !{i32 99, i32 0, metadata !829, null}
!833 = metadata !{i32 103, i32 0, metadata !834, null}
!834 = metadata !{i32 786443, metadata !365, i32 102, i32 0, metadata !224, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!835 = metadata !{i32 108, i32 0, metadata !836, null}
!836 = metadata !{i32 786443, metadata !374, i32 106, i32 0, metadata !224, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!837 = metadata !{i32 113, i32 0, metadata !838, null}
!838 = metadata !{i32 786443, metadata !383, i32 112, i32 0, metadata !224, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!839 = metadata !{i32 119, i32 0, metadata !840, null}
!840 = metadata !{i32 786443, metadata !395, i32 118, i32 0, metadata !224, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!841 = metadata !{i32 125, i32 0, metadata !842, null}
!842 = metadata !{i32 786443, metadata !409, i32 124, i32 0, metadata !224, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!843 = metadata !{i32 131, i32 0, metadata !844, null}
!844 = metadata !{i32 786443, metadata !425, i32 130, i32 0, metadata !224, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!845 = metadata !{i32 137, i32 0, metadata !846, null}
!846 = metadata !{i32 786443, metadata !438, i32 136, i32 0, metadata !224, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!847 = metadata !{i32 143, i32 0, metadata !848, null}
!848 = metadata !{i32 786443, metadata !452, i32 142, i32 0, metadata !224, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!849 = metadata !{i32 149, i32 0, metadata !850, null}
!850 = metadata !{i32 786443, metadata !465, i32 148, i32 0, metadata !224, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!851 = metadata !{i32 153, i32 0, metadata !852, null}
!852 = metadata !{i32 786443, metadata !479, i32 152, i32 0, metadata !224, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!853 = metadata !{i32 157, i32 0, metadata !854, null}
!854 = metadata !{i32 786443, metadata !503, i32 156, i32 0, metadata !224, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!855 = metadata !{i32 161, i32 0, metadata !856, null}
!856 = metadata !{i32 786443, metadata !510, i32 160, i32 0, metadata !224, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!857 = metadata !{i32 165, i32 0, metadata !858, null}
!858 = metadata !{i32 786443, metadata !529, i32 164, i32 0, metadata !224, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!859 = metadata !{i32 171, i32 0, metadata !860, null}
!860 = metadata !{i32 786443, metadata !536, i32 170, i32 0, metadata !224, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!861 = metadata !{i32 176, i32 0, metadata !862, null}
!862 = metadata !{i32 786443, metadata !549, i32 175, i32 0, metadata !224, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!863 = metadata !{i32 181, i32 0, metadata !864, null}
!864 = metadata !{i32 786443, metadata !559, i32 180, i32 0, metadata !224, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!865 = metadata !{i32 187, i32 0, metadata !866, null}
!866 = metadata !{i32 786443, metadata !570, i32 186, i32 0, metadata !224, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!867 = metadata !{i32 192, i32 0, metadata !868, null}
!868 = metadata !{i32 786443, metadata !582, i32 191, i32 0, metadata !224, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!869 = metadata !{i32 198, i32 0, metadata !870, null}
!870 = metadata !{i32 786443, metadata !592, i32 197, i32 0, metadata !224, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!871 = metadata !{i32 203, i32 0, metadata !872, null}
!872 = metadata !{i32 786443, metadata !603, i32 201, i32 0, metadata !224, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!873 = metadata !{i32 209, i32 0, metadata !874, null}
!874 = metadata !{i32 786443, metadata !613, i32 207, i32 0, metadata !224, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!875 = metadata !{i32 214, i32 0, metadata !876, null}
!876 = metadata !{i32 786443, metadata !624, i32 213, i32 0, metadata !224, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!877 = metadata !{i32 220, i32 0, metadata !878, null}
!878 = metadata !{i32 786443, metadata !635, i32 219, i32 0, metadata !224, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!879 = metadata !{i32 225, i32 0, metadata !880, null}
!880 = metadata !{i32 786443, metadata !647, i32 224, i32 0, metadata !224, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!881 = metadata !{i32 226, i32 0, metadata !880, null}
!882 = metadata !{i32 231, i32 0, metadata !883, null}
!883 = metadata !{i32 786443, metadata !657, i32 230, i32 0, metadata !224, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!884 = metadata !{i32 235, i32 0, metadata !885, null}
!885 = metadata !{i32 786443, metadata !668, i32 234, i32 0, metadata !224, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!886 = metadata !{i32 239, i32 0, metadata !887, null}
!887 = metadata !{i32 786443, metadata !675, i32 238, i32 0, metadata !224, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!888 = metadata !{i32 240, i32 0, metadata !887, null}
!889 = metadata !{i32 245, i32 0, metadata !890, null}
!890 = metadata !{i32 786443, metadata !683, i32 244, i32 0, metadata !224, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!891 = metadata !{i32 250, i32 0, metadata !892, null}
!892 = metadata !{i32 786443, metadata !693, i32 249, i32 0, metadata !224, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!893 = metadata !{i32 255, i32 0, metadata !894, null}
!894 = metadata !{i32 786443, metadata !704, i32 254, i32 0, metadata !224, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!895 = metadata !{i32 260, i32 0, metadata !896, null}
!896 = metadata !{i32 786443, metadata !712, i32 259, i32 0, metadata !224, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!897 = metadata !{i32 264, i32 0, metadata !898, null}
!898 = metadata !{i32 786443, metadata !721, i32 263, i32 0, metadata !224, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
