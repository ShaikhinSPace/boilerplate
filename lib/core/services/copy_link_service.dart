import 'package:flutter/services.dart';
import 'package:record_keeping/core/config/di/di_injectable.dart';
import 'package:record_keeping/core/enums/sociair_enums.dart';
import 'package:record_keeping/core/extensions/build_context_extension.dart';
import 'package:record_keeping/core/localization/l10.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';

class CopyLinkService {
  static void copyLink({required String link, String? message}) async {
    await Clipboard.setData(
      ClipboardData(
        text: link,
      ),
    );

    getIt<NavigationService>().getNavigationContext().showToastMessage(
          toastEnum: ToastEnum.info,
          toastMessage: l10.copyLinkMsg(message ?? l10.text),
        );
  }
}
