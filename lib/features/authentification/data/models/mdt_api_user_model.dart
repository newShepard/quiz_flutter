import 'package:json_annotation/json_annotation.dart';

part 'mdt_api_user_model.g.dart';

@JsonSerializable(createToJson: false)
class MdtApiUserSettings {
  @JsonKey(ignore: true)
  String table = 'qst.UserSettings';

  num $id;
  bool flagAcceptPrivacyPolicy;
  num id_mdt_Principal;

  MdtApiUserSettings({
    this.$id,
    this.flagAcceptPrivacyPolicy,
    this.id_mdt_Principal,
  });

  factory MdtApiUserSettings.fromJson(Map<String, dynamic> json) =>
      _$MdtApiUserSettingsFromJson(json);
}

@JsonSerializable(createToJson: false)
class MdtApiUser {
  int id;
  String fullName;
  String email;
  String identityName;
  bool isAdmin;
  bool isAnonymous;
  List<String> roles;
  int languageId;
  bool isImpersonated;

  MdtApiUser({
    this.id,
    this.fullName,
    this.email,
    this.identityName,
    this.isAdmin,
    this.isAnonymous,
    this.roles,
    this.languageId,
    this.isImpersonated,
  });

  factory MdtApiUser.fromJson(Map<String, dynamic> json) =>
      _$MdtApiUserFromJson(json);
}
