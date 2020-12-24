// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qst.udf_outlets_with_distance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdtApiOutletWithDistance _$MdtApiOutletWithDistanceFromJson(
    Map<String, dynamic> json) {
  return MdtApiOutletWithDistance()
    ..distance = json['distance'] as num
    ..flagQuestionnairesEmpty = json['flagQuestionnairesEmpty'] as bool
    ..outlet = json[r'id_Outlet$'] == null
        ? null
        : MdtApiOutlet.fromJson(json[r'id_Outlet$'] as Map<String, dynamic>)
    ..lastVisit = json[r'id_VisitLast$'] == null
        ? null
        : MdtApiOutletLastVisit.fromJson(
            json[r'id_VisitLast$'] as Map<String, dynamic>);
}
