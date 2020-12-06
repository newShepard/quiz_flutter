import 'package:quiz_flutter/models/mdt_api/filter.dart';

class FilterHelper {
  static Filter and(List<Filter> groups) {
    return Filter(op: "and", groups: groups);
  }

  static Filter or(List<Filter> groups) {
    return Filter(op: "or", groups: groups);
  }

  static Filter eq(p1, p2) {
    return Filter(op: "eq", p1: p1, p2: p2);
  }

  static Filter ne(p1, p2) {
    return Filter(op: "ne", p1: p1, p2: p2);
  }

  static Filter gt(p1, p2) {
    return Filter(op: "gt", p1: p1, p2: p2);
  }

  static Filter ge(p1, p2) {
    return Filter(op: "ge", p1: p1, p2: p2);
  }

  static Filter lt(p1, p2) {
    return Filter(op: "lt", p1: p1, p2: p2);
  }

  static Filter le(p1, p2) {
    return Filter(op: "le", p1: p1, p2: p2);
  }

  static Filter inside(p1, p2) {
    return Filter(op: "in", p1: p1, p2: p2);
  }
}
