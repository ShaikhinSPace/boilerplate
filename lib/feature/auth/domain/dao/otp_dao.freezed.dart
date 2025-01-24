// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_dao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OTPDAO _$OTPDAOFromJson(Map<String, dynamic> json) {
  return _OTPDAO.fromJson(json);
}

/// @nodoc
mixin _$OTPDAO {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sent_to')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_no')
  String? get mobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_confirmation')
  String? get passwordConfirmation => throw _privateConstructorUsedError;

  /// Serializes this OTPDAO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OTPDAO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OTPDAOCopyWith<OTPDAO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTPDAOCopyWith<$Res> {
  factory $OTPDAOCopyWith(OTPDAO value, $Res Function(OTPDAO) then) =
      _$OTPDAOCopyWithImpl<$Res, OTPDAO>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'sent_to') String? message,
      @JsonKey(name: 'mobile_no') String? mobileNo,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'password_confirmation') String? passwordConfirmation});
}

/// @nodoc
class _$OTPDAOCopyWithImpl<$Res, $Val extends OTPDAO>
    implements $OTPDAOCopyWith<$Res> {
  _$OTPDAOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OTPDAO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? mobileNo = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OTPDAOImplCopyWith<$Res> implements $OTPDAOCopyWith<$Res> {
  factory _$$OTPDAOImplCopyWith(
          _$OTPDAOImpl value, $Res Function(_$OTPDAOImpl) then) =
      __$$OTPDAOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'sent_to') String? message,
      @JsonKey(name: 'mobile_no') String? mobileNo,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'password_confirmation') String? passwordConfirmation});
}

/// @nodoc
class __$$OTPDAOImplCopyWithImpl<$Res>
    extends _$OTPDAOCopyWithImpl<$Res, _$OTPDAOImpl>
    implements _$$OTPDAOImplCopyWith<$Res> {
  __$$OTPDAOImplCopyWithImpl(
      _$OTPDAOImpl _value, $Res Function(_$OTPDAOImpl) _then)
      : super(_value, _then);

  /// Create a copy of OTPDAO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? mobileNo = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
  }) {
    return _then(_$OTPDAOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OTPDAOImpl implements _OTPDAO {
  const _$OTPDAOImpl(
      {this.id,
      @JsonKey(name: 'sent_to') this.message,
      @JsonKey(name: 'mobile_no') this.mobileNo,
      @JsonKey(name: 'password') this.password,
      @JsonKey(name: 'password_confirmation') this.passwordConfirmation});

  factory _$OTPDAOImpl.fromJson(Map<String, dynamic> json) =>
      _$$OTPDAOImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'sent_to')
  final String? message;
  @override
  @JsonKey(name: 'mobile_no')
  final String? mobileNo;
  @override
  @JsonKey(name: 'password')
  final String? password;
  @override
  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;

  @override
  String toString() {
    return 'OTPDAO(id: $id, message: $message, mobileNo: $mobileNo, password: $password, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OTPDAOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, message, mobileNo, password, passwordConfirmation);

  /// Create a copy of OTPDAO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OTPDAOImplCopyWith<_$OTPDAOImpl> get copyWith =>
      __$$OTPDAOImplCopyWithImpl<_$OTPDAOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OTPDAOImplToJson(
      this,
    );
  }
}

abstract class _OTPDAO implements OTPDAO {
  const factory _OTPDAO(
      {final int? id,
      @JsonKey(name: 'sent_to') final String? message,
      @JsonKey(name: 'mobile_no') final String? mobileNo,
      @JsonKey(name: 'password') final String? password,
      @JsonKey(name: 'password_confirmation')
      final String? passwordConfirmation}) = _$OTPDAOImpl;

  factory _OTPDAO.fromJson(Map<String, dynamic> json) = _$OTPDAOImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'sent_to')
  String? get message;
  @override
  @JsonKey(name: 'mobile_no')
  String? get mobileNo;
  @override
  @JsonKey(name: 'password')
  String? get password;
  @override
  @JsonKey(name: 'password_confirmation')
  String? get passwordConfirmation;

  /// Create a copy of OTPDAO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OTPDAOImplCopyWith<_$OTPDAOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
