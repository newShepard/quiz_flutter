import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class MdtApiUserSettings {
  String? table = 'qst.UserSettings';
  num? $id;
  bool? flagAcceptPrivacyPolicy;
  num? id_mdt_Principal;
  MdtApiUserSettings(
      {this.$id, this.flagAcceptPrivacyPolicy, this.id_mdt_Principal});

  factory MdtApiUserSettings.fromJson(Map<String, dynamic> json) =>
      _$MdtApiUserSettingsFromJson(json);
}

abstract class AbstractMdtApiUser {
  int? id;
  String? fullName;
  String? email;
  String? identityName;
  bool? isAdmin;
  bool? isAnonymous;
  List<String>? roles;
  int? languageId;
  bool? isImpersonated;
}

@JsonSerializable()
class MdtApiUser with AbstractMdtApiUser {
  MdtApiUser();

  factory MdtApiUser.fromJson(Map<String, dynamic> json) =>
      _$MdtApiUserFromJson(json);
}

@JsonSerializable(createFactory: false)
class UserRegistrationData {
  final String code;
  final String email;
  String? title;

  UserRegistrationData({required this.code, required this.email, this.title});

  Map<String, dynamic> toJson() => _$UserRegisrationDataToJson(this);
}
