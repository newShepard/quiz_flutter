import 'dart:core';
import 'package:dio/dio.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/mdt_api/user.dart';
import 'package:meta/meta.dart';

class MdtAuthClient {
  MdtApiClient _mdtApiClient;

  MdtAuthClient() {
    _mdtApiClient = sl<MdtApiClient>();
  }

  Future<Response> _request(String urlPath,
      {Map<String, dynamic> data,
      MdtRequestSettings settings = const MdtRequestSettings(camel: true),
      MdtRequestOptions options}) {
    return _mdtApiClient.request(urlPath,
        data: data, settings: settings, options: options);
  }

  Future<Response> signIn(
      {@required String login, @required String password, bool rememberMe}) {
    return _request('security/signin', data: {
      'login': login,
      'password': password,
      'rememberMe:': rememberMe
    });
  }

  Future<Response> signOut() {
    return _request('security/signout');
  }

  Future<Response> impersonate({@required num id}) {
    return _request('security/impersonate', data: {'id': id});
  }

  Future<MdtApiUser> getMdtUser() {
    return _request('mdt/user')
        .then((value) => MdtApiUser.fromJson(value.data));
  }
}
