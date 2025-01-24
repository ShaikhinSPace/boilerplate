import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user_dto.freezed.dart';

part 'register_user_dto.g.dart';

@freezed
class RegisterUserDTO with _$RegisterUserDTO {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory RegisterUserDTO({
    String? email,
    @JsonKey(name: 'name') String? name,
    String? username,
    @JsonKey(name: 'mobile_number') String? mobileNo,
  }) = _RegisterUserDTO;

  factory RegisterUserDTO.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserDTOFromJson(json);
}
