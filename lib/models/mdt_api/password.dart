import 'package:json_annotation/json_annotation.dart';

part 'password.g.dart';

@JsonSerializable(createFactory: false)
class ChangePasswordData {
  final String oldPassword;
  final String newPassword;

  ChangePasswordData({required this.oldPassword, required this.newPassword});

  Map<String, dynamic> toJson() => _$ChangePasswordDataToJson(this);
}

@JsonSerializable(createFactory: false)
class SetPasswordData {
  final String password;
  final String confirmPassword;
  final String key;

  SetPasswordData(
      {required this.password,
      required this.confirmPassword,
      required this.key});

  Map<String, dynamic> toJson() => _$SetPasswordDataToJson(this);
}
