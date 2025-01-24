import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../constant/enums.dart';
import '../failure_state.dart';

abstract class ApiRequest {
  late Map<String, CancelToken> cancelTokens;

  void cancelRequest(String url);

  late Map<String, int> retryRouteCountMap;

  Future<Either<Response<dynamic>, FailureState>> getResponse({
    required String endPoint,
    required ApiMethods apiMethods,
    required void Function() unAuthorizedCallBack,
    required void Function() loadingIndicatorCallBack,
    Map<String, dynamic>? queryParams,
    dynamic body,
    Options? options,
    required bool isToCache,
    bool isToRefresh = false,
    Duration cacheDuration = const Duration(days: 3),
    bool isToRetryOnError = false,
    int retryTimes = 3,
    bool isToLoadDataFromCache = false,
  });

  Future<Either<Response<dynamic>, FailureState>> decodeHttpRequestResponse(
    Future<dynamic> apiCall, String uniqueKey,{
    String message = "",
    required void Function() unAuthorizedCallBack,
  });

  Future<Either<Response<dynamic>, FailureState>> uploadAnySingleFile({
    required String endPoint,
    required File file,
    required FormData formData,
    required String key,
    required UploadType uploadType,
    required void Function() unAuthorizedCallBack,
    required void Function() loadingIndicatorCallBack,
  });

  Future<Either<Response<dynamic>, FailureState>> uploadAnyMultipleFile({
    required String endPoint,
    required List<File> files,
    required FormData formData,
    required String key,
    required UploadType uploadType,
    required void Function() unAuthorizedCallBack,
    required void Function() loadingIndicatorCallBack,
  });
}
