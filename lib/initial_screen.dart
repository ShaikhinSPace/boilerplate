import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/config/env/sociair_environment.dart';
import 'core/enums/sociair_enums.dart';
import 'core/global_data/global_bloc_listener.dart';
import 'core/global_data/global_bloc_providers.dart';
import 'core/global_data/sociair_global_var_data.dart';
import 'core/localization/language_cubit.dart';
import 'core/localization/localization_service.dart';
import 'core/network/internet/internet_connection_widget.dart';
import 'core/routing/route_config.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';

final GlobalKey<OverlayState> overlayKey = GlobalKey<OverlayState>();

class InitialScreen extends StatefulWidget {
  final String appTitle;

  const InitialScreen({
    super.key,
    required this.appTitle,
  });

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: GlobalBlocProvider().globalBlocProvider,
      child: MultiBlocListener(
        listeners: GlobalBlocListener().globalBlocListener,
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (BuildContext ctx, bool isLightTheme) {
            return BlocBuilder<LanguageCubit, bool>(
              builder: (BuildContext bCtx, bool isEnglish) {
                return Material(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ScreenUtilInit(
                            designSize: const Size(360, 690),
                            minTextAdapt: true,
                            splitScreenMode: true,
                            builder: (_, Widget? child) {
                              return MaterialApp.router(
                                title: SociairGlobalVarData
                                            .currentSociairEnvEnum ==
                                        EnvEnum.prod
                                    ? SociairProdEnvironment().appName
                                    : SociairDevEnvironment().appName,
                                routerConfig: router,
                                theme: appThemeData[AppTheme.lightTheme],
                                darkTheme: appThemeData[AppTheme.darkTheme],
                                debugShowCheckedModeBanner: false,
                                themeMode: isLightTheme
                                    ? ThemeMode.light
                                    : ThemeMode.dark,
                                supportedLocales:
                                    LocalizationService().supportedLocales,
                                localizationsDelegates: LocalizationService()
                                    .localizationsDelegates,
                                locale: LocalizationService()
                                    .getCurrentLocales(isEnglish),
                                builder: (BuildContext context, Widget? child) {
                                  if (child != null) {
                                    return ResponsiveBreakpoints.builder(
                                      child: Overlay(
                                        initialEntries: <OverlayEntry>[
                                          OverlayEntry(
                                            builder: (_) {
                                              return child;
                                            },
                                          ),
                                        ],
                                      ),
                                      breakpoints: <Breakpoint>[
                                        const Breakpoint(
                                          start: 0,
                                          end: 400,
                                          name: 'col2',
                                        ),
                                        const Breakpoint(
                                          start: 401,
                                          end: 600,
                                          name: 'col4',
                                        ),
                                        const Breakpoint(
                                          start: 601,
                                          end: 800,
                                          name: 'col6',
                                        ),
                                        const Breakpoint(
                                          start: 801,
                                          end: 1000,
                                          name: 'col8',
                                        ),
                                        const Breakpoint(
                                          start: 1001,
                                          end: 1200,
                                          name: 'col10',
                                        ),
                                        const Breakpoint(
                                          start: 1201,
                                          end: double.infinity,
                                          name: 'col12',
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              );
                            },
                          ),
                        ),
                        const NoInternetConnectionWidget(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
