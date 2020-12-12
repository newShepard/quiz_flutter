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
  double? time;

  FetchDebug({this.sql, this.time});

  factory FetchDebug.fromJson(Map<String, dynamic> json) =>
      _$FetchDebugFromJson(json);
}

@JsonSerializable(createToJson: false)
class FetchResult<T> {
  bool? custom;
  FetchDebug? debug;
  int? count;
  //@JsonKey(fromJson: _dataFromJson)
  List<dynamic> rows;

  FetchResult({this.custom, this.debug, this.count, required this.rows});

  factory FetchResult.fromJson(Map<String, dynamic> json) =>
      _$FetchResultFromJson(json);
}

@JsonSerializable(createToJson: false)
class PreparedFetchResult<T> {
  //@JsonKey(fromJson: _dataFromJson)
  List<dynamic> records;
  int count;

  PreparedFetchResult({required this.records, required this.count});

  factory PreparedFetchResult.fromJson(Map<String, dynamic> json) =>
      _$PreparedFetchResultFromJson(json);
}

//T _dataFromJson<T>(List<dynamic> json) => json as T;
