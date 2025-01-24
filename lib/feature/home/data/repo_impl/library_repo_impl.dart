import 'package:injectable/injectable.dart';
import 'package:network_service/export.dart';
import 'package:record_keeping/core/network/base_api_request.dart';
import 'package:record_keeping/core/typedef/sociair_type_def.dart';
import 'package:record_keeping/feature/home/domain/repo/library_repo.dart';

import '../../../../core/config/di/di_injectable.dart';

interface class LibraryEndpoint {
  String getLibraryDetailByIdRoute = '/records/{id}';
  String getLibraryListRoute = '/records';
}

@LazySingleton(as: LibraryRepo)
class LibraryRepoImpl implements LibraryRepo {
  LibraryEndpoint get _libraryEndpoint => LibraryEndpoint();

  @override
  FutureDynamicFailure getLibraryDetailById({
    required String libraryId,
  }) async {
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _libraryEndpoint.getLibraryDetailByIdRoute.replaceAll(
        '{id}',
        libraryId,
      ),
      apiMethods: ApiMethods.get,
      isToCache: false,
    );
  }

  @override
  FutureDynamicFailure getLibraryList({
    int pageNo = 1,
    bool isToRefresh = false,
  }) async {
    return getIt<BaseApiRequest>().getResponse(
      endPoint: _libraryEndpoint.getLibraryListRoute,
      queryParams: <String, dynamic>{
        'page': pageNo,
      },
      apiMethods: ApiMethods.get,
      isToCache: false,
      isToRefresh: isToRefresh,
    );
  }
}
