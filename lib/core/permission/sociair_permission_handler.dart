import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import '../enums/sociair_enums.dart';

class PermissionHandler {
  void _storeGrantedActivityLog(PermissionFor permission) async {
    switch (permission) {
      case PermissionFor.storage:
        break;

      case PermissionFor.gallery:
        break;

      case PermissionFor.microPhone:
        break;

      case PermissionFor.camera:
        break;
      default:
    }
  }

  void _storeNotGrantedActivityLog(PermissionFor permission) async {
    switch (permission) {
      case PermissionFor.storage:
        break;

      case PermissionFor.gallery:
        break;

      case PermissionFor.microPhone:
        break;

      case PermissionFor.camera:
        break;
      default:
    }
  }

  /// returns permission status for requested permission.
  /// accepted or denied permission log is already hit in this function
  Future<PermissionStatus> checkPermission(
      {required PermissionFor permissionFor}) async {
    Permission permission = Permission.storage;

    if (permissionFor == PermissionFor.camera) {
      permission = Permission.camera;
    } else if (permissionFor == PermissionFor.gallery) {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo =
            await DeviceInfoPlugin().androidInfo;

        double androidVersion =
            double.tryParse(androidInfo.version.release) ?? 0;

        if (androidVersion <= 12) {
          permission = Permission.accessMediaLocation;
        } else {
          permission = Permission.photos;
        }
      } else {
        permission = Permission.photos;
      }
    } else if (permissionFor == PermissionFor.microPhone) {
      permission = Permission.microphone;
    } else if (permissionFor == PermissionFor.storage) {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo =
            await DeviceInfoPlugin().androidInfo;

        double androidVersion =
            double.tryParse(androidInfo.version.release) ?? 0;

        if (androidVersion <= 12) {
          permission = Permission.accessMediaLocation;
        } else {
          permission = Permission.photos;
        }
      }
    } else if (permissionFor == PermissionFor.contact) {
      permission = Permission.contacts;
    }

    PermissionStatus permissionStatus = await permission.request();
    if (permissionStatus == PermissionStatus.granted) {
      _storeGrantedActivityLog(permissionFor);
    } else if (permissionStatus == PermissionStatus.denied) {
      _storeNotGrantedActivityLog(permissionFor);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      _storeNotGrantedActivityLog(permissionFor);
    }
    return permissionStatus;
  }
}
