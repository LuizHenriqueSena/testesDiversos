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
@.str = private unnamed_addr constant [29 x i8] c"strcmp(choice1,choice2) != 0\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"main.cpp\00", align 1
@__PRETTY_FUNCTION__._Z3fooPcS_S_ = private unnamed_addr constant [33 x i8] c"void foo(char *, char *, char *)\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"123\00", align 1
@.str3 = private unnamed_addr constant [17 x i8] c"strcmp(a,b) == 0\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

define void @_Z4swapPcS_(i8* %in, i8* %out) uwtable section "__device__" {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %tmp = alloca [4 x i8], align 1
  store i8* %in, i8** %1, align 8
  store i8* %out, i8** %2, align 8
  %3 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !721
  %4 = zext i32 %3 to i64, !dbg !721
  %5 = load i8** %1, align 8, !dbg !721
  %6 = getelementptr inbounds i8* %5, i64 %4, !dbg !721
  %7 = load i8* %6, align 1, !dbg !721
  %8 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !721
  %9 = zext i32 %8 to i64, !dbg !721
  %10 = getelementptr inbounds [4 x i8]* %tmp, i32 0, i64 %9, !dbg !721
  store i8 %7, i8* %10, align 1, !dbg !721
  call void @__syncthreads(), !dbg !723
  %11 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !724
  %12 = zext i32 %11 to i64, !dbg !724
  %13 = load i8** %2, align 8, !dbg !724
  %14 = getelementptr inbounds i8* %13, i64 %12, !dbg !724
  %15 = load i8* %14, align 1, !dbg !724
  %16 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !724
  %17 = zext i32 %16 to i64, !dbg !724
  %18 = load i8** %1, align 8, !dbg !724
  %19 = getelementptr inbounds i8* %18, i64 %17, !dbg !724
  store i8 %15, i8* %19, align 1, !dbg !724
  call void @__syncthreads(), !dbg !725
  %20 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !726
  %21 = zext i32 %20 to i64, !dbg !726
  %22 = getelementptr inbounds [4 x i8]* %tmp, i32 0, i64 %21, !dbg !726
  %23 = load i8* %22, align 1, !dbg !726
  %24 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !726
  %25 = zext i32 %24 to i64, !dbg !726
  %26 = load i8** %2, align 8, !dbg !726
  %27 = getelementptr inbounds i8* %26, i64 %25, !dbg !726
  store i8 %23, i8* %27, align 1, !dbg !726
  ret void, !dbg !727
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @__syncthreads() section "__device__"

define void @_Z3fooPcS_S_(i8* %A, i8* %B, i8* %c) uwtable noinline {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %choice1 = alloca i8*, align 8
  %choice2 = alloca i8*, align 8
  store i8* %A, i8** %1, align 8
  store i8* %B, i8** %2, align 8
  store i8* %c, i8** %3, align 8
  %4 = load i8** %1, align 8, !dbg !728
  store i8* %4, i8** %choice1, align 8, !dbg !728
  %5 = load i8** %2, align 8, !dbg !730
  store i8* %5, i8** %choice2, align 8, !dbg !730
  %6 = load i8** %choice1, align 8, !dbg !731
  %7 = load i8** %choice2, align 8, !dbg !731
  call void @_Z4swapPcS_(i8* %6, i8* %7), !dbg !731
  %8 = load i8** %choice1, align 8, !dbg !732
  %9 = load i8** %choice2, align 8, !dbg !732
  %10 = call i32 @strcmp(i8* %8, i8* %9) nounwind readonly, !dbg !732
  %11 = icmp ne i32 %10, 0, !dbg !732
  br i1 %11, label %13, label %12, !dbg !732

; <label>:12                                      ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 27, i8* getelementptr inbounds ([33 x i8]* @__PRETTY_FUNCTION__._Z3fooPcS_S_, i32 0, i32 0)) noreturn
  unreachable, !dbg !732

; <label>:13                                      ; preds = %0
  ret void, !dbg !733
}

declare i32 @strcmp(i8*, i8*) nounwind readonly

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

define i32 @main() uwtable {
  %1 = alloca i32, align 4
  %a = alloca i8*, align 8
  %b = alloca i8*, align 8
  %dev_a = alloca i8*, align 8
  %dev_b = alloca i8*, align 8
  %dev_c = alloca i8*, align 8
  %size = alloca i32, align 4
  %2 = alloca %struct.dim3, align 4
  %3 = alloca %struct.dim3, align 4
  %4 = alloca { i64, i32 }
  %5 = alloca { i64, i32 }
  %d = alloca i8*, align 8
  %e = alloca i8*, align 8
  store i32 0, i32* %1
  store i32 4, i32* %size, align 4, !dbg !734
  %6 = load i32* %size, align 4, !dbg !736
  %7 = sext i32 %6 to i64, !dbg !736
  %8 = call i32 @cudaMalloc(i8** %dev_a, i64 %7), !dbg !736
  %9 = load i32* %size, align 4, !dbg !737
  %10 = sext i32 %9 to i64, !dbg !737
  %11 = call i32 @cudaMalloc(i8** %dev_b, i64 %10), !dbg !737
  %12 = call i32 @cudaMalloc(i8** %dev_c, i64 1), !dbg !738
  %13 = load i32* %size, align 4, !dbg !739
  %14 = sext i32 %13 to i64, !dbg !739
  %15 = call noalias i8* @malloc(i64 %14) nounwind, !dbg !739
  store i8* %15, i8** %a, align 8, !dbg !739
  %16 = load i32* %size, align 4, !dbg !740
  %17 = sext i32 %16 to i64, !dbg !740
  %18 = call noalias i8* @malloc(i64 %17) nounwind, !dbg !740
  store i8* %18, i8** %b, align 8, !dbg !740
  %19 = load i8** %a, align 8, !dbg !741
  %20 = call i8* @strcpy(i8* %19, i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !741
  %21 = load i8** %b, align 8, !dbg !742
  %22 = call i8* @strcpy(i8* %21, i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !742
  %23 = load i8** %a, align 8, !dbg !743
  %24 = load i8** %b, align 8, !dbg !743
  %25 = call i32 @strcmp(i8* %23, i8* %24) nounwind readonly, !dbg !743
  %26 = icmp eq i32 %25, 0, !dbg !743
  br i1 %26, label %28, label %27, !dbg !743

; <label>:27                                      ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 51, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) noreturn nounwi
  unreachable, !dbg !743

; <label>:28                                      ; preds = %0
  %29 = load i8** %dev_a, align 8, !dbg !744
  %30 = load i8** %a, align 8, !dbg !744
  %31 = load i32* %size, align 4, !dbg !744
  %32 = sext i32 %31 to i64, !dbg !744
  %33 = call i32 @cudaMemcpy(i8* %29, i8* %30, i64 %32, i32 1), !dbg !744
  %34 = load i8** %dev_b, align 8, !dbg !745
  %35 = load i8** %b, align 8, !dbg !745
  %36 = load i32* %size, align 4, !dbg !745
  %37 = sext i32 %36 to i64, !dbg !745
  %38 = call i32 @cudaMemcpy(i8* %34, i8* %35, i64 %37, i32 1), !dbg !745
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %2, i32 1, i32 1, i32 1), !dbg !746
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %3, i32 4, i32 1, i32 1), !dbg !746
  %39 = bitcast { i64, i32 }* %4 to i8*, !dbg !746
  %40 = bitcast %struct.dim3* %2 to i8*, !dbg !746
  %41 = call i8* @memcpy(i8* %39, i8* %40, i64 12)
  %42 = getelementptr { i64, i32 }* %4, i32 0, i32 0, !dbg !746
  %43 = load i64* %42, align 1, !dbg !746
  %44 = getelementptr { i64, i32 }* %4, i32 0, i32 1, !dbg !746
  %45 = load i32* %44, align 1, !dbg !746
  %46 = bitcast { i64, i32 }* %5 to i8*, !dbg !746
  %47 = bitcast %struct.dim3* %3 to i8*, !dbg !746
  %48 = call i8* @memcpy(i8* %46, i8* %47, i64 12)
  %49 = getelementptr { i64, i32 }* %5, i32 0, i32 0, !dbg !746
  %50 = load i64* %49, align 1, !dbg !746
  %51 = getelementptr { i64, i32 }* %5, i32 0, i32 1, !dbg !746
  %52 = load i32* %51, align 1, !dbg !746
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %43, i32 %45, i64 %50, i32 %52), !dbg !746
  %53 = load i8** %dev_a, align 8, !dbg !748
  %54 = load i8** %dev_b, align 8, !dbg !748
  %55 = load i8** %dev_c, align 8, !dbg !748
  call void @_Z3fooPcS_S_(i8* %53, i8* %54, i8* %55), !dbg !748
  %56 = load i32* %size, align 4, !dbg !749
  %57 = sext i32 %56 to i64, !dbg !749
  %58 = call noalias i8* @malloc(i64 %57) nounwind, !dbg !749
  store i8* %58, i8** %d, align 8, !dbg !749
  %59 = load i32* %size, align 4, !dbg !750
  %60 = sext i32 %59 to i64, !dbg !750
  %61 = call noalias i8* @malloc(i64 %60) nounwind, !dbg !750
  store i8* %61, i8** %e, align 8, !dbg !750
  %62 = load i8** %d, align 8, !dbg !751
  %63 = load i8** %dev_a, align 8, !dbg !751
  %64 = load i32* %size, align 4, !dbg !751
  %65 = sext i32 %64 to i64, !dbg !751
  %66 = call i32 @cudaMemcpy(i8* %62, i8* %63, i64 %65, i32 2), !dbg !751
  %67 = load i8** %e, align 8, !dbg !752
  %68 = load i8** %dev_b, align 8, !dbg !752
  %69 = load i32* %size, align 4, !dbg !752
  %70 = sext i32 %69 to i64, !dbg !752
  %71 = call i32 @cudaMemcpy(i8* %67, i8* %68, i64 %70, i32 2), !dbg !752
  %72 = load i8** %a, align 8, !dbg !753
  call void @free(i8* %72) nounwind, !dbg !753
  %73 = load i8** %d, align 8, !dbg !753
  call void @free(i8* %73) nounwind, !dbg !753
  %74 = load i8** %b, align 8, !dbg !753
  call void @free(i8* %74) nounwind, !dbg !753
  %75 = load i8** %e, align 8, !dbg !753
  call void @free(i8* %75) nounwind, !dbg !753
  %76 = load i8** %dev_a, align 8, !dbg !754
  %77 = call i32 @cudaFree(i8* %76), !dbg !754
  %78 = load i8** %dev_b, align 8, !dbg !755
  %79 = call i32 @cudaFree(i8* %78), !dbg !755
  %80 = load i8** %dev_c, align 8, !dbg !756
  %81 = call i32 @cudaFree(i8* %80), !dbg !756
  ret i32 0, !dbg !757
}

