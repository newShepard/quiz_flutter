// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdtApiPosition _$MdtApiPositionFromJson(Map<String, dynamic> json) {
  return MdtApiPosition()
    ..bindingFunction = json[r'id_BindingFunction$'] == null
        ? null
        : MdtApiBindingFunction.fromJson(
            json[r'id_BindingFunction$'] as Map<String, dynamic>)
    ..employee = json[r'id_Employee$'] == null
        ? null
        : Employee.fromJson(json[r'id_Employee$'] as Map<String, dynamic>)
    ..postlevel = json['postlevel'] as int;
}

MdtApiBindingFunction _$MdtApiBindingFunctionFromJson(
    Map<String, dynamic> json) {
  return MdtApiBindingFunction()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..code = json['code'] as String;
}
