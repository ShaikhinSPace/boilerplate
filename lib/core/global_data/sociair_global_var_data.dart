import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/auth/domain/dao/user_model.dart';
import '../enums/sociair_enums.dart';
import '../local_storage/shared_prefs_func.dart';
import '../local_storage/shared_prefs_keys.dart';

class SociairGlobalVarData {
  // Private constructor
  SociairGlobalVarData._privateConstructor();

  // Singleton instance
  static final SociairGlobalVarData _instance =
      SociairGlobalVarData._privateConstructor();

  // Getter for instance
  static SociairGlobalVarData get instance => _instance;

  static EnvEnum _currentSociairEnvEnum = EnvEnum.prod;

  static EnvEnum get currentSociairEnvEnum => _currentSociairEnvEnum;

  static late SharedPreferences _sharedPreferences;

  static SharedPreferences get sharedPreferences => _sharedPreferences;

  static String? accessToken = getString(key: SharedPrefsKeys.accessToken);

  static String? tenantId = getString(key: SharedPrefsKeys.tenantId);

  static bool isAuthenticated =
      getString(key: SharedPrefsKeys.accessToken) != null;

  static UserModel? getCurrentUser = getModel<UserModel>(
    key: SharedPrefsKeys.currentUserKey,
    fromJson: UserModel.fromJson,
  );

  // static int? getCurrentUserId = getCurrentUser?.id;

  static void updateCurrentSociairEnvEnum(EnvEnum sociairEnvEnum) async {
    _currentSociairEnvEnum = sociairEnvEnum;
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
