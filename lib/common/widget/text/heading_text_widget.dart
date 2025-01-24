import 'package:flutter/material.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/text_theme_extension.dart';

class HeadingTextWidget extends StatelessWidget {
  final String title;
  final int? maxLines;
  final ColorModel? fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const HeadingTextWidget({
    super.key,
    required this.title,
    this.maxLines,
    this.fontColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.headlineMedium?.copyWith(
        color: getColorByTheme(
          context: context,
          colorClass: fontColor ?? AppColors.primaryColor,
        ),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
