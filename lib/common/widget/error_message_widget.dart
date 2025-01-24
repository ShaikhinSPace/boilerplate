import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_service/network/failure_state.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/enums/sociair_enums.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

class ErrorMessageWidget extends StatelessWidget {
  final FailureState? failureState;
  final AbsNormalStatus absNormalStatus;
  final int? statusCode;
  final double? bottomSpacing;
  final double? topSpacing;

  const ErrorMessageWidget({
    super.key,
    this.failureState,
    this.statusCode,
    this.topSpacing,
    this.bottomSpacing,
    required this.absNormalStatus,
  });

  @override
  Widget build(BuildContext context) {
    int? code;
    String? message;
    Map<String, dynamic> errorData = <String, dynamic>{};
    if (failureState?.data != null &&
        failureState!.data is Map &&
        Map<String, dynamic>.of(failureState!.data).isNotEmpty) {
      errorData = Map<String, dynamic>.of(failureState!.data);
      if (errorData.containsKey('code') && errorData.containsKey('chat')) {
        code = errorData['code'];
        message = errorData['chat'];
      }
    }
    return absNormalStatus != AbsNormalStatus.error && code != statusCode
        ? const SizedBox.shrink()
        : Column(
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
                    colorClass: AppColors.errorColor,
                  ),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: NormalTextWidget(
                  text: message ?? failureState?.message ?? '',
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
          );
  }
}
