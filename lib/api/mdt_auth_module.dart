import 'dart:core';
import 'package:http/http.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:meta/meta.dart';

class MdtAuthModule {
  final MdtApiClient _mdtApiClient;
  MdtAuthModule(this._mdtApiClient);

  Future<Response> _request(String url_path,
      {Map<String, dynamic> data,
      MdtRequestSettings settings = const MdtRequestSettings(camel: true)}) {
    return this._mdtApiClient.request(url_path, data: data, settings: settings);
  }

  Future<Response> signIn(
      {@required String login, @required String password, bool rememberMe}) {
    return this._request("security/signin", data: {
      "login": login,
      "password": password,
      "rememberMe:": rememberMe
    });
  }

  Future<Response> signOut() {
    return this._request("security/signout");
  }

  Future<Response> impersonate({num id}) {
    return this._request("security/impersonate", data: {"id": id});
  }

  Future<Response> user() {
    return this._request("mdt/user");
  }
}
