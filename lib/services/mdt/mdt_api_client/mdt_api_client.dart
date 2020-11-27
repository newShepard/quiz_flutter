import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:quiz_flutter/models/mdt_api_error_data.dart';

typedef void OnRequestError(dynamic err, String url, dynamic data);
const Map<String, String> requestHeaders = {"Content-Type": "application/json"};

class MDTApiServiceOptions {
  MDTApiServiceOptions(this.onRequestError);
  OnRequestError onRequestError;
}

class MdtRequestSettigns {
  bool camel;
  MdtRequestSettigns({this.camel = false});
}

class MdtApiClient {
  String apiUrl;
  String appUrl;

  MdtApiClient(String apiUrl, String appUrl, {MDTApiServiceOptions options}) {
    this.apiUrl = apiUrl.replaceAll(new RegExp("\/\$"), "");
    this.appUrl = appUrl;
  }

  Future<http.Response> request(String url,
      {dynamic data, MdtRequestSettigns settings}) async {
    dynamic body = null;

    if (settings != null && settings.camel) url += "?camel=true";
    if (data != null) body = convert.json.encode(data);

    return http
        .post("${this.apiUrl}/$url", headers: requestHeaders, body: body)
        .then(MdtApiClient.handleMdtApiError)
        .catchError((err) {
      print(err);
    });
  }

  static http.Response handleMdtApiError(http.Response response) {
    if (response.statusCode > 400) {
      var json = convert.json.decode(response.body);
      if (MdtApiClient.isApiError(json))
        throw new MdtApiError(MdtApiErrorData.fromJson(json));
    }
    return response;
  }

  static bool isApiError(dynamic data) {
    return data["Message"] != null;
  }
}

class MdtApiError extends Error {
  String name;
  String message;
  String code;
  dynamic args;

  MdtApiError(MdtApiErrorData data) {
    this.name = "MDT API Error";
    this.message = data.message;
    this.code = data.code;
    this.args = data.args;
  }

  @override
  String toString() {
    return "${this.name}: ${this.message}";
  }
}
