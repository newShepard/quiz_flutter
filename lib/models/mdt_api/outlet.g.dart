// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdtApiOutlet _$MdtApiOutletFromJson(Map<String, dynamic> json) {
  return MdtApiOutlet()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..code = json['code'] as String
    ..address = json['address'] as String
    ..phone = json['phone'] as String
    ..type = json['type'] == null
        ? null
        : MdtApiOutletType.fromJson(json['type'] as Map<String, dynamic>)
    ..legalEntity = json['legalEntity'] == null
        ? null
        : LegalEntity.fromJson(json['legalEntity'] as Map<String, dynamic>)
    ..outletChain = json['outletChain'] == null
        ? null
        : OutletChain.fromJson(json['outletChain'] as Map<String, dynamic>)
    ..positions = (json['positions'] as List)
        ?.map((e) => e == null
            ? null
            : MdtApiPosition.fromJson(e as Map<String, dynamic>))
        ?.toList();
}
