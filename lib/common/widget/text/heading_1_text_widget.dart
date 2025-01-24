import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/text_theme_extension.dart';

class Heading1TextWidget extends StatelessWidget {
  final String title;
  final int? maxLines;
  final ColorModel? fontColor;
  final double? fontSize;

  const Heading1TextWidget({
    super.key,
    required this.title,
    this.maxLines,
    this.fontColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.headlineLarge?.copyWith(
        color: fontColor != null
            ? getColorByTheme(context: context, colorClass: fontColor!)
            : null,
        fontSize: fontSize ?? 24.sp,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
