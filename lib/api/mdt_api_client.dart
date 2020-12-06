import 'dart:developer';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:quiz_flutter/api/mdt_api_url_helper.dart';
import 'package:quiz_flutter/api/mdt_auth_module.dart';
import 'package:quiz_flutter/api/mdt_password_module.dart';
import 'dart:convert';
import 'package:quiz_flutter/models/mdt_api/error_data.dart';
import 'package:quiz_flutter/models/mdt_api/query.dart';

typedef void OnRequestError(dynamic err, String url, dynamic data);
final Map<String, String> requestHeaders = {"Content-Type": "application/json"};

class MDTApiServiceOptions {
  MDTApiServiceOptions(this.onRequestError);
  OnRequestError onRequestError;
}

class MdtRequestSettings {
  bool camel;
  MdtRequestSettings({this.camel = true});
}

class MdtRequestOptions {
  final CancelToken cancelToken;
  MdtRequestOptions({required this.cancelToken});
}

class MdtApiClient {
  late String apiUrl;
  late String appUrl;
  late MdtAuthModule auth;
  late MdtPasswordModule password;
  late Dio _dio;

  MdtApiClient(String apiUrl, String appUrl,
      {MDTApiServiceOptions? serviceOptions}) {
    this.apiUrl = apiUrl.replaceAll(new RegExp("\/\$"), "");
    this.appUrl = appUrl;
    this.auth = new MdtAuthModule(this);
    this.password = new MdtPasswordModule(this);
    this._dio = new Dio();
    final cookieJar = new CookieJar();
    this._dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<Response> request(String url,
      {dynamic data,
      MdtRequestSettings? settings,
      MdtRequestOptions? options}) async {
    dynamic body = null;

    if (settings != null && settings.camel) url += "?camel=true";
    if (data != null) body = jsonEncode(data);

    return this
        ._dio
        .post("${this.apiUrl}/$url",
            options: Options(headers: requestHeaders),
            data: body,
            cancelToken: options?.cancelToken ?? null)
        .then(MdtApiClient.handleMdtApiError)
        .catchError((err) {
      err.toString();
      print(err);
    });
  }

  Future<Response> fetch(
      {required Query query,
      String? table,
      MdtRequestSettings? settings,
      MdtRequestOptions? options}) {
    var t = table ?? query.table;
    var url = 'fetch' + (t != null ? '/' + t : '');
    var data = ApiUrlHelper.query2Str(query);

    return this
        .request(url, data: data, settings: settings, options: options)
        .then((value) {
      //print('Val: $value');
      return value;
    }).then((value) => value);
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
  late String name;
  String? message;
  String? code;
  dynamic? args;

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
