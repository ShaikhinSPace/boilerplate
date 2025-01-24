import '../local_storage/shared_prefs_func.dart';
import '../local_storage/shared_prefs_keys.dart';

interface class PermissionServices {
  bool get isCameraPermissionGranted =>
      getBool(key: SharedPrefsKeys.permissionKeys.cameraKey) ?? false;

  void setCameraPermissionGranted(bool value) async {
    await setBool(key: SharedPrefsKeys.permissionKeys.cameraKey, value: value);
  }

  int get getCameraPermissionCount =>
      getInt(key: SharedPrefsKeys.permissionKeys.cameraCountKey) ?? 0;

  void setCameraPermissionCount({int? value}) async {
    await setInt(
        key: SharedPrefsKeys.permissionKeys.cameraCountKey,
        value: value ?? (getCameraPermissionCount + 1));
  }

  bool get isGalleryPermissionGranted =>
      getBool(key: SharedPrefsKeys.permissionKeys.galleryKey) ?? false;

  void setGalleryPermissionGranted(bool value) async {
    await setBool(key: SharedPrefsKeys.permissionKeys.galleryKey, value: value);
  }

  int get getGalleryPermissionCount =>
      getInt(key: SharedPrefsKeys.permissionKeys.galleryCountKey) ?? 0;

  void setGalleryPermissionCount({int? value}) async {
    await setInt(
        key: SharedPrefsKeys.permissionKeys.galleryCountKey,
        value: value ?? (getGalleryPermissionCount + 1));
  }

  bool get isStoragePermissionGranted =>
      getBool(key: SharedPrefsKeys.permissionKeys.storageKey) ?? false;

  void setStoragePermissionGranted(bool value) async {
    await setBool(key: SharedPrefsKeys.permissionKeys.storageKey, value: value);
  }

  int get getStoragePermissionCount =>
      getInt(key: SharedPrefsKeys.permissionKeys.storageCountKey) ?? 0;

  void setStoragePermissionCount({int? value}) async {
    await setInt(
        key: SharedPrefsKeys.permissionKeys.storageCountKey,
        value: value ?? (getStoragePermissionCount + 1));
  }

  bool get isMicroPhonePermissionGranted =>
      getBool(key: SharedPrefsKeys.permissionKeys.microPhoneKey) ?? false;

  void setMicroPhonePermissionGranted(bool value) async {
    await setBool(
        key: SharedPrefsKeys.permissionKeys.microPhoneKey, value: value);
  }

  int get getMicroPhonePermissionCount =>
      getInt(key: SharedPrefsKeys.permissionKeys.microPhoneCountKey) ?? 0;

  void setMicroPhonePermissionCount({int? value}) async {
    await setInt(
        key: SharedPrefsKeys.permissionKeys.microPhoneCountKey,
        value: value ?? (getMicroPhonePermissionCount + 1));
  }

  bool get isContactPermissionGranted =>
      getBool(key: SharedPrefsKeys.permissionKeys.contactKey) ?? false;

  void setContactPermissionGranted(bool value) async {
    await setBool(key: SharedPrefsKeys.permissionKeys.contactKey, value: value);
  }

  int get getContactPermissionCount =>
      getInt(key: SharedPrefsKeys.permissionKeys.contactCountKey) ?? 0;

  void setContactPermissionCount({int? value}) async {
    await setInt(
        key: SharedPrefsKeys.permissionKeys.contactCountKey,
        value: value ?? (getContactPermissionCount + 1));
  }
}

class SharedPrefsService {
  SharedPrefsService._();

  static PermissionServices get permissionService => PermissionServices();
}
