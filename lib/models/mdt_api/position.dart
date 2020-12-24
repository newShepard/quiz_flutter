import 'package:quiz_flutter/models/common.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_flutter/models/mdt_api/employee.dart';

part 'position.g.dart';

@JsonSerializable(createToJson: false)
class MdtApiPosition {
  @JsonKey(nullable: true, name: 'id_BindingFunction\$')
  MdtApiBindingFunction bindingFunction;

  @JsonKey(nullable: true, name: 'id_Employee\$')
  Employee employee;

  @JsonKey(nullable: true)
  int postlevel;

  MdtApiPosition();

  factory MdtApiPosition.fromJson(Map<String, dynamic> json) =>
      _$MdtApiPositionFromJson(json);
}

@JsonSerializable(createToJson: false)
class MdtApiBindingFunction with Recordable, Nameable {
  @JsonKey(nullable: true)
  String code;

  MdtApiBindingFunction();

  factory MdtApiBindingFunction.fromJson(Map<String, dynamic> json) =>
      _$MdtApiBindingFunctionFromJson(json);
}
