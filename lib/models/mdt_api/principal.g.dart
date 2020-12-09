// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return UserSettings()
    ..id = json['id'] as int
    ..flagAcceptPrivacyPolicy = json['flagAcceptPrivacyPolicy'] as bool
    ..id_mdt_Principal = json['id_mdt_Principal'] as int;
}

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flagAcceptPrivacyPolicy': instance.flagAcceptPrivacyPolicy,
      'id_mdt_Principal': instance.id_mdt_Principal,
    };

MdtApiPrincipal _$MdtApiPrincipalFromJson(Map<String, dynamic> json) {
  return MdtApiPrincipal()
    ..flagAdmin = json['flagAdmin'] as bool
    ..flagGetlog = json['flagGetlog'] as bool
    ..flagRouteExsits = json['flagRouteExsits'] as bool
    ..flagSuperVisor = json['flagSuperVisor'] as bool
    ..employee = json[r'id_Employee$'] == null
        ? null
        : Employee.fromJson(json[r'id_Employee$'] as Map<String, dynamic>)
    ..userSettings = json[r'id_UserSettings$'] == null
        ? null
        : UserSettings.fromJson(
            json[r'id_UserSettings$'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MdtApiPrincipalToJson(MdtApiPrincipal instance) =>
    <String, dynamic>{
      'flagAdmin': instance.flagAdmin,
      'flagGetlog': instance.flagGetlog,
      'flagRouteExsits': instance.flagRouteExsits,
      'flagSuperVisor': instance.flagSuperVisor,
      r'id_Employee$': instance.employee,
      r'id_UserSettings$': instance.userSettings,
    };
