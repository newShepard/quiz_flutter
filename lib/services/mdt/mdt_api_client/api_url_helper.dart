import 'package:quiz_flutter/models/mdt_api_request.dart';

class ApiUrlHelper {
  static dynamic query2Str(Query query) {
    Map<String, dynamic> request = {};

    if (query.select != null && query.select.length > 0) {
      request["select"] = query.select.join(",");
    }

    if (query.filter != null) {}
  }
}
