import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/value_highlight_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

import '../../core/constants/app_colors.dart';
import 'author_list_tile_widget.dart';

class MessageReportItemWidget extends StatelessWidget {
  final String? title;
  final String? totalSalesCount;
  final String? totalSupportCount;
  final String? totalCount;
  final String? salesTitle;
  final String? supportTitle;
  final String? totalTitle;

  const MessageReportItemWidget({
    super.key,
    this.title,
    this.totalSalesCount,
    this.totalSupportCount,
    this.totalCount,
    this.salesTitle,
    this.supportTitle,
    this.totalTitle,
  });

  Widget _buildItem({
    required String title,
    required String value,
    String? svgImagePath,
  }) {
    return Expanded(
      child: ValueHighLightWidget(
        labelConfig: LabelConfig(
          title: title,
          titleFontSize: 12.sp,
        ),
        valueConfig: LabelConfig(
          title: value,
          titleFontSize: 16.sp,
        ),
        authorDecorationConfig: AuthorDecorationConfig(
          isBorderRequired: true,
          borderColor: AppColors.whiteColor,
          backgroundColor: AppColors.whiteColor,
        ),
        localImageConfig: svgImagePath != null
            ? LocalImageConfig(
                svgColor: AppColors.lightGreyColor,
                imagePath: svgImagePath,
                padRight: 2.w,
                imageHeight: 20.w,
              )
            : null,
      ),
    );
  }

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
        titleConfig: title != null
            ? AuthorTitleConfig(
                title: title,
                titleFontSize: 14.sp,
              )
            : null,
        bottomWidget: Row(
          children: <Widget>[
            if (totalSalesCount != null)
              _buildItem(
                title: salesTitle ?? 'Sales',
                value: '$totalSalesCount',
              ),
            if (totalSupportCount != null) ...<Widget>{
              10.horizontalSpace,
              _buildItem(
                title: supportTitle ?? 'Support',
                value: '$totalSupportCount',
              ),
            },
            if (totalCount != null) ...<Widget>{
              10.horizontalSpace,
              _buildItem(
                title: totalTitle ?? 'Total',
                value: '$totalCount',
              ),
            },
          ],
        ).padTop(top: 10.h),
      ),
    ).padHorizontal(horizontal: 5.w);
  }
}
