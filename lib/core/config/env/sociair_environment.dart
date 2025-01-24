import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../enums/sociair_enums.dart';

abstract class AbsSociairEnvironment {
  final String appName;
  final EnvEnum sociairEnvEnum;
  final String envFileName;

  AbsSociairEnvironment({
    required this.appName,
    required this.sociairEnvEnum,
    required this.envFileName,
  });
}

interface class IGetSociairEnvData {
  String get baseUrl => dotenv.get('BASE_URL');
  String get amiBaseUrl => dotenv.get('AMI_BASE_URL');
  String get sipSocketUrl => dotenv.get('SIP_WEBSOCKET_URL');
  String get sipBaseUrl => dotenv.get('SIP_BASE_URL');
}

class SociairProdEnvironment extends IGetSociairEnvData
    implements AbsSociairEnvironment {
  @override
  String get appName => 'Sociair';

  @override
  String get envFileName => '.env';

  @override
  EnvEnum get sociairEnvEnum => EnvEnum.prod;
}

class SociairDevEnvironment extends IGetSociairEnvData
    implements AbsSociairEnvironment {
  @override
  String get appName => 'Dev Sociair';

  @override
  String get envFileName => '.env.dev';

  @override
  EnvEnum get sociairEnvEnum => EnvEnum.dev;
}
