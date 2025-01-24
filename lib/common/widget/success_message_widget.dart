import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

import '../../core/constants/app_colors.dart';
import '../../core/enums/sociair_enums.dart';
import '../model/color_model.dart';
import 'text/normal_text_widget.dart';

class SuccessMessageWidget extends StatelessWidget {
  final String? message;
  final AbsNormalStatus absNormalStatus;
  final double? bottomSpacing;
  final double? topSpacing;
  final bool isInfo;

  const SuccessMessageWidget({
    super.key,
    this.message,
    this.topSpacing,
    this.bottomSpacing,
    required this.absNormalStatus,
    this.isInfo = false,
  });

  @override
  Widget build(BuildContext context) {
    return absNormalStatus == AbsNormalStatus.success
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: topSpacing,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: getColorByTheme(
                    context: context,
                    colorClass: AppColors.successColor,
                  ),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: NormalTextWidget(
                  text: message ?? '',
                  maxLines: 5,
                  fontColor: ColorModel(
                    lightModeColor: Colors.white,
                    darkModeColor: Colors.white,
                  ),
                ).padAll(),
              ),
              SizedBox(
                height: bottomSpacing,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
