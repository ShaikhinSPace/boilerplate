interface class PermissionKeys {
  String get cameraKey => 'cameraKey';

  String get cameraCountKey => 'cameraCountKey';

  String get galleryKey => 'galleryKey';

  String get galleryCountKey => 'galleryCountKey';

  String get microPhoneKey => 'microPhoneKey';

  String get microPhoneCountKey => 'microPhoneCountKey';

  String get storageKey => 'storageKey';

  String get storageCountKey => 'storageCountKey';

  String get contactKey => 'contactKey';

  String get contactCountKey => 'contactCountKey';
}

class SharedPrefsKeys {
  SharedPrefsKeys._();

  static String get appThemeKey => 'appThemeKey';

  static String get localizationKey => 'localizationKey';

  static String get loginUserName => 'loginUserName';
  static String get loginMobileNumber => 'loginMobilerNumber';
  static String get loginPassword => 'loginPassword';
  static String get isFingerPrintEnabled => 'isFingerPrintEnabled';

  static String get accessToken => 'accessToken';

  static String get tenantId => 'tenantId';

  static String get tenantDomain => 'tenantDomain';

  static String get currentUserKey => 'currentUserKey';

  static PermissionKeys get permissionKeys => PermissionKeys();
}
