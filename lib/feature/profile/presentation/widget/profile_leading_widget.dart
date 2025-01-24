import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/utils/ui/responsive_widget.dart';

class ProfileLeadingWidget extends StatefulWidget {
  final String? shorName;
  final String? name;
  final String? vertical;

  const ProfileLeadingWidget(
      {this.shorName, this.name, this.vertical, super.key});

  @override
  State<ProfileLeadingWidget> createState() => _ProfileLeadingWidgetState();
}

class _ProfileLeadingWidgetState extends State<ProfileLeadingWidget> {
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
    double? fontSize,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: getColorByTheme(
              context: context,
              colorClass: AppColors.lightGreyColor,
            ),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: getColorByTheme(
          context: context,
          colorClass: AppColors.whiteColor,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: getColorByTheme(
              context: context,
              colorClass: AppColors.primaryColor,
            ),
            maxRadius: 20.r,
            child: NormalTextWidget(
              text: widget.shorName ?? '',
              fontColor: AppColors.whiteColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.sp,
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                NormalTextWidget(
                  text: widget.name ?? '',
                  fontSize: fontSize,
                ),
                NormalTextWidget(
                  text: widget.shorName ?? '',
                  fontColor: AppColors.darkGreyColor,
                  fontSize: fontSize,
                )
              ],
            ),
          ),
          5.horizontalSpace,
        ],
      ).padHorizontal(horizontal: 10.sp).onTap(() {
        // getIt<NavigationService>().pushNamed(
        //     RouteName.hrRoute.hrSubordinateDetailInfoScreenRoute,
        //     extra: getIt<MyProfileCubit>().state.profileState.data?.id);
      }),
    );
  }

  Widget largeScreenView() {
    return smallScreenView(fontSize: 10.sp);
  }
}
