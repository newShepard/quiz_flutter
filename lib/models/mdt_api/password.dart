import 'package:json_annotation/json_annotation.dart';

part 'password.g.dart';

@JsonSerializable(createToJson: false)
class CheckRegistrationResponse {
  bool enabled;
  CheckRegistrationResponse({required this.enabled});

  factory CheckRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckRegistrationResponseFromJson(json);
}

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
