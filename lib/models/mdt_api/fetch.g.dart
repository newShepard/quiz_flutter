// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch.dart';

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

FetchDebug _$FetchDebugFromJson(Map<String, dynamic> json) {
  return FetchDebug(
    sql: json['sql'] as String,
    time: json['time'] as double,
  );
}

FetchResult<T> _$FetchResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return FetchResult<T>(
    custom: json['custom'] as bool,
    debug: json['debug'] == null
        ? null
        : FetchDebug.fromJson(json['debug'] as Map<String, dynamic>),
    count: json['count'] as int,
    rows: _dataFromJson(json['rows'] as List<T>),
  );
}

PreparedFetchResult<T> _$PreparedFetchResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return PreparedFetchResult<T>(
    records: _dataFromJson(json['records'] as List<T>),
    count: json['count'] as int,
  );
}
