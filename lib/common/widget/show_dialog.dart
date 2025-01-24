import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/common/widget/button/input_button.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/config/di/di_injectable.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/localization/l10.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';
import 'package:record_keeping/core/utils/ui/responsive_widget.dart';

Future<T?> showCustomDialog<T>({
  required Widget child,
  ColorModel? contentBackgroundColor,
  ColorModel? backgroundColor,
  bool? barrierDismissible = true,
  EdgeInsetsGeometry? contentPadding,
  ShapeBorder? shape,
  double? opacity,
}) async {
  return await showDialog(
    barrierDismissible: barrierDismissible ?? false,
    context: getIt<NavigationService>().getNavigationContext(),
    builder: (BuildContext context) => AlertDialog(
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
      backgroundColor: getColorByTheme(
        context: context,
        colorClass: backgroundColor ?? AppColors.dialogBgColor,
      ),
      content: Container(
        decoration: BoxDecoration(
          color: getColorByTheme(
            context: context,
            colorClass: contentBackgroundColor ?? AppColors.dialogBgColor,
          ).withOpacity(opacity ?? 1),
        ),
        width: 200.w,
        child: child,
      ),
      contentPadding: contentPadding,
    ),
  );
}

Future<T?> showConfirmationDialog<T>({
  String? title,
  String? msg,
  Function()? onCancel,
  Function()? onConfrim,
}) {
  return showCustomDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: ResponsiveWidget(
        col2View: dialogContentSmallScreenView(
          onCancel: onCancel,
          onConfrim: onConfrim,
          msg: msg,
          title: title,
        ),
        col4View: dialogContentSmallScreenView(
          onCancel: onCancel,
          onConfrim: onConfrim,
          msg: msg,
          title: title,
        ),
        col6View: dialogContentLargeScreenView(
          onCancel: onCancel,
          onConfrim: onConfrim,
          msg: msg,
          title: title,
        ),
        col8View: dialogContentLargeScreenView(
          onCancel: onCancel,
          onConfrim: onConfrim,
          msg: msg,
          title: title,
        ),
        col10View: dialogContentLargeScreenView(
          onCancel: onCancel,
          onConfrim: onConfrim,
          msg: msg,
          title: title,
        ),
        col12View: dialogContentLargeScreenView(
          onCancel: onCancel,
          onConfrim: onConfrim,
          msg: msg,
          title: title,
        ),
      ));
}

Widget dialogContentSmallScreenView({
  String? title,
  String? msg,
  Function()? onCancel,
  Function()? onConfrim,
  double? titleFontSize,
  double? msgFontSize,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      if (title != null && title.isNotEmpty) ...<Widget>{
        NormalTextWidget(
          text: title ?? '',
          fontSize: titleFontSize ?? 20.sp,
          fontColor: AppColors.blackColor,
          fontWeight: FontWeight.w600,
        ),
      },
      if (msg != null && msg.isNotEmpty) ...<Widget>{
        10.verticalSpace,
        NormalTextWidget(
          text: msg ?? '',
          fontSize: msgFontSize ?? 14.sp,
          overflow: false,
          textAlign: TextAlign.justify,
        ),
      },
      20.verticalSpace,
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InputButtonWidget(
            fontSize: msgFontSize ?? 14.sp,
            title: l10.cancel,
            bgColor: AppColors.darkGreyColor,
            // fontColor: AppColors.blackColor,
            onTap: () {
              if (onCancel != null) {
                onCancel();
              } else {
                Navigator.of(getIt<NavigationService>().getNavigationContext())
                    .pop();
                // getIt<NavigationService>().pop(true);
              }
            },
          ),
          5.horizontalSpace,
          InputButtonWidget(
            fontSize: msgFontSize ?? 14.sp,
            title: l10.confirm,
            onTap: () {
              if (onConfrim != null) {
                onConfrim();
                Navigator.of(getIt<NavigationService>().getNavigationContext())
                    .pop();
              }
            },
          ),
        ],
      )
    ],
  );
}

Widget dialogContentLargeScreenView({
  String? title,
  String? msg,
  Function()? onCancel,
  Function()? onConfrim,
}) {
  return dialogContentSmallScreenView(
    title: title,
    msg: msg,
    onCancel: onCancel,
    onConfrim: onConfrim,
    titleFontSize: 12.sp,
    msgFontSize: 8.sp,
  );
}
