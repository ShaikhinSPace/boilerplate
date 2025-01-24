// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterUserDTO _$RegisterUserDTOFromJson(Map<String, dynamic> json) {
  return _RegisterUserDTO.fromJson(json);
}

/// @nodoc
mixin _$RegisterUserDTO {
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_number')
  String? get mobileNo => throw _privateConstructorUsedError;

  /// Serializes this RegisterUserDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterUserDTOCopyWith<RegisterUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserDTOCopyWith<$Res> {
  factory $RegisterUserDTOCopyWith(
          RegisterUserDTO value, $Res Function(RegisterUserDTO) then) =
      _$RegisterUserDTOCopyWithImpl<$Res, RegisterUserDTO>;
  @useResult
  $Res call(
      {String? email,
      @JsonKey(name: 'name') String? name,
      String? username,
      @JsonKey(name: 'mobile_number') String? mobileNo});
}

/// @nodoc
class _$RegisterUserDTOCopyWithImpl<$Res, $Val extends RegisterUserDTO>
    implements $RegisterUserDTOCopyWith<$Res> {
  _$RegisterUserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? mobileNo = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterUserDTOImplCopyWith<$Res>
    implements $RegisterUserDTOCopyWith<$Res> {
  factory _$$RegisterUserDTOImplCopyWith(_$RegisterUserDTOImpl value,
          $Res Function(_$RegisterUserDTOImpl) then) =
      __$$RegisterUserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      @JsonKey(name: 'name') String? name,
      String? username,
      @JsonKey(name: 'mobile_number') String? mobileNo});
}

/// @nodoc
class __$$RegisterUserDTOImplCopyWithImpl<$Res>
    extends _$RegisterUserDTOCopyWithImpl<$Res, _$RegisterUserDTOImpl>
    implements _$$RegisterUserDTOImplCopyWith<$Res> {
  __$$RegisterUserDTOImplCopyWithImpl(
      _$RegisterUserDTOImpl _value, $Res Function(_$RegisterUserDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? mobileNo = freezed,
  }) {
    return _then(_$RegisterUserDTOImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RegisterUserDTOImpl implements _RegisterUserDTO {
  const _$RegisterUserDTOImpl(
      {this.email,
      @JsonKey(name: 'name') this.name,
      this.username,
      @JsonKey(name: 'mobile_number') this.mobileNo});

  factory _$RegisterUserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterUserDTOImplFromJson(json);

  @override
  final String? email;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  final String? username;
  @override
  @JsonKey(name: 'mobile_number')
  final String? mobileNo;

  @override
  String toString() {
    return 'RegisterUserDTO(email: $email, name: $name, username: $username, mobileNo: $mobileNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserDTOImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, name, username, mobileNo);

  /// Create a copy of RegisterUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserDTOImplCopyWith<_$RegisterUserDTOImpl> get copyWith =>
      __$$RegisterUserDTOImplCopyWithImpl<_$RegisterUserDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterUserDTOImplToJson(
      this,
    );
  }
}

abstract class _RegisterUserDTO implements RegisterUserDTO {
  const factory _RegisterUserDTO(
          {final String? email,
          @JsonKey(name: 'name') final String? name,
          final String? username,
          @JsonKey(name: 'mobile_number') final String? mobileNo}) =
      _$RegisterUserDTOImpl;

  factory _RegisterUserDTO.fromJson(Map<String, dynamic> json) =
      _$RegisterUserDTOImpl.fromJson;

  @override
  String? get email;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  String? get username;
  @override
  @JsonKey(name: 'mobile_number')
  String? get mobileNo;

  /// Create a copy of RegisterUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterUserDTOImplCopyWith<_$RegisterUserDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
