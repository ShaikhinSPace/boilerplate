import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/common/model/responsive_value_model.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/responsive_context_extension.dart';

class SvgImageRenderWidget extends StatelessWidget {
  final String svgImagePath;
  final double? width;
  final double? height;
  final ColorModel? svgColor;

  const SvgImageRenderWidget({
    super.key,
    required this.svgImagePath,
    this.width,
    this.height,
    this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgImagePath,
      width: width ??
          context.getResponsiveValueByDeviceType(
            responsiveValue: ResponsiveValueModel(
              col2Value: 18.w,
              col4Value: 18.w,
              col6Value: 18.w,
              col8Value: 18.w,
              col10Value: 18.w,
              col12Value: 8.w,
            ),
          ),
      height: height ??
          context.getResponsiveValueByDeviceType(
            responsiveValue: ResponsiveValueModel(
              col2Value: 18.w,
              col4Value: 18.w,
              col6Value: 18.w,
              col8Value: 18.w,
              col10Value: 18.w,
              col12Value: 8.w,
            ),
          ),
      theme: SvgTheme(
        currentColor: getColorByTheme(
          context: context,
          colorClass: svgColor ?? AppColors.svgIconColor,
        ),
      ),
    );
  }
}
