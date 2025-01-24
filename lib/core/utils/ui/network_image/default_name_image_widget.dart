import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/common/widget/text/medium_title_widget.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/string_extension.dart';

class DefaultNameImageWidget extends StatelessWidget {
  final double? size;
  final String name;
  final bool isToEnableBorder;
  final ColorModel? bgColor;

  const DefaultNameImageWidget({
    super.key,
    this.size,
    required this.name,
    this.isToEnableBorder = false,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 60.w,
      height: size ?? 60.w,
      decoration: BoxDecoration(
        color: getColorByTheme(
          context: context,
          colorClass: bgColor ?? AppColors.lightGreyColor,
        ),
        shape: BoxShape.circle,
        border: isToEnableBorder
            ? Border.all(
                width: 2.w,
                color: getColorByTheme(
                  context: context,
                  colorClass: AppColors.greyShadeColor,
                ),
              )
            : null,
      ),
      child: Center(
        child: MediumTitleWidget(
          title: name.toUpperCase().firstLetter(),
          fontColor: bgColor != null ? AppColors.whiteColor : null,
        ),
      ),
    );
  }
}
