import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/svg_image_render_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/constants/assets_source.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/utils/ui/decorations.dart';

class TitleCardDecorationWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  const TitleCardDecorationWidget(
      {super.key, required this.title, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getColorByTheme(
          context: context,
          colorClass: AppColors.whiteColor,
        ),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: defaultBoxShadow(
          spreadRadius: 1.5,
          shadowColor: getColorByTheme(
            context: context,
            colorClass: AppColors.lightGreyColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: NormalTextWidget(
              text: title,
              fontSize: fontSize ?? 12.sp,
            ),
          ),
          5.horizontalSpace,
          SvgImageRenderWidget(
            svgImagePath: AssetsSource.defaultAssetsSource.arrowRightSvg,
            svgColor: AppColors.lightGreyColor.copyWith(
              darkModeColor: AppColors.whiteColor.lightModeColor,
              lightModeColor: AppColors.lightGreyColor.lightModeColor,
            ),
          ),
        ],
      ).padAll(value: 6.sp).padVertical(vertical: 2.h),
    );
  }
}
