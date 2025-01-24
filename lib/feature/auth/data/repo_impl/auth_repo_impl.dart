import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_service/export.dart';
import 'package:record_keeping/core/typedef/sociair_type_def.dart';
import 'package:record_keeping/feature/auth/data/dto/password_model.dart';
import 'package:record_keeping/feature/auth/data/dto/register_user_dto.dart';
import 'package:record_keeping/feature/auth/domain/dao/user_model.dart';
import 'package:record_keeping/feature/auth/domain/repo/auth_repo.dart';

import '../../../../core/config/di/di_injectable.dart';
import '../../../../core/network/base_api_request.dart';
import '../dto/login_form_model.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  static const String _loginAsTenantApiRoute = 'oauth/token';
  static const String _checkUserExistRoute = 'check-user-exist';

  static const String _logoutRoute = 'logout';
  static const String _forgotPasswordRoute = '/forgot-password';
  static const String _profileRoute = 'profile';
  static const String _changePasswordRoute = '/app/change-password';
  static const String _registerUserRoute = '/register';
  static const String _verifyOtpRoute = '/verify-opt';

  @override
  FutureDynamicFailure login({required LoginFormModel loginFormModel}) async {
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _loginAsTenantApiRoute,
      apiMethods: ApiMethods.post,
      unAuthorizedCallBack: () {},
      isToCache: false,
      body: loginFormModel.toJson(),
    );
  }

  @override
  FutureDynamicFailure logout() {
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _logoutRoute,
      apiMethods: ApiMethods.post,
      unAuthorizedCallBack: () {},
      isToCache: false,
    );
  }

  @override
  FutureDynamicFailure forgotPassword(
      {required String emailAddress, required String tenantId}) {
    Map<String, dynamic> headers = <String, dynamic>{
      'X-Tenant': tenantId,
    };
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _forgotPasswordRoute,
      apiMethods: ApiMethods.post,
      body: <String, dynamic>{
        'email': emailAddress,
      },
      unAuthorizedCallBack: () {},
      isToCache: false,
      options: Options(headers: headers),
    );
  }

  @override
  FutureDynamicFailure getMyProfile({bool isToRefresh = false}) async {
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _profileRoute,
      apiMethods: ApiMethods.get,
      unAuthorizedCallBack: () {},
      isToCache: false,
      isToRefresh: true,
      cacheDuration: const Duration(hours: 5),
    );
  }

  @override
  FutureDynamicFailure updateMyProfile({required UserModel userModel}) async {
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _profileRoute,
      apiMethods: ApiMethods.put,
      body: userModel.toJson(),
      unAuthorizedCallBack: () {},
      isToCache: false,
    );
  }

  @override
  FutureDynamicFailure changePassword(
      {required PasswordModel passwordModel}) async {
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _changePasswordRoute,
      apiMethods: ApiMethods.post,
      body: passwordModel.toJson(),
      unAuthorizedCallBack: () {},
      isToCache: false,
    );
  }

  @override
  FutureDynamicFailure registerNewUser(
      {required RegisterUserDTO registerUserDTO}) {
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _registerUserRoute,
      apiMethods: ApiMethods.post,
      body: registerUserDTO.toJson(),
      unAuthorizedCallBack: () {},
      isToCache: false,
    );
  }

  @override
  FutureDynamicFailure verifyOTP({
    required String id,
    required String otp,
    required String mobileNo,
    required String password,
  }) {
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _verifyOtpRoute,
      apiMethods: ApiMethods.post,
      body: <String, dynamic>{
        'otp': otp,
        'password': password,
        'password_confirmation': password,
      },
      unAuthorizedCallBack: () {},
      isToCache: false,
    );
  }

  @override
  FutureDynamicFailure checkUserExist({required String mobileNumber}) {
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _checkUserExistRoute,
      apiMethods: ApiMethods.post,
      unAuthorizedCallBack: () {},
      isToCache: false,
      body: <String, String>{
        'mobile_number': mobileNumber,
      },
    );
  }

  @override
  FutureDynamicFailure resentOtp({required String mobileNo}) {
    // TODO: implement resentOtp
    throw UnimplementedError();
  }
}
