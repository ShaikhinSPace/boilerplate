import 'package:flutter/cupertino.dart';
import 'package:record_keeping/common/model/responsive_value_model.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../enums/sociair_enums.dart';

extension ResponsiveContextExtension on BuildContext {
  double get screenWidth => ResponsiveBreakpoints.of(this).screenWidth;

  // bool get isMobile =>
  //     screenWidth >= 0 && screenWidth <= 600 ||
  //     ResponsiveBreakpoints.of(this).isMobile;
  //
  // bool get isTablet =>
  //     screenWidth >= 601 && screenWidth <= 1000 ||
  //     ResponsiveBreakpoints.of(this).isTablet;
  //
  // bool get isDesktop =>
  //     screenWidth >= 1001 || ResponsiveBreakpoints.of(this).isDesktop;
  //
  // ResponsiveDeviceType getResponsiveDeviceType() {
  //   if (screenWidth >= 0 && screenWidth <= 600 ||
  //       ResponsiveBreakpoints.of(this).isMobile) {
  //     return ResponsiveDeviceType.mobile;
  //   } else if (screenWidth >= 601 && screenWidth <= 1000 ||
  //       ResponsiveBreakpoints.of(this).isTablet) {
  //     return ResponsiveDeviceType.tablet;
  //   } else if (screenWidth >= 1001 ||
  //       ResponsiveBreakpoints.of(this).isDesktop) {
  //     return ResponsiveDeviceType.desktop;
  //   } else {
  //     return ResponsiveDeviceType.mobile;
  //   }
  // }
  //
  // double getResponsiveValueByDeviceType({
  //   required ResponsiveValueModel responsiveValue,
  // }) {
  //   switch (getResponsiveDeviceType()) {
  //     case ResponsiveDeviceType.desktop:
  //       return responsiveValue.desktopValue;
  //     case ResponsiveDeviceType.tablet:
  //       return responsiveValue.tabValue;
  //     case ResponsiveDeviceType.mobile:
  //     default:
  //       return responsiveValue.mobileValue;
  //   }
  // }

  bool get isCol2 => screenWidth >= 0 && screenWidth <= 400;

  bool get isCol4 => screenWidth >= 401 && screenWidth <= 600;

  bool get isCol6 => screenWidth >= 601 && screenWidth <= 800;

  bool get isCol8 => screenWidth >= 801 && screenWidth <= 1000;

  bool get isCol10 => screenWidth >= 1001 && screenWidth <= 1200;

  bool get isCol12 => screenWidth >= 1201;

  ResponsiveDeviceType getResponsiveDeviceType() {
    if (isCol2) {
      return ResponsiveDeviceType.col2;
    } else if (isCol4) {
      return ResponsiveDeviceType.col4;
    } else if (isCol6) {
      return ResponsiveDeviceType.col6;
    } else if (isCol8) {
      return ResponsiveDeviceType.col8;
    } else if (isCol10) {
      return ResponsiveDeviceType.col10;
    } else {
      return ResponsiveDeviceType.col12;
    }
  }

  double getResponsiveValueByDeviceType({
    required ResponsiveValueModel responsiveValue,
  }) {
    switch (getResponsiveDeviceType()) {
      case ResponsiveDeviceType.col2:
        return responsiveValue.col2Value;
      case ResponsiveDeviceType.col4:
        return responsiveValue.col4Value;
      case ResponsiveDeviceType.col6:
        return responsiveValue.col6Value;
      case ResponsiveDeviceType.col8:
        return responsiveValue.col8Value;
      case ResponsiveDeviceType.col10:
        return responsiveValue.col10Value;
      case ResponsiveDeviceType.col12:
      default:
        return responsiveValue.col12Value;
    }
  }
}
