import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/mdt_api/auth.dart';
import 'package:quiz_flutter/models/mdt_api/password.dart';
import 'package:quiz_flutter/models/mdt_api/user.dart';
import 'package:quiz_flutter/utils/utils.dart';
import 'package:meta/meta.dart';

final String passwordUrl = '/password/:key';

class MdtPasswordClient {
  MdtApiClient _mdtApiClient;

  MdtPasswordClient() {
    this._mdtApiClient = sl<MdtApiClient>();
  }

  String _getPasswordUrl() {
    return this._mdtApiClient.appUrl + '/#!' + passwordUrl;
  }

  Future<Response> _request(String url_path,
      {Map<String, dynamic> data,
      MdtRequestSettings settings = const MdtRequestSettings(camel: true),
      MdtRequestOptions options}) {
    return this
        ._mdtApiClient
        .request(url_path, data: data, settings: settings, options: options);
  }

  Future<AuthData> checkRegistration() {
    return this
        ._request('password/checkregistration')
        .then((value) => AuthData.fromJson(jsonDecode(value.toString())));
  }

  Future<Response> register({@required UserRegistrationData data}) {
    return this._request('password/register',
        data: {'user': data.toJson(), 'url': this._getPasswordUrl()});
  }

  Future<Response> sendForgotPassword({@required String login}) {
    return this._request('password/sendforgotpassword',
        data: {'login': login, 'url': this._getPasswordUrl()});
  }

  Future<Response> setPassword({@required SetPasswordData data}) {
    return this._request('password/setpassword', data: data.toJson());
  }

  Future<Response> changePassword(
      {@required ChangePasswordData data, @required bool reset}) {
    var method = reset ? 'resetPassword' : 'changePassword';
    var urlParams = Utils.getUrlParams(data.toJson());
    return this._request('security/${method}${urlParams}');
  }
}
