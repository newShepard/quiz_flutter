import 'package:quiz_flutter/models/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'outlet_chain.g.dart';

@JsonSerializable(createToJson: false)
class OutletChain with Recordable, Nameable {
  @JsonKey(nullable: true)
  String type;

  @JsonKey(nullable: true)
  String nameShort;

  @JsonKey(nullable: true)
  OutletChainParent parent;

  OutletChain();

  factory OutletChain.fromJson(Map<String, dynamic> json) =>
      _$OutletChainFromJson(json);
}

@JsonSerializable(createToJson: false)
class OutletChainParent {
  @JsonKey(nullable: true)
  String name;

  @JsonKey(nullable: true)
  String nameShort;

  OutletChainParent();

  factory OutletChainParent.fromJson(Map<String, dynamic> json) =>
      _$OutletChainParentFromJson(json);
}
