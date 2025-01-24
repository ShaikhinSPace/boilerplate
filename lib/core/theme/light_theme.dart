import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:record_keeping/core/constants/app_colors.dart';

TextTheme fontFamily = GoogleFonts.ibmPlexSansTextTheme();

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
    ).copyWith(
      scaffoldBackgroundColor: AppColors.backgroundColor.lightModeColor,
      primaryColor: AppColors.primaryColor.lightModeColor,
      brightness: Brightness.light,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundColor.lightModeColor,
        selectedItemColor: AppColors.greyShadeColor.lightModeColor,
        unselectedItemColor: AppColors.greyColor.lightModeColor,
        unselectedLabelStyle: const TextStyle(
          // fontSize: context.getFontSizeBasedOnDeviceType(
          //   col2FontSize: 11.sp,
          //   col4FontSize: 11.sp,f
          //   col6FontSize: 11.sp,
          //   col8FontSize: 11.sp,
          //   col10FontSize: 11.sp,
          //   col12FontSize: 4.sp,
          // ),
          fontWeight: FontWeight.w400,
        ),
        selectedLabelStyle: const TextStyle(
          // fontSize: context.getFontSizeBasedOnDeviceType(
          //   col2FontSize: 11.sp,
          //   col4FontSize: 11.sp,
          //   col6FontSize: 11.sp,
          //   col8FontSize: 11.sp,
          //   col10FontSize: 11.sp,
          //   col12FontSize: 4.sp,
          // ),
          fontWeight: FontWeight.w600,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.backgroundColor.lightModeColor,
      ),
      datePickerTheme: DatePickerThemeData(
        surfaceTintColor: AppColors.primaryColor.lightModeColor,
        headerBackgroundColor: AppColors.primaryColor.lightModeColor,
        headerForegroundColor: AppColors.whiteColor.lightModeColor,
        backgroundColor: AppColors.whiteColor.lightModeColor,
        dayOverlayColor:
            WidgetStatePropertyAll(AppColors.errorColor.lightModeColor),
        todayBackgroundColor: WidgetStatePropertyAll(
          AppColors.primaryColor.lightModeColor,
        ),
        todayForegroundColor: WidgetStatePropertyAll(
          AppColors.whiteColor.lightModeColor,
        ),
        dayForegroundColor:
            WidgetStatePropertyAll(AppColors.whiteColor.lightModeColor),
        cancelButtonStyle: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(
            AppColors.primaryColor.lightModeColor,
          ),
        ),
        confirmButtonStyle: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(
            AppColors.primaryColor.lightModeColor,
          ),
        ),
        // headerHeadlineStyle: TextStyle(
        //   color: AppColors.infoColor.lightModeColor,
        // ),
        dividerColor: AppColors.primaryColor.lightModeColor,
        weekdayStyle: TextStyle(
          color: AppColors.primaryColor.lightModeColor.withOpacity(0.5),
        ),
        rangePickerBackgroundColor: AppColors.whiteColor.lightModeColor,
        rangePickerHeaderBackgroundColor: AppColors.primaryColor.lightModeColor,
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
            AppColors.primaryColor.lightModeColor.withOpacity(0.2),
        rangePickerElevation: 0,
        rangePickerShadowColor: AppColors.whiteColor.lightModeColor,
        todayBorder: BorderSide(color: AppColors.whiteColor.lightModeColor),

        // yearBackgroundColor:
        //     WidgetStatePropertyAll(AppColors.infoColor.lightModeColor),
      ),
      timePickerTheme: TimePickerThemeData(
        dayPeriodColor: AppColors.primaryColor.lightModeColor.withOpacity(0.2),
        dayPeriodTextStyle: TextStyle(
          color: AppColors.primaryColor.lightModeColor,
        ),
        dayPeriodBorderSide: BorderSide(
            color: AppColors.primaryColor.lightModeColor.withOpacity(0.2)),
        dialTextColor: AppColors.primaryColor.lightModeColor,
        dialBackgroundColor:
            AppColors.primaryColor.lightModeColor.withOpacity(0.2),
        dayPeriodTextColor: AppColors.primaryColor.lightModeColor,
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            6.r,
          ),
        ),
        dialHandColor: AppColors.whiteColor.lightModeColor,
        hourMinuteColor: AppColors.primaryColor.lightModeColor.withOpacity(0.2),
        hourMinuteTextColor: AppColors.primaryColor.lightModeColor,
        entryModeIconColor: AppColors.primaryColor.lightModeColor,
      ),
      colorScheme: const ColorScheme(
        // status bar and app bar color
        surface: Colors.white,
        //app bar text color
        onSurface: Colors.black,
        //background surface color impact while scrolling
        surfaceTint: Colors.white,
        // impact for tab bar bottom
        surfaceContainerHighest: Colors.red,
        brightness: Brightness.light,
        error: Colors.red,
        onError: Colors.red,
        onPrimary: Colors.black,
        onSecondary: Colors.deepOrangeAccent,
        primary: Colors.black,
        secondary: Colors.deepOrangeAccent,
      ),
    );
