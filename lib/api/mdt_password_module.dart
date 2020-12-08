import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:meta/meta.dart';
import 'package:quiz_flutter/models/mdt_api/password.dart';
import 'package:quiz_flutter/utils/utils.dart';

final String passwordUrl = '/password/:key';

class MdtPasswordModule {
  final MdtApiClient _mdtApiClient;

  MdtPasswordModule(this._mdtApiClient);

  String _getPasswordUrl() {
    return this._mdtApiClient.appUrl + '/#!' + passwordUrl;
  }

  Future<Response> _request(String url_path,
      {Map<String, dynamic>? data,
      MdtRequestSettings? settings = const MdtRequestSettings(camel: true),
      MdtRequestOptions? options}) {
    return this
        ._mdtApiClient
        .request(url_path, data: data, settings: settings, options: options);
  }

  Future<CheckRegistrationResponse> checkRegistration() {
    return this._request('password/checkregistration').then((value) =>
        CheckRegistrationResponse.fromJson(jsonDecode(value.toString())));
  }

  Future<Response> register(
      {required String code, String? title, required String email}) {
    return this._request('password/register', data: {
      'user': {'code': code, 'title': title, 'email': email},
      'url': this._getPasswordUrl()
    });
  }

  Future<Response> sendForgotPassword({required String login}) {
    return this._request('password/sendforgotpassword',
        data: {'login': login, 'url': this._getPasswordUrl()});
  }

  Future<Response> setPassword(
      {required String password,
      required String confirmPassword,
      required String key}) {
    return this._request('password/setpassword',
        data: {'password': password, 'password2': confirmPassword, 'key': key});
  }

  Future<Response> changePassword(
      {required String oldPassword,
      required String newPassword,
      required bool reset}) {
    var method = reset == true ? 'resetPassword' : 'changePassword';
    var urlParams = Utils.getUrlParams(
        {'oldPassword': oldPassword, 'newPassword': newPassword});
    return this._request('security/${method}?${urlParams}');
  }
}
