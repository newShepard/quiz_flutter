import 'package:quiz_flutter/models/common.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_flutter/models/mdt_api/legal_entity.dart';
import 'package:quiz_flutter/models/mdt_api/outlet_chain.dart';
import 'package:quiz_flutter/models/mdt_api/outlet_type.dart';
import 'package:quiz_flutter/models/mdt_api/position.dart';

part 'outlet.g.dart';

@JsonSerializable(createToJson: false)
class MdtApiOutlet with Recordable, Nameable {
  @JsonKey(nullable: true)
  String code;

  @JsonKey(nullable: true)
  String address;

  @JsonKey(nullable: true)
  String phone;

  @JsonKey(nullable: true)
  MdtApiOutletType type;

  @JsonKey(nullable: true)
  LegalEntity legalEntity;

  @JsonKey(nullable: true)
  OutletChain outletChain;

  @JsonKey(nullable: true)
  List<MdtApiPosition> positions;

  MdtApiOutlet();

  factory MdtApiOutlet.fromJson(Map<String, dynamic> json) =>
      _$MdtApiOutletFromJson(json);
}
