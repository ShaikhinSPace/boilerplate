// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ColorModel {
  Color get lightModeColor => throw _privateConstructorUsedError;
  Color get darkModeColor => throw _privateConstructorUsedError;

  /// Create a copy of ColorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorModelCopyWith<ColorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorModelCopyWith<$Res> {
  factory $ColorModelCopyWith(
          ColorModel value, $Res Function(ColorModel) then) =
      _$ColorModelCopyWithImpl<$Res, ColorModel>;
  @useResult
  $Res call({Color lightModeColor, Color darkModeColor});
}

/// @nodoc
class _$ColorModelCopyWithImpl<$Res, $Val extends ColorModel>
    implements $ColorModelCopyWith<$Res> {
  _$ColorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightModeColor = null,
    Object? darkModeColor = null,
  }) {
    return _then(_value.copyWith(
      lightModeColor: null == lightModeColor
          ? _value.lightModeColor
          : lightModeColor // ignore: cast_nullable_to_non_nullable
              as Color,
      darkModeColor: null == darkModeColor
          ? _value.darkModeColor
          : darkModeColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorModelImplCopyWith<$Res>
    implements $ColorModelCopyWith<$Res> {
  factory _$$ColorModelImplCopyWith(
          _$ColorModelImpl value, $Res Function(_$ColorModelImpl) then) =
      __$$ColorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color lightModeColor, Color darkModeColor});
}

/// @nodoc
class __$$ColorModelImplCopyWithImpl<$Res>
    extends _$ColorModelCopyWithImpl<$Res, _$ColorModelImpl>
    implements _$$ColorModelImplCopyWith<$Res> {
  __$$ColorModelImplCopyWithImpl(
      _$ColorModelImpl _value, $Res Function(_$ColorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightModeColor = null,
    Object? darkModeColor = null,
  }) {
    return _then(_$ColorModelImpl(
      lightModeColor: null == lightModeColor
          ? _value.lightModeColor
          : lightModeColor // ignore: cast_nullable_to_non_nullable
              as Color,
      darkModeColor: null == darkModeColor
          ? _value.darkModeColor
          : darkModeColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$ColorModelImpl implements _ColorModel {
  _$ColorModelImpl({required this.lightModeColor, required this.darkModeColor});

  @override
  final Color lightModeColor;
  @override
  final Color darkModeColor;

  @override
  String toString() {
    return 'ColorModel(lightModeColor: $lightModeColor, darkModeColor: $darkModeColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorModelImpl &&
            (identical(other.lightModeColor, lightModeColor) ||
                other.lightModeColor == lightModeColor) &&
            (identical(other.darkModeColor, darkModeColor) ||
                other.darkModeColor == darkModeColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lightModeColor, darkModeColor);

  /// Create a copy of ColorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorModelImplCopyWith<_$ColorModelImpl> get copyWith =>
      __$$ColorModelImplCopyWithImpl<_$ColorModelImpl>(this, _$identity);
}

abstract class _ColorModel implements ColorModel {
  factory _ColorModel(
      {required final Color lightModeColor,
      required final Color darkModeColor}) = _$ColorModelImpl;

  @override
  Color get lightModeColor;
  @override
  Color get darkModeColor;

  /// Create a copy of ColorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorModelImplCopyWith<_$ColorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
