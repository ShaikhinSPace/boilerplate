import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:network_service/network/constant/enums.dart';
import 'package:network_service/network/newtork_service.dart';
import 'package:network_service/network/utils/network_utils.dart';
import 'package:path/path.dart' as path;

import 'constant/http_status_code.dart';
import 'failure_state.dart';
import 'interface/api_request.dart';

class ApiRequestImpl implements ApiRequest {
  @override
  Future<Either<Response<dynamic>, FailureState>> getResponse({
    required String endPoint,
    required ApiMethods apiMethods,
    required void Function() unAuthorizedCallBack,
    required void Function() loadingIndicatorCallBack,
    Map<String, dynamic>? queryParams,
    body,
    Options? options,
    required bool isToCache,
    bool isToRefresh = false,
    Duration cacheDuration = const Duration(days: 3),
    bool isToRetryOnError = false,
    int retryTimes = 3,
    bool isToLoadDataFromCache = false,
  }) async {
    var apiManager = NetworkService.apiManager;
    String url = endPoint;

    String cancelURL = generateUniqueKeyBasedOnApi(
      path: endPoint,
      queryParameters: queryParams ?? {},
      data: body,
    );

    bool isToExecuteApiCall = !isToLoadDataFromCache || isToRefresh;
    late Either<Response<dynamic>, FailureState> responseData;

    if (!isToExecuteApiCall) {
      Map<String, dynamic> cachedData =
          NetworkService.networkCacheService.getCacheData(
        key: cancelURL,
        isToRefresh: false,
        hasInternet: !isToLoadDataFromCache,
      );
      if (cachedData.isNotEmpty) {
        responseData = Left(Response(
          requestOptions: RequestOptions(
            data: body,
            queryParameters: queryParams,
            path: endPoint,
            headers: (options ?? Options()).headers,
          ),
          data: cachedData,
          statusCode: isToLoadDataFromCache
              ? HttpStatusCode.cacheStatusCode
              : HttpStatusCode.successStatusCode,
        ));
      } else if (isToLoadDataFromCache) {
        responseData = Left(Response(
          requestOptions: RequestOptions(
            data: body,
            queryParameters: queryParams,
            path: endPoint,
            headers: (options ?? Options()).headers,
          ),
          data: cachedData,
          statusCode: HttpStatusCode.cacheStatusCode,
        ));
      } else {
        isToExecuteApiCall = true;
      }
    }

    if (isToExecuteApiCall) {
      loadingIndicatorCallBack();

      var cancelToken = CancelToken();
      cancelTokens.addAll({cancelURL: cancelToken});

      Map<String, dynamic> extras = {};

      if (isToCache) {
        extras.addAll({
          "path": endPoint,
          "isToCache": true,
          "isToRefresh": isToRefresh,
          "cacheDuration": cacheDuration,
          "hasInternet": true,
        });
      }

      final Options options0 = (options ?? Options()).copyWith(extra: extras);

      switch (apiMethods) {
        case ApiMethods.post:
          responseData = await decodeHttpRequestResponse(
            apiManager.dio!.post(
              url,
              cancelToken: cancelToken,
              data: body,
              options: options0,
              queryParameters: queryParams,
            ),
            cancelURL,
            unAuthorizedCallBack: unAuthorizedCallBack,
          );
        case ApiMethods.put:
          responseData = await decodeHttpRequestResponse(
            apiManager.dio!.put(
              url,
              cancelToken: cancelToken,
              data: body,
              options: options0,
              queryParameters: queryParams,
            ),
            cancelURL,
            unAuthorizedCallBack: unAuthorizedCallBack,
          );
        case ApiMethods.delete:
          responseData = await decodeHttpRequestResponse(
            apiManager.dio!.delete(
              url,
              data: body,
              options: options0,
              queryParameters: queryParams,
            ),
            cancelURL,
            unAuthorizedCallBack: unAuthorizedCallBack,
          );
        case ApiMethods.get:
        default:
          responseData = await decodeHttpRequestResponse(
            apiManager.dio!.get(
              url,
              options: options0,
              queryParameters: queryParams,
            ),
            cancelURL,
            unAuthorizedCallBack: unAuthorizedCallBack,
          );
      }

      if (responseData.isRight() && isToRetryOnError) {
        if (isToRetryOnError) {
          if (retryRouteCountMap.isNotEmpty &&
              retryRouteCountMap.containsKey(cancelURL)) {
            int myRetryCount = retryRouteCountMap[cancelURL] ?? 1;
            if (myRetryCount < retryTimes) {
              retryRouteCountMap[cancelURL] = myRetryCount + 1;
              return getResponse(
                endPoint: endPoint,
                apiMethods: apiMethods,
                unAuthorizedCallBack: unAuthorizedCallBack,
                isToCache: isToCache,
                retryTimes: retryTimes,
                isToRetryOnError: isToRetryOnError,
                cacheDuration: cacheDuration,
                isToRefresh: isToRefresh,
                body: body,
                options: options0,
                queryParams: queryParams,
                loadingIndicatorCallBack: loadingIndicatorCallBack,
              );
            }
          } else {
            retryRouteCountMap[cancelURL] = 1;
            return getResponse(
              endPoint: endPoint,
              apiMethods: apiMethods,
              unAuthorizedCallBack: unAuthorizedCallBack,
              isToCache: isToCache,
              retryTimes: retryTimes,
              isToRetryOnError: isToRetryOnError,
              cacheDuration: cacheDuration,
              isToRefresh: isToRefresh,
              body: body,
              options: options0,
              queryParams: queryParams,
              loadingIndicatorCallBack: loadingIndicatorCallBack,
            );
          }
        }
        // clear retry routes by key once it is done
        if (retryRouteCountMap.isNotEmpty &&
            retryRouteCountMap.containsKey(cancelURL)) {
          retryRouteCountMap.remove(cancelURL);
        }
      }
    }

    return responseData;
  }

