import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_bar_model.freezed.dart';

@freezed
class TabBarModel with _$TabBarModel {
  factory TabBarModel({
    required String title,
    required String slug,
    required int rank,
    required String slugStatusCode,
    String? count,
    String? svgActiveIcon,
    String? svgInactiveIcon,
  }) = _TabBarModel;
}
