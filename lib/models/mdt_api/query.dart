import 'package:json_annotation/json_annotation.dart';

//part 'query.g.dart';

//@JsonSerializable(createToJson: true, createFactory: false)
class QuerySorting {
  String path;
  bool? asc;

  QuerySorting(this.path, {this.asc});
}

//@JsonSerializable(createToJson: true, createFactory: false)
class Query {
  List<String?>? select;
  List<QuerySorting?>? sorting;
  dynamic? filter;
  bool? count;
  int? top;
  int? skip;
  bool? distinct;
  Map<String, dynamic>? params;

  Query(
      {this.select,
      this.sorting,
      this.filter,
      this.count,
      this.top,
      this.skip,
      this.distinct,
      this.params});
}
