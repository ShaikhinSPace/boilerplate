import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/core/extensions/responsive_context_extension.dart';

import '../enums/sociair_enums.dart';

String fontFamily = 'IBMPlexSans';

extension TextThemeExtension on BuildContext {
  double getFontSizeBasedOnDeviceType({
    required double col2FontSize,
    required double col4FontSize,
    required double col6FontSize,
    required double col8FontSize,
    required double col10FontSize,
    required double col12FontSize,
  }) {
    switch (getResponsiveDeviceType()) {
      case ResponsiveDeviceType.col10:
        return col10FontSize;
      case ResponsiveDeviceType.col8:
        return col8FontSize;
      case ResponsiveDeviceType.col6:
        return col6FontSize;
      case ResponsiveDeviceType.col4:
        return col4FontSize;
      case ResponsiveDeviceType.col2:
        return col2FontSize;
      default:
        return col12FontSize;
    }
  }

  TextTheme get textTheme => TextTheme(
        headlineLarge: TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
          fontSize: getFontSizeBasedOnDeviceType(
            col2FontSize: 24.sp,
            col4FontSize: 20.sp,
            col6FontSize: 12.sp,
            col8FontSize: 11.sp,
            col10FontSize: 10.sp,
            col12FontSize: 4.sp,
          ),
          color: Theme.of(this).primaryColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
          fontSize: getFontSizeBasedOnDeviceType(
            col2FontSize: 16.sp,
            col4FontSize: 17.sp,
            col6FontSize: 12.sp,
            col8FontSize: 11.sp,
            col10FontSize: 10.sp,
            col12FontSize: 4.sp,
          ),
          color: Theme.of(this).primaryColor,
        ),
        titleSmall: TextStyle(
          fontFamily: fontFamily,
          letterSpacing: 0.2,
          fontWeight: FontWeight.w600,
          fontSize: getFontSizeBasedOnDeviceType(
            col2FontSize: 14.sp,
            col4FontSize: 10.sp,
            col6FontSize: 10.sp,
            col8FontSize: 10.sp,
            col10FontSize: 10.sp,
            col12FontSize: 4.sp,
          ),
          color: Theme.of(this).primaryColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          letterSpacing: 0.2,
          fontWeight: FontWeight.w400,
          fontSize: getFontSizeBasedOnDeviceType(
            col2FontSize: 13.sp,
            col4FontSize: 14.sp,
            col6FontSize: 10.sp,
            col8FontSize: 8.sp,
            col10FontSize: 8.sp,
            col12FontSize: 4.sp,
          ),
          color: Theme.of(this).primaryColor,
        ),
        bodySmall: TextStyle(
          fontFamily: fontFamily,
          letterSpacing: 0.2,
          fontWeight: FontWeight.w400,
          fontSize: getFontSizeBasedOnDeviceType(
            col2FontSize: 11.sp,
            col4FontSize: 13.sp,
            col6FontSize: 6.sp,
            col8FontSize: 6.sp,
            col10FontSize: 6.sp,
            col12FontSize: 4.sp,
          ),
          color: Theme.of(this).primaryColor,
        ),
      );
}
