// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    count: json['count'] as int,
    object: json['object'],
    group: (json['group'] as List)
        ?.map(
            (e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    value: json['value'] as String,
  );
}

FetchResult<T> _$FetchResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return FetchResult<T>(
    records: _dataFromJson(json['records'] as Map<String, dynamic>),
    count: json['count'] as int,
  )..groups = (json['groups'] as List)
      ?.map((e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>))
      ?.toList();
}
