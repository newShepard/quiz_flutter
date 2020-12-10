import 'package:json_annotation/json_annotation.dart';
import 'filter.dart';

class QuerySorting {
  String path;
  bool? asc;

  QuerySorting(this.path, {this.asc});
}

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
}
