import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_flutter/models/mdt_api/employee.dart';

part 'outlet_last_visit.g.dart';

@JsonSerializable(createToJson: false)
class MdtApiOutletLastVisit {
  DateTime dateBegin;
  DateTime dateEnd;
  DateTime dateSubmitLocal;

  @JsonKey(name: 'id_em_Employee\$')
  Employee employee;

  MdtApiOutletLastVisit();

  factory MdtApiOutletLastVisit.fromJson(Map<String, dynamic> json) =>
      _$MdtApiOutletLastVisitFromJson(json);
}
