// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abs_normal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AbsNormalState<T> _$AbsNormalStateFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _AbsNormalState<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$AbsNormalState<T> {
  @JsonKey(fromJson: FailureState.fromJson)
  FailureState? get failure => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  AbsNormalStatus get absNormalStatus => throw _privateConstructorUsedError;

  /// Serializes this AbsNormalState to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AbsNormalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbsNormalStateCopyWith<T, AbsNormalState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsNormalStateCopyWith<T, $Res> {
  factory $AbsNormalStateCopyWith(
          AbsNormalState<T> value, $Res Function(AbsNormalState<T>) then) =
      _$AbsNormalStateCopyWithImpl<T, $Res, AbsNormalState<T>>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: FailureState.fromJson) FailureState? failure,
      T? data,
      AbsNormalStatus absNormalStatus});
}

/// @nodoc
class _$AbsNormalStateCopyWithImpl<T, $Res, $Val extends AbsNormalState<T>>
    implements $AbsNormalStateCopyWith<T, $Res> {
  _$AbsNormalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbsNormalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
    Object? data = freezed,
    Object? absNormalStatus = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsNormalStateImplCopyWith<T, $Res>
    implements $AbsNormalStateCopyWith<T, $Res> {
  factory _$$AbsNormalStateImplCopyWith(_$AbsNormalStateImpl<T> value,
          $Res Function(_$AbsNormalStateImpl<T>) then) =
      __$$AbsNormalStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: FailureState.fromJson) FailureState? failure,
      T? data,
      AbsNormalStatus absNormalStatus});
}

/// @nodoc
class __$$AbsNormalStateImplCopyWithImpl<T, $Res>
    extends _$AbsNormalStateCopyWithImpl<T, $Res, _$AbsNormalStateImpl<T>>
    implements _$$AbsNormalStateImplCopyWith<T, $Res> {
  __$$AbsNormalStateImplCopyWithImpl(_$AbsNormalStateImpl<T> _value,
      $Res Function(_$AbsNormalStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AbsNormalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
    Object? data = freezed,
    Object? absNormalStatus = null,
  }) {
    return _then(_$AbsNormalStateImpl<T>(
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
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$AbsNormalStateImpl<T> extends _AbsNormalState<T> {
  _$AbsNormalStateImpl(
      {@JsonKey(fromJson: FailureState.fromJson) this.failure,
      this.data,
      this.absNormalStatus = AbsNormalStatus.initial})
      : super._();

  factory _$AbsNormalStateImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$AbsNormalStateImplFromJson(json, fromJsonT);

  @override
  @JsonKey(fromJson: FailureState.fromJson)
  final FailureState? failure;
  @override
  final T? data;
  @override
  @JsonKey()
  final AbsNormalStatus absNormalStatus;

  @override
  String toString() {
    return 'AbsNormalState<$T>(failure: $failure, data: $data, absNormalStatus: $absNormalStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsNormalStateImpl<T> &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.absNormalStatus, absNormalStatus) ||
                other.absNormalStatus == absNormalStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, failure,
      const DeepCollectionEquality().hash(data), absNormalStatus);

  /// Create a copy of AbsNormalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsNormalStateImplCopyWith<T, _$AbsNormalStateImpl<T>> get copyWith =>
      __$$AbsNormalStateImplCopyWithImpl<T, _$AbsNormalStateImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$AbsNormalStateImplToJson<T>(this, toJsonT);
  }
}

abstract class _AbsNormalState<T> extends AbsNormalState<T> {
  factory _AbsNormalState(
      {@JsonKey(fromJson: FailureState.fromJson) final FailureState? failure,
      final T? data,
      final AbsNormalStatus absNormalStatus}) = _$AbsNormalStateImpl<T>;
  _AbsNormalState._() : super._();

  factory _AbsNormalState.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$AbsNormalStateImpl<T>.fromJson;

  @override
  @JsonKey(fromJson: FailureState.fromJson)
  FailureState? get failure;
  @override
  T? get data;
  @override
  AbsNormalStatus get absNormalStatus;

  /// Create a copy of AbsNormalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbsNormalStateImplCopyWith<T, _$AbsNormalStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
