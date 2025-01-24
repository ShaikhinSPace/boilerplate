import 'package:flutter/material.dart';
import 'package:record_keeping/common/widget/text/heading_text_widget.dart';
import 'package:record_keeping/common/widget/text/medium_title_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

class NoDataWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const NoDataWidget({
    super.key,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Image.asset(
        //   AssetsSource.calls.noDataPng,
        // ),
        // 10.verticalSpace,
        HeadingTextWidget(
          title: title ?? 'Relax',
        ).padHorizontal(),
        MediumTitleWidget(
          title: subTitle ?? "You don't have pending activities",
          maxLines: 3,
          textAlign: TextAlign.center,
        ).padHorizontal(),
      ],
    );
  }
}
