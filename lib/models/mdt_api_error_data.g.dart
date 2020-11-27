// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mdt_api_error_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TargetSite _$TargetSiteFromJson(Map<String, dynamic> json) {
  return TargetSite(
    name: json['Name'] as String,
    assemblyName: json['AssemblyName'] as String,
    className: json['ClassName'] as String,
    genericArgumens: json['GenericArguments'] as String,
    memberType: json['MemberType'] as num,
    signature: json['Signature'] as String,
    signature2: json['Signature2'] as String,
  );
}

Debug _$DebugFromJson(Map<String, dynamic> json) {
  return Debug(
    data: json['Data'],
    hResult: json['HResult'] as num,
    message: json['Message'] as String,
    source: json['Source'] as String,
    stackTrace: json['StackTrace'] as String,
    targetSite: json['TargetSite'] == null
        ? null
        : TargetSite.fromJson(json['TargetSite'] as Map<String, dynamic>),
  );
}

MdtApiErrorData _$MdtApiErrorDataFromJson(Map<String, dynamic> json) {
  return MdtApiErrorData(
    args: json['Args'],
    code: json['Code'] as String,
    debug: json['Debug'] == null
        ? null
        : Debug.fromJson(json['Debug'] as Map<String, dynamic>),
    message: json['Message'] as String,
  );
}
