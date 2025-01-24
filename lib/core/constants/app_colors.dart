import 'package:flutter/material.dart';
import 'package:record_keeping/core/extensions/build_context_extension.dart';

import '../../common/model/color_model.dart';

class AppColors {
  AppColors._();

  static ColorModel backgroundColor = ColorModel(
    darkModeColor: Colors.black,
    lightModeColor: Colors.white,
  );

  static ColorModel cardColor = ColorModel(
    darkModeColor: const Color(0xFF1F1F1F),
    lightModeColor: const Color(0xFFFAFAFA),
  );

  static ColorModel primaryColor = ColorModel(
    darkModeColor: Colors.white,
    lightModeColor: Colors.black,
  );

  static ColorModel secondaryColor = ColorModel(
    darkModeColor: const Color(0xff373A40),
    lightModeColor: const Color(0xFFF5F5F5),
  );

  static ColorModel blackColor = ColorModel(
    darkModeColor: Colors.white,
    lightModeColor: Colors.black,
  );

  static ColorModel lightBlackColor = ColorModel(
    lightModeColor: const Color(0xFF222831),
    darkModeColor: const Color(0xFFBFCFE7),
  );

  static ColorModel blueColor = ColorModel(
    darkModeColor: Colors.grey,
    lightModeColor: Colors.blueAccent,
  );

  static ColorModel borderColor = ColorModel(
    darkModeColor: const Color(0xFFF3F8FF),
    lightModeColor: Colors.grey.withOpacity(0.25),
  );

  static ColorModel greyColor = ColorModel(
    darkModeColor: const Color(0xFFAAAAAA),
    lightModeColor: const Color(0xFF61677A),
  );

  static ColorModel greyShadeColor = ColorModel(
    darkModeColor: const Color(0xFF61677A),
    lightModeColor: Colors.grey.shade800,
  );

  static ColorModel blackShadeColor = ColorModel(
    darkModeColor: const Color(0xFF404040),
    lightModeColor: const Color(0xFF404040),
  );

  static ColorModel lightGreyColor = ColorModel(
    darkModeColor: const Color(0xFF1F1F1F),
    lightModeColor: Colors.grey.withOpacity(0.1),
  );

  static ColorModel yellowColor = ColorModel(
    darkModeColor: const Color(0xFFFFECB3),
    lightModeColor: const Color(0xFFFFECB3),
  );

  static ColorModel messageSenderColor = lightGreyColor;

  static ColorModel messageReceiverColor = ColorModel(
    darkModeColor: const Color(0xFF1F1F1F).withOpacity(0.4),
    lightModeColor: Colors.grey.withOpacity(0.3),
  );

  static ColorModel errorColor = ColorModel(
    darkModeColor: const Color(0xFFFE346E),
    lightModeColor: const Color(0xFFDA000D),
  );

  static ColorModel successColor = ColorModel(
    darkModeColor: const Color(0xFF40A578),
    lightModeColor: const Color(0xFF008931),
  );

  static ColorModel successSecondaryColor = ColorModel(
    lightModeColor: const Color(0xffC5FF95),
    darkModeColor: const Color(0xFF6196A6),
  );

  static ColorModel whiteColor = ColorModel(
    darkModeColor: Colors.black,
    lightModeColor: Colors.white,
  );

  static ColorModel pendingColor = ColorModel(
    darkModeColor: const Color(0xFFFD7E14),
    lightModeColor: const Color(0xFFFD7E14),
  );

  static ColorModel infoColor = ColorModel(
    darkModeColor: Colors.white,
    lightModeColor: const Color(0xFF0D6EFD),
  );

  static ColorModel warningColor = ColorModel(
    darkModeColor: const Color(0xFFFFC107),
    lightModeColor: const Color(0xFFFFC107),
  );

  static ColorModel svgIconColor = ColorModel(
    darkModeColor: Colors.white,
    lightModeColor: const Color(0xFF555555),
  );

  static ColorModel hrTitileColor = ColorModel(
    lightModeColor: const Color(0xFF354561),
    darkModeColor: const Color(0xFFC7C8CC),
  );

  static ColorModel darkGreyColor = ColorModel(
    lightModeColor: const Color(0xff646464),
    darkModeColor: Colors.grey,
  );

  static ColorModel pinkColor = ColorModel(
    lightModeColor: const Color(0xffD2649A),
    darkModeColor: const Color(0xffD2649A),
  );

  static ColorModel dialogBgColor = ColorModel(
    lightModeColor: Colors.white,
    darkModeColor: const Color(0xff646464),
  );
  static ColorModel otherActivitiesColor = ColorModel(
    lightModeColor: Colors.white,
    darkModeColor: const Color(0xFF31363F),
  );

  static ColorModel statusPendingContainerColor = ColorModel(
    lightModeColor: const Color(0xFF373A40),
    darkModeColor: const Color(0xFFEEEEEE),
  );
  static ColorModel statusPendingTextColor = ColorModel(
    lightModeColor: const Color(0xFF83B4FF),
    darkModeColor: const Color(0xFF8758FF),
  );
  static ColorModel transparentColor = ColorModel(
    lightModeColor: Colors.transparent,
    darkModeColor: Colors.transparent,
  );
}

Color getColorByTheme({
  required BuildContext context,
  required ColorModel colorClass,
}) {
  return context.isDark ? colorClass.darkModeColor : colorClass.lightModeColor;
}
