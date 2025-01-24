import 'package:network_service/export.dart';
import 'package:network_service/network/interface/api_request.dart';
import 'package:record_keeping/core/global_data/sociair_global_var_data.dart';
import 'package:record_keeping/core/network/base_api_request.dart';

import '../config/di/di_injectable.dart';
import '../config/env/sociair_environment.dart';
import '../enums/sociair_enums.dart';

ApiRequest get apiRequest => getIt<BaseApiRequest>();

void initializeNetworkService() {
  NetworkService.configureNetworkService(
    baseURL: SociairGlobalVarData.currentSociairEnvEnum == EnvEnum.dev
        ? SociairDevEnvironment().baseUrl
        : SociairProdEnvironment().baseUrl,
  );
}
