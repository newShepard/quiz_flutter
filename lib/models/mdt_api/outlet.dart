import 'package:quiz_flutter/models/common.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_flutter/models/mdt_api/legal_entity.dart';
import 'package:quiz_flutter/models/mdt_api/outlet_chain.dart';
import 'package:quiz_flutter/models/mdt_api/outlet_type.dart';
import 'package:quiz_flutter/models/mdt_api/position.dart';

part 'outlet.g.dart';

@JsonSerializable(createToJson: false)
class MdtApiOutlet with IRecord, IName {
  String code;
  String address;
  String phone;

  @JsonKey(name: 'id_OutletType\$')
  MdtApiOutletType type;

  LegalEntity legalEntity;

  @JsonKey(name: 'id_OutletChain\$')
  OutletChain outletChain;

  List<MdtApiPosition> positions;

  MdtApiOutlet();

  factory MdtApiOutlet.fromJson(Map<String, dynamic> json) =>
      _$MdtApiOutletFromJson(json);
}
