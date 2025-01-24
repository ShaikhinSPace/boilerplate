import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/text/heading_text_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

import '../../core/constants/app_colors.dart';

class ViewAllWidget extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final bool isToDisplayViewAll;

  const ViewAllWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.isToDisplayViewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isToDisplayViewAll
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: <Widget>[
        HeadingTextWidget(title: title),
        if (isToDisplayViewAll)
          NormalTextWidget(
            text: 'View All',
            fontColor: AppColors.blueColor,
          ).onTap(() => onTap()),
      ],
    ).padHorizontal(horizontal: 10.w);
  }
}
