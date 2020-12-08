import 'package:json_annotation/json_annotation.dart';

part 'fetch.g.dart';

@JsonSerializable(createToJson: false)
class Group {
  int count;
  dynamic? object;
  List<Group?>? group;
  String? value;

  Group({required this.count, this.object, this.group, this.value});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@JsonSerializable(createToJson: false)
class FetchDebug {
  String? sql;
  int? time;

  FetchDebug({this.sql, this.time});

  factory FetchDebug.fromJson(Map<String, dynamic> json) =>
      _$FetchDebugFromJson(json);
}
// @JsonSerializable(createToJson: false)
// class Items {

// }

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class FetchResult<T> {
  bool? custom;
  FetchDebug? debug;
  //items?
  int? count;
  @JsonKey(fromJson: _dataFromJson)
  List<T>? rows;

  FetchResult({this.custom, this.debug, this.count, this.rows});
}

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class PreparedFetchResult<T> {
  @JsonKey(fromJson: _dataFromJson)
  List<T> records;
  int count;
  List<Group?>? groups;

  PreparedFetchResult({required this.records, required this.count});

  factory PreparedFetchResult.fromJson(Map<String, dynamic> json) =>
      _$PreparedFetchResultFromJson(json, (json) => json as T);
}

T _dataFromJson<T>(Map<String, dynamic> json) => json as T;
