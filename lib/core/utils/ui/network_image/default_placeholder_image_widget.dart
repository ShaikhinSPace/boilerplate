import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/svg_image_render_widget.dart';

import '../../../constants/app_colors.dart';

class DefaultPlaceholderImageWidget extends StatelessWidget {
  final double? size;
  final double? svgImageSize;
  final String svgImage;
  final bool isToEnableBorder;

  const DefaultPlaceholderImageWidget({
    super.key,
    this.size,
    this.svgImageSize,
    required this.svgImage,
    this.isToEnableBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 60.w,
      height: size ?? 60.w,
      decoration: BoxDecoration(
        color: getColorByTheme(
          context: context,
          colorClass: AppColors.lightGreyColor,
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
        child: SvgImageRenderWidget(
          svgImagePath: svgImage,
          width: svgImageSize,
          height: svgImageSize,
        ),
      ),
    );
  }
}
