import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_model.freezed.dart';

part 'password_model.g.dart';

@freezed
class PasswordModel with _$PasswordModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory PasswordModel({
    @JsonKey(name: 'current_password') String? currentPassword,
    @JsonKey(name: 'password') String? newPassword,
    @JsonKey(name: 'password_confirmation') String? confirmPassword,
  }) = _PasswordModel;

  factory PasswordModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordModelFromJson(json);
}