  @override
  Future<Either<Response<dynamic>, FailureState>> decodeHttpRequestResponse(
    Future<dynamic> apiCall,
    String uniqueKey, {
    String message = "",
    required void Function() unAuthorizedCallBack,
  }) async {
    try {
      Response? response = await apiCall;
      List<int> successStatusCode = [200, 201];
      if (successStatusCode.contains(response?.statusCode)) {
        return Left(response!);
      } else if (response?.statusCode == 500) {
        return Right(
          FailureState(
            message: 'Something went wrong',
            statusCode: response?.statusCode,
            data: response?.data,
          ),
        );
      } else if (response?.statusCode == 401) {
        unAuthorizedCallBack();
        return Right(
          FailureState(
            message: 'Something went wrong',
            statusCode: response?.statusCode,
            data: response?.data,
          ),
        );
      } else if (response?.statusCode == 400) {
        return Right(
          FailureState.fromJson(
            response!.data,
          ).copyWith(
            statusCode: response.statusCode,
          ),
        );
      } else if (response?.statusCode == 422) {
        return Right(
          FailureState.fromJson(response!.data).copyWith(
            statusCode: response.statusCode,
          ),
        );
      } else if (response?.data == null) {
        return Right(response?.data);
      } else {
        return Right(
          FailureState(
            message: 'Something went wrong',
            statusCode: response?.statusCode,
            data: response?.data,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        unAuthorizedCallBack();
        return Right(
          FailureState(
            message: 'Unauthorized Access',
            statusCode: e.response?.statusCode,
            data: e.response?.data,
          ),
        );
      } else if (e.response?.statusCode == 400 ||
          e.response?.statusCode == 403 ||
          e.response?.statusCode == 422) {
        FailureState failureState = FailureState.fromJson(
          e.response?.data,
        );
        failureState = failureState.copyWith(
          statusCode: e.response?.statusCode,
        );
        return Right(failureState);
      } else if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError ||
          e.error is SocketException) {
        // on error - success ::: data loaded from cache
        if (e.response?.statusCode == 200) {
          return Left(e.response!);
        }
      }
      return Right(
        FailureState(
          message: 'Something went wrong',
          statusCode: e.response?.statusCode,
          data: e.response?.data,
        ),
      );
    } catch (e) {
      return Right(
        FailureState(
          message: 'Something went wrong',
        ),
      );
    }
  }

  @override
  Map<String, CancelToken> cancelTokens = {};

  @override
  void cancelRequest(String url) {
    if (cancelTokens.containsKey(url)) {
      final token = cancelTokens[url];
      if (token != null) {
        token.cancel("Cancelled $url");
      }
      cancelTokens.removeWhere((key, value) => key == url);
    }
  }

  @override
  Future<Either<Response<dynamic>, FailureState>> uploadAnyMultipleFile({
    required String endPoint,
    required List<File> files,
    required FormData formData,
    required String key,
    required UploadType uploadType,
    required void Function() unAuthorizedCallBack,
    required void Function() loadingIndicatorCallBack,
  }) async {
    FormData formData0 = formData;
    List<File> attachedFiles = files;
    for (int i = 0; i < files.length; i++) {
      formData0.files.add(
        MapEntry(
          'images[]',
          await MultipartFile.fromFile(
            attachedFiles[i].path,
            filename: path.basename(attachedFiles[i].path),
            contentType: MediaType(
              "image",
              path
                  .extension(path.basename(attachedFiles[i].path))
                  .replaceAll('.', ''),
            ),
          ),
        ),
      );
    }
    //
    // await Future.forEach(files, (file) async {
    //   String fileName = file.path.split('/').last;
    //
    //   MultipartFile multipartFile = await MultipartFile.fromFile(
    //     file.path,
    //     // filename: fileName,
    //     // contentType: MediaType(
    //     //   (uploadType != UploadType.audio || uploadType != UploadType.pdf)
    //     //       ? "image"
    //     //       : uploadType.toString(),
    //     //   path.extension(path.basename(file.path)).replaceAll('.', ''),
    //     // ),
    //   );
    // });
    // log('multi image upload: ${formData0.files.toList()}');
    return getResponse(
      apiMethods: ApiMethods.post,
      endPoint: endPoint,
      body: formData0,
      isToCache: false,
      unAuthorizedCallBack: unAuthorizedCallBack,
      loadingIndicatorCallBack: loadingIndicatorCallBack,
    );
  }

  @override
  Future<Either<Response<dynamic>, FailureState>> uploadAnySingleFile({
    required String endPoint,
    required File file,
    required FormData formData,
    required String key,
    required UploadType uploadType,
    required void Function() unAuthorizedCallBack,
    required void Function() loadingIndicatorCallBack,
  }) async {
    FormData formData0 = formData;
    // String fileName = file.path.split('/').last;
    MultipartFile multipartFile = await MultipartFile.fromFile(
      file.path,
      // filename: fileName,
      // contentType: MediaType(
      //   uploadType.toString(),
      //   path.extension(path.basename(file.path)).replaceAll('.', ''),
      // ),
    );
    formData0.files.add(MapEntry(key, multipartFile));
    return getResponse(
      apiMethods: ApiMethods.post,
      endPoint: endPoint,
      body: formData0,
      isToCache: false,
      unAuthorizedCallBack: unAuthorizedCallBack,
      loadingIndicatorCallBack: loadingIndicatorCallBack,
    );
  }

  @override
  Map<String, int> retryRouteCountMap = {};
}
