// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_dao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OTPDAOImpl _$$OTPDAOImplFromJson(Map<String, dynamic> json) => _$OTPDAOImpl(
      id: json['id'] as int?,
      message: json['sent_to'] as String?,
      mobileNo: json['mobile_no'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
    );

Map<String, dynamic> _$$OTPDAOImplToJson(_$OTPDAOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sent_to': instance.message,
      'mobile_no': instance.mobileNo,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
