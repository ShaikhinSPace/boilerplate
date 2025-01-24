import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network_service/network/failure_state.dart';

import '../../enums/sociair_enums.dart';

part 'abs_pagination_state.freezed.dart';

part 'abs_pagination_state.g.dart';

@Freezed(genericArgumentFactories: true)
class AbsPaginationState<T> with _$AbsPaginationState<T> {
  @JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
  const AbsPaginationState._();

  factory AbsPaginationState({
    @JsonKey(fromJson: FailureState.fromJson) FailureState? failure,
    T? data,
    @Default(AbsNormalStatus.initial) AbsNormalStatus absNormalStatus,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(0) int totalRecord,
  }) = _AbsPaginationState<T>;

  factory AbsPaginationState.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$AbsPaginationStateFromJson(json, fromJsonT);
}

AbsPaginationState<T> initialPaginationState<T>() =>
    AbsPaginationState<T>().copyWith(absNormalStatus: AbsNormalStatus.initial);

AbsPaginationState<T> refreshPaginationState<T>(T? data) =>
    AbsPaginationState<T>().copyWith(
      absNormalStatus: AbsNormalStatus.loading,
      data: data,
    );

AbsPaginationState<T> loadingPaginationState<T>(T? data) =>
    AbsPaginationState<T>()
        .copyWith(absNormalStatus: AbsNormalStatus.loading, data: data);
