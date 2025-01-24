import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:record_keeping/core/network/api_request.dart';

import '../../../initial_screen.dart';
import '../../enums/sociair_enums.dart';
import '../../global_data/sociair_global_var_data.dart';
import '../di/di_injectable.dart';
import '../env/sociair_environment.dart';

interface class ISociairEntryPoint {
  Future<void> runSociairApp({
    required EnvEnum sociairEnvEnum,
  }) async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    configureDependencies();
    SociairGlobalVarData.updateCurrentSociairEnvEnum(sociairEnvEnum);
    await _loadEnvFileData(sociairEnvEnum: sociairEnvEnum);
    await _initializeFirebaseService(sociairEnvEnum: sociairEnvEnum);

    initializeNetworkService();
    await Future<void>.delayed(const Duration(milliseconds: 400));
    FlutterNativeSplash.remove();
    runApp(
      InitialScreen(
        appTitle: _getAppTitleByEnv(sociairEnvEnum: sociairEnvEnum),
      ),
    );
  }

  String _getAppTitleByEnv({
    required EnvEnum sociairEnvEnum,
  }) {
    return sociairEnvEnum == EnvEnum.dev
        ? SociairDevEnvironment().appName
        : SociairProdEnvironment().appName;
  }

  Future<void> _loadEnvFileData({
    required EnvEnum sociairEnvEnum,
  }) async {
    await dotenv.load(
      fileName: sociairEnvEnum == EnvEnum.dev
          ? SociairDevEnvironment().envFileName
          : SociairProdEnvironment().envFileName,
    );
  }

  Future<void> _initializeFirebaseService({
    required EnvEnum sociairEnvEnum,
  }) async {
    // await Firebase.initializeApp( );
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }
}

class SociairEntryPoint extends ISociairEntryPoint {
  final EnvEnum sociairEnvEnum;

  SociairEntryPoint({required this.sociairEnvEnum}) {
    runSociairApp(sociairEnvEnum: sociairEnvEnum);
  }
}
