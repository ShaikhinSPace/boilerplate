import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:network_service/network/failure_state.dart';
import 'package:record_keeping/core/local_storage/shared_prefs_func.dart';
import 'package:record_keeping/core/local_storage/shared_prefs_keys.dart';
import 'package:record_keeping/core/typedef/sociair_type_def.dart';
import 'package:record_keeping/core/utils/base/base_bloc.dart';

import '../../../../core/config/di/di_injectable.dart';
import '../../../../core/enums/sociair_enums.dart';
import '../../../../core/utils/abs_state/abs_normal_state.dart';
import '../../data/dto/login_form_model.dart';
import '../../domain/repo/auth_repo.dart';

@lazySingleton
class LoginFormCubit extends BaseCubit<AbsNormalState<String?>> {
  LoginFormCubit() : super(initialState<String?>());

  void resetState() => emit(initialState<String?>());

  void resetLoginState() => emit(initialState());

  Future<void> login({required LoginFormModel loginFormModel}) async {
    emit(
      state.copyWith(absNormalStatus: AbsNormalStatus.loading),
    );
    DynamicFailure responseData = await getIt<AuthRepo>().login(
      loginFormModel: loginFormModel,
    );
    responseData.fold(
      (Response<dynamic> l) async {
        if (l.data != null &&
            l.data is Map &&
            Map<String, dynamic>.of(l.data).containsKey('data') &&
            Map<String, dynamic>.of(l.data['data']).containsKey('token')) {
          await setString(
            key: SharedPrefsKeys.loginMobileNumber,
            value: loginFormModel.username,
          );
          await setString(
            key: SharedPrefsKeys.loginPassword,
            value: loginFormModel.password ?? '',
          );
          await setString(
            key: SharedPrefsKeys.accessToken,
            value: Map<String, dynamic>.of(l.data)['data']['access_token'],
          );
        }
        emit(
          state.copyWith(
            absNormalStatus: AbsNormalStatus.success,
          ),
        );
      },
      (FailureState r) {
        emit(
          state.copyWith(
            absNormalStatus: AbsNormalStatus.error,
            failure: r,
          ),
        );
      },
    );
  }
}
