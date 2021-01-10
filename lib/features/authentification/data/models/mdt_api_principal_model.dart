import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_flutter/models/mdt_api/employee.dart';

part 'mdt_api_principal_model.g.dart';

@JsonSerializable(createToJson: false)
class UserSettings {
  int id;
  bool flagAcceptPrivacyPolicy;
  int id_mdt_Principal;

  UserSettings(
    this.id,
    this.flagAcceptPrivacyPolicy,
    this.id_mdt_Principal,
  );

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}

@JsonSerializable(createToJson: false)
class MdtApiPrincipal {
  bool flagAdmin;
  bool flagGetlog;
  bool flagRouteExsits;
  bool flagSuperVisor;

  @JsonKey(name: 'id_Employee\$')
  Employee employee;

  @JsonKey(name: 'id_UserSettings\$')
  UserSettings userSettings;

  MdtApiPrincipal(
    this.flagAdmin,
    this.flagGetlog,
    this.flagRouteExsits,
    this.flagSuperVisor,
  );

  factory MdtApiPrincipal.fromJson(Map<String, dynamic> json) =>
      _$MdtApiPrincipalFromJson(json);
}
