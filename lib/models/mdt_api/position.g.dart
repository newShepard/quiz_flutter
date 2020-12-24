// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdtApiPosition _$MdtApiPositionFromJson(Map<String, dynamic> json) {
  return MdtApiPosition()
    ..employee = json['employee'] == null
        ? null
        : Employee.fromJson(json['employee'] as Map<String, dynamic>)
    ..postlevel = json['postlevel'] as int
    ..bindingFunction = json['bindingFunction'] == null
        ? null
        : MdtApiBindingFunction.fromJson(
            json['bindingFunction'] as Map<String, dynamic>);
}

MdtApiBindingFunction _$MdtApiBindingFunctionFromJson(
    Map<String, dynamic> json) {
  return MdtApiBindingFunction()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..code = json['code'] as String;
}
