import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network_service/export.dart';
import 'package:network_service/network/utils/network_utils.dart';

import 'constant/http_status_code.dart';

class ApiInterceptor extends Interceptor {
  final Dio dioInstance;

  ApiInterceptor({required this.dioInstance});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path == options.extra["path"]) {
      bool isToRefresh = options.extra["isToRefresh"] ?? false;
      bool hasInternet = options.extra["hasInternet"] ?? false;

      if (!isToRefresh) {
        String key = generateUniqueKeyBasedOnApi(
          path: options.path,
          queryParameters: options.queryParameters,
          data: options.data,
        );

        Map<String, dynamic> cacheData =
            NetworkService.networkCacheService.getCacheData(
          key: key,
          isToRefresh: false,
          hasInternet: hasInternet,
        );
        if (cacheData.isNotEmpty) {
          // If cached data exists, use it and complete the request.
          Response cachedResponse = Response(
            requestOptions: options,
            data: !hasInternet ? null : cacheData,
            statusCode: !hasInternet
                ? HttpStatusCode.unauthorizedStatusCode
                : HttpStatusCode.successStatusCode,
          );
          return handler.resolve(cachedResponse);
        }
      }
    }
    // Continue with the original request.
    options.headers.putIfAbsent('user-agent', () => "dart:io");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    Response myResponse = response;

    if (response.requestOptions.path == response.requestOptions.extra["path"]) {
      bool isToCache = response.requestOptions.extra["isToCache"] ?? false;
      bool isToRefresh = response.requestOptions.extra["isToRefresh"] ?? false;

      if (isToCache) {
        Duration cacheDuration =
            response.requestOptions.extra["cacheDuration"] ?? 0;

        String key = generateUniqueKeyBasedOnApi(
          path: myResponse.requestOptions.path,
          queryParameters: myResponse.requestOptions.queryParameters,
          data: myResponse.requestOptions.data,
        );

        if (myResponse.statusCode == HttpStatusCode.createStatusCode ||
            myResponse.statusCode == HttpStatusCode.successStatusCode) {
          await NetworkService.networkCacheService.saveDataToCache(
            value: response.data,
            endPoint: myResponse.requestOptions.path,
            cacheDuration: cacheDuration,
            key: key,
            isToRefresh: isToRefresh,
          );
        }
      }
    }

    super.onResponse(myResponse, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    DioException myErr = err;
    if (err.response?.statusCode == 401) {
      await NetworkService.networkCacheService.clearCacheData();
      return handler.next(myErr);
    } else {
      String key = generateUniqueKeyBasedOnApi(
        path: myErr.requestOptions.path,
        queryParameters: myErr.requestOptions.queryParameters,
        data: myErr.requestOptions.data,
      );

      if (myErr.type == DioExceptionType.connectionTimeout ||
          myErr.type == DioExceptionType.receiveTimeout ||
          myErr.type == DioExceptionType.connectionError ||
          err.error is SocketException) {
        bool hasInternet = myErr.requestOptions.extra["hasInternet"] ?? false;
        Map<String, dynamic> cachedData =
            NetworkService.networkCacheService.getCacheData(
          key: key,
          isToRefresh: false,
          hasInternet: hasInternet,
        );

        if (cachedData.isNotEmpty) {
          try {
            myErr = myErr.copyWith(
              response: Response(
                requestOptions: myErr.requestOptions,
                data: !hasInternet ? null : cachedData,
                extra: myErr.requestOptions.extra,
                statusCode: !hasInternet
                    ? HttpStatusCode.unauthorizedStatusCode
                    : HttpStatusCode.successStatusCode,
              ),
            );
          } catch (e) {
            return handler.next(myErr);
          }
        }
      }

      return handler.next(myErr);
    }
  }
}
