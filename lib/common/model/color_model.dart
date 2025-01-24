import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_model.freezed.dart';

@freezed
class ColorModel with _$ColorModel {
  factory ColorModel({
    required Color lightModeColor,
    required Color darkModeColor,
  }) = _ColorModel;
}
