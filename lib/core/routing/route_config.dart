import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:record_keeping/core/routing/navigation_animation.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';
import 'package:record_keeping/core/routing/route_config/auth_route_config.dart';
import 'package:record_keeping/core/routing/route_name.dart';
import 'package:record_keeping/core/routing/sociair_navigation_observer.dart';
import 'package:record_keeping/feature/auth/presentation/screens/finger_print_setup_screen.dart';
import 'package:record_keeping/feature/home/presentation/screen/home_screen.dart';
import 'package:record_keeping/feature/home/presentation/screen/library_detail_screen.dart';
import 'package:record_keeping/feature/image_library/presentation/screens/camera_screen.dart';
import 'package:record_keeping/feature/image_library/presentation/screens/image_picker_screen.dart';
import 'package:record_keeping/feature/upload_image/presentation/cubit/upload_image_cubit.dart';
import 'package:record_keeping/feature/upload_image/presentation/screens/upload_image_screen.dart';

import '../../feature/home/domain/dao/image_remarks_model.dart';
import '../../feature/home/presentation/cubit/library_detail_by_id_cubit.dart';
import '../../feature/home/presentation/screen/bottom_navigationbar_scaffold.dart';
import '../../feature/image_library/presentation/screens/image_preview_screen.dart';
import '../../feature/profile/presentation/screen/profile_screen.dart';
import '../../feature/ui_template/presentation/screen/ui_template_screen.dart';
import '../global_data/sociair_global_var_data.dart';
import 'custom_go_route.dart';

/// The route configuration.
GoRouter get router => GoRouter(
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              observers: <NavigatorObserver>[
                SociairNavigatorObserver(),
              ],
              navigatorKey: NavigationService.shellANavigatorKey,
              routes: <RouteBase>[
                customGoRoute(
                  path: RouteName.landingScreenRoute,
                  child: const HomeScreen(),
                  routes: <RouteBase>[],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                customGoRoute(
                  path: RouteName.profileRoute,
                  child: const ProfileScreen(),
                ),
              ],
            ),
            // StatefulShellBranch(
            //   routes: <RouteBase>[
            //     customGoRoute(
            //       path: RouteName.uiTemplateRoute,
            //       child: const UITemplateScreen(),
            //     ),
            //   ],
            // ),
          ],
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return BottomNavigationBarScaffold(
              navigationShell: navigationShell,
            );
          },
        ),
        ...authRouteList,
        customGoRoute(
          path: RouteName.imagePickerScreenRoute,
          child: const SizedBox(),
          pageBuilder: (BuildContext context, GoRouterState state) {
            return fadeTransition(
              context: context,
              state: state,
              child: ImagePickerScreen(
                imagePickerViewModel: state.extra as ImagePickerViewModel,
              ),
            );
          },
        ),
        customGoRoute(
          path: RouteName.cameraScreenRoute,
          child: const CameraScreen(),
        ),
        customGoRoute(
          path: RouteName.uploadImageScreenRoute,
          child: BlocProvider<UploadImageCubit>(
            create: (BuildContext ctx) => UploadImageCubit(),
            child: const UploadImageScreen(),
          ),
        ),
        customGoRoute(
          path: RouteName.libraryDetailScreen,
          child: const SizedBox(),
          pageBuilder: (BuildContext context, GoRouterState state) {
            return fadeTransition(
              context: context,
              state: state,
              child: BlocProvider<LibraryDetailByIdCubit>(
                create: (BuildContext ctx) => LibraryDetailByIdCubit(),
                child: LibraryDetailScreen(
                  imageRemarksModel: state.extra as ImageRemarksModel,
                ),
              ),
            );
          },
        ),
        customGoRoute(
          path: RouteName.imagePreviewScreenRoute,
          child: const SizedBox(),
          pageBuilder: (BuildContext context, GoRouterState state) {
            return fadeTransition(
              context: context,
              state: state,
              child: ImagePreviewScreen(
                attachmentList: state.extra != null
                    ? state.extra as List<AttachmentModel>
                    : <AttachmentModel>[],
              ),
            );
          },
        ),

        customGoRoute(
          path: RouteName.fingerPrintScreenRoute,
          child: const SizedBox(),
          pageBuilder: (BuildContext context, GoRouterState state) {
            return fadeTransition(
              context: context,
              state: state,
              child: const FingerPrintSetupScreen(),
            );
          },
        ),
        // customGoRoute(
        //   path: RouteName.imageLibraryScreenRoute,
        //   child: const SizedBox(),
        //   pageBuilder: (BuildContext context, GoRouterState state) {
        //     return fadeTransition(
        //       context: context,
        //       state: state,
        //       child: BlocProvider<ImageLibraryCubit>.value(
        //         value: getIt<ImageLibraryCubit>(),
        //         child: ImageLibraryScreen(
        //           imageLibArg: state.extra != null
        //               ? state.extra as ImageLibaryArgModel
        //               : ImageLibaryArgModel(),
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ],
      navigatorKey: NavigationService.navigatorKey,
      initialLocation: _getInitialLocation,
      observers: <NavigatorObserver>[
        SociairNavigatorObserver(),
      ],
    );

String get _getInitialLocation {
  // finger print auth added so login in every authentication with updated location
  return RouteName.loginScreenRoute;

  //SociairGlobalVarData.accessToken != null
  //     ? RouteName.landingScreenRoute
  //     :
}
