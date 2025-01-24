import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_service/network/constant/shared_prefs_key.dart';
import 'package:record_keeping/common/widget/show_dialog.dart';
import 'package:record_keeping/common/widget/svg_image_render_widget.dart';
import 'package:record_keeping/common/widget/switch_widget.dart';
import 'package:record_keeping/common/widget/text/medium_title_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/config/di/di_injectable.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/constants/assets_source.dart';
import 'package:record_keeping/core/enums/sociair_enums.dart';
import 'package:record_keeping/core/extensions/build_context_extension.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/local_storage/shared_prefs_func.dart';
import 'package:record_keeping/core/local_storage/shared_prefs_keys.dart';
import 'package:record_keeping/core/theme/theme_cubit.dart';
import 'package:record_keeping/core/utils/ui/responsive_widget.dart';
import 'package:record_keeping/feature/auth/presentation/cubit/profile/my_profile_cubit.dart';
import 'package:record_keeping/feature/auth/presentation/cubit/profile/my_profile_state.dart';

class ProfilePreferencesWidget extends StatefulWidget {
  final Function()? onChangePassword;
  final Function(bool? value)? onChangeTheme;
  final Function()? onLogout;

  const ProfilePreferencesWidget(
      {this.onChangePassword, this.onChangeTheme, this.onLogout, super.key});

  @override
  State<ProfilePreferencesWidget> createState() =>
      _ProfilePreferencesWidgetState();
}

class _ProfilePreferencesWidgetState extends State<ProfilePreferencesWidget> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      col2View: smallScreenView(),
      col4View: smallScreenView(),
      col6View: largeScreenView(),
      col8View: largeScreenView(),
      col10View: largeScreenView(),
      col12View: largeScreenView(),
    );
  }

  Widget smallScreenView({
    double? titleFontSize,
    double? fontSize,
    double? iconSize,
    double? switchSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MediumTitleWidget(
          title: 'Preferences',
          fontSize: titleFontSize,
        ),
        // 20.verticalSpace,
        // Row(
        //   children: <Widget>[
        //     SvgImageRenderWidget(
        //       svgImagePath: AssetsSource.hr.hrPasswordIcon,
        //       svgColor: AppColors.primaryColor,
        //       height: iconSize ?? 24.sp,
        //     ),
        //     10.horizontalSpace,
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         NormalTextWidget(
        //           text: 'Change Password',
        //           fontSize: titleFontSize,
        //         ),
        //         NormalTextWidget(
        //           text: 'Secure your account with a new password',
        //           fontColor: AppColors.darkGreyColor,
        //           fontSize: fontSize,
        //         )
        //       ],
        //     )
        //   ],
        // ).onTap(() {
        //   if (widget.onChangePassword != null) {
        //     widget.onChangePassword!();
        //   }
        // }),
        20.verticalSpace,
        BlocBuilder<ThemeCubit, bool>(
          builder: (BuildContext context, bool isLightTheme) {
            return Row(
              children: <Widget>[
                SvgImageRenderWidget(
                  svgImagePath: AssetsSource.hr.hrThemeIcon,
                  svgColor: AppColors.primaryColor,
                  height: iconSize ?? 24.sp,
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    NormalTextWidget(
                      text: isLightTheme ? 'Dark Mode' : 'Light Mode',
                      fontSize: titleFontSize,
                    ),
                    NormalTextWidget(
                      text: 'Dark mode is easier on your eyes',
                      fontColor: AppColors.darkGreyColor,
                      fontSize: fontSize,
                    )
                  ],
                ),
                const Spacer(),
                SwitchWidget(
                  switchSize: switchSize ?? 25.h,
                  isSelected: !isLightTheme,
                  inactiveThumbColor: AppColors.primaryColor,
                  title: '',
                  onSelected: (bool? value) {
                    getIt<ThemeCubit>().toggleTheme();
                  },
                )
              ],
            );
          },
        ),
        20.verticalSpace,
        BlocConsumer<MyProfileCubit, MyProfileState>(
          listener: (BuildContext ctx, MyProfileState state) {
            if (state.logoutState.absNormalStatus == AbsNormalStatus.error) {
              context.showToastMessage(
                  toastEnum: ToastEnum.error,
                  toastMessage: 'Failed to logout. Please ! try again');
            }
          },
          builder: (BuildContext ctx, MyProfileState state) {
            return state.logoutState.absNormalStatus == AbsNormalStatus.loading
                ? const CircularProgressIndicator().center()
                : Row(
                    children: <Widget>[
                      SvgImageRenderWidget(
                        svgImagePath: AssetsSource.hr.hrLogoutIcon,
                        svgColor: AppColors.primaryColor,
                        height: iconSize ?? 24.sp,
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          NormalTextWidget(
                            text: 'Log Out',
                            fontSize: titleFontSize,
                          ),
                          NormalTextWidget(
                            text: 'Log out of your profile',
                            fontColor: AppColors.darkGreyColor,
                            fontSize: fontSize,
                          )
                        ],
                      )
                    ],
                  );
          },
        ).onTap(() {
          showConfirmationDialog(
            title: 'Are you sure?',
            msg: 'Do you want to logout ?',
            onConfrim: () {
              getIt<MyProfileCubit>().logout();
            },
          );
        }),
        10.verticalSpace,
        NormalTextWidget(
          text: 'Disable Fingerprint',
          fontSize: titleFontSize,
        ).onTap(() {
          setBool(key: SharedPrefsKeys.isFingerPrintEnabled, value: false);
        }),
      ],
    ).padHorizontal(horizontal: 10.sp).padLeft(left: 10.sp);
  }

  Widget largeScreenView() {
    return smallScreenView(
      titleFontSize: 10.sp,
      fontSize: 8.sp,
      iconSize: 30.sp,
      switchSize: 25.h,
    );
  }
}
