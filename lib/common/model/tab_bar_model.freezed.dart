// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_bar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TabBarModel {
  String get title => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  String get slugStatusCode => throw _privateConstructorUsedError;
  String? get count => throw _privateConstructorUsedError;
  String? get svgActiveIcon => throw _privateConstructorUsedError;
  String? get svgInactiveIcon => throw _privateConstructorUsedError;

  /// Create a copy of TabBarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TabBarModelCopyWith<TabBarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabBarModelCopyWith<$Res> {
  factory $TabBarModelCopyWith(
          TabBarModel value, $Res Function(TabBarModel) then) =
      _$TabBarModelCopyWithImpl<$Res, TabBarModel>;
  @useResult
  $Res call(
      {String title,
      String slug,
      int rank,
      String slugStatusCode,
      String? count,
      String? svgActiveIcon,
      String? svgInactiveIcon});
}

/// @nodoc
class _$TabBarModelCopyWithImpl<$Res, $Val extends TabBarModel>
    implements $TabBarModelCopyWith<$Res> {
  _$TabBarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TabBarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? slug = null,
    Object? rank = null,
    Object? slugStatusCode = null,
    Object? count = freezed,
    Object? svgActiveIcon = freezed,
    Object? svgInactiveIcon = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      slugStatusCode: null == slugStatusCode
          ? _value.slugStatusCode
          : slugStatusCode // ignore: cast_nullable_to_non_nullable
              as String,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String?,
      svgActiveIcon: freezed == svgActiveIcon
          ? _value.svgActiveIcon
          : svgActiveIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      svgInactiveIcon: freezed == svgInactiveIcon
          ? _value.svgInactiveIcon
          : svgInactiveIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabBarModelImplCopyWith<$Res>
    implements $TabBarModelCopyWith<$Res> {
  factory _$$TabBarModelImplCopyWith(
          _$TabBarModelImpl value, $Res Function(_$TabBarModelImpl) then) =
      __$$TabBarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String slug,
      int rank,
      String slugStatusCode,
      String? count,
      String? svgActiveIcon,
      String? svgInactiveIcon});
}

/// @nodoc
class __$$TabBarModelImplCopyWithImpl<$Res>
    extends _$TabBarModelCopyWithImpl<$Res, _$TabBarModelImpl>
    implements _$$TabBarModelImplCopyWith<$Res> {
  __$$TabBarModelImplCopyWithImpl(
      _$TabBarModelImpl _value, $Res Function(_$TabBarModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TabBarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? slug = null,
    Object? rank = null,
    Object? slugStatusCode = null,
    Object? count = freezed,
    Object? svgActiveIcon = freezed,
    Object? svgInactiveIcon = freezed,
  }) {
    return _then(_$TabBarModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      slugStatusCode: null == slugStatusCode
          ? _value.slugStatusCode
          : slugStatusCode // ignore: cast_nullable_to_non_nullable
              as String,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String?,
      svgActiveIcon: freezed == svgActiveIcon
          ? _value.svgActiveIcon
          : svgActiveIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      svgInactiveIcon: freezed == svgInactiveIcon
          ? _value.svgInactiveIcon
          : svgInactiveIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TabBarModelImpl implements _TabBarModel {
  _$TabBarModelImpl(
      {required this.title,
      required this.slug,
      required this.rank,
      required this.slugStatusCode,
      this.count,
      this.svgActiveIcon,
      this.svgInactiveIcon});

  @override
  final String title;
  @override
  final String slug;
  @override
  final int rank;
  @override
  final String slugStatusCode;
  @override
  final String? count;
  @override
  final String? svgActiveIcon;
  @override
  final String? svgInactiveIcon;

  @override
  String toString() {
    return 'TabBarModel(title: $title, slug: $slug, rank: $rank, slugStatusCode: $slugStatusCode, count: $count, svgActiveIcon: $svgActiveIcon, svgInactiveIcon: $svgInactiveIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabBarModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.slugStatusCode, slugStatusCode) ||
                other.slugStatusCode == slugStatusCode) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.svgActiveIcon, svgActiveIcon) ||
                other.svgActiveIcon == svgActiveIcon) &&
            (identical(other.svgInactiveIcon, svgInactiveIcon) ||
                other.svgInactiveIcon == svgInactiveIcon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, slug, rank,
      slugStatusCode, count, svgActiveIcon, svgInactiveIcon);

  /// Create a copy of TabBarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TabBarModelImplCopyWith<_$TabBarModelImpl> get copyWith =>
      __$$TabBarModelImplCopyWithImpl<_$TabBarModelImpl>(this, _$identity);
}

abstract class _TabBarModel implements TabBarModel {
  factory _TabBarModel(
      {required final String title,
      required final String slug,
      required final int rank,
      required final String slugStatusCode,
      final String? count,
      final String? svgActiveIcon,
      final String? svgInactiveIcon}) = _$TabBarModelImpl;

  @override
  String get title;
  @override
  String get slug;
  @override
  int get rank;
  @override
  String get slugStatusCode;
  @override
  String? get count;
  @override
  String? get svgActiveIcon;
  @override
  String? get svgInactiveIcon;

  /// Create a copy of TabBarModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TabBarModelImplCopyWith<_$TabBarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
