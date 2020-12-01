import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'dart:convert' as convert;
import 'package:quiz_flutter/models/mdt_api_error_data.dart';

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
  Dio _dio;

  MdtApiClient(String apiUrl, String appUrl, {MDTApiServiceOptions options}) {
    this.apiUrl = apiUrl.replaceAll(new RegExp("\/\$"), "");
    this.appUrl = appUrl;
    this._dio = new Dio();
    var cookieJar = new CookieJar();
    this._dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<Response<dynamic>> request(String url,
      {dynamic data, MdtRequestSettings settings}) async {
    CancelToken token = CancelToken();
    dynamic body = null;

    if (settings != null && settings.camel) url += "?camel=true";
    if (data != null) body = convert.jsonEncode(data);

    return this
        ._dio
        .post("${this.apiUrl}/$url",
            options: Options(headers: requestHeaders),
            data: body,
            cancelToken: token)
        .then(MdtApiClient.handleMdtApiError)
        .catchError((err) {
      token.cancel("Cancel request");
      print(err);
    });
  }

  static Response handleMdtApiError(Response response) {
    if (response.statusCode > 400) {
      var json = response.data;
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
