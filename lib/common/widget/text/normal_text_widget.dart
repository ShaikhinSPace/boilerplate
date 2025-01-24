import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/text_theme_extension.dart';
import 'package:record_keeping/core/utils/ui/responsive_widget.dart';

class NormalTextWidget extends StatelessWidget {
  final String text;
  final int? maxLines;
  final FontWeight? fontWeight;
  final ColorModel? fontColor;
  final double? fontSize;
  final bool overflow;
  final int? maxLen;
  final TextDecoration? textDecoration;
  final ColorModel? decorationColor;

  final TextAlign? textAlign;
  const NormalTextWidget({
    super.key,
    required this.text,
    this.maxLines,
    this.fontWeight,
    this.fontColor,
    this.fontSize,
    this.overflow = true,
    this.maxLen,
    this.textAlign,
    this.textDecoration,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLen != null
          ? (text.length > maxLen! ? '${text.substring(0, maxLen!)}...' : text)
          : text,
      style: context.textTheme.bodySmall!.copyWith(
          fontWeight: fontWeight,
          color: fontColor != null
              ? getColorByTheme(context: context, colorClass: fontColor!)
              : null,
          fontSize: fontSize,
          decoration: textDecoration,
          decorationColor: getColorByTheme(
            context: context,
            colorClass: decorationColor ?? AppColors.primaryColor,
          )),
      maxLines: maxLines,
      overflow: overflow ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
    );
  }
}

// Responsive Normal Text Widget for temporary use

class ResponsiveTextWidget extends StatefulWidget {
  final String text;
  final FontWeight? fontWeight;
  final ColorModel? fontColor;
  final bool overflow;
  final double? fontSize;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final ColorModel? decorationColor;

  const ResponsiveTextWidget(
      {required this.text,
      this.fontWeight,
      this.fontColor,
      this.overflow = true,
      this.fontSize,
      this.maxLines,
      this.textAlign,
      this.textDecoration,
      this.decorationColor,
      super.key});

  @override
  State<ResponsiveTextWidget> createState() => _ResponsiveTextWidgetState();
}

class _ResponsiveTextWidgetState extends State<ResponsiveTextWidget> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      col4View: smallScreenTextWidget(fontSize: widget.fontSize),
      col8View: largeScreenTextWidget(fontSize: widget.fontSize),
      col12View: largeScreenTextWidget(fontSize: widget.fontSize),
      col2View: smallScreenTextWidget(fontSize: widget.fontSize),
      col6View: largeScreenTextWidget(fontSize: widget.fontSize),
      col10View: largeScreenTextWidget(fontSize: widget.fontSize),
    );
  }

  Widget smallScreenTextWidget({double? fontSize}) {
    return NormalTextWidget(
      text: widget.text,
      fontSize: fontSize ?? 14.sp,
      fontWeight: widget.fontWeight,
      fontColor: widget.fontColor,
      overflow: widget.overflow,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      textDecoration: widget.textDecoration,
      decorationColor: widget.decorationColor,
    );
  }

  Widget largeScreenTextWidget({double? fontSize}) {
    return smallScreenTextWidget(fontSize: fontSize ?? 8.sp);
  }
}
