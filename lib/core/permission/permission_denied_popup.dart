import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import '../config/di/di_injectable.dart';
import '../enums/sociair_enums.dart';
import '../localization/l10.dart';
import '../routing/navigation_service.dart';

class ShowPermissionDeniedPopup {
  Future<void> showAlertPopUp({
    required BuildContext ctx,
    required PermissionFor permissionFor,
    VoidCallback? onSettingOpened,
  }) async {
    final String permiFor = switch (permissionFor) {
      PermissionFor.camera => l10.camera,
      PermissionFor.gallery => l10.gallery,
      PermissionFor.microPhone => l10.microPhone,
      PermissionFor.contact => l10.contacts,
      PermissionFor.storage => l10.storage,
      PermissionFor.location => l10.location,
    };

    await showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('$permiFor Permission Denied'),
          content: Text(
            'Our app requires access to your $permiFor to function properly. '
            'However, it appears that you have denied permission '
            'to access your $permiFor. To use the $permiFor feature, '
            'please go to your device settings '
            'and grant permission to our app. '
            'If you do not wish to grant access, '
            'you can continue to use other features of the app that '
            'do not require $permiFor access.',
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () => getIt<NavigationService>().pop(),
              child: Text(l10.cancel),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                if (await openAppSettings()) {
                  getIt<NavigationService>().pop();
                  onSettingOpened != null ? onSettingOpened() : null;
                  // switch (permissionFor) {
                  //   case 'Location':
                  //     _getCurrentLocationLatLong();
                  //     break;
                  //   case 'Camera':
                  //   case 'Gallery':
                  //   default:
                  // }
                }
              },
              child: const NormalTextWidget(
                text: 'Settings',
              ),
            ),
          ],
        );
      },
    );
  }
}
