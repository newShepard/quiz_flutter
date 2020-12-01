import 'package:json_annotation/json_annotation.dart';

part 'mdt_api_error_data.g.dart';

@JsonSerializable(createToJson: false)
class TargetSite {
  @JsonKey(name: "Name")
  String? name;

  @JsonKey(name: "AssemblyName")
  String? assemblyName;

  @JsonKey(name: "ClassName")
  String? className;

  @JsonKey(name: "GenericArguments")
  String? genericArgumens;

  @JsonKey(name: "MemberType")
  num? memberType;

  @JsonKey(name: "Signature")
  String? signature;

  @JsonKey(name: "Signature2")
  String? signature2;

  TargetSite(
      {this.name,
      this.assemblyName,
      this.className,
      this.genericArgumens,
      this.memberType,
      this.signature,
      this.signature2});

  factory TargetSite.fromJson(Map<String, dynamic> json) =>
      _$TargetSiteFromJson(json);
}

@JsonSerializable(createToJson: false)
class Debug {
  @JsonKey(name: "Data")
  dynamic? data;

  @JsonKey(name: "HResult")
  num? hResult;

  @JsonKey(name: "Message")
  String? message;

  @JsonKey(name: "Source")
  String? source;

  @JsonKey(name: "StackTrace")
  String? stackTrace;

  @JsonKey(name: "TargetSite")
  TargetSite? targetSite;

  Debug(
      {this.data,
      this.hResult,
      this.message,
      this.source,
      this.stackTrace,
      this.targetSite});

  factory Debug.fromJson(Map<String, dynamic> json) => _$DebugFromJson(json);
}

@JsonSerializable(createToJson: false)
class MdtApiErrorData {
  @JsonKey(name: "Args")
  dynamic? args;

  @JsonKey(name: "Code")
  String? code;

  @JsonKey(name: "Debug")
  Debug? debug;

  @JsonKey(name: "Message")
  String? message;

  MdtApiErrorData({this.args, this.code, this.debug, this.message});

  factory MdtApiErrorData.fromJson(Map<String, dynamic> json) =>
      _$MdtApiErrorDataFromJson(json);
}
