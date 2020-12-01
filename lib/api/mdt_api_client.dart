import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:quiz_flutter/models/mdt_api_error_data.dart';
import 'package:requests/requests.dart';

typedef void OnRequestError(dynamic err, String url, dynamic data);
final Map<String, String> requestHeaders = {"Content-Type": "application/json"};

class MDTApiServiceOptions {
  MDTApiServiceOptions(this.onRequestError);
  OnRequestError onRequestError;
}

class MdtRequestSettings {
  final bool camel;
  const MdtRequestSettings({this.camel = true});
}

class MdtApiClient {
  String apiUrl;
  String appUrl;

  MdtApiClient(String apiUrl, String appUrl, {MDTApiServiceOptions options}) {
    this.apiUrl = apiUrl.replaceAll(new RegExp("\/\$"), "");
    this.appUrl = appUrl;
  }

  Future<Response> request(String url,
      {dynamic data, MdtRequestSettings settings}) async {
    dynamic body = null;

    if (settings != null && settings.camel) url += "?camel=true";
    if (data != null) body = convert.json.encode(data);

    //   return http
    //       .post("${this.apiUrl}/$url", headers: requestHeaders, body: body)
    //       .then(MdtApiClient.handleMdtApiError)
    //       .catchError((err) {
    //     print(err);
    //   });
    // }

    return Requests.post('${this.apiUrl}/$url',
            headers: requestHeaders,
            body: body,
            bodyEncoding: RequestBodyEncoding.PlainText)
        .then(MdtApiClient.handleMdtApiError)
        .catchError((err) {
      print(err);
    });
  }

  static Response handleMdtApiError(Response response) {
    if (response.statusCode > 400) {
      var content = response.content();
      var json = convert.json.decode(content);
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
