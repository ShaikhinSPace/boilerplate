import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network_service/network/failure_state.dart';

import '../../enums/sociair_enums.dart';

part 'abs_normal_state.freezed.dart';

part 'abs_normal_state.g.dart';

@Freezed(genericArgumentFactories: true)
class AbsNormalState<T> with _$AbsNormalState<T> {
  @JsonSerializable(
    genericArgumentFactories: true,
    explicitToJson: true,
  )
  const AbsNormalState._();

  factory AbsNormalState({
    @JsonKey(fromJson: FailureState.fromJson) FailureState? failure,
    T? data,
    @Default(AbsNormalStatus.initial) AbsNormalStatus absNormalStatus,
  }) = _AbsNormalState<T>;

  factory AbsNormalState.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$AbsNormalStateFromJson(json, fromJsonT);
}

AbsNormalState<T> initialState<T>() => AbsNormalState<T>().copyWith(
      absNormalStatus: AbsNormalStatus.initial,
    );

AbsNormalState<T> refreshState<T>(T? data) => AbsNormalState<T>()
    .copyWith(absNormalStatus: AbsNormalStatus.loading, data: data);

AbsNormalState<T> loadingState<T>(T? data) => AbsNormalState<T>()
    .copyWith(absNormalStatus: AbsNormalStatus.loading, data: data);
