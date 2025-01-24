import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:record_keeping/common/navigation_cubit/bottom_nav_cubit.dart';
import 'package:record_keeping/common/widget/bottom_navbar_widget.dart';
import 'package:record_keeping/feature/home/constants/home_screen_constant.dart';

class BottomNavigationBarScaffold extends StatefulWidget {
  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  const BottomNavigationBarScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  State<BottomNavigationBarScaffold> createState() =>
      _BottomNavigationBarScaffoldState();
}

class _BottomNavigationBarScaffoldState
    extends State<BottomNavigationBarScaffold> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, (int, String)>(
      builder: (BuildContext context, (int, String) navState) {
        return Scaffold(
          body: widget.navigationShell,
          bottomNavigationBar: BottomNavBarWidget(
            currIndex: navState.$1,
            items: HomeScreenConstants.navBarList,
            navigationShell: widget.navigationShell,
          ),
        );
      },
    );
  }
}
