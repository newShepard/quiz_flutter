import 'dart:convert';

import 'package:quiz_flutter/models/mdt_api/filter.dart';
import 'package:quiz_flutter/models/mdt_api/query.dart';

const Map<String, String> negationFilterAliases = {
  'notStartsWith': 'startsWith',
  'notContains': 'contains',
  'notEndsWith': 'endsWith'
};

class ApiUrlHelper {
  static dynamic query2Str(Query query) {
    var request = <String, dynamic>{};

    if (query.select?.length != null) {
      var queryLength = query.select?.length;
      if (queryLength != null && queryLength > 0) {
        request['select'] = query.select?.join(',');
      }
    }

    if (query.filter != null) {
      var filter = ApiUrlHelper.filterToString(query.filter, query.table);
      if (filter != null) request['filter'] = filter;
    }

    if (query.sorting != null) {
      var sorting = ApiUrlHelper.sortToString(query.sorting);
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

  static String filterToString(Filter filter, String table) {
    if (filter == null) return null;

    if (filter.groups?.isNotEmpty ?? false) {
      var result = filter.groups
          ?.map((e) => ApiUrlHelper.filterToString(e, table))
          ?.where((element) => element?.isNotEmpty == true)
          ?.join(' ${filter.op} ');

      return result != null
          ? '${filter.not == true ? 'not' : ''}($result)'
          : '';
    } else if (filter.p1 != null && filter.p2 != null) {
      var op = ApiUrlHelper.prepareOp(filter.op);
      var not = filter.not;

      if (filter.op == 'null' || filter.op == 'notNull') {
        op = filter.op == 'null' ? 'eq' : 'ne';
        filter.p2 = null;
      } else if (negationFilterAliases[filter.op] != null) {
        op = negationFilterAliases[filter.op];
        not = true;
      }
      var arg1 =
          ApiUrlHelper.argToString(arg: filter.p1, isFirst: true, op: op);
      var arg2 =
          ApiUrlHelper.argToString(arg: filter.p2, isFirst: false, op: op);

      arg1 = '[${arg1 ?? ''}]';

      if (filter.p2 is DateTime) {
        arg2 = '"${(filter.p2 as DateTime).toIso8601String()}"';
      }

      var wrap = [
            'startsWith',
            'endsWith',
            'contains',
            'in',
            'fulltext',
            'equalTemplate'
          ].indexOf(op ?? '') >=
          0;

      var r = '$arg1 ${op ?? ''}${wrap ? '(${arg2 ?? ''})' : ' ${arg2 ?? ''}'}';

      if (not ?? false) r = 'not(" + $r + ")';

      return r;
    } else {
      return null;
    }
  }

  static String sortToString(List<QuerySorting> sorting) {
    return '';
  }

  static String argToString({dynamic arg, bool isFirst, String op}) {
    return (isFirst ?? false)
        ? arg
        : ApiUrlHelper._valueToString(arg: arg, op: op);
  }

  static String _valueToString({dynamic arg, String op}) {
    // if (arg != null && arg['table'] != null) {
    //   var tres = arg['table'] + ':' + arg['field'];
    //   if (arg['filter'] != null && arg['args'] != null) {
    //     tres += ', ' +
    //         (arg['filter']
    //             ? ApiUrlHelper.filterToString(arg['filter'], arg['table'])
    //                 as String
    //             : 'null');
    //   }
    //   if (arg['args'] != null) {
    //     tres += ', ' +
    //         '(' +
    //         (arg['args']
    //             ? ApiUrlHelper.argToString(arg: arg['args']) as String
    //             : '') +
    //         ')';
    //   }
    //   return tres;
    // }

    var res = (arg is String) && (arg).split('').first == '#' && op == 'in'
        ? arg
        : jsonEncode(arg);

    return res == null ? 'null' : res;
  }

  static String prepareOp(String op) {
    var tbl = {'queryIn': 'in'};

    return tbl[op] ?? op;
  }
}
