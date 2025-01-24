// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterUserDTOImpl _$$RegisterUserDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterUserDTOImpl(
      email: json['email'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      mobileNo: json['mobile_number'] as String?,
    );

Map<String, dynamic> _$$RegisterUserDTOImplToJson(
        _$RegisterUserDTOImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'username': instance.username,
      'mobile_number': instance.mobileNo,
    };
