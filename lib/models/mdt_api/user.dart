import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class MdtApiUser {
  int? id;
  String? fullName;
  String? email;
  String? identityName;
  bool? isAdmin;
  bool? isAnonymous;
  List<String?>? roles;
  int? languageId;
  bool? isImpersonated;

  MdtApiUser(
      {this.id,
      this.fullName,
      this.email,
      this.identityName,
      this.isAdmin,
      this.isAnonymous,
      this.roles,
      this.languageId,
      this.isImpersonated});
}
