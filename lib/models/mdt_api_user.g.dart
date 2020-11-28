// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mdt_api_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdtApiUser _$MdtApiUserFromJson(Map<String, dynamic> json) {
  return MdtApiUser(
    id: json['id'] as int,
    fullName: json['fullName'] as String,
    email: json['email'] as String,
    identityName: json['identityName'] as String,
    isAdmin: json['isAdmin'] as bool,
    isAnonymous: json['isAnonymous'] as bool,
    roles: (json['roles'] as List)?.map((e) => e as String)?.toList(),
    languageId: json['languageId'] as int,
    isImpersonated: json['isImpersonated'] as bool,
  );
}
