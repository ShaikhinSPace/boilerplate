import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../feature/auth/domain/dao/otp_dao.dart';
import '../../../feature/auth/presentation/cubit/change_password_cubit.dart';
import '../../../feature/auth/presentation/cubit/forgot_password_cubit.dart';
import '../../../feature/auth/presentation/cubit/otp_verification_cubit.dart';
import '../../../feature/auth/presentation/cubit/register_cubit.dart';
import '../../../feature/auth/presentation/screens/change_password_screen.dart';
import '../../../feature/auth/presentation/screens/forgot_password_screen.dart';
import '../../../feature/auth/presentation/screens/login_screen.dart';
import '../../../feature/auth/presentation/screens/otp_verification_screen.dart';
import '../../../feature/auth/presentation/screens/profile_detail_screen.dart';
import '../../../feature/auth/presentation/screens/register_screen.dart';
import '../custom_go_route.dart';
import '../navigation_animation.dart';
import '../route_name.dart';

List<RouteBase> get authRouteList => <RouteBase>[
      customGoRoute(
        path: RouteName.loginScreenRoute,
        child: const SizedBox(),
        pageBuilder: (BuildContext context, GoRouterState state) {
          String? tenantId = state.extra != null && state.extra is String
              ? state.extra as String
              : null;
          return fadeTransition(
            context: context,
            state: state,
            child: const LoginScreen(),
          );
        },
      ),
      customGoRoute(
        path: RouteName.forgotPasswordScreenRoute,
        child: const SizedBox(),
        pageBuilder: (BuildContext context, GoRouterState state) {
          String? tenantId = state.extra != null && state.extra is String
              ? state.extra as String
              : null;

          return fadeTransition(
            context: context,
            state: state,
            child: BlocProvider<ForgotPasswordCubit>(
              create: (BuildContext ctx) => ForgotPasswordCubit(),

              child: ForgotPasswordScreen(
                tenantId: tenantId ?? '',
              ), //tenantId
            ),
          );
        },
      ),
      customGoRoute(
        path: RouteName.profileDetailScreenRoute,
        child: const ProfileDetailScreen(),
      ),
      customGoRoute(
        path: RouteName.changePasswordScreenRoute,
        child: BlocProvider<ChangePasswordCubit>(
          create: (BuildContext ctx) => ChangePasswordCubit(),
          child: const ChangePasswordScreen(),
        ),
      ),
      customGoRoute(
        child: const SizedBox(),
        path: RouteName.registerScreenRoute,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return fadeTransition(
            context: context,
            state: state,
            child: BlocProvider<RegisterCubit>(
              create: (BuildContext ctx) => RegisterCubit(),
              child: RegisterScreen(
                registerModel: state.extra != null
                    ? state.extra as RegistrationScreenArgModel
                    : null,
              ),
            ),
          );
        },
      ),
      customGoRoute(
        path: RouteName.otpVerificationScreenRoute,
        child: const SizedBox(),
        pageBuilder: (BuildContext context, GoRouterState state) {
          return fadeTransition(
            context: context,
            state: state,
            child: BlocProvider<OtpVerificationCubit>(
              create: (BuildContext ctx) => OtpVerificationCubit(),
              child: OTPVerificationScreen(
                otpDao: state.extra as OTPDAO,
              ),
            ),
          );
        },
      ),
    ];
