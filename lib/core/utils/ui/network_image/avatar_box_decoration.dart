import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/core/constants/app_colors.dart';

class AvatarBoxDecorationWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final bool isToEnableBorder;
  final Widget child;
  final ColorModel? bgColor;
  const AvatarBoxDecorationWidget({
    super.key,
    this.height,
    this.width,
    this.isToEnableBorder = false,
    required this.child,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: height ?? 60.w,
      height: width ?? 60.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: getColorByTheme(
          context: context,
          colorClass: bgColor ?? AppColors.lightGreyColor,
        ),
        border: isToEnableBorder
            ? Border.all(
                width: 2,
                color: getColorByTheme(
                  context: context,
                  colorClass: AppColors.greyShadeColor,
                ),
              )
            : null,
      ),
      child: child,
    );
  }
}
