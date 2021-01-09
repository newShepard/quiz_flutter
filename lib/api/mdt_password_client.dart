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
    _mdtApiClient = sl<MdtApiClient>();
  }

  String _getPasswordUrl() {
    return '${_mdtApiClient.appUrl}/#!$passwordUrl';
  }

  Future<Response> _request(
    String urlPath, {
    Map<String, dynamic> data,
    MdtRequestSettings settings = const MdtRequestSettings(camel: true),
    MdtRequestOptions options,
  }) {
    return _mdtApiClient.request(
      urlPath,
      data: data,
      settings: settings,
      options: options,
    );
  }

  Future<AuthData> checkRegistration() {
    return _request('password/checkregistration').then(
      (value) => AuthData.fromJson(
        jsonDecode(value.toString()),
      ),
    );
  }

  Future<Response> register({@required UserRegistrationData data}) {
    return _request(
      'password/register',
      data: {
        'user': data.toJson(),
        'url': _getPasswordUrl(),
      },
    );
  }

  Future<Response> sendForgotPassword({@required String login}) {
    return _request(
      'password/sendforgotpassword',
      data: {
        'login': login,
        'url': _getPasswordUrl(),
      },
    );
  }

  Future<Response> setPassword({@required SetPasswordData data}) {
    return _request(
      'password/setpassword',
      data: data.toJson(),
    );
  }

  Future<Response> changePassword({
    @required ChangePasswordData data,
    @required bool reset,
  }) {
    var method = reset ? 'resetPassword' : 'changePassword';
    var urlParams = Utils.getUrlParams(data.toJson());
    return _request('security/$method$urlParams');
  }
}
