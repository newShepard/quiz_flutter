import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/models/mdt_api/user.dart';
import 'package:quiz_flutter/models/quiz/user.dart';

typedef Future<void>? AuthServuceInitCb(UserData user);

class AuthServiceOptions {
  AuthServuceInitCb? init;
  AuthServiceOptions({this.init});
}

class AuthService {
  MdtApiClient mdtApiClient;
  AuthServiceOptions? options;
  UserData? user;
  AuthService({required this.mdtApiClient, this.options}) {
    this.user = null;
  }

  Future<void> init() async {
    var mdtUser = await this.mdtApiClient.auth.user();
    UserData? userData = null;
    if (this.isUserLoggedIn(mdtUser)) {
      userData = await getUserData(mdtUser.id);
    }
  }

  bool isUserLoggedIn(MdtApiUser user) {
    return user.isAnonymous == false;
  }

  Future<UserData> getUserData(int? userId) {
    return Future.value(null);
  }
}
