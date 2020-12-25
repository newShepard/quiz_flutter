import 'package:quiz_flutter/models/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'outlet_type.g.dart';

@JsonSerializable(createToJson: false)
class MdtApiOutletType with IRecord, IName {
  String code;
  String icon;
  String uid_ds;

  MdtApiOutletType();

  factory MdtApiOutletType.fromJson(Map<String, dynamic> json) =>
      _$MdtApiOutletTypeFromJson(json);
}
