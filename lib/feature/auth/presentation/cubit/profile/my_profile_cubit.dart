import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:network_service/network/failure_state.dart';
import 'package:record_keeping/core/config/di/di_injectable.dart';
import 'package:record_keeping/core/enums/sociair_enums.dart';
import 'package:record_keeping/core/local_storage/shared_prefs_func.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';
import 'package:record_keeping/core/routing/route_name.dart';
import 'package:record_keeping/core/typedef/sociair_type_def.dart';
import 'package:record_keeping/core/utils/abs_state/abs_normal_state.dart';
import 'package:record_keeping/core/utils/base/base_bloc.dart';
import 'package:record_keeping/feature/auth/domain/dao/user_model.dart';
import 'package:record_keeping/feature/auth/domain/repo/auth_repo.dart';

import '../../../../../common/reset_state/reset_state.dart';
import '../../../../../core/local_storage/shared_prefs_keys.dart';
import 'my_profile_state.dart';

@lazySingleton
class MyProfileCubit extends BaseCubit<MyProfileStateImpl> {
  MyProfileCubit() : super(MyProfileInitialState());

  void resetState() => emit(MyProfileInitialState());

  void resetProfileUpdateState() => emit(state.copyWith(
        updateProfileState: initialState<UserModel>(),
      ));

  void getMyProfile({bool isToRefresh = false}) async {
    if (isToRefresh) {
      emit(
        state.copyWith(
          profileState: refreshState(null),
        ),
      );
    }
    AbsNormalState<UserModel> updatedState = await callApiForMap(
      absNormalState: state.profileState,
      apiCall: () => getIt<AuthRepo>().getMyProfile(isToRefresh: isToRefresh),
      fromJson: UserModel.fromJson,
      onSuccess: (Response<dynamic>? l) {},
      onFailure: (FailureState r) {},
    );
    if (isToRefresh) {
      emit(state.copyWith(profileState: refreshState(UserModel())));
    }
    if (updatedState.data != null) {
      await setModel(
        key: SharedPrefsKeys.currentUserKey,
        toJson: updatedState.data?.toJson() ?? <String, dynamic>{},
      );
    }

    emit(state.copyWith(
      profileState: updatedState,
    ));
  }

  void updateProfile({
    required UserModel userModel,
  }) async {
    emit(state.copyWith(
        updateProfileState: loadingState(state.updateProfileState.data)));

    AbsNormalState<UserModel> updatedState = await callApiForMap(
      absNormalState: state.profileState,
      apiCall: () => getIt<AuthRepo>().updateMyProfile(userModel: userModel),
      fromJson: UserModel.fromJson,
      onSuccess: (Response? l) {},
      onFailure: (FailureState r) {},
    );

    emit(
      state.copyWith(
        updateProfileState: updatedState,
        profileState: state.profileState.copyWith(data: updatedState.data),
      ),
    );
  }

  void logout() async {
    emit(state.copyWith(logoutState: loadingState(state.logoutState.data)));
    DynamicFailure responseData = await getIt<AuthRepo>().logout();
    responseData.fold(
      (Response<dynamic> l) async {
        clearAllStateData(additionalCallback: () {
          getIt<NavigationService>()
              .pushNamedAndRemoveUntil(RouteName.loginScreenRoute, true);
        });
        emit(
          state.copyWith(
            logoutState: state.logoutState.copyWith(
              absNormalStatus: AbsNormalStatus.success,
            ),
          ),
        );
      },
      (FailureState r) {
        emit(
          state.copyWith(
            logoutState: state.logoutState.copyWith(
              absNormalStatus: AbsNormalStatus.error,
              failure: r,
            ),
          ),
        );
      },
    );
  }
}
