; ModuleID = 'main'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [
%struct.cudaIpcEventHandle_st = type { [64 x i8] }
%struct.CUevent_st = type opaque
%struct.cudaIpcMemHandle_st = type { [64 x i8] }
%struct.cudaChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.cudaExtent = type { i64, i64, i64 }
%struct.cudaArray = type opaque
%struct.cudaPitchedPtr = type { i8*, i64, i64, i64 }
%struct.CUstream_st = type opaque
%struct.cudaMemcpy3DParms = type { %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, %struct.cudaExtent, i32 }
%struct.cudaPos = type { i64, i64, i64 }
%struct.cudaMemcpy3DPeerParms = type { %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, i32, %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, i32, %struct.cudaExtent }

@threadIdx = external global %struct.dim3
@.str = private unnamed_addr constant [5 x i8] c"%u; \00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str2 = private unnamed_addr constant [36 x i8] c"Input value: %u, device output: %u\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"(idata[i]!=1)or(odata[i]!=128)\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str17 = private unnamed_addr constant [11 x i8] c"GPU device\00", align 1
@cudaGetErrorString.tmp = private unnamed_addr constant [20 x i8] c"No Error Message\00\00\00\00", align 16
@msg = internal global [25 x i8] zeroinitializer, align 16

define i32 @_Z11bitreverse1j(i32 %number) nounwind uwtable section "__device__" {
  %1 = alloca i32, align 4
  store i32 %number, i32* %1, align 4
  %2 = load i32* %1, align 4, !dbg !1021
  %3 = and i32 -252645136, %2, !dbg !1021
  %4 = lshr i32 %3, 4, !dbg !1021
  %5 = load i32* %1, align 4, !dbg !1021
  %6 = and i32 252645135, %5, !dbg !1021
  %7 = shl i32 %6, 4, !dbg !1021
  %8 = or i32 %4, %7, !dbg !1021
  store i32 %8, i32* %1, align 4, !dbg !1021
  %9 = load i32* %1, align 4, !dbg !1023
  %10 = and i32 -858993460, %9, !dbg !1023
  %11 = lshr i32 %10, 2, !dbg !1023
  %12 = load i32* %1, align 4, !dbg !1023
  %13 = and i32 858993459, %12, !dbg !1023
  %14 = shl i32 %13, 2, !dbg !1023
  %15 = or i32 %11, %14, !dbg !1023
  store i32 %15, i32* %1, align 4, !dbg !1023
  %16 = load i32* %1, align 4, !dbg !1024
  %17 = and i32 -1431655766, %16, !dbg !1024
  %18 = lshr i32 %17, 1, !dbg !1024
  %19 = load i32* %1, align 4, !dbg !1024
  %20 = and i32 1431655765, %19, !dbg !1024
  %21 = shl i32 %20, 1, !dbg !1024
  %22 = or i32 %18, %21, !dbg !1024
  store i32 %22, i32* %1, align 4, !dbg !1024
  %23 = load i32* %1, align 4, !dbg !1025
  ret i32 %23, !dbg !1025
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @_Z10bitreversePv(i8* %data) nounwind uwtable noinline {
  %1 = alloca i8*, align 8
  %idata = alloca i32*, align 8
  store i8* %data, i8** %1, align 8
  %2 = load i8** %1, align 8, !dbg !1026
  %3 = bitcast i8* %2 to i32*, !dbg !1026
  store i32* %3, i32** %idata, align 8, !dbg !1026
  %4 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !1028
  %5 = zext i32 %4 to i64, !dbg !1028
  %6 = load i32** %idata, align 8, !dbg !1028
  %7 = getelementptr inbounds i32* %6, i64 %5, !dbg !1028
  %8 = load i32* %7, align 4, !dbg !1028
  %9 = call i32 @_Z11bitreverse1j(i32 %8), !dbg !1028
  %10 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !1028
  %11 = zext i32 %10 to i64, !dbg !1028
  %12 = load i32** %idata, align 8, !dbg !1028
  %13 = getelementptr inbounds i32* %12, i64 %11, !dbg !1028
  store i32 %9, i32* %13, align 4, !dbg !1028
  ret void, !dbg !1029
}

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %d = alloca i8*, align 8
  %i = alloca i32, align 4
  %idata = alloca [2 x i32], align 4
  %odata = alloca [2 x i32], align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  store i32 0, i32* %1
  store i8* null, i8** %d, align 8, !dbg !1030
  store i32 0, i32* %i, align 4, !dbg !1032
  br label %6, !dbg !1032

; <label>:6                                       ; preds = %9, %0
  %7 = load i32* %i, align 4, !dbg !1032
  %8 = icmp slt i32 %7, 2, !dbg !1032
  br i1 %8, label %9, label %22, !dbg !1032

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4, !dbg !1034
  %11 = add i32 %10, 1, !dbg !1034
  %12 = load i32* %i, align 4, !dbg !1034
  %13 = sext i32 %12 to i64, !dbg !1034
  %14 = getelementptr inbounds [2 x i32]* %idata, i32 0, i64 %13, !dbg !1034
  store i32 %11, i32* %14, align 4, !dbg !1034
  %15 = load i32* %i, align 4, !dbg !1036
  %16 = sext i32 %15 to i64, !dbg !1036
  %17 = getelementptr inbounds [2 x i32]* %idata, i32 0, i64 %16, !dbg !1036
  %18 = load i32* %17, align 4, !dbg !1036
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32 %18), !dbg !1036
  %20 = load i32* %i, align 4, !dbg !1032
  %21 = add nsw i32 %20, 1, !dbg !1032
  store i32 %21, i32* %i, align 4, !dbg !1032
  br label %6, !dbg !1032

; <label>:22                                      ; preds = %6
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !dbg !1037
  %24 = call i32 @cudaMalloc(i8** %d, i64 8), !dbg !1038
  %25 = load i8** %d, align 8, !dbg !1039
  %26 = getelementptr inbounds [2 x i32]* %idata, i32 0, i32 0, !dbg !1039
  %27 = bitcast i32* %26 to i8*, !dbg !1039
  %28 = call i32 @cudaMemcpy(i8* %25, i8* %27, i64 8, i32 1), !dbg !1039
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !1040
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 2, i32 1, i32 1), !dbg !1040
  %29 = bitcast { i64, i32 }* %4 to i8*, !dbg !1040
  %30 = bitcast %struct.dim3* %2 to i8*, !dbg !1040
  %31 = call i8* @memcpy(i8* %29, i8* %30, i64 12)
  %32 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !1040
  %33 = load i64* %32, align 1, !dbg !1040
  %34 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !1040
  %35 = load i32* %34, align 1, !dbg !1040
  %36 = bitcast { i64, i32 }* %5 to i8*, !dbg !1040
  %37 = bitcast %struct.dim3* %3 to i8*, !dbg !1040
  %38 = call i8* @memcpy(i8* %36, i8* %37, i64 12)
  %39 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !1040
  %40 = load i64* %39, align 1, !dbg !1040
  %41 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !1040
  %42 = load i32* %41, align 1, !dbg !1040
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %33, i32 %35, i64 %40, i32 %42, i64 8), !dbg !1040
  %43 = load i8** %d, align 8, !dbg !1042
  call void @_Z10bitreversePv(i8* %43), !dbg !1042
  %44 = call i32 @cudaThreadSynchronize(), !dbg !1043
  %45 = call i32 @cudaGetLastError(), !dbg !1044
  %46 = getelementptr inbounds [2 x i32]* %odata, i32 0, i32 0, !dbg !1045
  %47 = bitcast i32* %46 to i8*, !dbg !1045
  %48 = load i8** %d, align 8, !dbg !1045
  %49 = call i32 @cudaMemcpy(i8* %47, i8* %48, i64 8, i32 2), !dbg !1045
  store i32 0, i32* %i, align 4, !dbg !1046
  br label %50, !dbg !1046

; <label>:50                                      ; preds = %75, %22
  %51 = load i32* %i, align 4, !dbg !1046
  %52 = icmp slt i32 %51, 2, !dbg !1046
  br i1 %52, label %53, label %78, !dbg !1046

; <label>:53                                      ; preds = %50
  %54 = load i32* %i, align 4, !dbg !1048
  %55 = sext i32 %54 to i64, !dbg !1048
  %56 = getelementptr inbounds [2 x i32]* %idata, i32 0, i64 %55, !dbg !1048
  %57 = load i32* %56, align 4, !dbg !1048
  %58 = load i32* %i, align 4, !dbg !1048
  %59 = sext i32 %58 to i64, !dbg !1048
  %60 = getelementptr inbounds [2 x i32]* %odata, i32 0, i64 %59, !dbg !1048
  %61 = load i32* %60, align 4, !dbg !1048
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str2, i32 0, i32 0), i32 %57, i32 %61), !dbg !1048
  %63 = load i32* %i, align 4, !dbg !1050
  %64 = sext i32 %63 to i64, !dbg !1050
  %65 = getelementptr inbounds [2 x i32]* %idata, i32 0, i64 %64, !dbg !1050
  %66 = load i32* %65, align 4, !dbg !1050
  %67 = icmp ne i32 %66, 1, !dbg !1050
  br i1 %67, label %75, label %68, !dbg !1050

; <label>:68                                      ; preds = %53
  %69 = load i32* %i, align 4, !dbg !1050
  %70 = sext i32 %69 to i64, !dbg !1050
  %71 = getelementptr inbounds [2 x i32]* %odata, i32 0, i64 %70, !dbg !1050
  %72 = load i32* %71, align 4, !dbg !1050
  %73 = icmp ne i32 %72, 128, !dbg !1050
  br i1 %73, label %75, label %74, !dbg !1050

; <label>:74                                      ; preds = %68
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32 54, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwi
  unreachable, !dbg !1050

; <label>:75                                      ; preds = %68, %53
  %76 = load i32* %i, align 4, !dbg !1046
  %77 = add nsw i32 %76, 1, !dbg !1046
  store i32 %77, i32* %i, align 4, !dbg !1046
  br label %50, !dbg !1046

; <label>:78                                      ; preds = %50
  %79 = load i8** %d, align 8, !dbg !1051
  %80 = call i32 @cudaFree(i8* %79), !dbg !1051
  %81 = call i32 @cudaDeviceReset(), !dbg !1052
  ret i32 0, !dbg !1053
}

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
  %6 = load i32* %2, align 4, !dbg !1054
  %7 = load i32* %3, align 4, !dbg !1054
  %8 = load i32* %4, align 4, !dbg !1054
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !1054
  ret void, !dbg !1054
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

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
  %6 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 0, !dbg !1055
  %7 = load i32* %2, align 4, !dbg !1055
  store i32 %7, i32* %6, align 4, !dbg !1055
  %8 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 1, !dbg !1055
  %9 = load i32* %3, align 4, !dbg !1055
  store i32 %9, i32* %8, align 4, !dbg !1055
  %10 = getelementptr inbounds %struct.dim3* %5, i32 0, i32 2, !dbg !1055
  %11 = load i32* %4, align 4, !dbg !1055
  store i32 %11, i32* %10, align 4, !dbg !1055
  ret void, !dbg !1056
}

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
  %1 = icmp eq i64 %len, 0, !dbg !1058
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !1058

.lr.ph:                                           ; preds = %.lr.ph, %0
  %src.06 = phi i8* [ %3, %.lr.ph ], [ %srcaddr, %0 ]
  %dest.05 = phi i8* [ %5, %.lr.ph ], [ %destaddr, %0 ]
  %.04 = phi i64 [ %2, %.lr.ph ], [ %len, %0 ]
  %2 = add i64 %.04, -1, !dbg !1058
  %3 = getelementptr inbounds i8* %src.06, i64 1, !dbg !1059
  %4 = load i8* %src.06, align 1, !dbg !1059, !tbaa !1060
  %5 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !1059
  store i8 %4, i8* %dest.05, align 1, !dbg !1059, !tbaa !1060
  %6 = icmp eq i64 %2, 0, !dbg !1058
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !1058

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret i8* %destaddr, !dbg !1062
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
  %1 = icmp eq i64 %count, 0, !dbg !1063
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !1063

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !1064
  br label %3, !dbg !1063

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.05 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.04 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.04, -1, !dbg !1063
  %5 = getelementptr inbounds i8* %a.05, i64 1, !dbg !1064
  store volatile i8 %2, i8* %a.05, align 1, !dbg !1064, !tbaa !1060
  %6 = icmp eq i64 %4, 0, !dbg !1063
  br i1 %6, label %._crit_edge, label %3, !dbg !1063

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !1065
}

define i32 @cudaChooseDevice(i32* nocapture %device, %struct.cudaDeviceProp* nocapture %prop) nounwind uwtable {
  store i32 0, i32* %device, align 4, !dbg !1066, !tbaa !1068
  ret i32 0, !dbg !1069
}

define i32 @cudaDeviceGetByPCIBusId(i32* nocapture %device, i8* nocapture %pciBusId) nounwind uwtable {
  store i32 0, i32* %device, align 4, !dbg !1070, !tbaa !1068
  ret i32 0, !dbg !1072
}

define i32 @cudaDeviceGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !1073
}

define i32 @cudaDeviceGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
  ret i32 0, !dbg !1075
}

define i32 @cudaDeviceGetPCIBusId(i8* nocapture %pciBusId, i32 %len, i32 %device) nounwind uwtable {
  %1 = bitcast i8* %pciBusId to i32*, !dbg !1077
  store i32 3171433, i32* %1, align 1, !dbg !1077
  ret i32 0, !dbg !1079
}

define i32 @cudaDeviceReset() nounwind uwtable readnone {
  ret i32 0, !dbg !1080
}

define i32 @cudaDeviceSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !1082
}

define i32 @cudaDeviceSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
  ret i32 0, !dbg !1084
}

define i32 @cudaDeviceSynchronize() nounwind uwtable readnone {
  ret i32 0, !dbg !1086
}

define i32 @cudaGetDevice(i32* nocapture %device) nounwind uwtable {
  store i32 0, i32* %device, align 4, !dbg !1088, !tbaa !1068
  ret i32 0, !dbg !1090
}

define i32 @cudaGetDeviceCount(i32* nocapture %count) nounwind uwtable {
  store i32 1, i32* %count, align 4, !dbg !1091, !tbaa !1068
  ret i32 0, !dbg !1093
}

define i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nocapture %prop, i32 %device) nounwind uwtable {
  %1 = getelementptr inbounds %struct.cudaDeviceProp* %prop, i64 0, i32 0, i64 0, !dbg !1094
  %2 = call i8* @memcpy(i8* %1, i8* getelementptr inbounds ([11 x i8]* @.str17, i64 0, i64 0), i64 11)
  ret i32 0, !dbg !1096
}

define i32 @cudaIpcCloseMemHandle(i8* nocapture %devPtr) nounwind uwtable readnone {
  ret i32 0, !dbg !1097
}

define i32 @cudaIpcGetEventHandle(%struct.cudaIpcEventHandle_st* nocapture %handle, %struct.CUevent_st* nocapture %event) nounwind uwtable readnone {
  ret i32 0, !dbg !1099
}

define i32 @cudaIpcGetMemHandle(%struct.cudaIpcMemHandle_st* nocapture %handle, i8* nocapture %devPtr) nounwind uwtable readnone {
  ret i32 0, !dbg !1101
}

define i32 @cudaIpcOpenEventHandle(%struct.CUevent_st** nocapture %event, %struct.cudaIpcEventHandle_st* nocapture byval align 8 %handle) nounwind uwtable readnone {
  ret i32 0, !dbg !1103
}

