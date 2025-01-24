// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PasswordModel _$PasswordModelFromJson(Map<String, dynamic> json) {
  return _PasswordModel.fromJson(json);
}

/// @nodoc
mixin _$PasswordModel {
  @JsonKey(name: 'current_password')
  String? get currentPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String? get newPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_confirmation')
  String? get confirmPassword => throw _privateConstructorUsedError;

  /// Serializes this PasswordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordModelCopyWith<PasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordModelCopyWith<$Res> {
  factory $PasswordModelCopyWith(
          PasswordModel value, $Res Function(PasswordModel) then) =
      _$PasswordModelCopyWithImpl<$Res, PasswordModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_password') String? currentPassword,
      @JsonKey(name: 'password') String? newPassword,
      @JsonKey(name: 'password_confirmation') String? confirmPassword});
}

/// @nodoc
class _$PasswordModelCopyWithImpl<$Res, $Val extends PasswordModel>
    implements $PasswordModelCopyWith<$Res> {
  _$PasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = freezed,
    Object? newPassword = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(_value.copyWith(
      currentPassword: freezed == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordModelImplCopyWith<$Res>
    implements $PasswordModelCopyWith<$Res> {
  factory _$$PasswordModelImplCopyWith(
          _$PasswordModelImpl value, $Res Function(_$PasswordModelImpl) then) =
      __$$PasswordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_password') String? currentPassword,
      @JsonKey(name: 'password') String? newPassword,
      @JsonKey(name: 'password_confirmation') String? confirmPassword});
}

/// @nodoc
class __$$PasswordModelImplCopyWithImpl<$Res>
    extends _$PasswordModelCopyWithImpl<$Res, _$PasswordModelImpl>
    implements _$$PasswordModelImplCopyWith<$Res> {
  __$$PasswordModelImplCopyWithImpl(
      _$PasswordModelImpl _value, $Res Function(_$PasswordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = freezed,
    Object? newPassword = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(_$PasswordModelImpl(
      currentPassword: freezed == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PasswordModelImpl implements _PasswordModel {
  const _$PasswordModelImpl(
      {@JsonKey(name: 'current_password') this.currentPassword,
      @JsonKey(name: 'password') this.newPassword,
      @JsonKey(name: 'password_confirmation') this.confirmPassword});

  factory _$PasswordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordModelImplFromJson(json);

  @override
  @JsonKey(name: 'current_password')
  final String? currentPassword;
  @override
  @JsonKey(name: 'password')
  final String? newPassword;
  @override
  @JsonKey(name: 'password_confirmation')
  final String? confirmPassword;

  @override
  String toString() {
    return 'PasswordModel(currentPassword: $currentPassword, newPassword: $newPassword, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordModelImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPassword, newPassword, confirmPassword);

  /// Create a copy of PasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordModelImplCopyWith<_$PasswordModelImpl> get copyWith =>
      __$$PasswordModelImplCopyWithImpl<_$PasswordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordModelImplToJson(
      this,
    );
  }
}

abstract class _PasswordModel implements PasswordModel {
  const factory _PasswordModel(
      {@JsonKey(name: 'current_password') final String? currentPassword,
      @JsonKey(name: 'password') final String? newPassword,
      @JsonKey(name: 'password_confirmation')
      final String? confirmPassword}) = _$PasswordModelImpl;

  factory _PasswordModel.fromJson(Map<String, dynamic> json) =
      _$PasswordModelImpl.fromJson;

  @override
  @JsonKey(name: 'current_password')
  String? get currentPassword;
  @override
  @JsonKey(name: 'password')
  String? get newPassword;
  @override
  @JsonKey(name: 'password_confirmation')
  String? get confirmPassword;

  /// Create a copy of PasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordModelImplCopyWith<_$PasswordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
