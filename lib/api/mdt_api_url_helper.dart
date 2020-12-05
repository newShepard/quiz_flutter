import 'package:quiz_flutter/models/mdt_api/query.dart';

class ApiUrlHelper {
  static dynamic query2Str(Query query) {
    Map<String, dynamic> request = {};

    if (query.select?.length != null) {
      var queryLength = query.select?.length;
      if (queryLength != null && queryLength > 0) {
        request['select'] = query.select?.join(',');
      }
    }

    if (query.filter != null) {
      var filter = ApiUrlHelper._filterToString(query.filter, query.table);
      if (filter != null) request['filter'] = filter;
    }

    if (query.sorting != null) {
      var sorting = ApiUrlHelper._sortToString(query.sorting);
      if (sorting != null) request['sorting'] = sorting;
    }

    if (query.skip != null) request['skip'] = query.skip;
    if (query.top != null) request['top'] = query.top;
    if (query.count != null) request['withCount'] = query.count;
    if (query.distinct != null) request['distinct'] = query.distinct;
    if (query.table != null) request['table'] = query.table;
    if (query.params != null) request['params'] = query.params;

    return request;
  }

  static String? _filterToString(dynamic? filter, String? table) {
    return '';
  }

  static String? _sortToString(List<QuerySorting?>? sorting) {
    return '';
  }

  static String? _argToString() {
    return '';
  }

  static String? _valueToString() {
    return '';
  }

  static dynamic? _prepareOp() {
    return '';
  }
}
