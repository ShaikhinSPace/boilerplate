// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PasswordModelImpl _$$PasswordModelImplFromJson(Map<String, dynamic> json) =>
    _$PasswordModelImpl(
      currentPassword: json['current_password'] as String?,
      newPassword: json['password'] as String?,
      confirmPassword: json['password_confirmation'] as String?,
    );

Map<String, dynamic> _$$PasswordModelImplToJson(_$PasswordModelImpl instance) =>
    <String, dynamic>{
      'current_password': instance.currentPassword,
      'password': instance.newPassword,
      'password_confirmation': instance.confirmPassword,
    };
