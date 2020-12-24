// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_last_visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdtApiOutletLastVisit _$MdtApiOutletLastVisitFromJson(
    Map<String, dynamic> json) {
  return MdtApiOutletLastVisit()
    ..dateBegin = json['dateBegin'] == null
        ? null
        : DateTime.parse(json['dateBegin'] as String)
    ..dateEnd = json['dateEnd'] == null
        ? null
        : DateTime.parse(json['dateEnd'] as String)
    ..dateSubmitLocal = json['dateSubmitLocal'] == null
        ? null
        : DateTime.parse(json['dateSubmitLocal'] as String)
    ..employee = json[r'id_em_Employee$'] == null
        ? null
        : Employee.fromJson(json[r'id_em_Employee$'] as Map<String, dynamic>);
}
