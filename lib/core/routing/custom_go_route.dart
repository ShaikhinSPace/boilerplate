import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:record_keeping/core/extensions/build_context_extension.dart';

import '../enums/sociair_enums.dart';
import 'navigation_animation.dart';
import 'navigation_observer_route_list.dart';

int systemBackCount = 0;

GoRoute customGoRoute<T>({
  required String path,
  required Widget child,
  GoRouterWidgetBuilder? builder,
  List<RouteBase>? routes,
  GlobalKey<NavigatorState>? parentNavigatorKey,
  GoRouterPageBuilder? pageBuilder,
}) {
  return GoRoute(
    path: path,
    name: path,
    builder: builder,
    routes: routes ?? <RouteBase>[],
    parentNavigatorKey: parentNavigatorKey,
    pageBuilder: pageBuilder ??
        (BuildContext context, GoRouterState state) {
          return fadeTransition(
            context: context,
            state: state,
            child: child,
          );
        },
  );
}

bool _exitFunc(BuildContext ctx) {
  if (NavigationObserverRouteList.screenRouteList.length != 1) {
    return true;
  }
  if (systemBackCount >= 1) {
    systemBackCount = 0;
    // terminate app
    // exit(0);
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    // return app to background
    return true;
  } else {
    ctx.showToastMessage(
      toastMessage: 'Press back again to exit"',
      toastEnum: ToastEnum.warning,
    );
    systemBackCount += 1;
    // reset system back count if user won't press double back button within 2 sec
    Future<void>.delayed(const Duration(seconds: 2)).then(
      (_) => systemBackCount = 0,
    );
    return false;
  }
}
