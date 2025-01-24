import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

TextTheme fontFamily = GoogleFonts.poppinsTextTheme();

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
    ).copyWith(
      scaffoldBackgroundColor: AppColors.backgroundColor.darkModeColor,
      primaryColor: AppColors.primaryColor.darkModeColor,
      brightness: Brightness.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundColor.darkModeColor,
        selectedItemColor: AppColors.whiteColor.darkModeColor,
        unselectedItemColor: AppColors.greyColor.darkModeColor,
        unselectedLabelStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.backgroundColor.darkModeColor,
      ),
      datePickerTheme: DatePickerThemeData(
          surfaceTintColor: AppColors.primaryColor.lightModeColor,
          headerBackgroundColor:
              AppColors.blackColor.lightModeColor.withOpacity(0.7),
          headerForegroundColor: AppColors.whiteColor.lightModeColor,
          backgroundColor: AppColors.whiteColor.lightModeColor,
          dayOverlayColor:
              WidgetStatePropertyAll(AppColors.whiteColor.lightModeColor),
          todayBackgroundColor: WidgetStatePropertyAll(
            AppColors.blackColor.lightModeColor.withOpacity(0.7),
          ),
          todayForegroundColor: WidgetStatePropertyAll(
            AppColors.whiteColor.lightModeColor,
          ),
          dayForegroundColor:
              WidgetStatePropertyAll(AppColors.greyColor.lightModeColor),
          cancelButtonStyle: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(
              AppColors.blackColor.lightModeColor,
            ),
          ),
          confirmButtonStyle: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(
              AppColors.blackColor.lightModeColor,
            ),
          ),
          // headerHeadlineStyle: TextStyle(
          //   color: AppColors.infoColor.lightModeColor,
          // ),
          dividerColor: AppColors.blackColor.lightModeColor,
          weekdayStyle: TextStyle(
            color: AppColors.blackColor.lightModeColor.withOpacity(0.5),
          ),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
            color: AppColors.blackColor.lightModeColor,
          )),
          rangePickerBackgroundColor: AppColors.whiteColor.lightModeColor,
          rangePickerHeaderBackgroundColor: AppColors.infoColor.lightModeColor,
          rangePickerHeaderForegroundColor: AppColors.whiteColor.lightModeColor,
          rangePickerHeaderHeadlineStyle: TextStyle(
            color: AppColors.whiteColor.lightModeColor,
            fontSize: 16.sp,
          ),
          rangePickerHeaderHelpStyle: TextStyle(
            color: AppColors.whiteColor.lightModeColor,
          ),
          rangePickerSurfaceTintColor: AppColors.whiteColor.lightModeColor,
          rangeSelectionOverlayColor: WidgetStatePropertyAll(
            AppColors.whiteColor.lightModeColor,
          ),
          rangeSelectionBackgroundColor:
              AppColors.infoColor.lightModeColor.withOpacity(0.2),
          rangePickerElevation: 0,
          rangePickerShadowColor: AppColors.whiteColor.lightModeColor,
          todayBorder: BorderSide(color: AppColors.whiteColor.lightModeColor)
          // yearBackgroundColor:
          //     WidgetStatePropertyAll(AppColors.infoColor.lightModeColor),
          ),
      timePickerTheme: TimePickerThemeData(
          dayPeriodColor: AppColors.blackColor.lightModeColor,
          dayPeriodTextStyle: TextStyle(
            color: AppColors.blackColor.lightModeColor,
          ),
          dayPeriodBorderSide: BorderSide(
              color: AppColors.blackColor.darkModeColor.withOpacity(0.2)),
          dialTextColor: AppColors.blackColor.darkModeColor,
          dialBackgroundColor:
              AppColors.blackColor.darkModeColor.withOpacity(0.2),
          dayPeriodTextColor: AppColors.blackColor.darkModeColor,
          hourMinuteShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6.r,
            ),
          ),
          dialHandColor: AppColors.darkGreyColor.darkModeColor.withOpacity(0.5),
          hourMinuteColor: AppColors.blackColor.darkModeColor.withOpacity(0.2),
          hourMinuteTextColor: AppColors.blackColor.darkModeColor,
          entryModeIconColor: AppColors.blackColor.darkModeColor,
          backgroundColor: AppColors.lightBlackColor.lightModeColor,
          cancelButtonStyle: ButtonStyle(
            foregroundColor:
                WidgetStatePropertyAll(AppColors.blackColor.darkModeColor),
          ),
          confirmButtonStyle: ButtonStyle(
            foregroundColor:
                WidgetStatePropertyAll(AppColors.blackColor.darkModeColor),
          ),
          helpTextStyle: TextStyle(color: AppColors.blackColor.darkModeColor)),
      colorScheme: const ColorScheme(
        // status bar and app bar color
        surface: Colors.black,
        //app bar text color
        onSurface: Colors.black,
        //background surface color impact while scrolling
        surfaceTint: Colors.black,

        brightness: Brightness.dark,
        error: Colors.red,
        onError: Colors.red,
        onPrimary: Colors.black,
        onSecondary: Colors.deepOrangeAccent,
        primary: Colors.black,
        secondary: Colors.deepOrangeAccent,
        errorContainer: Colors.red,
        inversePrimary: Colors.green,
        inverseSurface: Colors.pink,
        // primaryContainer: Colors.red,
        onErrorContainer: Colors.red,
        onInverseSurface: Colors.red,
        // onPrimaryContainer: Colors.red,
        // onSecondaryContainer: Colors.red,
        // onSurfaceVariant: Colors.red,

        // onTertiary: Colors.red,
        // onTertiaryContainer: Colors.red,
        // outline: Colors.red,
        // outlineVariant: Colors.red,
        // scrim: Colors.red,
        // secondaryContainer: Colors.red,
        // shadow: Colors.red,
        // surfaceContainerHighest: Colors.red,
        // tertiary: Colors.red,
        // tertiaryContainer: Colors.red,
      ),
    );
