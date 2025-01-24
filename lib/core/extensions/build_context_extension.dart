import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:record_keeping/core/config/di/di_injectable.dart';
import 'package:record_keeping/core/enums/sociair_enums.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';

extension BuildContextExension on BuildContext {
  Color? _getColorBasedOnToastEnum(ToastEnum toastEnum) {
    return switch (toastEnum) {
      ToastEnum.success => Colors.green,
      ToastEnum.error => Colors.red,
      ToastEnum.info => Colors.lightBlue,
      ToastEnum.warning => Colors.orange,
    };
  }

  void showToastMessage({
    required ToastEnum toastEnum,
    required String toastMessage,
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    // initialize flutter toast
    FToast fToast = FToast();
    fToast.init(this);
    // remove all flutter toast that has been kept on queue
    // before displaying new toast
    fToast.removeQueuedCustomToasts();

    Widget toast = Container(
      // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: _getColorBasedOnToastEnum(toastEnum),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Text(
              toastMessage,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(getIt<NavigationService>().getNavigationContext())
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                    color: fontColor ?? Colors.white,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// return screen devicePixelRatio
  double pixelRatio() => MediaQuery.of(this).devicePixelRatio;

  /// returns brightness
  Brightness platformBrightness() => MediaQuery.of(this).platformBrightness;

  /// Return the height of status bar
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Return the height of navigation bar
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  /// Returns Theme.of(context)
  ThemeData get theme => Theme.of(this);

  /// Returns Theme.of(context).textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns Form.of(context)
  FormState? get formState => Form.of(this);

  /// Returns Scaffold.of(context)
  ScaffoldState get scaffoldState => Scaffold.of(this);

  /// Returns Overlay.of(context)
  OverlayState? get overlayState => Overlay.of(this);

  /// Request focus to given FocusNode
  void requestFocus(FocusNode focus) {
    FocusScope.of(this).requestFocus(focus);
  }

  /// Request focus to given FocusNode
  void unFocus(FocusNode focus) {
    focus.unfocus();
  }
}
