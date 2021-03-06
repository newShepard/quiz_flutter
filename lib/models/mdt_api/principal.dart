import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_flutter/models/mdt_api/employee.dart';
import '../common.dart';

part 'principal.g.dart';

@JsonSerializable(createToJson: false)
class UserSettings with IRecord {
  bool flagAcceptPrivacyPolicy;
  int id_mdt_Principal;

  UserSettings();

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}

abstract class IMdtApiPrincipal {
  bool flagAdmin;
  bool flagGetlog;
  bool flagRouteExsits;
  bool flagSuperVisor;

  @JsonKey(name: 'id_Employee\$')
  Employee employee;

  @JsonKey(name: 'id_UserSettings\$')
  UserSettings userSettings;
}

@JsonSerializable(createToJson: false)
class MdtApiPrincipal with IMdtApiPrincipal {
  MdtApiPrincipal();

  factory MdtApiPrincipal.fromJson(Map<String, dynamic> json) =>
      _$MdtApiPrincipalFromJson(json);
}
