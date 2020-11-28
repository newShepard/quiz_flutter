import 'package:json_annotation/json_annotation.dart';

part 'password_api_response.g.dart';

@JsonSerializable(createToJson: false)
class CheckRegistrationResponse {
  bool enabled;
  CheckRegistrationResponse({this.enabled});

  factory CheckRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckRegistrationResponseFromJson(json);
}
