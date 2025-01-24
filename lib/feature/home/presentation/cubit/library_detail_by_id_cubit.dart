import 'package:dio/src/response.dart';
import 'package:network_service/network/failure_state.dart';
import 'package:record_keeping/core/utils/abs_state/abs_normal_state.dart';
import 'package:record_keeping/core/utils/base/base_bloc.dart';
import 'package:record_keeping/feature/home/domain/repo/library_repo.dart';

import '../../../../core/config/di/di_injectable.dart';
import '../../domain/dao/image_remarks_model.dart';

class LibraryDetailByIdCubit
    extends BaseCubit<AbsNormalState<ImageRemarksModel?>> {
  LibraryDetailByIdCubit() : super(initialState<ImageRemarksModel?>());

  void resetState() => emit(initialState<ImageRemarksModel?>());

  void getLibraryDetailById({required String libraryId}) async {
    emit(refreshState(null));
    AbsNormalState<ImageRemarksModel?> updatedState = await callApiForMap(
      absNormalState: state,
      apiCall: () =>
          getIt<LibraryRepo>().getLibraryDetailById(libraryId: libraryId),
      fromJson: ImageRemarksModel.fromJson,
      onSuccess: (Response<dynamic>? l) {},
      onFailure: (FailureState r) {},
    );
    emit(updatedState);
  }
}
