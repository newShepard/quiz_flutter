import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_flutter/models/mdt_api/employee.dart';
import '../common.dart';

part 'principal.g.dart';

@JsonSerializable(createToJson: false)
class UserSettings with Recordable {
  bool flagAcceptPrivacyPolicy;
  int id_mdt_Principal;

  UserSettings();

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}

abstract class AbstractMdtApiPrincipal {
  bool flagAdmin;
  bool flagGetlog;
  bool flagRouteExsits;
  bool flagSuperVisor;

  @JsonKey(name: 'id_Employee\$', nullable: true)
  Employee employee;

  @JsonKey(name: 'id_UserSettings\$', nullable: true)
  UserSettings userSettings;
}

@JsonSerializable(createToJson: false)
class MdtApiPrincipal with AbstractMdtApiPrincipal {
  MdtApiPrincipal();

  factory MdtApiPrincipal.fromJson(Map<String, dynamic> json) =>
      _$MdtApiPrincipalFromJson(json);
}
