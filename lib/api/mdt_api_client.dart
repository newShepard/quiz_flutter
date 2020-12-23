import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:meta/meta.dart';
import 'package:quiz_flutter/api/mdt_api_url_helper.dart';
import 'package:quiz_flutter/errors/errors.dart';
import 'package:quiz_flutter/models/mdt_api/error_data.dart';
import 'package:quiz_flutter/models/mdt_api/fetch.dart';
import 'package:quiz_flutter/models/mdt_api/query.dart';
import 'package:quiz_flutter/utils/constants.dart';

typedef void OnRequestError(dynamic err, String url, dynamic data);
final Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

class MDTApiServiceOptions {
  MDTApiServiceOptions(this.onRequestError);
  OnRequestError onRequestError;
}

class MdtRequestSettings {
  const MdtRequestSettings({this.camel = true});
  final bool camel;
}

class MdtRequestOptions {
  MdtRequestOptions({@required this.cancelToken});
  final CancelToken cancelToken;
}

class MdtApiClient {
  String apiUrl;
  String appUrl;
  Dio _dio;

  MdtApiClient() {
    apiUrl = Consts.api_url.replaceAll(RegExp('\/\$'), '');
    appUrl = Consts.app_url;
    _dio = Dio();
    final cookieJar = CookieJar();
    _dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<Response> request(String url,
      {dynamic data,
      MdtRequestSettings settings,
      MdtRequestOptions options}) async {
    dynamic body;

    if (settings != null && settings.camel) url += '?camel=true';
    if (data != null) body = jsonEncode(data);

    print('$apiUrl/$url');

    return _dio
        .post(
          '$apiUrl/$url',
          options: Options(headers: requestHeaders),
          data: body,
          cancelToken: options?.cancelToken ?? null,
        )
        .then(handleMdtApiError)
        .catchError((dynamic err) => onRequestError(err, url, data));
  }

  Future<PreparedFetchResult<T>> fetch<T>(
      {@required Query query,
      String table,
      MdtRequestSettings settings = const MdtRequestSettings(camel: true),
      MdtRequestOptions options}) {
    var t = table ?? query.table;
    var url = 'fetch${t != null ? '/$t' : ''}';
    var data = ApiUrlHelper.query2Str(query);

    return request(url, data: data, settings: settings, options: options)
        .then((value) {
      var t = value.data[0];
      return preparedFetchResult<T>(t);
    });
  }

  PreparedFetchResult<T> preparedFetchResult<T>(dynamic data) {
    var dataMap = Map.from(data);
    var json = <String, dynamic>{};

    for (var key in dataMap.keys) {
      json[key.toString().toLowerCase()] = dataMap[key];
    }

    var m = {'count': json['count'], 'records': json['rows']};

    return PreparedFetchResult<T>.fromJson(m);
  }

  Response handleMdtApiError(Response response) {
    if (response.statusCode > 400) {
      var json = response.data;
      if (isApiError(json)) {
        throw MdtApiError(MdtApiErrorData.fromJson(json));
      }
      return response;
    }
    return response;
  }

  bool isApiError(dynamic data) {
    var condition = false;
    try {
      condition = data['Message'] != null;
    } catch (err) {
      return false;
    }
    return condition;
  }

  void onRequestError(dynamic error, String url, dynamic data) {
    print('Error: $url');
    var errData = (error is DioError) ? error.response.data : error;

    if (isApiError(errData) == true) {
      var err = MdtApiError(MdtApiErrorData.fromJson(errData));
      switch (err.code) {
        case 'SecurityTableAccess':
          {
            var args = err?.args;
            if (args != null && args['User'] == 'Anonymous') print('ANONYMOUS');
            break;
          }
        default:
          throw err;
      }
    }
    throw errData;
  }
}
