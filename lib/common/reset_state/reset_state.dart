import 'package:flutter/painting.dart';
import 'package:network_service/export.dart';
import 'package:record_keeping/common/navigation_cubit/bottom_nav_cubit.dart';

import '../../core/config/di/di_injectable.dart';
import '../../core/local_storage/shared_prefs_func.dart';
import '../../core/local_storage/shared_prefs_keys.dart';
import '../../core/routing/navigation_service.dart';
import '../../core/routing/route_name.dart';
import '../../feature/auth/presentation/cubit/login_form_cubit.dart';
import '../../feature/auth/presentation/cubit/profile/my_profile_cubit.dart';
import '../../feature/home/presentation/cubit/library_list_cubit.dart';

void clearAllStateData({
  bool isToLogout = false,
  VoidCallback? additionalCallback,
}) async {
  getIt<LoginFormCubit>().resetState();
  getIt<MyProfileCubit>().resetState();
  getIt<BottomNavCubit>().resetState();

  getIt<LibraryListCubit>().resetState();
  _clearSharePrefsData();
  await NetworkService.networkCacheService.clearCacheData();

  if (additionalCallback != null) {
    additionalCallback();
  }

  if (isToLogout) {
    await Future<void>.delayed(const Duration(seconds: 2));
    getIt<NavigationService>().pushNamedAndRemoveUntil(
      RouteName.loginScreenRoute,
      true,
    );
  }
}

void _clearSharePrefsData() async {
  removeKey(key: SharedPrefsKeys.accessToken);
  removeKey(key: SharedPrefsKeys.tenantId);
  removeKey(key: SharedPrefsKeys.tenantDomain);
  removeKey(key: SharedPrefsKeys.currentUserKey);
}
