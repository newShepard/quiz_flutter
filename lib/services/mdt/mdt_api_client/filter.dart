class Filter {
  static Map<String, dynamic> and(List<Map<String, dynamic>> groups) {
    return {"op": "and", "groups": groups};
  }

  static Map<String, dynamic> or(List<Map<String, dynamic>> groups) {
    return {"op": "or", "groups": groups};
  }

  static Map<String, dynamic> eq(p1, p2) {
    return {"op": "eq", "p1": p1, "p2": p2};
  }

  static Map<String, dynamic> ne(p1, p2) {
    return {"op": "ne", "p1": p1, "p2": p2};
  }

  static Map<String, dynamic> gt(p1, p2) {
    return {"op": "gt", "p1": p1, "p2": p2};
  }

  static Map<String, dynamic> ge(p1, p2) {
    return {"op": "ge", "p1": p1, "p2": p2};
  }

  static Map<String, dynamic> lt(p1, p2) {
    return {"op": "lt", "p1": p1, "p2": p2};
  }

  static Map<String, dynamic> le(p1, p2) {
    return {"op": "le", "p1": p1, "p2": p2};
  }

  static Map<String, dynamic> inside(p1, p2) {
    return {"op": "in", "p1": p1, "p2": p2};
  }
}
