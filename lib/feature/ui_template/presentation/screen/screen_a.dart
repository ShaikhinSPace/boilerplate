import 'package:flutter/material.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

import '../../../../common/widget/text/heading_text_widget.dart';
import '../../../../common/widget/text/normal_text_widget.dart';
import '../../../../core/config/di/di_injectable.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_name.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({super.key});

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const HeadingTextWidget(
            title: 'Screen A',
          ),
        ),
        body: const NormalTextWidget(
          text: 'Click Here To Navigate Screen B',
        ).center().onTap(() {
          getIt<NavigationService>().pushNamed(
            RouteName.screenBRoute,
          );
        }),
      ),
    );
  }
}
