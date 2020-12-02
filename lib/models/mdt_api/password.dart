import 'package:json_annotation/json_annotation.dart';

part 'password.g.dart';

@JsonSerializable(createToJson: false)
class CheckRegistrationResponse {
  bool enabled;
  CheckRegistrationResponse({required this.enabled});

  factory CheckRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckRegistrationResponseFromJson(json);
}
