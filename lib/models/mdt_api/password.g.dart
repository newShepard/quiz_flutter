// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckRegistrationResponse _$CheckRegistrationResponseFromJson(
    Map<String, dynamic> json) {
  return CheckRegistrationResponse(
    enabled: json['enabled'] as bool,
  );
}

Map<String, dynamic> _$ChangePasswordDataToJson(ChangePasswordData instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };

Map<String, dynamic> _$SetPasswordDataToJson(SetPasswordData instance) =>
    <String, dynamic>{
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'key': instance.key,
    };