define i32 @cudaIpcOpenMemHandle(i8** nocapture %devPtr, %struct.cudaIpcMemHandle_st* nocapture byval align 8 %handle, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !1105
}

define i32 @cudaSetDevice(i32 %device) nounwind uwtable readnone {
  ret i32 0, !dbg !1107
}

define i32 @cudaSetDeviceFlags(i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !1109
}

define i32 @cudaSetValidDevices(i32* nocapture %device_arr, i32 %len) nounwind uwtable readnone {
  ret i32 0, !dbg !1111
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
  ret i32 0, !dbg !1113
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
  tail call void @free(i8* %devPtr) nounwind, !dbg !1115
  ret i32 0, !dbg !1117
}

declare void @free(i8* nocapture) nounwind

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
  %1 = bitcast %struct.cudaArray* %array to i8*, !dbg !1118
  tail call void @free(i8* %1) nounwind, !dbg !1118
  ret i32 0, !dbg !1120
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
  tail call void @free(i8* %ptr) nounwind, !dbg !1121
  ret i32 0, !dbg !1123
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !1124
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
  ret i32 0, !dbg !1126
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !1128
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !1130
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
  ret i32 0, !dbg !1132
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !1134
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
  ret i32 0, !dbg !1136
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
  tail call void @__set_device(), !dbg !1138
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !1140
  store i8* %1, i8** %devPtr, align 8, !dbg !1140, !tbaa !1141
  tail call void @__clear_device(), !dbg !1142
  ret i32 0, !dbg !1143
}

declare void @__set_device()

declare noalias i8* @malloc(i64) nounwind

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !1144
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !1146
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
  ret i32 0, !dbg !1148
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
  tail call void @__set_host(), !dbg !1150
  %1 = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !1152
  store i8* %1, i8** %ptr, align 8, !dbg !1152, !tbaa !1141
  tail call void @__clear_host(), !dbg !1153
  ret i32 0, !dbg !1154
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !1155
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1157
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !1159
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !1161
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1163
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !1165
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1167
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !1169
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1171
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !1173
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1175
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
  ret i32 0, !dbg !1177
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1179
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !1181
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1183
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !1185
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1187
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !1189
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1191
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1193
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
  %1 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1195
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
  ret i32 0, !dbg !1197
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1199
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
  %1 = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !1201
  %2 = call i8* @memcpy(i8* %1, i8* %src, i64 %count)
  ret i32 0, !dbg !1203
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1204
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
  ret i32 0, !dbg !1206
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
  %1 = trunc i32 %value to i8, !dbg !1208
  %2 = zext i8 %1 to i32
  %3 = call i8* @memset(i8* %devPtr, i32 %2, i64 %count)
  ret i32 0, !dbg !1210
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
  ret i32 0, !dbg !1211
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1213
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
  ret i32 0, !dbg !1215
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1217
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
  ret i32 0, !dbg !1219
}

define i8* @cudaGetErrorString(i32 %error) nounwind uwtable {
  %1 = call i8* @memcpy(i8* getelementptr inbounds ([25 x i8]* @msg, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @cudaGetErrorString.tmp, i64 0, i64 0), i64 17)
  ret i8* getelementptr inbounds ([25 x i8]* @msg, i64 0, i64 0), !dbg !1221
}

define i32 @cudaGetLastError() nounwind uwtable readnone {
  ret i32 0, !dbg !1222
}

define i32 @cudaPeekAtLastError() nounwind uwtable readnone {
  ret i32 0, !dbg !1224
}

define i32 @cudaThreadExit() nounwind uwtable readnone {
  ret i32 0, !dbg !1226
}

define i32 @cudaThreadGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !1228
}

define i32 @cudaThreadGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
  ret i32 0, !dbg !1230
}

define i32 @cudaThreadSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
  ret i32 0, !dbg !1232
}

define i32 @cudaThreadSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
  ret i32 0, !dbg !1234
}

define i32 @cudaThreadSynchronize() nounwind uwtable readnone {
  ret i32 0, !dbg !1236
}

