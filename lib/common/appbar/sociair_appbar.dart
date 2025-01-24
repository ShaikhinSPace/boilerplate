import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

import '../../core/config/di/di_injectable.dart';
import '../../core/constants/app_colors.dart';
import '../../core/routing/navigation_service.dart';
import '../../core/utils/ui/responsive_widget.dart';
import '../../feature/auth/presentation/cubit/profile/my_profile_cubit.dart';
import '../model/color_model.dart';
import '../widget/text/heading_1_text_widget.dart';
import '../widget/text/normal_text_widget.dart';

// ignore: must_be_immutable
class SociairAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar? bottom;
  final Color? backgroundColor;
  final double appbarHeight;
  final Widget? customLeadingWidget;
  final Widget? customTitleWidget;
  bool showBackButton;
  bool showProfileIcon;
  final String? title;
  final List<Widget> action;
  bool isCenterTitle;
  VoidCallback? backButttonPress;
  double elevation;
  double? titleSpacing;
  double? toolbarHeight;
  bool showSearch;
  VoidCallback? onSearchTapped;
  Widget? searchWidget;
  final ColorModel? titleFontColor;
  final double? titleFontSize;
  final VoidCallback? onProfileTap;
  final ColorModel? foregroundColor;
  double? leadingWidth;

  SociairAppBar({
    super.key,
    this.bottom,
    this.showBackButton = true,
    this.titleSpacing,
    this.onSearchTapped,
    this.toolbarHeight,
    this.appbarHeight = 50,
    this.showSearch = false,
    this.leadingWidth,
    this.searchWidget,
    this.backButttonPress,
    this.backgroundColor,
    this.customLeadingWidget,
    this.isCenterTitle = true,
    this.showProfileIcon = false,
    this.customTitleWidget,
    this.title,
    this.action = const <Widget>[],
    this.elevation = 5,
    this.titleFontColor,
    this.titleFontSize,
    this.onProfileTap,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: showBackButton,
      iconTheme: IconThemeData(
          color: getColorByTheme(
              context: context, colorClass: AppColors.blackColor)),
      elevation: elevation,
      foregroundColor: getColorByTheme(
        context: context,
        colorClass: foregroundColor ?? AppColors.blackColor,
      ),
      titleSpacing: titleSpacing ?? 6.w,
      scrolledUnderElevation: 5,
      title: customTitleWidget ??
          Heading1TextWidget(
            fontColor: titleFontColor,
            title: title ?? '',
            fontSize: titleFontSize ?? 16.sp,
          ),
      actions: <Widget>[
        if (action.isNotEmpty) ...action,
        if (showProfileIcon) ...<Widget>[
          _profileWidget().padRight(right: 6.sp).onTap(() {})
        ],
      ],
      centerTitle: customTitleWidget != null ? isCenterTitle : isCenterTitle,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(bottom == null ? appbarHeight.h : 80.h);
}

Widget _profileWidget() {
  return ResponsiveWidget(
      col2View: _profileSmallView(),
      col4View: _profileSmallView(),
      col6View: _profileLargeView(),
      col8View: _profileLargeView(),
      col10View: _profileLargeView(),
      col12View: _profileLargeView());
}

Widget _profileSmallView({double? radius, double? fontSize}) {
  return profileView(
    fontSize: fontSize,
    radius: radius,
    userName: getIt<MyProfileCubit>().state.profileState.data?.name?[0],
  );
}

Widget _profileLargeView() {
  return _profileSmallView(
    radius: 10.sp,
    fontSize: 12.sp,
  );
}

Widget profileView({String? userName, double? radius, double? fontSize}) {
  return CircleAvatar(
    radius: radius ?? 14.r,
    backgroundColor: getColorByTheme(
      context: getIt<NavigationService>().getNavigationContext(),
      colorClass: AppColors.primaryColor,
    ),
    child: Center(
      child: NormalTextWidget(
        text: userName ?? '',
        fontColor: AppColors.whiteColor,
        fontSize: fontSize ?? 18.sp,
      ),
    ),
  );
}
