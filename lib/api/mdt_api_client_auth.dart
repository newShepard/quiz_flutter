import 'dart:core';
import 'package:http/http.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';

class MdtApiClientAuth {
  MdtApiClient _mdtApiClient;
  MdtApiClientAuth(this._mdtApiClient);

  Future<Response> _request(String url_path,
      {Map<String, dynamic> data,
      MdtRequestSettings settings = const MdtRequestSettings(camel: true)}) {
    return this._mdtApiClient.request(url_path, data: data, settings: settings);
  }

  Future<Response> signIn(String login, String password, {bool rememberMe}) {
    return this._request("security/login", data: {
      "login": login,
      "password": password,
      "rememberMe:": rememberMe
    });
  }

  Future<Response> signOut() {
    return this._request("security/signout");
  }

  Future<Response> changePassword(String oldPassword, String newPassword) {
    return this._request("security/changepassword",
        data: {"oldPassword": oldPassword, "newPassword": newPassword});
  }

  Future<Response> resetPassword(int userId, String newPassword) {
    return this._request("security/resetpassword",
        data: {"userId": userId, "newPassword": newPassword});
  }

  Future<Response> impersonate({num id}) {
    return this._request("security/impersonate", data: {"id": id});
  }

  Future<Response> user() {
    return this._request("mdt/user", settings: MdtRequestSettings(camel: true));
  }
}
