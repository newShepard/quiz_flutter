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
    ..type = json[r'id_OutletType$'] == null
        ? null
        : MdtApiOutletType.fromJson(
            json[r'id_OutletType$'] as Map<String, dynamic>)
    ..legalEntity = json['legalEntity'] == null
        ? null
        : LegalEntity.fromJson(json['legalEntity'] as Map<String, dynamic>)
    ..outletChain = json[r'id_OutletChain$'] == null
        ? null
        : OutletChain.fromJson(json[r'id_OutletChain$'] as Map<String, dynamic>)
    ..positions = (json['positions'] as List)
        ?.map((e) => e == null
            ? null
            : MdtApiPosition.fromJson(e as Map<String, dynamic>))
        ?.toList();
}
