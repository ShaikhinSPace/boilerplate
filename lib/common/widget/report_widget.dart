import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/common/widget/value_highlight_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/assets_source.dart';
import 'author_list_tile_widget.dart';

class ReportWidget extends StatelessWidget {
  final String totalCallCount;
  final String totalChatReviewCount;
  final String title;
  final String? type;

  const ReportWidget({
    super.key,
    required this.totalCallCount,
    required this.totalChatReviewCount,
    required this.title,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return AuthorListTileWidget(
      authorListTileModel: AuthorListTileModel(
        authorDecorationConfig: AuthorDecorationConfig(
          backgroundColor: AppColors.lightGreyColor,
          borderRadius: 10.r,
          isBorderRequired: true,
          borderColor: AppColors.transparentColor,
        ),
        titleConfig: AuthorTitleConfig(
          title: title,
          suffixWidget: type != null ? NormalTextWidget(text: type!) : null,
          titleFontSize: 14.sp,
        ),
        bottomWidget: Row(
          children: <Widget>[
            Expanded(
              child: ValueHighLightWidget(
                labelConfig: LabelConfig(
                  title: 'Call Handled',
                  titleFontSize: 12.sp,
                ),
                valueConfig: LabelConfig(
                  title: totalCallCount,
                  // titleFontSize: 20.sp,
                ),
                authorDecorationConfig: AuthorDecorationConfig(
                  isBorderRequired: true,
                  borderColor: AppColors.whiteColor,
                  backgroundColor: AppColors.whiteColor,
                ),
                localImageConfig: LocalImageConfig(
                  imagePath: AssetsSource.bottomNavAssetsSource.callSvg,
                  svgColor: AppColors.lightGreyColor,
                  padRight: 5.w,
                  imageHeight: 24.w,
                ),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: ValueHighLightWidget(
                labelConfig: LabelConfig(
                  title: 'Reviewed',
                  titleFontSize: 12.sp,
                ),
                valueConfig: LabelConfig(
                  title: totalChatReviewCount,
                  // titleFontSize: 20.sp,
                ),
                authorDecorationConfig: AuthorDecorationConfig(
                  isBorderRequired: true,
                  borderColor: AppColors.whiteColor,
                  backgroundColor: AppColors.whiteColor,
                ),
                localImageConfig: LocalImageConfig(
                  imagePath: AssetsSource.bottomNavAssetsSource.chatSvg,
                  svgColor: AppColors.lightGreyColor,
                  padRight: 5.w,
                  imageHeight: 24.w,
                ),
              ),
            ),
          ],
        ).padTop(top: 10.h),
      ),
    ).padHorizontal(horizontal: 5.w);
  }
}
