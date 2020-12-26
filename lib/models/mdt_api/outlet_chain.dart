import 'package:quiz_flutter/models/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'outlet_chain.g.dart';

@JsonSerializable(createToJson: false)
class OutletChain with IRecord, IName {
  String type;
  String nameShort;
  OutletChainParent parent;

  OutletChain();

  factory OutletChain.fromJson(Map<String, dynamic> json) =>
      _$OutletChainFromJson(json);
}

@JsonSerializable(createToJson: false)
class OutletChainParent {
  String name;
  String nameShort;

  OutletChainParent();

  factory OutletChainParent.fromJson(Map<String, dynamic> json) =>
      _$OutletChainParentFromJson(json);
}
