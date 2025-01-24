import 'package:flutter/material.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/core/extensions/text_theme_extension.dart';

import '../../../core/constants/app_colors.dart';

class MediumTitleWidget extends StatelessWidget {
  final String title;
  final int? maxLines;
  final FontWeight? fontWeight;
  final ColorModel? fontColor;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const MediumTitleWidget({
    super.key,
    required this.title,
    this.maxLines,
    this.fontWeight,
    this.fontColor,
    this.fontSize,
    this.textAlign,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.bodyMedium!.copyWith(
        fontWeight: fontWeight ?? FontWeight.w600,
        color: fontColor != null
            ? getColorByTheme(context: context, colorClass: fontColor!)
            : null,
        fontSize: fontSize,
        decoration: textDecoration,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
