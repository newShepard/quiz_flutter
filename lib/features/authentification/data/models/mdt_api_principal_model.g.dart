// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mdt_api_principal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return UserSettings(
    json['id'] as int,
    json['flagAcceptPrivacyPolicy'] as bool,
    json['id_mdt_Principal'] as int,
  );
}

MdtApiPrincipal _$MdtApiPrincipalFromJson(Map<String, dynamic> json) {
  return MdtApiPrincipal(
    json['flagAdmin'] as bool,
    json['flagGetlog'] as bool,
    json['flagRouteExsits'] as bool,
    json['flagSuperVisor'] as bool,
  )
    ..employee = json[r'id_Employee$'] == null
        ? null
        : Employee.fromJson(json[r'id_Employee$'] as Map<String, dynamic>)
    ..userSettings = json[r'id_UserSettings$'] == null
        ? null
        : UserSettings.fromJson(
            json[r'id_UserSettings$'] as Map<String, dynamic>);
}
