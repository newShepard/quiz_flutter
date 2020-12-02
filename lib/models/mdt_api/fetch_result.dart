import 'package:json_annotation/json_annotation.dart';

part 'fetch_result.g.dart';

@JsonSerializable(createToJson: false)
class Group {
  int count;
  dynamic? object;
  List<Group?>? group;
  String? value;

  Group({required this.count, this.object, this.group, this.value});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class FetchResult<T> {
  @JsonKey(fromJson: _dataFromJson)
  List<T> records;
  int count;
  List<Group?>? groups;

  FetchResult({required this.records, required this.count});

  factory FetchResult.fromJson(Map<String, dynamic> json) =>
      _$FetchResultFromJson(json, (json) => json as T);
}

T _dataFromJson<T>(Map<String, dynamic> json) => json as T;
