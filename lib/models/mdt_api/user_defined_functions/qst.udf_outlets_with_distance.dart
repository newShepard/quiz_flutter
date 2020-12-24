import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_flutter/models/mdt_api/outlet.dart';
import 'package:quiz_flutter/models/mdt_api/outlet_last_visit.dart';

part 'qst.udf_outlets_with_distance.g.dart';

@JsonSerializable(createToJson: false)
class MdtApiOutletWithDistance {
  @JsonKey(nullable: true)
  num distance;

  @JsonKey(nullable: true)
  bool flagQuestionnairesEmpty;

  @JsonKey(nullable: true, name: 'id_Outlet\$')
  MdtApiOutlet outlet;

  @JsonKey(nullable: true, name: 'id_VisitLast\$')
  MdtApiOutletLastVisit lastVisit;

  MdtApiOutletWithDistance();

  factory MdtApiOutletWithDistance.fromJson(Map<String, dynamic> json) =>
      _$MdtApiOutletWithDistanceFromJson(json);
}
