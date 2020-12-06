class Filter {
  String op;
  String? p1;
  dynamic? p2;
  bool? not;
  List<Filter>? groups;

  Filter({required this.op, this.p1, this.p2, this.not, this.groups});
}
