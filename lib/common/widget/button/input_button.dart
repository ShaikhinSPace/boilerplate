import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/common/widget/svg_image_render_widget.dart';
import 'package:record_keeping/common/widget/text/medium_title_widget.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

class InputButtonWidget extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final BorderRadius? borderRadius;
  final int debounceDuration;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final bool isBorderButton;
  final double? fontSize;
  final double? assetSize;
  final ColorModel? fontColor;
  final ColorModel? bgColor;
  final String? asset;

  const InputButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    this.onLongPress,
    this.borderRadius,
    this.isBorderButton = false,
    this.asset,
    this.debounceDuration = 2,
    this.width,
    this.height,
    this.padding,
    this.fontSize,
    this.bgColor,
    this.assetSize,
    this.fontColor,
  });

  @override
  State<StatefulWidget> createState() => _InputButtonWidgetState();
}

class _InputButtonWidgetState extends State<InputButtonWidget>
    with TickerProviderStateMixin<InputButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: UniqueKey(),
      borderRadius: widget.borderRadius,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(seconds: 3),
        width: widget.width,
        height: widget.height,
        child: Container(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: getColorByTheme(
              context: context,
              colorClass: widget.isBorderButton
                  ? AppColors.whiteColor
                  : widget.bgColor ?? AppColors.blueColor,
            ),
            borderRadius: BorderRadius.circular(
              4.r,
            ),
            border: Border.all(
                color: getColorByTheme(
              context: context,
              colorClass: widget.bgColor ?? AppColors.blueColor,
            )),
          ),
          padding: widget.padding ??
              EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 10.w,
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgImageRenderWidget(
                svgImagePath: widget.asset ?? '',
                height: widget.assetSize,
                svgColor: widget.bgColor,
              ).padRight(right: 6.w).visible(widget.asset != null),
              MediumTitleWidget(
                title: widget.title,
                fontColor:
                    // widget.isBorderButton
                    //     ?
                    widget.fontColor ??
                        AppColors.whiteColor.copyWith(
                          lightModeColor: AppColors.whiteColor.lightModeColor,
                          darkModeColor: AppColors.whiteColor.darkModeColor,
                        ),
                fontWeight: FontWeight.w500,
                fontSize: widget.fontSize ?? 17.sp,
              ).center(),
            ],
          ),
        ),
      ),
    );
  }
}
