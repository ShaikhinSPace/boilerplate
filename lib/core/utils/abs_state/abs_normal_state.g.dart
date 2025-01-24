// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_normal_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsNormalStateImpl<T> _$$AbsNormalStateImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$AbsNormalStateImpl<T>(
      failure: FailureState.fromJson(json['failure'] as Map<String, dynamic>),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      absNormalStatus: $enumDecodeNullable(
              _$AbsNormalStatusEnumMap, json['absNormalStatus']) ??
          AbsNormalStatus.initial,
    );

Map<String, dynamic> _$$AbsNormalStateImplToJson<T>(
  _$AbsNormalStateImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'failure': instance.failure,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'absNormalStatus': _$AbsNormalStatusEnumMap[instance.absNormalStatus]!,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

const _$AbsNormalStatusEnumMap = {
  AbsNormalStatus.initial: 'initial',
  AbsNormalStatus.loading: 'loading',
  AbsNormalStatus.error: 'error',
  AbsNormalStatus.success: 'success',
};

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
