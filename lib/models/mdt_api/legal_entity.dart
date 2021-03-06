import 'package:quiz_flutter/models/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'legal_entity.g.dart';

@JsonSerializable(createToJson: false)
class LegalEntity with IRecord, IName {
  String tin;

  LegalEntity();

  factory LegalEntity.fromJson(Map<String, dynamic> json) =>
      _$LegalEntityFromJson(json);
}
