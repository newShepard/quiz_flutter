import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable(createToJson: false)
class AuthData {
  bool enabled;
  AuthData({required this.enabled});

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
}
