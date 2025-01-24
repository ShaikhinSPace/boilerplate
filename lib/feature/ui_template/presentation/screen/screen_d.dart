import 'package:flutter/material.dart';
import 'package:record_keeping/common/navigation_cubit/bottom_nav_cubit.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';
import 'package:record_keeping/core/routing/route_name.dart';
import 'package:record_keeping/feature/home/constants/home_screen_constant.dart';

import '../../../../core/config/di/di_injectable.dart';

class ScreenD extends StatelessWidget {
  const ScreenD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NormalTextWidget(
        text: 'Go to profile',
      ).center().onTap(() {
        getIt<BottomNavCubit>().updateBottomNavBar(
          currentIndex:
              HomeScreenConstants.getIndexBySlug(RouteName.profileRoute),
          activeSlug: RouteName.profileRoute,
        );
        getIt<NavigationService>().pushReplacementNamed(
          RouteName.profileRoute,
        );
      }),
    );
  }
}
