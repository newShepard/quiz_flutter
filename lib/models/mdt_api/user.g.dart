// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdtApiUserSettings _$MdtApiUserSettingsFromJson(Map<String, dynamic> json) {
  return MdtApiUserSettings(
    $id: json[r'$id'] as num,
    flagAcceptPrivacyPolicy: json['flagAcceptPrivacyPolicy'] as bool,
    id_mdt_Principal: json['id_mdt_Principal'] as num,
  )..table = json['table'] as String;
}

Map<String, dynamic> _$MdtApiUserSettingsToJson(MdtApiUserSettings instance) =>
    <String, dynamic>{
      'table': instance.table,
      r'$id': instance.$id,
      'flagAcceptPrivacyPolicy': instance.flagAcceptPrivacyPolicy,
      'id_mdt_Principal': instance.id_mdt_Principal,
    };

MdtApiUser _$MdtApiUserFromJson(Map<String, dynamic> json) {
  return MdtApiUser()
    ..id = json['id'] as int
    ..fullName = json['fullName'] as String
    ..email = json['email'] as String
    ..identityName = json['identityName'] as String
    ..isAdmin = json['isAdmin'] as bool
    ..isAnonymous = json['isAnonymous'] as bool
    ..roles = (json['roles'] as List)?.map((e) => e as String)?.toList()
    ..languageId = json['languageId'] as int
    ..isImpersonated = json['isImpersonated'] as bool;
}

Map<String, dynamic> _$MdtApiUserToJson(MdtApiUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'identityName': instance.identityName,
      'isAdmin': instance.isAdmin,
      'isAnonymous': instance.isAnonymous,
      'roles': instance.roles,
      'languageId': instance.languageId,
      'isImpersonated': instance.isImpersonated,
    };

Map<String, dynamic> _$UserRegistrationDataToJson(
        UserRegistrationData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'email': instance.email,
      'title': instance.title,
    };
