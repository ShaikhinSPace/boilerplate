import 'package:record_keeping/core/typedef/sociair_type_def.dart';

abstract class LibraryRepo {
  FutureDynamicFailure getLibraryList({
    int pageNo = 1,
    bool isToRefresh = false,
  });

  FutureDynamicFailure getLibraryDetailById({
    required String libraryId,
  });
}
