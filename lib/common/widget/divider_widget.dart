import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/core/constants/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2.h,
      color: getColorByTheme(
        context: context,
        colorClass: AppColors.lightGreyColor,
      ),
    );
  }
}
