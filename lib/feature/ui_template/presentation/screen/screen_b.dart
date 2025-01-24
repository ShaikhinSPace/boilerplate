import 'package:flutter/material.dart';
import 'package:record_keeping/common/widget/text/heading_text_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

import '../../../../core/config/di/di_injectable.dart';
import '../../../../core/routing/navigation_service.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingTextWidget(
          title: 'Screen B',
        ),
      ),
      body: const NormalTextWidget(
        text: 'Click Here To Go Back',
      ).center().onTap(() {
        getIt<NavigationService>().pop();
      }),
    );
  }
}
