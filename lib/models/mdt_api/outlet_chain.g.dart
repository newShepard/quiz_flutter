// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutletChain _$OutletChainFromJson(Map<String, dynamic> json) {
  return OutletChain()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..nameShort = json['nameShort'] as String
    ..parent = json['parent'] == null
        ? null
        : OutletChainParent.fromJson(json['parent'] as Map<String, dynamic>);
}

OutletChainParent _$OutletChainParentFromJson(Map<String, dynamic> json) {
  return OutletChainParent()
    ..name = json['name'] as String
    ..nameShort = json['nameShort'] as String;
}