!llvm.dbg.cu = !{!0, !75, !98, !114, !131, !440, !956, !984}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !11, 
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !20, metadata !24, metadata !28, metadata !70}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"bitreverse1", metadata !"bitreverse1", metadata !"_Z11bitreverse1j", metadata !16, i32 10, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @_Z11bitreverse1j, 
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19}
!19 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!20 = metadata !{i32 786478, i32 0, metadata !16, metadata !"bitreverse", metadata !"bitreverse", metadata !"_Z10bitreversePv", metadata !16, i32 18, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @_Z10bitreversePv, n
!21 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{null, metadata !23}
!23 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 24, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 24} ; [ DW_TAG_
!25 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!28 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !29, i32 419, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!29 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass", null} ; [ DW_TAG_file_type ]
!30 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{null, metadata !32, metadata !19, metadata !19, metadata !19}
!32 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!33 = metadata !{i32 786451, null, metadata !"dim3", metadata !29, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !34, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!34 = metadata !{metadata !35, metadata !36, metadata !37, metadata !38, metadata !41, metadata !59, metadata !62, metadata !67}
!35 = metadata !{i32 786445, metadata !33, metadata !"x", metadata !29, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!36 = metadata !{i32 786445, metadata !33, metadata !"y", metadata !29, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !19} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!37 = metadata !{i32 786445, metadata !33, metadata !"z", metadata !29, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !19} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!38 = metadata !{i32 786478, i32 0, metadata !33, metadata !"dim3", metadata !"dim3", metadata !"", metadata !29, i32 419, metadata !30, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !39, i32 419} ; [ DW_TAG_subpr
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!41 = metadata !{i32 786478, i32 0, metadata !33, metadata !"dim3", metadata !"dim3", metadata !"", metadata !29, i32 420, metadata !42, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !39, i32 420} ; [ DW_TAG_subpr
!42 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{null, metadata !32, metadata !44}
!44 = metadata !{i32 786454, null, metadata !"uint3", metadata !29, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!45 = metadata !{i32 786451, null, metadata !"uint3", metadata !29, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !46, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!46 = metadata !{metadata !47, metadata !48, metadata !49, metadata !50, metadata !54}
!47 = metadata !{i32 786445, metadata !45, metadata !"x", metadata !29, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!48 = metadata !{i32 786445, metadata !45, metadata !"y", metadata !29, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !19} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!49 = metadata !{i32 786445, metadata !45, metadata !"z", metadata !29, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !19} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!50 = metadata !{i32 786478, i32 0, metadata !45, metadata !"uint3", metadata !"uint3", metadata !"", metadata !29, i32 188, metadata !51, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !39, i32 188} ; [ DW_TAG_sub
!51 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{null, metadata !53}
!53 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!54 = metadata !{i32 786478, i32 0, metadata !45, metadata !"uint3", metadata !"uint3", metadata !"", metadata !29, i32 188, metadata !55, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !39, i32 188} ; [ DW_TAG_sub
!55 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{null, metadata !53, metadata !57}
!57 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !58} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!59 = metadata !{i32 786478, i32 0, metadata !33, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !29, i32 421, metadata !60, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!60 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{metadata !44, metadata !32}
!62 = metadata !{i32 786478, i32 0, metadata !33, metadata !"dim3", metadata !"dim3", metadata !"", metadata !29, i32 415, metadata !63, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !39, i32 415} ; [ DW_TAG_subpr
!63 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{null, metadata !32, metadata !65}
!65 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!67 = metadata !{i32 786478, i32 0, metadata !33, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !29, i32 415, metadata !68, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !39, i32 415} ; [ DW_TAG_sub
!68 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !69, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!69 = metadata !{null, metadata !32}
!70 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !29, i32 419, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!71 = metadata !{metadata !72}
!72 = metadata !{metadata !73, metadata !73, metadata !73, metadata !73, metadata !73, metadata !73, metadata !73}
!73 = metadata !{i32 786484, i32 0, metadata !16, metadata !"WORK_SIZE", metadata !"WORK_SIZE", metadata !"WORK_SIZE", metadata !16, i32 5, metadata !74, i32 1, i32 1, i32 2} ; [ DW_TAG_variable ] [WORK_SIZE] [line 5] [local] [def]
!74 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!75 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!76 = metadata !{metadata !77}
!77 = metadata !{metadata !78}
!78 = metadata !{i32 786478, i32 0, metadata !79, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !79, i32 12, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !86, i
!79 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!80 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !81, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!81 = metadata !{metadata !23, metadata !23, metadata !82, metadata !84}
!82 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !83} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!83 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = metadata !{i32 786454, null, metadata !"size_t", metadata !79, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!85 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!86 = metadata !{metadata !87}
!87 = metadata !{metadata !88, metadata !89, metadata !90, metadata !91, metadata !95}
!88 = metadata !{i32 786689, metadata !78, metadata !"destaddr", metadata !79, i32 16777228, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!89 = metadata !{i32 786689, metadata !78, metadata !"srcaddr", metadata !79, i32 33554444, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!90 = metadata !{i32 786689, metadata !78, metadata !"len", metadata !79, i32 50331660, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!91 = metadata !{i32 786688, metadata !92, metadata !"dest", metadata !79, i32 13, metadata !93, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!92 = metadata !{i32 786443, metadata !78, i32 12, i32 0, metadata !79, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!93 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !94} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!94 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!95 = metadata !{i32 786688, metadata !92, metadata !"src", metadata !79, i32 14, metadata !96, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!96 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !97} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!97 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !94} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!98 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!99 = metadata !{metadata !100}
!100 = metadata !{metadata !101}
!101 = metadata !{i32 786478, i32 0, metadata !102, metadata !"memmove", metadata !"memmove", metadata !"", metadata !102, i32 12, metadata !103, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !106, i32 12} ; [ DW_TAG
!102 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!103 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !104, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!104 = metadata !{metadata !23, metadata !23, metadata !82, metadata !105}
!105 = metadata !{i32 786454, null, metadata !"size_t", metadata !102, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!106 = metadata !{metadata !107}
!107 = metadata !{metadata !108, metadata !109, metadata !110, metadata !111, metadata !113}
!108 = metadata !{i32 786689, metadata !101, metadata !"dst", metadata !102, i32 16777228, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
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
!120 = metadata !{metadata !23, metadata !23, metadata !27, metadata !121}
!121 = metadata !{i32 786454, null, metadata !"size_t", metadata !118, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!122 = metadata !{metadata !123}
!123 = metadata !{metadata !124, metadata !125, metadata !126, metadata !127}
!124 = metadata !{i32 786689, metadata !117, metadata !"dst", metadata !118, i32 16777228, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!125 = metadata !{i32 786689, metadata !117, metadata !"s", metadata !118, i32 33554444, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!126 = metadata !{i32 786689, metadata !117, metadata !"count", metadata !118, i32 50331660, metadata !121, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!127 = metadata !{i32 786688, metadata !128, metadata !"a", metadata !118, i32 13, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!128 = metadata !{i32 786443, metadata !117, i32 12, i32 0, metadata !118, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!129 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !130} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!130 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !94} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!131 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clan
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
!209 = metadata !{i32 786436, null, metadata !"cudaFuncCache", metadata !135, i32 1007, i64 32, i64 32, i32 0, i32 0, null, metadata !210, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaFuncCache] [line 1007, size 32, align 32, offset 0] [from ]
!210 = metadata !{metadata !211, metadata !212, metadata !213, metadata !214}
!211 = metadata !{i32 786472, metadata !"cudaFuncCachePreferNone", i64 0} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferNone :: 0]
!212 = metadata !{i32 786472, metadata !"cudaFuncCachePreferShared", i64 1} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferShared :: 1]
!213 = metadata !{i32 786472, metadata !"cudaFuncCachePreferL1", i64 2} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferL1 :: 2]
!214 = metadata !{i32 786472, metadata !"cudaFuncCachePreferEqual", i64 3} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferEqual :: 3]
!215 = metadata !{i32 786436, null, metadata !"cudaLimit", metadata !135, i32 1040, i64 32, i64 32, i32 0, i32 0, null, metadata !216, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaLimit] [line 1040, size 32, align 32, offset 0] [from ]
!216 = metadata !{metadata !217, metadata !218, metadata !219, metadata !220, metadata !221}
!217 = metadata !{i32 786472, metadata !"cudaLimitStackSize", i64 0} ; [ DW_TAG_enumerator ] [cudaLimitStackSize :: 0]
!218 = metadata !{i32 786472, metadata !"cudaLimitPrintfFifoSize", i64 1} ; [ DW_TAG_enumerator ] [cudaLimitPrintfFifoSize :: 1]
!219 = metadata !{i32 786472, metadata !"cudaLimitMallocHeapSize", i64 2} ; [ DW_TAG_enumerator ] [cudaLimitMallocHeapSize :: 2]
!220 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimeSyncDepth", i64 3} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimeSyncDepth :: 3]
!221 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimePendingLaunchCount", i64 4} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimePendingLaunchCount :: 4]
!222 = metadata !{metadata !223}
!223 = metadata !{metadata !224, metadata !303, metadata !310, metadata !317, metadata !325, metadata !333, metadata !336, metadata !342, metadata !349, metadata !350, metadata !356, metadata !360, metadata !368, metadata !374, metadata !392, metadata !4
!224 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaChooseDevice", metadata !"cudaChooseDevice", metadata !"", metadata !225, i32 14, metadata !226, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, %struct.cudaDeviceProp
!225 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!226 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !227, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!227 = metadata !{metadata !228, metadata !229, metadata !230}
!228 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !225, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !134} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!229 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!230 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !231} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!231 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !232} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaDeviceProp]
!232 = metadata !{i32 786451, null, metadata !"cudaDeviceProp", metadata !135, i32 1145, i64 4800, i64 64, i32 0, i32 0, null, metadata !233, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaDeviceProp] [line 1145, size 4800, align 64, offset 0] [fr
!233 = metadata !{metadata !234, metadata !238, metadata !240, metadata !241, metadata !242, metadata !243, metadata !244, metadata !245, metadata !249, metadata !250, metadata !251, metadata !252, metadata !253, metadata !254, metadata !255, metadata !2
!234 = metadata !{i32 786445, metadata !232, metadata !"name", metadata !135, i32 1147, i64 2048, i64 8, i64 0, i32 0, metadata !235} ; [ DW_TAG_member ] [name] [line 1147, size 2048, align 8, offset 0] [from ]
!235 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !94, metadata !236, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!236 = metadata !{metadata !237}
!237 = metadata !{i32 786465, i64 0, i64 255}     ; [ DW_TAG_subrange_type ] [0, 255]
!238 = metadata !{i32 786445, metadata !232, metadata !"totalGlobalMem", metadata !135, i32 1148, i64 64, i64 64, i64 2048, i32 0, metadata !239} ; [ DW_TAG_member ] [totalGlobalMem] [line 1148, size 64, align 64, offset 2048] [from size_t]
!239 = metadata !{i32 786454, null, metadata !"size_t", metadata !135, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!240 = metadata !{i32 786445, metadata !232, metadata !"sharedMemPerBlock", metadata !135, i32 1149, i64 64, i64 64, i64 2112, i32 0, metadata !239} ; [ DW_TAG_member ] [sharedMemPerBlock] [line 1149, size 64, align 64, offset 2112] [from size_t]
!241 = metadata !{i32 786445, metadata !232, metadata !"regsPerBlock", metadata !135, i32 1150, i64 32, i64 32, i64 2176, i32 0, metadata !27} ; [ DW_TAG_member ] [regsPerBlock] [line 1150, size 32, align 32, offset 2176] [from int]
!242 = metadata !{i32 786445, metadata !232, metadata !"warpSize", metadata !135, i32 1151, i64 32, i64 32, i64 2208, i32 0, metadata !27} ; [ DW_TAG_member ] [warpSize] [line 1151, size 32, align 32, offset 2208] [from int]
!243 = metadata !{i32 786445, metadata !232, metadata !"memPitch", metadata !135, i32 1152, i64 64, i64 64, i64 2240, i32 0, metadata !239} ; [ DW_TAG_member ] [memPitch] [line 1152, size 64, align 64, offset 2240] [from size_t]
!244 = metadata !{i32 786445, metadata !232, metadata !"maxThreadsPerBlock", metadata !135, i32 1153, i64 32, i64 32, i64 2304, i32 0, metadata !27} ; [ DW_TAG_member ] [maxThreadsPerBlock] [line 1153, size 32, align 32, offset 2304] [from int]
!245 = metadata !{i32 786445, metadata !232, metadata !"maxThreadsDim", metadata !135, i32 1154, i64 96, i64 32, i64 2336, i32 0, metadata !246} ; [ DW_TAG_member ] [maxThreadsDim] [line 1154, size 96, align 32, offset 2336] [from ]
!246 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !27, metadata !247, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!247 = metadata !{metadata !248}
!248 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 2]
!249 = metadata !{i32 786445, metadata !232, metadata !"maxGridSize", metadata !135, i32 1155, i64 96, i64 32, i64 2432, i32 0, metadata !246} ; [ DW_TAG_member ] [maxGridSize] [line 1155, size 96, align 32, offset 2432] [from ]
!250 = metadata !{i32 786445, metadata !232, metadata !"clockRate", metadata !135, i32 1156, i64 32, i64 32, i64 2528, i32 0, metadata !27} ; [ DW_TAG_member ] [clockRate] [line 1156, size 32, align 32, offset 2528] [from int]
!251 = metadata !{i32 786445, metadata !232, metadata !"totalConstMem", metadata !135, i32 1157, i64 64, i64 64, i64 2560, i32 0, metadata !239} ; [ DW_TAG_member ] [totalConstMem] [line 1157, size 64, align 64, offset 2560] [from size_t]
!252 = metadata !{i32 786445, metadata !232, metadata !"major", metadata !135, i32 1158, i64 32, i64 32, i64 2624, i32 0, metadata !27} ; [ DW_TAG_member ] [major] [line 1158, size 32, align 32, offset 2624] [from int]
!253 = metadata !{i32 786445, metadata !232, metadata !"minor", metadata !135, i32 1159, i64 32, i64 32, i64 2656, i32 0, metadata !27} ; [ DW_TAG_member ] [minor] [line 1159, size 32, align 32, offset 2656] [from int]
!254 = metadata !{i32 786445, metadata !232, metadata !"textureAlignment", metadata !135, i32 1160, i64 64, i64 64, i64 2688, i32 0, metadata !239} ; [ DW_TAG_member ] [textureAlignment] [line 1160, size 64, align 64, offset 2688] [from size_t]
!255 = metadata !{i32 786445, metadata !232, metadata !"texturePitchAlignment", metadata !135, i32 1161, i64 64, i64 64, i64 2752, i32 0, metadata !239} ; [ DW_TAG_member ] [texturePitchAlignment] [line 1161, size 64, align 64, offset 2752] [from size_t]
!256 = metadata !{i32 786445, metadata !232, metadata !"deviceOverlap", metadata !135, i32 1162, i64 32, i64 32, i64 2816, i32 0, metadata !27} ; [ DW_TAG_member ] [deviceOverlap] [line 1162, size 32, align 32, offset 2816] [from int]
!257 = metadata !{i32 786445, metadata !232, metadata !"multiProcessorCount", metadata !135, i32 1163, i64 32, i64 32, i64 2848, i32 0, metadata !27} ; [ DW_TAG_member ] [multiProcessorCount] [line 1163, size 32, align 32, offset 2848] [from int]
!258 = metadata !{i32 786445, metadata !232, metadata !"kernelExecTimeoutEnabled", metadata !135, i32 1164, i64 32, i64 32, i64 2880, i32 0, metadata !27} ; [ DW_TAG_member ] [kernelExecTimeoutEnabled] [line 1164, size 32, align 32, offset 2880] [from in
!259 = metadata !{i32 786445, metadata !232, metadata !"integrated", metadata !135, i32 1165, i64 32, i64 32, i64 2912, i32 0, metadata !27} ; [ DW_TAG_member ] [integrated] [line 1165, size 32, align 32, offset 2912] [from int]
!260 = metadata !{i32 786445, metadata !232, metadata !"canMapHostMemory", metadata !135, i32 1166, i64 32, i64 32, i64 2944, i32 0, metadata !27} ; [ DW_TAG_member ] [canMapHostMemory] [line 1166, size 32, align 32, offset 2944] [from int]
!261 = metadata !{i32 786445, metadata !232, metadata !"computeMode", metadata !135, i32 1167, i64 32, i64 32, i64 2976, i32 0, metadata !27} ; [ DW_TAG_member ] [computeMode] [line 1167, size 32, align 32, offset 2976] [from int]
!262 = metadata !{i32 786445, metadata !232, metadata !"maxTexture1D", metadata !135, i32 1168, i64 32, i64 32, i64 3008, i32 0, metadata !27} ; [ DW_TAG_member ] [maxTexture1D] [line 1168, size 32, align 32, offset 3008] [from int]
!263 = metadata !{i32 786445, metadata !232, metadata !"maxTexture1DMipmap", metadata !135, i32 1169, i64 32, i64 32, i64 3040, i32 0, metadata !27} ; [ DW_TAG_member ] [maxTexture1DMipmap] [line 1169, size 32, align 32, offset 3040] [from int]
!264 = metadata !{i32 786445, metadata !232, metadata !"maxTexture1DLinear", metadata !135, i32 1170, i64 32, i64 32, i64 3072, i32 0, metadata !27} ; [ DW_TAG_member ] [maxTexture1DLinear] [line 1170, size 32, align 32, offset 3072] [from int]
!265 = metadata !{i32 786445, metadata !232, metadata !"maxTexture2D", metadata !135, i32 1171, i64 64, i64 32, i64 3104, i32 0, metadata !266} ; [ DW_TAG_member ] [maxTexture2D] [line 1171, size 64, align 32, offset 3104] [from ]
!266 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64, i64 32, i32 0, i32 0, metadata !27, metadata !267, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!267 = metadata !{metadata !268}
!268 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 1]
!269 = metadata !{i32 786445, metadata !232, metadata !"maxTexture2DMipmap", metadata !135, i32 1172, i64 64, i64 32, i64 3168, i32 0, metadata !266} ; [ DW_TAG_member ] [maxTexture2DMipmap] [line 1172, size 64, align 32, offset 3168] [from ]
!270 = metadata !{i32 786445, metadata !232, metadata !"maxTexture2DLinear", metadata !135, i32 1173, i64 96, i64 32, i64 3232, i32 0, metadata !246} ; [ DW_TAG_member ] [maxTexture2DLinear] [line 1173, size 96, align 32, offset 3232] [from ]
!271 = metadata !{i32 786445, metadata !232, metadata !"maxTexture2DGather", metadata !135, i32 1174, i64 64, i64 32, i64 3328, i32 0, metadata !266} ; [ DW_TAG_member ] [maxTexture2DGather] [line 1174, size 64, align 32, offset 3328] [from ]
!272 = metadata !{i32 786445, metadata !232, metadata !"maxTexture3D", metadata !135, i32 1175, i64 96, i64 32, i64 3392, i32 0, metadata !246} ; [ DW_TAG_member ] [maxTexture3D] [line 1175, size 96, align 32, offset 3392] [from ]
!273 = metadata !{i32 786445, metadata !232, metadata !"maxTexture3DAlt", metadata !135, i32 1176, i64 96, i64 32, i64 3488, i32 0, metadata !246} ; [ DW_TAG_member ] [maxTexture3DAlt] [line 1176, size 96, align 32, offset 3488] [from ]
!274 = metadata !{i32 786445, metadata !232, metadata !"maxTextureCubemap", metadata !135, i32 1177, i64 32, i64 32, i64 3584, i32 0, metadata !27} ; [ DW_TAG_member ] [maxTextureCubemap] [line 1177, size 32, align 32, offset 3584] [from int]
!275 = metadata !{i32 786445, metadata !232, metadata !"maxTexture1DLayered", metadata !135, i32 1178, i64 64, i64 32, i64 3616, i32 0, metadata !266} ; [ DW_TAG_member ] [maxTexture1DLayered] [line 1178, size 64, align 32, offset 3616] [from ]
!276 = metadata !{i32 786445, metadata !232, metadata !"maxTexture2DLayered", metadata !135, i32 1179, i64 96, i64 32, i64 3680, i32 0, metadata !246} ; [ DW_TAG_member ] [maxTexture2DLayered] [line 1179, size 96, align 32, offset 3680] [from ]
!277 = metadata !{i32 786445, metadata !232, metadata !"maxTextureCubemapLayered", metadata !135, i32 1180, i64 64, i64 32, i64 3776, i32 0, metadata !266} ; [ DW_TAG_member ] [maxTextureCubemapLayered] [line 1180, size 64, align 32, offset 3776] [from ]
!278 = metadata !{i32 786445, metadata !232, metadata !"maxSurface1D", metadata !135, i32 1181, i64 32, i64 32, i64 3840, i32 0, metadata !27} ; [ DW_TAG_member ] [maxSurface1D] [line 1181, size 32, align 32, offset 3840] [from int]
!279 = metadata !{i32 786445, metadata !232, metadata !"maxSurface2D", metadata !135, i32 1182, i64 64, i64 32, i64 3872, i32 0, metadata !266} ; [ DW_TAG_member ] [maxSurface2D] [line 1182, size 64, align 32, offset 3872] [from ]
!280 = metadata !{i32 786445, metadata !232, metadata !"maxSurface3D", metadata !135, i32 1183, i64 96, i64 32, i64 3936, i32 0, metadata !246} ; [ DW_TAG_member ] [maxSurface3D] [line 1183, size 96, align 32, offset 3936] [from ]
!281 = metadata !{i32 786445, metadata !232, metadata !"maxSurface1DLayered", metadata !135, i32 1184, i64 64, i64 32, i64 4032, i32 0, metadata !266} ; [ DW_TAG_member ] [maxSurface1DLayered] [line 1184, size 64, align 32, offset 4032] [from ]
!282 = metadata !{i32 786445, metadata !232, metadata !"maxSurface2DLayered", metadata !135, i32 1185, i64 96, i64 32, i64 4096, i32 0, metadata !246} ; [ DW_TAG_member ] [maxSurface2DLayered] [line 1185, size 96, align 32, offset 4096] [from ]
!283 = metadata !{i32 786445, metadata !232, metadata !"maxSurfaceCubemap", metadata !135, i32 1186, i64 32, i64 32, i64 4192, i32 0, metadata !27} ; [ DW_TAG_member ] [maxSurfaceCubemap] [line 1186, size 32, align 32, offset 4192] [from int]
!284 = metadata !{i32 786445, metadata !232, metadata !"maxSurfaceCubemapLayered", metadata !135, i32 1187, i64 64, i64 32, i64 4224, i32 0, metadata !266} ; [ DW_TAG_member ] [maxSurfaceCubemapLayered] [line 1187, size 64, align 32, offset 4224] [from ]
!285 = metadata !{i32 786445, metadata !232, metadata !"surfaceAlignment", metadata !135, i32 1188, i64 64, i64 64, i64 4288, i32 0, metadata !239} ; [ DW_TAG_member ] [surfaceAlignment] [line 1188, size 64, align 64, offset 4288] [from size_t]
!286 = metadata !{i32 786445, metadata !232, metadata !"concurrentKernels", metadata !135, i32 1189, i64 32, i64 32, i64 4352, i32 0, metadata !27} ; [ DW_TAG_member ] [concurrentKernels] [line 1189, size 32, align 32, offset 4352] [from int]
!287 = metadata !{i32 786445, metadata !232, metadata !"ECCEnabled", metadata !135, i32 1190, i64 32, i64 32, i64 4384, i32 0, metadata !27} ; [ DW_TAG_member ] [ECCEnabled] [line 1190, size 32, align 32, offset 4384] [from int]
!288 = metadata !{i32 786445, metadata !232, metadata !"pciBusID", metadata !135, i32 1191, i64 32, i64 32, i64 4416, i32 0, metadata !27} ; [ DW_TAG_member ] [pciBusID] [line 1191, size 32, align 32, offset 4416] [from int]
!289 = metadata !{i32 786445, metadata !232, metadata !"pciDeviceID", metadata !135, i32 1192, i64 32, i64 32, i64 4448, i32 0, metadata !27} ; [ DW_TAG_member ] [pciDeviceID] [line 1192, size 32, align 32, offset 4448] [from int]
!290 = metadata !{i32 786445, metadata !232, metadata !"pciDomainID", metadata !135, i32 1193, i64 32, i64 32, i64 4480, i32 0, metadata !27} ; [ DW_TAG_member ] [pciDomainID] [line 1193, size 32, align 32, offset 4480] [from int]
!291 = metadata !{i32 786445, metadata !232, metadata !"tccDriver", metadata !135, i32 1194, i64 32, i64 32, i64 4512, i32 0, metadata !27} ; [ DW_TAG_member ] [tccDriver] [line 1194, size 32, align 32, offset 4512] [from int]
!292 = metadata !{i32 786445, metadata !232, metadata !"asyncEngineCount", metadata !135, i32 1195, i64 32, i64 32, i64 4544, i32 0, metadata !27} ; [ DW_TAG_member ] [asyncEngineCount] [line 1195, size 32, align 32, offset 4544] [from int]
!293 = metadata !{i32 786445, metadata !232, metadata !"unifiedAddressing", metadata !135, i32 1196, i64 32, i64 32, i64 4576, i32 0, metadata !27} ; [ DW_TAG_member ] [unifiedAddressing] [line 1196, size 32, align 32, offset 4576] [from int]
!294 = metadata !{i32 786445, metadata !232, metadata !"memoryClockRate", metadata !135, i32 1197, i64 32, i64 32, i64 4608, i32 0, metadata !27} ; [ DW_TAG_member ] [memoryClockRate] [line 1197, size 32, align 32, offset 4608] [from int]
!295 = metadata !{i32 786445, metadata !232, metadata !"memoryBusWidth", metadata !135, i32 1198, i64 32, i64 32, i64 4640, i32 0, metadata !27} ; [ DW_TAG_member ] [memoryBusWidth] [line 1198, size 32, align 32, offset 4640] [from int]
!296 = metadata !{i32 786445, metadata !232, metadata !"l2CacheSize", metadata !135, i32 1199, i64 32, i64 32, i64 4672, i32 0, metadata !27} ; [ DW_TAG_member ] [l2CacheSize] [line 1199, size 32, align 32, offset 4672] [from int]
!297 = metadata !{i32 786445, metadata !232, metadata !"maxThreadsPerMultiProcessor", metadata !135, i32 1200, i64 32, i64 32, i64 4704, i32 0, metadata !27} ; [ DW_TAG_member ] [maxThreadsPerMultiProcessor] [line 1200, size 32, align 32, offset 4704] [f
!298 = metadata !{i32 786445, metadata !232, metadata !"streamPrioritiesSupported", metadata !135, i32 1201, i64 32, i64 32, i64 4736, i32 0, metadata !27} ; [ DW_TAG_member ] [streamPrioritiesSupported] [line 1201, size 32, align 32, offset 4736] [from 
!299 = metadata !{metadata !300}
!300 = metadata !{metadata !301, metadata !302}
!301 = metadata !{i32 786689, metadata !224, metadata !"device", metadata !225, i32 16777230, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 14]
!302 = metadata !{i32 786689, metadata !224, metadata !"prop", metadata !225, i32 33554446, metadata !230, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 14]
!303 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaDeviceGetByPCIBusId", metadata !"cudaDeviceGetByPCIBusId", metadata !"", metadata !225, i32 19, metadata !304, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @c
!304 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !305, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!305 = metadata !{metadata !228, metadata !229, metadata !93}
!306 = metadata !{metadata !307}
!307 = metadata !{metadata !308, metadata !309}
!308 = metadata !{i32 786689, metadata !303, metadata !"device", metadata !225, i32 16777235, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 19]
!309 = metadata !{i32 786689, metadata !303, metadata !"pciBusId", metadata !225, i32 33554451, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 19]
!310 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaDeviceGetCacheConfig", metadata !"cudaDeviceGetCacheConfig", metadata !"", metadata !225, i32 24, metadata !311, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cuda
!311 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !312, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!312 = metadata !{metadata !228, metadata !313}
!313 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !209} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaFuncCache]
!314 = metadata !{metadata !315}
!315 = metadata !{metadata !316}
!316 = metadata !{i32 786689, metadata !310, metadata !"pCacheConfig", metadata !225, i32 16777240, metadata !313, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 24]
!317 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaDeviceGetLimit", metadata !"cudaDeviceGetLimit", metadata !"", metadata !225, i32 28, metadata !318, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaDeviceG
!318 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !319, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!319 = metadata !{metadata !228, metadata !320, metadata !215}
!320 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!321 = metadata !{metadata !322}
!322 = metadata !{metadata !323, metadata !324}
!323 = metadata !{i32 786689, metadata !317, metadata !"pValue", metadata !225, i32 16777244, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 28]
!324 = metadata !{i32 786689, metadata !317, metadata !"limit", metadata !225, i32 33554460, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 28]
!325 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaDeviceGetPCIBusId", metadata !"cudaDeviceGetPCIBusId", metadata !"", metadata !225, i32 32, metadata !326, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @c
!326 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !327, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!327 = metadata !{metadata !228, metadata !93, metadata !27, metadata !27}
!328 = metadata !{metadata !329}
!329 = metadata !{metadata !330, metadata !331, metadata !332}
!330 = metadata !{i32 786689, metadata !325, metadata !"pciBusId", metadata !225, i32 16777248, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 32]
!331 = metadata !{i32 786689, metadata !325, metadata !"len", metadata !225, i32 33554464, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 32]
!332 = metadata !{i32 786689, metadata !325, metadata !"device", metadata !225, i32 50331680, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 32]
!333 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaDeviceReset", metadata !"cudaDeviceReset", metadata !"", metadata !225, i32 37, metadata !334, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDeviceReset, null, nul
!334 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !335, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!335 = metadata !{metadata !228}
!336 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaDeviceSetCacheConfig", metadata !"cudaDeviceSetCacheConfig", metadata !"", metadata !225, i32 41, metadata !337, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaD
!337 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !338, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!338 = metadata !{metadata !228, metadata !209}
!339 = metadata !{metadata !340}
!340 = metadata !{metadata !341}
!341 = metadata !{i32 786689, metadata !336, metadata !"cacheConfig", metadata !225, i32 16777257, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 41]
!342 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaDeviceSetLimit", metadata !"cudaDeviceSetLimit", metadata !"", metadata !225, i32 45, metadata !343, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaDeviceSe
!343 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !344, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!344 = metadata !{metadata !228, metadata !215, metadata !239}
!345 = metadata !{metadata !346}
!346 = metadata !{metadata !347, metadata !348}
!347 = metadata !{i32 786689, metadata !342, metadata !"limit", metadata !225, i32 16777261, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 45]
!348 = metadata !{i32 786689, metadata !342, metadata !"value", metadata !225, i32 33554477, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 45]
!349 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaDeviceSynchronize", metadata !"cudaDeviceSynchronize", metadata !"", metadata !225, i32 49, metadata !334, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDeviceSync
!350 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaGetDevice", metadata !"cudaGetDevice", metadata !"", metadata !225, i32 53, metadata !351, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDevice, null, null,
!351 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !352, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!352 = metadata !{metadata !228, metadata !229}
!353 = metadata !{metadata !354}
!354 = metadata !{metadata !355}
!355 = metadata !{i32 786689, metadata !350, metadata !"device", metadata !225, i32 16777269, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 53]
!356 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaGetDeviceCount", metadata !"cudaGetDeviceCount", metadata !"", metadata !225, i32 58, metadata !351, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDeviceCou
!357 = metadata !{metadata !358}
!358 = metadata !{metadata !359}
!359 = metadata !{i32 786689, metadata !356, metadata !"count", metadata !225, i32 16777274, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 58]
!360 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaGetDeviceProperties", metadata !"cudaGetDeviceProperties", metadata !"", metadata !225, i32 63, metadata !361, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaDe
!361 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !362, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!362 = metadata !{metadata !228, metadata !363, metadata !27}
!363 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !232} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaDeviceProp]
!364 = metadata !{metadata !365}
!365 = metadata !{metadata !366, metadata !367}
!366 = metadata !{i32 786689, metadata !360, metadata !"prop", metadata !225, i32 16777279, metadata !363, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 63]
!367 = metadata !{i32 786689, metadata !360, metadata !"device", metadata !225, i32 33554495, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 63]
!368 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaIpcCloseMemHandle", metadata !"cudaIpcCloseMemHandle", metadata !"", metadata !225, i32 68, metadata !369, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaIpcClos
!369 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !370, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!370 = metadata !{metadata !228, metadata !23}
!371 = metadata !{metadata !372}
!372 = metadata !{metadata !373}
!373 = metadata !{i32 786689, metadata !368, metadata !"devPtr", metadata !225, i32 16777284, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 68]
!374 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaIpcGetEventHandle", metadata !"cudaIpcGetEventHandle", metadata !"", metadata !225, i32 72, metadata !375, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIpcEve
!375 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !376, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!376 = metadata !{metadata !228, metadata !377, metadata !385}
!377 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !378} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcEventHandle_t]
!378 = metadata !{i32 786454, null, metadata !"cudaIpcEventHandle_t", metadata !225, i32 1274, i64 0, i64 0, i64 0, i32 0, metadata !379} ; [ DW_TAG_typedef ] [cudaIpcEventHandle_t] [line 1274, size 0, align 0, offset 0] [from cudaIpcEventHandle_st]
!379 = metadata !{i32 786451, null, metadata !"cudaIpcEventHandle_st", metadata !135, i32 1271, i64 512, i64 8, i32 0, i32 0, null, metadata !380, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcEventHandle_st] [line 1271, size 512, align 8, off
!380 = metadata !{metadata !381}
!381 = metadata !{i32 786445, metadata !379, metadata !"reserved", metadata !135, i32 1273, i64 512, i64 8, i64 0, i32 0, metadata !382} ; [ DW_TAG_member ] [reserved] [line 1273, size 512, align 8, offset 0] [from ]
!382 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 8, i32 0, i32 0, metadata !94, metadata !383, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!383 = metadata !{metadata !384}
!384 = metadata !{i32 786465, i64 0, i64 63}      ; [ DW_TAG_subrange_type ] [0, 63]
!385 = metadata !{i32 786454, null, metadata !"cudaEvent_t", metadata !225, i32 1303, i64 0, i64 0, i64 0, i32 0, metadata !386} ; [ DW_TAG_typedef ] [cudaEvent_t] [line 1303, size 0, align 0, offset 0] [from ]
!386 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !387} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUevent_st]
!387 = metadata !{i32 786451, null, metadata !"CUevent_st", metadata !135, i32 1303, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUevent_st] [line 1303, size 0, align 0, offset 0] [fwd] [from ]
!388 = metadata !{metadata !389}
!389 = metadata !{metadata !390, metadata !391}
!390 = metadata !{i32 786689, metadata !374, metadata !"handle", metadata !225, i32 16777288, metadata !377, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 72]
!391 = metadata !{i32 786689, metadata !374, metadata !"event", metadata !225, i32 33554504, metadata !385, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 72]
!392 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaIpcGetMemHandle", metadata !"cudaIpcGetMemHandle", metadata !"", metadata !225, i32 76, metadata !393, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIpcMemHand
!393 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !394, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!394 = metadata !{metadata !228, metadata !395, metadata !23}
!395 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !396} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcMemHandle_t]
!396 = metadata !{i32 786454, null, metadata !"cudaIpcMemHandle_t", metadata !225, i32 1282, i64 0, i64 0, i64 0, i32 0, metadata !397} ; [ DW_TAG_typedef ] [cudaIpcMemHandle_t] [line 1282, size 0, align 0, offset 0] [from cudaIpcMemHandle_st]
!397 = metadata !{i32 786451, null, metadata !"cudaIpcMemHandle_st", metadata !135, i32 1279, i64 512, i64 8, i32 0, i32 0, null, metadata !398, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcMemHandle_st] [line 1279, size 512, align 8, offset 
!398 = metadata !{metadata !399}
!399 = metadata !{i32 786445, metadata !397, metadata !"reserved", metadata !135, i32 1281, i64 512, i64 8, i64 0, i32 0, metadata !382} ; [ DW_TAG_member ] [reserved] [line 1281, size 512, align 8, offset 0] [from ]
!400 = metadata !{metadata !401}
!401 = metadata !{metadata !402, metadata !403}
!402 = metadata !{i32 786689, metadata !392, metadata !"handle", metadata !225, i32 16777292, metadata !395, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 76]
!403 = metadata !{i32 786689, metadata !392, metadata !"devPtr", metadata !225, i32 33554508, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 76]
!404 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaIpcOpenEventHandle", metadata !"cudaIpcOpenEventHandle", metadata !"", metadata !225, i32 80, metadata !405, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.CUevent_
!405 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !406, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!406 = metadata !{metadata !228, metadata !407, metadata !378}
!407 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !385} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaEvent_t]
!408 = metadata !{metadata !409}
!409 = metadata !{metadata !410, metadata !411}
!410 = metadata !{i32 786689, metadata !404, metadata !"event", metadata !225, i32 16777296, metadata !407, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 80]
!411 = metadata !{i32 786689, metadata !404, metadata !"handle", metadata !225, i32 33554512, metadata !378, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 80]
!412 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaIpcOpenMemHandle", metadata !"cudaIpcOpenMemHandle", metadata !"", metadata !225, i32 84, metadata !413, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, %struct.cudaIp
!413 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !414, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!414 = metadata !{metadata !228, metadata !415, metadata !396, metadata !19}
!415 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!416 = metadata !{metadata !417}
!417 = metadata !{metadata !418, metadata !419, metadata !420}
!418 = metadata !{i32 786689, metadata !412, metadata !"devPtr", metadata !225, i32 16777300, metadata !415, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 84]
!419 = metadata !{i32 786689, metadata !412, metadata !"handle", metadata !225, i32 33554516, metadata !396, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 84]
!420 = metadata !{i32 786689, metadata !412, metadata !"flags", metadata !225, i32 50331732, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 84]
!421 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaSetDevice", metadata !"cudaSetDevice", metadata !"", metadata !225, i32 88, metadata !422, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDevice, null, null, 
!422 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !423, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!423 = metadata !{metadata !228, metadata !27}
!424 = metadata !{metadata !425}
!425 = metadata !{metadata !426}
!426 = metadata !{i32 786689, metadata !421, metadata !"device", metadata !225, i32 16777304, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 88]
!427 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaSetDeviceFlags", metadata !"cudaSetDeviceFlags", metadata !"", metadata !225, i32 92, metadata !428, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDeviceFlag
!428 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !429, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!429 = metadata !{metadata !228, metadata !19}
!430 = metadata !{metadata !431}
!431 = metadata !{metadata !432}
!432 = metadata !{i32 786689, metadata !427, metadata !"flags", metadata !225, i32 16777308, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 92]
!433 = metadata !{i32 786478, i32 0, metadata !225, metadata !"cudaSetValidDevices", metadata !"cudaSetValidDevices", metadata !"", metadata !225, i32 96, metadata !434, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i32)* @cudaSetVa
!434 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !435, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!435 = metadata !{metadata !228, metadata !229, metadata !27}
!436 = metadata !{metadata !437}
!437 = metadata !{metadata !438, metadata !439}
!438 = metadata !{i32 786689, metadata !433, metadata !"device_arr", metadata !225, i32 16777312, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device_arr] [line 96]
!439 = metadata !{i32 786689, metadata !433, metadata !"len", metadata !225, i32 33554528, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 96]
!440 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!441 = metadata !{metadata !442}
!442 = metadata !{metadata !134, metadata !443, metadata !449}
!443 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !135, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !444, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!444 = metadata !{metadata !445, metadata !446, metadata !447, metadata !448}
!445 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!446 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!447 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!448 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!449 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !135, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!450 = metadata !{metadata !451}
!451 = metadata !{metadata !452, metadata !480, metadata !486, metadata !492, metadata !496, metadata !503, metadata !510, metadata !518, metadata !526, metadata !533, metadata !541, metadata !545, metadata !552, metadata !566, metadata !576, metadata !5
!452 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !453, i32 24, metadata !454, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!453 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!454 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !455, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!455 = metadata !{metadata !456, metadata !457, metadata !465, metadata !471, metadata !472}
!456 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !453, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !134} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!457 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !458} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!458 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !135, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !459, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!459 = metadata !{metadata !460, metadata !461, metadata !462, metadata !463, metadata !464}
!460 = metadata !{i32 786445, metadata !458, metadata !"x", metadata !135, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !27} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!461 = metadata !{i32 786445, metadata !458, metadata !"y", metadata !135, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !27} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!462 = metadata !{i32 786445, metadata !458, metadata !"z", metadata !135, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !27} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!463 = metadata !{i32 786445, metadata !458, metadata !"w", metadata !135, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !27} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!464 = metadata !{i32 786445, metadata !458, metadata !"f", metadata !135, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !443} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!465 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !466} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!466 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !135, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !467, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!467 = metadata !{metadata !468, metadata !469, metadata !470}
!468 = metadata !{i32 786445, metadata !466, metadata !"width", metadata !135, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!469 = metadata !{i32 786445, metadata !466, metadata !"height", metadata !135, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !239} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!470 = metadata !{i32 786445, metadata !466, metadata !"depth", metadata !135, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !239} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!471 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!472 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !473} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!473 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !135, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!474 = metadata !{metadata !475}
!475 = metadata !{metadata !476, metadata !477, metadata !478, metadata !479}
!476 = metadata !{i32 786689, metadata !452, metadata !"desc", metadata !453, i32 16777240, metadata !457, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!477 = metadata !{i32 786689, metadata !452, metadata !"extent", metadata !453, i32 33554456, metadata !465, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!478 = metadata !{i32 786689, metadata !452, metadata !"flags", metadata !453, i32 50331673, metadata !471, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!479 = metadata !{i32 786689, metadata !452, metadata !"array", metadata !453, i32 67108889, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!480 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !453, i32 29, metadata !481, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !483, 
!481 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !482, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!482 = metadata !{metadata !456, metadata !23}
!483 = metadata !{metadata !484}
!484 = metadata !{metadata !485}
!485 = metadata !{i32 786689, metadata !480, metadata !"devPtr", metadata !453, i32 16777245, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!486 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !453, i32 34, metadata !487, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!487 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !488, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!488 = metadata !{metadata !456, metadata !472}
!489 = metadata !{metadata !490}
!490 = metadata !{metadata !491}
!491 = metadata !{i32 786689, metadata !486, metadata !"array", metadata !453, i32 16777250, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!492 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !453, i32 39, metadata !481, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!493 = metadata !{metadata !494}
!494 = metadata !{metadata !495}
!495 = metadata !{i32 786689, metadata !492, metadata !"ptr", metadata !453, i32 16777255, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!496 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !453, i32 44, metadata !497, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!497 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !498, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!498 = metadata !{metadata !456, metadata !415, metadata !96}
!499 = metadata !{metadata !500}
!500 = metadata !{metadata !501, metadata !502}
!501 = metadata !{i32 786689, metadata !496, metadata !"devPtr", metadata !453, i32 16777260, metadata !415, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!502 = metadata !{i32 786689, metadata !496, metadata !"symbol", metadata !453, i32 33554476, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!503 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !453, i32 48, metadata !504, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!504 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !505, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!505 = metadata !{metadata !456, metadata !320, metadata !96}
!506 = metadata !{metadata !507}
!507 = metadata !{metadata !508, metadata !509}
!508 = metadata !{i32 786689, metadata !503, metadata !"size", metadata !453, i32 16777264, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!509 = metadata !{i32 786689, metadata !503, metadata !"symbol", metadata !453, i32 33554480, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!510 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !453, i32 52, metadata !511, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!511 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !512, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!512 = metadata !{metadata !456, metadata !415, metadata !239, metadata !19}
!513 = metadata !{metadata !514}
!514 = metadata !{metadata !515, metadata !516, metadata !517}
!515 = metadata !{i32 786689, metadata !510, metadata !"pHost", metadata !453, i32 16777268, metadata !415, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!516 = metadata !{i32 786689, metadata !510, metadata !"size", metadata !453, i32 33554484, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!517 = metadata !{i32 786689, metadata !510, metadata !"flags", metadata !453, i32 50331700, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!518 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !453, i32 56, metadata !519, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!519 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !520, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!520 = metadata !{metadata !456, metadata !415, metadata !23, metadata !19}
!521 = metadata !{metadata !522}
!522 = metadata !{metadata !523, metadata !524, metadata !525}
!523 = metadata !{i32 786689, metadata !518, metadata !"pDevice", metadata !453, i32 16777272, metadata !415, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!524 = metadata !{i32 786689, metadata !518, metadata !"pHost", metadata !453, i32 33554488, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!525 = metadata !{i32 786689, metadata !518, metadata !"flags", metadata !453, i32 50331704, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!526 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !453, i32 60, metadata !527, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!527 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !528, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!528 = metadata !{metadata !456, metadata !471, metadata !23}
!529 = metadata !{metadata !530}
!530 = metadata !{metadata !531, metadata !532}
!531 = metadata !{i32 786689, metadata !526, metadata !"pFlags", metadata !453, i32 16777276, metadata !471, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!532 = metadata !{i32 786689, metadata !526, metadata !"pHost", metadata !453, i32 33554492, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!533 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !453, i32 64, metadata !534, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!534 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !535, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!535 = metadata !{metadata !456, metadata !23, metadata !239, metadata !19}
!536 = metadata !{metadata !537}
!537 = metadata !{metadata !538, metadata !539, metadata !540}
!538 = metadata !{i32 786689, metadata !533, metadata !"ptr", metadata !453, i32 16777280, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!539 = metadata !{i32 786689, metadata !533, metadata !"size", metadata !453, i32 33554496, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!540 = metadata !{i32 786689, metadata !533, metadata !"flags", metadata !453, i32 50331712, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!541 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !453, i32 68, metadata !481, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!542 = metadata !{metadata !543}
!543 = metadata !{metadata !544}
!544 = metadata !{i32 786689, metadata !541, metadata !"ptr", metadata !453, i32 16777284, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!545 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !453, i32 72, metadata !546, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!546 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !547, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!547 = metadata !{metadata !456, metadata !415, metadata !239}
!548 = metadata !{metadata !549}
!549 = metadata !{metadata !550, metadata !551}
!550 = metadata !{i32 786689, metadata !545, metadata !"devPtr", metadata !453, i32 16777288, metadata !415, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!551 = metadata !{i32 786689, metadata !545, metadata !"size", metadata !453, i32 33554504, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!552 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !453, i32 80, metadata !553, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!553 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !554, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!554 = metadata !{metadata !456, metadata !555, metadata !466}
!555 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !556} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!556 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !135, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !557, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!557 = metadata !{metadata !558, metadata !559, metadata !560, metadata !561}
!558 = metadata !{i32 786445, metadata !556, metadata !"ptr", metadata !135, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!559 = metadata !{i32 786445, metadata !556, metadata !"pitch", metadata !135, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !239} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!560 = metadata !{i32 786445, metadata !556, metadata !"xsize", metadata !135, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !239} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!561 = metadata !{i32 786445, metadata !556, metadata !"ysize", metadata !135, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !239} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!562 = metadata !{metadata !563}
!563 = metadata !{metadata !564, metadata !565}
!564 = metadata !{i32 786689, metadata !552, metadata !"pitchedDevPtr", metadata !453, i32 16777296, metadata !555, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!565 = metadata !{i32 786689, metadata !552, metadata !"extent", metadata !453, i32 33554512, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!566 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !453, i32 84, metadata !567, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!567 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !568, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!568 = metadata !{metadata !456, metadata !569, metadata !457, metadata !466, metadata !19}
!569 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !472} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!570 = metadata !{metadata !571}
!571 = metadata !{metadata !572, metadata !573, metadata !574, metadata !575}
!572 = metadata !{i32 786689, metadata !566, metadata !"array", metadata !453, i32 16777300, metadata !569, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!573 = metadata !{i32 786689, metadata !566, metadata !"desc", metadata !453, i32 33554516, metadata !457, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!574 = metadata !{i32 786689, metadata !566, metadata !"extent", metadata !453, i32 50331733, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!575 = metadata !{i32 786689, metadata !566, metadata !"flags", metadata !453, i32 67108949, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!576 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !453, i32 89, metadata !577, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!577 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !578, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!578 = metadata !{metadata !456, metadata !569, metadata !457, metadata !239, metadata !239, metadata !19}
!579 = metadata !{metadata !580}
!580 = metadata !{metadata !581, metadata !582, metadata !583, metadata !584, metadata !585}
!581 = metadata !{i32 786689, metadata !576, metadata !"array", metadata !453, i32 16777305, metadata !569, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!582 = metadata !{i32 786689, metadata !576, metadata !"desc", metadata !453, i32 33554521, metadata !457, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!583 = metadata !{i32 786689, metadata !576, metadata !"width", metadata !453, i32 50331738, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!584 = metadata !{i32 786689, metadata !576, metadata !"height", metadata !453, i32 67108954, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!585 = metadata !{i32 786689, metadata !576, metadata !"flags", metadata !453, i32 83886170, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!586 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !453, i32 94, metadata !546, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!587 = metadata !{metadata !588}
!588 = metadata !{metadata !589, metadata !590}
!589 = metadata !{i32 786689, metadata !586, metadata !"ptr", metadata !453, i32 16777310, metadata !415, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!590 = metadata !{i32 786689, metadata !586, metadata !"size", metadata !453, i32 33554526, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!591 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !453, i32 102, metadata !592, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!592 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !593, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!593 = metadata !{metadata !456, metadata !415, metadata !320, metadata !239, metadata !239}
!594 = metadata !{metadata !595}
!595 = metadata !{metadata !596, metadata !597, metadata !598, metadata !599}
!596 = metadata !{i32 786689, metadata !591, metadata !"devPtr", metadata !453, i32 16777318, metadata !415, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!597 = metadata !{i32 786689, metadata !591, metadata !"pitch", metadata !453, i32 33554534, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!598 = metadata !{i32 786689, metadata !591, metadata !"width", metadata !453, i32 50331750, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!599 = metadata !{i32 786689, metadata !591, metadata !"height", metadata !453, i32 67108966, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!600 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !453, i32 106, metadata !601, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!601 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !602, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!602 = metadata !{metadata !456, metadata !23, metadata !82, metadata !239, metadata !449}
!603 = metadata !{metadata !604}
!604 = metadata !{metadata !605, metadata !606, metadata !607, metadata !608}
!605 = metadata !{i32 786689, metadata !600, metadata !"dst", metadata !453, i32 16777322, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!606 = metadata !{i32 786689, metadata !600, metadata !"src", metadata !453, i32 33554538, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!607 = metadata !{i32 786689, metadata !600, metadata !"count", metadata !453, i32 50331754, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!608 = metadata !{i32 786689, metadata !600, metadata !"kind", metadata !453, i32 67108970, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!609 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !453, i32 111, metadata !610, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!610 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !611, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!611 = metadata !{metadata !456, metadata !23, metadata !239, metadata !82, metadata !239, metadata !239, metadata !239, metadata !449}
!612 = metadata !{metadata !613}
!613 = metadata !{metadata !614, metadata !615, metadata !616, metadata !617, metadata !618, metadata !619, metadata !620}
!614 = metadata !{i32 786689, metadata !609, metadata !"dst", metadata !453, i32 16777327, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!615 = metadata !{i32 786689, metadata !609, metadata !"dpitch", metadata !453, i32 33554543, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!616 = metadata !{i32 786689, metadata !609, metadata !"src", metadata !453, i32 50331759, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!617 = metadata !{i32 786689, metadata !609, metadata !"spitch", metadata !453, i32 67108975, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!618 = metadata !{i32 786689, metadata !609, metadata !"width", metadata !453, i32 83886192, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!619 = metadata !{i32 786689, metadata !609, metadata !"height", metadata !453, i32 100663408, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!620 = metadata !{i32 786689, metadata !609, metadata !"kind", metadata !453, i32 117440624, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!621 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !453, i32 116, metadata !622, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!622 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !623, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!623 = metadata !{metadata !456, metadata !472, metadata !239, metadata !239, metadata !472, metadata !239, metadata !239, metadata !239, metadata !239, metadata !449}
!624 = metadata !{metadata !625}
!625 = metadata !{metadata !626, metadata !627, metadata !628, metadata !629, metadata !630, metadata !631, metadata !632, metadata !633, metadata !634}
!626 = metadata !{i32 786689, metadata !621, metadata !"dst", metadata !453, i32 16777332, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!627 = metadata !{i32 786689, metadata !621, metadata !"wOffsetDst", metadata !453, i32 33554548, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!628 = metadata !{i32 786689, metadata !621, metadata !"hOffsetDst", metadata !453, i32 50331764, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!629 = metadata !{i32 786689, metadata !621, metadata !"src", metadata !453, i32 67108981, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!630 = metadata !{i32 786689, metadata !621, metadata !"wOffsetSrc", metadata !453, i32 83886197, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!631 = metadata !{i32 786689, metadata !621, metadata !"hOffsetSrc", metadata !453, i32 100663413, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!632 = metadata !{i32 786689, metadata !621, metadata !"width", metadata !453, i32 117440630, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!633 = metadata !{i32 786689, metadata !621, metadata !"height", metadata !453, i32 134217846, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!634 = metadata !{i32 786689, metadata !621, metadata !"kind", metadata !453, i32 150995062, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!635 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !453, i32 122, metadata !636, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!636 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !637, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!637 = metadata !{metadata !456, metadata !23, metadata !239, metadata !82, metadata !239, metadata !239, metadata !239, metadata !449, metadata !638}
!638 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !453, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !639} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!639 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !640} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!640 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !135, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!641 = metadata !{metadata !642}
!642 = metadata !{metadata !643, metadata !644, metadata !645, metadata !646, metadata !647, metadata !648, metadata !649, metadata !650}
!643 = metadata !{i32 786689, metadata !635, metadata !"dst", metadata !453, i32 16777338, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!644 = metadata !{i32 786689, metadata !635, metadata !"dpitch", metadata !453, i32 33554554, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!645 = metadata !{i32 786689, metadata !635, metadata !"src", metadata !453, i32 50331770, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!646 = metadata !{i32 786689, metadata !635, metadata !"spitch", metadata !453, i32 67108986, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!647 = metadata !{i32 786689, metadata !635, metadata !"width", metadata !453, i32 83886203, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!648 = metadata !{i32 786689, metadata !635, metadata !"height", metadata !453, i32 100663419, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!649 = metadata !{i32 786689, metadata !635, metadata !"kind", metadata !453, i32 117440635, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!650 = metadata !{i32 786689, metadata !635, metadata !"stream", metadata !453, i32 134217852, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!651 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !453, i32 128, metadata !652, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!652 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !653, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!653 = metadata !{metadata !456, metadata !23, metadata !239, metadata !472, metadata !239, metadata !239, metadata !239, metadata !239, metadata !449}
!654 = metadata !{metadata !655}
!655 = metadata !{metadata !656, metadata !657, metadata !658, metadata !659, metadata !660, metadata !661, metadata !662, metadata !663}
!656 = metadata !{i32 786689, metadata !651, metadata !"dst", metadata !453, i32 16777344, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!657 = metadata !{i32 786689, metadata !651, metadata !"dpitch", metadata !453, i32 33554560, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!658 = metadata !{i32 786689, metadata !651, metadata !"src", metadata !453, i32 50331776, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!659 = metadata !{i32 786689, metadata !651, metadata !"wOffset", metadata !453, i32 67108993, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!660 = metadata !{i32 786689, metadata !651, metadata !"hOffset", metadata !453, i32 83886209, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!661 = metadata !{i32 786689, metadata !651, metadata !"width", metadata !453, i32 100663425, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!662 = metadata !{i32 786689, metadata !651, metadata !"height", metadata !453, i32 117440641, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!663 = metadata !{i32 786689, metadata !651, metadata !"kind", metadata !453, i32 134217858, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!664 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !453, i32 134, metadata !665, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!665 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !666, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!666 = metadata !{metadata !456, metadata !23, metadata !239, metadata !472, metadata !239, metadata !239, metadata !239, metadata !239, metadata !449, metadata !638}
!667 = metadata !{metadata !668}
!668 = metadata !{metadata !669, metadata !670, metadata !671, metadata !672, metadata !673, metadata !674, metadata !675, metadata !676, metadata !677}
!669 = metadata !{i32 786689, metadata !664, metadata !"dst", metadata !453, i32 16777350, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!670 = metadata !{i32 786689, metadata !664, metadata !"dpitch", metadata !453, i32 33554566, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!671 = metadata !{i32 786689, metadata !664, metadata !"src", metadata !453, i32 50331782, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!672 = metadata !{i32 786689, metadata !664, metadata !"wOffset", metadata !453, i32 67108999, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!673 = metadata !{i32 786689, metadata !664, metadata !"hOffset", metadata !453, i32 83886215, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!674 = metadata !{i32 786689, metadata !664, metadata !"width", metadata !453, i32 100663431, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!675 = metadata !{i32 786689, metadata !664, metadata !"height", metadata !453, i32 117440647, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!676 = metadata !{i32 786689, metadata !664, metadata !"kind", metadata !453, i32 134217864, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!677 = metadata !{i32 786689, metadata !664, metadata !"stream", metadata !453, i32 150995080, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!678 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !453, i32 140, metadata !679, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!679 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !680, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!680 = metadata !{metadata !456, metadata !472, metadata !239, metadata !239, metadata !82, metadata !239, metadata !239, metadata !239, metadata !449}
!681 = metadata !{metadata !682}
!682 = metadata !{metadata !683, metadata !684, metadata !685, metadata !686, metadata !687, metadata !688, metadata !689, metadata !690}
!683 = metadata !{i32 786689, metadata !678, metadata !"dst", metadata !453, i32 16777356, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!684 = metadata !{i32 786689, metadata !678, metadata !"wOffset", metadata !453, i32 33554572, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!685 = metadata !{i32 786689, metadata !678, metadata !"hOffset", metadata !453, i32 50331788, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!686 = metadata !{i32 786689, metadata !678, metadata !"src", metadata !453, i32 67109005, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!687 = metadata !{i32 786689, metadata !678, metadata !"spitch", metadata !453, i32 83886221, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!688 = metadata !{i32 786689, metadata !678, metadata !"width", metadata !453, i32 100663437, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!689 = metadata !{i32 786689, metadata !678, metadata !"height", metadata !453, i32 117440653, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!690 = metadata !{i32 786689, metadata !678, metadata !"kind", metadata !453, i32 134217870, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!691 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !453, i32 146, metadata !692, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!692 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !693, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!693 = metadata !{metadata !456, metadata !472, metadata !239, metadata !239, metadata !82, metadata !239, metadata !239, metadata !239, metadata !449, metadata !638}
!694 = metadata !{metadata !695}
!695 = metadata !{metadata !696, metadata !697, metadata !698, metadata !699, metadata !700, metadata !701, metadata !702, metadata !703, metadata !704}
!696 = metadata !{i32 786689, metadata !691, metadata !"dst", metadata !453, i32 16777362, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!697 = metadata !{i32 786689, metadata !691, metadata !"wOffset", metadata !453, i32 33554578, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!698 = metadata !{i32 786689, metadata !691, metadata !"hOffset", metadata !453, i32 50331794, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!699 = metadata !{i32 786689, metadata !691, metadata !"src", metadata !453, i32 67109011, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!700 = metadata !{i32 786689, metadata !691, metadata !"spitch", metadata !453, i32 83886227, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!701 = metadata !{i32 786689, metadata !691, metadata !"width", metadata !453, i32 100663443, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!702 = metadata !{i32 786689, metadata !691, metadata !"height", metadata !453, i32 117440659, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!703 = metadata !{i32 786689, metadata !691, metadata !"kind", metadata !453, i32 134217876, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!704 = metadata !{i32 786689, metadata !691, metadata !"stream", metadata !453, i32 150995092, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!705 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !453, i32 152, metadata !706, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!706 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !707, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!707 = metadata !{metadata !456, metadata !708}
!708 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !709} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!709 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !710} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!710 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !135, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !711, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!711 = metadata !{metadata !712, metadata !714, metadata !720, metadata !721, metadata !722, metadata !723, metadata !724, metadata !725}
!712 = metadata !{i32 786445, metadata !710, metadata !"srcArray", metadata !135, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !713} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!713 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !135, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !472} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!714 = metadata !{i32 786445, metadata !710, metadata !"srcPos", metadata !135, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !715} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!715 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !135, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !716, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!716 = metadata !{metadata !717, metadata !718, metadata !719}
!717 = metadata !{i32 786445, metadata !715, metadata !"x", metadata !135, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!718 = metadata !{i32 786445, metadata !715, metadata !"y", metadata !135, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !239} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!719 = metadata !{i32 786445, metadata !715, metadata !"z", metadata !135, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !239} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!720 = metadata !{i32 786445, metadata !710, metadata !"srcPtr", metadata !135, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !556} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!721 = metadata !{i32 786445, metadata !710, metadata !"dstArray", metadata !135, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !713} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!722 = metadata !{i32 786445, metadata !710, metadata !"dstPos", metadata !135, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !715} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!723 = metadata !{i32 786445, metadata !710, metadata !"dstPtr", metadata !135, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !556} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!724 = metadata !{i32 786445, metadata !710, metadata !"extent", metadata !135, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !466} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!725 = metadata !{i32 786445, metadata !710, metadata !"kind", metadata !135, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !449} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!726 = metadata !{metadata !727}
!727 = metadata !{metadata !728}
!728 = metadata !{i32 786689, metadata !705, metadata !"p", metadata !453, i32 16777368, metadata !708, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!729 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !453, i32 156, metadata !730, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!730 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !731, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!731 = metadata !{metadata !456, metadata !708, metadata !638}
!732 = metadata !{metadata !733}
!733 = metadata !{metadata !734, metadata !735}
!734 = metadata !{i32 786689, metadata !729, metadata !"p", metadata !453, i32 16777372, metadata !708, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!735 = metadata !{i32 786689, metadata !729, metadata !"stream", metadata !453, i32 33554588, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!736 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !453, i32 160, metadata !737, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!737 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !738, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!738 = metadata !{metadata !456, metadata !739}
!739 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !740} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!740 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !741} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!741 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !135, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !742, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!742 = metadata !{metadata !743, metadata !744, metadata !745, metadata !746, metadata !747, metadata !748, metadata !749, metadata !750, metadata !751}
!743 = metadata !{i32 786445, metadata !741, metadata !"srcArray", metadata !135, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !713} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!744 = metadata !{i32 786445, metadata !741, metadata !"srcPos", metadata !135, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !715} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!745 = metadata !{i32 786445, metadata !741, metadata !"srcPtr", metadata !135, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !556} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!746 = metadata !{i32 786445, metadata !741, metadata !"srcDevice", metadata !135, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !27} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!747 = metadata !{i32 786445, metadata !741, metadata !"dstArray", metadata !135, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !713} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!748 = metadata !{i32 786445, metadata !741, metadata !"dstPos", metadata !135, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !715} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!749 = metadata !{i32 786445, metadata !741, metadata !"dstPtr", metadata !135, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !556} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!750 = metadata !{i32 786445, metadata !741, metadata !"dstDevice", metadata !135, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !27} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!751 = metadata !{i32 786445, metadata !741, metadata !"extent", metadata !135, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !466} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!752 = metadata !{metadata !753}
!753 = metadata !{metadata !754}
!754 = metadata !{i32 786689, metadata !736, metadata !"p", metadata !453, i32 16777376, metadata !739, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!755 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !453, i32 164, metadata !756, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!756 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !757, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!757 = metadata !{metadata !456, metadata !739, metadata !638}
!758 = metadata !{metadata !759}
!759 = metadata !{metadata !760, metadata !761}
!760 = metadata !{i32 786689, metadata !755, metadata !"p", metadata !453, i32 16777380, metadata !739, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!761 = metadata !{i32 786689, metadata !755, metadata !"stream", metadata !453, i32 33554596, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!762 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !453, i32 168, metadata !763, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!763 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !764, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!764 = metadata !{metadata !456, metadata !472, metadata !239, metadata !239, metadata !472, metadata !239, metadata !239, metadata !239, metadata !449}
!765 = metadata !{metadata !766}
!766 = metadata !{metadata !767, metadata !768, metadata !769, metadata !770, metadata !771, metadata !772, metadata !773, metadata !774}
!767 = metadata !{i32 786689, metadata !762, metadata !"dst", metadata !453, i32 16777384, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!768 = metadata !{i32 786689, metadata !762, metadata !"wOffsetDst", metadata !453, i32 33554600, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!769 = metadata !{i32 786689, metadata !762, metadata !"hOffsetDst", metadata !453, i32 50331816, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!770 = metadata !{i32 786689, metadata !762, metadata !"src", metadata !453, i32 67109033, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!771 = metadata !{i32 786689, metadata !762, metadata !"wOffsetSrc", metadata !453, i32 83886249, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!772 = metadata !{i32 786689, metadata !762, metadata !"hOffsetSrc", metadata !453, i32 100663465, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!773 = metadata !{i32 786689, metadata !762, metadata !"count", metadata !453, i32 117440682, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!774 = metadata !{i32 786689, metadata !762, metadata !"kind", metadata !453, i32 134217898, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!775 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !453, i32 174, metadata !776, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!776 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !777, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!777 = metadata !{metadata !456, metadata !23, metadata !82, metadata !239, metadata !449, metadata !638}
!778 = metadata !{metadata !779}
!779 = metadata !{metadata !780, metadata !781, metadata !782, metadata !783, metadata !784}
!780 = metadata !{i32 786689, metadata !775, metadata !"dst", metadata !453, i32 16777390, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!781 = metadata !{i32 786689, metadata !775, metadata !"src", metadata !453, i32 33554606, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!782 = metadata !{i32 786689, metadata !775, metadata !"count", metadata !453, i32 50331822, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!783 = metadata !{i32 786689, metadata !775, metadata !"kind", metadata !453, i32 67109039, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!784 = metadata !{i32 786689, metadata !775, metadata !"stream", metadata !453, i32 83886255, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!785 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !453, i32 179, metadata !786, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!786 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !787, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!787 = metadata !{metadata !456, metadata !23, metadata !472, metadata !239, metadata !239, metadata !239, metadata !449}
!788 = metadata !{metadata !789}
!789 = metadata !{metadata !790, metadata !791, metadata !792, metadata !793, metadata !794, metadata !795}
!790 = metadata !{i32 786689, metadata !785, metadata !"dst", metadata !453, i32 16777395, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!791 = metadata !{i32 786689, metadata !785, metadata !"src", metadata !453, i32 33554611, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!792 = metadata !{i32 786689, metadata !785, metadata !"wOffset", metadata !453, i32 50331827, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!793 = metadata !{i32 786689, metadata !785, metadata !"hOffset", metadata !453, i32 67109044, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!794 = metadata !{i32 786689, metadata !785, metadata !"count", metadata !453, i32 83886260, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!795 = metadata !{i32 786689, metadata !785, metadata !"kind", metadata !453, i32 100663476, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!796 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !453, i32 184, metadata !797, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!797 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !798, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!798 = metadata !{metadata !456, metadata !23, metadata !472, metadata !239, metadata !239, metadata !239, metadata !449, metadata !638}
!799 = metadata !{metadata !800}
!800 = metadata !{metadata !801, metadata !802, metadata !803, metadata !804, metadata !805, metadata !806, metadata !807}
!801 = metadata !{i32 786689, metadata !796, metadata !"dst", metadata !453, i32 16777400, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!802 = metadata !{i32 786689, metadata !796, metadata !"src", metadata !453, i32 33554616, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!803 = metadata !{i32 786689, metadata !796, metadata !"wOffset", metadata !453, i32 50331832, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!804 = metadata !{i32 786689, metadata !796, metadata !"hOffset", metadata !453, i32 67109049, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!805 = metadata !{i32 786689, metadata !796, metadata !"count", metadata !453, i32 83886265, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!806 = metadata !{i32 786689, metadata !796, metadata !"kind", metadata !453, i32 100663481, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!807 = metadata !{i32 786689, metadata !796, metadata !"stream", metadata !453, i32 117440698, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!808 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !453, i32 190, metadata !809, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!809 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !810, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!810 = metadata !{metadata !456, metadata !23, metadata !96, metadata !239, metadata !239, metadata !449}
!811 = metadata !{metadata !812}
!812 = metadata !{metadata !813, metadata !814, metadata !815, metadata !816, metadata !817}
!813 = metadata !{i32 786689, metadata !808, metadata !"dst", metadata !453, i32 16777406, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!814 = metadata !{i32 786689, metadata !808, metadata !"symbol", metadata !453, i32 33554622, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!815 = metadata !{i32 786689, metadata !808, metadata !"count", metadata !453, i32 50331838, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!816 = metadata !{i32 786689, metadata !808, metadata !"offset", metadata !453, i32 67109055, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!817 = metadata !{i32 786689, metadata !808, metadata !"kind", metadata !453, i32 83886271, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!818 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !453, i32 195, metadata !819, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!819 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !820, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!820 = metadata !{metadata !456, metadata !23, metadata !96, metadata !239, metadata !239, metadata !449, metadata !638}
!821 = metadata !{metadata !822}
!822 = metadata !{metadata !823, metadata !824, metadata !825, metadata !826, metadata !827, metadata !828}
!823 = metadata !{i32 786689, metadata !818, metadata !"dst", metadata !453, i32 16777411, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!824 = metadata !{i32 786689, metadata !818, metadata !"symbol", metadata !453, i32 33554627, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!825 = metadata !{i32 786689, metadata !818, metadata !"count", metadata !453, i32 50331843, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!826 = metadata !{i32 786689, metadata !818, metadata !"offset", metadata !453, i32 67109060, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!827 = metadata !{i32 786689, metadata !818, metadata !"kind", metadata !453, i32 83886276, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!828 = metadata !{i32 786689, metadata !818, metadata !"stream", metadata !453, i32 100663493, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!829 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !453, i32 201, metadata !830, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!830 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !831, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!831 = metadata !{metadata !456, metadata !23, metadata !27, metadata !82, metadata !27, metadata !239}
!832 = metadata !{metadata !833}
!833 = metadata !{metadata !834, metadata !835, metadata !836, metadata !837, metadata !838}
!834 = metadata !{i32 786689, metadata !829, metadata !"dst", metadata !453, i32 16777417, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!835 = metadata !{i32 786689, metadata !829, metadata !"dstDevice", metadata !453, i32 33554633, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!836 = metadata !{i32 786689, metadata !829, metadata !"src", metadata !453, i32 50331849, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!837 = metadata !{i32 786689, metadata !829, metadata !"srcDevice", metadata !453, i32 67109065, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!838 = metadata !{i32 786689, metadata !829, metadata !"count", metadata !453, i32 83886281, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!839 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !453, i32 206, metadata !840, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!840 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !841, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!841 = metadata !{metadata !456, metadata !23, metadata !27, metadata !82, metadata !27, metadata !239, metadata !638}
!842 = metadata !{metadata !843}
!843 = metadata !{metadata !844, metadata !845, metadata !846, metadata !847, metadata !848, metadata !849}
!844 = metadata !{i32 786689, metadata !839, metadata !"dst", metadata !453, i32 16777422, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!845 = metadata !{i32 786689, metadata !839, metadata !"dstDevice", metadata !453, i32 33554638, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!846 = metadata !{i32 786689, metadata !839, metadata !"src", metadata !453, i32 50331854, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!847 = metadata !{i32 786689, metadata !839, metadata !"srcDevice", metadata !453, i32 67109070, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!848 = metadata !{i32 786689, metadata !839, metadata !"count", metadata !453, i32 83886287, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!849 = metadata !{i32 786689, metadata !839, metadata !"stream", metadata !453, i32 100663503, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!850 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !453, i32 212, metadata !851, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!851 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !852, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!852 = metadata !{metadata !456, metadata !472, metadata !239, metadata !239, metadata !82, metadata !239, metadata !449}
!853 = metadata !{metadata !854}
!854 = metadata !{metadata !855, metadata !856, metadata !857, metadata !858, metadata !859, metadata !860}
!855 = metadata !{i32 786689, metadata !850, metadata !"dst", metadata !453, i32 16777428, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!856 = metadata !{i32 786689, metadata !850, metadata !"wOffset", metadata !453, i32 33554644, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!857 = metadata !{i32 786689, metadata !850, metadata !"hOffset", metadata !453, i32 50331860, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!858 = metadata !{i32 786689, metadata !850, metadata !"src", metadata !453, i32 67109077, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!859 = metadata !{i32 786689, metadata !850, metadata !"count", metadata !453, i32 83886293, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!860 = metadata !{i32 786689, metadata !850, metadata !"kind", metadata !453, i32 100663509, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!861 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !453, i32 217, metadata !862, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!862 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !863, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!863 = metadata !{metadata !456, metadata !472, metadata !239, metadata !239, metadata !82, metadata !239, metadata !449, metadata !638}
!864 = metadata !{metadata !865}
!865 = metadata !{metadata !866, metadata !867, metadata !868, metadata !869, metadata !870, metadata !871, metadata !872}
!866 = metadata !{i32 786689, metadata !861, metadata !"dst", metadata !453, i32 16777433, metadata !472, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!867 = metadata !{i32 786689, metadata !861, metadata !"wOffset", metadata !453, i32 33554649, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!868 = metadata !{i32 786689, metadata !861, metadata !"hOffset", metadata !453, i32 50331865, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!869 = metadata !{i32 786689, metadata !861, metadata !"src", metadata !453, i32 67109082, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!870 = metadata !{i32 786689, metadata !861, metadata !"count", metadata !453, i32 83886298, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!871 = metadata !{i32 786689, metadata !861, metadata !"kind", metadata !453, i32 100663514, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!872 = metadata !{i32 786689, metadata !861, metadata !"stream", metadata !453, i32 117440731, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!873 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !453, i32 223, metadata !874, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!874 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !875, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!875 = metadata !{metadata !456, metadata !93, metadata !82, metadata !239, metadata !239, metadata !449}
!876 = metadata !{metadata !877}
!877 = metadata !{metadata !878, metadata !879, metadata !880, metadata !881, metadata !882}
!878 = metadata !{i32 786689, metadata !873, metadata !"symbol", metadata !453, i32 16777439, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!879 = metadata !{i32 786689, metadata !873, metadata !"src", metadata !453, i32 33554655, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!880 = metadata !{i32 786689, metadata !873, metadata !"count", metadata !453, i32 50331871, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!881 = metadata !{i32 786689, metadata !873, metadata !"offset", metadata !453, i32 67109088, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!882 = metadata !{i32 786689, metadata !873, metadata !"kind", metadata !453, i32 83886304, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!883 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !453, i32 229, metadata !884, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!884 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !885, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!885 = metadata !{metadata !456, metadata !96, metadata !82, metadata !239, metadata !239, metadata !449, metadata !638}
!886 = metadata !{metadata !887}
!887 = metadata !{metadata !888, metadata !889, metadata !890, metadata !891, metadata !892, metadata !893}
!888 = metadata !{i32 786689, metadata !883, metadata !"symbol", metadata !453, i32 16777445, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!889 = metadata !{i32 786689, metadata !883, metadata !"src", metadata !453, i32 33554661, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!890 = metadata !{i32 786689, metadata !883, metadata !"count", metadata !453, i32 50331877, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!891 = metadata !{i32 786689, metadata !883, metadata !"offset", metadata !453, i32 67109093, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!892 = metadata !{i32 786689, metadata !883, metadata !"kind", metadata !453, i32 83886310, metadata !449, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!893 = metadata !{i32 786689, metadata !883, metadata !"stream", metadata !453, i32 100663526, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!894 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !453, i32 234, metadata !895, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!895 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !896, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!896 = metadata !{metadata !456, metadata !320, metadata !320}
!897 = metadata !{metadata !898}
!898 = metadata !{metadata !899, metadata !900}
!899 = metadata !{i32 786689, metadata !894, metadata !"free", metadata !453, i32 16777450, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!900 = metadata !{i32 786689, metadata !894, metadata !"total", metadata !453, i32 33554666, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!901 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !453, i32 238, metadata !902, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!902 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !903, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!903 = metadata !{metadata !456, metadata !23, metadata !27, metadata !239}
!904 = metadata !{metadata !905}
!905 = metadata !{metadata !906, metadata !907, metadata !908}
!906 = metadata !{i32 786689, metadata !901, metadata !"devPtr", metadata !453, i32 16777454, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!907 = metadata !{i32 786689, metadata !901, metadata !"value", metadata !453, i32 33554670, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!908 = metadata !{i32 786689, metadata !901, metadata !"count", metadata !453, i32 50331886, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!909 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !453, i32 243, metadata !910, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!910 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !911, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!911 = metadata !{metadata !456, metadata !23, metadata !239, metadata !27, metadata !239, metadata !239}
!912 = metadata !{metadata !913}
!913 = metadata !{metadata !914, metadata !915, metadata !916, metadata !917, metadata !918}
!914 = metadata !{i32 786689, metadata !909, metadata !"devPtr", metadata !453, i32 16777459, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!915 = metadata !{i32 786689, metadata !909, metadata !"pitch", metadata !453, i32 33554675, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!916 = metadata !{i32 786689, metadata !909, metadata !"value", metadata !453, i32 50331891, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!917 = metadata !{i32 786689, metadata !909, metadata !"width", metadata !453, i32 67109108, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!918 = metadata !{i32 786689, metadata !909, metadata !"height", metadata !453, i32 83886324, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!919 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !453, i32 248, metadata !920, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!920 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !921, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!921 = metadata !{metadata !456, metadata !23, metadata !239, metadata !27, metadata !239, metadata !239, metadata !638}
!922 = metadata !{metadata !923}
!923 = metadata !{metadata !924, metadata !925, metadata !926, metadata !927, metadata !928, metadata !929}
!924 = metadata !{i32 786689, metadata !919, metadata !"devPtr", metadata !453, i32 16777464, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!925 = metadata !{i32 786689, metadata !919, metadata !"pitch", metadata !453, i32 33554680, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!926 = metadata !{i32 786689, metadata !919, metadata !"value", metadata !453, i32 50331896, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!927 = metadata !{i32 786689, metadata !919, metadata !"width", metadata !453, i32 67109113, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!928 = metadata !{i32 786689, metadata !919, metadata !"height", metadata !453, i32 83886329, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!929 = metadata !{i32 786689, metadata !919, metadata !"stream", metadata !453, i32 100663545, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!930 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !453, i32 253, metadata !931, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!931 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !932, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!932 = metadata !{metadata !456, metadata !556, metadata !27, metadata !466}
!933 = metadata !{metadata !934}
!934 = metadata !{metadata !935, metadata !936, metadata !937}
!935 = metadata !{i32 786689, metadata !930, metadata !"pitchedDevPtr", metadata !453, i32 16777469, metadata !556, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!936 = metadata !{i32 786689, metadata !930, metadata !"value", metadata !453, i32 33554685, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!937 = metadata !{i32 786689, metadata !930, metadata !"extent", metadata !453, i32 50331902, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!938 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !453, i32 258, metadata !939, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!939 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !940, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!940 = metadata !{metadata !456, metadata !556, metadata !27, metadata !466, metadata !638}
!941 = metadata !{metadata !942}
!942 = metadata !{metadata !943, metadata !944, metadata !945, metadata !946}
!943 = metadata !{i32 786689, metadata !938, metadata !"pitchedDevPtr", metadata !453, i32 16777474, metadata !556, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!944 = metadata !{i32 786689, metadata !938, metadata !"value", metadata !453, i32 33554690, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!945 = metadata !{i32 786689, metadata !938, metadata !"extent", metadata !453, i32 50331907, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!946 = metadata !{i32 786689, metadata !938, metadata !"stream", metadata !453, i32 67109123, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!947 = metadata !{i32 786478, i32 0, metadata !453, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !453, i32 263, metadata !948, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!948 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !949, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!949 = metadata !{metadata !456, metadata !23, metadata !27, metadata !239, metadata !638}
!950 = metadata !{metadata !951}
!951 = metadata !{metadata !952, metadata !953, metadata !954, metadata !955}
!952 = metadata !{i32 786689, metadata !947, metadata !"devPtr", metadata !453, i32 16777479, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!953 = metadata !{i32 786689, metadata !947, metadata !"value", metadata !453, i32 33554695, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!954 = metadata !{i32 786689, metadata !947, metadata !"count", metadata !453, i32 50331911, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!955 = metadata !{i32 786689, metadata !947, metadata !"stream", metadata !453, i32 67109127, metadata !638, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!956 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"cla
!957 = metadata !{metadata !958}
!958 = metadata !{metadata !134}
!959 = metadata !{metadata !960}
!960 = metadata !{metadata !961, metadata !974, metadata !977}
!961 = metadata !{i32 786478, i32 0, metadata !962, metadata !"cudaGetErrorString", metadata !"cudaGetErrorString", metadata !"", metadata !962, i32 16, metadata !963, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i32)* @cudaGetErrorStrin
!962 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!963 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !964, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!964 = metadata !{metadata !96, metadata !965}
!965 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !962, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !134} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!966 = metadata !{metadata !967}
!967 = metadata !{metadata !968, metadata !969}
!968 = metadata !{i32 786689, metadata !961, metadata !"error", metadata !962, i32 16777232, metadata !965, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [error] [line 16]
!969 = metadata !{i32 786688, metadata !970, metadata !"tmp", metadata !962, i32 17, metadata !971, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 17]
!970 = metadata !{i32 786443, metadata !961, i32 16, i32 0, metadata !962, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!971 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 160, i64 8, i32 0, i32 0, metadata !94, metadata !972, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!972 = metadata !{metadata !973}
!973 = metadata !{i32 786465, i64 0, i64 19}      ; [ DW_TAG_subrange_type ] [0, 19]
!974 = metadata !{i32 786478, i32 0, metadata !962, metadata !"cudaGetLastError", metadata !"cudaGetLastError", metadata !"", metadata !962, i32 22, metadata !975, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaGetLastError, null, 
!975 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !976, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!976 = metadata !{metadata !965}
!977 = metadata !{i32 786478, i32 0, metadata !962, metadata !"cudaPeekAtLastError", metadata !"cudaPeekAtLastError", metadata !"", metadata !962, i32 26, metadata !975, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaPeekAtLastErro
!978 = metadata !{metadata !979}
!979 = metadata !{metadata !980}
!980 = metadata !{i32 786484, i32 0, null, metadata !"msg", metadata !"msg", metadata !"", metadata !962, i32 14, metadata !981, i32 1, i32 1, [25 x i8]* @msg} ; [ DW_TAG_variable ] [msg] [line 14] [local] [def]
!981 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 200, i64 8, i32 0, i32 0, metadata !94, metadata !982, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 200, align 8, offset 0] [from char]
!982 = metadata !{metadata !983}
!983 = metadata !{i32 786465, i64 0, i64 24}      ; [ DW_TAG_subrange_type ] [0, 24]
!984 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaThreadManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clan
!985 = metadata !{metadata !986}
!986 = metadata !{metadata !987, metadata !992, metadata !998, metadata !1007, metadata !1013, metadata !1020}
!987 = metadata !{i32 786478, i32 0, metadata !988, metadata !"cudaThreadExit", metadata !"cudaThreadExit", metadata !"", metadata !988, i32 13, metadata !989, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaThreadExit, null, null, 
!988 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaThreadManage.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!989 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !990, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!990 = metadata !{metadata !991}
!991 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !988, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !134} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!992 = metadata !{i32 786478, i32 0, metadata !988, metadata !"cudaThreadGetCacheConfig", metadata !"cudaThreadGetCacheConfig", metadata !"", metadata !988, i32 17, metadata !993, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cuda
!993 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !994, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!994 = metadata !{metadata !991, metadata !313}
!995 = metadata !{metadata !996}
!996 = metadata !{metadata !997}
!997 = metadata !{i32 786689, metadata !992, metadata !"pCacheConfig", metadata !988, i32 16777233, metadata !313, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 17]
!998 = metadata !{i32 786478, i32 0, metadata !988, metadata !"cudaThreadGetLimit", metadata !"cudaThreadGetLimit", metadata !"", metadata !988, i32 21, metadata !999, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaThreadG
!999 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1000, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1000 = metadata !{metadata !991, metadata !1001, metadata !215}
!1001 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1002} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!1002 = metadata !{i32 786454, null, metadata !"size_t", metadata !988, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!1003 = metadata !{metadata !1004}
!1004 = metadata !{metadata !1005, metadata !1006}
!1005 = metadata !{i32 786689, metadata !998, metadata !"pValue", metadata !988, i32 16777237, metadata !1001, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 21]
!1006 = metadata !{i32 786689, metadata !998, metadata !"limit", metadata !988, i32 33554453, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 21]
!1007 = metadata !{i32 786478, i32 0, metadata !988, metadata !"cudaThreadSetCacheConfig", metadata !"cudaThreadSetCacheConfig", metadata !"", metadata !988, i32 25, metadata !1008, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cud
!1008 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1009, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1009 = metadata !{metadata !991, metadata !209}
!1010 = metadata !{metadata !1011}
!1011 = metadata !{metadata !1012}
!1012 = metadata !{i32 786689, metadata !1007, metadata !"cacheConfig", metadata !988, i32 16777241, metadata !209, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 25]
!1013 = metadata !{i32 786478, i32 0, metadata !988, metadata !"cudaThreadSetLimit", metadata !"cudaThreadSetLimit", metadata !"", metadata !988, i32 29, metadata !1014, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaThread
!1014 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1015, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1015 = metadata !{metadata !991, metadata !215, metadata !1002}
!1016 = metadata !{metadata !1017}
!1017 = metadata !{metadata !1018, metadata !1019}
!1018 = metadata !{i32 786689, metadata !1013, metadata !"limit", metadata !988, i32 16777245, metadata !215, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 29]
!1019 = metadata !{i32 786689, metadata !1013, metadata !"value", metadata !988, i32 33554461, metadata !1002, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 29]
!1020 = metadata !{i32 786478, i32 0, metadata !988, metadata !"cudaThreadSynchronize", metadata !"cudaThreadSynchronize", metadata !"", metadata !988, i32 33, metadata !989, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaThreadSyn
!1021 = metadata !{i32 11, i32 0, metadata !1022, null}
!1022 = metadata !{i32 786443, metadata !15, i32 10, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass/main.cpp]
!1023 = metadata !{i32 12, i32 0, metadata !1022, null}
!1024 = metadata !{i32 13, i32 0, metadata !1022, null}
!1025 = metadata !{i32 14, i32 0, metadata !1022, null}
!1026 = metadata !{i32 19, i32 0, metadata !1027, null}
!1027 = metadata !{i32 786443, metadata !20, i32 18, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass/main.cpp]
!1028 = metadata !{i32 20, i32 0, metadata !1027, null}
!1029 = metadata !{i32 21, i32 0, metadata !1027, null}
!1030 = metadata !{i32 25, i32 0, metadata !1031, null}
!1031 = metadata !{i32 786443, metadata !24, i32 24, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass/main.cpp]
!1032 = metadata !{i32 29, i32 0, metadata !1033, null}
!1033 = metadata !{i32 786443, metadata !1031, i32 29, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass/main.cpp]
!1034 = metadata !{i32 30, i32 0, metadata !1035, null}
!1035 = metadata !{i32 786443, metadata !1033, i32 29, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass/main.cpp]
!1036 = metadata !{i32 31, i32 0, metadata !1035, null}
!1037 = metadata !{i32 34, i32 0, metadata !1031, null}
!1038 = metadata !{i32 36, i32 0, metadata !1031, null}
!1039 = metadata !{i32 37, i32 0, metadata !1031, null}
!1040 = metadata !{i32 40, i32 0, metadata !1041, null}
!1041 = metadata !{i32 786443, metadata !1031, i32 38, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass/main.cpp]
!1042 = metadata !{i32 44, i32 0, metadata !1041, null}
!1043 = metadata !{i32 48, i32 0, metadata !1031, null}
!1044 = metadata !{i32 49, i32 0, metadata !1031, null}
!1045 = metadata !{i32 50, i32 0, metadata !1031, null}
!1046 = metadata !{i32 52, i32 0, metadata !1047, null}
!1047 = metadata !{i32 786443, metadata !1031, i32 52, i32 0, metadata !16, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass/main.cpp]
!1048 = metadata !{i32 53, i32 0, metadata !1049, null}
!1049 = metadata !{i32 786443, metadata !1047, i32 52, i32 0, metadata !16, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass/main.cpp]
!1050 = metadata !{i32 54, i32 0, metadata !1049, null}
!1051 = metadata !{i32 56, i32 0, metadata !1031, null}
!1052 = metadata !{i32 57, i32 0, metadata !1031, null}
!1053 = metadata !{i32 59, i32 0, metadata !1031, null}
!1054 = metadata !{i32 419, i32 0, metadata !28, null}
!1055 = metadata !{i32 419, i32 0, metadata !70, null}
!1056 = metadata !{i32 419, i32 0, metadata !1057, null}
!1057 = metadata !{i32 786443, metadata !70, i32 419, i32 0, metadata !29, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/025_pass//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!1058 = metadata !{i32 16, i32 0, metadata !92, null}
!1059 = metadata !{i32 17, i32 0, metadata !92, null}
!1060 = metadata !{metadata !"omnipotent char", metadata !1061}
!1061 = metadata !{metadata !"Simple C/C++ TBAA"}
!1062 = metadata !{i32 18, i32 0, metadata !92, null}
!1063 = metadata !{i32 14, i32 0, metadata !128, null}
!1064 = metadata !{i32 15, i32 0, metadata !128, null}
!1065 = metadata !{i32 16, i32 0, metadata !128, null}
!1066 = metadata !{i32 15, i32 0, metadata !1067, null}
!1067 = metadata !{i32 786443, metadata !224, i32 14, i32 0, metadata !225, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1068 = metadata !{metadata !"int", metadata !1060}
!1069 = metadata !{i32 16, i32 0, metadata !1067, null}
!1070 = metadata !{i32 20, i32 0, metadata !1071, null}
!1071 = metadata !{i32 786443, metadata !303, i32 19, i32 0, metadata !225, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1072 = metadata !{i32 21, i32 0, metadata !1071, null}
!1073 = metadata !{i32 25, i32 0, metadata !1074, null}
!1074 = metadata !{i32 786443, metadata !310, i32 24, i32 0, metadata !225, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1075 = metadata !{i32 29, i32 0, metadata !1076, null}
!1076 = metadata !{i32 786443, metadata !317, i32 28, i32 0, metadata !225, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1077 = metadata !{i32 33, i32 0, metadata !1078, null}
!1078 = metadata !{i32 786443, metadata !325, i32 32, i32 0, metadata !225, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1079 = metadata !{i32 34, i32 0, metadata !1078, null}
!1080 = metadata !{i32 38, i32 0, metadata !1081, null}
!1081 = metadata !{i32 786443, metadata !333, i32 37, i32 0, metadata !225, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1082 = metadata !{i32 42, i32 0, metadata !1083, null}
!1083 = metadata !{i32 786443, metadata !336, i32 41, i32 0, metadata !225, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1084 = metadata !{i32 46, i32 0, metadata !1085, null}
!1085 = metadata !{i32 786443, metadata !342, i32 45, i32 0, metadata !225, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1086 = metadata !{i32 50, i32 0, metadata !1087, null}
!1087 = metadata !{i32 786443, metadata !349, i32 49, i32 0, metadata !225, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1088 = metadata !{i32 54, i32 0, metadata !1089, null}
!1089 = metadata !{i32 786443, metadata !350, i32 53, i32 0, metadata !225, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1090 = metadata !{i32 55, i32 0, metadata !1089, null}
!1091 = metadata !{i32 59, i32 0, metadata !1092, null}
!1092 = metadata !{i32 786443, metadata !356, i32 58, i32 0, metadata !225, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1093 = metadata !{i32 60, i32 0, metadata !1092, null}
!1094 = metadata !{i32 64, i32 0, metadata !1095, null}
!1095 = metadata !{i32 786443, metadata !360, i32 63, i32 0, metadata !225, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1096 = metadata !{i32 65, i32 0, metadata !1095, null}
!1097 = metadata !{i32 69, i32 0, metadata !1098, null}
!1098 = metadata !{i32 786443, metadata !368, i32 68, i32 0, metadata !225, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1099 = metadata !{i32 73, i32 0, metadata !1100, null}
!1100 = metadata !{i32 786443, metadata !374, i32 72, i32 0, metadata !225, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1101 = metadata !{i32 77, i32 0, metadata !1102, null}
!1102 = metadata !{i32 786443, metadata !392, i32 76, i32 0, metadata !225, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1103 = metadata !{i32 81, i32 0, metadata !1104, null}
!1104 = metadata !{i32 786443, metadata !404, i32 80, i32 0, metadata !225, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1105 = metadata !{i32 85, i32 0, metadata !1106, null}
!1106 = metadata !{i32 786443, metadata !412, i32 84, i32 0, metadata !225, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1107 = metadata !{i32 89, i32 0, metadata !1108, null}
!1108 = metadata !{i32 786443, metadata !421, i32 88, i32 0, metadata !225, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1109 = metadata !{i32 93, i32 0, metadata !1110, null}
!1110 = metadata !{i32 786443, metadata !427, i32 92, i32 0, metadata !225, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1111 = metadata !{i32 97, i32 0, metadata !1112, null}
!1112 = metadata !{i32 786443, metadata !433, i32 96, i32 0, metadata !225, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1113 = metadata !{i32 26, i32 0, metadata !1114, null}
!1114 = metadata !{i32 786443, metadata !452, i32 25, i32 0, metadata !453, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1115 = metadata !{i32 30, i32 0, metadata !1116, null}
!1116 = metadata !{i32 786443, metadata !480, i32 29, i32 0, metadata !453, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1117 = metadata !{i32 31, i32 0, metadata !1116, null}
!1118 = metadata !{i32 35, i32 0, metadata !1119, null}
!1119 = metadata !{i32 786443, metadata !486, i32 34, i32 0, metadata !453, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1120 = metadata !{i32 36, i32 0, metadata !1119, null}
!1121 = metadata !{i32 40, i32 0, metadata !1122, null}
!1122 = metadata !{i32 786443, metadata !492, i32 39, i32 0, metadata !453, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1123 = metadata !{i32 41, i32 0, metadata !1122, null}
!1124 = metadata !{i32 45, i32 0, metadata !1125, null}
!1125 = metadata !{i32 786443, metadata !496, i32 44, i32 0, metadata !453, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1126 = metadata !{i32 49, i32 0, metadata !1127, null}
!1127 = metadata !{i32 786443, metadata !503, i32 48, i32 0, metadata !453, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1128 = metadata !{i32 53, i32 0, metadata !1129, null}
!1129 = metadata !{i32 786443, metadata !510, i32 52, i32 0, metadata !453, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1130 = metadata !{i32 57, i32 0, metadata !1131, null}
!1131 = metadata !{i32 786443, metadata !518, i32 56, i32 0, metadata !453, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1132 = metadata !{i32 61, i32 0, metadata !1133, null}
!1133 = metadata !{i32 786443, metadata !526, i32 60, i32 0, metadata !453, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1134 = metadata !{i32 65, i32 0, metadata !1135, null}
!1135 = metadata !{i32 786443, metadata !533, i32 64, i32 0, metadata !453, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1136 = metadata !{i32 69, i32 0, metadata !1137, null}
!1137 = metadata !{i32 786443, metadata !541, i32 68, i32 0, metadata !453, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1138 = metadata !{i32 73, i32 0, metadata !1139, null}
!1139 = metadata !{i32 786443, metadata !545, i32 72, i32 0, metadata !453, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1140 = metadata !{i32 74, i32 0, metadata !1139, null}
!1141 = metadata !{metadata !"any pointer", metadata !1060}
!1142 = metadata !{i32 75, i32 0, metadata !1139, null}
!1143 = metadata !{i32 77, i32 0, metadata !1139, null}
!1144 = metadata !{i32 81, i32 0, metadata !1145, null}
!1145 = metadata !{i32 786443, metadata !552, i32 80, i32 0, metadata !453, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1146 = metadata !{i32 86, i32 0, metadata !1147, null}
!1147 = metadata !{i32 786443, metadata !566, i32 85, i32 0, metadata !453, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1148 = metadata !{i32 91, i32 0, metadata !1149, null}
!1149 = metadata !{i32 786443, metadata !576, i32 90, i32 0, metadata !453, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1150 = metadata !{i32 95, i32 0, metadata !1151, null}
!1151 = metadata !{i32 786443, metadata !586, i32 94, i32 0, metadata !453, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1152 = metadata !{i32 96, i32 0, metadata !1151, null}
!1153 = metadata !{i32 97, i32 0, metadata !1151, null}
!1154 = metadata !{i32 99, i32 0, metadata !1151, null}
!1155 = metadata !{i32 103, i32 0, metadata !1156, null}
!1156 = metadata !{i32 786443, metadata !591, i32 102, i32 0, metadata !453, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1157 = metadata !{i32 108, i32 0, metadata !1158, null}
!1158 = metadata !{i32 786443, metadata !600, i32 106, i32 0, metadata !453, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1159 = metadata !{i32 113, i32 0, metadata !1160, null}
!1160 = metadata !{i32 786443, metadata !609, i32 112, i32 0, metadata !453, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1161 = metadata !{i32 119, i32 0, metadata !1162, null}
!1162 = metadata !{i32 786443, metadata !621, i32 118, i32 0, metadata !453, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1163 = metadata !{i32 125, i32 0, metadata !1164, null}
!1164 = metadata !{i32 786443, metadata !635, i32 124, i32 0, metadata !453, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1165 = metadata !{i32 131, i32 0, metadata !1166, null}
!1166 = metadata !{i32 786443, metadata !651, i32 130, i32 0, metadata !453, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1167 = metadata !{i32 137, i32 0, metadata !1168, null}
!1168 = metadata !{i32 786443, metadata !664, i32 136, i32 0, metadata !453, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1169 = metadata !{i32 143, i32 0, metadata !1170, null}
!1170 = metadata !{i32 786443, metadata !678, i32 142, i32 0, metadata !453, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1171 = metadata !{i32 149, i32 0, metadata !1172, null}
!1172 = metadata !{i32 786443, metadata !691, i32 148, i32 0, metadata !453, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1173 = metadata !{i32 153, i32 0, metadata !1174, null}
!1174 = metadata !{i32 786443, metadata !705, i32 152, i32 0, metadata !453, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1175 = metadata !{i32 157, i32 0, metadata !1176, null}
!1176 = metadata !{i32 786443, metadata !729, i32 156, i32 0, metadata !453, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1177 = metadata !{i32 161, i32 0, metadata !1178, null}
!1178 = metadata !{i32 786443, metadata !736, i32 160, i32 0, metadata !453, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1179 = metadata !{i32 165, i32 0, metadata !1180, null}
!1180 = metadata !{i32 786443, metadata !755, i32 164, i32 0, metadata !453, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1181 = metadata !{i32 171, i32 0, metadata !1182, null}
!1182 = metadata !{i32 786443, metadata !762, i32 170, i32 0, metadata !453, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1183 = metadata !{i32 176, i32 0, metadata !1184, null}
!1184 = metadata !{i32 786443, metadata !775, i32 175, i32 0, metadata !453, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1185 = metadata !{i32 181, i32 0, metadata !1186, null}
!1186 = metadata !{i32 786443, metadata !785, i32 180, i32 0, metadata !453, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1187 = metadata !{i32 187, i32 0, metadata !1188, null}
!1188 = metadata !{i32 786443, metadata !796, i32 186, i32 0, metadata !453, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1189 = metadata !{i32 192, i32 0, metadata !1190, null}
!1190 = metadata !{i32 786443, metadata !808, i32 191, i32 0, metadata !453, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1191 = metadata !{i32 198, i32 0, metadata !1192, null}
!1192 = metadata !{i32 786443, metadata !818, i32 197, i32 0, metadata !453, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1193 = metadata !{i32 203, i32 0, metadata !1194, null}
!1194 = metadata !{i32 786443, metadata !829, i32 201, i32 0, metadata !453, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1195 = metadata !{i32 209, i32 0, metadata !1196, null}
!1196 = metadata !{i32 786443, metadata !839, i32 207, i32 0, metadata !453, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1197 = metadata !{i32 214, i32 0, metadata !1198, null}
!1198 = metadata !{i32 786443, metadata !850, i32 213, i32 0, metadata !453, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1199 = metadata !{i32 220, i32 0, metadata !1200, null}
!1200 = metadata !{i32 786443, metadata !861, i32 219, i32 0, metadata !453, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1201 = metadata !{i32 225, i32 0, metadata !1202, null}
!1202 = metadata !{i32 786443, metadata !873, i32 224, i32 0, metadata !453, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1203 = metadata !{i32 226, i32 0, metadata !1202, null}
!1204 = metadata !{i32 231, i32 0, metadata !1205, null}
!1205 = metadata !{i32 786443, metadata !883, i32 230, i32 0, metadata !453, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1206 = metadata !{i32 235, i32 0, metadata !1207, null}
!1207 = metadata !{i32 786443, metadata !894, i32 234, i32 0, metadata !453, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1208 = metadata !{i32 239, i32 0, metadata !1209, null}
!1209 = metadata !{i32 786443, metadata !901, i32 238, i32 0, metadata !453, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1210 = metadata !{i32 240, i32 0, metadata !1209, null}
!1211 = metadata !{i32 245, i32 0, metadata !1212, null}
!1212 = metadata !{i32 786443, metadata !909, i32 244, i32 0, metadata !453, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1213 = metadata !{i32 250, i32 0, metadata !1214, null}
!1214 = metadata !{i32 786443, metadata !919, i32 249, i32 0, metadata !453, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1215 = metadata !{i32 255, i32 0, metadata !1216, null}
!1216 = metadata !{i32 786443, metadata !930, i32 254, i32 0, metadata !453, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1217 = metadata !{i32 260, i32 0, metadata !1218, null}
!1218 = metadata !{i32 786443, metadata !938, i32 259, i32 0, metadata !453, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1219 = metadata !{i32 264, i32 0, metadata !1220, null}
!1220 = metadata !{i32 786443, metadata !947, i32 263, i32 0, metadata !453, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cud
!1221 = metadata !{i32 19, i32 0, metadata !970, null}
!1222 = metadata !{i32 23, i32 0, metadata !1223, null}
!1223 = metadata !{i32 786443, metadata !974, i32 22, i32 0, metadata !962, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1224 = metadata !{i32 27, i32 0, metadata !1225, null}
!1225 = metadata !{i32 786443, metadata !977, i32 26, i32 0, metadata !962, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1226 = metadata !{i32 14, i32 0, metadata !1227, null}
!1227 = metadata !{i32 786443, metadata !987, i32 13, i32 0, metadata !988, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1228 = metadata !{i32 18, i32 0, metadata !1229, null}
!1229 = metadata !{i32 786443, metadata !992, i32 17, i32 0, metadata !988, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1230 = metadata !{i32 22, i32 0, metadata !1231, null}
!1231 = metadata !{i32 786443, metadata !998, i32 21, i32 0, metadata !988, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!1232 = metadata !{i32 26, i32 0, metadata !1233, null}
!1233 = metadata !{i32 786443, metadata !1007, i32 25, i32 0, metadata !988, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1234 = metadata !{i32 30, i32 0, metadata !1235, null}
!1235 = metadata !{i32 786443, metadata !1013, i32 29, i32 0, metadata !988, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!1236 = metadata !{i32 34, i32 0, metadata !1237, null}
!1237 = metadata !{i32 786443, metadata !1020, i32 33, i32 0, metadata !988, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
