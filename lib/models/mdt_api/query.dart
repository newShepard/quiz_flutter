import 'package:json_annotation/json_annotation.dart';
import 'filter.dart';

part 'query.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
class QuerySorting {
  String path;
  bool? asc;

  QuerySorting(this.path, {this.asc});

  Map<String, dynamic> toJson() => _$QuerySortingToJson(this);
}

@JsonSerializable(createToJson: true, createFactory: false)
class Query {
  String? table;
  List<String?>? select;
  List<QuerySorting?>? sorting;
  Filter? filter;
  bool? count;
  int? top;
  int? skip;
  bool? distinct;
  String? params;

  Query(
      {this.table,
      this.select,
      this.sorting,
      this.filter,
      this.count,
      this.top,
      this.skip,
      this.distinct,
      this.params});

  Map<String, dynamic> toJson() => _$QueryToJson(this);
}