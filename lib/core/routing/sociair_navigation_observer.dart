import 'package:flutter/material.dart';
import '../config/di/di_injectable.dart';
import '../network/internet/internet_cubit.dart';
import 'navigation_observer_route_list.dart';

ValueNotifier<bool> dropDownNotifier = ValueNotifier<bool>(true);

class SociairNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    getIt<InternetCubit>().updateCurrentScreenRoute(
      routeName: route.settings.name ?? '',
      isPushed: true,
    );
    NavigationObserverRouteList.updateScreenRoutes(
      isPushed: true,
      routeName: route.settings.name,
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    getIt<InternetCubit>().updateCurrentScreenRoute(
      routeName: route.settings.name ?? '',
      isPushed: false,
    );

    if (route is! ModalBottomSheetRoute &&
        route is! DialogRoute &&
        !dropDownNotifier.value) {
      NavigationObserverRouteList.updateScreenRoutes(
        isPushed: false,
        routeName: route.settings.name,
      );
    }
  }
}
