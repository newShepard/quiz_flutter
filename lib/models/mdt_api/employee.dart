import 'package:json_annotation/json_annotation.dart';
import '../common.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee with IRecord, IName {
  String code;
  Employee();

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
