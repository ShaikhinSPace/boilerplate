import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:record_keeping/common/navigation_cubit/bottom_nav_cubit.dart';
import 'package:record_keeping/core/config/di/di_injectable.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/feature/home/constants/home_screen_constant.dart';

class BottomNavBarWidget extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final BottomNavigationBarType type;
  final StatefulNavigationShell navigationShell;
  final int currIndex;
  final Function()? onButtonNavPressed;

  const BottomNavBarWidget({
    super.key,
    required this.items,
    this.type = BottomNavigationBarType.fixed,
    required this.currIndex,
    required this.navigationShell,
    this.onButtonNavPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: items,
      currentIndex: currIndex,
      selectedItemColor: getColorByTheme(
        context: context,
        colorClass: AppColors.blackColor,
      ),
      selectedIconTheme: IconThemeData(
        color: getColorByTheme(
          context: context,
          colorClass: AppColors.blackColor,
        ),
      ),
      onTap: (int idx) {
        navigationShell.goBranch(
          idx,
          initialLocation: idx == navigationShell.currentIndex,
        );
        getIt<BottomNavCubit>().updateBottomNavBar(
          currentIndex: idx,
          activeSlug: HomeScreenConstants.getSlugByIndex(idx),
        );
        if (onButtonNavPressed != null) {
          onButtonNavPressed!();
        }
      },
    );
  }
}