declare noalias i8* @malloc(i64) nounwind

declare i8* @strcpy(i8*, i8*) nounwind

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
  %6 = load i32* %2, align 4, !dbg !758
  %7 = load i32* %3, align 4, !dbg !758
  %8 = load i32* %4, align 4, !dbg !758
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %5, i32 %6, i32 %7, i32 %8), !dbg !758
  ret void, !dbg !758
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

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

!llvm.dbg.cu = !{!0, !72, !94, !110, !127}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/105_fail", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !11, 
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/105_fail", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !21, metadata !24, metadata !28, metadata !71}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"swap", metadata !"swap", metadata !"_Z4swapPcS_", metadata !16, i32 13, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*, i8*)* @_Z4swapPcS_, null, null, metada
!16 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/105_fail", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!20 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!21 = metadata !{i32 786478, i32 0, metadata !16, metadata !"foo", metadata !"foo", metadata !"_Z3fooPcS_S_", metadata !16, i32 22, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*, i8*, i8*)* @_Z3fooPcS_S_, null, null, m
!22 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{null, metadata !19, metadata !19, metadata !19}
!24 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 30, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !11, i32 30} ; [ DW_TAG_
!25 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!28 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !29, i32 419, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!29 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/luiz/Projetos/benchLuiz/benchmarksGklee/105_fail", null} ; [ DW_TAG_file_type ]
!30 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{null, metadata !32, metadata !36, metadata !36, metadata !36}
!32 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!33 = metadata !{i32 786451, null, metadata !"dim3", metadata !29, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !34, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!34 = metadata !{metadata !35, metadata !37, metadata !38, metadata !39, metadata !42, metadata !60, metadata !63, metadata !68}
!35 = metadata !{i32 786445, metadata !33, metadata !"x", metadata !29, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !36} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!36 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!37 = metadata !{i32 786445, metadata !33, metadata !"y", metadata !29, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !36} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!38 = metadata !{i32 786445, metadata !33, metadata !"z", metadata !29, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !36} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!39 = metadata !{i32 786478, i32 0, metadata !33, metadata !"dim3", metadata !"dim3", metadata !"", metadata !29, i32 419, metadata !30, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !40, i32 419} ; [ DW_TAG_subpr
!40 = metadata !{metadata !41}
!41 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!42 = metadata !{i32 786478, i32 0, metadata !33, metadata !"dim3", metadata !"dim3", metadata !"", metadata !29, i32 420, metadata !43, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !40, i32 420} ; [ DW_TAG_subpr
!43 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = metadata !{null, metadata !32, metadata !45}
!45 = metadata !{i32 786454, null, metadata !"uint3", metadata !29, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!46 = metadata !{i32 786451, null, metadata !"uint3", metadata !29, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !47, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!47 = metadata !{metadata !48, metadata !49, metadata !50, metadata !51, metadata !55}
!48 = metadata !{i32 786445, metadata !46, metadata !"x", metadata !29, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !36} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!49 = metadata !{i32 786445, metadata !46, metadata !"y", metadata !29, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !36} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!50 = metadata !{i32 786445, metadata !46, metadata !"z", metadata !29, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !36} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!51 = metadata !{i32 786478, i32 0, metadata !46, metadata !"uint3", metadata !"uint3", metadata !"", metadata !29, i32 188, metadata !52, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !40, i32 188} ; [ DW_TAG_sub
!52 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{null, metadata !54}
!54 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !46} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!55 = metadata !{i32 786478, i32 0, metadata !46, metadata !"uint3", metadata !"uint3", metadata !"", metadata !29, i32 188, metadata !56, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !40, i32 188} ; [ DW_TAG_sub
!56 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !57, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!57 = metadata !{null, metadata !54, metadata !58}
!58 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !59} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!60 = metadata !{i32 786478, i32 0, metadata !33, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !29, i32 421, metadata !61, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!61 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !62, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = metadata !{metadata !45, metadata !32}
!63 = metadata !{i32 786478, i32 0, metadata !33, metadata !"dim3", metadata !"dim3", metadata !"", metadata !29, i32 415, metadata !64, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !40, i32 415} ; [ DW_TAG_subpr
!64 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !65, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!65 = metadata !{null, metadata !32, metadata !66}
!66 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!68 = metadata !{i32 786478, i32 0, metadata !33, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !29, i32 415, metadata !69, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !40, i32 415} ; [ DW_TAG_sub
!69 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{null, metadata !32}
!71 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !29, i32 419, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!72 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (
!73 = metadata !{metadata !74}
!74 = metadata !{metadata !75}
!75 = metadata !{i32 786478, i32 0, metadata !76, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !76, i32 12, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !84, i
!76 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!77 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !78, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = metadata !{metadata !79, metadata !79, metadata !80, metadata !82}
!79 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!80 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !81} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!81 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = metadata !{i32 786454, null, metadata !"size_t", metadata !76, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!83 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!84 = metadata !{metadata !85}
!85 = metadata !{metadata !86, metadata !87, metadata !88, metadata !89, metadata !91}
!86 = metadata !{i32 786689, metadata !75, metadata !"destaddr", metadata !76, i32 16777228, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!87 = metadata !{i32 786689, metadata !75, metadata !"srcaddr", metadata !76, i32 33554444, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!88 = metadata !{i32 786689, metadata !75, metadata !"len", metadata !76, i32 50331660, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!89 = metadata !{i32 786688, metadata !90, metadata !"dest", metadata !76, i32 13, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!90 = metadata !{i32 786443, metadata !75, i32 12, i32 0, metadata !76, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/m
!91 = metadata !{i32 786688, metadata !90, metadata !"src", metadata !76, i32 14, metadata !92, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!92 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !93} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!93 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!94 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!95 = metadata !{metadata !96}
!96 = metadata !{metadata !97}
!97 = metadata !{i32 786478, i32 0, metadata !98, metadata !"memmove", metadata !"memmove", metadata !"", metadata !98, i32 12, metadata !99, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !102, i32 12} ; [ DW_TAG_sub
!98 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!99 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !100, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!100 = metadata !{metadata !79, metadata !79, metadata !80, metadata !101}
!101 = metadata !{i32 786454, null, metadata !"size_t", metadata !98, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!102 = metadata !{metadata !103}
!103 = metadata !{metadata !104, metadata !105, metadata !106, metadata !107, metadata !109}
!104 = metadata !{i32 786689, metadata !97, metadata !"dst", metadata !98, i32 16777228, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!105 = metadata !{i32 786689, metadata !97, metadata !"src", metadata !98, i32 33554444, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!106 = metadata !{i32 786689, metadata !97, metadata !"count", metadata !98, i32 50331660, metadata !101, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!107 = metadata !{i32 786688, metadata !108, metadata !"a", metadata !98, i32 14, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!108 = metadata !{i32 786443, metadata !97, i32 12, i32 0, metadata !98, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/
!109 = metadata !{i32 786688, metadata !108, metadata !"b", metadata !98, i32 15, metadata !92, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!110 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 
!111 = metadata !{metadata !112}
!112 = metadata !{metadata !113}
!113 = metadata !{i32 786478, i32 0, metadata !114, metadata !"memset", metadata !"memset", metadata !"", metadata !114, i32 12, metadata !115, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!114 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!115 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !116, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!116 = metadata !{metadata !79, metadata !79, metadata !27, metadata !117}
!117 = metadata !{i32 786454, null, metadata !"size_t", metadata !114, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!118 = metadata !{metadata !119}
!119 = metadata !{metadata !120, metadata !121, metadata !122, metadata !123}
!120 = metadata !{i32 786689, metadata !113, metadata !"dst", metadata !114, i32 16777228, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!121 = metadata !{i32 786689, metadata !113, metadata !"s", metadata !114, i32 33554444, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!122 = metadata !{i32 786689, metadata !113, metadata !"count", metadata !114, i32 50331660, metadata !117, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!123 = metadata !{i32 786688, metadata !124, metadata !"a", metadata !114, i32 13, metadata !125, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!124 = metadata !{i32 786443, metadata !113, i32 12, i32 0, metadata !114, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/Intrinsic//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Intrinsi
!125 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !126} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!126 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!127 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang
!128 = metadata !{metadata !129}
!129 = metadata !{metadata !130, metadata !205, metadata !211}
!130 = metadata !{i32 786436, null, metadata !"cudaError", metadata !131, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !132, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!131 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!132 = metadata !{metadata !133, metadata !134, metadata !135, metadata !136, metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !1
!133 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!134 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!135 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!136 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!137 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!138 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!139 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!140 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!141 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!142 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!143 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!144 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!145 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!146 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!147 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!148 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!149 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!150 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!151 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!152 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!153 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!154 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!155 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!156 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!157 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!158 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!159 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!160 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!161 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!162 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!163 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!164 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!165 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!166 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!167 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!168 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!169 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!170 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!171 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!172 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!173 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!174 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!175 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!176 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!177 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!178 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!179 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!180 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!181 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!182 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!183 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!184 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!185 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!186 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!187 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!188 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!189 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!190 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!191 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!192 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!193 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!194 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!195 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!196 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!197 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!198 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!199 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!200 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!201 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!202 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!203 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!204 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!205 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !131, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !206, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!206 = metadata !{metadata !207, metadata !208, metadata !209, metadata !210}
!207 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!208 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!209 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!210 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!211 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !131, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!212 = metadata !{metadata !213}
!213 = metadata !{metadata !214, metadata !243, metadata !249, metadata !255, metadata !259, metadata !267, metadata !275, metadata !283, metadata !291, metadata !298, metadata !306, metadata !310, metadata !317, metadata !331, metadata !341, metadata !3
!214 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !215, i32 24, metadata !216, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!215 = metadata !{i32 786473, metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!216 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !217, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!217 = metadata !{metadata !218, metadata !219, metadata !227, metadata !234, metadata !235}
!218 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !215, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !130} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!219 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !220} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!220 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !131, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !221, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!221 = metadata !{metadata !222, metadata !223, metadata !224, metadata !225, metadata !226}
!222 = metadata !{i32 786445, metadata !220, metadata !"x", metadata !131, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !27} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!223 = metadata !{i32 786445, metadata !220, metadata !"y", metadata !131, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !27} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!224 = metadata !{i32 786445, metadata !220, metadata !"z", metadata !131, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !27} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!225 = metadata !{i32 786445, metadata !220, metadata !"w", metadata !131, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !27} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!226 = metadata !{i32 786445, metadata !220, metadata !"f", metadata !131, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !205} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!227 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !228} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!228 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !131, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !229, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!229 = metadata !{metadata !230, metadata !232, metadata !233}
!230 = metadata !{i32 786445, metadata !228, metadata !"width", metadata !131, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !231} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!231 = metadata !{i32 786454, null, metadata !"size_t", metadata !131, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!232 = metadata !{i32 786445, metadata !228, metadata !"height", metadata !131, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !231} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!233 = metadata !{i32 786445, metadata !228, metadata !"depth", metadata !131, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !231} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!234 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!235 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !236} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!236 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !131, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!237 = metadata !{metadata !238}
!238 = metadata !{metadata !239, metadata !240, metadata !241, metadata !242}
!239 = metadata !{i32 786689, metadata !214, metadata !"desc", metadata !215, i32 16777240, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!240 = metadata !{i32 786689, metadata !214, metadata !"extent", metadata !215, i32 33554456, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!241 = metadata !{i32 786689, metadata !214, metadata !"flags", metadata !215, i32 50331673, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!242 = metadata !{i32 786689, metadata !214, metadata !"array", metadata !215, i32 67108889, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!243 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !215, i32 29, metadata !244, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !246, 
!244 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !245, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!245 = metadata !{metadata !218, metadata !79}
!246 = metadata !{metadata !247}
!247 = metadata !{metadata !248}
!248 = metadata !{i32 786689, metadata !243, metadata !"devPtr", metadata !215, i32 16777245, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!249 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !215, i32 34, metadata !250, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!250 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !251, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!251 = metadata !{metadata !218, metadata !235}
!252 = metadata !{metadata !253}
!253 = metadata !{metadata !254}
!254 = metadata !{i32 786689, metadata !249, metadata !"array", metadata !215, i32 16777250, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!255 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !215, i32 39, metadata !244, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!256 = metadata !{metadata !257}
!257 = metadata !{metadata !258}
!258 = metadata !{i32 786689, metadata !255, metadata !"ptr", metadata !215, i32 16777255, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!259 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !215, i32 44, metadata !260, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!260 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !261, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!261 = metadata !{metadata !218, metadata !262, metadata !92}
!262 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !79} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!263 = metadata !{metadata !264}
!264 = metadata !{metadata !265, metadata !266}
!265 = metadata !{i32 786689, metadata !259, metadata !"devPtr", metadata !215, i32 16777260, metadata !262, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!266 = metadata !{i32 786689, metadata !259, metadata !"symbol", metadata !215, i32 33554476, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!267 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !215, i32 48, metadata !268, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!268 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !269, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!269 = metadata !{metadata !218, metadata !270, metadata !92}
!270 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !231} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!271 = metadata !{metadata !272}
!272 = metadata !{metadata !273, metadata !274}
!273 = metadata !{i32 786689, metadata !267, metadata !"size", metadata !215, i32 16777264, metadata !270, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!274 = metadata !{i32 786689, metadata !267, metadata !"symbol", metadata !215, i32 33554480, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!275 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !215, i32 52, metadata !276, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!276 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !277, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!277 = metadata !{metadata !218, metadata !262, metadata !231, metadata !36}
!278 = metadata !{metadata !279}
!279 = metadata !{metadata !280, metadata !281, metadata !282}
!280 = metadata !{i32 786689, metadata !275, metadata !"pHost", metadata !215, i32 16777268, metadata !262, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!281 = metadata !{i32 786689, metadata !275, metadata !"size", metadata !215, i32 33554484, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!282 = metadata !{i32 786689, metadata !275, metadata !"flags", metadata !215, i32 50331700, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!283 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !215, i32 56, metadata !284, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!284 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !285, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!285 = metadata !{metadata !218, metadata !262, metadata !79, metadata !36}
!286 = metadata !{metadata !287}
!287 = metadata !{metadata !288, metadata !289, metadata !290}
!288 = metadata !{i32 786689, metadata !283, metadata !"pDevice", metadata !215, i32 16777272, metadata !262, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!289 = metadata !{i32 786689, metadata !283, metadata !"pHost", metadata !215, i32 33554488, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!290 = metadata !{i32 786689, metadata !283, metadata !"flags", metadata !215, i32 50331704, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!291 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !215, i32 60, metadata !292, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!292 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !293, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!293 = metadata !{metadata !218, metadata !234, metadata !79}
!294 = metadata !{metadata !295}
!295 = metadata !{metadata !296, metadata !297}
!296 = metadata !{i32 786689, metadata !291, metadata !"pFlags", metadata !215, i32 16777276, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!297 = metadata !{i32 786689, metadata !291, metadata !"pHost", metadata !215, i32 33554492, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!298 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !215, i32 64, metadata !299, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!299 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !300, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!300 = metadata !{metadata !218, metadata !79, metadata !231, metadata !36}
!301 = metadata !{metadata !302}
!302 = metadata !{metadata !303, metadata !304, metadata !305}
!303 = metadata !{i32 786689, metadata !298, metadata !"ptr", metadata !215, i32 16777280, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!304 = metadata !{i32 786689, metadata !298, metadata !"size", metadata !215, i32 33554496, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!305 = metadata !{i32 786689, metadata !298, metadata !"flags", metadata !215, i32 50331712, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!306 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !215, i32 68, metadata !244, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!307 = metadata !{metadata !308}
!308 = metadata !{metadata !309}
!309 = metadata !{i32 786689, metadata !306, metadata !"ptr", metadata !215, i32 16777284, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!310 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !215, i32 72, metadata !311, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!311 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !312, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!312 = metadata !{metadata !218, metadata !262, metadata !231}
!313 = metadata !{metadata !314}
!314 = metadata !{metadata !315, metadata !316}
!315 = metadata !{i32 786689, metadata !310, metadata !"devPtr", metadata !215, i32 16777288, metadata !262, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!316 = metadata !{i32 786689, metadata !310, metadata !"size", metadata !215, i32 33554504, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!317 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !215, i32 80, metadata !318, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!318 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !319, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!319 = metadata !{metadata !218, metadata !320, metadata !228}
!320 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !321} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!321 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !131, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !322, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!322 = metadata !{metadata !323, metadata !324, metadata !325, metadata !326}
!323 = metadata !{i32 786445, metadata !321, metadata !"ptr", metadata !131, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !79} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!324 = metadata !{i32 786445, metadata !321, metadata !"pitch", metadata !131, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !231} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!325 = metadata !{i32 786445, metadata !321, metadata !"xsize", metadata !131, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !231} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!326 = metadata !{i32 786445, metadata !321, metadata !"ysize", metadata !131, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !231} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!327 = metadata !{metadata !328}
!328 = metadata !{metadata !329, metadata !330}
!329 = metadata !{i32 786689, metadata !317, metadata !"pitchedDevPtr", metadata !215, i32 16777296, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!330 = metadata !{i32 786689, metadata !317, metadata !"extent", metadata !215, i32 33554512, metadata !228, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!331 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !215, i32 84, metadata !332, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!332 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !333, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!333 = metadata !{metadata !218, metadata !334, metadata !219, metadata !228, metadata !36}
!334 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !235} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!335 = metadata !{metadata !336}
!336 = metadata !{metadata !337, metadata !338, metadata !339, metadata !340}
!337 = metadata !{i32 786689, metadata !331, metadata !"array", metadata !215, i32 16777300, metadata !334, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!338 = metadata !{i32 786689, metadata !331, metadata !"desc", metadata !215, i32 33554516, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!339 = metadata !{i32 786689, metadata !331, metadata !"extent", metadata !215, i32 50331733, metadata !228, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!340 = metadata !{i32 786689, metadata !331, metadata !"flags", metadata !215, i32 67108949, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!341 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !215, i32 89, metadata !342, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!342 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !343, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!343 = metadata !{metadata !218, metadata !334, metadata !219, metadata !231, metadata !231, metadata !36}
!344 = metadata !{metadata !345}
!345 = metadata !{metadata !346, metadata !347, metadata !348, metadata !349, metadata !350}
!346 = metadata !{i32 786689, metadata !341, metadata !"array", metadata !215, i32 16777305, metadata !334, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!347 = metadata !{i32 786689, metadata !341, metadata !"desc", metadata !215, i32 33554521, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!348 = metadata !{i32 786689, metadata !341, metadata !"width", metadata !215, i32 50331738, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!349 = metadata !{i32 786689, metadata !341, metadata !"height", metadata !215, i32 67108954, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!350 = metadata !{i32 786689, metadata !341, metadata !"flags", metadata !215, i32 83886170, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!351 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !215, i32 94, metadata !311, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!352 = metadata !{metadata !353}
!353 = metadata !{metadata !354, metadata !355}
!354 = metadata !{i32 786689, metadata !351, metadata !"ptr", metadata !215, i32 16777310, metadata !262, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!355 = metadata !{i32 786689, metadata !351, metadata !"size", metadata !215, i32 33554526, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!356 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !215, i32 102, metadata !357, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!357 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !358, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!358 = metadata !{metadata !218, metadata !262, metadata !270, metadata !231, metadata !231}
!359 = metadata !{metadata !360}
!360 = metadata !{metadata !361, metadata !362, metadata !363, metadata !364}
!361 = metadata !{i32 786689, metadata !356, metadata !"devPtr", metadata !215, i32 16777318, metadata !262, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!362 = metadata !{i32 786689, metadata !356, metadata !"pitch", metadata !215, i32 33554534, metadata !270, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!363 = metadata !{i32 786689, metadata !356, metadata !"width", metadata !215, i32 50331750, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!364 = metadata !{i32 786689, metadata !356, metadata !"height", metadata !215, i32 67108966, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!365 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !215, i32 106, metadata !366, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!366 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !367, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!367 = metadata !{metadata !218, metadata !79, metadata !80, metadata !231, metadata !211}
!368 = metadata !{metadata !369}
!369 = metadata !{metadata !370, metadata !371, metadata !372, metadata !373}
!370 = metadata !{i32 786689, metadata !365, metadata !"dst", metadata !215, i32 16777322, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!371 = metadata !{i32 786689, metadata !365, metadata !"src", metadata !215, i32 33554538, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!372 = metadata !{i32 786689, metadata !365, metadata !"count", metadata !215, i32 50331754, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!373 = metadata !{i32 786689, metadata !365, metadata !"kind", metadata !215, i32 67108970, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!374 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !215, i32 111, metadata !375, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!375 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !376, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!376 = metadata !{metadata !218, metadata !79, metadata !231, metadata !80, metadata !231, metadata !231, metadata !231, metadata !211}
!377 = metadata !{metadata !378}
!378 = metadata !{metadata !379, metadata !380, metadata !381, metadata !382, metadata !383, metadata !384, metadata !385}
!379 = metadata !{i32 786689, metadata !374, metadata !"dst", metadata !215, i32 16777327, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!380 = metadata !{i32 786689, metadata !374, metadata !"dpitch", metadata !215, i32 33554543, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!381 = metadata !{i32 786689, metadata !374, metadata !"src", metadata !215, i32 50331759, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!382 = metadata !{i32 786689, metadata !374, metadata !"spitch", metadata !215, i32 67108975, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!383 = metadata !{i32 786689, metadata !374, metadata !"width", metadata !215, i32 83886192, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!384 = metadata !{i32 786689, metadata !374, metadata !"height", metadata !215, i32 100663408, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!385 = metadata !{i32 786689, metadata !374, metadata !"kind", metadata !215, i32 117440624, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!386 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !215, i32 116, metadata !387, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!387 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !388, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!388 = metadata !{metadata !218, metadata !235, metadata !231, metadata !231, metadata !235, metadata !231, metadata !231, metadata !231, metadata !231, metadata !211}
!389 = metadata !{metadata !390}
!390 = metadata !{metadata !391, metadata !392, metadata !393, metadata !394, metadata !395, metadata !396, metadata !397, metadata !398, metadata !399}
!391 = metadata !{i32 786689, metadata !386, metadata !"dst", metadata !215, i32 16777332, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!392 = metadata !{i32 786689, metadata !386, metadata !"wOffsetDst", metadata !215, i32 33554548, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!393 = metadata !{i32 786689, metadata !386, metadata !"hOffsetDst", metadata !215, i32 50331764, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!394 = metadata !{i32 786689, metadata !386, metadata !"src", metadata !215, i32 67108981, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!395 = metadata !{i32 786689, metadata !386, metadata !"wOffsetSrc", metadata !215, i32 83886197, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!396 = metadata !{i32 786689, metadata !386, metadata !"hOffsetSrc", metadata !215, i32 100663413, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!397 = metadata !{i32 786689, metadata !386, metadata !"width", metadata !215, i32 117440630, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!398 = metadata !{i32 786689, metadata !386, metadata !"height", metadata !215, i32 134217846, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!399 = metadata !{i32 786689, metadata !386, metadata !"kind", metadata !215, i32 150995062, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!400 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !215, i32 122, metadata !401, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!401 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !402, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!402 = metadata !{metadata !218, metadata !79, metadata !231, metadata !80, metadata !231, metadata !231, metadata !231, metadata !211, metadata !403}
!403 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !215, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !404} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!404 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !405} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!405 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !131, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!406 = metadata !{metadata !407}
!407 = metadata !{metadata !408, metadata !409, metadata !410, metadata !411, metadata !412, metadata !413, metadata !414, metadata !415}
!408 = metadata !{i32 786689, metadata !400, metadata !"dst", metadata !215, i32 16777338, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!409 = metadata !{i32 786689, metadata !400, metadata !"dpitch", metadata !215, i32 33554554, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!410 = metadata !{i32 786689, metadata !400, metadata !"src", metadata !215, i32 50331770, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!411 = metadata !{i32 786689, metadata !400, metadata !"spitch", metadata !215, i32 67108986, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!412 = metadata !{i32 786689, metadata !400, metadata !"width", metadata !215, i32 83886203, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!413 = metadata !{i32 786689, metadata !400, metadata !"height", metadata !215, i32 100663419, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!414 = metadata !{i32 786689, metadata !400, metadata !"kind", metadata !215, i32 117440635, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!415 = metadata !{i32 786689, metadata !400, metadata !"stream", metadata !215, i32 134217852, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!416 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !215, i32 128, metadata !417, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!417 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !418, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!418 = metadata !{metadata !218, metadata !79, metadata !231, metadata !235, metadata !231, metadata !231, metadata !231, metadata !231, metadata !211}
!419 = metadata !{metadata !420}
!420 = metadata !{metadata !421, metadata !422, metadata !423, metadata !424, metadata !425, metadata !426, metadata !427, metadata !428}
!421 = metadata !{i32 786689, metadata !416, metadata !"dst", metadata !215, i32 16777344, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!422 = metadata !{i32 786689, metadata !416, metadata !"dpitch", metadata !215, i32 33554560, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!423 = metadata !{i32 786689, metadata !416, metadata !"src", metadata !215, i32 50331776, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!424 = metadata !{i32 786689, metadata !416, metadata !"wOffset", metadata !215, i32 67108993, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!425 = metadata !{i32 786689, metadata !416, metadata !"hOffset", metadata !215, i32 83886209, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!426 = metadata !{i32 786689, metadata !416, metadata !"width", metadata !215, i32 100663425, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!427 = metadata !{i32 786689, metadata !416, metadata !"height", metadata !215, i32 117440641, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!428 = metadata !{i32 786689, metadata !416, metadata !"kind", metadata !215, i32 134217858, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!429 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !215, i32 134, metadata !430, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!430 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !431, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!431 = metadata !{metadata !218, metadata !79, metadata !231, metadata !235, metadata !231, metadata !231, metadata !231, metadata !231, metadata !211, metadata !403}
!432 = metadata !{metadata !433}
!433 = metadata !{metadata !434, metadata !435, metadata !436, metadata !437, metadata !438, metadata !439, metadata !440, metadata !441, metadata !442}
!434 = metadata !{i32 786689, metadata !429, metadata !"dst", metadata !215, i32 16777350, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!435 = metadata !{i32 786689, metadata !429, metadata !"dpitch", metadata !215, i32 33554566, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!436 = metadata !{i32 786689, metadata !429, metadata !"src", metadata !215, i32 50331782, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!437 = metadata !{i32 786689, metadata !429, metadata !"wOffset", metadata !215, i32 67108999, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!438 = metadata !{i32 786689, metadata !429, metadata !"hOffset", metadata !215, i32 83886215, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!439 = metadata !{i32 786689, metadata !429, metadata !"width", metadata !215, i32 100663431, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!440 = metadata !{i32 786689, metadata !429, metadata !"height", metadata !215, i32 117440647, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!441 = metadata !{i32 786689, metadata !429, metadata !"kind", metadata !215, i32 134217864, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!442 = metadata !{i32 786689, metadata !429, metadata !"stream", metadata !215, i32 150995080, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!443 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !215, i32 140, metadata !444, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!444 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !445, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!445 = metadata !{metadata !218, metadata !235, metadata !231, metadata !231, metadata !80, metadata !231, metadata !231, metadata !231, metadata !211}
!446 = metadata !{metadata !447}
!447 = metadata !{metadata !448, metadata !449, metadata !450, metadata !451, metadata !452, metadata !453, metadata !454, metadata !455}
!448 = metadata !{i32 786689, metadata !443, metadata !"dst", metadata !215, i32 16777356, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!449 = metadata !{i32 786689, metadata !443, metadata !"wOffset", metadata !215, i32 33554572, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!450 = metadata !{i32 786689, metadata !443, metadata !"hOffset", metadata !215, i32 50331788, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!451 = metadata !{i32 786689, metadata !443, metadata !"src", metadata !215, i32 67109005, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!452 = metadata !{i32 786689, metadata !443, metadata !"spitch", metadata !215, i32 83886221, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!453 = metadata !{i32 786689, metadata !443, metadata !"width", metadata !215, i32 100663437, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!454 = metadata !{i32 786689, metadata !443, metadata !"height", metadata !215, i32 117440653, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!455 = metadata !{i32 786689, metadata !443, metadata !"kind", metadata !215, i32 134217870, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!456 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !215, i32 146, metadata !457, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!457 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !458, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!458 = metadata !{metadata !218, metadata !235, metadata !231, metadata !231, metadata !80, metadata !231, metadata !231, metadata !231, metadata !211, metadata !403}
!459 = metadata !{metadata !460}
!460 = metadata !{metadata !461, metadata !462, metadata !463, metadata !464, metadata !465, metadata !466, metadata !467, metadata !468, metadata !469}
!461 = metadata !{i32 786689, metadata !456, metadata !"dst", metadata !215, i32 16777362, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!462 = metadata !{i32 786689, metadata !456, metadata !"wOffset", metadata !215, i32 33554578, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!463 = metadata !{i32 786689, metadata !456, metadata !"hOffset", metadata !215, i32 50331794, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!464 = metadata !{i32 786689, metadata !456, metadata !"src", metadata !215, i32 67109011, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!465 = metadata !{i32 786689, metadata !456, metadata !"spitch", metadata !215, i32 83886227, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!466 = metadata !{i32 786689, metadata !456, metadata !"width", metadata !215, i32 100663443, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!467 = metadata !{i32 786689, metadata !456, metadata !"height", metadata !215, i32 117440659, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!468 = metadata !{i32 786689, metadata !456, metadata !"kind", metadata !215, i32 134217876, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!469 = metadata !{i32 786689, metadata !456, metadata !"stream", metadata !215, i32 150995092, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!470 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !215, i32 152, metadata !471, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!471 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !472, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!472 = metadata !{metadata !218, metadata !473}
!473 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !474} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!474 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !475} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!475 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !131, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !476, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!476 = metadata !{metadata !477, metadata !479, metadata !485, metadata !486, metadata !487, metadata !488, metadata !489, metadata !490}
!477 = metadata !{i32 786445, metadata !475, metadata !"srcArray", metadata !131, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !478} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!478 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !131, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !235} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!479 = metadata !{i32 786445, metadata !475, metadata !"srcPos", metadata !131, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !480} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!480 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !131, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !481, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!481 = metadata !{metadata !482, metadata !483, metadata !484}
!482 = metadata !{i32 786445, metadata !480, metadata !"x", metadata !131, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !231} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!483 = metadata !{i32 786445, metadata !480, metadata !"y", metadata !131, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !231} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!484 = metadata !{i32 786445, metadata !480, metadata !"z", metadata !131, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !231} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!485 = metadata !{i32 786445, metadata !475, metadata !"srcPtr", metadata !131, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !321} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!486 = metadata !{i32 786445, metadata !475, metadata !"dstArray", metadata !131, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !478} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!487 = metadata !{i32 786445, metadata !475, metadata !"dstPos", metadata !131, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !480} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!488 = metadata !{i32 786445, metadata !475, metadata !"dstPtr", metadata !131, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !321} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!489 = metadata !{i32 786445, metadata !475, metadata !"extent", metadata !131, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !228} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!490 = metadata !{i32 786445, metadata !475, metadata !"kind", metadata !131, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !211} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!491 = metadata !{metadata !492}
!492 = metadata !{metadata !493}
!493 = metadata !{i32 786689, metadata !470, metadata !"p", metadata !215, i32 16777368, metadata !473, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!494 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !215, i32 156, metadata !495, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!495 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !496, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!496 = metadata !{metadata !218, metadata !473, metadata !403}
!497 = metadata !{metadata !498}
!498 = metadata !{metadata !499, metadata !500}
!499 = metadata !{i32 786689, metadata !494, metadata !"p", metadata !215, i32 16777372, metadata !473, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!500 = metadata !{i32 786689, metadata !494, metadata !"stream", metadata !215, i32 33554588, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!501 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !215, i32 160, metadata !502, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!502 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !503, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!503 = metadata !{metadata !218, metadata !504}
!504 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !505} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!505 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !506} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!506 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !131, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !507, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!507 = metadata !{metadata !508, metadata !509, metadata !510, metadata !511, metadata !512, metadata !513, metadata !514, metadata !515, metadata !516}
!508 = metadata !{i32 786445, metadata !506, metadata !"srcArray", metadata !131, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !478} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!509 = metadata !{i32 786445, metadata !506, metadata !"srcPos", metadata !131, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !480} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!510 = metadata !{i32 786445, metadata !506, metadata !"srcPtr", metadata !131, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !321} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!511 = metadata !{i32 786445, metadata !506, metadata !"srcDevice", metadata !131, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !27} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!512 = metadata !{i32 786445, metadata !506, metadata !"dstArray", metadata !131, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !478} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!513 = metadata !{i32 786445, metadata !506, metadata !"dstPos", metadata !131, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !480} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!514 = metadata !{i32 786445, metadata !506, metadata !"dstPtr", metadata !131, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !321} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!515 = metadata !{i32 786445, metadata !506, metadata !"dstDevice", metadata !131, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !27} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!516 = metadata !{i32 786445, metadata !506, metadata !"extent", metadata !131, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !228} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!517 = metadata !{metadata !518}
!518 = metadata !{metadata !519}
!519 = metadata !{i32 786689, metadata !501, metadata !"p", metadata !215, i32 16777376, metadata !504, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!520 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !215, i32 164, metadata !521, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!521 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !522, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!522 = metadata !{metadata !218, metadata !504, metadata !403}
!523 = metadata !{metadata !524}
!524 = metadata !{metadata !525, metadata !526}
!525 = metadata !{i32 786689, metadata !520, metadata !"p", metadata !215, i32 16777380, metadata !504, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!526 = metadata !{i32 786689, metadata !520, metadata !"stream", metadata !215, i32 33554596, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!527 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !215, i32 168, metadata !528, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!528 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !529, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!529 = metadata !{metadata !218, metadata !235, metadata !231, metadata !231, metadata !235, metadata !231, metadata !231, metadata !231, metadata !211}
!530 = metadata !{metadata !531}
!531 = metadata !{metadata !532, metadata !533, metadata !534, metadata !535, metadata !536, metadata !537, metadata !538, metadata !539}
!532 = metadata !{i32 786689, metadata !527, metadata !"dst", metadata !215, i32 16777384, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!533 = metadata !{i32 786689, metadata !527, metadata !"wOffsetDst", metadata !215, i32 33554600, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!534 = metadata !{i32 786689, metadata !527, metadata !"hOffsetDst", metadata !215, i32 50331816, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!535 = metadata !{i32 786689, metadata !527, metadata !"src", metadata !215, i32 67109033, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!536 = metadata !{i32 786689, metadata !527, metadata !"wOffsetSrc", metadata !215, i32 83886249, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!537 = metadata !{i32 786689, metadata !527, metadata !"hOffsetSrc", metadata !215, i32 100663465, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!538 = metadata !{i32 786689, metadata !527, metadata !"count", metadata !215, i32 117440682, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!539 = metadata !{i32 786689, metadata !527, metadata !"kind", metadata !215, i32 134217898, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!540 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !215, i32 174, metadata !541, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!541 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !542, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!542 = metadata !{metadata !218, metadata !79, metadata !80, metadata !231, metadata !211, metadata !403}
!543 = metadata !{metadata !544}
!544 = metadata !{metadata !545, metadata !546, metadata !547, metadata !548, metadata !549}
!545 = metadata !{i32 786689, metadata !540, metadata !"dst", metadata !215, i32 16777390, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!546 = metadata !{i32 786689, metadata !540, metadata !"src", metadata !215, i32 33554606, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!547 = metadata !{i32 786689, metadata !540, metadata !"count", metadata !215, i32 50331822, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!548 = metadata !{i32 786689, metadata !540, metadata !"kind", metadata !215, i32 67109039, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!549 = metadata !{i32 786689, metadata !540, metadata !"stream", metadata !215, i32 83886255, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!550 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !215, i32 179, metadata !551, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!551 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !552, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!552 = metadata !{metadata !218, metadata !79, metadata !235, metadata !231, metadata !231, metadata !231, metadata !211}
!553 = metadata !{metadata !554}
!554 = metadata !{metadata !555, metadata !556, metadata !557, metadata !558, metadata !559, metadata !560}
!555 = metadata !{i32 786689, metadata !550, metadata !"dst", metadata !215, i32 16777395, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!556 = metadata !{i32 786689, metadata !550, metadata !"src", metadata !215, i32 33554611, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!557 = metadata !{i32 786689, metadata !550, metadata !"wOffset", metadata !215, i32 50331827, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!558 = metadata !{i32 786689, metadata !550, metadata !"hOffset", metadata !215, i32 67109044, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!559 = metadata !{i32 786689, metadata !550, metadata !"count", metadata !215, i32 83886260, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!560 = metadata !{i32 786689, metadata !550, metadata !"kind", metadata !215, i32 100663476, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!561 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !215, i32 184, metadata !562, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!562 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !563, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!563 = metadata !{metadata !218, metadata !79, metadata !235, metadata !231, metadata !231, metadata !231, metadata !211, metadata !403}
!564 = metadata !{metadata !565}
!565 = metadata !{metadata !566, metadata !567, metadata !568, metadata !569, metadata !570, metadata !571, metadata !572}
!566 = metadata !{i32 786689, metadata !561, metadata !"dst", metadata !215, i32 16777400, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!567 = metadata !{i32 786689, metadata !561, metadata !"src", metadata !215, i32 33554616, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!568 = metadata !{i32 786689, metadata !561, metadata !"wOffset", metadata !215, i32 50331832, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!569 = metadata !{i32 786689, metadata !561, metadata !"hOffset", metadata !215, i32 67109049, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!570 = metadata !{i32 786689, metadata !561, metadata !"count", metadata !215, i32 83886265, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!571 = metadata !{i32 786689, metadata !561, metadata !"kind", metadata !215, i32 100663481, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!572 = metadata !{i32 786689, metadata !561, metadata !"stream", metadata !215, i32 117440698, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!573 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !215, i32 190, metadata !574, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!574 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !575, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!575 = metadata !{metadata !218, metadata !79, metadata !92, metadata !231, metadata !231, metadata !211}
!576 = metadata !{metadata !577}
!577 = metadata !{metadata !578, metadata !579, metadata !580, metadata !581, metadata !582}
!578 = metadata !{i32 786689, metadata !573, metadata !"dst", metadata !215, i32 16777406, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!579 = metadata !{i32 786689, metadata !573, metadata !"symbol", metadata !215, i32 33554622, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!580 = metadata !{i32 786689, metadata !573, metadata !"count", metadata !215, i32 50331838, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!581 = metadata !{i32 786689, metadata !573, metadata !"offset", metadata !215, i32 67109055, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!582 = metadata !{i32 786689, metadata !573, metadata !"kind", metadata !215, i32 83886271, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!583 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !215, i32 195, metadata !584, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!584 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !585, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!585 = metadata !{metadata !218, metadata !79, metadata !92, metadata !231, metadata !231, metadata !211, metadata !403}
!586 = metadata !{metadata !587}
!587 = metadata !{metadata !588, metadata !589, metadata !590, metadata !591, metadata !592, metadata !593}
!588 = metadata !{i32 786689, metadata !583, metadata !"dst", metadata !215, i32 16777411, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!589 = metadata !{i32 786689, metadata !583, metadata !"symbol", metadata !215, i32 33554627, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!590 = metadata !{i32 786689, metadata !583, metadata !"count", metadata !215, i32 50331843, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!591 = metadata !{i32 786689, metadata !583, metadata !"offset", metadata !215, i32 67109060, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!592 = metadata !{i32 786689, metadata !583, metadata !"kind", metadata !215, i32 83886276, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!593 = metadata !{i32 786689, metadata !583, metadata !"stream", metadata !215, i32 100663493, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!594 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !215, i32 201, metadata !595, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!595 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !596, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!596 = metadata !{metadata !218, metadata !79, metadata !27, metadata !80, metadata !27, metadata !231}
!597 = metadata !{metadata !598}
!598 = metadata !{metadata !599, metadata !600, metadata !601, metadata !602, metadata !603}
!599 = metadata !{i32 786689, metadata !594, metadata !"dst", metadata !215, i32 16777417, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!600 = metadata !{i32 786689, metadata !594, metadata !"dstDevice", metadata !215, i32 33554633, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!601 = metadata !{i32 786689, metadata !594, metadata !"src", metadata !215, i32 50331849, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!602 = metadata !{i32 786689, metadata !594, metadata !"srcDevice", metadata !215, i32 67109065, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!603 = metadata !{i32 786689, metadata !594, metadata !"count", metadata !215, i32 83886281, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!604 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !215, i32 206, metadata !605, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!605 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !606, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!606 = metadata !{metadata !218, metadata !79, metadata !27, metadata !80, metadata !27, metadata !231, metadata !403}
!607 = metadata !{metadata !608}
!608 = metadata !{metadata !609, metadata !610, metadata !611, metadata !612, metadata !613, metadata !614}
!609 = metadata !{i32 786689, metadata !604, metadata !"dst", metadata !215, i32 16777422, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!610 = metadata !{i32 786689, metadata !604, metadata !"dstDevice", metadata !215, i32 33554638, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!611 = metadata !{i32 786689, metadata !604, metadata !"src", metadata !215, i32 50331854, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!612 = metadata !{i32 786689, metadata !604, metadata !"srcDevice", metadata !215, i32 67109070, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!613 = metadata !{i32 786689, metadata !604, metadata !"count", metadata !215, i32 83886287, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!614 = metadata !{i32 786689, metadata !604, metadata !"stream", metadata !215, i32 100663503, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!615 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !215, i32 212, metadata !616, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!616 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !617, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!617 = metadata !{metadata !218, metadata !235, metadata !231, metadata !231, metadata !80, metadata !231, metadata !211}
!618 = metadata !{metadata !619}
!619 = metadata !{metadata !620, metadata !621, metadata !622, metadata !623, metadata !624, metadata !625}
!620 = metadata !{i32 786689, metadata !615, metadata !"dst", metadata !215, i32 16777428, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!621 = metadata !{i32 786689, metadata !615, metadata !"wOffset", metadata !215, i32 33554644, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!622 = metadata !{i32 786689, metadata !615, metadata !"hOffset", metadata !215, i32 50331860, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!623 = metadata !{i32 786689, metadata !615, metadata !"src", metadata !215, i32 67109077, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!624 = metadata !{i32 786689, metadata !615, metadata !"count", metadata !215, i32 83886293, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!625 = metadata !{i32 786689, metadata !615, metadata !"kind", metadata !215, i32 100663509, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!626 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !215, i32 217, metadata !627, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!627 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !628, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!628 = metadata !{metadata !218, metadata !235, metadata !231, metadata !231, metadata !80, metadata !231, metadata !211, metadata !403}
!629 = metadata !{metadata !630}
!630 = metadata !{metadata !631, metadata !632, metadata !633, metadata !634, metadata !635, metadata !636, metadata !637}
!631 = metadata !{i32 786689, metadata !626, metadata !"dst", metadata !215, i32 16777433, metadata !235, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!632 = metadata !{i32 786689, metadata !626, metadata !"wOffset", metadata !215, i32 33554649, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!633 = metadata !{i32 786689, metadata !626, metadata !"hOffset", metadata !215, i32 50331865, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!634 = metadata !{i32 786689, metadata !626, metadata !"src", metadata !215, i32 67109082, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!635 = metadata !{i32 786689, metadata !626, metadata !"count", metadata !215, i32 83886298, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!636 = metadata !{i32 786689, metadata !626, metadata !"kind", metadata !215, i32 100663514, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!637 = metadata !{i32 786689, metadata !626, metadata !"stream", metadata !215, i32 117440731, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!638 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !215, i32 223, metadata !639, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!639 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !640, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!640 = metadata !{metadata !218, metadata !19, metadata !80, metadata !231, metadata !231, metadata !211}
!641 = metadata !{metadata !642}
!642 = metadata !{metadata !643, metadata !644, metadata !645, metadata !646, metadata !647}
!643 = metadata !{i32 786689, metadata !638, metadata !"symbol", metadata !215, i32 16777439, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!644 = metadata !{i32 786689, metadata !638, metadata !"src", metadata !215, i32 33554655, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!645 = metadata !{i32 786689, metadata !638, metadata !"count", metadata !215, i32 50331871, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!646 = metadata !{i32 786689, metadata !638, metadata !"offset", metadata !215, i32 67109088, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!647 = metadata !{i32 786689, metadata !638, metadata !"kind", metadata !215, i32 83886304, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!648 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !215, i32 229, metadata !649, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!649 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !650, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!650 = metadata !{metadata !218, metadata !92, metadata !80, metadata !231, metadata !231, metadata !211, metadata !403}
!651 = metadata !{metadata !652}
!652 = metadata !{metadata !653, metadata !654, metadata !655, metadata !656, metadata !657, metadata !658}
!653 = metadata !{i32 786689, metadata !648, metadata !"symbol", metadata !215, i32 16777445, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!654 = metadata !{i32 786689, metadata !648, metadata !"src", metadata !215, i32 33554661, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!655 = metadata !{i32 786689, metadata !648, metadata !"count", metadata !215, i32 50331877, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!656 = metadata !{i32 786689, metadata !648, metadata !"offset", metadata !215, i32 67109093, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!657 = metadata !{i32 786689, metadata !648, metadata !"kind", metadata !215, i32 83886310, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!658 = metadata !{i32 786689, metadata !648, metadata !"stream", metadata !215, i32 100663526, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!659 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !215, i32 234, metadata !660, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!660 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !661, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!661 = metadata !{metadata !218, metadata !270, metadata !270}
!662 = metadata !{metadata !663}
!663 = metadata !{metadata !664, metadata !665}
!664 = metadata !{i32 786689, metadata !659, metadata !"free", metadata !215, i32 16777450, metadata !270, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!665 = metadata !{i32 786689, metadata !659, metadata !"total", metadata !215, i32 33554666, metadata !270, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!666 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !215, i32 238, metadata !667, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!667 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !668, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!668 = metadata !{metadata !218, metadata !79, metadata !27, metadata !231}
!669 = metadata !{metadata !670}
!670 = metadata !{metadata !671, metadata !672, metadata !673}
!671 = metadata !{i32 786689, metadata !666, metadata !"devPtr", metadata !215, i32 16777454, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!672 = metadata !{i32 786689, metadata !666, metadata !"value", metadata !215, i32 33554670, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!673 = metadata !{i32 786689, metadata !666, metadata !"count", metadata !215, i32 50331886, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!674 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !215, i32 243, metadata !675, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!675 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !676, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!676 = metadata !{metadata !218, metadata !79, metadata !231, metadata !27, metadata !231, metadata !231}
!677 = metadata !{metadata !678}
!678 = metadata !{metadata !679, metadata !680, metadata !681, metadata !682, metadata !683}
!679 = metadata !{i32 786689, metadata !674, metadata !"devPtr", metadata !215, i32 16777459, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!680 = metadata !{i32 786689, metadata !674, metadata !"pitch", metadata !215, i32 33554675, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!681 = metadata !{i32 786689, metadata !674, metadata !"value", metadata !215, i32 50331891, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!682 = metadata !{i32 786689, metadata !674, metadata !"width", metadata !215, i32 67109108, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!683 = metadata !{i32 786689, metadata !674, metadata !"height", metadata !215, i32 83886324, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!684 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !215, i32 248, metadata !685, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!685 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !686, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!686 = metadata !{metadata !218, metadata !79, metadata !231, metadata !27, metadata !231, metadata !231, metadata !403}
!687 = metadata !{metadata !688}
!688 = metadata !{metadata !689, metadata !690, metadata !691, metadata !692, metadata !693, metadata !694}
!689 = metadata !{i32 786689, metadata !684, metadata !"devPtr", metadata !215, i32 16777464, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!690 = metadata !{i32 786689, metadata !684, metadata !"pitch", metadata !215, i32 33554680, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!691 = metadata !{i32 786689, metadata !684, metadata !"value", metadata !215, i32 50331896, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!692 = metadata !{i32 786689, metadata !684, metadata !"width", metadata !215, i32 67109113, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!693 = metadata !{i32 786689, metadata !684, metadata !"height", metadata !215, i32 83886329, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!694 = metadata !{i32 786689, metadata !684, metadata !"stream", metadata !215, i32 100663545, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!695 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !215, i32 253, metadata !696, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!696 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !697, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!697 = metadata !{metadata !218, metadata !321, metadata !27, metadata !228}
!698 = metadata !{metadata !699}
!699 = metadata !{metadata !700, metadata !701, metadata !702}
!700 = metadata !{i32 786689, metadata !695, metadata !"pitchedDevPtr", metadata !215, i32 16777469, metadata !321, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!701 = metadata !{i32 786689, metadata !695, metadata !"value", metadata !215, i32 33554685, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!702 = metadata !{i32 786689, metadata !695, metadata !"extent", metadata !215, i32 50331902, metadata !228, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!703 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !215, i32 258, metadata !704, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!704 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !705, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!705 = metadata !{metadata !218, metadata !321, metadata !27, metadata !228, metadata !403}
!706 = metadata !{metadata !707}
!707 = metadata !{metadata !708, metadata !709, metadata !710, metadata !711}
!708 = metadata !{i32 786689, metadata !703, metadata !"pitchedDevPtr", metadata !215, i32 16777474, metadata !321, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!709 = metadata !{i32 786689, metadata !703, metadata !"value", metadata !215, i32 33554690, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!710 = metadata !{i32 786689, metadata !703, metadata !"extent", metadata !215, i32 50331907, metadata !228, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!711 = metadata !{i32 786689, metadata !703, metadata !"stream", metadata !215, i32 67109123, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!712 = metadata !{i32 786478, i32 0, metadata !215, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !215, i32 263, metadata !713, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!713 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !714, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!714 = metadata !{metadata !218, metadata !79, metadata !27, metadata !231, metadata !403}
!715 = metadata !{metadata !716}
!716 = metadata !{metadata !717, metadata !718, metadata !719, metadata !720}
!717 = metadata !{i32 786689, metadata !712, metadata !"devPtr", metadata !215, i32 16777479, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!718 = metadata !{i32 786689, metadata !712, metadata !"value", metadata !215, i32 33554695, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!719 = metadata !{i32 786689, metadata !712, metadata !"count", metadata !215, i32 50331911, metadata !231, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!720 = metadata !{i32 786689, metadata !712, metadata !"stream", metadata !215, i32 67109127, metadata !403, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!721 = metadata !{i32 15, i32 0, metadata !722, null}
!722 = metadata !{i32 786443, metadata !15, i32 13, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/105_fail/main.cpp]
!723 = metadata !{i32 16, i32 0, metadata !722, null}
!724 = metadata !{i32 17, i32 0, metadata !722, null}
!725 = metadata !{i32 18, i32 0, metadata !722, null}
!726 = metadata !{i32 19, i32 0, metadata !722, null}
!727 = metadata !{i32 20, i32 0, metadata !722, null}
!728 = metadata !{i32 24, i32 0, metadata !729, null}
!729 = metadata !{i32 786443, metadata !21, i32 23, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/105_fail/main.cpp]
!730 = metadata !{i32 25, i32 0, metadata !729, null}
!731 = metadata !{i32 26, i32 0, metadata !729, null}
!732 = metadata !{i32 27, i32 0, metadata !729, null}
!733 = metadata !{i32 28, i32 0, metadata !729, null}
!734 = metadata !{i32 39, i32 0, metadata !735, null}
!735 = metadata !{i32 786443, metadata !24, i32 30, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/105_fail/main.cpp]
!736 = metadata !{i32 41, i32 0, metadata !735, null}
!737 = metadata !{i32 42, i32 0, metadata !735, null}
!738 = metadata !{i32 43, i32 0, metadata !735, null}
!739 = metadata !{i32 45, i32 0, metadata !735, null}
!740 = metadata !{i32 46, i32 0, metadata !735, null}
!741 = metadata !{i32 48, i32 0, metadata !735, null}
!742 = metadata !{i32 49, i32 0, metadata !735, null}
!743 = metadata !{i32 51, i32 0, metadata !735, null}
!744 = metadata !{i32 53, i32 0, metadata !735, null}
!745 = metadata !{i32 54, i32 0, metadata !735, null}
!746 = metadata !{i32 55, i32 0, metadata !747, null}
!747 = metadata !{i32 786443, metadata !735, i32 55, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/105_fail/main.cpp]
!748 = metadata !{i32 57, i32 0, metadata !747, null}
!749 = metadata !{i32 63, i32 0, metadata !735, null}
!750 = metadata !{i32 64, i32 0, metadata !735, null}
!751 = metadata !{i32 66, i32 0, metadata !735, null}
!752 = metadata !{i32 67, i32 0, metadata !735, null}
!753 = metadata !{i32 69, i32 0, metadata !735, null}
!754 = metadata !{i32 71, i32 0, metadata !735, null}
!755 = metadata !{i32 72, i32 0, metadata !735, null}
!756 = metadata !{i32 73, i32 0, metadata !735, null}
!757 = metadata !{i32 75, i32 0, metadata !735, null}
!758 = metadata !{i32 419, i32 0, metadata !28, null}
!759 = metadata !{i32 419, i32 0, metadata !71, null}
!760 = metadata !{i32 419, i32 0, metadata !761, null}
!761 = metadata !{i32 786443, metadata !71, i32 419, i32 0, metadata !29, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/benchLuiz/benchmarksGklee/105_fail//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/include/cuda/vector_types.h]
!762 = metadata !{i32 16, i32 0, metadata !90, null}
!763 = metadata !{i32 17, i32 0, metadata !90, null}
!764 = metadata !{metadata !"omnipotent char", metadata !765}
!765 = metadata !{metadata !"Simple C/C++ TBAA"}
!766 = metadata !{i32 18, i32 0, metadata !90, null}
!767 = metadata !{i32 14, i32 0, metadata !124, null}
!768 = metadata !{i32 15, i32 0, metadata !124, null}
!769 = metadata !{i32 16, i32 0, metadata !124, null}
!770 = metadata !{i32 26, i32 0, metadata !771, null}
!771 = metadata !{i32 786443, metadata !214, i32 25, i32 0, metadata !215, i32 0} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!772 = metadata !{i32 30, i32 0, metadata !773, null}
!773 = metadata !{i32 786443, metadata !243, i32 29, i32 0, metadata !215, i32 1} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!774 = metadata !{i32 31, i32 0, metadata !773, null}
!775 = metadata !{i32 35, i32 0, metadata !776, null}
!776 = metadata !{i32 786443, metadata !249, i32 34, i32 0, metadata !215, i32 2} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!777 = metadata !{i32 36, i32 0, metadata !776, null}
!778 = metadata !{i32 40, i32 0, metadata !779, null}
!779 = metadata !{i32 786443, metadata !255, i32 39, i32 0, metadata !215, i32 3} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!780 = metadata !{i32 41, i32 0, metadata !779, null}
!781 = metadata !{i32 45, i32 0, metadata !782, null}
!782 = metadata !{i32 786443, metadata !259, i32 44, i32 0, metadata !215, i32 4} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!783 = metadata !{i32 49, i32 0, metadata !784, null}
!784 = metadata !{i32 786443, metadata !267, i32 48, i32 0, metadata !215, i32 5} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!785 = metadata !{i32 53, i32 0, metadata !786, null}
!786 = metadata !{i32 786443, metadata !275, i32 52, i32 0, metadata !215, i32 6} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!787 = metadata !{i32 57, i32 0, metadata !788, null}
!788 = metadata !{i32 786443, metadata !283, i32 56, i32 0, metadata !215, i32 7} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!789 = metadata !{i32 61, i32 0, metadata !790, null}
!790 = metadata !{i32 786443, metadata !291, i32 60, i32 0, metadata !215, i32 8} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!791 = metadata !{i32 65, i32 0, metadata !792, null}
!792 = metadata !{i32 786443, metadata !298, i32 64, i32 0, metadata !215, i32 9} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaRu
!793 = metadata !{i32 69, i32 0, metadata !794, null}
!794 = metadata !{i32 786443, metadata !306, i32 68, i32 0, metadata !215, i32 10} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!795 = metadata !{i32 73, i32 0, metadata !796, null}
!796 = metadata !{i32 786443, metadata !310, i32 72, i32 0, metadata !215, i32 11} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!797 = metadata !{i32 74, i32 0, metadata !796, null}
!798 = metadata !{metadata !"any pointer", metadata !764}
!799 = metadata !{i32 75, i32 0, metadata !796, null}
!800 = metadata !{i32 77, i32 0, metadata !796, null}
!801 = metadata !{i32 81, i32 0, metadata !802, null}
!802 = metadata !{i32 786443, metadata !317, i32 80, i32 0, metadata !215, i32 12} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!803 = metadata !{i32 86, i32 0, metadata !804, null}
!804 = metadata !{i32 786443, metadata !331, i32 85, i32 0, metadata !215, i32 13} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!805 = metadata !{i32 91, i32 0, metadata !806, null}
!806 = metadata !{i32 786443, metadata !341, i32 90, i32 0, metadata !215, i32 14} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!807 = metadata !{i32 95, i32 0, metadata !808, null}
!808 = metadata !{i32 786443, metadata !351, i32 94, i32 0, metadata !215, i32 15} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/CudaR
!809 = metadata !{i32 96, i32 0, metadata !808, null}
!810 = metadata !{i32 97, i32 0, metadata !808, null}
!811 = metadata !{i32 99, i32 0, metadata !808, null}
!812 = metadata !{i32 103, i32 0, metadata !813, null}
!813 = metadata !{i32 786443, metadata !356, i32 102, i32 0, metadata !215, i32 16} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!814 = metadata !{i32 108, i32 0, metadata !815, null}
!815 = metadata !{i32 786443, metadata !365, i32 106, i32 0, metadata !215, i32 17} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!816 = metadata !{i32 113, i32 0, metadata !817, null}
!817 = metadata !{i32 786443, metadata !374, i32 112, i32 0, metadata !215, i32 18} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!818 = metadata !{i32 119, i32 0, metadata !819, null}
!819 = metadata !{i32 786443, metadata !386, i32 118, i32 0, metadata !215, i32 19} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!820 = metadata !{i32 125, i32 0, metadata !821, null}
!821 = metadata !{i32 786443, metadata !400, i32 124, i32 0, metadata !215, i32 20} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!822 = metadata !{i32 131, i32 0, metadata !823, null}
!823 = metadata !{i32 786443, metadata !416, i32 130, i32 0, metadata !215, i32 21} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!824 = metadata !{i32 137, i32 0, metadata !825, null}
!825 = metadata !{i32 786443, metadata !429, i32 136, i32 0, metadata !215, i32 22} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!826 = metadata !{i32 143, i32 0, metadata !827, null}
!827 = metadata !{i32 786443, metadata !443, i32 142, i32 0, metadata !215, i32 23} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!828 = metadata !{i32 149, i32 0, metadata !829, null}
!829 = metadata !{i32 786443, metadata !456, i32 148, i32 0, metadata !215, i32 24} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!830 = metadata !{i32 153, i32 0, metadata !831, null}
!831 = metadata !{i32 786443, metadata !470, i32 152, i32 0, metadata !215, i32 25} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!832 = metadata !{i32 157, i32 0, metadata !833, null}
!833 = metadata !{i32 786443, metadata !494, i32 156, i32 0, metadata !215, i32 26} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!834 = metadata !{i32 161, i32 0, metadata !835, null}
!835 = metadata !{i32 786443, metadata !501, i32 160, i32 0, metadata !215, i32 27} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!836 = metadata !{i32 165, i32 0, metadata !837, null}
!837 = metadata !{i32 786443, metadata !520, i32 164, i32 0, metadata !215, i32 28} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!838 = metadata !{i32 171, i32 0, metadata !839, null}
!839 = metadata !{i32 786443, metadata !527, i32 170, i32 0, metadata !215, i32 29} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!840 = metadata !{i32 176, i32 0, metadata !841, null}
!841 = metadata !{i32 786443, metadata !540, i32 175, i32 0, metadata !215, i32 30} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!842 = metadata !{i32 181, i32 0, metadata !843, null}
!843 = metadata !{i32 786443, metadata !550, i32 180, i32 0, metadata !215, i32 31} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!844 = metadata !{i32 187, i32 0, metadata !845, null}
!845 = metadata !{i32 786443, metadata !561, i32 186, i32 0, metadata !215, i32 32} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!846 = metadata !{i32 192, i32 0, metadata !847, null}
!847 = metadata !{i32 786443, metadata !573, i32 191, i32 0, metadata !215, i32 33} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!848 = metadata !{i32 198, i32 0, metadata !849, null}
!849 = metadata !{i32 786443, metadata !583, i32 197, i32 0, metadata !215, i32 34} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!850 = metadata !{i32 203, i32 0, metadata !851, null}
!851 = metadata !{i32 786443, metadata !594, i32 201, i32 0, metadata !215, i32 35} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!852 = metadata !{i32 209, i32 0, metadata !853, null}
!853 = metadata !{i32 786443, metadata !604, i32 207, i32 0, metadata !215, i32 36} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!854 = metadata !{i32 214, i32 0, metadata !855, null}
!855 = metadata !{i32 786443, metadata !615, i32 213, i32 0, metadata !215, i32 37} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!856 = metadata !{i32 220, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !626, i32 219, i32 0, metadata !215, i32 38} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!858 = metadata !{i32 225, i32 0, metadata !859, null}
!859 = metadata !{i32 786443, metadata !638, i32 224, i32 0, metadata !215, i32 39} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!860 = metadata !{i32 226, i32 0, metadata !859, null}
!861 = metadata !{i32 231, i32 0, metadata !862, null}
!862 = metadata !{i32 786443, metadata !648, i32 230, i32 0, metadata !215, i32 40} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!863 = metadata !{i32 235, i32 0, metadata !864, null}
!864 = metadata !{i32 786443, metadata !659, i32 234, i32 0, metadata !215, i32 41} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!865 = metadata !{i32 239, i32 0, metadata !866, null}
!866 = metadata !{i32 786443, metadata !666, i32 238, i32 0, metadata !215, i32 42} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!867 = metadata !{i32 240, i32 0, metadata !866, null}
!868 = metadata !{i32 245, i32 0, metadata !869, null}
!869 = metadata !{i32 786443, metadata !674, i32 244, i32 0, metadata !215, i32 43} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!870 = metadata !{i32 250, i32 0, metadata !871, null}
!871 = metadata !{i32 786443, metadata !684, i32 249, i32 0, metadata !215, i32 44} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!872 = metadata !{i32 255, i32 0, metadata !873, null}
!873 = metadata !{i32 786443, metadata !695, i32 254, i32 0, metadata !215, i32 45} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!874 = metadata !{i32 260, i32 0, metadata !875, null}
!875 = metadata !{i32 786443, metadata !703, i32 259, i32 0, metadata !215, i32 46} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
!876 = metadata !{i32 264, i32 0, metadata !877, null}
!877 = metadata !{i32 786443, metadata !712, i32 263, i32 0, metadata !215, i32 47} ; [ DW_TAG_lexical_block ] [/home/luiz/Projetos/OutrosVerificadores/Gklee/build/Gklee/runtime/CudaRuntime//home/luiz/Projetos/OutrosVerificadores/Gklee/Gklee/runtime/Cuda
