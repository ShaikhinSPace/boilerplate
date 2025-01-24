// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_pagination_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsPaginationStateImpl<T> _$$AbsPaginationStateImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$AbsPaginationStateImpl<T>(
      failure: FailureState.fromJson(json['failure'] as Map<String, dynamic>),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      absNormalStatus: $enumDecodeNullable(
              _$AbsNormalStatusEnumMap, json['absNormalStatus']) ??
          AbsNormalStatus.initial,
      currentPage: json['currentPage'] as int? ?? 1,
      lastPage: json['lastPage'] as int? ?? 1,
      totalRecord: json['totalRecord'] as int? ?? 0,
    );

Map<String, dynamic> _$$AbsPaginationStateImplToJson<T>(
  _$AbsPaginationStateImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'failure': instance.failure,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'absNormalStatus': _$AbsNormalStatusEnumMap[instance.absNormalStatus]!,
      'currentPage': instance.currentPage,
      'lastPage': instance.lastPage,
      'totalRecord': instance.totalRecord,
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
