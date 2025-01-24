import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/core/constants/app_colors.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  final Function()? onPressed;
  final IconData? icon;
  final double? height;
  final double? width;
  final bool isCircular;
  final Widget? child;
  final ColorModel? buttonColor;
  final ColorModel? iconColor;
  final ColorModel? borderColor;

  const FloatingActionButtonWidget(
      {this.onPressed,
      this.icon,
      this.height,
      this.width,
      this.isCircular = false,
      this.child,
      this.buttonColor,
      this.iconColor,
      this.borderColor,
      super.key});

  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: FloatingActionButton(
        backgroundColor: getColorByTheme(
          context: context,
          colorClass: widget.buttonColor ?? AppColors.infoColor,
        ),
        onPressed: () {
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        },
        shape: widget.isCircular
            ? const CircleBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
                side: BorderSide(
                    color: getColorByTheme(
                        context: context,
                        colorClass:
                            widget.borderColor ?? AppColors.infoColor))),
        child: widget.child ??
            Icon(widget.icon ?? Icons.add,
                color: getColorByTheme(
                  context: context,
                  colorClass: widget.iconColor ?? AppColors.whiteColor,
                )),
      ),
    );
  }
}
