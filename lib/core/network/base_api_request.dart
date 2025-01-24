import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_service/network/api_request_impl.dart';
import 'package:network_service/network/constant/enums.dart';
import 'package:network_service/network/failure_state.dart';

import '../../common/reset_state/reset_state.dart';
import '../config/di/di_injectable.dart';
import '../local_storage/shared_prefs_func.dart';
import '../local_storage/shared_prefs_keys.dart';
import '../routing/navigation_service.dart';
import '../routing/route_name.dart';

@lazySingleton
class BaseApiRequest extends ApiRequestImpl {
  @override
  Future<Either<Response<dynamic>, FailureState>> getResponse({
    required String endPoint,
    required ApiMethods apiMethods,
    void Function()? unAuthorizedCallBack,
    void Function()? loadingIndicatorCallBack,
    Map<String, dynamic>? queryParams,
    dynamic body,
    Options? options,
    required bool isToCache,
    bool isToRefresh = false,
    Duration cacheDuration = const Duration(days: 3),
    bool isToRetryOnError = false,
    int retryTimes = 3,
    bool isToLoadDataFromCache = false,
  }) {
    queryParams ??= <String, dynamic>{};
    queryParams.addAll(<String, int>{'isMobile': 1});
    String? accessToken = getString(key: SharedPrefsKeys.accessToken);
    String? tenantId = getString(key: SharedPrefsKeys.tenantId);
    String? tenantDomain = getString(key: SharedPrefsKeys.tenantDomain);

    Options updatedOptions = options ?? Options();
    Map<String, dynamic> headers =
        updatedOptions.headers ?? <String, dynamic>{};
    headers.putIfAbsent('content-type', () => 'application/json');
    headers.putIfAbsent('Accept', () => 'application/json');
    if (accessToken != null) {
      headers.putIfAbsent('Authorization', () => 'Bearer $accessToken');
    }
    if (tenantDomain != null) {
      headers.putIfAbsent('Origin', () => 'https://$tenantDomain');
      headers.putIfAbsent('Referer', () => 'https://$tenantDomain/');
    }

    if (tenantId != null) {
      headers.putIfAbsent('X-Tenant', () => tenantId);
    }

    updatedOptions.headers = headers;

    return super.getResponse(
      apiMethods: apiMethods,
      unAuthorizedCallBack: () {
        log('::: unauthorized was triggered :::');
        clearAllStateData(additionalCallback: () {
          getIt<NavigationService>()
              .pushNamedAndRemoveUntil(RouteName.loginScreenRoute, true);
        });
        if (unAuthorizedCallBack != null) {
          unAuthorizedCallBack();
        }
      },
      queryParams: queryParams,
      body: body,
      options: updatedOptions,
      isToCache: isToCache,
      isToRefresh: isToRefresh,
      cacheDuration: cacheDuration,
      isToRetryOnError: isToRetryOnError,
      retryTimes: retryTimes,
      endPoint: endPoint,
      loadingIndicatorCallBack: loadingIndicatorCallBack ?? () {},
      isToLoadDataFromCache: isToLoadDataFromCache,
    );
  }
}
