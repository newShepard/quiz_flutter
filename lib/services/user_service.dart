import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/quiz/user.dart';
import 'package:meta/meta.dart';
import 'package:quiz_flutter/services/auth_service.dart';

class UserService {
  QuizUser _user;
  MdtApiClient _mdtApiClient;
  MdtAuthClient _mdtAuthClient;
  AuthService _authService;
  bool _privacyPolicyAccepted;

  UserService() {
    this._privacyPolicyAccepted = true;
    this._mdtApiClient = sl<MdtApiClient>();
    this._mdtAuthClient = sl<MdtAuthClient>();
    this._authService = sl<AuthService>();
  }

  QuizUser get user => this._user;

  bool get privacyPolicyIsAccepted => this._privacyPolicyAccepted;

  Future<void> init() async {
    this._user = await this._authService.initUser();
    // this._log();
  }

  Future<void> checkPrivacyPolicy() async {}

  Future<void> savePrivacyPolicyAcceptToServer() async {}

  Future<void> prepareLogData() async {}

  Future<void> changeLanguage({@required int langId}) async {}

  Future<void> updateUserSettings(QuizUser user) async {}

  Future<void> _log() async {}

  Future<void> _savePrivacyPolicyAcceptLocaly() async {}
}
