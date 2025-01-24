// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abs_pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AbsPaginationState<T> _$AbsPaginationStateFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _AbsPaginationState<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$AbsPaginationState<T> {
  @JsonKey(fromJson: FailureState.fromJson)
  FailureState? get failure => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  AbsNormalStatus get absNormalStatus => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  int get totalRecord => throw _privateConstructorUsedError;

  /// Serializes this AbsPaginationState to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AbsPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbsPaginationStateCopyWith<T, AbsPaginationState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsPaginationStateCopyWith<T, $Res> {
  factory $AbsPaginationStateCopyWith(AbsPaginationState<T> value,
          $Res Function(AbsPaginationState<T>) then) =
      _$AbsPaginationStateCopyWithImpl<T, $Res, AbsPaginationState<T>>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: FailureState.fromJson) FailureState? failure,
      T? data,
      AbsNormalStatus absNormalStatus,
      int currentPage,
      int lastPage,
      int totalRecord});
}

/// @nodoc
class _$AbsPaginationStateCopyWithImpl<T, $Res,
        $Val extends AbsPaginationState<T>>
    implements $AbsPaginationStateCopyWith<T, $Res> {
  _$AbsPaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbsPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
    Object? data = freezed,
    Object? absNormalStatus = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? totalRecord = null,
  }) {
    return _then(_value.copyWith(
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as FailureState?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      absNormalStatus: null == absNormalStatus
          ? _value.absNormalStatus
          : absNormalStatus // ignore: cast_nullable_to_non_nullable
              as AbsNormalStatus,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalRecord: null == totalRecord
          ? _value.totalRecord
          : totalRecord // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsPaginationStateImplCopyWith<T, $Res>
    implements $AbsPaginationStateCopyWith<T, $Res> {
  factory _$$AbsPaginationStateImplCopyWith(_$AbsPaginationStateImpl<T> value,
          $Res Function(_$AbsPaginationStateImpl<T>) then) =
      __$$AbsPaginationStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: FailureState.fromJson) FailureState? failure,
      T? data,
      AbsNormalStatus absNormalStatus,
      int currentPage,
      int lastPage,
      int totalRecord});
}

/// @nodoc
class __$$AbsPaginationStateImplCopyWithImpl<T, $Res>
    extends _$AbsPaginationStateCopyWithImpl<T, $Res,
        _$AbsPaginationStateImpl<T>>
    implements _$$AbsPaginationStateImplCopyWith<T, $Res> {
  __$$AbsPaginationStateImplCopyWithImpl(_$AbsPaginationStateImpl<T> _value,
      $Res Function(_$AbsPaginationStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AbsPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
    Object? data = freezed,
    Object? absNormalStatus = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? totalRecord = null,
  }) {
    return _then(_$AbsPaginationStateImpl<T>(
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as FailureState?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      absNormalStatus: null == absNormalStatus
          ? _value.absNormalStatus
          : absNormalStatus // ignore: cast_nullable_to_non_nullable
              as AbsNormalStatus,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalRecord: null == totalRecord
          ? _value.totalRecord
          : totalRecord // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$AbsPaginationStateImpl<T> extends _AbsPaginationState<T> {
  _$AbsPaginationStateImpl(
      {@JsonKey(fromJson: FailureState.fromJson) this.failure,
      this.data,
      this.absNormalStatus = AbsNormalStatus.initial,
      this.currentPage = 1,
      this.lastPage = 1,
      this.totalRecord = 0})
      : super._();

  factory _$AbsPaginationStateImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$AbsPaginationStateImplFromJson(json, fromJsonT);

  @override
  @JsonKey(fromJson: FailureState.fromJson)
  final FailureState? failure;
  @override
  final T? data;
  @override
  @JsonKey()
  final AbsNormalStatus absNormalStatus;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int lastPage;
  @override
  @JsonKey()
  final int totalRecord;

  @override
  String toString() {
    return 'AbsPaginationState<$T>(failure: $failure, data: $data, absNormalStatus: $absNormalStatus, currentPage: $currentPage, lastPage: $lastPage, totalRecord: $totalRecord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsPaginationStateImpl<T> &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.absNormalStatus, absNormalStatus) ||
                other.absNormalStatus == absNormalStatus) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.totalRecord, totalRecord) ||
                other.totalRecord == totalRecord));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      failure,
      const DeepCollectionEquality().hash(data),
      absNormalStatus,
      currentPage,
      lastPage,
      totalRecord);

  /// Create a copy of AbsPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsPaginationStateImplCopyWith<T, _$AbsPaginationStateImpl<T>>
      get copyWith => __$$AbsPaginationStateImplCopyWithImpl<T,
          _$AbsPaginationStateImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$AbsPaginationStateImplToJson<T>(this, toJsonT);
  }
}

abstract class _AbsPaginationState<T> extends AbsPaginationState<T> {
  factory _AbsPaginationState(
      {@JsonKey(fromJson: FailureState.fromJson) final FailureState? failure,
      final T? data,
      final AbsNormalStatus absNormalStatus,
      final int currentPage,
      final int lastPage,
      final int totalRecord}) = _$AbsPaginationStateImpl<T>;
  _AbsPaginationState._() : super._();

  factory _AbsPaginationState.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$AbsPaginationStateImpl<T>.fromJson;

  @override
  @JsonKey(fromJson: FailureState.fromJson)
  FailureState? get failure;
  @override
  T? get data;
  @override
  AbsNormalStatus get absNormalStatus;
  @override
  int get currentPage;
  @override
  int get lastPage;
  @override
  int get totalRecord;

  /// Create a copy of AbsPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbsPaginationStateImplCopyWith<T, _$AbsPaginationStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
