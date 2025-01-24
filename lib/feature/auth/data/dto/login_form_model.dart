import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_model.freezed.dart';

part 'login_form_model.g.dart';

@freezed
class LoginFormModel with _$LoginFormModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory LoginFormModel({
    required String username,
    String? password,
    String? tenantId,
  }) = _LoginFormModel;

  factory LoginFormModel.fromJson(Map<String, dynamic> json) =>
      _$LoginFormModelFromJson(json);
}
