import 'package:freezed_annotation/freezed_annotation.dart';

part 'responsive_value_model.freezed.dart';

@freezed
class ResponsiveValueModel with _$ResponsiveValueModel {
  const factory ResponsiveValueModel({
    required double col2Value,
    required double col4Value,
    required double col6Value,
    required double col8Value,
    required double col10Value,
    required double col12Value,
  }) = _ResponsiveValueModel;
}
