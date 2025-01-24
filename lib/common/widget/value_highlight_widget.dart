import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/svg_image_render_widget.dart';
import 'package:record_keeping/common/widget/text/heading_text_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/sociair_default_constants.dart';
import '../model/color_model.dart';
import 'author_list_tile_widget.dart';

class LabelConfig {
  final String? title;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final ColorModel? titleFontColor;
  final int maxLines;

  LabelConfig({
    this.title,
    this.titleFontColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.maxLines = 1,
  });
}

class LocalImageConfig {
  final String imagePath;
  final double? imageHeight;
  final double? imageWidth;
  final ColorModel? svgColor;
  final double? padRight;
  final double? padLeft;

  LocalImageConfig({
    required this.imagePath,
    this.imageHeight,
    this.imageWidth,
    this.padRight,
    this.padLeft,
    this.svgColor,
  });
}

class ValueHighLightWidget extends StatelessWidget {
  final LabelConfig labelConfig;
  final LocalImageConfig? localImageConfig;
  final LabelConfig valueConfig;
  final AuthorDecorationConfig? authorDecorationConfig;
  final double? width;

  const ValueHighLightWidget({
    super.key,
    required this.labelConfig,
    required this.valueConfig,
    this.localImageConfig,
    this.width,
    this.authorDecorationConfig,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: authorDecorationConfig?.backgroundColor != null
            ? getColorByTheme(
                context: context,
                colorClass: authorDecorationConfig!.backgroundColor!)
            : null,
        borderRadius: (authorDecorationConfig?.isBorderRequired ?? false)
            ? BorderRadius.all(
                Radius.circular(authorDecorationConfig?.borderRadius ??
                    kDefaultBorderRadius),
              )
            : null,
        border: (authorDecorationConfig?.isBorderRequired ?? false)
            ? Border.all(
                width:
                    authorDecorationConfig?.borderSize ?? kDefaultBorderWidth,
                color: getColorByTheme(
                  context: context,
                  colorClass: authorDecorationConfig?.borderColor ??
                      AppColors.borderColor,
                ),
              )
            : null,
      ),
      child: Row(
        children: <Widget>[
          SvgImageRenderWidget(
            svgImagePath: localImageConfig?.imagePath ?? '',
            height: localImageConfig?.imageHeight ?? 32.h,
            width: localImageConfig?.imageWidth,
            svgColor: localImageConfig?.svgColor ?? AppColors.blackColor,
          )
              .visible(
                localImageConfig?.imagePath != null,
              )
              .padLeft(
                left: localImageConfig?.padLeft ?? 6.sp,
              )
              .padRight(
                right: localImageConfig?.padRight ?? 0,
              ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (valueConfig.title != null) ...<Widget>{
                  HeadingTextWidget(
                    title: valueConfig.title!,
                    fontSize: valueConfig.titleFontSize,
                    fontColor: valueConfig.titleFontColor,
                    fontWeight: valueConfig.titleFontWeight,
                    maxLines: valueConfig.maxLines,
                  ),
                },
                if (labelConfig.title != null) ...<Widget>{
                  1.verticalSpace,
                  NormalTextWidget(
                    text: labelConfig.title!,
                    fontSize: labelConfig.titleFontSize ?? 9.sp,
                    fontColor: labelConfig.titleFontColor,
                    fontWeight: labelConfig.titleFontWeight,
                    maxLines: labelConfig.maxLines,
                    overflow: false,
                  ),
                },
              ],
            ).padAll(
                value: (authorDecorationConfig?.isBorderRequired ?? false)
                    ? null
                    : 0),
          ),
        ],
      ),
    );
  }
}
