import 'dart:convert' as convert;
import 'package:quiz_flutter/services/mdt/mdt_api_client/filter.dart';
import 'package:quiz_flutter/utils/constants.dart';

void main() {
  // List<Map<String, dynamic>> arr = [1,2,3];
  var f = Filter.and(
      [Filter.eq("ID_Outlet", 1), Filter.eq("Items/ID_Questionnaire", 2)]);
  print(convert.json.encode(f));
}

class Foo {
  Object test(num n) {
    return n > 5 ? "Qwerty" : {"foo": "bar"};
  }
}
