import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_dao.freezed.dart';

part 'otp_dao.g.dart';

@freezed
class OTPDAO with _$OTPDAO {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory OTPDAO({
    int? id,
    @JsonKey(name: 'sent_to') String? message,
    @JsonKey(name: 'mobile_no') String? mobileNo,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'password_confirmation') String? passwordConfirmation,
  }) = _OTPDAO;

  factory OTPDAO.fromJson(Map<String, dynamic> json) => _$OTPDAOFromJson(json);
}
