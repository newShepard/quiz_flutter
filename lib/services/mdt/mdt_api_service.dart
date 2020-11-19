import 'package:http/http.dart' as http;
import 'dart:convert';

typedef void OnRequestError(Object err, String url, Object data);
const Map<String, String> requestHeaders = {"Content-Type": "application/json"};

class MDTApiServiceOptions {
  MDTApiServiceOptions(this.onRequestError, {this.appUrl});
  OnRequestError onRequestError;
  String appUrl;
}

class MdtRequestSettigns {
  bool camel;
  MdtRequestSettigns({this.camel = false});
}

class MdtApiService {
  String apiUrl;
  String appUrl;
  String apiVersion;
  final JsonEncoder jsonEncoder = JsonEncoder();

  MdtApiService(String apiUrl, String appUrl, String apiVersion,
      {MDTApiServiceOptions options}) {
    this.apiUrl = apiUrl.replaceAll(new RegExp("\/\$"), "");
    this.appUrl = options?.appUrl ?? "";
  }

  Future<http.Response> request(String url, MdtRequestSettigns settings,
      {Object data}) async {
    dynamic body;

    if (settings?.camel) url += "?camel=true";
    if (data != null) body = this.jsonEncoder.convert(data);

    return http
        .post(url, headers: requestHeaders, body: body)
        .then(MdtApiService.handleMdtApiError);
  }

  static Future<http.Response> handleMdtApiError(http.Response response) async {
    if (response.statusCode > 400) {}
  }
}

class MdtApiError extends Error {
  final String name = "MDT API Error";
  final String message;
  final String code;
  final Object args;

  MdtApiError({this.message, this.code, this.args});

  @override
  String toString() {
    return "${this.name}: ${this.message}";
  }
}

class TargetSite {
  String name;
  String assemblyName;
  String className;
  String genericArgemens;
  int numberType;
  String signature;
  String signature2;
}

class DebugData {
  Object data;
  int hResult;
  String message;
  String source;
  String stackTrace;
}

class MdtApiErrorData {}
